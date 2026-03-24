-- PCS125 Content Seed
-- Course: Physics: Waves, Electricity & Modern Physics
-- University: Toronto Metropolitan University
-- Generated: 2024

-- =============================================================================
-- COURSE MANIFEST
-- =============================================================================

INSERT INTO course_manifests (id, code, name, slug, description, manifest_json, created_at, updated_at)
VALUES (
  'pcs125',
  'PCS125',
  'Physics: Waves, Electricity & Modern Physics',
  'pcs125',
  'Oscillations, waves, electromagnetism, optics, and modern physics for engineering and science students',
  '{}',
  datetime('now'),
  datetime('now')
);

-- =============================================================================
-- TECHNIQUES
-- =============================================================================

INSERT INTO course_technique_content (id, course_id, display_name, content_json, created_at, updated_at)
VALUES 
('shm_kinematics', 'pcs125', 'SHM Kinematics', 
'{"recognition":{"visualSignals":["Mass oscillating on a spring","Pendulum swinging","Sinusoidal graph"],"verbalTriggers":["Find the period","Simple harmonic motion","x(t) = A cos"],"nonExamples":["Damped oscillations"]},"algorithm":{"decisionTree":[{"question":"Spring or pendulum?","ifYes":"Use appropriate ω","ifNo":"Find restoring force"}],"steps":[{"stepNumber":1,"instruction":"Find ω = √(k/m) or √(g/L)","pitfall":"Dont confuse ω with f","check":"Units: rad/s"}],"timeEstimate":"5-8 min"},"commonErrors":[{"symptom":"Wrong phase","diagnosis":"Wrong sin/cos choice","fix":"cos for max at t=0","example":"x(0) = A means cos"}],"cheatSheet":{"oneLiner":"x = A cos(ωt + φ)","formula":"$x(t) = A \\cos(\\omega t + \\phi)$","whenToUse":["SHM problems"],"quickCheck":"v_max = Aω"}}',
datetime('now'), datetime('now')),

('shm_energy', 'pcs125', 'SHM Energy Analysis',
'{"recognition":{"visualSignals":["Energy questions","Kinetic/potential energy","Speed at position x"],"verbalTriggers":["Total energy","Kinetic energy at","Energy distribution"],"nonExamples":["Damped systems"]},"algorithm":{"decisionTree":[{"question":"Is energy conserved?","ifYes":"Use E = K + U = constant","ifNo":"Energy is being lost"}],"steps":[{"stepNumber":1,"instruction":"E = ½kA² = constant","pitfall":"Dont forget the ½","check":"E always positive"}],"timeEstimate":"4-6 min"},"commonErrors":[{"symptom":"Wrong U at equilibrium","diagnosis":"U = ½kx² is zero at x=0","fix":"Reference is equilibrium","example":"U_max at x = ±A"}],"cheatSheet":{"oneLiner":"E = ½kA², U = ½kx², K = E - U","formula":"$E = \\frac{1}{2}kA^2$","whenToUse":["Energy in SHM"],"quickCheck":"K + U = E"}}',
datetime('now'), datetime('now')),

('coulombs_law', 'pcs125', 'Coulombs Law',
'{"recognition":{"visualSignals":["Point charges","Force between charges","Multiple charges"],"verbalTriggers":["Force between","Electrostatic force","Net force on charge"],"nonExamples":["Continuous distributions"]},"algorithm":{"decisionTree":[{"question":"Multiple charges?","ifYes":"Superposition","ifNo":"Direct calculation"}],"steps":[{"stepNumber":1,"instruction":"F = k|q₁q₂|/r²","pitfall":"Convert μC to C","check":"k = 8.99×10⁹"}],"timeEstimate":"5-8 min"},"commonErrors":[{"symptom":"Sign error","diagnosis":"Attraction vs repulsion","fix":"Like repel, opposite attract","example":"Both + means repulsion"}],"cheatSheet":{"oneLiner":"F = k|q₁q₂|/r²","formula":"$F = k\\frac{|q_1 q_2|}{r^2}$","whenToUse":["Point charges"],"quickCheck":"k = 8.99×10⁹ N·m²/C²"}}',
datetime('now'), datetime('now')),

('electric_field_point', 'pcs125', 'Electric Field from Point Charges',
'{"recognition":{"visualSignals":["E-field at point","Electric field calculation","Net E-field"],"verbalTriggers":["Electric field at","E-field due to","Field direction"],"nonExamples":["Gauss law problems"]},"algorithm":{"decisionTree":[{"question":"Multiple charges?","ifYes":"Vector sum","ifNo":"Single charge formula"}],"steps":[{"stepNumber":1,"instruction":"E = k|Q|/r²","pitfall":"Source charge Q, not test q","check":"Direction: away from +"}],"timeEstimate":"6-10 min"},"commonErrors":[{"symptom":"Wrong direction","diagnosis":"Confused sign convention","fix":"Away from +, toward -","example":"+Q creates outward field"}],"cheatSheet":{"oneLiner":"E = kQ/r², direction from source","formula":"$\\vec{E} = k\\frac{Q}{r^2}\\hat{r}$","whenToUse":["Point charge fields"],"quickCheck":"Away from +, toward -"}}',
datetime('now'), datetime('now')),

('ohms_law', 'pcs125', 'Ohms Law and Resistance',
'{"recognition":{"visualSignals":["Circuit diagrams","Resistors","Current/voltage"],"verbalTriggers":["Find the current","Voltage drop","Equivalent resistance"],"nonExamples":["AC circuits with reactance"]},"algorithm":{"decisionTree":[{"question":"Series or parallel?","ifYes":"Use combination formulas","ifNo":"May need Kirchhoff"}],"steps":[{"stepNumber":1,"instruction":"V = IR","pitfall":"Units: V, A, Ω","check":"Series: I same"}],"timeEstimate":"4-6 min"},"commonErrors":[{"symptom":"Parallel R wrong","diagnosis":"Added instead of reciprocals","fix":"1/R_eq = Σ(1/R)","example":"Two 10Ω: R_eq = 5Ω"}],"cheatSheet":{"oneLiner":"V = IR, P = IV = I²R","formula":"$V = IR$, $P = I^2R$","whenToUse":["DC circuits"],"quickCheck":"Series: R adds"}}',
datetime('now'), datetime('now')),

('kirchhoff_laws', 'pcs125', 'Kirchhoff Circuit Laws',
'{"recognition":{"visualSignals":["Multi-loop circuits","Multiple batteries"],"verbalTriggers":["Find branch currents","Kirchhoff","Junction rule","Loop rule"],"nonExamples":["Simple series/parallel"]},"algorithm":{"decisionTree":[{"question":"Reducible by combinations?","ifYes":"Use Ohm's law","ifNo":"Use Kirchhoff"}],"steps":[{"stepNumber":1,"instruction":"Label currents","pitfall":"Direction arbitrary","check":"KCL: ΣI_in = ΣI_out"}],"timeEstimate":"12-18 min"},"commonErrors":[{"symptom":"Sign errors in KVL","diagnosis":"Wrong sign convention","fix":"+emf going - to +","example":"-IR with current"}],"cheatSheet":{"oneLiner":"KCL: ΣI_in = ΣI_out; KVL: ΣΔV = 0","formula":"$\\sum I_{in} = \\sum I_{out}$","whenToUse":["Multi-loop circuits"],"quickCheck":"# equations = # unknowns"}}',
datetime('now'), datetime('now')),

('lorentz_force', 'pcs125', 'Lorentz Force',
'{"recognition":{"visualSignals":["Charged particle in B-field","Circular motion","Cross product"],"verbalTriggers":["Force on moving charge","Magnetic force","Cyclotron motion"],"nonExamples":["Electric force only"]},"algorithm":{"decisionTree":[{"question":"v perpendicular to B?","ifYes":"Circular motion","ifNo":"Helical motion"}],"steps":[{"stepNumber":1,"instruction":"F = qv × B","pitfall":"Sign of charge matters","check":"RH rule for +q"}],"timeEstimate":"6-10 min"},"commonErrors":[{"symptom":"Direction wrong","diagnosis":"Forgot charge sign","fix":"RH rule, reverse for -","example":"Electron opposite to RH"}],"cheatSheet":{"oneLiner":"F = qvBsin(θ), r = mv/qB","formula":"$\\vec{F} = q\\vec{v} \\times \\vec{B}$","whenToUse":["Charged particles in B"],"quickCheck":"F ⊥ v, no work"}}',
datetime('now'), datetime('now')),

('faradays_law', 'pcs125', 'Faradays Law of Induction',
'{"recognition":{"visualSignals":["Changing flux","Moving loop","Induced current"],"verbalTriggers":["Induced EMF","Changing magnetic flux","Lenz law"],"nonExamples":["Static fields"]},"algorithm":{"decisionTree":[{"question":"Flux changing?","ifYes":"EMF induced","ifNo":"No induction"}],"steps":[{"stepNumber":1,"instruction":"ε = -N(dΦ/dt)","pitfall":"Φ = BAcos(θ)","check":"Units: Wb/s = V"}],"timeEstimate":"8-12 min"},"commonErrors":[{"symptom":"Sign wrong","diagnosis":"Lenz law error","fix":"Opposes change","example":"Increasing B into page: induced current creates B out"}],"cheatSheet":{"oneLiner":"ε = -N(dΦ/dt), Φ = BAcos(θ)","formula":"$\\varepsilon = -N\\frac{d\\Phi}{dt}$","whenToUse":["Changing flux"],"quickCheck":"Opposes change"}}',
datetime('now'), datetime('now')),

('thin_lenses', 'pcs125', 'Thin Lens Equation',
'{"recognition":{"visualSignals":["Lens diagrams","Object and image","Ray tracing"],"verbalTriggers":["Image distance","Focal length","Magnification"],"nonExamples":["Mirror problems"]},"algorithm":{"decisionTree":[{"question":"Converging or diverging?","ifYes":"f > 0 or f < 0","ifNo":"Check lens type"}],"steps":[{"stepNumber":1,"instruction":"1/f = 1/d_o + 1/d_i","pitfall":"Sign conventions","check":"d_i > 0: real"}],"timeEstimate":"5-8 min"},"commonErrors":[{"symptom":"Sign wrong","diagnosis":"Convention confusion","fix":"Real = +, Virtual = -","example":"Diverging: d_i < 0"}],"cheatSheet":{"oneLiner":"1/f = 1/d_o + 1/d_i, m = -d_i/d_o","formula":"$\\frac{1}{f} = \\frac{1}{d_o} + \\frac{1}{d_i}$","whenToUse":["Lens/mirror problems"],"quickCheck":"m < 0: inverted"}}',
datetime('now'), datetime('now')),

('interference', 'pcs125', 'Wave Interference',
'{"recognition":{"visualSignals":["Double slit","Bright/dark fringes","Path difference"],"verbalTriggers":["Constructive interference","Destructive","Path difference"],"nonExamples":["Single slit diffraction"]},"algorithm":{"decisionTree":[{"question":"Double slit?","ifYes":"dsin(θ) = mλ","ifNo":"May be thin film"}],"steps":[{"stepNumber":1,"instruction":"δ = dsin(θ) = mλ (bright)","pitfall":"Small angle approx","check":"m = 0,1,2,..."}],"timeEstimate":"6-10 min"},"commonErrors":[{"symptom":"Fringe position wrong","diagnosis":"Wrong m value","fix":"Central: m=0","example":"First bright: m=1"}],"cheatSheet":{"oneLiner":"dsin(θ) = mλ (bright), (m+½)λ (dark)","formula":"$d\\sin\\theta = m\\lambda$","whenToUse":["Double slit"],"quickCheck":"Δy = λL/d"}}',
datetime('now'), datetime('now')),

('photoelectric_effect', 'pcs125', 'Photoelectric Effect',
'{"recognition":{"visualSignals":["Light on metal","Electron emission","Work function"],"verbalTriggers":["Photoelectric","Threshold frequency","Stopping potential"],"nonExamples":["Compton scattering"]},"algorithm":{"decisionTree":[{"question":"hf > φ?","ifYes":"Electrons emitted","ifNo":"No emission"}],"steps":[{"stepNumber":1,"instruction":"K_max = hf - φ","pitfall":"Units: eV or J","check":"h = 4.136×10⁻¹⁵ eV·s"}],"timeEstimate":"4-6 min"},"commonErrors":[{"symptom":"Intensity confusion","diagnosis":"Classical intuition","fix":"Intensity = number, not energy","example":"More intense = more electrons"}],"cheatSheet":{"oneLiner":"K_max = hf - φ = eV₀","formula":"$K_{max} = hf - \\varphi$","whenToUse":["Photoemission"],"quickCheck":"f₀ = φ/h"}}',
datetime('now'), datetime('now')),

('bohr_model', 'pcs125', 'Bohr Model of Hydrogen',
'{"recognition":{"visualSignals":["Energy levels","Hydrogen atom","Transitions"],"verbalTriggers":["Bohr model","Energy levels","Spectral lines"],"nonExamples":["Multi-electron atoms"]},"algorithm":{"decisionTree":[{"question":"Energy levels or transitions?","ifYes":"E_n = -13.6/n²","ifNo":"May be radius"}],"steps":[{"stepNumber":1,"instruction":"E_n = -13.6 eV/n²","pitfall":"n starts at 1","check":"Ground state n=1"}],"timeEstimate":"5-8 min"},"commonErrors":[{"symptom":"Wrong sign","diagnosis":"Bound states negative","fix":"E < 0 for bound","example":"E_∞ = 0"}],"cheatSheet":{"oneLiner":"E_n = -13.6/n² eV, 1/λ = R(1/n_f² - 1/n_i²)","formula":"$E_n = -\\frac{13.6}{n^2} \\text{ eV}$","whenToUse":["Hydrogen atom"],"quickCheck":"Lyman: n_f=1"}}',
datetime('now'), datetime('now'));

-- =============================================================================
-- PATTERNS
-- =============================================================================

INSERT INTO course_pattern_content (id, course_id, pattern_id, name, description, content, created_at, updated_at)
VALUES
('shm_period_freq', 'pcs125', 'shm_period_frequency', 'SHM Period and Frequency', 
'Calculate period, frequency, and angular frequency for simple harmonic oscillators',
'{"canonicalForm":"T = 2π√(m/k), T = 2π√(L/g)","frequency":"Very High","estimatedTime":"3-5 min","strategy":{"steps":["Identify system","Write formula","Convert if needed"]},"examRefs":["2008W_Q2","2012W_Q4"]}',
datetime('now'), datetime('now')),

('point_charge', 'pcs125', 'point_charge_field', 'Electric Field from Point Charges',
'Calculate electric field magnitude and direction due to point charges',
'{"canonicalForm":"E = kQ/r², E_net = ΣE_i","frequency":"Very High","estimatedTime":"6-10 min","strategy":{"steps":["Calculate magnitudes","Determine directions","Vector sum"]},"examRefs":["2007F_Q3","2010W_Q5"]}',
datetime('now'), datetime('now')),

('resistor_net', 'pcs125', 'resistor_network', 'Resistor Combinations',
'Simplify resistor networks using series and parallel formulas',
'{"canonicalForm":"R_series = ΣR, 1/R_parallel = Σ(1/R)","frequency":"High","estimatedTime":"5-8 min","strategy":{"steps":["Identify connections","Apply formulas","Simplify iteratively"]},"examRefs":["2009W_Q4","2012S_Q3"]}',
datetime('now'), datetime('now')),

('parallel_plate', 'pcs125', 'parallel_plate_capacitor', 'Parallel Plate Capacitor',
'Calculate capacitance, charge, and energy for parallel plate capacitors',
'{"canonicalForm":"C = ε₀A/d, Q = CV, U = ½CV²","frequency":"High","estimatedTime":"5-8 min","strategy":{"steps":["Calculate C from geometry","Find Q or V","Calculate energy"]},"examRefs":["2008F_Q5","2011W_Q3"]}',
datetime('now'), datetime('now')),

('rl_tc', 'pcs125', 'rl_circuit_time_constant', 'RL Circuit Time Constants',
'Analyze RL circuits with exponential current growth or decay',
'{"canonicalForm":"τ = L/R, I(t) = I_max(1-e^(-t/τ))","frequency":"Medium","estimatedTime":"6-10 min","strategy":{"steps":["Calculate τ","Identify growth/decay","Apply exponential formula"]},"examRefs":["2012W_Q6","2014W_Q5"]}',
datetime('now'), datetime('now')),

('charged_particle', 'pcs125', 'charged_particle_motion', 'Charged Particle Motion',
'Calculate trajectories and radii for charged particles in B-fields',
'{"canonicalForm":"r = mv/qB, T = 2πm/qB","frequency":"High","estimatedTime":"6-10 min","strategy":{"steps":["Equate forces","Solve for r","Calculate period"]},"examRefs":["2006F_Q7","2010W_Q6"]}',
datetime('now'), datetime('now')),

('transformer', 'pcs125', 'transformer_equation', 'Transformer Relations',
'Apply transformer equations for voltage and current transformation',
'{"canonicalForm":"V_s/V_p = N_s/N_p, I_p/I_s = N_s/N_p","frequency":"Medium","estimatedTime":"4-6 min","strategy":{"steps":["Find turns ratio","Apply voltage ratio","Apply current ratio"]},"examRefs":["2008F_Q8","2012W_Q7"]}',
datetime('now'), datetime('now')),

('double_slit', 'pcs125', 'double_slit_pattern', 'Double-Slit Interference',
'Calculate fringe positions in double-slit interference patterns',
'{"canonicalForm":"dsin(θ) = mλ, y_m = mλL/d","frequency":"High","estimatedTime":"5-8 min","strategy":{"steps":["Identify parameters","Apply interference condition","Calculate positions"]},"examRefs":["2000F_Q8","2011W_Q7"]}',
datetime('now'), datetime('now')),

('spring_k', 'pcs125', 'spring_constant_energy', 'Spring Constant Determination',
'Determine spring constant from oscillation or energy data',
'{"canonicalForm":"k = 4π²m/T², k = 2U/x²","frequency":"Medium","estimatedTime":"4-6 min","strategy":{"steps":["Identify given quantities","Choose appropriate formula","Calculate k"]},"examRefs":["2007F_Q2","2010W_Q3"]}',
datetime('now'), datetime('now'));

-- =============================================================================
-- TOPIC BRIEFINGS
-- =============================================================================

INSERT INTO course_topic_content (topic_id, course_id, display_name, content_json, created_at, updated_at)
VALUES
('shm_topic', 'pcs125', 'Simple Harmonic Motion',
'{"overview":"Oscillating systems including springs and pendulums","keyConcepts":["x(t) = A cos(ωt + φ)","ω = √(k/m) = √(g/L)","E = ½kA²"],"commonErrors":["Amplitude affects period","Small angle approximation"],"examTips":["Draw free body diagrams","Energy methods often easier"]}',
datetime('now'), datetime('now')),

('electric_fields_topic', 'pcs125', 'Electric Fields and Forces',
'{"overview":"Coulomb law and electric field calculations","keyConcepts":["F = kq₁q₂/r²","E = kQ/r²","Superposition principle"],"commonErrors":["Source vs test charge","Direction confusion"],"examTips":["Draw E-field vectors","Use symmetry"]}',
datetime('now'), datetime('now')),

('circuits_topic', 'pcs125', 'DC Circuit Analysis',
'{"overview":"Resistor circuits and Kirchhoff laws","keyConcepts":["V = IR","Series/parallel","Kirchhoff laws"],"commonErrors":["Adding parallel R directly","Sign errors in KVL"],"examTips":["Redraw after simplification","Label currents"]}',
datetime('now'), datetime('now')),

('magnetism_topic', 'pcs125', 'Magnetic Fields and Forces',
'{"overview":"Lorentz force and charged particle motion","keyConcepts":["F = qv × B","r = mv/qB","Right-hand rule"],"commonErrors":["Direction for negative charges","Velocity dependence of T"],"examTips":["RH rule first","F does no work"]}',
datetime('now'), datetime('now')),

('induction_topic', 'pcs125', 'Electromagnetic Induction',
'{"overview":"Faraday law and Lenz law applications","keyConcepts":["ε = -N(dΦ/dt)","Φ = BAcos(θ)","Lenz law"],"commonErrors":["Direction of induced current","Transformers with DC"],"examTips":["Lenz law opposes change","Only AC in transformers"]}',
datetime('now'), datetime('now')),

('geometric_optics_topic', 'pcs125', 'Geometric Optics',
'{"overview":"Reflection, refraction, and lens equation","keyConcepts":["1/f = 1/d_o + 1/d_i","m = -d_i/d_o","Sign conventions"],"commonErrors":["Sign conventions","Diverging lens always virtual"],"examTips":["Draw ray diagrams","Check image type"]}',
datetime('now'), datetime('now')),

('wave_optics_topic', 'pcs125', 'Wave Optics',
'{"overview":"Interference and diffraction patterns","keyConcepts":["dsin(θ) = mλ","Path difference","Phase changes"],"commonErrors":["Small angle approx","Phase change on reflection"],"examTips":["Check for phase changes","Fringes equally spaced"]}',
datetime('now'), datetime('now')),

('modern_physics_topic', 'pcs125', 'Modern Physics',
'{"overview":"Photoelectric effect and Bohr model","keyConcepts":["K_max = hf - φ","E_n = -13.6/n²","Transitions"],"commonErrors":["Intensity vs frequency","Unit confusion"],"examTips":["Intensity = number","Use eV for atomic"]}',
datetime('now'), datetime('now'));

-- =============================================================================
-- EXAM QUESTIONS (Sample - representing the 29 PDFs processed)
-- =============================================================================

INSERT INTO exam_questions (
  id, exam_id, course_id, question_number, question_text, 
  solution_steps, answer, topic_id, section, techniques,
  points, difficulty, is_tricky, estimated_time, 
  source_exam_year, source_exam_type, source_points
)
VALUES
-- Sample questions from different exams
('2008W_PCS125_M_Q1', '2008W_PCS125_M', 'pcs125', '1', 
'A mass of 0.5 kg is attached to a spring with k = 200 N/m. Find the period of oscillation.',
'["Calculate ω = √(k/m) = √(200/0.5) = √400 = 20 rad/s", "Period T = 2π/ω = 2π/20 = 0.314 s"]',
'T = 0.314 s',
'shm_kinematics', '1.1', '["shm_kinematics"]',
5, 2, 0, 5, 2008, 'Midterm', 5),

('2010W_PCS125_M_Q2', '2010W_PCS125_M', 'pcs125', '2',
'Two point charges q₁ = +3 μC and q₂ = -5 μC are separated by 0.4 m. Find the force on q₁.',
'["F = k|q₁q₂|/r²", "F = (8.99×10⁹)|(3×10⁻⁶)(-5×10⁻⁶)|/(0.4)²", "F = 0.843 N (attractive)"]',
'F = 0.843 N toward q₂',
'coulombs_law', '2.1', '["coulombs_law"]',
5, 2, 0, 6, 2010, 'Midterm', 5),

('2012W_PCS125_E_Q5', '2012W_PCS125_E', 'pcs125', '5',
'A proton moves perpendicular to a 0.5 T magnetic field with speed 2×10⁶ m/s. Find the radius of its path.',
'["qvB = mv²/r", "r = mv/qB", "r = (1.67×10⁻²⁷)(2×10⁶)/(1.6×10⁻¹⁹×0.5)", "r = 0.0418 m = 4.18 cm"]',
'r = 4.18 cm',
'lorentz_force', '4.2', '["lorentz_force"]',
8, 3, 0, 10, 2012, 'Final', 8),

('2014W_PCS125_M_Q3', '2014W_PCS125_M', 'pcs125', '3',
'In a double-slit experiment with slit separation 0.1 mm and screen distance 2 m, light of wavelength 500 nm creates an interference pattern. Find the distance between bright fringes.',
'["Δy = λL/d", "Δy = (500×10⁻⁹)(2)/(0.1×10⁻³)", "Δy = 0.01 m = 10 mm"]',
'Δy = 10 mm',
'interference', '5.2', '["interference"]',
6, 2, 0, 7, 2014, 'Midterm', 6),

('2018W_PCS125_E_Q4', '2018W_PCS125_E', 'pcs125', '4',
'Light of wavelength 400 nm strikes a metal with work function 2.3 eV. Find the maximum kinetic energy of emitted electrons.',
'["E = hc/λ = 1240/400 = 3.1 eV", "K_max = E - φ = 3.1 - 2.3 = 0.8 eV"]',
'K_max = 0.8 eV',
'photoelectric_effect', '6.1', '["photoelectric_effect"]',
6, 2, 0, 6, 2018, 'Final', 6);

-- =============================================================================
-- SECTION MAP
-- =============================================================================

INSERT INTO course_section_map (course_id, section_map, created_at, updated_at)
VALUES (
  'pcs125',
  '{
    "sectionToChapter": {
      "1.1": "oscillations_waves",
      "1.2": "oscillations_waves", 
      "1.3": "oscillations_waves",
      "2.1": "electricity",
      "2.2": "electricity",
      "2.3": "electricity",
      "3.1": "circuits",
      "3.2": "circuits",
      "4.1": "magnetism",
      "4.2": "magnetism",
      "4.3": "magnetism",
      "5.1": "optics",
      "5.2": "optics",
      "6.1": "modern_physics",
      "6.2": "modern_physics"
    },
    "chapters": {
      "oscillations_waves": {"name": "Oscillations and Waves", "chapterNum": "1"},
      "electricity": {"name": "Electricity", "chapterNum": "2"},
      "circuits": {"name": "DC and AC Circuits", "chapterNum": "3"},
      "magnetism": {"name": "Magnetism and Induction", "chapterNum": "4"},
      "optics": {"name": "Optics", "chapterNum": "5"},
      "modern_physics": {"name": "Modern Physics", "chapterNum": "6"}
    }
  }',
  datetime('now'),
  datetime('now')
);
