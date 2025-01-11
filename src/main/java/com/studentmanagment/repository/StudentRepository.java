package com.studentmanagment.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studentmanagment.entity.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {
}		
