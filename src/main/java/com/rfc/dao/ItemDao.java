package com.rfc.dao;

import java.util.ArrayList;
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
import com.rfc.dto.FoodOrder;
import com.rfc.dto.Item;
import com.rfc.dto.Product;


@Repository
public class ItemDao {
	private static final Object Item = null;
	@Autowired
	EntityManagerFactory emf;
	
	
	public Item saveItem(Item item) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(item);
		et.commit();
		return item;
	}
	
	public List<Item> getAllItems(){
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		String sql="select i from Item i";
		Query q = em.createQuery(sql);
		List<Item> list = q.getResultList();
		et.commit();
		return list;
	}
	
	public Item getItemById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Item item = em.find(Item.class, id);
		et.commit();
		return item;
	}
	public void deleteItemById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Item item = em.find(Item.class, id);
		em.remove(item);
		et.commit();
		
	}
	public Item updateItem(Item item) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(item);
		et.commit();
		return item;
	}
	
	public Item getproductByServlet(HttpServletRequest req) {
		String name = req.getParameter("name");
		String image = req.getParameter("image");
		String type = req.getParameter("type");
		int qnt = Integer.parseInt(req.getParameter("quantity"));
		double price = Double.parseDouble(req.getParameter("price"));
//		FoodOrder order = new foodOrderDao().getOrderById(Integer.parseInt(req.getParameter("fid")));
		
		Item p=new Item();
		
		p.setName(name);
		p.setImage(image);
		p.setType(type);
		p.setQuantity(qnt);
		p.setPrice(price);
		
		return p;
	}
	
	public List<Item> getItemsByFoodOrder(FoodOrder fd){
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		String sql="select i from Item i where i.foodOrder=?1";
		Query q = em.createQuery(sql);
		q.setParameter(1, fd);
		List list = q.getResultList();
		return list;
	}
	
//	public List<Item> getOnlyUniqueItems(List<Item> items){
//		List<Item> list=new ArrayList<Item>();
//		
//		for(Item item:items) {
//			int qnt=item.getQuantity();
//			if(list.isEmpty()) {
//				list.add(item);
//			}else {
//				for(Item i:list) {
//					if(item.getName().equals(i.getName())){
//						qnt=i.getQuantity()+item.getQuantity();
//						list.remove(i);
//					}
//					
//				}
//				item.setQuantity(qnt);
//				list.add(item);
//			}
//		}
//		for(Item i:list) {
//			System.out.println(i.getName()+"--->"+i.getQuantity());
//		}
//		return list;
//	}
	public List<Item> getOnlyUniqueItems(List<Item> items){
		List<Item> item=new ArrayList<Item>();
		Object[] a = items.toArray();
		for(int i=0;i<a.length-1;i++) {
			Item it=(Item)a[i];
			if(a[i]!=null) {
				for(int j=i+1;j<a.length;j++) {
					if(a[j]!=null) {
						Item it2=(Item)a[j];
						if(it.getName().equals(it2.getName())) {
							it.setQuantity(it.getQuantity()+it2.getQuantity());
							a[j]=null;
						}
					}
				}
			}
		}
		
	
		
		for(int i=0;i<a.length;i++) {
			Item it=(Item)a[i];
			if(it!=null) {
				item.add(it);
			}
		}
		
		
		return item;
	}
}
