package com.rfc.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rfc.dao.CustomerDao;
import com.rfc.dao.ItemDao;
import com.rfc.dao.ProductDao;
import com.rfc.dao.foodOrderDao;
import com.rfc.dto.Customer;
import com.rfc.dto.FoodOrder;
import com.rfc.dto.Item;
import com.rfc.dto.Product;

@Controller
public class ItemController {
	@Autowired
	ProductDao pd;
	@Autowired
	CustomerDao cd;

	@Autowired
	foodOrderDao fd;
	@Autowired
	ItemDao ida;

	@RequestMapping("/addItem")
	public ModelAndView addItem(HttpServletRequest req, @RequestParam("fid") int fid, @RequestParam("cid") int cid) {
		ModelAndView mav = new ModelAndView("AddItemForm");
		int id = Integer.parseInt(req.getParameter("p"));
		FoodOrder f = fd.getOrderById(fid);
		Customer c = cd.getCustomerById(cid);
		Product p = pd.getProductById(id);
		mav.addObject("p", p);
		mav.addObject("foodOrder", f);
		mav.addObject("customer", c);
		return mav;

	}

	@RequestMapping("/saveItem")
	public ModelAndView saveItem(HttpServletRequest req, @RequestParam("fid") int fid, @RequestParam("cid") int cid) {
		Item i = ida.getproductByServlet(req);
		FoodOrder f = fd.getOrderById(fid);
		Customer c = cd.getCustomerById(cid);
		f.setCustomer(c);
		FoodOrder order = fd.updateOrder(f);
		i.setFoodOrder(order);
		ida.saveItem(i);
		ModelAndView mav = new ModelAndView("CustomerFoodOrder");
		List<Product> allProduct = pd.getAllProduct();
		mav.addObject("products", allProduct);
		mav.addObject("foodOrder", order);
		mav.addObject("customer", c);
		return mav;
	}

}
