package com.bjpowernode.service.impl;

import com.bjpowernode.mapper.ProductMapper;
import com.bjpowernode.pojo.Product;
import com.bjpowernode.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    public List<Product> getAll() {
        return productMapper.getAll();
    }

    public void delete(String... ids) {
        for (String id : ids) {
            productMapper.delete(id);
        }
    }

    public void add(Product product) {
        productMapper.add(product);
    }

    @Override
    public Product get(String id) {
        return productMapper.get(id);
    }

    @Override
    public void edit(Product product) {
        productMapper.edit(product);
    }
}
