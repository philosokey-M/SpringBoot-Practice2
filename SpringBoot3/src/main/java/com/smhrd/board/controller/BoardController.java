package com.smhrd.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.board.entity.Board2;
import com.smhrd.board.service.BoardService;


@Controller
public class BoardController {

		@Autowired
		private BoardService boardService;
	
	
	   @RequestMapping("/")
	   public String welcom() {
	      
	      return "redirect:/boardList.do";
	      
	   }
	   
	   @RequestMapping("boardWrite.do")
	   public String boardWrite() {
		   
		   return "BoardWrite";
	   }
	   
	   // @RequestPart("name") : multipart/form-data에 특화된 annotation
	   @RequestMapping("boardInsert.do")
	   public String boardInsert(Board2 board2, @RequestPart("file") MultipartFile file ) {
//		   System.out.println(board2.getConetent());
//		   System.out.println(board2.getTitle());
//		   System.out.println(board2.getWriter());
		   System.out.println(file.getOriginalFilename());
		  
		   // 파일명 중복 제거 하기 위해 랜덤 문자열 생성
		   String ranString = UUID.randomUUID().toString();
		   System.out.println(ranString);
		   
		   String newFileName =ranString+file.getOriginalFilename();
		   
		   try {
			   //파일 형태로 만들어서 지정된 경로에 저장
			   // 경로 지정 -> application.properties
			file.transferTo(new File(newFileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		   
		   // 중복제거 된 파일명을 저장하기위해 setter 사용해서 변경
		   board2.setFilename(newFileName);
		   boardService.boardInsert(board2);
		   
		   
		   return "redirect:/boardList.do";
	   }
	   
		@RequestMapping("boardList.do")
		public String boardList(Model model) {
			List<Board2>board_list =boardService.boardList();
							
			model.addAttribute("board_list",board_list);
			return "BoardMain";
		}
		
		@RequestMapping("boardDetail.do")
		public String showBoardDetail(@RequestParam int num, Model model) {
			Board2 board2 = boardService.showBoardDetail(num);
			
			String filePath = "C:\\Users\\smhrd\\Desktop\\SpringBoot\\SpringBoot3\\src\\main\\resources\\static\\img"+ board2.getFilename();
			
			model.addAttribute("board",board2);
			return "BoardDetail";
		}
	   
}
