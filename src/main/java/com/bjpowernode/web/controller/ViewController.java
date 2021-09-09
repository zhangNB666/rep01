package com.bjpowernode.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
    @GetMapping("/login.html")
    public String login() {
        return "login";
    }
}
