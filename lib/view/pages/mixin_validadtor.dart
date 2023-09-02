mixin validatorMixin {
  String? isNotEmpyt(String? value, [String? massage]) {
    if (value!.isEmpty) return massage ?? "Campo inválido";
    return null;
  }

  String? hasOnzeCaracteres(String? value, [String? message]) {
    if (value!.length < 11) return message ?? "Tem menos de 11 caractéres";
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) {
        return validation;
      }
    }
    return null;
  }
}
