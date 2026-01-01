<!--
 Copyright 2025 Dimitri Koshkin. All rights reserved.
 SPDX-License-Identifier: Apache-2.0
 -->

<!--
Sync Impact Report
- Version change: unversioned (template) → 1.0.0
- Modified principles: PRINCIPLE_1_NAME → I. Code Quality Is Non-Negotiable; PRINCIPLE_2_NAME → II. Tests Prove Behavior; PRINCIPLE_3_NAME → III. Consistent User Experience; PRINCIPLE_4_NAME → IV. Performance Budgets Are Part of Design
- Added sections: Quality and Performance Standards; Development Workflow & Review
- Removed sections: Core Principles placeholder for Principle 5 (not requested)
- Templates requiring updates: ✅ .specify/templates/plan-template.md; ✅ .specify/templates/spec-template.md; ✅ .specify/templates/tasks-template.md
- Follow-up TODOs: 12-31-2025: original adoption date not found
-->
# imgldr Constitution

## Core Principles

### I. Code Quality Is Non-Negotiable
All code MUST be idiomatic Go, lint/format clean, and readable without
undocumented shortcuts. Errors MUST be handled explicitly, public APIs MUST be
documented, and temporary scaffolding (TODOs, debug logs) MUST be removed
before merge. Rationale: quality defaults prevent template drift and reduce
maintenance cost.

### II. Tests Prove Behavior
Every change MUST include tests that validate the new or altered behavior.
Bug fixes MUST include a regression test that fails before the fix. Unit tests
cover pure logic; integration tests cover filesystem, network, or CLI I/O
boundaries. Rationale: the template is reused across projects, so behavior must
be demonstrably correct.

### III. Consistent User Experience
CLI flags, exit codes, output formats, and error messages MUST be consistent and
backwards compatible. When change is unavoidable, provide a deprecation path and
update all user-facing docs and help output together. Rationale: users rely on
stable interfaces across releases and downstream automation.

### IV. Performance Budgets Are Part of Design
Each feature MUST declare latency, throughput, and memory budgets in its spec.
Changes MUST not regress established benchmarks; hot paths require benchmarks or
profiling evidence. Rationale: predictable performance is a core expectation for
systems tooling.

## Quality and Performance Standards

- Tests MUST run in CI with no skipped or quarantined cases.
- Performance measurements MUST be recorded for hot paths and compared across
  changes when benchmarks exist.
- UX consistency checks MUST validate CLI flags, output schema, and exit codes
  against the documented contract.

## Development Workflow & Review

- All changes go through PR review with explicit Constitution Check notes.
- CI MUST pass lint, unit tests, integration tests, and relevant benchmarks
  before merge.
- Documentation updates are REQUIRED whenever user-facing behavior changes.

## Governance

- This constitution supersedes conflicting local practices and templates.
- Amendments require a documented proposal, reviewer approval, and an updated
  version with rationale.
- Versioning follows semantic versioning: MAJOR for breaking governance changes,
  MINOR for new or expanded rules, PATCH for clarifications.
- Every PR MUST include a Constitution Check; periodic audits verify ongoing
  compliance.

**Version**: 1.0.0 | **Ratified**: 12-31-2025: original adoption date not found | **Last Amended**: 2025-12-31
