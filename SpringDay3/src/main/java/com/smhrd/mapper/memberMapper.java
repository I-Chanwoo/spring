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
	@Select("SELECT ID, NICK FROM MEMBER WHERE ID=#{id} AND PW =#{pw}")
	public Member memberLogin(Member member);
}
