package com.rfc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rfc.dto.Customer;
import com.rfc.dto.FoodOrder;
import com.rfc.dto.Item;

@Repository
public class foodOrderDao {
	@Autowired
	EntityManagerFactory emf;
	
	public FoodOrder saveOrder(FoodOrder order) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(order);
		et.commit();
		return order;
	}
	public List<FoodOrder> allOrders(){
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		String sql="select f from FoodOrder f";
		Query q = em.createQuery(sql);
		List<FoodOrder> list = q.getResultList();
		return list;
	}
	public FoodOrder getOrderById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		FoodOrder order = em.find(FoodOrder.class, id);
		et.commit();
		return order;
	}
	public FoodOrder updateOrder(FoodOrder order) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(order);
		et.commit();
		return order;
	}
	
	public FoodOrder getOrderByServlet(HttpServletRequest req) {
		String name = req.getParameter("name");
		String mobileNumber = req.getParameter("mobileNumber");
		FoodOrder f=new FoodOrder();
		f.setName(name);
		f.setMobileNumber(mobileNumber);
		return f;
	}
	public List<FoodOrder> getFoodOrdersByCustomer(Customer c){
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		String sql="select f from FoodOrder f where f.customer=?1";
		Query q = em.createQuery(sql);
		q.setParameter(1, c);
		List<FoodOrder> list = q.getResultList();
		et.commit();
		return list;
	}
	
	public List<FoodOrder> getOnlyVegFoodOrder(String veg){
		EntityManager em = emf.createEntityManager();
		String sql="select f from FoodOrder f where f.category=?1";
		Query q = em.createQuery(sql);
		q.setParameter(1, veg);
		List<FoodOrder> list = q.getResultList();
		return list;
	}
	

}
