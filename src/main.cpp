#include <iostream>
#include <fstream>
#include <sstream>
#include "sqlite3.h"

int main(){
    sqlite3* DB;
    int exit = sqlite3_open("bank.db", &DB);
    if (exit != SQLITE_OK){
        std::cerr << "Error opening DB: " << sqlite3_errmsg(DB) << std::endl;
        return -1;
    }
    std::ifstream f("sql/schema.sql");
    if (!f) { std::cerr << "Failed to open schema.sql\n"; sqlite3_close(DB); return -1; }
    std::stringstream buf; buf << f.rdbuf();
    char* err = nullptr;
    if (sqlite3_exec(DB, buf.str().c_str(), nullptr, nullptr, &err) != SQLITE_OK) {
        std::cerr << "Error creating tables: " << err << std::endl; sqlite3_free(err);
    } else {
        std::cout << "Banking schema ensured. \n";
    }

    sqlite3_close(DB);
    return 0;

}