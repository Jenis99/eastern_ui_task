// data["categories"].map
class CategoryModel {
  String? categoryId;
  String? categoryName;
  String? parentId;
  List<Child>? child;

  CategoryModel({this.categoryId, this.categoryName, this.parentId, this.child});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    parentId = json['parent_id'];
    if (json['child'] != null) {
      child = <Child>[];
      json['child'].forEach((v) {
        child!.add(Child.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['parent_id'] = parentId;
    if (child != null) {
      data['child'] = child!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Child {
  String? categoryId;
  String? categoryName;
  String? parentId;

  Child({this.categoryId, this.categoryName, this.parentId});

  Child.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['parent_id'] = parentId;
    return data;
  }
}

// data["range_of_pattern"].map

class ProductModel {
  String? productId;
  String? image;
  String? name;

  ProductModel({this.productId, this.image, this.name});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['image'] = image;
    data['name'] = name;
    return data;
  }
}

// data["main_sticky_menu"].map
class SliderModel {
  String? title;
  String? image;
  String? sortOrder;
  List<SliderImages>? sliderImages;

  SliderModel({this.title, this.image, this.sortOrder, this.sliderImages});

  SliderModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    if (json['slider_images'] != null) {
      sliderImages = <SliderImages>[];
      json['slider_images'].forEach((v) {
        sliderImages!.add(SliderImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['sort_order'] = sortOrder;
    if (sliderImages != null) {
      data['slider_images'] = sliderImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SliderImages {
  String? title;
  String? image;
  String? sortOrder;
  String? cta;

  SliderImages({this.title, this.image, this.sortOrder, this.cta});

  SliderImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    cta = json['cta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['sort_order'] = sortOrder;
    data['cta'] = cta;
    return data;
  }
}

// data["shop_by_category"].map
class ShopByCategoryModel {
  String? categoryId;
  String? name;
  String? tintColor;
  String? image;
  String? sortOrder;

  ShopByCategoryModel(
      {this.categoryId, this.name, this.tintColor, this.image, this.sortOrder});

  ShopByCategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    tintColor = json['tint_color'];
    image = json['image'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    data['tint_color'] = tintColor;
    data['image'] = image;
    data['sort_order'] = sortOrder;
    return data;
  }
}

