package ra.session04_btvn.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ra.session04_btvn.model.entity.Category;
import ra.session04_btvn.service.CategoryService;
import ra.session04_btvn.service.imp.CategoryServiceImp;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", value = "/CategoryController")
public class CategoryController extends HttpServlet {
    private CategoryService categoryService;

    public CategoryController() {
        categoryService = new CategoryServiceImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("findAll")) {
            getAllStudent(request,response);
        }else if (action.equals("initUpdate")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Category category = categoryService.getCategory(id);
            request.setAttribute("category", category);
            request.getRequestDispatcher("/views/updateCategory.jsp").forward(request, response);
        }else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean result = categoryService.deleteCategory(id);
            if (result) {
                getAllStudent(request,response);
            }else {
                System.out.println("khong xoa");
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            }

        }
    }

    public void getAllStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.getCategories();
        request.setAttribute("categories",categories);
        request.getRequestDispatcher("/views/listCategory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action.equals("Create")) {
            Category category = new Category();
            category.setCategoryName(request.getParameter("categoryName"));
            category.setDescription(request.getParameter("description"));
            category.setCategoryStatus(Boolean.parseBoolean(request.getParameter("categoryStatus")));
            boolean result = categoryService.addCategory(category);
            if (result) {
                getAllStudent(request,response);
            }else  {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            }
        }else if (action.equals("Update")) {
            Category category = new Category();
            category.setId(Integer.parseInt(request.getParameter("categoryId")));
            category.setCategoryName(request.getParameter("categoryName"));
            category.setDescription(request.getParameter("description"));
            category.setCategoryStatus(Boolean.parseBoolean(request.getParameter("categoryStatus")));
            boolean result = categoryService.updateCategory(category);
            if (result) {
                getAllStudent(request,response);
            }else  {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            }
        }

    }
}