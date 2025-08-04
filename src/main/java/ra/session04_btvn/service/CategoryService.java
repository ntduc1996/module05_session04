package ra.session04_btvn.service;

import ra.session04_btvn.model.entity.Category;

import java.util.List;

public interface CategoryService {
    List<Category> getCategories();
    Category getCategory(int id);
    boolean addCategory(Category category);
    boolean updateCategory(Category category);
    boolean changeCategoryStatus(int id);
    boolean deleteCategory(int id);
}
