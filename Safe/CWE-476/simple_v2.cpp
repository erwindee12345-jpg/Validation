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
    //FIX: Validate the pointer before dereferencing it
    User *user = findUser(argc > 1 ? argv[1] : "alice");
    if (user == nullptr) {
        std::cerr << "error: user not found\n";
        return 1;
    }
    std::cout << user->name << " is " << user->age << "\n";
    return 0;
}