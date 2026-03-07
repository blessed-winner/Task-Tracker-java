package com.task.tracker.DAO;

import com.task.tracker.model.Category;
import com.task.tracker.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class CategoryDAO {

    public void save(Category category) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.persist(category);
        tx.commit();
        session.close();
    }

    public List<Category> getAllCategories() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Category> categories = session.createQuery("from Category", Category.class).list();
        session.close();
        return categories;
    }

    public Category getCategoryById(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Category category = session.get(Category.class, id);
        session.close();
        return category;
    }

    public void update(Category category) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.merge(category);
        tx.commit();
        session.close();
    }

    public void delete(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Category category = session.get(Category.class, id);
        if (category != null) {
            session.remove(category);
        }
        tx.commit();
        session.close();
    }
}
