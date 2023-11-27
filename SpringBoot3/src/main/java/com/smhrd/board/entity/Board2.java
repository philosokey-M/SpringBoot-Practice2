package com.smhrd.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board2 {

	private int num;
	private String title;
	private String writer;
	private String filename;
	private String content;
	private String b_date;
	
	
}
