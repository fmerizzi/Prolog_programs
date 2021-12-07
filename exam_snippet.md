# Exam questions

 - present the vanilla meta-interpreter
 - present the notion of CUT
 - introduce the meta-predicate clause/2 
 - present the event calculus framework 
 - difference between rule-based forward reasoning vs backward reasoning 
 - introduce rule-based forward reasoning and RETE algorithm 
 - introduce rete algorithm 
 
# brief lesson recap 

 1) recall of prolog
 2) prolog meta predicates and meta interpreters 
 3) Probabilistic logic programming 
 4) production systems, Rete, Drools 
 5) Decision modeling notation 
 6) Complex event processing 
 7) Semantic web, knowledge graphs 

# explain the vanilla meta interpreter 
using the powerful meta-predicate clause, we can 

# meta predicates 

call()  ==  predicate simply execute the argument, that must be a predicate

fail    == always fail, forces the interpreter to explore other alternatives 
setof(X,P,S) == set of instances X that satisfy P
bagox(X,P,S) == list of instances X that satisfy P 
findall(X,P,S) == like set of but returns argument quantified existentially 
clause(Head,Body) == true if (Head,Body) is unified with a clause stored within the DB program 
write() == just a print console output 
assert(T) == add T to the db dynamically. in backtrack is ignored. Random position in DB. 
asserta(T) == added to the top 
assertz(T) == added to the bottom 
rertract(T) == the first clause in the db that unifies with T is removed 
abolish(T,arity) == remove all the clauses 

# terminology

clause: a clause may be facts, rule, or queries. 
predicate: clause/2 is a predicate, its defined by a collection of clauses 
rule: a rule is the form head:- body 
goal: its the body of a rule 


