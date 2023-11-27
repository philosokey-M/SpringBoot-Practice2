package com.smhrd.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.board.entity.Board2;

@Mapper
public interface BoardMapper {

	
	@Insert("insert into board2 values(default,#{title},#{writer},#{filename},#{content},default)")
	public void boardInsert(Board2 board2);

	@Select("select * from board2")
	public List<Board2> boardList();

	@Select("select * from board2 where num=#{num}")
	public Board2 showBoardDetail(int num);

}
