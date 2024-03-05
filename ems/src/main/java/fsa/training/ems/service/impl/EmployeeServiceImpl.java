package fsa.training.ems.service.impl;

import fsa.training.ems.dao.EmployeeDao;
import fsa.training.ems.dao.impl.EmployeeDaoImpl;
import fsa.training.ems.model.dto.EmployeeListDto;
import fsa.training.ems.model.entity.Employee;
import fsa.training.ems.service.EmployeeService;

import java.util.List;
import java.util.stream.Collectors;

public class EmployeeServiceImpl implements EmployeeService {

    private final EmployeeDao employeeDao = new EmployeeDaoImpl();

    @Override
    public List<EmployeeListDto> getAll(int page, int size) {
        List<Employee> employeeList = employeeDao.getAll(page,size);

        List<EmployeeListDto> employeesListDTOS = employeeList.stream().map(e -> {
                    return new EmployeeListDto(
                            e.getId(), e.getName(), e.getEmail(), e.getDateOfBirth(), e.getLevel());
                }
        ).collect(Collectors.toList());

        return employeesListDTOS;
    }

    @Override
    public long getTotalItem() {
        return employeeDao.getTotalItem();
    }
}