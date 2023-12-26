package com.rfc.helper;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@ComponentScan(basePackages = "com.rfc")
@Configuration
public class RFC_Config {
	@Bean
	public InternalResourceViewResolver dbConfig() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/");
		resolver.setSuffix(".jsp");
		
		return resolver;
	}
	@Bean
	public EntityManagerFactory emf() {
		return Persistence.createEntityManagerFactory("rfc_corner");
	}

}
