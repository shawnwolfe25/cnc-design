# Contributing to cnc-design

Thank you for your interest in contributing to this Shapeoko design repository! Whether you're adding a new design, improving documentation, or fixing a tool, your contributions are welcome.

## 🚀 Quick start

### I want to add a design or converted file

1. **Fork** the repository
2. Create a **new branch** for your contribution:
   ```bash
   git checkout -b add/my-design
   git checkout -b fix/svg-issue
   ```
3. Add your files to the appropriate folder:
   - **New SVG designs** → `/designs/`
   - **Image-to-SVG conversions** → `/examples/converted_from_user/`
   - **3D models (STL/FreeCAD)** → `/examples/generated_stl/` or a new subfolder
   - **Templates** → `/templates/`
4. Add a brief description to the relevant **README.md** (e.g., `examples/converted_from_user/README.md`)
5. **Commit with a clear message**:
   ```bash
   git commit -m "Add logo design: acme_logo.svg (cut and engrave layers)"
   git commit -m "Add conversion: photo_to_relief.stl from customer image"
   ```
6. **Open a Pull Request** with:
   - A title describing what you added
   - A short description (what it is, intended use, any special notes)
   - Reference any related issues if applicable

### I want to improve documentation or fix a bug

1. Fork and create a branch:
   ```bash
   git checkout -b docs/clarify-workflow
   git checkout -b fix/tool-error-handling
   ```
2. Make your changes
3. **Test locally** if possible (e.g., run scripts, open SVGs in Inkscape)
4. Commit with a clear message and open a PR

---

## 📋 Guidelines for designs and files

### SVG files (2D designs)
- **Units:** Always use **inches** (not mm or px)
- **Layers:** Organize into `cut` and `engrave` groups/layers for CAM compatibility
- **Paths:** Convert strokes to paths (`Path → Stroke to Path`) for cleaner CAM import
- **Naming:** Use descriptive names (e.g., `acme_logo_48x48.svg`, not `design1.svg`)
- **Clean geometry:** Remove unnecessary nodes, ungroup if needed

### STL files (3D models)
- **Scale:** Inches (to match Shapeoko work area)
- **Orientation:** Z-axis up (height), X/Y horizontal
- **Naming:** Include dimensions or type (e.g., `box_12x8x0.5.stl`, `logo_relief.stl`)
- **Size:** Keep file size reasonable (<5 MB for performance)

### Documentation
- **Markdown only** for docs (`.md` files)
- **Clear headings** and structure
- **Link to related files** (e.g., "See `/cams/README.md` for settings")
- **Code blocks** for commands or scripts

### Scripts and tools
- **Bash** scripts: add a shebang (`#!/bin/bash`), include help text, handle errors gracefully
- **Python** scripts: Python 3.6+, add docstrings, handle missing dependencies
- **Comments:** Explain what each section does, especially for CAM/design tools

---

## 🎯 What we're looking for

### High-priority contributions:
- ✅ **Real-world design examples** — logos, plates, brackets, signs
- ✅ **Workflow improvements** — better trace/extrude scripts, faster CAM setup
- ✅ **Documentation clarity** — fixing typos, clarifying steps, adding examples
- ✅ **Tool enhancements** — error handling, progress feedback, better UX

### Lower-priority:
- ❌ Large binary files without a clear purpose
- ❌ Duplicate designs (if a similar design exists, consider a PR to enhance it)
- ❌ Non-CNC content (out of scope for this repo)

---

## 🔍 Code review and merge process

1. **Automated checks** (when enabled):
   - SVG validation (schema and layer structure)
   - Script syntax checks
   - Documentation links validation

2. **Manual review**:
   - Design quality and usability
   - Documentation completeness
   - Alignment with repo goals

3. **Merge**:
   - Once approved, your contribution will be merged to `main`
   - You'll be credited in commit messages and release notes

---

## 📝 Commit message conventions

Keep commits clear and descriptive:

```
Add: new_design.svg (simple description)
Fix: tool_name.sh (what was broken)
Docs: clarify workflow in docs/3D_workflow.md
Improve: optimize trace script performance
```

For multi-file contributions, use a descriptive title:
```
Add logo conversion workflow: png→svg→stl with examples
```

---

## 🤔 Questions or ideas?

- **Design questions?** Open an [Issue](https://github.com/shawnwolfe25/cnc-design/issues) with the `question` label
- **Feature requests?** Open an [Issue](https://github.com/shawnwolfe25/cnc-design/issues) with `enhancement` label
- **Bug reports?** Open an [Issue](https://github.com/shawnwolfe25/cnc-design/issues) with `bug` label

Include:
- What you're trying to do
- What happened (or what you expect to happen)
- Steps to reproduce
- Your environment (OS, tool versions, etc.)

---

## 📄 License

By contributing, you agree that your contributions are licensed under the [MIT License](LICENSE).

---

## 🙏 Thank you!

Your contributions help make this a better resource for Shapeoko users everywhere. Happy designing! ✂️🪚
