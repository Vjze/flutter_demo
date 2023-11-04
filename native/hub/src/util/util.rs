use tiberius::{AuthMethod, Client, Config};
use tokio::net::TcpStream;
use tokio_util::compat::{Compat, TokioAsyncWriteCompatExt};

pub async fn client() -> Client<Compat<TcpStream>> {
    let mut config = Config::new();
    config.host("192.168.2.189");
    config.port(1433);
    config.database("mes_Factory");
    config.authentication(AuthMethod::sql_server("hztest", "hztest"));
    config.trust_cert();
    let tcp = TcpStream::connect(config.get_addr()).await.unwrap();
    tcp.set_nodelay(true).unwrap();

    tiberius::Client::connect(config, tcp.compat_write())
        .await
        .unwrap()
}

// pub async fn client_1()->Client<Compat<TcpStream>>{
//     let mut config = Config::new();
//     config.host("192.168.2.189");
//     config.port(1433);
//     config.database("mes_Factory");
//     config.authentication(AuthMethod::sql_server("hztest", "hztest"));
//     config.trust_cert();
//     let tcp = TcpStream::connect(config.get_addr()).await.unwrap();
//     tcp.set_nodelay(true).unwrap();
//     let client = tiberius::Client::connect(config, tcp.compat_write())
//         .await
//         .unwrap();
//     client
// }

// pub async fn client_2()->Client<Compat<TcpStream>>{
//     let mut config = Config::new();
//     config.host("192.168.2.189");
//     config.port(1433);
//     config.database("mes_Factory");
//     config.authentication(AuthMethod::sql_server("hztest", "hztest"));
//     config.trust_cert();
//     let tcp = TcpStream::connect(config.get_addr()).await.unwrap();
//     tcp.set_nodelay(true).unwrap();
//     let client = tiberius::Client::connect(config, tcp.compat_write())
//         .await
//         .unwrap();
//     client
// }

pub async fn sn_client() -> Client<Compat<TcpStream>> {
    let mut config = Config::new();
    config.host("192.168.2.189");
    config.port(1433);
    config.database("BOSAautotest_Data");
    config.authentication(AuthMethod::sql_server("hztest", "hztest"));
    config.trust_cert();
    let tcp = TcpStream::connect(config.get_addr()).await.unwrap();
    tcp.set_nodelay(true).unwrap();

    tiberius::Client::connect(config, tcp.compat_write())
        .await
        .unwrap()
}

pub async fn login_check() -> Client<Compat<TcpStream>> {
    let mut config = Config::new();
    config.host("192.168.2.189");
    config.port(1433);
    config.database("login");
    config.authentication(AuthMethod::sql_server("hztest", "hztest"));
    config.trust_cert();
    let tcp = TcpStream::connect(config.get_addr()).await.unwrap();
    tcp.set_nodelay(true).unwrap();

    tiberius::Client::connect(config, tcp.compat_write())
        .await
        .unwrap()
}
