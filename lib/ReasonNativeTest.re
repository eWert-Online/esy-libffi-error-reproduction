let rec migrate = () => {
  print_endline("🦔");
  migrate |> Lwt.bind(Lwt_unix.sleep(2.0));
};

let run = () => {
  migrate() |> Lwt_main.run;
};
