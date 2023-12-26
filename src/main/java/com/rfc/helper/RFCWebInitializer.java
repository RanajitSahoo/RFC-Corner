package com.rfc.helper;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class RFCWebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		Class[] classes= {RFC_Config.class};
		return classes;
	}

	@Override
	protected String[] getServletMappings() {
		String[] urls= {"/"};
		return urls;
	}

}
