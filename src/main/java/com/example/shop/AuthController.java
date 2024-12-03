package com.example.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String login() {
        return "login";  // Pagina de login
    }

    @GetMapping("/register")
    public String register() {
        return "register";  // Pagina de înregistrare
    }

    @PostMapping("/register")
    public String registerUser(String username, String password) {
        // Logică pentru salvarea utilizatorului în DB
        return "redirect:/login";  // După înregistrare, redirecționează spre pagina de login
    }
}
