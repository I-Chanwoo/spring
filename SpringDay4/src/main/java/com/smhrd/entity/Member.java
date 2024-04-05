package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString //DTO 안에 있는 값을 콘솔에 찍어보기 편리함
@AllArgsConstructor
@NoArgsConstructor //spring에서는 기본 생성자가 반드시 필요함
public class Member {
	private String id = null;
	private String pw = null;
	private String nick = null;
}
