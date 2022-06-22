package router

import (
	"api/src/controllers"
	"api/src/middlewares"
	"fmt"
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"log"
	"net/http"
)

// Gerar vai retornar um router com as rotas configuradas
func Gerar() {
	r := chi.NewRouter()

	// IMPRIME UM LOG COM INFORMAÇÕES DE CADA ROTA BUSCADA
	r.Use(middleware.Logger)

	// ROTAS ṔRIVADAS
	r.Group(func(r chi.Router) {
		r.Get("/usuarios", middlewares.Autenticar(controllers.BuscarUsuarios))
		r.Get("/usuarios/{id}", middlewares.Autenticar(controllers.BuscarUsuario))
		r.Delete("/usuarios/{id}", middlewares.Autenticar(controllers.DeletarUsuario))
		r.Put("/usuarios/{id}", middlewares.Autenticar(controllers.AtualizarUsuario))
	})

	// ROTAS PUBLICAS
	r.Group(func(r chi.Router) {
		r.Post("/usuarios", controllers.CriarUsuario)
		r.Post("/login", controllers.Login)
	})

	fmt.Println("Escutando na porta 5000")
	log.Fatal(http.ListenAndServe(":5000", r))
}
