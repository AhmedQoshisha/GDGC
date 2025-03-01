
CREATE TABLE Users(
    ID INT PRIMARY KEY,
    UserName VARCHAR(100)NOT NULL,
    DoB DATE,
    Email VARCHAR(200)NOT NULL,
    Gender VARCHAR(20),
    JoinDate DATE,
    InteractionID INT NOT NULL
	--FOREIGN KEY (InteractionID) REFERENCES Interaction(InteractionID)
);

INSERT INTO Users (ID, UserName, DoB, Email, Gender, JoinDate, InteractionID)
VALUES 
(1, 'Safwa', '2000-05-15', 'safwa@example.com', 'Female', '2024-01-01', 101),
(2, 'Ahmed', '1995-10-20', 'Ahmed@example.com', 'Male', '2023-09-15', 102);

CREATE TABLE Post (
    ID INT PRIMARY KEY NOT NULL,
    Content NVARCHAR(200),
    PostDate DATE,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(ID)
);

INSERT INTO Post (ID, Content, PostDate, UserID)
VALUES 
(1, 'Hello World!', '2023-02-10', 1),
(2, 'My second post', '2023-03-15', 2);


CREATE TABLE User_Post (
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    Date DATE,
    FOREIGN KEY (UserID) REFERENCES Users(ID),
    FOREIGN KEY (PostID) REFERENCES Post(ID)
);

INSERT INTO User_Post (UserID, PostID, Date)
VALUES 
(1, 1, '2023-02-10'),
(2, 2, '2023-03-15');

CREATE TABLE Interaction (
    InteractionID INT PRIMARY KEY,
    Type VARCHAR(50),
    InteractionDate DATE,
    PostID INT,
    UserID INT,
    FOREIGN KEY (PostID) REFERENCES Post(ID),
    FOREIGN KEY (UserID) REFERENCES Users(ID)
);

INSERT INTO Interaction (InteractionID, Type, InteractionDate, PostID, UserID)
VALUES 
(101, 'Like', '2023-02-11', 1, 2),
(102, 'Comment', '2023-03-16', 2, 1);

CREATE TABLE Comment (
    CommentID INT PRIMARY KEY ,
    PostID INT,
    Content NVARCHAR(200),
    CommentDate DATE,
    UserID INT,
    FOREIGN KEY (PostID) REFERENCES Post(ID),
    FOREIGN KEY (UserID) REFERENCES Users(ID)
);

INSERT INTO Comment (CommentID, Content, CommentDate, UserID)
VALUES 
(1, 'Great post!', '2023-02-12', 2),
(2, 'Nice thoughts!', '2023-03-17',  1);
