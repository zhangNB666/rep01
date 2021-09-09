package com.bjpowernode.web.controller;

import com.bjpowernode.pojo.Product;
import com.bjpowernode.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping("index.html")
    public ModelAndView service() throws ServletException, IOException {
        List<Product> pList = productService.getAll();

        ModelAndView mv = new ModelAndView();
        mv.addObject("pList", pList);
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping("delete.do")
    public String delete(String[] id) {
        System.out.println(Arrays.toString(id));
        // id的格式:  1 或 1,2,3
        productService.delete(id); // 执行删除操作

        // 只要不是查询就重定向！！！
        // 重定向到商品的展示页面
        //resp.sendRedirect("/product/index.html");
        return "redirect:/product/index.html";
    }

    @RequestMapping("add.do")
    // 请求参数名要和Product中的属性名一致
    public void add(Product product, HttpServletResponse resp) throws IOException {
        System.out.println(product);
        productService.add(product); // 执行添加操作

        // 只要不是查询就重定向！！！
        // 重定向到商品的展示页面
        resp.sendRedirect("/product/index.html");
    }

    @RequestMapping("edit.do")
    public void edit(Product product, HttpServletResponse resp) throws ServletException, IOException {
        productService.edit(product); // 执行添加操作

        // 只要不是查询就重定向！！！
        // 重定向到商品的展示页面
        resp.sendRedirect("/product/index.html");
    }

    @RequestMapping("products.json")
    @ResponseBody // 将返回值转换为json并响应到客户端
    public List<Product> products() {
        return productService.getAll();
    }

    @RequestMapping("edit.html")
    public void editPage(String id, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //String id = req.getParameter("id");

        Product product = productService.get(id); // 执行添加操作

        req.setAttribute("product", product);
        req.getRequestDispatcher("/edit.jsp").forward(req, resp);
    }

    @RequestMapping("save.do")
    /*
        @ResponseBody: 将方法的返回值转换为json
        @RequestBody: 将请求体(json)转换成该注解标注的类型
            get请求没有请求体，该注解针对的是post请求
            将请求体中的json转换为方法中声明的对象
     */
    @ResponseBody
    public Map save(@RequestBody Product product) {
        System.out.println(product);
        productService.add(product); // 执行添加操作

        Map map = new HashMap();
        map.put("success", true);
        map.put("msg", "操作成功！");

        return map;
    }

    @RequestMapping("save2.do")
    /*
        @ResponseBody: 将方法的返回值转换为json
        @RequestBody: 将请求体(json)转换成该注解标注的类型
            get请求没有请求体，该注解针对的是post请求
            将请求体中的json转换为方法中声明的对象
     */
    @ResponseBody
    public Map save2(@RequestBody List<Product> products) {
        System.out.println(products);
        productService.add(products.get(0)); // 执行添加操作
        // List==>json:[{},{},{}]
        Map map = new HashMap();
        map.put("success", true);
        map.put("msg", "操作成功！");

        return map;
    }

}
