:- ale_flag(cllrs, _, on).


bot sub [cat, sem, list, agr, logic, q_order, logic, logic_form, excont, incont].

    cat sub [verbal, nominal, quantifier, cl] intro [q_order:q_order, logic_form:logic_form].
        verbal sub [v, vp, s].
        nominal sub [n, np].
        quantifier sub [q, dou] intro [q_type:q_type].
            q_type sub [forall, exists].

    sem sub [n_sem, v_sem].
        n_sem sub [student, book].
        v_sem sub [read].

    logic sub [sem_logic, q_logic].
        sem_logic sub [v_logic, q_logic].
            v_logic intro [verb:v_sem, subj:X, obj:Y].
            n_logic intro [noun:n_sem, obj:X].
        q_logic intro [quant:q_type, var:X, first:logic, second:logic].

    logic_form intro [excont, incont, parts].
        excont sub [logic].
        incont sub [sem_logic].

    list sub [e_list, ne_list].
        ne_list intro [hd:bot, tl:list].
   
    
% ====================== Lexical entries ======================

% 每: the universal quantifier
mei ---> (q, q_type:(forall, Forall), q_order:[Forall],
    logic_form:(excont:)).

% 一: the existential quantifier
yi ---> (q, q_type:(exists, Exists), q_order:[Exists]).

% 个: the classifier for students
ge ---> (cl, agr:ge, q_order:[]).

% 本: the classifier for books
ben ---> (cl, agr:ben, q_order:[]).

% 都: the distributive operator
dou ---> (dou, q_type:(forall, Forall), q_order:[Forall]).

% 学生: student
xuesheng ---> (n, sem:(student, Student), agr:ge, q_order:[]).

% 书: book
shu ---> (n, sem:(book, Book), agr:ben, q_order:[]).

% 读过: read
duguo ---> (v, sem:(read, Read), q_order:[]).


% =================== Phrase structure rules ===================

clp rule
    (clp, q_order:[Q], agr:Agr, sem:Sem) ===>
    sem_head> (cl, agr:Agr, q_order:[Q]),
    cat> (n, sem:Sem, agr:Agr).

np rule
    (np, q_order:[Q], sem:Sem) ===>
    cat> (clp, q_order:[Q]),
    sem_head> (n, sem:Sem).

vp rule
    (vp, q_order:QO_vp, sem:Sem) ===>
    sem_head> (v, sem:Sem, q_order:QO_v),
    cat> (np, q_order:QO_np),
    goal> concatenate(QO_vp, QO_np, QO_v).

s rule
    (s, q_order:QO_s, sem:Sem) ===>
    cat> (np, q_order:QO_np),
    sem_head> (vp, sem:Sem, q_order:QO_vp),
    goal> concatenate(QO_np, QO_vp, QO_s).


% ============================ Goals ===========================

concatenate([],Xs,Xs) if true.
concatenate([H|T1],L2,[H|T2]) if concatenate(T1,L2,T2).






