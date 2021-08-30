package com.example.work.board.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.work.board.model.BoardVO;


@RestController
public class BoardRestController {
	
	@Autowired
	BoardService boardService;
	
	//게시글 쓰기 - DB저장 
	@RequestMapping(value = "/board/post", method=RequestMethod.POST)
	public void insertBoard(@RequestBody BoardVO board) throws Exception {
		boardService.insertBoard(board);
	}
	
	//게시글 수정 - DB저장
	@RequestMapping(value = "/board/post/{idx}", method=RequestMethod.PATCH)
	public void update(@RequestBody BoardVO board) throws Exception {
		boardService.updateBoard(board);
	}
	
	//게시글 삭제 
	@RequestMapping(value="board/post/{idx}", method=RequestMethod.DELETE)
	public void deleteBoard(@PathVariable int idx) throws Exception {
		boardService.deleteBoard(idx);
	}
	
	//ajax - 게시글 비밀번호 일치여부 확인 
	@RequestMapping(value = "/check/{idx}", method=RequestMethod.POST)
	public String checkPwd(@PathVariable int idx, @RequestParam("pw") String pw)  throws Exception {
		if(pw.equals(boardService.readBoard(idx).getPw())) {
			return "true";
		}else {
			return "false";
		}
	}
}
