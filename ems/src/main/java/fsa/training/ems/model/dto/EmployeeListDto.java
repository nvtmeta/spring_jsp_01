package fsa.training.ems.model.dto;

import fsa.training.ems.enums.EmployeeLevel;
import lombok.*;

import java.time.LocalDate;


@Getter
@Setter
@AllArgsConstructor
public class EmployeeListDto {
    private Long id;

    private String name;

    private String email;

    private LocalDate dateOfBirth;

    private EmployeeLevel level;


}
