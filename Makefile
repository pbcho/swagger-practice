#### OpenAPI関連 Makefile #####

run:  ## openapiの定義ファイルから、editor, ui, mockサーバを起動する。
	docker-compose --compatibility up -d --build
	@echo "Access below..."
	@echo "-------------------------------"
	@echo "ui   => http://127.0.0.1:8002"
	@echo "-------------------------------"
	@echo "mock => http://127.0.0.1:8003"

down:  ## 起動中のeditor, ui, mockサーバを停止する。
	docker-compose down

list:  ## swaggerの定義ファイルから、生成可能な言語一覧を表示する。
	docker run --rm \
		openapitools/openapi-generator-cli list

mfs:  ## openapiで利用するmulti-file-swaggerをインストールする。
	npm install -g multi-file-swagger

cat:  ## 分割されたopenapiのファイルを１つに結合する。
	multi-file-swagger -o yaml ./index.yaml > ./openapi.yaml