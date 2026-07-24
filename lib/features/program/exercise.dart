class Exercise {
  const Exercise({
    required this.id,
    required this.name,
    required this.primaryMuscle,
    this.equipment,
  });

  final int id;
  final String name;
  final String primaryMuscle;
  final String? equipment;

  Exercise copyWith({
    int? id,
    String? name,
    String? primaryMuscle,
    String? equipment,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      primaryMuscle: primaryMuscle ?? this.primaryMuscle,
      equipment: equipment ?? this.equipment,
    );
  }
}
