import 'package:flutter_riverpod/flutter_riverpod.dart';

// State to track the current step of onboarding
enum OnboardingStep {
  splash,
  problemAcknowledgment,
  realityCheck,
  goalSelection,
  blockingSetup,
  thePledge,
  complete
}

class OnboardingState {
  final OnboardingStep step;
  final String? selectedProblem;
  final List<String> selectedGoals;

  const OnboardingState({
    this.step = OnboardingStep.splash,
    this.selectedProblem,
    this.selectedGoals = const [],
  });

  OnboardingState copyWith({
    OnboardingStep? step,
    String? selectedProblem,
    List<String>? selectedGoals,
  }) {
    return OnboardingState(
      step: step ?? this.step,
      selectedProblem: selectedProblem ?? this.selectedProblem,
      selectedGoals: selectedGoals ?? this.selectedGoals,
    );
  }
}

class OnboardingStateNotifier extends StateNotifier<OnboardingState> {
  OnboardingStateNotifier() : super(const OnboardingState());

  void nextStep() {
    switch (state.step) {
      case OnboardingStep.splash:
        state = state.copyWith(step: OnboardingStep.problemAcknowledgment);
        break;
      case OnboardingStep.problemAcknowledgment:
        state = state.copyWith(step: OnboardingStep.realityCheck);
        break;
      case OnboardingStep.realityCheck:
        state = state.copyWith(step: OnboardingStep.goalSelection);
        break;
      case OnboardingStep.goalSelection:
        state = state.copyWith(step: OnboardingStep.blockingSetup);
        break;
      case OnboardingStep.blockingSetup:
        state = state.copyWith(step: OnboardingStep.thePledge);
        break;
      case OnboardingStep.thePledge:
        state = state.copyWith(step: OnboardingStep.complete);
        break;
      case OnboardingStep.complete:
        break;
    }
  }

  void setProblem(String problem) {
    state = state.copyWith(selectedProblem: problem);
  }

  void toggleGoal(String goal) {
    final currentGoals = List<String>.from(state.selectedGoals);
    if (currentGoals.contains(goal)) {
      currentGoals.remove(goal);
      state = state.copyWith(selectedGoals: currentGoals);
    } else {
      if (currentGoals.length < 3) { // Max 3 goals
        currentGoals.add(goal);
        state = state.copyWith(selectedGoals: currentGoals);
      }
    }
  }
}

final onboardingProvider = StateNotifierProvider<OnboardingStateNotifier, OnboardingState>((ref) {
  return OnboardingStateNotifier();
});
