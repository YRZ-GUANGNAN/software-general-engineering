# WorkBuddy 商业化技能升级设计

## 目标

将现有 `software-general-engineering` 升级为可在 WorkBuddy 开放平台展示和售卖的「软件通用工程｜AI 研发交付与质量验收」技能，同时保留原有 `$software-general-engineering` 调用名、工程边界和证据分级能力。

## 设计

1. 仓库根 `SKILL.md` 保持通用 Agent Skills 兼容；`workbuddy/SKILL.md` 提供 WorkBuddy 所需的描述、版本、作者、分类和中英文展示元数据。
2. 将共享正文放入 `references/engineering-workflow.md`，组织为“定位 → 基线与契约 → 闭环执行 → 分层验收 → 交付发布 → 状态语言”的高密度工作流，两个入口读取同一规则。
3. 增加一份可复现的使用场景参考，覆盖功能开发、收费业务接线和上线判断，帮助用户理解技能能交付什么、不能替代什么。
4. 更新 README，说明 WorkBuddy 包结构、安装方式、版本和当前验证边界；保留原有 references 与 evals。
5. 使用确定性脚本生成根目录包含 WorkBuddy 入口 `SKILL.md` 与共享 `references/` 的发布 ZIP，并在推送后核验 GitHub 远端提交。WorkBuddy 的实名认证、微信签约、定价和最终上架提交属于平台操作，不在仓库提交中伪造完成。

## 验收

- `quick_validate.py` 通过，YAML/JSON 和相对引用可解析。
- 运行现有 3 个行为场景的静态回归审查，确认不越权、不把旧证据当新证据、不混淆发布状态。
- 检查 ZIP 内含 `SKILL.md` 与 `references/`，不含 `.git`、凭证、评估草稿或临时文件。
- 推送后远端 `main` 指向本轮提交；平台上架状态仅在 WorkBuddy 页面显示成功后报告。
