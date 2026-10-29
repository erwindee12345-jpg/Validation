#include <iostream>
#include <map>
#include <string>

struct User {
    std::string name;
    int age;
};

std::map<std::string, User> users = {{"alice", {"Alice", 30}}};


User *findUser(const std::string &id) {
    auto it = users.find(id);
    return it == users.end() ? nullptr : &it->second;
}

int main(int argc, char **argv) {
    //CWE 476 Null pointer dereference
    User *user = findUser(argc > 1 ? argv[1] : "alice");
    std::cout << user->name << " is " << user->age << "\n";
    return 0;
}