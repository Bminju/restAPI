package com.example.work.board.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	
	// 게시글 List
	public List<BoardVO> boardList() throws SQLException;

	// 게시글 카운트 
	public int selectBoardTotal(BoardVO boardVO) throws SQLException;

	// 글쓰기
	public int insertBoard(BoardVO boardVO) throws SQLException;
	
	// 게시글 조회
	public BoardVO readBoard(int idx) throws SQLException;
	
	// 조회수 증가
	public int hitIncrease(Integer idx) throws SQLException;
	
	// 게시글 수정 
	public int updateBoard(BoardVO boardVO) throws SQLException;
	
	// 게시글 삭제 
	public int deleteBoard(Integer idx) throws SQLException;
}
