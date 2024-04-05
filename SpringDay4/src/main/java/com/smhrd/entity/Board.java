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
@NoArgsConstructor //spring에서는 기본 생성자가 반드시 필요함, 기본으로 만들어주지않고, 이후에 set할때 필요!
public class Board {
	//VO = DTO
	private int idx;
	private String title;
	private String content;
	private String writer;
	private String indate;
	private int count;
	private String img;
}
