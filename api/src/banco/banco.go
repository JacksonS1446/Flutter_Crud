package banco

import (
	"database/sql"

	_ "github.com/go-sql-driver/mysql" // Driver
)

// Conectar abre a conexão com o banco de dados e a retorna
func Conectar() (*sql.DB, error) {
	StringConexaoBanco := "Lucas_Linhares:Go7/flo2@/projeto?charset=utf8&parseTime=True&loc=Local"

	db, erro := sql.Open("mysql", StringConexaoBanco)
	if erro != nil {
		return nil, erro
	}

	if erro = db.Ping(); erro != nil {
		db.Close()
		return nil, erro
	}

	return db, nil

}
