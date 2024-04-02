package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.entity.Board;

@Mapper
public interface BoardMapper {
	// 인터페이스라 구현체가 없지만, my batis의 sqlSessionFactoryBean에서 내부적으로, 자동적으로 구현체를 생성함
	// @Mapper라고 되어있으면서 root-context.xml의 mybatis-spring 베이스 패키지로 설정되어있어야 함
	// 추상 클래스는 단 하나만 상속할 수 있기때문에 여러개를 받아야 하는 mapper객체들은 모두 인터페이스여야함
	// 전체 보드 선택
	@Select("SELECT * FROM BOARD")
	public List<Board> selectAllBoards(); //myBatis가 자동으로 만들어주기때문에 method를 만들지 않아도 됨
	// 특정 게시글 선택
	@Select("SELECT * FROM BOARD WHERE IDX = #{idx}")
	public Board searchBoardByIdx(int idx);
	// 조회순(내림차순)
	@Select("SELECT * FROM BOARD ORDER BY COUNT DESC")
	public Board orderBoardByCount();
	// 조회수 올리기
	@Update("UPDATE BOARD SET COUNT = COUNT + 1 WHERE IDX = #{idx}")
	public void addCount(int idx);
	
	// 보드 작성
	@Insert("INSERT INTO BOARD(TITLE, CONTENT, WRITER, IMG) VALUES(#{title}, #{content}, #{writer}, #{img})")
	public void boardInsert(Board board);
	// 방금 작성한 보드 보여주기
	@Select("SELECT @rownum := @rownum + 1 AS ROWNUM, b.* FROM (SELECT * FROM BOARD WHERE WRITER = #{writer} ORDER BY INDATE DESC LIMIT 1) b, (SELECT @rownum := 0) rownum;")
	public Board justWrote(String writer);
	
	// 보드 삭제
	@Delete("DELETE FROM BOARD WHERE IDX = #{idx}")
	public void boardDelete(int idx);
	
	// 보드 수정
	@Update("UPDATE BOARD SET TITLE = #{title}, WRITER = #{writer}, CONTENT = #{content} WHERE IDX = #{idx}")
	public void boardUpdate(Board content);
}
