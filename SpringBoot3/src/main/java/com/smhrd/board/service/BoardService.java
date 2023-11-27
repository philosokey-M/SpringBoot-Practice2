package com.smhrd.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.board.entity.Board2;
import com.smhrd.board.mapper.BoardMapper;


@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	
	public void boardInsert(Board2 board2) {
		boardMapper.boardInsert(board2);
		
	}


	public List<Board2> boardList() {

		return boardMapper.boardList();
	}





	public Board2 showBoardDetail(int num) {

		return boardMapper.showBoardDetail(num);
	}





}
