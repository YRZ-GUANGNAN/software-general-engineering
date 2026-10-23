# WorkBuddy 商业化技能升级 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将软件通用工程技能升级为有明确商业定位、WorkBuddy 元数据完整、可验证且可上传的发布包。

**Architecture:** 根 `SKILL.md` 兼容通用 Agent Skills，`workbuddy/SKILL.md` 适配开放平台，二者读取同一份 `references/engineering-workflow.md`；确定性脚本只打包 WorkBuddy 入口和共享 references。

**Tech Stack:** Markdown, YAML frontmatter, JSON, PowerShell `Compress-Archive`, Git。

---

### Task 1: 升级技能入口与展示元数据

**Files:**
- Modify: `C:\Users\33141\Documents\software-general-engineering\SKILL.md`
- Create: `C:\Users\33141\Documents\software-general-engineering\workbuddy\SKILL.md`
- Create: `C:\Users\33141\Documents\software-general-engineering\references\engineering-workflow.md`

- [x] 根入口使用标准 `metadata`，WorkBuddy 入口使用平台要求的顶层字段，保留 `name` 与原有触发边界。
- [x] 将正文整理为高密度的研发交付闭环，保留契约、权限、幂等、金额、迁移和证据分级规则。
- [x] 增加 WorkBuddy 触发词和“不适用”边界，避免简单问答被误触发。

### Task 2: 增加示例与发布说明

**Files:**
- Create: `C:\Users\33141\Documents\software-general-engineering\references\usage-examples.md`
- Modify: `C:\Users\33141\Documents\software-general-engineering\README.md`
- Create: `C:\Users\33141\Documents\software-general-engineering\scripts\build-workbuddy-package.ps1`

- [x] 写入三个真实可复用场景：跨端功能、收费订单接线、候选版本上线判断。
- [x] 每个场景同时写清输入、技能动作、交付物和未覆盖边界，不使用虚构指标。
- [x] README 补充 WorkBuddy 元数据、ZIP 结构、安装与商业化状态说明。

### Task 3: 验证、打包和发布

**Files:**
- Create: `C:\Users\33141\Documents\Codex\2026-10-23\q-2\outputs\software-general-engineering-workbuddy-v1.1.0.zip`

- [x] 运行 `quick_validate.py` 与 YAML/JSON 解析检查。
- [x] 对现有 `evals/evals.json` 做三场景回归审查并记录结果到 `work/software-general-engineering-evolve/round-1/`。
- [x] 生成根目录含 `SKILL.md` 的 ZIP，检查包内文件清单和敏感文件排除情况。
- [x] 仅暂存本次文件，提交中文 commit，并普通推送到 `origin/main`。
- [x] 推送后核对远端 SHA；WorkBuddy 最终发布按钮前保留给用户确认，避免把“上传包已准备”误报成“已上架”。
