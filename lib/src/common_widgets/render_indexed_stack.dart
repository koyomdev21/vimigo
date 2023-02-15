import 'package:flutter/rendering.dart';

/// Implements the same layout algorithm as RenderStack but only paints the child
/// specified by index.
///
/// Although only one child is displayed, the cost of the layout algorithm is
/// still O(N), like an ordinary stack.
class RenderIndexedStack2 extends RenderStack {
  /// Creates a stack render object that paints a single child.
  ///
  /// If the [index] parameter is null, nothing is displayed.
  RenderIndexedStack2({
    super.children,
    super.alignment,
    super.textDirection,
    super.fit,
    super.clipBehavior,
    int? index = 0,
  }) : _index = index;

  @override
  void visitChildrenForSemantics(RenderObjectVisitor visitor) {
    if (index != null && firstChild != null) {
      visitor(_childAtIndex());
    }
  }

  /// The index of the child to show, null if nothing is to be displayed.
  int? get index => _index;
  int? _index;
  set index(int? value) {
    if (_index != value) {
      _index = value;
      markNeedsLayout();
    }
  }

  RenderBox _childAtIndex() {
    assert(index != null);
    RenderBox? child = firstChild;
    int i = 0;
    while (child != null && i < index!) {
      final StackParentData childParentData =
          child.parentData! as StackParentData;
      child = childParentData.nextSibling;
      i += 1;
    }
    assert(i == index);
    assert(child != null);
    return child!;
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    if (firstChild == null || index == null) {
      return false;
    }
    final RenderBox child = _childAtIndex();
    final StackParentData childParentData =
        child.parentData! as StackParentData;
    return result.addWithPaintOffset(
      offset: childParentData.offset,
      position: position,
      hitTest: (BoxHitTestResult result, Offset transformed) {
        assert(transformed == position - childParentData.offset);
        return child.hitTest(result, position: transformed);
      },
    );
  }

  @override
  void paintStack(PaintingContext context, Offset offset) {
    if (firstChild == null || index == null) {
      return;
    }
    final RenderBox child = _childAtIndex();
    final StackParentData childParentData =
        child.parentData! as StackParentData;
    context.paintChild(child, childParentData.offset + offset);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('index', index));
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    final List<DiagnosticsNode> children = <DiagnosticsNode>[];
    int i = 0;
    RenderObject? child = firstChild;
    while (child != null) {
      children.add(child.toDiagnosticsNode(
        name: 'child ${i + 1}',
        style: i != index ? DiagnosticsTreeStyle.offstage : null,
      ));
      child = (child.parentData! as StackParentData).nextSibling;
      i += 1;
    }
    return children;
  }
}
