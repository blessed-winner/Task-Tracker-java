package com.task.tracker.DAO;

import com.task.tracker.model.Category;
import com.task.tracker.model.Task;
import com.task.tracker.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class TaskDAO {
  public void save(Task task){
       Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction tx = session.beginTransaction();

       session.persist(task);
       tx.commit();
       session.close();
  }

  public List<Task> getAllTasks(){
      Session session = HibernateUtil.getSessionFactory().openSession();
      List<Task> tasks = new ArrayList<>(session.createQuery("from Task",Task.class).list());
      session.close();
      return tasks;
  }

  public Task getTaskById(Long id){
      Session session = HibernateUtil.getSessionFactory().openSession();
      Task task = session.get(Task.class,id);
      session.close();
      return task;
  }

  public void update(Task task){
      Session session = HibernateUtil.getSessionFactory().openSession();
      Transaction tx = session.beginTransaction();

      session.merge(task);
      tx.commit();
      session.close();
  }

  public void delete(Long id){
      Session session = HibernateUtil.getSessionFactory().openSession();
      Transaction tx = session.beginTransaction();
      Query query = session.createQuery("delete from Task where id = :id");
      query.setParameter("id", id);
      query.executeUpdate();
      tx.commit();
      session.close();
  }

  public List<Task> getTasksByCategory(Long categoryId) {
      Session session = HibernateUtil.getSessionFactory().openSession();
      Query<Task> query = session.createQuery("from Task where category.id = :categoryId", Task.class);
      query.setParameter("categoryId", categoryId);
      List<Task> tasks = query.list();
      session.close();
      return tasks;
  }

  public void toggleTaskCompletion(Long id) {
      Session session = HibernateUtil.getSessionFactory().openSession();
      Transaction tx = session.beginTransaction();
      Task task = session.get(Task.class, id);
      if (task != null) {
          task.setCompleted(!task.isCompleted());
          session.merge(task);
      }
      tx.commit();
      session.close();
  }
}
