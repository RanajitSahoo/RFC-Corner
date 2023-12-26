package com.rfc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rfc.dao.CustomerDao;
import com.rfc.dao.ProductDao;
import com.rfc.dao.foodOrderDao;
import com.rfc.dto.Customer;
import com.rfc.dto.FoodOrder;
import com.rfc.dto.Product;

@Controller
public class CustomerController {
	@Autowired
	CustomerDao cd;
	
	
	
	@Autowired
	ProductDao pd;
	
	@Autowired
	foodOrderDao fd;
	
	@RequestMapping("/registerButton")
	public ModelAndView registerButton() {
		ModelAndView mav = new ModelAndView("CustomerRegister");
		return mav;
	}
	
	@RequestMapping("/registerCustomer")
	public ModelAndView saveCustomer(HttpServletRequest req) {
		Customer c = cd.getCustomerByServletRequest(req);
		Customer customer = cd.saveCustomer(c);
		if(customer!=null) {
			ModelAndView mav = new ModelAndView("CustomerLogin");
			mav.addObject("msg","SuccessFully Registered");
			return mav;
		}else {
			ModelAndView mav = new ModelAndView("CustomerRegister");
			mav.addObject("msg","Error: Customer did not registered, do it again!");
			return mav;
		}
		
	}
	@RequestMapping("/loginButton")
	public ModelAndView loginButton() {
		ModelAndView mav = new ModelAndView("CustomerLogin");
		return mav;
	}
	
	@RequestMapping("loginCustomer")
	public ModelAndView loginCustomer(HttpServletRequest req) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		Customer customer = cd.loginCustomer(email, password);
		if(customer!=null) {
			ModelAndView mav = new ModelAndView("CutomerHomePage");
			mav.addObject("customer",customer);
			mav.addObject("msg","SuccessFully Loggedin");
			List<Product> products = pd.getAllProduct();
			mav.addObject("products",products);
			HttpSession session = req.getSession();
			session.setAttribute("customer", customer);
//			FoodOrder f = new FoodOrder();
//			FoodOrder fo = fd.getOrderById(customer.getId());
//			if(fo!=null) {
//				f.setCustomer(customer);
//				fd.saveOrder(f);
//			}else {
//				f.setCustomer(customer);
//				fd.updateOrder(fo.getId());
//			}
			return mav;
		}else {
			ModelAndView mav = new ModelAndView("CustomerLogin");
			mav.addObject("msg","Error: Logging in Error, do it again!");
			return mav;
		}
	}
	@RequestMapping("/viewCustomers")
	public ModelAndView viewAllCustomers() {
		ModelAndView mav = new ModelAndView("viewAllCustomer");
		List<Customer> customers = cd.getAllCustomer();
		mav.addObject("allCustomers",customers);
		return mav;
	}
	@RequestMapping("/updateCustomer")
	public ModelAndView update(HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("id"));
		Customer customer = cd.getCustomerById(id);
		ModelAndView mav = new ModelAndView("CustomerEdit");
		mav.addObject("customer",customer);
		
		return mav;
		
	}
	@RequestMapping("/editCustomer")
	public ModelAndView edit(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("viewAllCustomer");
		int id=Integer.parseInt(req.getParameter("id"));
		Customer customer = cd.editCustomerByServletRequest(req,id);
		cd.updateCustomer(customer);
		List<Customer> customers = cd.getAllCustomer();
		mav.addObject("allCustomers",customers);
		
		return mav;
		
	}
	@RequestMapping("/deleteCustomer")
	public ModelAndView deleteCustomer(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("viewAllCustomer");
		int id = Integer.parseInt(req.getParameter("id"));
		cd.deleteCustomerById(id);
		List<Customer> customers = cd.getAllCustomer();
		mav.addObject("allCustomers",customers);
		
		return mav;
	}

	@RequestMapping("/customerLogout")
	public ModelAndView logoutAdmin(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("AdminHomePage");
		mav.addObject("msg","Customer Logged out SucccessFully");
		HttpSession session = req.getSession();
		session.removeAttribute("customer");
		return mav;
	}
	@RequestMapping("/viewCustomerProfile")
	public ModelAndView viewCustomerProfile(@RequestParam("cid") int cid) {
		Customer c = cd.getCustomerById(cid);
		ModelAndView mav = new ModelAndView("CustomerProfile");
		mav.addObject("customer",c);
		return mav;
	}
	

}
