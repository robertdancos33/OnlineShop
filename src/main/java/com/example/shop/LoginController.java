package com.example.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class LoginController {
    @RequestMapping("/login")
    public String login() {
        return "login"; // Asigură-te că există un view pentru "login"
    }

    @RequestMapping("/loginRedirect")
    public String loginRedirect() {
        return "redirect:/login"; // Redirecționează corect
    }
}

