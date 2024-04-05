package com.smhrd.config;


// 컨트롤러 찾을 수 있도록 패키지 위치 명시
import org.springframework.context.annotation.ComponentScan;
// 설정 파일
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
// web mvc 설정 파일
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

// dispatcher servlet에 대한 설정
//annotaion : spring frame work 제공
@EnableWebMvc
@Configuration
@ComponentScan(basePackages= {"com.smhrd.controller"})
public class ServletContext implements WebMvcConfigurer{

	// view resolver : view를 어디에 널어줄 지
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		
		registry.viewResolver(bean);
	}

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

}