INSERT INTO Category VALUES ('00001','Science Fiction');
INSERT INTO Category VALUES ('00002','Biography');
INSERT INTO Category VALUES ('00003','History');
INSERT INTO Category VALUES ('00004','Mystery');
INSERT INTO Category VALUES ('00005','Self-Help');

INSERT INTO Patron VALUES ('11111', 'Michael', 'Johnson');
INSERT INTO Patron VALUES ('11112', 'Tony', 'Owens');
INSERT INTO Patron VALUES ('11113', 'Jessica', 'Marin');
INSERT INTO Patron VALUES ('11114', 'Jonathan', 'Tran');
INSERT INTO Patron VALUES ('11115', 'Cynthia', 'Nicholson');
INSERT INTO Patron VALUES ('11116', 'James', 'Jones');

INSERT INTO Author VALUES ('22221', 'Anderson', 'Cooper');
INSERT INTO Author VALUES ('22222', 'Paul', 'Kalanithi');
INSERT INTO Author VALUES ('22223', 'Andy', 'Weir');
INSERT INTO Author VALUES ('22224', 'Sylvain', 'Neuvel');
INSERT INTO Author VALUES ('22225', 'Ron', 'Chernow');
INSERT INTO Author VALUES ('22226', 'Erik', 'Larson');
INSERT INTO Author VALUES ('22227', 'Paula', 'Hawkins');
INSERT INTO Author VALUES ('22228', 'David', 'Baldacci');
INSERT INTO Author VALUES ('22229', 'Brene', 'Brown');
INSERT INTO Author VALUES ('22220', 'Tom', 'Rath');

INSERT INTO Book VALUES ('9999999991', 'The Rainbow Comes and Goes', '22221', '00002');
INSERT INTO Book VALUES ('9999999992', 'When Breath Becomes Air', '22222', '00002');
INSERT INTO Book VALUES ('9999999993', 'The Martian', '22223', '00001');
INSERT INTO Book VALUES ('9999999994', 'Sleeping Giants', '22224', '00001');
INSERT INTO Book VALUES ('9999999995', 'Alexander Hamilton', '22225', '00003');
INSERT INTO Book VALUES ('9999999996', 'Dead Wake', '22226', '00003');
INSERT INTO Book VALUES ('9999999997', 'The Girl On the Train', '22227', '00004');
INSERT INTO Book VALUES ('9999999998', 'The Last Mile', '22228', '00004');
INSERT INTO Book VALUES ('9999999999', 'Daring Greatly', '22229', '00005');
INSERT INTO Book VALUES ('9999999990', 'Strengths Finder', '22220', '00005');

INSERT INTO Loans VALUES ('33330', TO_DATE('2016/05/03', 'yyyy/mm/dd'), '11111', '9999999991');
INSERT INTO Loans VALUES ('33331', TO_DATE('2016/05/23', 'yyyy/mm/dd'), '11112', '9999999998');
INSERT INTO Loans VALUES ('33332', TO_DATE('2015/01/23', 'yyyy/mm/dd'), '11112', '9999999999');
INSERT INTO Loans VALUES ('33333', TO_DATE('2015/12/23', 'yyyy/mm/dd'), '11115', '9999999994');
INSERT INTO Loans VALUES ('33334', TO_DATE('2016/05/13', 'yyyy/mm/dd'), '11114', '9999999992');
INSERT INTO Loans VALUES ('33335', TO_DATE('2016/04/30', 'yyyy/mm/dd'), '11116', '9999999993');