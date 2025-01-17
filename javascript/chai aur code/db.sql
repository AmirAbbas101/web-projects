Users 
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('job_seeker', 'employer') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP



CREATE TABLE Users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('job_seeker', 'employer') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Job_Seekers (
  id INT PRIMARY KEY,
  user_id INT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  address VARCHAR(255),
  resume BLOB,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Employers (
  id INT PRIMARY KEY,
  user_id INT,
  company_name VARCHAR(255) NOT NULL,
  company_description TEXT,
  company_logo BLOB,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Jobs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  requirements TEXT NOT NULL,
  salary_range DECIMAL(10, 2),
  location VARCHAR(255) NOT NULL,
  job_type ENUM('full-time', 'part-time', 'internship') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Job_Applications (
  id INT PRIMARY KEY AUTO_INCREMENT,
  job_id INT,
  user_id INT,
  resume BLOB,
  cover_letter TEXT,
  status ENUM('pending', 'accepted', 'rejected') NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (job_id) REFERENCES Jobs(id),
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Resume_Analysis (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  skills TEXT,
  experience TEXT,
  education TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Job_Recommendations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  job_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(id),
  FOREIGN KEY (job_id) REFERENCES Jobs(id)
);

CREATE TABLE Notifications (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  message TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Settings (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  notification_preferences ENUM('on', 'off') NOT NULL DEFAULT 'on',
  account_details TEXT,
  privacy_settings TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE FAQ (
  id INT PRIMARY KEY AUTO_INCREMENT,
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Contact_Us (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Terms_and_Conditions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  agreement TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(20) NOT NULL CHECK (role IN ('job_seeker', 'employer')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE job_seekers (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  address VARCHAR(255),
  resume BYTEA,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_job_seeker_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE employers (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  company_name VARCHAR(255) NOT NULL,
  company_description TEXT,
  company_logo BYTEA,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_employer_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE jobs (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  requirements TEXT NOT NULL,
  salary_range DECIMAL(10, 2),
  location VARCHAR(255) NOT NULL,
  job_type VARCHAR(20) NOT NULL CHECK (job_type IN ('full-time', 'part-time', 'internship')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE job_applications (
  id SERIAL PRIMARY KEY,
  job_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  resume BYTEA,
  cover_letter TEXT,
  status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'accepted', 'rejected')) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_job_application_job FOREIGN KEY (job_id) REFERENCES jobs(id),
  CONSTRAINT fk_job_application_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE resume_analysis (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  skills TEXT,
  experience TEXT,
  education TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_resume_analysis_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE job_recommendations (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  job_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_job_recommendation_user FOREIGN KEY (user_id) REFERENCES users(id),
  CONSTRAINT fk_job_recommendation_job FOREIGN KEY (job_id) REFERENCES jobs(id)
);

CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  message TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_notification_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE settings (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  notification_preferences VARCHAR(20) NOT NULL CHECK (notification_preferences IN ('on', 'off')) DEFAULT 'on',
  account_details TEXT,
  privacy_settings TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_settings_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE faq (
  id SERIAL PRIMARY KEY,
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE contact_us (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE terms_and_conditions (
  id SERIAL PRIMARY KEY,
  agreement TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
