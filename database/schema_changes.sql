CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(70) UNIQUE NOT NULL,
    full_name VARCHAR(20) NOT NULL, 
    password VARCHAR(100) NOT NULL,
    aadhar INT NOT NULL PRIMARY KEY,
    DOB VARCHAR(20) NOT NULL,
    isApproved INT DEFAULT 0,
    phone INT NOT NULL, 
    email VARCHAR(30) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(70),
    FOREIGN KEY (modified_by) REFERENCES users(id)
    );

CREATE TABLE IF NOT EXISTS user_role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    role_id INT NOT NULL,
    user_id VARCHAR(70) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES role(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(70),
    FOREIGN KEY (modified_by) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS approval_requests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_aadhar INT NOT NULL,
    account_type INT NOT NULL,
    approved_by VARCHAR(70) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    approved_at TIMESTAMP,
    FOREIGN KEY (account_type) REFERENCES account_type(id),
    FOREIGN KEY (user_aadhar) REFERENCES users(aadhar),
    FOREIGN KEY (approved_by) REFERENCES users(id),
);