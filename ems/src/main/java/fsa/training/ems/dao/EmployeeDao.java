package fsa.training.ems.dao;

import fsa.training.ems.model.entity.Employee;
import fsa.training.ems.utils.HibernateUtils;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import org.hibernate.Session;

import java.util.List;

public interface EmployeeDao {

    public List<Employee> getAll(int page,int size);

    long getTotalItem();
}
