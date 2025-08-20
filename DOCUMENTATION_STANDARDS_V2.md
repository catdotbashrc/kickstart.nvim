# Documentation Standards for Personal Projects
> Combining NASA's rigorous documentation practices with the Diataxis framework for comprehensive yet practical documentation

## Executive Summary

This standard combines NASA's systematic documentation approach with the Diataxis framework's user-centered design, adapted for personal and open-source projects. It provides a scalable system that grows with your project while maintaining professional documentation quality.

## Core Principles

### From NASA Standards
1. **Structured Documentation Trees** - Clear hierarchical organization
2. **Tailoring Philosophy** - Balance between completeness and practicality
3. **Status Tracking** - Always know what's complete, pending, or not applicable
4. **Traceability** - Cross-references and clear relationships between documents
5. **Progressive Disclosure** - Rollout mechanism for complex documentation

### From Diataxis Framework
1. **Four Distinct Modes** - Tutorials, How-To Guides, Reference, Explanation
2. **User Journey Focus** - Documentation that matches user needs at different stages
3. **Clear Boundaries** - Each type has distinct purpose and style
4. **Natural Progression** - Users move from learning to doing to understanding

## Documentation Architecture

### Four-Quadrant Model

```
┌─────────────────────────────────────────────────────────────┐
│                    DOCUMENTATION QUADRANTS                  │
├────────────────────────┬────────────────────────────────────┤
│      TUTORIALS         │        HOW-TO GUIDES             │
│   (Learning-Oriented)  │      (Task-Oriented)             │
│                        │                                   │
│ • Getting Started      │ • Common Tasks                   │
│ • First Project        │ • Recipes & Patterns             │
│ • Interactive Examples │ • Problem Solutions              │
│ • Workshops            │ • Integration Guides             │
│                        │                                   │
│ Status: [█████░░░] 60% │ Status: [████████░] 80%         │
├────────────────────────┼────────────────────────────────────┤
│      EXPLANATION       │         REFERENCE                │
│ (Understanding-Orient.) │   (Information-Oriented)         │
│                        │                                   │
│ • Architecture Docs    │ • API Documentation              │
│ • Design Decisions     │ • Configuration Options          │
│ • Conceptual Guides    │ • Command Reference              │
│ • Theory & Background  │ • File Format Specs              │
│                        │                                   │
│ Status: [███░░░░░] 30% │ Status: [██████████] 100%       │
└────────────────────────┴────────────────────────────────────┘
```

### Documentation Tree Structure

```
PROJECT_DOCS/
├── README.md                    [Overview & Quick Start]
├── DOCUMENTATION_STANDARDS.md   [This Document]
├── INDEX.md                     [Master Reference]
├── STATUS.md                    [Documentation Status Tracking]
│
├── 1_TUTORIALS/                 [Learning-Oriented]
│   ├── 00_prerequisites.md      
│   ├── 01_getting_started.md    
│   ├── 02_first_project.md      
│   └── 03_next_steps.md         
│
├── 2_HOWTO/                     [Task-Oriented]
│   ├── installation/            
│   ├── configuration/           
│   ├── common_tasks/            
│   └── troubleshooting/         
│
├── 3_REFERENCE/                 [Information-Oriented]
│   ├── api/                     
│   ├── cli/                     
│   ├── configuration/           
│   └── schemas/                 
│
├── 4_EXPLANATION/               [Understanding-Oriented]
│   ├── architecture/            
│   ├── design_decisions/        
│   ├── concepts/                
│   └── contributing/            
│
└── _templates/                  [Documentation Templates]
    ├── tutorial_template.md     
    ├── howto_template.md        
    ├── reference_template.md    
    └── explanation_template.md  
```

## Status Tracking System

### Document Status Indicators

Each document section must contain one of these status indicators:

| Status | Symbol | Description | Action Required |
|--------|--------|-------------|-----------------|
| **Complete** | ✅ | Section is complete and reviewed | Periodic review |
| **In Progress** | 🚧 | Actively being written | Track in STATUS.md |
| **TBD** | 📝 | To be documented | Schedule creation |
| **N/A** | ⊘ | Not applicable to this project | Document rationale |
| **Deprecated** | ⚠️ | Outdated, pending removal | Plan migration |
| **External** | 🔗 | Links to external documentation | Verify link validity |

### Status Tracking Example

```markdown
## Configuration Options 🚧

**Status**: In Progress (60% complete)
**Last Updated**: 2024-01-15
**Owner**: @username
**Target Completion**: 2024-02-01

### Completed
- ✅ Basic configuration
- ✅ Environment variables

### Pending
- 📝 Advanced options
- 📝 Performance tuning
```

## Tailoring Guidelines

### Project Size Categories

#### Micro Projects (< 500 LOC)
**Minimum Viable Documentation (MVD):**
- README.md with basic sections
- Inline code comments
- Single HOW-TO for installation

#### Small Projects (500-5000 LOC)
**Essential Documentation:**
- README.md (comprehensive)
- 2-3 tutorials
- 5-10 how-to guides
- Basic API reference
- CONTRIBUTING.md

#### Medium Projects (5000-50000 LOC)
**Standard Documentation:**
- Full four-quadrant coverage
- Dedicated documentation site
- Automated API docs
- Architecture documentation
- Multiple tutorials

#### Large Projects (50000+ LOC)
**Enterprise Documentation:**
- Complete NASA-style documentation tree
- Multiple rollout documents
- Version-specific docs
- Migration guides
- Video tutorials

### Tailoring Decision Matrix

| Aspect | Micro | Small | Medium | Large |
|--------|-------|-------|--------|-------|
| **Tutorials** | 0-1 | 2-3 | 5-10 | 10+ |
| **How-To Guides** | 1-2 | 5-10 | 20-50 | 50+ |
| **Reference** | Inline | Basic | Full | Comprehensive |
| **Explanation** | README | Minimal | Standard | Extensive |
| **Status Tracking** | None | Simple | Detailed | Automated |
| **Cross-References** | Basic | Manual | Semi-Auto | Automated |
| **Version Control** | Tags | Branches | Releases | CI/CD |

## Documentation Types in Detail

### 1. Tutorials 📚
**Purpose**: Take a beginner through a learning experience

**Characteristics**:
- Learning by doing
- Concrete steps with expected outcomes
- No decisions for the reader
- Builds confidence
- Allows for mistakes

**Template Structure**:
```markdown
# Tutorial: [Specific Learning Goal]

## Learning Objectives
- [ ] What you'll learn
- [ ] Skills you'll gain

## Prerequisites
- Required knowledge
- Required tools

## Step 1: [Action]
What we're doing and why...
\`\`\`bash
$ command
expected output
\`\`\`

## Step 2: [Next Action]
...

## What You've Learned
- Summary of achievements
- Next tutorial to try
```

### 2. How-To Guides 🔧
**Purpose**: Help users accomplish specific tasks

**Characteristics**:
- Problem-oriented
- Assumes competence
- Flexible paths
- Practical results
- Multiple valid approaches

**Template Structure**:
```markdown
# How to [Achieve Specific Goal]

## Context
When/why you need this...

## Prerequisites
- Required access/permissions
- Required state

## Option 1: [Approach Name]
Steps for this approach...

## Option 2: [Alternative Approach]
Steps for alternative...

## Verification
How to confirm success...

## Troubleshooting
Common issues and solutions...

## Related Guides
- Links to related how-tos
```

### 3. Reference 📖
**Purpose**: Provide technical descriptions and facts

**Characteristics**:
- Information-oriented
- Structured for lookup
- Accurate and complete
- Consistent format
- No interpretation

**Template Structure**:
```markdown
# [Component] Reference

## Synopsis
Brief description...

## Syntax
\`\`\`
command [options] arguments
\`\`\`

## Options
| Option | Type | Default | Description |
|--------|------|---------|-------------|
| --flag | bool | false | What it does |

## Examples
### Basic Usage
\`\`\`bash
$ command --flag
\`\`\`

## See Also
- Related references
```

### 4. Explanation 💡
**Purpose**: Provide understanding and context

**Characteristics**:
- Understanding-oriented
- Discusses alternatives
- Provides background
- Explains why
- Makes connections

**Template Structure**:
```markdown
# Understanding [Concept]

## Overview
High-level introduction...

## Background
Historical context or motivation...

## Core Concepts
### Concept 1
Deep explanation...

### Concept 2
Deep explanation...

## Design Decisions
Why we chose X over Y...

## Trade-offs
Benefits and limitations...

## Further Reading
- Academic papers
- Blog posts
- Related concepts
```

## Cross-Referencing System

### Internal Links
Use consistent patterns for cross-references:

```markdown
See [Installation Guide](../2_HOWTO/installation/basic.md)
Related: [API Reference](../3_REFERENCE/api/core.md#function-name)
Concept explained in [Architecture Overview](../4_EXPLANATION/architecture/overview.md)
```

### Link Types

| Type | Format | Example |
|------|--------|---------|
| **Internal Doc** | `[text](../path/file.md)` | `[Setup](../tutorials/setup.md)` |
| **Section Link** | `[text](file.md#section)` | `[Config](config.md#options)` |
| **Code Link** | `[text](file:line)` | `[main.py:42](src/main.py#L42)` |
| **Issue Link** | `#number` | `#123` |
| **External** | `[text](https://...)` | `[Docs](https://example.com)` |

## Quality Standards

### Documentation Quality Checklist

#### Content Quality
- [ ] **Accuracy**: Information is correct and verified
- [ ] **Completeness**: All necessary information included
- [ ] **Clarity**: Language is clear and unambiguous
- [ ] **Consistency**: Terminology and style are uniform
- [ ] **Currency**: Documentation is up-to-date

#### Structure Quality
- [ ] **Organization**: Logical flow and hierarchy
- [ ] **Navigation**: Easy to find information
- [ ] **Cross-references**: Appropriate links between documents
- [ ] **Search-friendly**: Good titles and headings
- [ ] **Accessible**: Follows accessibility guidelines

#### Technical Quality
- [ ] **Examples work**: All code examples are tested
- [ ] **Commands accurate**: All commands are verified
- [ ] **Links valid**: All links are working
- [ ] **Versions specified**: Clear about version requirements
- [ ] **Platform-aware**: Notes platform-specific differences

### Review Process

1. **Self-Review**: Author checks against quality checklist
2. **Peer Review**: Another contributor reviews for accuracy
3. **User Testing**: New users test tutorials and how-tos
4. **Technical Review**: Maintainer verifies technical accuracy
5. **Final Approval**: Documentation marked as ✅ Complete

## Automation and Tooling

### Recommended Tools

#### Documentation Generation
```yaml
# mkdocs.yml example
site_name: Project Documentation
theme:
  name: material
  features:
    - navigation.sections
    - navigation.tabs
    - search.highlight

nav:
  - Home: index.md
  - Tutorials: 1_TUTORIALS/
  - How-To: 2_HOWTO/
  - Reference: 3_REFERENCE/
  - Explanation: 4_EXPLANATION/
```

#### Automated Checks
```yaml
# .github/workflows/docs.yml
name: Documentation
on: [push, pull_request]

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Check Markdown links
        uses: gaurav-nelson/github-action-markdown-link-check@v1
        
      - name: Spell check
        uses: streetsidesoftware/cspell-action@v2
        
      - name: Vale prose linting
        uses: errata-ai/vale-action@v2
```

#### Documentation Metrics
```python
# doc_metrics.py
def calculate_documentation_coverage():
    """Calculate documentation coverage metrics"""
    metrics = {
        'tutorials': count_files('1_TUTORIALS/'),
        'howtos': count_files('2_HOWTO/'),
        'reference': count_files('3_REFERENCE/'),
        'explanation': count_files('4_EXPLANATION/'),
        'total_words': count_words(),
        'code_examples': count_code_blocks(),
        'status_complete': count_status('✅'),
        'status_pending': count_status('📝'),
    }
    return metrics
```

### Integration Points

#### Version Control Integration
```gitignore
# Documentation build artifacts
docs/_build/
site/
*.pdf

# Keep templates
!_templates/
```

#### CI/CD Integration
- Build documentation on every commit
- Deploy to GitHub Pages / ReadTheDocs
- Check for broken links
- Validate code examples
- Generate API documentation

#### IDE Integration
- Markdown preview
- Spell checking
- Link validation
- Template snippets
- Table of contents generation

## Progressive Documentation Strategy

### Phase 1: Foundation (Week 1)
1. Create README.md with basic sections
2. Set up documentation structure
3. Write first tutorial
4. Document installation process

### Phase 2: Essential (Month 1)
1. Complete 3 tutorials
2. Add 5-10 how-to guides
3. Generate API reference
4. Write architecture overview

### Phase 3: Comprehensive (Month 3)
1. Full tutorial series
2. Complete how-to collection
3. Detailed reference documentation
4. Conceptual explanations

### Phase 4: Excellence (Month 6)
1. Video tutorials
2. Interactive examples
3. Searchable documentation site
4. Community contributions

## Maintenance Guidelines

### Regular Updates
- **Weekly**: Update status indicators
- **Bi-weekly**: Review and update how-to guides
- **Monthly**: Update tutorials and examples
- **Quarterly**: Major documentation review
- **Annually**: Complete documentation audit

### Version Management
```markdown
<!-- In each document header -->
---
version: 2.1.0
last_updated: 2024-01-15
authors: [username1, username2]
status: ✅ Complete
---
```

### Deprecation Process
1. Mark as deprecated with warning
2. Provide migration path
3. Set removal date (min 2 versions)
4. Update all references
5. Archive in `_deprecated/` folder

## Templates

### Quick Start Template
```markdown
# Quick Start

## Installation (2 minutes)
\`\`\`bash
$ install-command
\`\`\`

## First Use (3 minutes)
\`\`\`bash
$ basic-command
\`\`\`

## Next Steps
- [ ] Complete [First Tutorial](1_TUTORIALS/01_getting_started.md)
- [ ] Read [Core Concepts](4_EXPLANATION/concepts/core.md)
- [ ] Try [Common Tasks](2_HOWTO/common_tasks/)
```

### Troubleshooting Template
```markdown
# Troubleshooting: [Problem]

## Symptoms
- What users see
- Error messages

## Common Causes
1. Cause 1
2. Cause 2

## Solutions

### Solution 1: [Quick Fix]
\`\`\`bash
$ fix-command
\`\`\`

### Solution 2: [Deeper Fix]
Detailed steps...

## Prevention
How to avoid this issue...

## Related Issues
- Link to similar problems
```

## Metrics and Success Criteria

### Documentation Health Metrics

| Metric | Poor | Good | Excellent |
|--------|------|------|-----------|
| **Coverage** | <40% | 40-70% | >70% |
| **Completeness** | Many TBDs | Few TBDs | No TBDs |
| **Freshness** | >6 months old | 3-6 months | <3 months |
| **User Satisfaction** | <3/5 | 3-4/5 | >4/5 |
| **Time to First Success** | >30 min | 15-30 min | <15 min |
| **Support Tickets** | Many doc issues | Some doc issues | Rare doc issues |

### Success Indicators
- New users successfully complete tutorials
- Reduced support questions
- Community contributions to docs
- Positive documentation feedback
- Low time-to-productivity for new contributors

## Conclusion

This documentation standard provides a robust framework for creating and maintaining high-quality documentation for personal projects. By combining NASA's systematic approach with Diataxis's user-centered design, it offers:

1. **Structure** without rigidity
2. **Completeness** without overwhelming detail
3. **Scalability** from micro to enterprise projects
4. **Quality** through clear standards and processes
5. **Maintainability** through automation and tooling

Remember: Good documentation is an investment that pays dividends in user satisfaction, contributor engagement, and project sustainability.

---

*Version 1.0.0 | Last Updated: 2024 | Based on NASA Documentation Standards and Diataxis Framework*