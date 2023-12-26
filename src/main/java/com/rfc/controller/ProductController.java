package com.rfc.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rfc.dao.ProductDao;
import com.rfc.dto.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDao pd;
	
	
	@RequestMapping("/addProduct")
	public ModelAndView addProduct() {
		ModelAndView mav = new ModelAndView("ProductForm");
		
		return mav;
	}
	@RequestMapping("/saveProduct")
	public ModelAndView saveProduct(HttpServletRequest req) {
		
		Product p = pd.getproductByServlet(req);
		Product product = pd.saveProduct(p);
		if(product!=null) {
			ModelAndView mav = new ModelAndView("AdminHomePage");
			mav.addObject("msg","product saved");
			return mav;
		}else {
			ModelAndView mav = new ModelAndView("ProductForm");
			mav.addObject("msg","Error: Product didnot saves");
			return mav;
		}
		
	}
	@RequestMapping("/viewProducts")
	public ModelAndView viewAllProducts() {
		ModelAndView mav = new ModelAndView("AllProducts");
		List<Product> products = pd.getAllProduct();
		mav.addObject("products",products);
		return mav;
	}
	@RequestMapping("/updateProduct")
	public ModelAndView updateProduct(HttpServletRequest req) {
		Product p = pd.getProductById(Integer.parseInt(req.getParameter("id")));
		ModelAndView mav = new ModelAndView("EditProduct");
		mav.addObject("product",p);
		return mav;
	}
	@RequestMapping("/editProduct")
	public ModelAndView editProduct(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("AllProducts");
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		Product p = pd.getproductByServlet(req, id);
		pd.updateProduct(p);
		List<Product> products = pd.getAllProduct();
		mav.addObject("products",products);
		return mav;
	}
	@RequestMapping("/deleteProduct")
	public ModelAndView deleteProduct(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("AllProducts");
		int id = Integer.parseInt(req.getParameter("id"));
		pd.deleteProductById(id);
		List<Product> products = pd.getAllProduct();
		mav.addObject("products",products);
		return mav;
	}

}
