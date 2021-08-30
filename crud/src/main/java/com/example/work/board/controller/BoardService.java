package com.example.work.board.controller;

import java.sql.SQLException;
import java.util.List;
import com.example.work.board.model.BoardVO;

public interface BoardService {
	
	// List
	public List<BoardVO> boardList() throws SQLException;
	// 게시글 저장
	public int insertBoard(BoardVO boardVO) throws SQLException;
	// 게시글 조회
	public BoardVO readBoard(Integer idx) throws SQLException;
	// 조회수 증가 
	public int hitIncrease(Integer idx) throws SQLException;
	//게시글 수정 
	public int updateBoard(BoardVO boardVO) throws SQLException;
	//게시글 삭제
	public int deleteBoard(Integer idx) throws SQLException;
	
}
