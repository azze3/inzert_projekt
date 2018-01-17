package cz.inzert.hibernate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "adress")
public class Adress {
    @Id
    @Column(name = "id")
    private int id;
    @Column(name = "zipCode")
    private String zipCode;
    @Column(name = "city")
    private String city;
    @Column(name = "street")
    private String street;

    public Adress(){

    }

    public Adress(String zipCode, String city, String street) {
        this.zipCode = zipCode;
        this.city = city;
        this.street = street;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }
}

