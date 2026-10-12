# 软件通用工程

一个独立维护的工程交付 skill，将需求梳理、契约保护、分层实现、真实验收和可追溯交付组织成可复用的方法。

调用名：`$software-general-engineering`

## 适用场景

- 在已有软件项目中完成多步骤开发或跨端功能。
- 整理半成品系统，优先补齐一个可使用的业务闭环。
- 修改接口、权限、状态或数据时保护既有契约和用户改动。
- 准备发布，区分代码检查、本地运行、真实集成、设备验收和部署结果。

该方法沿用目标项目已有架构、技术栈和工具，按实际风险选择检查；简单编辑无需执行完整流程。

## 内容

| 文件 | 用途 |
| --- | --- |
| [SKILL.md](SKILL.md) | 核心流程、适用边界和执行要求 |
| [agents/openai.yaml](agents/openai.yaml) | 中文显示名和默认调用提示 |
| [验收清单](references/acceptance-checklist.md) | 按改动风险选择验证，解释证据边界 |
| [报告模板](references/report-template.md) | 交付、阻断、根因和残留的记录方式 |
| [测试场景](evals/evals.json) | 3 个用于检查任务边界和证据判断的场景 |

## 使用

本仓库根目录就是 skill 包。安装到个人技能目录时保留目录名 `software-general-engineering`，并保留 `SKILL.md`、`agents/`、`references/` 和 `evals/` 的相对位置。无需把本仓库加入业务项目。

可以将这个仓库链接交给支持 skill 安装的 agent，请它安装到个人技能目录：

```text
从 https://github.com/YRZ-GUANGNAN/software-general-engineering 安装“软件通用工程”到我的个人技能目录。
```

私有仓库需要有访问权限的 GitHub 账号。创建或克隆本仓库本身不等于已完成个人技能安装。

安装并被发现后，可在目标项目中调用：

```text
使用 $software-general-engineering 完成这次修改，先核对现有契约，再实施和验证，并说明哪些验收尚未完成。
```

## 验证状态

结构校验、YAML/JSON 解析、名称一致性和相对引用检查已通过。附带的 3 个行为测试场景尚未运行独立评估；预期结果不代表实际测试已经通过。

该 skill 是执行方法，不承诺特定项目已经通过验收，也不自动授予部署、数据库修改或向他人发送消息的权限。
