package com.smhrd.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

// (보안을 위해) web.xml을 대체하는 파일
/* web.xml은 Java 웹 애플리케이션의 배포 서술자(Deployment Descriptor)
 * 
 * web.xml에서 어떤 일을 하는가?
 * 1. Servlet : 
 * 		- 각각의 서블릿에 url 매핑
 *		- 서블릿 초기화 매개변수를 설정하여 서블릿이 초기화될 때 필요한 값을 제공(데이터베이스 연결 정보 등)
 * 2. dispatcher 
 * 3. Annotation
 * 4. Abstract
 * 5. config 파일 등록
 * 5. 필터 설정: 웹 애플리케이션에서 요청과 응답을 가로채고 처리하는 필터를 설정(한글 인코딩)
 * 6. 리소스 매핑: 웹 애플리케이션에서 사용하는 리소스들에 대한 매핑 정보를 설정(CSS 파일, JavaScript 파일, 이미지 파일 등의 경로를 지정, resource 폴더에 넣음)
 * 
 * 

4. **에러 페이지 설정**: 웹 애플리케이션에서 발생하는 에러에 대한 처리 방법을 설정할 수 있습니다. 예를 들어, 404 에러 페이지를 설정하여 요청된 페이지를 찾을 수 없을 때 사용자에게 보여줄 페이지를 지정할 수 있습니다.

5. **할 수 있습니다.

6. **세션 설정**: 세션 관리를 위한 다양한 설정을 지정할 수 있습니다. 예를 들어, 세션 타임아웃 시간을 설정하거나 세션 공유를 위한 설정을 할 수 있습니다.

`web.xml` 파일을 통해 웹 애플리케이션의 다양한 설정을 관리하고 조정할 수 있으며, 이를 통해 웹 애플리케이션의 동작을 세부적으로 제어할 수 있습니다.
 * */

// AbstractAnnotationConfigDispatcherServletInitializer
public class Web extends AbstractAnnotationConfigDispatcherServletInitializer {
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {RootContext.class, SecurityConfig.class};
	}
	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {ServletContext.class};
	}
	
	@Override
	protected String[] getServletMappings() {
		// return을 배열로 주는 이유: 시작점을 여러개 등록하려고
		return new String[] {"/"};
	}
	

	@Override
	protected Filter[] getServletFilters() {
		// xml의 encoding filter를 가져옴
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter("UTF-8", true);
		return new Filter[] {encodingFilter};
	}
	
}
