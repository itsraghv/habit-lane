import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mensurge/theme/app_theme.dart';
import 'onboarding_provider.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: _buildStep(currentState, notifier, ref, context),
        ),
      ),
    );
  }

  Widget _buildStep(
    OnboardingState state,
    OnboardingStateNotifier notifier,
    WidgetRef ref,
    BuildContext context,
  ) {
    switch (state.step) {
      case OnboardingStep.splash:
        return _SplashView(
          key: const ValueKey('splash'),
          onComplete: () => notifier.nextStep(),
        );
      case OnboardingStep.problemAcknowledgment:
        return _ProblemAcknowledgmentView(
          key: const ValueKey('problem'),
          notifier: notifier,
        );
      case OnboardingStep.realityCheck:
        return _RealityCheckView(
          key: const ValueKey('reality'),
          notifier: notifier,
        );
      case OnboardingStep.goalSelection:
        return _GoalSelectionView(
          key: const ValueKey('goals'),
          notifier: notifier,
          state: state,
        );
      case OnboardingStep.blockingSetup:
        return _BlockingSetupView(
          key: const ValueKey('blocking'),
          notifier: notifier,
        );
      case OnboardingStep.thePledge:
        return _ThePledgeView(
          key: const ValueKey('pledge'),
          notifier: notifier,
        );
      case OnboardingStep.complete:
        // Normally this would navigate to the Dashboard
        return const Center(child: Text("Welcome to the Dashboard."));
      default:
        return const SizedBox.shrink();
    }
  }
}

// ==========================================
// 1. SPLASH SCREEN
// ==========================================
class _SplashView extends StatefulWidget {
  final VoidCallback onComplete;
  const _SplashView({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      widget.onComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MENSURGE',
              style: AppTheme.darkTheme.textTheme.displayLarge?.copyWith(
                letterSpacing: 8.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. PROBLEM ACKNOWLEDGMENT
// ==========================================
class _ProblemAcknowledgmentView extends StatelessWidget {
  final OnboardingStateNotifier notifier;
  const _ProblemAcknowledgmentView({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Text(
            'Why are you here?',
            style: AppTheme.darkTheme.textTheme.displayLarge,
          ),
          const SizedBox(height: 40),
          _buildOption(context, 'Wasting time'),
          _buildOption(context, 'Brain fog'),
          _buildOption(context, 'Lack of discipline'),
          _buildOption(context, 'Addiction'),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          notifier.setProblem(text);
          notifier.nextStep();
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: AppTheme.darkTheme.textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 3. THE REALITY CHECK
// ==========================================
class _RealityCheckView extends StatelessWidget {
  final OnboardingStateNotifier notifier;
  const _RealityCheckView({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        notifier.nextStep();
      },
      child: Container(
        color: AppTheme.background, // Full tap area
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Text(
            'Cheap dopamine is killing your potential.',
            style: AppTheme.darkTheme.textTheme.displayLarge?.copyWith(
              color: AppTheme.textPrimary,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 4. GOAL SELECTION
// ==========================================
class _GoalSelectionView extends StatelessWidget {
  final OnboardingStateNotifier notifier;
  final OnboardingState state;

  const _GoalSelectionView({Key? key, required this.notifier, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Text(
            'What will you build instead?',
            style: AppTheme.darkTheme.textTheme.displayLarge,
          ),
          const SizedBox(height: 12),
          Text(
            'Select 1-3 binary daily habits to overwrite the old one.',
            style: AppTheme.darkTheme.textTheme.bodyLarge?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView(
              children: [
                _buildGoalToggle('Gym'),
                _buildGoalToggle('Coding'),
                _buildGoalToggle('Reading'),
                _buildGoalToggle('Meditation'),
                _buildGoalToggle('Deep Work'),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: state.selectedGoals.isNotEmpty ? () {
                HapticFeedback.lightImpact();
                notifier.nextStep();
              } : null,
              child: const Text('CONTINUE'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildGoalToggle(String goal) {
    final isSelected = state.selectedGoals.contains(goal);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          notifier.toggleGoal(goal);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryBlue.withOpacity(0.2) : AppTheme.surface,
            border: Border.all(
              color: isSelected ? AppTheme.primaryBlue : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                goal,
                style: AppTheme.darkTheme.textTheme.headlineMedium?.copyWith(
                  color: isSelected ? AppTheme.primaryBlue : AppTheme.textPrimary,
                ),
              ),
              if (isSelected)
                const Icon(Icons.check_circle, color: AppTheme.primaryBlue)
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 5. BLOCKING SETUP
// ==========================================
class _BlockingSetupView extends StatelessWidget {
  final OnboardingStateNotifier notifier;
  const _BlockingSetupView({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Text(
            'Shut the door behind you.',
            style: AppTheme.darkTheme.textTheme.displayLarge,
          ),
          const SizedBox(height: 20),
          Text(
            'Make it harder to fail. Add the Cloudflare Family DNS (1.1.1.3) to block adult content at the network level.',
            style: AppTheme.darkTheme.textTheme.bodyLarge?.copyWith(
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1.1.1.3',
                  style: AppTheme.darkTheme.textTheme.headlineMedium?.copyWith(
                    fontFamily: 'monospace',
                    letterSpacing: 2.0,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, color: AppTheme.primaryBlue),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Clipboard.setData(const ClipboardData(text: '1.1.1.3'));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('DNS Copied!')),
                    );
                  },
                )
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                notifier.nextStep();
              },
              child: const Text('I HAVE CONFIGURED MY DNS'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ==========================================
// 6. THE PLEDGE
// ==========================================
class _ThePledgeView extends StatefulWidget {
  final OnboardingStateNotifier notifier;
  const _ThePledgeView({Key? key, required this.notifier}) : super(key: key);

  @override
  State<_ThePledgeView> createState() => _ThePledgeViewState();
}

class _ThePledgeViewState extends State<_ThePledgeView> {
  final _controller = TextEditingController();
  final String _targetPhrase = "I commit to mastering my energy.";
  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text == _targetPhrase && !_isComplete) {
        setState(() {
          _isComplete = true;
        });
        HapticFeedback.heavyImpact();
      } else if (_controller.text != _targetPhrase && _isComplete) {
        setState(() {
          _isComplete = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'The Pledge',
            style: AppTheme.darkTheme.textTheme.displayLarge,
          ),
          const SizedBox(height: 24),
          Text(
            'Type the following to begin:',
            style: AppTheme.darkTheme.textTheme.bodyLarge?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '"$_targetPhrase"',
            style: AppTheme.darkTheme.textTheme.headlineMedium?.copyWith(
              color: AppTheme.primaryBlue,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: _controller,
            style: AppTheme.darkTheme.textTheme.bodyLarge,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppTheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintText: 'Type here...',
              hintStyle: AppTheme.darkTheme.textTheme.bodyLarge?.copyWith(
                color: AppTheme.textSecondary.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isComplete ? AppTheme.primaryBlue : AppTheme.surface,
                foregroundColor: _isComplete ? AppTheme.textPrimary : AppTheme.textSecondary,
              ),
              onPressed: _isComplete ? () {
                HapticFeedback.heavyImpact();
                widget.notifier.nextStep();
              } : null,
              child: const Text('SIGN PLEDGE'),
            ),
          ),
        ],
      ),
    );
  }
}
