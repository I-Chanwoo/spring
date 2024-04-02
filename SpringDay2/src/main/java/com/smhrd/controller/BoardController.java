package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.entity.Board;
import com.smhrd.mapper.BoardMapper;

// SPRING 02
@Controller
public class BoardController {
	
	// new 안만들어도 자동으로 생성되게
	// 인터페이스라 구현체가 없지만, my batis의 sqlSessionFactoryBean에서 내부적으로, 자동적으로 구현체를 생성함 
	@Autowired
	private BoardMapper mapper;
	
	//켰을때 main 페이지로 가게하는 메소드
	@RequestMapping("/")
	public String main(){
		System.out.println("프로젝트 시작");
		return "main";
	}
	
	// boardList url에서 요청이 들어왔다면 아래 비동기 메소드 실행
	@RequestMapping("/boardList")
	public @ResponseBody List<Board> boardList(Model model) {
		System.out.println("전체 게시글 보내기");
		System.out.println("controller >> BoardController >> boardList()");
		
		//게시글 보내기
		return mapper.selectAllBoards();
	}
	
	//post 방식으로 인자 가져옴
	@RequestMapping("/boardInsert")
	public @ResponseBody void boardInsert(HttpServletRequest request, Model model) {
	//public String boardInsert(@RequestBody String title, @RequestBody String content, Model model) {
		System.out.println("게시글 작성");
		System.out.println("controller >> BoardController >> boardInsert()");
		
		//가져오는 객체
		MultipartRequest multi = null;
		
		int fileMaxSize = 10*1024*10000; //최대 파일 크기
		String path = request.getRealPath("resources/board"); // 자료 넣는 폴더의 절대 경로 추출
		DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy(); // 중복처리
		String enc = "UTF-8"; // 인코딩
		
		
		try {
			System.out.println("폴더 절대 경로: "+ path);
			multi = new MultipartRequest(request, path, fileMaxSize, enc, dfrp);			
		}
		catch(IOException e){
			e.printStackTrace();
		}
		
		//form에 입력된 값 가져오기
		String title= multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer= multi.getParameter("writer");
		String img = multi.getFilesystemName("img");
		
		Board board = new Board();
		board.setTitle(title);
		board.setContent(content);
		board.setWriter(writer);
		board.setImg(img);
		
		board.toString();
		
		mapper.boardInsert(board);
		Board justWrote = mapper.justWrote(writer);
		
		System.out.println("이동 경로: redirect:/boardContent?idx="+String.valueOf(justWrote.getIdx()));
	};
	

//	//get 방식으로 인자 가져옴
//	@RequestMapping("/boardContent")
//	public String searchBoardByIdx(@RequestParam("idx") int idx, Model model) {
//		System.out.println("게시글 조회");
//		System.out.println("controller >> BoardController >> searchBoardByIdx()");
//		Board content = mapper.searchBoardByIdx(idx);//게시글 정보 가져오기
//		mapper.addCount(idx);//조회수 올리기
//		//한 페이지에서만 사용하는 것이기에 모델에 저장함
//		model.addAttribute("content", content); //object로 업캐스팅
//		return "boardContent";
//	}
//	
//	//보드 작성
//	//forward 방식으로 이동 -> 데이터를 입력할떄 리다이렉트 조회할떄 포워딩
//	@RequestMapping("/boardForm")
//	public String boardForm() {
//		return "boardForm";
//	}
//	//post 방식으로 인자 가져옴
//	@RequestMapping("/boardInsert")
//	public String boardInsert(HttpServletRequest request, Model model) {
//	//public String boardInsert(@RequestBody String title, @RequestBody String content, Model model) {
//		System.out.println("게시글 작성");
//		System.out.println("controller >> BoardController >> boardInsert()");
//		
//		//가져오는 객체
//		MultipartRequest multi = null;
//		
//		int fileMaxSize = 10*1024*10000; //최대 파일 크기
//		String path = request.getRealPath("resources/board"); // 자료 넣는 폴더의 절대 경로 추출
//		DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy(); // 중복처리
//		String enc = "UTF-8"; // 인코딩
//		
//		
//		try {
//			System.out.println("폴더 절대 경로: "+ path);
//			multi = new MultipartRequest(request, path, fileMaxSize, enc, dfrp);			
//		}
//		catch(IOException e){
//			e.printStackTrace();
//		}
//		
//		//form에 입력된 값 가져오기
//		String title= multi.getParameter("title");
//		String content = multi.getParameter("content");
//		String writer= multi.getParameter("writer");
//		String img = multi.getFilesystemName("img");
//		
//		Board board = new Board();
//		board.setTitle(title);
//		board.setContent(content);
//		board.setWriter(writer);
//		board.setImg(img);
//		
//		board.toString();
//		
//		mapper.boardInsert(board);
//		Board justWrote = mapper.justWrote(writer);
//		
//		System.out.println("이동 경로: redirect:/boardContent?idx="+String.valueOf(justWrote.getIdx()));
//		return "redirect:/boardContent?idx="+String.valueOf(justWrote.getIdx());
//	};
//	
//	
//	//get 방식으로 인자 가져옴
//	@RequestMapping("/boardDelete")
//	public String boardDelete(@RequestParam("idx") int idx, Model model) {
//		System.out.println("게시글 삭제");
//		System.out.println("controller >> BoardController >> boardDelete()");
//		mapper.boardDelete(idx);
//		
//		return "redirect:/boardList";
//	}
//	
//	//게시글 수정
//	@RequestMapping("/boardUpdateForm")
//	public String boardUpdateForm(@RequestParam("idx") int idx, Model model){
//		
//		Board content= mapper.searchBoardByIdx(idx);
//		model.addAttribute("content", content);
//		return "boardUpdateForm";
//	}
//	@RequestMapping("/boardUpdate")
//	public String boardUpdate(Board content) {
//		System.out.println("게시글 수정");
//		System.out.println("controller >> BoardController >> boardUpdate()");
//		System.out.println("받아온 값: "+content.toString());
//		mapper.boardUpdate(content);
//		
//		return "redirect:/boardContent?idx="+String.valueOf(content.getIdx());
//	}
	
}