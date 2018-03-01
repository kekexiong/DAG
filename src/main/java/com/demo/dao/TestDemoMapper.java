package com.demo.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by hupengfei on 2018/3/1.
 */
public interface TestDemoMapper {
    List<Map<String, Object>> findByCondition();
}
