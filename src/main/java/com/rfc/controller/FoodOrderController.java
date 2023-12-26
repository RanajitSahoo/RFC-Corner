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
public class FoodOrderController {

	@Autowired
	CustomerDao cd;
	@Autowired
	foodOrderDao fd;

	@Autowired
	ProductDao pd;

	@Autowired
	ItemDao ida;

	@RequestMapping("/addOrder")
	public ModelAndView addtoOrder(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("FoodOrderForm");
		return mav;

	}

	@RequestMapping("/addFoodOrder")
	public ModelAndView addFoodOrder(HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView("CustomerFoodOrder");
		String name = req.getParameter("name");
		String mobileNumber = req.getParameter("mobileNmber");
		int id = Integer.parseInt(req.getParameter("cid"));
		Customer customer = cd.getCustomerById(id);
		FoodOrder order = fd.getOrderByServlet(req);
		order.setCustomer(customer);
		FoodOrder saveOrder = fd.saveOrder(order);
		List<Item> items = ida.getItemsByFoodOrder(order);
//		f.setItem(items);
		List<Item> uni = ida.getOnlyUniqueItems(items);
		order.setItem(uni);
		FoodOrder updateOrder = fd.updateOrder(order);
		List<Product> allProduct = pd.getAllProduct();

		mav.addObject("products", allProduct);
		mav.addObject("foodOrder", updateOrder);
		mav.addObject("customer", customer);
		return mav;
	}

	@RequestMapping("/foodOrder")
	public ModelAndView addfoodOrder(HttpServletRequest req, @RequestParam("fid") int fid,
			@RequestParam("cid") int cid) {
		ModelAndView mav = new ModelAndView("FoodOrderCart");
		FoodOrder f = fd.getOrderById(fid);
		Customer c = cd.getCustomerById(cid);
		List<Item> items = ida.getItemsByFoodOrder(f);
		List<Item> uni = ida.getOnlyUniqueItems(items);
		f.setItem(uni);
//		fd.updateOrder(f);
		mav.addObject("items", uni);
		mav.addObject("customer", c);
		mav.addObject("foodOrder", f);
		return mav;
	}

	@RequestMapping("/generateBill")
	public ModelAndView generateBill(@RequestParam("fid") int fid, @RequestParam("cid") int cid,
			@RequestParam("totalcost") double totalcost) {
		FoodOrder f = fd.getOrderById(fid);
		f.setTotalCost(totalcost);
		fd.updateOrder(f);
		Customer c = cd.getCustomerById(cid);
		List<Item> items = ida.getItemsByFoodOrder(f);
		List<Item> uni = ida.getOnlyUniqueItems(items);
		List<FoodOrder> orders = fd.getFoodOrdersByCustomer(c);
		c.setFoodOrders(orders);
		cd.updateCustomer(c);
		ModelAndView mav = new ModelAndView("Bill");
		mav.addObject("items", uni);
		mav.addObject("customer", c);
		mav.addObject("foodOrder", f);
		return mav;
	}

	@RequestMapping("/viewfoodorder")
	public ModelAndView viewFoodOrder(@RequestParam("cid") int cid) {
		Customer c = cd.getCustomerById(cid);
		List<FoodOrder> orders = fd.getFoodOrdersByCustomer(c);
		c.setFoodOrders(orders);
		cd.updateCustomer(c);
		ModelAndView mav = new ModelAndView("ViewFoodOrders");
		mav.addObject("orders", orders);
		mav.addObject("customer", c);
		return mav;
	}

	@RequestMapping("/viewAllFoodOrder")
	public ModelAndView viewAllFoodOrder() {
		List<FoodOrder> orders = fd.allOrders();
		ModelAndView mav = new ModelAndView("AllFoodOrder");
		mav.addObject("orders", orders);
		return mav;
	}

}
