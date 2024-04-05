package com.smhrd.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.Member;

@Mapper
public interface memberMapper {
	// 가입
	@Insert("INSERT INTO MEMBER(ID, PW, NICK) VALUES(#{id}, #{pw}, #{nick})")
	public void memberInsert(Member member);
	// 로그인
	@Select("SELECT ID, PW, NICK FROM MEMBER WHERE ID=#{id}") //암호화 되어있어서 일치 여부 확인이 어렵기 때문
	public Member memberLogin(Member member);
}
