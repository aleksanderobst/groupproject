package com.websystique.springmvc.model;

import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@Entity
@Table(name="task")
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Size(min=3, max=50)
    @Column(nullable = false)
    private String name;


    @NotNull
    @DateTimeFormat(pattern="dd/MM/yyyy")
    @Column(name = "JOINING_DATE", nullable = false)
    @Type(type="java.time.LocalDate")
    private LocalDate joiningDate;

    @Size(min=3, max=50)
    @Column(nullable = false)
    private String text;

    public Task() {
    }


    public Task(String name, LocalDate joiningDate, String text) {
        this.name = name;
        this.joiningDate = joiningDate;
        this.text = text;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDate() {
        return joiningDate;
    }

    public void setDate(LocalDate date) {
        this.joiningDate = date;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public LocalDate getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(LocalDate joiningDate) {
        this.joiningDate = joiningDate;
    }

    @Override
    public String toString() {
        return "Pet{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", joiningDate=" + joiningDate +
                ", text='" + text + '\'' +
                '}';
    }
}
