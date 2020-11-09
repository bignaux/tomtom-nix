{ stdenv, lib, cpio, navcore, ttimage_tools }:

stdenv.mkDerivation rec {
  pname = "gltt";
  version = "1"; # navcore.version;
  name="${pname}-${version}";

  nativeBuildInputs = [ cpio navcore ttimage_tools ];

  # https://github.com/navit-gps/NavitTom#how-to-install-gltt-from-tomtom-ttsystem-file-for-navit
  src = "${navcore}/ttsystem";
  phases = [ "unpackPhase" "installPhase" ];

  unpackPhase = ''
    cp $src .
    # fix ttimgextract to exit 0 when running fine ?
    ttimgextract ./ttsystem & echo "bin/gltt" > file-to-extract
    gunzip -c ./ttsystem.0 | cpio -idv -E "file-to-extract"
  '';

  installPhase = ''
    install -Dm755 ./bin/gltt $out/bin/gltt
  '';

  meta = navcore.meta;
}
