package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type Tasks struct {
	ID          string `json:"id"`
	TaskName    string `json:"task_name"`
	TaskDetails string `json:"task_detail"`
	Date        string `json:"date"`
}

var tasks []Tasks

func allTasks() {
	task1 := Tasks{
		ID:          "1",
		TaskName:    "New Project",
		TaskDetails: "Create a new project",
		Date:        "2021-07-01",
	}

	tasks = append(tasks, task1)

	task2 := Tasks{
		ID:          "2",
		TaskName:    "GO Project",
		TaskDetails: "Golang project",
		Date:        "2021-07-01",
	}

	tasks = append(tasks, task2)
	fmt.Println("your tasks are ", tasks)
}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Welcome to the homepage")
}

func getTasks(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
}

func getTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	taskID := mux.Vars(r)["id"]
	for _, task := range tasks {
		if task.ID == taskID {
			json.NewEncoder(w).Encode(task)
			return
		}
	}
	json.NewEncoder(w).Encode(map[string]string{"error": "Task not found"})
}

func createTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var newTask Tasks
	_ = json.NewDecoder(r.Body).Decode(&newTask)
	tasks = append(tasks, newTask)
	json.NewEncoder(w).Encode(newTask)
}

func deleteTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	taskID := mux.Vars(r)["id"]
	for index, task := range tasks {
		if task.ID == taskID {
			tasks = append(tasks[:index], tasks[index+1:]...)
			json.NewEncoder(w).Encode(map[string]string{"message": "Task deleted successfully"})
			return
		}
	}
	json.NewEncoder(w).Encode(map[string]string{"error": "Task not found"})
}

func updateTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	taskID := mux.Vars(r)["id"]
	var updatedTask Tasks
	_ = json.NewDecoder(r.Body).Decode(&updatedTask)
	for index, task := range tasks {
		if task.ID == taskID {
			tasks[index] = updatedTask
			json.NewEncoder(w).Encode(updatedTask)
			return
		}
	}
	json.NewEncoder(w).Encode(map[string]string{"error": "Task not found"})
}

func handleRoutes() {
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/gettasks", getTasks).Methods("GET")
	router.HandleFunc("/gettask/{id}", getTask).Methods("GET")
	router.HandleFunc("/create", createTask).Methods("POST")
	router.HandleFunc("/delete/{id}", deleteTask).Methods("DELETE")
	router.HandleFunc("/update/{id}", updateTask).Methods("PUT")
	log.Fatal(http.ListenAndServe(":8080", router))
}

func main() {
	allTasks()
	fmt.Println("Hello World")
	handleRoutes()
}
