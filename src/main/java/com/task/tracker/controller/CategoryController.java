package com.task.tracker.controller;

import com.task.tracker.DAO.CategoryDAO;
import com.task.tracker.model.Category;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/categories")
public class CategoryController extends HttpServlet {
    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        categoryDAO = new CategoryDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "add":
                RequestDispatcher addDispatcher = req.getRequestDispatcher("addCategory.jsp");
                addDispatcher.forward(req, res);
                break;
            case "edit":
                Long id = Long.parseLong(req.getParameter("id"));
                Category category = categoryDAO.getCategoryById(id);
                req.setAttribute("category", category);
                RequestDispatcher editDispatcher = req.getRequestDispatcher("editCategory.jsp");
                editDispatcher.forward(req, res);
                break;
            case "delete":
                Long toDelete = Long.parseLong(req.getParameter("id"));
                categoryDAO.delete(toDelete);
                res.sendRedirect(req.getContextPath() + "/categories");
                break;
            default: // list
                List<Category> categories = categoryDAO.getAllCategories();
                req.setAttribute("categories", categories);
                RequestDispatcher listDispatcher = req.getRequestDispatcher("listCategories.jsp");
                listDispatcher.forward(req, res);
                break;
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        String name = req.getParameter("name");

        Category category;
        if (idParam == null || idParam.isEmpty()) {
            category = new Category(name);
            categoryDAO.save(category);
        } else {
            category = categoryDAO.getCategoryById(Long.parseLong(idParam));
            if (category != null) {
                category.setName(name);
                categoryDAO.update(category);
            }
        }
        res.sendRedirect(req.getContextPath() + "/categories");
    }
}
