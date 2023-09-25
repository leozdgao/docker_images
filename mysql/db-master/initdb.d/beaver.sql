-- beaver 数据库初始化脚本

-- 任务主表
CREATE TABLE IF NOT EXISTS tasks (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    gmt_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    scope VARCHAR(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '所属域',
    task_type VARCHAR(64) NOT NULL COMMENT '任务编码',
    task_status BIT(16) NOT NULL COMMENT '任务状态',
    payload LONGTEXT COMMENT '任务输入',
    result LONGTEXT COMMENT '任务结果',
    extra LONGTEXT COMMENT '任务扩展字段',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- 任务主表索引
CREATE INDEX idx_task_scope_gmt_create ON tasks (scope, gmt_create);
CREATE INDEX idx_task_type ON tasks (task_type);
CREATE INDEX idx_task_status ON tasks (task_status);
