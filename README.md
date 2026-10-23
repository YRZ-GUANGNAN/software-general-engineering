# 软件通用工程｜AI 研发交付与质量验收

面向 WorkBuddy、Codex 及兼容 Agent Skills 的工程交付技能。它把需求梳理、契约保护、跨层实施、分级验收和发布收口组织成一套可复核的方法，适合复杂功能、接口接线、线上问题、上线准备和交付复盘。

调用名：`$software-general-engineering`

## 核心价值

- 保护已有改动、接口契约、权限、状态机、金额精度和迁移边界。
- 从真实入口推进到可观察结果，避免只完成页面、接口或演示旁路。
- 区分自动化、本地、集成、设备、审核和发布后证据。
- 用 `PASS`、`FAIL`、`BLOCKED`、`NOT_RUN`、`PENDING` 精确收口。

## 适用场景

- 在已有软件项目中完成多步骤开发或跨端功能。
- 接入 API、支付、消息、审核、身份或外部服务。
- 整理半成品系统，优先补齐一个可使用的业务闭环。
- 审查候选版本是否具备上线条件。
- 交付时区分代码完成、真实集成、设备验收、平台审核与正式发布。

## 仓库内容

| 文件 | 用途 |
| --- | --- |
| [SKILL.md](SKILL.md) | 通用 Agent Skills 入口与触发边界 |
| [WorkBuddy 入口](workbuddy/SKILL.md) | 开放平台所需的发布元数据 |
| [工程工作流](references/engineering-workflow.md) | 两个平台共用的完整执行方法 |
| [验收清单](references/acceptance-checklist.md) | 按风险选择验证并解释证据边界 |
| [使用场景](references/usage-examples.md) | 三个典型任务的输入、动作和交付结果 |
| [报告模板](references/report-template.md) | 交付、阻断、根因和残留的记录方式 |
| [行为场景](evals/evals.json) | 检查边界、契约与证据判断的回归场景 |
| [界面元数据](agents/openai.yaml) | 显示名、简介和默认调用提示 |

## 在 WorkBuddy 中使用

仓库根入口遵循通用 Agent Skills 元数据格式；`workbuddy/SKILL.md` 是开放平台适配入口。两者共用 `references/engineering-workflow.md`，避免执行规则分叉。

使用发布脚本生成根目录含 `SKILL.md` 与 `references/` 的 WorkBuddy ZIP：

```powershell
.\scripts\build-workbuddy-package.ps1 -OutputPath .\software-general-engineering-workbuddy-v1.1.0.zip
```

发布版本为 `1.1.0`，分类为 `coding`，作者为 `YRZ-GUANGNAN`。

安装后可以这样调用：

```text
使用 $software-general-engineering 完成这次修改。先核对已有改动和接口契约，再实施、验证，并分别说明代码、集成、设备和发布状态。
```

也可将 GitHub 仓库交给支持 Agent Skills 的工具安装：

```text
从 https://github.com/YRZ-GUANGNAN/software-general-engineering 安装“软件通用工程”到我的个人技能目录。
```

## 商业化与证据边界

本仓库提供的是技能内容与可上传包。WorkBuddy 的开发者认证、收入变现签约、定价、平台审核和正式上架由开放平台完成；仓库推送或 ZIP 生成不等于平台已上架，也不代表已经产生收入。

结构校验、YAML/JSON 解析、名称一致性和相对引用会在每次发布前检查。行为测试的预期结果只有实际执行后才能记录为通过。
