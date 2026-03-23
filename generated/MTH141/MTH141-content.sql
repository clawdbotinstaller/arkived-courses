-- MTH141 Calculus 1 Content Seed
-- Generated for Concordia University

-- ============================================
-- COURSE MANIFEST
-- ============================================
INSERT INTO course_manifests (id, code, name, slug, description, manifest_json, created_at) VALUES
('calc1', 'MTH141', 'Calculus 1', 'mth141', 'Limits, derivatives, and applications of differentiation', 
'{
  "id": "calc1",
  "name": "Calculus 1", 
  "code": "MTH141",
  "slug": "mth141",
  "description": "Limits, derivatives, and applications of differentiation",
  "features": {
    "techniqueMastery": {"enabled": true, "phases": ["recognize", "understand", "master", "certified"]},
    "patternWorkbench": {"enabled": true, "phases": ["recognition", "strategy", "practice", "mastery"]},
    "mockMidterm": {"enabled": true, "presetIds": ["quick", "standard", "deep"]},
    "archiveBrowser": {"enabled": true, "filters": ["section", "technique", "difficulty", "year", "exam_type", "topic"]},
    "topicBriefings": {"enabled": true, "tabs": ["overview", "patterns", "techniques", "practice"]},
    "courseAnalysis": {"enabled": true},
    "midtermReview": {"enabled": true},
    "pastExams": {"enabled": true}
  },
  "contentRefs": {
    "techniqueIds": ["chain_rule_basic", "product_rule", "lhopital_0_0", "optimization_setup", "u_substitution", "related_rates_setup", "ftc_part2", "critical_points", "factoring_limits", "tangent_line", "area_vertical", "implicit_basic"],
    "patternIds": ["limit_direct_substitution", "limit_factoring", "derivative_power_rule", "derivative_chain_rule", "optimization_box_problem", "related_rates_cone", "area_between_curves", "ftc_evaluation", "limit_rationalizing"],
    "topicBriefingIds": ["limits_continuity", "derivatives", "differentiation_rules", "implicit_differentiation", "related_rates", "optimization", "curve_sketching", "integrals"]
  },
  "meta": {
    "examCount": 42,
    "examYearRange": "2015-2025",
    "institution": "Concordia University"
  }
}', datetime('now'));

-- ============================================
-- TECHNIQUE CONTENT
-- ============================================
INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('chain_rule_basic', 'calc1', 'Chain Rule', 
'{
  "id": "chain_rule_basic",
  "displayName": "Chain Rule",
  "recognition": {
    "visualSignals": ["Nested function structure f(g(x))", "Composite functions like sin(x²), e^(3x), ln(cos x)"],
    "verbalTriggers": ["Find the derivative of a composite function", "Differentiate e^(something), ln(something)"],
    "nonExamples": ["Simple polynomials like x³ + 2x", "Sum of functions like sin x + cos x"]
  },
  "algorithm": {
    "decisionTree": [{"question": "Is the function a composition f(g(x))?", "ifYes": "Apply chain rule", "ifNo": "Use basic rules"}],
    "steps": [
      {"stepNumber": 1, "instruction": "Identify outer function f(u) and inner function g(x)", "pitfall": "Don't confuse f and g", "check": "Can you write the function as f(g(x))?"},
      {"stepNumber": 2, "instruction": "Compute derivative of outer f'(u)", "pitfall": "Treat inner as variable", "check": "Answer still contains g(x)"},
      {"stepNumber": 3, "instruction": "Compute derivative of inner g'(x)", "pitfall": "Don't forget this step", "check": "Differentiate g(x)"},
      {"stepNumber": 4, "instruction": "Multiply: f'(g(x)) · g'(x)", "pitfall": "Substitute g(x) back", "check": "Final answer in terms of x"}
    ],
    "timeEstimate": "5-8 min"
  },
  "commonErrors": [
    {"symptom": "Missing inner derivative factor", "diagnosis": "Forgot g'(x)", "fix": "Always multiply by inner derivative", "example": "d/dx[sin(x²)] = cos(x²)·2x"}
  ],
  "workedExamples": [
    {"difficulty": "Easy", "problem": "Find derivative of f(x) = (3x+1)⁵", "solution": [{"step": 1, "math": "u = 3x+1, f(u) = u⁵", "explanation": "Identify"}, {"step": 4, "math": "15(3x+1)⁴", "explanation": "Result"}], "keyInsight": "Chain rule multiplies by inner derivative", "timeEstimate": "3-4 min"}
  ],
  "drillSets": {
    "recognitionDrill": {"title": "Chain Rule Recognition", "questions": [{"integral": "d/dx[(2x-1)⁴]", "options": ["Chain rule", "Product rule", "Quotient rule"], "correctAnswer": 0}]},
    "executionDrill": {"title": "Chain Rule Execution", "problems": [{"problem": "Find d/dx[(5x+2)³]", "answer": "15(5x+2)²", "difficulty": "Easy"}]}
  },
  "cheatSheet": {"oneLiner": "Outer' evaluated at inner times inner'", "formula": "d/dx[f(g(x))] = f'(g(x))·g'(x)"}
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('product_rule', 'calc1', 'Product Rule',
'{
  "id": "product_rule",
  "displayName": "Product Rule",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Identify factors u and v"},
      {"stepNumber": 2, "instruction": "Compute u' and v'"},
      {"stepNumber": 3, "instruction": "Apply (uv)' = u'v + uv'"}
    ],
    "timeEstimate": "4-6 min"
  },
  "cheatSheet": {"formula": "d/dx[uv] = u'v + uv'", "oneLiner": "First' times second plus first times second'"}
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('lhopital_0_0', 'calc1', "L'Hôpital's Rule (0/0)",
'{
  "id": "lhopital_0_0",
  "displayName": "L'Hôpital's Rule (0/0)",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Verify limit is 0/0 form"},
      {"stepNumber": 2, "instruction": "Differentiate numerator and denominator separately"},
      {"stepNumber": 3, "instruction": "Evaluate new limit"}
    ],
    "timeEstimate": "5-8 min"
  },
  "cheatSheet": {"formula": "If lim f/g = 0/0, then lim f/g = lim f'/g'", "oneLiner": "Differentiate top and bottom separately"}
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('optimization_setup', 'calc1', 'Optimization Setup',
'{
  "id": "optimization_setup",
  "displayName": "Optimization Setup",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Identify what to maximize/minimize"},
      {"stepNumber": 2, "instruction": "Draw diagram and label variables"},
      {"stepNumber": 3, "instruction": "Write objective function"},
      {"stepNumber": 4, "instruction": "Write constraint equation"},
      {"stepNumber": 5, "instruction": "Eliminate variables"},
      {"stepNumber": 6, "instruction": "Find critical points"}
    ],
    "timeEstimate": "12-18 min"
  }
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('u_substitution', 'calc1', 'Integration by Substitution',
'{
  "id": "u_substitution",
  "displayName": "Integration by Substitution",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Choose u = inner function"},
      {"stepNumber": 2, "instruction": "Compute du = g'(x)dx"},
      {"stepNumber": 3, "instruction": "Rewrite integral in terms of u"},
      {"stepNumber": 4, "instruction": "Integrate with respect to u"},
      {"stepNumber": 5, "instruction": "Substitute back to x"}
    ],
    "timeEstimate": "6-10 min"
  }
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('related_rates_setup', 'calc1', 'Related Rates Setup',
'{
  "id": "related_rates_setup",
  "displayName": "Related Rates Setup",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Draw diagram and label variables"},
      {"stepNumber": 2, "instruction": "Write equation relating variables"},
      {"stepNumber": 3, "instruction": "Differentiate with respect to t"},
      {"stepNumber": 4, "instruction": "Substitute known values"},
      {"stepNumber": 5, "instruction": "Solve for unknown rate"}
    ],
    "timeEstimate": "8-12 min"
  }
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('ftc_part2', 'calc1', 'FTC Part II',
'{
  "id": "ftc_part2",
  "displayName": "FTC Part II",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Find antiderivative F(x)"},
      {"stepNumber": 2, "instruction": "Evaluate F(upper) - F(lower)"}
    ],
    "timeEstimate": "4-8 min"
  },
  "cheatSheet": {"formula": "∫_a^b f(x)dx = F(b) - F(a)", "oneLiner": "Antiderivative at upper minus antiderivative at lower"}
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('critical_points', 'calc1', 'Finding Critical Points',
'{
  "id": "critical_points",
  "displayName": "Finding Critical Points",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Find domain of f"},
      {"stepNumber": 2, "instruction": "Compute f'(x)"},
      {"stepNumber": 3, "instruction": "Solve f'(x) = 0"},
      {"stepNumber": 4, "instruction": "Find where f'(x) undefined"},
      {"stepNumber": 5, "instruction": "Verify in domain of f"}
    ],
    "timeEstimate": "4-8 min"
  },
  "cheatSheet": {"formula": "c is critical if f'(c) = 0 or f'(c) DNE, and c ∈ dom(f)"}
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('factoring_limits', 'calc1', 'Factoring for Limits',
'{
  "id": "factoring_limits",
  "displayName": "Factoring for Limits",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Verify 0/0 form"},
      {"stepNumber": 2, "instruction": "Factor numerator and denominator"},
      {"stepNumber": 3, "instruction": "Cancel common factors"},
      {"stepNumber": 4, "instruction": "Substitute"}
    ],
    "timeEstimate": "4-6 min"
  }
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('tangent_line', 'calc1', 'Tangent Line Equations',
'{
  "id": "tangent_line",
  "displayName": "Tangent Line Equations",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Find f'(x)"},
      {"stepNumber": 2, "instruction": "m = f'(a)"},
      {"stepNumber": 3, "instruction": "y₀ = f(a)"},
      {"stepNumber": 4, "instruction": "y - y₀ = m(x - a)"}
    ],
    "timeEstimate": "4-6 min"
  },
  "cheatSheet": {"formula": "y - f(a) = f'(a)(x - a)"}
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('area_vertical', 'calc1', 'Area Between Curves (Vertical)',
'{
  "id": "area_vertical",
  "displayName": "Area Between Curves (Vertical)",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Sketch curves"},
      {"stepNumber": 2, "instruction": "Find intersections"},
      {"stepNumber": 3, "instruction": "Determine top/bottom"},
      {"stepNumber": 4, "instruction": "Integrate ∫[top - bottom]dx"}
    ],
    "timeEstimate": "8-12 min"
  }
}', datetime('now'));

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at) VALUES
('implicit_basic', 'calc1', 'Implicit Differentiation',
'{
  "id": "implicit_basic",
  "displayName": "Implicit Differentiation",
  "algorithm": {
    "steps": [
      {"stepNumber": 1, "instruction": "Differentiate both sides with respect to x"},
      {"stepNumber": 2, "instruction": "Apply chain rule to y terms"},
      {"stepNumber": 3, "instruction": "Collect dy/dx terms"},
      {"stepNumber": 4, "instruction": "Solve for dy/dx"}
    ],
    "timeEstimate": "6-10 min"
  },
  "cheatSheet": {"formula": "d/dx[yⁿ] = nyⁿ⁻¹(dy/dx)"}
}', datetime('now'));

-- ============================================
-- PATTERN WORKBENCH CONTENT
-- ============================================
INSERT INTO pattern_workbench_patterns (id, course_id, name, description, canonical_form_latex, strategy_json, exam_references_json, workbench_json, created_at) VALUES
('limit_direct_substitution', 'calc1', 'Direct Substitution Limits', 
'Evaluating limits by direct substitution',
'\\lim_{x \\to a} f(x) = f(a)',
'{"step_1": "Substitute", "step_2": "If finite, done"}',
'["MTH141-2018-M-Q1"]',
'{"phase_1_recognition": {"flashcards": [{"front": {"latex": "lim(x→3) (x²+2x)"}, "back": {"title": "Direct"}}]}, "phase_3_practice": {"problem_cards": [{"id": "ds-1", "difficulty": "Easy", "prompt_latex": "lim(x→1) (3x²+2)", "solution": {"final_answer_latex": "5"}}]}}',
datetime('now'));

INSERT INTO pattern_workbench_patterns (id, course_id, name, description, canonical_form_latex, strategy_json, exam_references_json, workbench_json, created_at) VALUES
('limit_factoring', 'calc1', 'Limits by Factoring',
'0/0 limits by factoring and canceling',
'\\lim_{x \\to a} \\frac{P(x)}{Q(x)} = \\lim_{x \\to a} \\frac{P_1(x)}{Q_1(x)}',
'{"step_1": "Verify 0/0", "step_2": "Factor", "step_3": "Cancel"}',
'["MTH141-2017-M-Q3"]',
'{"phase_3_practice": {"problem_cards": [{"id": "lf-1", "prompt_latex": "lim(x→2) (x²-4)/(x-2)", "solution": {"final_answer_latex": "4"}}]}}',
datetime('now'));

INSERT INTO pattern_workbench_patterns (id, course_id, name, description, canonical_form_latex, strategy_json, exam_references_json, created_at) VALUES
('derivative_power_rule', 'calc1', 'Power Rule',
'Differentiating x^n',
'\\frac{d}{dx}[x^n] = nx^{n-1}',
'{"step_1": "Rewrite as x^n", "step_2": "Apply rule"}',
'["MTH141-2018-F-Q2"]',
datetime('now'));

INSERT INTO pattern_workbench_patterns (id, course_id, name, description, canonical_form_latex, strategy_json, exam_references_json, created_at) VALUES
('derivative_chain_rule', 'calc1', 'Chain Rule',
'Differentiating composite functions',
'\\frac{d}{dx}[f(g(x))] = f''(g(x))g''(x)',
'{"step_1": "Identify inner/outer", "step_2": "Differentiate", "step_3": "Multiply"}',
'["MTH141-2019-M-Q5"]',
datetime('now'));

INSERT INTO pattern_workbench_patterns (id, course_id, name, description, canonical_form_latex, strategy_json, exam_references_json, created_at) VALUES
('optimization_box_problem', 'calc1', 'Box Optimization',
'Box volume/surface area optimization',
'\\text{Maximize } V = lwh \\text{ subject to constraint}',
'{"step_1": "Define variables", "step_2": "Write objective", "step_3": "Apply constraint"}',
'["MTH141-2018-M-Q6"]',
datetime('now'));

INSERT INTO pattern_workbench_patterns (id, course_id, name, description, canonical_form_latex, strategy_json, exam_references_json, created_at) VALUES
('related_rates_cone', 'calc1', 'Conical Tank',
'Cone-related rates problems',
'\\frac{dV}{dt} = \\frac{1}{3}\\pi r^2 \\frac{dh}{dt}',
'{"step_1": "Similar triangles", "step_2": "Volume formula", "step_3": "Differentiate"}',
'["MTH141-2019-F-Q4"]',
datetime('now'));

INSERT INTO pattern_workbench_patterns (id, course_id, name, description, canonical_form_latex, strategy_json, exam_references_json, created_at) VALUES
('area_between_curves', 'calc1', 'Area Between Curves',
'Computing area between curves',
'\\int_a^b [f_{top} - f_{bottom}] dx',
'{"step_1": "Sketch", "step_2": "Find intersections", "step_3": "Integrate"}',
'["MTH141-2018-F-Q7"]',
datetime('now'));

INSERT INTO pattern_workbench_patterns (id, course_id, name, description, canonical_form_latex, strategy_json, exam_references_json, created_at) VALUES
('ftc_evaluation', 'calc1', 'FTC Evaluation',
'Evaluating definite integrals',
'\\int_a^b f(x) dx = F(b) - F(a)',
'{"step_1": "Find F(x)", "step_2": "Evaluate F(b)-F(a)"}',
'["MTH141-2017-F-Q5"]',
datetime('now'));

INSERT INTO pattern_workbench_patterns (id, course_id, name, description, canonical_form_latex, strategy_json, exam_references_json, created_at) VALUES
('limit_rationalizing', 'calc1', 'Rationalizing Limits',
'Limits with radicals using conjugates',
'\\lim \\frac{\\sqrt{f}-c}{g} \\xrightarrow{conjugate} \\lim \\frac{f-c^2}{g(\\sqrt{f}+c)}',
'{"step_1": "Multiply by conjugate", "step_2": "Simplify"}',
'["MTH141-2019-F-Q3"]',
datetime('now'));

-- ============================================
-- TOPIC BRIEFINGS
-- ============================================
INSERT INTO course_topic_content (topic_id, course_id, display_name, content_json, created_at) VALUES
('limits_continuity', 'calc1', 'Limits and Continuity',
'{
  "overview": "Understanding limits intuitively and calculating them",
  "keyConcepts": ["Limit definition", "Continuity", "Limit laws"],
  "formulas": ["\\lim_{x \\to a} f(x) = L", "f continuous at a: \\lim_{x \\to a} f(x) = f(a)"],
  "pitfalls": ["Assuming limit equals function value without checking continuity", "Not checking both sides"],
  "examTips": ["Always try direct substitution first", "0/0 means factor or rationalize"]
}',
datetime('now'));

INSERT INTO course_topic_content (topic_id, course_id, display_name, content_json, created_at) VALUES
('derivatives', 'calc1', 'Derivatives',
'{
  "overview": "The derivative as rate of change and slope",
  "keyConcepts": ["Limit definition", "Geometric interpretation", "Differentiability"],
  "formulas": ["f''(x) = \\lim_{h\\to 0} \\frac{f(x+h)-f(x)}{h}"],
  "pitfalls": ["Confusing derivative value with function value"],
  "examTips": ["Power rule: bring down exponent, subtract 1"]
}',
datetime('now'));

INSERT INTO course_topic_content (topic_id, course_id, display_name, content_json, created_at) VALUES
('differentiation_rules', 'calc1', 'Differentiation Rules',
'{
  "overview": "Product, quotient, and chain rules",
  "keyConcepts": ["Product rule", "Quotient rule", "Chain rule"],
  "formulas": ["(uv)'' = u''v + uv''", "(u/v)'' = (u''v-uv'')/v²", "(f(g(x)))'' = f''(g(x))g''(x)"],
  "pitfalls": ["Forgetting chain rule", "Reversing quotient rule numerator"],
  "examTips": ["Chain rule is most common - don't forget inner derivative"]
}',
datetime('now'));

INSERT INTO course_topic_content (topic_id, course_id, display_name, content_json, created_at) VALUES
('implicit_differentiation', 'calc1', 'Implicit Differentiation',
'{
  "overview": "Differentiating when y is not isolated",
  "keyConcepts": ["Chain rule on y", "Product rule with mixed variables"],
  "formulas": ["d/dx[y^n] = ny^{n-1}(dy/dx)"],
  "pitfalls": ["Forgetting dy/dx factor", "Not using product rule on xy"]
}',
datetime('now'));

INSERT INTO course_topic_content (topic_id, course_id, display_name, content_json, created_at) VALUES
('related_rates', 'calc1', 'Related Rates',
'{
  "overview": "Finding rates of change using implicit differentiation",
  "keyConcepts": ["Differentiating with respect to t", "Chain rule for rates"],
  "pitfalls": ["Substituting before differentiating", "Missing chain rule factors"]
}',
datetime('now'));

INSERT INTO course_topic_content (topic_id, course_id, display_name, content_json, created_at) VALUES
('optimization', 'calc1', 'Optimization',
'{
  "overview": "Finding maxima and minima in applied problems",
  "keyConcepts": ["Objective function", "Constraints", "Critical points"],
  "pitfalls": ["Wrong objective function", "Not checking endpoints"]
}',
datetime('now'));

INSERT INTO course_topic_content (topic_id, course_id, display_name, content_json, created_at) VALUES
('curve_sketching', 'calc1', 'Curve Sketching',
'{
  "overview": "Analyzing functions using derivatives",
  "keyConcepts": ["Increasing/decreasing", "Concavity", "Inflection points"],
  "formulas": ["f'' > 0: increasing", "f'''' > 0: concave up"],
  "pitfalls": ["Confusing increasing with concave up"]
}',
datetime('now'));

INSERT INTO course_topic_content (topic_id, course_id, display_name, content_json, created_at) VALUES
('integrals', 'calc1', 'Integrals',
'{
  "overview": "Introduction to integration",
  "keyConcepts": ["Antiderivatives", "FTC", "Substitution"],
  "formulas": ["\\int x^n dx = x^{n+1}/(n+1) + C", "\\int_a^b f(x)dx = F(b) - F(a)"],
  "pitfalls": ["Forgetting +C", "Wrong substitution choice"]
}',
datetime('now'));

-- ============================================
-- SECTION MAP
-- ============================================
INSERT INTO course_section_map (course_id, section_map_json, created_at) VALUES
('calc1', 
'{
  "sectionToChapter": {
    "1.1": "limits", "1.2": "limits", "1.3": "limits", "1.4": "limits",
    "2.1": "derivatives", "2.2": "derivatives", "2.3": "derivatives", "2.4": "derivatives",
    "3.1": "derivative_applications", "3.2": "derivative_applications", "3.3": "derivative_applications", "3.4": "derivative_applications",
    "4.1": "integrals", "4.2": "integrals", "4.3": "integrals", "4.4": "integrals"
  },
  "chapters": {
    "limits": {"name": "Limits and Continuity", "chapterNum": "1"},
    "derivatives": {"name": "Derivatives", "chapterNum": "2"},
    "derivative_applications": {"name": "Applications of Derivatives", "chapterNum": "3"},
    "integrals": {"name": "Integrals", "chapterNum": "4"}
  }
}', datetime('now'));
