# ImgLdr Constitution

## Core Principles

### I. Test-Driven Development (NON-NEGOTIABLE)
**TDD is mandatory for all code changes**: Tests written → User approved → Tests fail → Then implement; Red-Green-Refactor cycle strictly enforced. All new features must have comprehensive test coverage before implementation begins. Test coverage must maintain minimum 80% threshold across all modules.

### II. Code Quality Standards
**Zero tolerance for quality violations**: All code must pass golangci-lint with zero warnings. Code must follow Go best practices, maintain cyclomatic complexity ≤ 10, and include comprehensive documentation. All public APIs must have godoc comments following Go documentation standards.

### III. Performance Excellence
**Performance is a feature, not an afterthought**: All code must meet performance benchmarks. Memory allocations must be minimized, and critical paths must complete within defined SLA targets. Performance regression tests are mandatory for any changes affecting core functionality.

### IV. User Experience Consistency
**Consistent, intuitive interfaces**: All user-facing components must follow established patterns. CLI interfaces must provide clear, actionable error messages and comprehensive help documentation. API responses must be consistent in structure and error handling.

### V. Security by Design
**Security is built-in, not bolted-on**: All code must pass security scans (gosec, govulncheck). No hardcoded secrets, proper input validation, and secure coding practices are mandatory. Security vulnerabilities must be addressed within 24 hours of discovery.

## Code Quality Requirements

### Linting and Formatting
- **golangci-lint**: Must pass with zero warnings using configured rules
- **Code formatting**: gofumpt, golines (120 char limit), gci import organization
- **Documentation**: godot for comment formatting, comprehensive godoc coverage
- **Error handling**: errcheck, errchkjson for proper error management
- **Code complexity**: gocyclo (≤10), lll (120 char lines), prealloc for efficiency

### Testing Standards
- **Unit tests**: Minimum 80% coverage, race condition testing enabled
- **Integration tests**: All external dependencies must have integration test coverage
- **E2E tests**: Critical user workflows must have end-to-end test coverage
- **Benchmark tests**: Performance-critical code must include benchmarks
- **Test organization**: Tests must be organized by type (unit/integration/e2e)

### Performance Requirements
- **Memory efficiency**: Minimize allocations, use object pooling where appropriate
- **CPU efficiency**: Profile critical paths, optimize hot code paths
- **Concurrency**: Proper use of goroutines, avoid race conditions
- **Resource management**: Proper cleanup of resources, connection pooling
- **Monitoring**: Structured logging for performance observability

## User Experience Standards

### CLI Interface Design
- **Consistent command structure**: Follow established patterns for subcommands
- **Clear error messages**: Actionable error messages with suggested fixes
- **Help documentation**: Comprehensive help for all commands and flags
- **Output formatting**: Consistent JSON and human-readable output formats
- **Exit codes**: Proper exit codes following Unix conventions

### API Design
- **RESTful principles**: Follow REST conventions for HTTP APIs
- **Consistent response format**: Standardized JSON response structure
- **Error handling**: Consistent error response format with proper HTTP status codes
- **Versioning**: Clear API versioning strategy
- **Documentation**: OpenAPI/Swagger documentation for all endpoints

## Development Workflow

### Pre-commit Requirements
- **Pre-commit hooks**: All code must pass pre-commit checks before commit
- **Code formatting**: Automatic formatting via gofumpt, golines
- **Linting**: golangci-lint must pass with zero warnings
- **Security scanning**: gosec and govulncheck must pass
- **Test execution**: All tests must pass before commit

### Code Review Process
- **Mandatory reviews**: All changes require at least one approval
- **Quality gates**: Code must pass all quality checks before merge
- **Performance review**: Performance-critical changes require performance review
- **Security review**: Security-related changes require security team review
- **Documentation review**: API changes require documentation updates

### CI/CD Pipeline
- **Automated testing**: Unit, integration, and E2E tests run on every PR
- **Quality gates**: Build fails if any quality checks fail
- **Security scanning**: Automated security vulnerability scanning
- **Performance testing**: Automated performance regression testing
- **Deployment**: Automated deployment with rollback capabilities

## Governance

### Constitution Authority
This constitution supersedes all other development practices and guidelines. All team members must comply with these principles. Violations of constitutional requirements will result in mandatory code review and potential rejection of changes.

### Amendment Process
Constitutional amendments require:
1. **Documentation**: Clear justification for the change
2. **Team approval**: Consensus from the development team
3. **Migration plan**: Detailed plan for implementing changes
4. **Impact assessment**: Analysis of impact on existing codebase

### Compliance Verification
- **All PRs**: Must verify compliance with constitutional requirements
- **Code reviews**: Must check adherence to quality standards
- **Complexity justification**: Any complexity must be documented and justified
- **Performance impact**: All changes must consider performance implications

**Version**: 1.0.0 | **Ratified**: 2025-01-27 | **Last Amended**: 2025-01-27