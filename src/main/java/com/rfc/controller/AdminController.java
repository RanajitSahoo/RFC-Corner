package com.rfc.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rfc.dao.AdminDao;
import com.rfc.dto.Admin;

@Controller
public class AdminController {
	@Autowired
	AdminDao ad;

	@RequestMapping("/adminLogin")
	public ModelAndView goToAdminLogin() {
		ModelAndView mav = new ModelAndView("AdminForm");
		Admin admin = new Admin();
		mav.addObject("admin", admin);
		return mav;
	}
	

	@RequestMapping("/loggedinAdmin")
	public ModelAndView adminLogin(@ModelAttribute("admin") Admin admin,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("AdminHomePage");
		List<Admin> allAdmin = ad.getAllAdmin();

		boolean flag = false;
		if (allAdmin.isEmpty()) {
			System.out.println("--->");
			if ("admin@rfc.com".equals(admin.getEmail()) && "admin".equals(admin.getPassword())) {
				System.out.println("--->");
				flag = true;

			}

		} else {
			Iterator<Admin> itr = allAdmin.iterator();
			while (itr.hasNext()) {
				Admin a = itr.next();
				if (a.getEmail().equals(admin.getEmail()) && a.getPassword().equals(admin.getPassword())) {

					flag = true;

				}
			}

		}

		if (flag) {
			if (allAdmin.isEmpty())
				ad.saveAdmin(admin);
			mav.addObject("admin", admin);
			mav.addObject("msg","Logged In Successfully");
			HttpSession session = req.getSession();
			session.setAttribute("admin", admin);
			return mav;
		} else {
			ModelAndView mav1 = new ModelAndView("AdminForm");
			mav.addObject("msg","Error: Invalid Credential");
			return mav1;
		}

	}
	@RequestMapping("/adminLogout")
	public ModelAndView logoutAdmin(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("msg","Logged out SucccessFully");
		HttpSession session = req.getSession();
		session.invalidate();
		return mav;
	}

}
