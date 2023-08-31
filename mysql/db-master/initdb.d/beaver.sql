-- beaver 数据库初始化脚本

-- 任务主表
CREATE TABLE IF NOT EXISTS tasks (
    id BIGINT NOT NULL COMMENT '主键',
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    task_code VARCHAR(64) NOT NULL COMMENT '任务编码',
    task_status BIT(16) NOT NULL COMMENT '任务状态',
    payload LONGTEXT COMMENT '任务输入',
    result LONGTEXT COMMENT '任务结果',
    extra LONGTEXT COMMENT '任务扩展字段',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- 任务主表索引
CREATE INDEX idx_task_code ON tasks (task_code);
CREATE INDEX idx_task_status ON tasks (task_status);
