-- Maintenance Ledger: starter data. Run after schema.sql (SQL Editor > New query > Run).
-- It loads the 44-task PPM schedule for 2026 and empty AMC contract entries to fill in.
-- Do not run it twice, or the tasks will be duplicated.

insert into public.settings (id, data) values
  ('main', '{"company":"","building":"","preparedBy":"","currency":"LKR","trackingStart":"2026-10-01"}'::jsonb)
on conflict (id) do nothing;

insert into public.schedule (data) values
  ('{"year":2026,"system":"Chiller plant & cooling towers","asset":"CH-01 / 02 / 03","task":"Operating inspection, oil and refrigerant check, leak test","freq":"Monthly","by":"In-house","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Chiller plant & cooling towers","asset":"CH-01 / 02 / 03","task":"Service: starter, safeties, control calibration","freq":"Quarterly","by":"AMC","months":[1,4,7,10],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Chiller plant & cooling towers","asset":"CH-01 / 02 / 03","task":"Annual overhaul, eddy-current tube test, condenser cleaning","freq":"Yearly","by":"AMC","months":[3],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Chiller plant & cooling towers","asset":"CT-01 / 02","task":"Fan, gearbox oil, belts, fill and nozzle inspection","freq":"Monthly","by":"In-house","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Chiller plant & cooling towers","asset":"CT-01 / 02","task":"Basin drain and cleaning, strainer cleaning","freq":"Quarterly","by":"In-house","months":[2,5,8,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Chiller plant & cooling towers","asset":"Condenser water","task":"Water treatment dosing, conductivity, Legionella test","freq":"Monthly","by":"AMC","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Chiller plant & cooling towers","asset":"CHW / CW pumps","task":"Service, alignment, seals, bearing lubrication","freq":"Quarterly","by":"In-house","months":[2,5,8,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Chiller Mgmt System (CMS)","asset":"CMS","task":"Sensor calibration, data backup, set-point audit","freq":"Quarterly","by":"AMC","months":[0,3,6,9],"done":{}}'::jsonb),
  ('{"year":2026,"system":"AHU, FCU & ventilation","asset":"AHU-01 to 12","task":"Filter cleaning / replacement","freq":"Monthly","by":"In-house","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"AHU, FCU & ventilation","asset":"AHU-01 to 12","task":"Belts, bearings, motors, coil cleaning, dampers","freq":"Quarterly","by":"In-house","months":[1,4,7,10],"done":{}}'::jsonb),
  ('{"year":2026,"system":"AHU, FCU & ventilation","asset":"AHU-01 to 12","task":"Valve actuator and sensor calibration","freq":"Yearly","by":"AMC","months":[4],"done":{}}'::jsonb),
  ('{"year":2026,"system":"AHU, FCU & ventilation","asset":"FCUs","task":"Filter wash, drain tray and coil cleaning (floor by floor)","freq":"Quarterly","by":"In-house","months":[2,5,8,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"AHU, FCU & ventilation","asset":"Exhaust fans","task":"Cleaning, belts, bearings, motor current","freq":"Quarterly","by":"In-house","months":[0,3,6,9],"done":{}}'::jsonb),
  ('{"year":2026,"system":"AHU, FCU & ventilation","asset":"Fresh air fans","task":"Cleaning, belts, bearings, motor current","freq":"Quarterly","by":"In-house","months":[1,4,7,10],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Split AC","asset":"Split ACs","task":"Filter wash, gas pressure, drain clearing","freq":"Quarterly","by":"In-house","months":[2,5,8,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"MSB & electrical","asset":"MSB","task":"Cleaning, tightening, breaker operation check","freq":"6-Monthly","by":"AMC","months":[2,8],"done":{}}'::jsonb),
  ('{"year":2026,"system":"MSB & electrical","asset":"MSB","task":"Thermography scan and protection relay test","freq":"Yearly","by":"AMC","months":[5],"done":{}}'::jsonb),
  ('{"year":2026,"system":"MSB & electrical","asset":"Floor DBs 4-14","task":"Inspection, tightening, ELCB / RCD test","freq":"6-Monthly","by":"In-house","months":[4,10],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Generator","asset":"Generator","task":"On-load run, fuel, fluids and battery check","freq":"Monthly","by":"In-house","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Generator","asset":"Generator","task":"Service: oil, filters, coolant, belts","freq":"6-Monthly","by":"AMC","months":[1,7],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Generator","asset":"Generator / ATS","task":"Full-load test and ATS changeover test","freq":"Yearly","by":"AMC","months":[9],"done":{}}'::jsonb),
  ('{"year":2026,"system":"MSB & electrical","asset":"Emergency lights","task":"Battery discharge test, exit signs","freq":"Monthly","by":"In-house","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"MSB & electrical","asset":"Earthing","task":"Earth resistance test","freq":"Yearly","by":"AMC","months":[10],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Fire protection","asset":"Fire alarm","task":"Detector, call point and panel test (floor rotation)","freq":"Quarterly","by":"AMC","months":[0,3,6,9],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Fire protection","asset":"Sprinkler system","task":"Flow test, alarm valve test, valve exercise","freq":"Quarterly","by":"AMC","months":[1,4,7,10],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Fire protection","asset":"Hydrant system","task":"Pump run test, pressure test, landing valves","freq":"Monthly","by":"In-house","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Fire protection","asset":"Fire pumps","task":"Annual performance (flow / pressure) test","freq":"Yearly","by":"AMC","months":[6],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Fire protection","asset":"Extinguishers","task":"Visual inspection and tag check","freq":"Monthly","by":"In-house","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Fire protection","asset":"Extinguishers","task":"Refill and pressure test as due","freq":"Yearly","by":"Sub-con","months":[7],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Water supply & pumps","asset":"Domestic pumps 1 / 2","task":"Service, changeover test, seals","freq":"Quarterly","by":"In-house","months":[0,3,6,9],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Water supply & pumps","asset":"OHT 10,000 L","task":"Drain, clean and disinfect","freq":"6-Monthly","by":"Sub-con","months":[3,9],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Water supply & pumps","asset":"Sump tanks 1-4","task":"Clean, float valve and inlet check","freq":"6-Monthly","by":"Sub-con","months":[5,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Water supply & pumps","asset":"Sump / drain pumps","task":"Service, float switch test","freq":"Quarterly","by":"In-house","months":[1,4,7,10],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Water supply & pumps","asset":"Water quality","task":"Microbiological sample test","freq":"Quarterly","by":"Sub-con","months":[2,5,8,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Washrooms & sensor fixtures","asset":"Sensor taps / soap","task":"Sensors, batteries, flow rate (floors 4-14)","freq":"Monthly","by":"In-house","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Washrooms & sensor fixtures","asset":"Washrooms / pantries","task":"Traps, flushing, leaks, exhaust fan check","freq":"Quarterly","by":"In-house","months":[1,4,7,10],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Passenger & service lifts","asset":"Passenger lifts","task":"Contractor service and safety check","freq":"Monthly","by":"AMC","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Passenger & service lifts","asset":"Service lift","task":"Contractor service and safety check","freq":"Monthly","by":"AMC","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Passenger & service lifts","asset":"All lifts","task":"Statutory inspection and load test","freq":"Yearly","by":"AMC","months":[2],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Car lifts & stackers","asset":"Car lifts (2)","task":"Lubrication, safety devices, service","freq":"Monthly","by":"AMC","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Car lifts & stackers","asset":"Car stackers (45)","task":"Lubrication, sensors, chains, pallets, service","freq":"Monthly","by":"AMC","months":[0,1,2,3,4,5,6,7,8,9,10,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Auditorium & sound","asset":"Auditorium sound","task":"Mixer, amplifier, speakers, mics test","freq":"Quarterly","by":"AMC","months":[2,5,8,11],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Civil, marble & roofing","asset":"Ground floor marble","task":"Polishing / crystallisation, joint check","freq":"Quarterly","by":"Sub-con","months":[1,4,7,10],"done":{}}'::jsonb),
  ('{"year":2026,"system":"Civil, marble & roofing","asset":"Roof / wet areas","task":"Waterproofing and drainage inspection before rains","freq":"Yearly","by":"In-house","months":[3],"done":{}}'::jsonb);

insert into public.amc (data) values
  ('{"system":"Passenger & service lifts","contractor":"","contact":"","phone":"","email":"","start":"","end":"","value":0,"visits":12,"scope":"","notes":"","paymentTerms":"","sla":""}'::jsonb),
  ('{"system":"Car lifts & stackers","contractor":"","contact":"","phone":"","email":"","start":"","end":"","value":0,"visits":12,"scope":"","notes":"","paymentTerms":"","sla":""}'::jsonb),
  ('{"system":"Chiller plant & cooling towers","contractor":"","contact":"","phone":"","email":"","start":"","end":"","value":0,"visits":12,"scope":"","notes":"","paymentTerms":"","sla":""}'::jsonb),
  ('{"system":"Generator","contractor":"","contact":"","phone":"","email":"","start":"","end":"","value":0,"visits":2,"scope":"","notes":"","paymentTerms":"","sla":""}'::jsonb),
  ('{"system":"Fire protection","contractor":"","contact":"","phone":"","email":"","start":"","end":"","value":0,"visits":4,"scope":"","notes":"","paymentTerms":"","sla":""}'::jsonb),
  ('{"system":"Water supply & pumps","contractor":"","contact":"","phone":"","email":"","start":"","end":"","value":0,"visits":2,"scope":"","notes":"","paymentTerms":"","sla":""}'::jsonb),
  ('{"system":"Auditorium & sound","contractor":"","contact":"","phone":"","email":"","start":"","end":"","value":0,"visits":4,"scope":"","notes":"","paymentTerms":"","sla":""}'::jsonb);
