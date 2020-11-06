{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  version = "unstable-2010-12-10";
  pname = "ttimage_tools";

  src = fetchFromGitHub {
    owner = "Rupan";
    repo = "tomtom";
    rev = "9cf8f96c91970a4773c86b94e0d93d9d2a1cf0de";
    sha256 = "1x4p1lcca780w22zmykxmmbldgrbm6ppwa5m9kf796hsinsnhyk3";
  };

  buildPhase = "
    $CC -Ilib lib/*.c mkttimage.c -o mkttimage
    $CC ttimgextract.c -o ttimgextract
  ";

  installPhase = ''
    install -Dm755 ttimgextract $out/bin/ttimgextract
    install -Dm755 mkttimage $out/bin/mkttimage
  '';
}
