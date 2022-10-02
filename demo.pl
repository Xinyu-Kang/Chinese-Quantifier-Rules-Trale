bot sub [cat, sem, list, agr, qo, lf, excont, incont, parts].
    
% ====================== Lexical entries ======================

% 每: the universal quantifier
mei ---> (q, sem:(forall, Forall), qo:[Forall]).

% 一: the existential quantifier
yi ---> (q, sem:(exists, Exists), qo:[Exists]).

% 个: the classifier for students
ge ---> (cl, agr:ge, qo:[]).

% 本: the classifier for books
ben ---> (cl, agr:ben, qo:[]).

% 都: the distributive operator
dou ---> (dou, sem:(forall, Forall), qo:[Forall]).

% 学生: student
xuesheng ---> (n, sem:(student, Student), agr:ge, qo:[]).

% 书: book
shu ---> (n, sem:(book, Book), agr:ben, qo:[]).

% 读过: read
duguo ---> (v, sem:(read, Read), qo:[]).


% =================== Phrase structure rules ===================

clp rule
    (clp, qo:[Q], agr:Agr, sem:Sem) ===>
    sem_head> (cl, agr:Agr, qo:[Q]),
    cat> (n, sem:Sem, agr:Agr).

np rule
    (np, qo:[Q], sem:Sem) ===>
    cat> (clp, qo:[Q]),
    sem_head> (n, sem:Sem).

vp rule
    (vp, qo:[Q_np, Q_v], sem:Sem) ===>
    sem_head> (v, sem:Sem, qo:[Q_v]),
    cat> (np, qo:[Q_np]).

s rule
    (s, qo:QO_s, sem:Sem) ===>
    cat> (np, qo:QO_np),
    sem_head> (vp, sem:Sem, qo:QO_vp),
    goal> concatenate(QO_np, QO_vp, QO_s).


% ============================ Goals ===========================

concatenate([],Xs,Xs) if true.
concatenate([H|T1],L2,[H|T2]) if concatenate(T1,L2,T2).






