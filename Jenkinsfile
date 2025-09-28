pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/toibithieunangvcl/chattingshit.git',
                    branch: 'main',
                    credentialsId: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDR82yMWHWhKNVOUGv7xpgVQIfg31Sj8oBJieS03iPd0H0PvEkCkai5yP1bkPzFpHacuL5snFVehciEmZy4L4Xqx4BBpJxfzSvz4QGQbJT9yqgtwaxu1pJZIandbZYzciJEDwhK18jnlLyLIQP8nZ1SSABhBXXLDYd511+YUnoKUwtmgknN+GhZoQTdiNyIi/41YRoZ+O7G6OSrKqQdgWmfhYNrhkUzDPnMsrMdRJklhOCfRne89RaEqOAhgbUgG2AzjObJnKZUYFAFKP2Iz/5pwd86WBhi8dm9D+JtWVlZC3YUrZ8T2HHfzhMh5b7+KfHi8EnaufwG3jSy8wiJorAfIhBiln2R+HGfiUc7HborsQgyW6rRMH7MHPCdh1T5+s/kNt5KdzqBRx8qedOx8Y2Fh2aQmSClk/HaVYVBzW7nNOy9Lv0a18W0H3otY6+8rirrkkzw6YyjBj9365pEBAv/DxgR/GJPNLa1QIlVFqUdArwFUFV5WelqHuiBNkHFQM8= vutuantom@DESKTOP-G61LRED' // nếu là private repo
            }
        }
    }
}
