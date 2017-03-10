package com.vlad.springmvc.model;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "TEST")

public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Size(min = 4, max = 25)
    @Column(name = "NAME", nullable = false)
    private String name;

    @NotNull
    @Column(name = "AGE", nullable = false)
    private int age;


        /*MAYBE CONTAINS BUG!*/
    @NotNull
    @Column(name = "IS_ADMIN", nullable = false, columnDefinition = "BIT", length = 1)
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private Boolean admin;



    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "CREATED_DATE", nullable = false)
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate createdDate;

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public boolean isAdmin() {

        if (admin == null) {
            return false;
        }
        else if (admin) return true;
        return false;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (id != user.id) return false;
        if (age != user.age) return false;
        if (!name.equals(user.name)) return false;
        if (!admin.equals(user.admin)) return false;
        return createdDate.equals(user.createdDate);
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + name.hashCode();
        result = 31 * result + age;
        result = 31 * result + admin.hashCode();
        result = 31 * result + createdDate.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", admin=" + admin +
                ", createdDate=" + createdDate +
                '}';
    }
}
