import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/user_providers.dart';
import '../providers/users_state.dart';
import '../widgets/user_card.dart';

class UsersListScreen extends ConsumerStatefulWidget {
  const UsersListScreen({super.key});

  @override
  ConsumerState<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends ConsumerState<UsersListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    if (currentScroll >= maxScroll - 200) {
      ref.read(usersProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(usersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(usersProvider.notifier).refresh(),
          ),
        ],
      ),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(UsersState state) {
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (message) => _ErrorView(
        message: message,
        onRetry: () => ref.read(usersProvider.notifier).refresh(),
      ),
      loaded: (users, currentPage, hasMore, isLoadingMore) {
        return RefreshIndicator(
          onRefresh: () => ref.read(usersProvider.notifier).refresh(),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: users.length + (isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == users.length) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final user = users[index];
              return UserCard(
                user: user,
                onTap: () => context.push('/users/${user.id}', extra: user),
              );
            },
          ),
        );
      },
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
