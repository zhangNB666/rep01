package com.bjpowernode.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {
    @RequestMapping("login.do")
    public String login(String username, String password, HttpSession session) {
        if ("zhangsan".equals(username) && "123".equals(password)) {
            // 登录操作需要将用户对象保存到session中：1.判断是否登录；2. 获取用户相关的信息
            session.setAttribute("loginUser", username);
            return "redirect:/product/index.html";
        }
        return "redirect:/login.html";
    }
}
