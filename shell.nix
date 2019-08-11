{ pkgs ? import <nixpkgs> {} }: with pkgs;

mkShell {
  FONTCONFIG_FILE = makeFontsConf { fontDirectories = [ inconsolata-lgc libertine libertinus ]; };
  buildInputs = [
    (texlive.combine {
        inherit (texlive)
        fvextra
        framed
        newtx
        nowidow
        emptypage
        wrapfig
        subfigure
        adjustbox
        collectbox
        tikz-cd
        imakeidx
        idxlayout
        titlesec
        subfiles
        lettrine
        upquote
        libertine
        mweights
        fontaxes
        mdframed
        needspace
        xifthen
        ifnextok
        currfile
        noindentafter
        ifmtarg
        scheme-medium
        listings
        minted
        microtype
        babel
        todonotes
        chngcntr
        ifplatform
        xstring
        minifp
        titlecaps
        enumitem
        l3packages;
      })
    gnumake
    which
    git
    pythonPackages.virtualenv
    pythonPackages.pip
  ];
  shellHook = ''
    virtualenv --no-wheel --no-setuptools venv
    venv/bin/pip install -v https://github.com/hmemcpy/pygments-patched/archive/2.4.2-PATCHED.tar.gz
    venv/bin/pip install -v pygments-style-github
    source venv/bin/activate
  '';
}