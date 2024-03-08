package fsa.training.ems.dao.impl;

import fsa.training.ems.dao.EmployeeDao;
import fsa.training.ems.model.entity.Employee;
import fsa.training.ems.utils.HibernateUtils;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class EmployeeDaoImpl implements EmployeeDao {
    @Override
    public List<Employee> getAll(int page, int size) {
        try (Session session = HibernateUtils.getSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Employee> query = builder.createQuery(Employee.class);
            Root<Employee> root = query.from(Employee.class);
            query.select(root);

            query.where(builder.equal(root.get("deleted"), false));
            return session.createQuery(query)
                    .setMaxResults(size)
                    .setFirstResult(size * (page - 1))
                    .getResultList();
        }
    }

    @Override
    public long getTotalItem() {
        try (Session session = HibernateUtils.getSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Long> query = builder.createQuery(Long.class);
            Root<Employee> root = query.from(Employee.class);
            query.select(builder.count(root));

            query.where(builder.equal(root.get("deleted"), false));
            return session.createQuery(query).getSingleResult();
        }
    }

    @Override
    public Employee create(Employee employee) {
        System.out.println("employeeDao = " + employee);

        try (Session session = HibernateUtils.getSession()) {
            Transaction transaction = session.beginTransaction();
            session.persist(employee);
            transaction.commit();
            return employee;
        }

    }

    @Override
    public void update(Employee employee) {
        try (Session session = HibernateUtils.getSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(employee);
            transaction.commit();
        }
    }

    @Override
    public void delete(long id) {
        try (Session session = HibernateUtils.getSession()) {
            Employee employee = session.find(Employee.class, id);

            if (employee == null) {
                throw new IllegalArgumentException("Can not find employee with id: " + id);
            }

            Transaction transaction = session.beginTransaction();
            employee.setDeleted(true);
            session.merge(employee);
            transaction.commit();

        }
    }

    @Override
    public Employee getById(long id) {
        try (Session session = HibernateUtils.getSession()) {
            return session.get(Employee.class, id);
        }
    }


}
