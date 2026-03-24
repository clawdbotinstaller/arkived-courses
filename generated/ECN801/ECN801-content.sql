-- ECN801 Principles of Engineering Economics - Content Seed
-- Generated from 14 exam PDFs (2007-2016)
-- University: Toronto Metropolitan University

-- ============================================
-- COURSE MANIFEST
-- ============================================
INSERT INTO course_manifests (id, code, name, slug, description, manifest_json, created_at, updated_at)
VALUES (
  'ecn801',
  'ECN801',
  'Principles of Engineering Economics',
  'ecn801',
  'Time value of money, cash flow analysis, project evaluation, and economic decision making for engineers',
  '{}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- ============================================
-- TECHNIQUES
-- ============================================
INSERT INTO course_technique_content (id, course_id, display_name, section_id, content_json, created_at)
VALUES 
('fp_factor', 'ecn801', 'F/P Factor (Future Worth)', 'single_payment', 
'{"recognition":{"visualSignals":["Question asks what will this grow to","Given present amount P, asked to find future amount F","Investment growing over time"],"verbalTriggers":["Find the future worth","What will this amount grow to","Future value"],"nonExamples":["Finding present worth (use P/F)","Uniform series calculations"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Identify P, i, and n","pitfall":"Using annual rate when compounding is monthly","check":"i = r/M"},{"stepNumber":2,"instruction":"Use F = P(1+i)^n","pitfall":"Using n-1 instead of n","check":"Verify n counts complete periods"}]}}',
CURRENT_TIMESTAMP),

('pf_factor', 'ecn801', 'P/F Factor (Present Worth)', 'single_payment',
'{"recognition":{"visualSignals":["Future amount discounted to today","Given F, find equivalent P"],"verbalTriggers":["Find the present worth","Today equivalent","Discount to present"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Identify F, i, n","pitfall":"Confusing with F/P factor","check":"Moving backward in time"}]}}',
CURRENT_TIMESTAMP),

('pa_factor', 'ecn801', 'P/A Factor (Annuity Present Worth)', 'uniform_series',
'{"recognition":{"visualSignals":["Series of equal payments","Convert uniform series to present"],"verbalTriggers":["Present worth of uniform series","Equivalent lump sum today"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Identify A, i, n","pitfall":"P must be one period BEFORE first A","check":"Verify timing"}]}}',
CURRENT_TIMESTAMP),

('ap_factor', 'ecn801', 'A/P Factor (Capital Recovery)', 'uniform_series',
'{"recognition":{"visualSignals":["Loan payment calculation","Convert present to uniform series"],"verbalTriggers":["Find the payment","Annual equivalent","Capital recovery"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Identify P, i, n","pitfall":"Confusing with P/A","check":"First A one period after P"}]}}',
CURRENT_TIMESTAMP),

('linear_gradient', 'ecn801', 'Linear Gradient (P/G Factor)', 'gradient_series',
'{"recognition":{"visualSignals":["Cash flows increase by constant amount","Arithmetic progression"],"verbalTriggers":["Increases by $X each year","Linear gradient"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Identify A, G, i, n","pitfall":"First G at period 2, not 1","check":"P = A(P/A) + G(P/G)"}]}}',
CURRENT_TIMESTAMP),

('geometric_gradient', 'ecn801', 'Geometric Gradient', 'gradient_series',
'{"recognition":{"visualSignals":["Cash flows change by percentage","Geometric progression"],"verbalTriggers":["Increases by 5% each year","Geometric gradient"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Identify A1, g, i, n","pitfall":"Special case when g=i","check":"Use correct formula"}]}}',
CURRENT_TIMESTAMP),

('npw_calculation', 'ecn801', 'Net Present Worth (NPW)', 'present_worth',
'{"recognition":{"visualSignals":["Project evaluation at MARR","Accept/reject decision"],"verbalTriggers":["Calculate NPW","Net present worth","Evaluate project"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Identify all cash flows and MARR","pitfall":"Using wrong discount rate","check":"Use MARR for discounting"},{"stepNumber":2,"instruction":"Convert all to present worth","pitfall":"Missing hidden cash flows","check":"Include salvage value"},{"stepNumber":3,"instruction":"NPW = PW(benefits) - PW(costs)","pitfall":"Sign errors","check":"NPW ≥ 0 means accept"}]}}',
CURRENT_TIMESTAMP),

('irr_calculation', 'ecn801', 'Internal Rate of Return (IRR)', 'rate_return',
'{"recognition":{"visualSignals":["Find rate where NPW=0","Rate of return"],"verbalTriggers":["Find IRR","Rate of return","Break-even rate"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Set NPW=0 with unknown i","pitfall":"Multiple IRRs possible","check":"Check for sign changes"},{"stepNumber":2,"instruction":"Try rates and interpolate","pitfall":"Rates too far apart","check":"Interpolate carefully"}]}}',
CURRENT_TIMESTAMP),

('aw_calculation', 'ecn801', 'Annual Worth Analysis', 'annual_worth',
'{"recognition":{"visualSignals":["Convert all cash flows to annual equivalent","Compare alternatives with different lives"],"verbalTriggers":["Annual worth","Equivalent annual cost","Annual equivalent"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Calculate NPW first","pitfall":"Not handling different lives correctly","check":"AW = NPW × (A/P,i,n)"}]}}',
CURRENT_TIMESTAMP),

('simple_payback', 'ecn801', 'Simple Payback Period', 'payback_period',
'{"recognition":{"visualSignals":["Time to recover investment","No discounting mentioned"],"verbalTriggers":["Payback period","Recovery time","Years to break even"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Accumulate cash flows until initial cost recovered","pitfall":"Using net instead of gross inflows","check":"No discounting in simple payback"}]}}',
CURRENT_TIMESTAMP),

('discounted_payback', 'ecn801', 'Discounted Payback Period', 'payback_period',
'{"recognition":{"visualSignals":["Time to recover investment with discounting"],"verbalTriggers":["Discounted payback","At MARR"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Discount cash flows at MARR","pitfall":"Using nominal rates","check":"Always longer than simple payback"}]}}',
CURRENT_TIMESTAMP),

('bond_pricing', 'ecn801', 'Bond Pricing', 'bond_valuation',
'{"recognition":{"visualSignals":["Face value, coupon rate, yield given","Bond valuation"],"verbalTriggers":["Price of bond","Bond value","Yield to maturity"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Identify F, c, i, n","pitfall":"Confusing coupon and yield rates","check":"Coupon determines payment, yield determines price"},{"stepNumber":2,"instruction":"Adjust for semi-annual if needed","pitfall":"Not adjusting periods and rates","check":"Double n, halve rates"},{"stepNumber":3,"instruction":"P = Coupon(P/A) + Face(P/F)","pitfall":"Calculation errors","check":"Yield > Coupon means discount"}]}}',
CURRENT_TIMESTAMP),

('capitalized_cost', 'ecn801', 'Capitalized Cost', 'capitalized_cost',
'{"recognition":{"visualSignals":["Perpetual service","Infinite life","Forever"],"verbalTriggers":["Capitalized cost","Perpetual","Endowment","Forever"]},"algorithm":{"steps":[{"stepNumber":1,"instruction":"Identify first cost and perpetual annual costs","pitfall":"Using P/A instead of A/i","check":"For perpetual: P = A/i"},{"stepNumber":2,"instruction":"For replacement cycles: find AW first","pitfall":"Direct conversion without AW","check":"CC = AW/i for cycles"}]}}',
CURRENT_TIMESTAMP);

-- ============================================
-- PATTERNS
-- ============================================
INSERT INTO pattern_workbench_patterns (id, course_id, pattern_name, canonical_form, description_json, workbench_json, created_at)
VALUES
('future_worth_lump_sum', 'ecn801', 'Future Worth of Lump Sum', 'F = P(1+i)^n',
'{"identification":"Single amount invested today","frequency":"Very Common","estimatedTime":"3-5 min"}',
'{"phase_1_recognition":{"purpose":"Learn to identify F/P problems"},"phase_2_strategy":{"purpose":"Master calculation steps"},"phase_3_practice":{"purpose":"Practice calculations"}}',
CURRENT_TIMESTAMP),

('annuity_present_worth', 'ecn801', 'Annuity Present Worth', 'P = A(P/A,i,n)',
'{"identification":"Equal payments to present lump sum","frequency":"Very Common","estimatedTime":"5-8 min"}',
'{"phase_1_recognition":{"purpose":"Identify annuity problems"}}',
CURRENT_TIMESTAMP),

('loan_payment_calculation', 'ecn801', 'Loan Payment Calculation', 'A = P(A/P,i,n)',
'{"identification":"Loan amount to payment calculation","frequency":"Common","estimatedTime":"5-8 min"}',
'{}',
CURRENT_TIMESTAMP),

('bond_valuation_pattern', 'ecn801', 'Bond Valuation', 'P = C(P/A) + F(P/F)',
'{"identification":"Face value, coupon, yield given","frequency":"Common","estimatedTime":"8-12 min"}',
'{}',
CURRENT_TIMESTAMP),

('project_comparison_npw', 'ecn801', 'Project Comparison NPW', 'Select max NPW ≥ 0',
'{"identification":"Mutually exclusive alternatives","frequency":"Very Common","estimatedTime":"10-15 min"}',
'{}',
CURRENT_TIMESTAMP),

('irr_by_interpolation', 'ecn801', 'IRR by Interpolation', 'i* = i1 + (i2-i1)×NPW1/(NPW1-NPW2)',
'{"identification":"Find rate where NPW=0","frequency":"Common","estimatedTime":"10-15 min"}',
'{}',
CURRENT_TIMESTAMP),

('capitalized_cost_pattern', 'ecn801', 'Capitalized Cost Pattern', 'CC = P0 + A/i',
'{"identification":"Perpetual or infinite life","frequency":"Moderate","estimatedTime":"10-15 min"}',
'{}',
CURRENT_TIMESTAMP),

('capital_recovery_cost', 'ecn801', 'Capital Recovery Cost', 'CR = P(A/P) - S(A/F)',
'{"identification":"Annual cost of ownership","frequency":"Common","estimatedTime":"8-12 min"}',
'{}',
CURRENT_TIMESTAMP);

-- ============================================
-- TOPIC BRIEFINGS
-- ============================================
INSERT INTO course_topic_content (topic_id, course_id, display_name, content_json, created_at)
VALUES
('time_value_fundamentals', 'ecn801', 'Time Value of Money Fundamentals',
'{"meta":{"display_name":"Time Value Fundamentals","core_formula":"F = P(1+i)^n"},"patterns":[{"id":"future_worth_lump_sum","name":"Future Worth"}],"confidence_checklist":["I understand time value concept","I can use F/P and P/F correctly"]}',
CURRENT_TIMESTAMP),

('interest_formulas', 'ecn801', 'Interest Formulas',
'{"meta":{"display_name":"Interest Formulas","core_formula":"P = A(P/A,i,n)"},"patterns":[{"id":"annuity_present_worth","name":"Annuity PW"},{"id":"loan_payment_calculation","name":"Loan Payments"},{"id":"linear_gradient","name":"Linear Gradient"}],"confidence_checklist":["I know all six factors","I understand timing"]}',
CURRENT_TIMESTAMP),

('project_evaluation', 'ecn801', 'Project Evaluation',
'{"meta":{"display_name":"Project Evaluation","core_formula":"NPW = Σ CF_t(1+i)^(-t)"},"patterns":[{"id":"project_comparison_npw","name":"NPW Analysis"},{"id":"irr_by_interpolation","name":"IRR"},{"id":"simple_payback","name":"Payback"}],"confidence_checklist":["I can calculate NPW","I understand comparison methods"]}',
CURRENT_TIMESTAMP),

('bonds_depreciation', 'ecn801', 'Bonds and Depreciation',
'{"meta":{"display_name":"Bonds","core_formula":"P = C(P/A) + F(P/F)"},"patterns":[{"id":"bond_valuation_pattern","name":"Bond Pricing"}],"confidence_checklist":["I can price bonds","I understand premium/discount"]}',
CURRENT_TIMESTAMP),

('advanced_analysis', 'ecn801', 'Advanced Analysis',
'{"meta":{"display_name":"Advanced Analysis","core_formula":"CC = P0 + A/i"},"patterns":[{"id":"capitalized_cost_pattern","name":"Capitalized Cost"},{"id":"capital_recovery_cost","name":"Capital Recovery"}],"confidence_checklist":["I understand perpetuities","I can calculate capital recovery"]}',
CURRENT_TIMESTAMP);

-- ============================================
-- EXAM QUESTIONS (Sample from extracted data)
-- ============================================
INSERT INTO exam_questions (
  id, exam_id, course_id, question_number, question_text, solution_steps, answer,
  topic_id, section, techniques, points, difficulty, is_tricky, estimated_time,
  source_exam_year, source_exam_type, canonical_form
)
VALUES
-- 2011 Winter Midterm Questions
('2011W_ECN801_M_Q1', '2011W_ECN801_M', 'ecn801', '1',
 'Find the future amount of $1,000 in 5 years at 5% compounded annually.',
 '["F = P(1+i)^n", "F = 1000(1.05)^5", "F = 1000 × 1.2763", "F = $1,276.30"]',
 '$1,276.30',
 'time_value',
 '1.1',
 '["fp_factor"]',
 4, 1, 0, 3,
 2011, 'Midterm', 'F/P calculation'),

('2011W_ECN801_M_Q2', '2011W_ECN801_M', 'ecn801', '2',
 'Find the present worth of $2,000 six years from now at 5% compounded annually.',
 '["P = F/(1+i)^n", "P = 2000/(1.05)^6", "P = 2000 × 0.7462", "P = $1,492.40"]',
 '$1,492.40',
 'time_value',
 '1.1',
 '["pf_factor"]',
 4, 1, 0, 3,
 2011, 'Midterm', 'P/F calculation'),

('2011W_ECN801_M_Q3', '2011W_ECN801_M', 'ecn801', '3',
 'If you put $500 in a bank and expect $1,500 in 5 years, find the annual interest rate.',
 '["1500 = 500(1+i)^5", "3 = (1+i)^5", "1+i = 3^0.2", "i = 0.2457 = 24.57%"]',
 '24.57%',
 'time_value',
 '1.2',
 '["finding_unknowns"]',
 4, 2, 0, 5,
 2011, 'Midterm', 'Finding interest rate'),

-- 2012 Winter Midterm 2 Questions
('2012W_ECN801_M2_Q1', '2012W_ECN801_M2', 'ecn801', '1',
 'Bond purchased 3 years ago for $950, par $1,000, 4.5% coupon, find selling price for 5% yield.',
 '["Annual coupon = 1000×0.045 = $45", "950 = 45(P/A,5%,3) + X(P/F,5%,3)", "X = $957.93"]',
 '$957.93',
 'bonds_depreciation',
 '4.1',
 '["bond_pricing"]',
 4, 2, 1, 8,
 2012, 'Midterm', 'Bond pricing'),

('2012W_ECN801_M2_Q2', '2012W_ECN801_M2', 'ecn801', '2',
 '10-year bond, $1,000 par, 8% semi-annual coupon, 5 years elapsed, current yield 10%. Find market value.',
 '["Semi-annual: i=5%, n=10 periods remaining", "Coupon = $40", "Price = 40(P/A,5%,10) + 1000(P/F,5%,10) = $922.77"]',
 '$922.77',
 'bonds_depreciation',
 '4.1',
 '["bond_pricing"]',
 4, 3, 0, 10,
 2012, 'Midterm', 'Semi-annual bond pricing'),

-- 2009 Fall Final Questions
('2009F_ECN801_E_Q3', '2009F_ECN801_E', 'ecn801', '3',
 'Tom deposits $2,000 today. What effective annual rate doubles money in 10 years?',
 '["4000 = 2000(1+i)^10", "2 = (1+i)^10", "i = 2^0.1 - 1 = 0.0718 = 7.18%"]',
 '7.18%',
 'time_value',
 '1.2',
 '["finding_unknowns", "rule_72"]',
 3, 2, 0, 5,
 2009, 'Final', 'Finding rate for doubling'),

('2009F_ECN801_E_Q4', '2009F_ECN801_E', 'ecn801', '4',
 'Nominal quarterly rate 4%, compounded monthly. Find effective annual rate.',
 '["i_quarterly = 0.04/4 = 0.01 per quarter", "But compounded monthly: i_monthly = 0.04/12", "(1 + 0.04/12)^12 - 1 = 4.07%"]',
 '4.07%',
 'time_value',
 '1.1',
 '["effective_nominal_rates"]',
 3, 3, 1, 6,
 2009, 'Final', 'Effective rate conversion'),

('2009F_ECN801_E_Q6', '2009F_ECN801_E', 'ecn801', '6',
 'Two mutually exclusive projects. Use annual worth analysis at 20% to select.',
 '["Project A: AW = -42000(A/P,20%,3) - 6000", "Project B: AW = -80000(A/P,20%,5) - gradient + 4000(A/F,20%,5)", "Compare AWs"]',
 'Depends on calculation',
 'project_evaluation',
 '3.2',
 '["aw_calculation", "project_comparison_npw"]',
 10, 3, 0, 15,
 2009, 'Final', 'Annual worth comparison');

-- ============================================
-- COURSE SECTION MAP
-- ============================================
INSERT INTO course_section_map (course_id, section_map, created_at)
VALUES (
  'ecn801',
  '{
    "chapters": {
      "time_value": {"name": "Time Value of Money", "number": "1"},
      "interest_formulas": {"name": "Interest Formulas", "number": "2"},
      "project_evaluation": {"name": "Project Evaluation", "number": "3"},
      "advanced_topics": {"name": "Advanced Topics", "number": "4"}
    },
    "sections": {
      "1.1": "interest_fundamentals",
      "1.2": "equivalence",
      "2.1": "single_payment",
      "2.2": "uniform_series",
      "2.3": "gradient_series",
      "3.1": "present_worth",
      "3.2": "annual_worth",
      "3.3": "rate_return",
      "4.1": "bond_valuation",
      "4.3": "capitalized_cost"
    }
  }',
  CURRENT_TIMESTAMP
);

-- ============================================
-- UPDATE COURSE MANIFEST WITH CONTENT REFS
-- ============================================
UPDATE course_manifests 
SET manifest_json = '{
  "id": "ecn801",
  "code": "ECN801",
  "name": "Principles of Engineering Economics",
  "techniqueCount": 13,
  "patternCount": 8,
  "topicCount": 5,
  "examCount": 14,
  "examYearRange": "2007-2016"
}'
WHERE id = 'ecn801';
