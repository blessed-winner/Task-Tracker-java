package com.task.tracker.controller;

import com.task.tracker.DAO.CategoryDAO;
import com.task.tracker.DAO.TaskDAO;
import com.task.tracker.model.Category;
import com.task.tracker.model.Task;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/tasks")
public class TaskController extends HttpServlet{
    TaskDAO taskDAO;
    CategoryDAO categoryDAO;

    @Override
    public void init(){
        taskDAO = new TaskDAO();
        categoryDAO = new CategoryDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
         String action = req.getParameter("action");
         if(action == null) action = "list";

         switch(action){
             case "add":
                  List<Category> categories = categoryDAO.getAllCategories();
                  req.setAttribute("categories", categories);
                  RequestDispatcher rd = req.getRequestDispatcher("add.jsp");
                  rd.forward(req,res);
                  break;

             case "edit":
                 Long id = Long.parseLong(req.getParameter("id"));
                 Task task = taskDAO.getTaskById(id);
                 List<Category> editCategories = categoryDAO.getAllCategories();
                 req.setAttribute("task",task);
                 req.setAttribute("categories", editCategories);
                 RequestDispatcher editDispatcher = req.getRequestDispatcher("edit.jsp");
                 editDispatcher.forward(req,res);
                 break;

             case "delete":
                 Long toDelete = Long.parseLong(req.getParameter("id"));
                 taskDAO.delete(toDelete);
                 res.sendRedirect(req.getContextPath() + "/tasks");
                 break;

             case "toggleCompletion":
                 Long taskIdToToggle = Long.parseLong(req.getParameter("id"));
                 taskDAO.toggleTaskCompletion(taskIdToToggle);
                 res.sendRedirect(req.getContextPath() + "/tasks");
                 break;

             case "listByCategory":
                 Long categoryId = Long.parseLong(req.getParameter("categoryId"));
                 List<Task> tasksByCategory = taskDAO.getTasksByCategory(categoryId);
                 req.setAttribute("tasks", tasksByCategory);
                 RequestDispatcher categoryListDispatcher = req.getRequestDispatcher("index.jsp");
                 categoryListDispatcher.forward(req, res);
                 break;

             default:
                 List<Task> tasks = taskDAO.getAllTasks();
                 req.setAttribute("tasks",tasks);
                 RequestDispatcher listDispatcher = req.getRequestDispatcher("index.jsp");
                 listDispatcher.forward(req,res);
                 break;
         }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{

          String idParam = req.getParameter("id");
          String title = req.getParameter("title");
          String description = req.getParameter("description");
          String categoryIdParam = req.getParameter("categoryId");
          boolean completed = req.getParameter("completed") != null;

          Task task;
          if(idParam == null || idParam.isEmpty()){
              task = new Task(title,description);
          } else {
              task = taskDAO.getTaskById(Long.parseLong(idParam));
              task.setTitle(title);
              task.setDescription(description);
          }

          task.setCompleted(completed);

          if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
              Long categoryId = Long.parseLong(categoryIdParam);
              Category category = categoryDAO.getCategoryById(categoryId);
              task.setCategory(category);
          } else {
              task.setCategory(null);
          }

         if(idParam == null || idParam.isEmpty()){
             taskDAO.save(task);
         } else {
             taskDAO.update(task);
         }
         res.sendRedirect(req.getContextPath() + "/tasks");
    }
}
