package com.example.shop;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class User {

    @Id
    private Long id;
    private String username;
    private String password;
    private String role;

    // Getters și setters
}
