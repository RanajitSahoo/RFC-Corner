package com.rfc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rfc.dto.Admin;
import com.rfc.dto.Product;

@Repository
public class ProductDao {
	@Autowired
	EntityManagerFactory emf;
	@Autowired
	AdminDao ad;
	
	public Product saveProduct(Product product) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(product);
		et.commit();
		return product;
	}
	
	public List<Product> getAllProduct(){
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		String sql="select p from Product p";
		Query q = em.createQuery(sql);
		List<Product> list = q.getResultList();
		et.commit();
		return list;
	}
	
	public Product getProductById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Product product = em.find(Product.class, id);
		et.commit();
		return product;
	}
	public void deleteProductById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Product product = em.find(Product.class, id);
		em.remove(product);
		et.commit();
		
	}
	public Product updateProduct(Product product) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(product);
		et.commit();
		return product;
	}
	
	public Product getproductByServlet(HttpServletRequest req) {
		String name = req.getParameter("name");
		String image = req.getParameter("image");
		String category = req.getParameter("category");
		int stock = Integer.parseInt(req.getParameter("stock"));
		double price = Double.parseDouble(req.getParameter("price"));
		
		System.out.println(price);
		Product p=new Product();
		
		p.setName(name);
		p.setImage(image);
		p.setCategory(category);
		p.setStock(stock);
		p.setPrice(price);
		
		Admin admin = ad.getAdminByEmail("admin@rfc.com");
		p.setAdmin(admin);
		
		return p;
	}
	public Product getproductByServlet(HttpServletRequest req ,int id) {
		String name = req.getParameter("name");
		String image = req.getParameter("image");
		String category = req.getParameter("category");
		int stock = Integer.parseInt(req.getParameter("stock"));
		double price = Double.parseDouble(req.getParameter("price"));
		
		System.out.println(price);
		Product p = getProductById(id);
		
		p.setName(name);
		p.setImage(image);
		p.setCategory(category);
		p.setStock(stock);
		p.setPrice(price);
		
		Admin admin = ad.getAdminByEmail("admin@rfc.com");
		p.setAdmin(admin);
		
		return p;
	}
	
}
