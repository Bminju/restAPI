package com.example.work.board.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.work.board.model.BoardDAO;
import com.example.work.board.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	BoardService boardService;
	
	//게시글 List
	@Override
	public List<BoardVO> boardList() throws SQLException {
		List<BoardVO> boardList = boardDAO.boardList();
		return boardList;
	}
	//게시글 db저장
	@Override
	public int insertBoard(BoardVO boardVO) throws SQLException {
		int cnt = boardDAO.insertBoard(boardVO);
		return cnt;
	}
	//게시글 조회
	@Override
	public BoardVO readBoard(Integer idx) throws SQLException {
		BoardVO boardVO = boardDAO.readBoard(idx);
		return boardVO;
	}
	//조회수 증가 
	@Override
	public int hitIncrease(Integer idx) throws SQLException{
		return boardDAO.hitIncrease(idx);
	}
	//게시글 수정
	@Override
	public int updateBoard(BoardVO boardVO) throws SQLException {
		int cnt = boardDAO.updateBoard(boardVO);
		return cnt;
	}
	//게시글 삭제 
	@Override
	public int deleteBoard(Integer idx) throws SQLException {
		int cnt = boardDAO.deleteBoard(idx);
		return cnt;
	}
}
