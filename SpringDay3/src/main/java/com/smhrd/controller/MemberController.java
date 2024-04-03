package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.Member;
import com.smhrd.mapper.memberMapper;

@Controller
public class MemberController {
	
	// new 안만들어도 자동으로 생성되게
	// 인터페이스라 구현체가 없지만, my batis의 sqlSessionFactoryBean에서 내부적으로, 자동적으로 구현체를 생성함 
	@Autowired
	private memberMapper mapper;
	
	//--------------------------------------------------------
	//이동 페이지
	//회원가입 페이지로 이동
	@RequestMapping("/joinForm")
	public String toJoinForm() {
		return "joinForm";
	}
	
	//로그인 페이지로 이동
	@RequestMapping("/loginForm")
	public String toLoginForm() {
		return "loginForm";
	}

	//--------------------------------------------------------
	//회원가입
	@RequestMapping("/join")
	public String join(Member member) {
		System.out.println("가입 요청");
		System.out.println("MemberController >> join");
		mapper.memberInsert(member);
		return "redirect:/";
	}
	//로그인
	@RequestMapping("/login")
	public String login(Member member, HttpSession session) {
		System.out.println("로그인 요청");
		System.out.println("MemberController >> login");
		Member loginSession = mapper.memberLogin(member);
		if (loginSession!=null) {			
			session.setAttribute("loginSession", loginSession);
			return "redirect:/";
		}else {			
			return "loginForm";
		}
	}
	//회원가입
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 요청");
		System.out.println("MemberController >> logout");
		session.removeAttribute("loginSession");
		return "redirect:/";
	}
}
