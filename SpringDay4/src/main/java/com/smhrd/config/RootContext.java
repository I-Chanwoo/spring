package com.smhrd.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/* RootContext 역할
 * 1. DB 커넥션 정보(히카리)
 * 2. 히카리 정보 읽기
 * 3. jdbc 구현해서 실행
 * 4. 매퍼 스캔
 */

@Configuration
@MapperScan(basePackages = {"com.smhrd.mapper"})
public class RootContext {

	// sqlFactoryBean이 자동으로 찾을 수 있도록 bean화
	// bean은 스프링 실행과 동시에 대기상태로 전환
	@Bean
	public DataSource myDataSource() {
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName("com.mysql.jdbc.Driver");
		hikariConfig.setJdbcUrl("jdbc:mysql://localhost:3306/com");
		hikariConfig.setUsername("com");
		hikariConfig.setPassword("com01");

		HikariDataSource dataSource = new HikariDataSource(hikariConfig);
		return dataSource;
	}

	@Bean
	public SqlSessionFactory sessionFactory() throws Exception {
		
		SqlSessionFactoryBean sqlSession = new SqlSessionFactoryBean();
		sqlSession.setDataSource(myDataSource());
		return (SqlSessionFactory)sqlSession.getObject();

	}
}