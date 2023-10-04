abstract class FormSubmissionState {
  const FormSubmissionState();
}

class InitialFormState extends FormSubmissionState {
  const InitialFormState();
}

class FormSubmitting extends FormSubmissionState {}

class SubmissionSuccess extends FormSubmissionState {}

class SubmissionFailed extends FormSubmissionState {
  final Exception exception;

  const SubmissionFailed(this.exception);
}
