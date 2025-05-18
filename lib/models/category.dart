class Category {
  int? id;
  String? name, slug, image;

  // constructeur avec paramètres promus obligatoires
  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });
}
