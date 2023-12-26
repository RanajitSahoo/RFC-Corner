package com.rfc.dao;

import java.util.Iterator;
import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rfc.dto.Admin;
import com.rfc.dto.Customer;
import com.rfc.utility.Address;


@Repository
public class CustomerDao {
	@Autowired
	EntityManagerFactory emf;

	public Customer saveCustomer(Customer customer) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(customer);
		et.commit();
		return customer;
	}

	public List<Customer> getAllCustomer() {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		String sql = "select c from Customer c";
		Query q = em.createQuery(sql);
		List<Customer> list = q.getResultList();
		et.commit();
		return list;
	}

	public Customer getCustomerById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Customer customer = em.find(Customer.class, id);
		et.commit();
		return customer;
	}

	public void deleteCustomerById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Customer customer = em.find(Customer.class, id);
		em.remove(customer);
		et.commit();

	}

	public Customer getCustomerByEmail(String email) {
		EntityManager em = emf.createEntityManager();
		String sql = "select c from Cutomer c where c.email=?1";
		Query q = em.createQuery(sql);
		q.setParameter(1, email);
		Customer customer = (Customer) q.getSingleResult();
		return customer;
	}

	public Customer getCustomerByMobileNumber(long mobileNumber) {
		EntityManager em = emf.createEntityManager();
		String sql = "select c from Cutomer c where c.mobileNumber=?1";
		Query q = em.createQuery(sql);
		q.setParameter(1, mobileNumber);
		Customer customer = (Customer) q.getSingleResult();
		return customer;
	}

	public Customer updateCustomer(Customer customer) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(customer);
		et.commit();
		return customer;
	}
	
	public Customer getCustomerByServletRequest(HttpServletRequest req) {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String mobileNumber = req.getParameter("mobileNumber");
		String password = req.getParameter("password");
		String village = req.getParameter("village");
		String district = req.getParameter("district");
		String state = req.getParameter("state");
		String country = req.getParameter("country");
		int pincode = Integer.parseInt(req.getParameter("pincode"));
		Customer c = new Customer();
		c.setName(name);
		c.setEmail(email);
		c.setMobileNumber(mobileNumber);
		c.setPassword(password);
		Address ad = new Address();
		ad.setVillage(village);
		ad.setDistrict(district);
		ad.setState(state);
		ad.setCountry(country);
		ad.setPincode(pincode);
		
		c.setAddress(ad);
		c.setFoodOrders(null);
		return c;
		
	}
	public Customer editCustomerByServletRequest(HttpServletRequest req ,int id) {
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String mobileNumber = req.getParameter("mobileNumber");
//		String password = req.getParameter("password");
		String village = req.getParameter("village");
		String district = req.getParameter("district");
		String state = req.getParameter("state");
		String country = req.getParameter("country");
		int pincode = Integer.parseInt(req.getParameter("pincode"));
		Customer c = getCustomerById(id);
		
		c.setName(name);
		c.setEmail(email);
		c.setMobileNumber(mobileNumber);
//		c.setPassword(password);
		Address ad = new Address();
		ad.setVillage(village);
		ad.setDistrict(district);
		ad.setState(state);
		ad.setCountry(country);
		ad.setPincode(pincode);
		
		c.setAddress(ad);
		c.setFoodOrders(null);
		return c;
		
	}
	public Customer loginCustomer(String email,String password) {
		List<Customer> allCustomer = getAllCustomer();
		Iterator<Customer> itr = allCustomer.iterator();
		while(itr.hasNext()) {
			Customer c = itr.next();
			if(c.getEmail().equals(email)&&c.getPassword().equals(password)) {
				return c;
			}
		}
		return null;
	}
}
