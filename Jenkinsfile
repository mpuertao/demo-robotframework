pipeline {
    agent any

    environment {
        PYTHON_ENV = 'env'  // Directorio para entorno virtual
    }

    stages {
        stage('Preparar Entorno') {
            steps {
                script {
                    // Clonar el repositorio desde GitHub
                    checkout scm
                }

                // Instalar Python y dependencias
                sh '''
                    python3 -m venv ${PYTHON_ENV}
                    source ${PYTHON_ENV}/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Ejecutar Pruebas') {
            steps {
                // Ejecutar pruebas usando la tarea de Robot Framework
                robot runTests: true, outputPath: 'results', outputFileName: 'output.xml', testCases: '**/webpage_bg.robot'
            }
            post {
                always {
                    // Publicar reportes, incluso si las pruebas fallan
                    archiveArtifacts artifacts: 'results/*.html', allowEmptyArchive: true
                }
                success {
                    echo 'Pruebas completadas con éxito'
                }
                failure {
                    echo 'Hubo errores en las pruebas'
                }
            }
        }

        stage('Publicar Reportes') {
            steps {
                // Publicar los resultados en Jenkins
                publishHTML (target: [
                    reportDir: 'results',
                    reportFiles: 'report.html, log.html',
                    reportName: 'Robot Framework Test Report'
                ])
            }
        }
    }

    post {
        always {
            // Limpiar el entorno de Python
            sh 'rm -rf ${PYTHON_ENV}'
        }
        cleanup {
            echo 'Limpieza completa'
        }
    }
}
