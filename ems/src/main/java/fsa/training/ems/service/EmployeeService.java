package fsa.training.ems.service;

import fsa.training.ems.model.dto.EmployeeListDto;

import java.util.List;

public interface EmployeeService {

    public List<EmployeeListDto> getAll(int page, int size);

    public long getTotalItem();
}
