package com.example.work.board.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//페이지 보여주는 controller
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	// Main페이지 List로 매핑
	@RequestMapping(value = "/", method=RequestMethod.GET) 
	public String index(Model model) throws Exception{
		model.addAttribute("list", boardService.boardList());  //list 객체에 담기
		return "list"; // .jsp호출
	}
	
	// 게시판 list 조회
	@RequestMapping(value = "/board", method=RequestMethod.GET) 
	public String BoardList(Model model) throws Exception {
		model.addAttribute("list", boardService.boardList());  
		return "list"; // .jsp 호출 
	}
	
	// 게시글 조회 
	@RequestMapping(value = "/board/{idx}", method=RequestMethod.GET)
	public String boardDetail(@PathVariable int idx, Model model) throws Exception{
		model.addAttribute("board", boardService.readBoard(idx));
		boardService.hitIncrease(idx); //조회수 증가
		return "read"; //.jsp호출
	}
	
	// 글쓰기 jsp
	@RequestMapping(value = "/board/post", method=RequestMethod.GET) 
	public String boardWrite() throws Exception {
		return "write"; 
	}

	// 수정할 게시글 보이기 
	@RequestMapping(value = "/board/post/{idx}", method=RequestMethod.GET)
	public String updateBoard(@PathVariable("idx") int idx, Model model) throws Exception {
		model.addAttribute("read", boardService.readBoard(idx));
		return "modify"; //.jsp호출
	}
}