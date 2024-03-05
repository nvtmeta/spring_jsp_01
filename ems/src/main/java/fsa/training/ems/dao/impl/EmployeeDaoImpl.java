package fsa.training.ems.dao.impl;

import fsa.training.ems.dao.EmployeeDao;
import fsa.training.ems.model.entity.Employee;
import fsa.training.ems.utils.HibernateUtils;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import org.hibernate.Session;

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
        try(Session session = HibernateUtils.getSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Long> query = builder.createQuery(Long.class);
            Root<Employee> root = query.from(Employee.class);
            query.select(builder.count(root));

            query.where(builder.equal(root.get("deleted"), false));
            return session.createQuery(query).getSingleResult();
        }
    }
}
