package com.rfc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rfc.dto.Admin;

@Repository
public class AdminDao {
	@Autowired
	EntityManagerFactory emf;
	
	public Admin saveAdmin(Admin admin) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(admin);
		et.commit();
		return admin;
	}
	public Admin getAdminById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Admin admin = em.find(Admin.class, id);
		et.commit();
		return admin;
	}
	public Admin getAdminByEmail(String email) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		String sql="select a from Admin a where a.email=?1";
		Query q = em.createQuery(sql);
		q.setParameter(1, email);
		
		return (Admin)q.getSingleResult();
	}
	public List<Admin> getAllAdmin(){
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		String sql="select a from Admin a";
		Query q = em.createQuery(sql);
		List<Admin> list = q.getResultList();
		et.commit();
		return list;
	}
}
