FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY src/ ./src/
COPY web/ ./web/
COPY dados/ ./dados/

RUN mkdir -p out && javac --add-modules jdk.httpserver -encoding UTF-8 -d out $(find src -name "*.java")

ENV DATA_DIR=/app/dados

CMD ["java", "--add-modules", "jdk.httpserver", "-cp", "out", "br.com.pesca.main.ServidorWeb"]
