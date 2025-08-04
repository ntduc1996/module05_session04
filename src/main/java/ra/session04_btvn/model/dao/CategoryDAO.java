package ra.session04_btvn.model.dao;

import ra.session04_btvn.model.entity.Category;

import java.util.List;

public interface CategoryDAO {
    List<Category> findAll();
    Category findById(int id);
    boolean addNewCategory(Category category);
    boolean updateCategory(Category category);
    boolean changeStatus(int id);
    boolean deleteCategory(int id);
}
