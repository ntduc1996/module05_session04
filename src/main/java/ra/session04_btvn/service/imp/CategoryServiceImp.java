package ra.session04_btvn.service.imp;

import ra.session04_btvn.model.dao.CategoryDAO;
import ra.session04_btvn.model.dao.imp.CategoryDaoImp;
import ra.session04_btvn.model.entity.Category;
import ra.session04_btvn.service.CategoryService;

import java.util.List;

public class CategoryServiceImp implements CategoryService {
    private CategoryDAO categoryDAO;

    public CategoryServiceImp() {
        categoryDAO = new CategoryDaoImp();
    }

    @Override
    public List<Category> getCategories() {
        return categoryDAO.findAll();
    }

    @Override
    public Category getCategory(int id) {
        return categoryDAO.findById(id);
    }

    @Override
    public boolean addCategory(Category category) {
        return categoryDAO.addNewCategory(category);
    }

    @Override
    public boolean updateCategory(Category category) {
        return categoryDAO.updateCategory(category);
    }

    @Override
    public boolean changeCategoryStatus(int id) {
        return categoryDAO.changeStatus(id);
    }

    @Override
    public boolean deleteCategory(int id) {
        return categoryDAO.deleteCategory(id);
    }
}
