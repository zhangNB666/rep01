package com.bjpowernode.web.intercepter;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginIntercepter implements HandlerInterceptor {
    // 拦截处理程序（Controller）的调用，返回false表示处理程序不会被调用
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 判断用户是否登录，没有登录，则强制跳转到登录页面
        Object loginUser = request.getSession().getAttribute("loginUser");
        if ( loginUser == null ) {
            response.sendRedirect("/login.html");
            return false;
        }
        return true;
    }
}
