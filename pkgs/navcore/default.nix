{ stdenv, lib, fetchzip, cabextract}:

let
  pname = "navcore";
  version = "8.010.9369";
  name = "${pname}-${version}";
in

fetchzip {
    url = "http://download.tomtom.com/sweet/navcore/navcore_8.010.9369.onev6.cab";
    sha256 = "165qirxjmxn4vms43pys608j3bp8xabzz5408f9il4j2hni88h50";
    
    postFetch = ''
      ${cabextract}/bin/cabextract $downloadedFile --directory $out
    '';

    meta = with lib; {
      description = "Official Tomtom Go firmware";
      homepage = https://www.tomtom.com;
      license = licenses.unfree;
      maintainers = [ maintainers.genesis ];
    };
}
