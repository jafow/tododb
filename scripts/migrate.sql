--- placeholder ---
--- seed data
--- ############################################################
--- accounts

INSERT INTO td.accounts (email)
    VALUES ('jared@email.com'), ('allan@email.com'), ('somebody@email.com');

--- template list
INSERT INTO td.template_lists (title, description, items, owner_id)
    VALUES ('Night time', 'sleep routine', '{"items": [1]}', 2), ('Exam study', 'study routine', '{"items": [2]}', 2), ('open heart surgery', 'surgery', '{"items": [1, 2]}', 1)
RETURNING
    td.template_lists.id, td.template_lists.title, td.template_lists.owner_id;

--- active list
INSERT INTO td.active_lists (title, description, items, owner_id)
    VALUES ('Exam study', 'checklist for exam study topics', '{"items": [1, 4]}', 1), ('Night time routine', 'getting ready for sleep', '{"items": [7, 3, 5]}', 1), ('open heart surgery', 'things to do before cut into a persons chest', '{"items": [2, 6]}', 2)
RETURNING
    td.active_lists.id, td.active_lists.title, td.active_lists.owner_id;

--- list items
INSERT INTO td.list_items (description, parent_id)
    VALUES ('read chapter 2', 1), ('wash hands thoroughly', 3), ('look at the memes', 2), ('redo practice exam', 1), ('netflix', 2), ('do drugs', 3), ('do drugs', 2)
RETURNING
    td.list_items.id AS item_id, td.list_items.description;

