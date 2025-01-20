;; This file is a package module for the Guix package manager https://guix.gnu.org/

(define-module (capytaine)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  )


(define-public python-capytaine-2.0
  (package
    (name "python-capytaine")
    (version "2.0")
    (source (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/capytaine/capytaine")
               (commit "v2.0")))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0gcv6l771xz5rksl14bv6h48ba0002rrcsmvbc5d3xxr5vlzw3aa"))
         ))
    (build-system pyproject-build-system)
    (native-inputs (list python-toolchain gfortran-toolchain meson-python python-pytest))
    (propagated-inputs (list python-numpy python-scipy python-pandas python-xarray))
    (home-page "https://github.com/capytaine/capytaine")
    (synopsis "Python BEM solver for linear potential flow, based on Nemoh")
    (description "Python BEM solver for linear potential flow, based on Nemoh")
    (license license:gpl3)))

(define-public python-capytaine-2.1
  (package
    (name "python-capytaine")
    (version "2.1")
    (source (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/capytaine/capytaine")
               (commit "v2.1")))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1c4893i1ibsvfpdy4wjpnvw9958pq0fxf9l3vcvdakshb5lxpkwd"))
         ))
    (build-system pyproject-build-system)
    (arguments
      `(#:phases
          (modify-phases %standard-phases
              (add-before 'build 'change-home-dir
                ;; Change from /homeless-shelter to /tmp for write permission.
                (lambda _ (setenv "HOME" "/tmp")))))
      )
    (native-inputs (list python-toolchain gfortran-toolchain meson-python python-pytest))
    (propagated-inputs (list python-numpy python-scipy python-pandas python-xarray python-rich))
    (home-page "https://github.com/capytaine/capytaine")
    (synopsis "Python BEM solver for linear potential flow, based on Nemoh")
    (description "Python BEM solver for linear potential flow, based on Nemoh")
    (license license:gpl3)))

(define-public python-capytaine-2.2
  (package
    (name "python-capytaine")
    (version "2.2")
    (source (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/capytaine/capytaine")
               (commit "v2.2")))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0a5xwcpvdg9z4k3p6y2qzyj4wjq8ybwh2mq7cbigrppi2cd1jffv"))
         ))
    (build-system pyproject-build-system)
    (arguments
      `(#:phases
          (modify-phases %standard-phases
              (add-before 'build 'change-home-dir
                ;; Change from /homeless-shelter to /tmp for write permission.
                (lambda _ (setenv "HOME" "/tmp")))))
      )
    (native-inputs (list python-toolchain gfortran-toolchain meson-python python-pytest))
    (propagated-inputs (list python-numpy python-scipy python-pandas python-xarray python-rich))
    (home-page "https://github.com/capytaine/capytaine")
    (synopsis "Python BEM solver for linear potential flow, based on Nemoh")
    (description "Python BEM solver for linear potential flow, based on Nemoh")
    (license license:gpl3)))

(define-public python-capytaine-2.2.1
  (package
    (name "python-capytaine")
    (version "2.2.1")
    (source (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/capytaine/capytaine")
               (commit "v2.2.1")))
         (file-name (git-file-name name version))
         (sha256
          (base32 "07m01x1pc0i3pb4sibbmh51xvrzyq24dyiqnh41cgw9qrscgkxra"))
         ))
    (build-system pyproject-build-system)
    (arguments
      `(#:phases
          (modify-phases %standard-phases
              (add-before 'build 'change-home-dir
                ;; Change from /homeless-shelter to /tmp for write permission.
                (lambda _ (setenv "HOME" "/tmp")))))
      )
    (native-inputs (list python-toolchain gfortran-toolchain meson-python python-pytest))
    (propagated-inputs (list python-numpy python-scipy python-pandas python-xarray python-rich))
    (home-page "https://github.com/capytaine/capytaine")
    (synopsis "Python BEM solver for linear potential flow, based on Nemoh")
    (description "Python BEM solver for linear potential flow, based on Nemoh")
    (license license:gpl3)))

(define-public python-capytaine python-capytaine-2.2.1)


(define-public python-meshmagick
 (package
   (name "python-meshmagick")
   (version "2023-06-12")
   (source (origin
     (method git-fetch)
     (uri (git-reference
            (url "https://github.com/LHEEA/meshmagick")
            (commit "3f98d03717bc15f204019b205847a6d75baaad45")))
     (file-name (git-file-name name version))
     (sha256 (base32 "0z4f9j39xqdng2js2ls65za8lzfbaig84q4aya2fz6wz9skg2p7v"))
     ))
   (build-system python-build-system)
   (arguments 
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
                      (delete 'sanity-check)
       )))
   (native-inputs (list python-toolchain python-pytest))
   (propagated-inputs (list python-numpy python-argcomplete python-scipy vtk))
   (home-page "https://github.com/lheea/meshmagick")
   (synopsis "A command line tool and a python package to manipulate hydrodynamics meshes ")
   (description "A command line tool and a python package to manipulate hydrodynamics meshes ")
   (license license:gpl3)))


(define-public nemoh
 (package
   (name "nemoh")
   (version "3.0.2")
   (source (origin
     (method git-fetch)
     (uri (git-reference
            (url "https://gitlab.com/lheea/Nemoh")
            (commit "v3.0.2")))
     (file-name (git-file-name name version))
     (sha256 (base32 "1wzbkdc9dqljxfbkh0rrnaxy0b5mpjv9g7l8hbwkh5z6ini14jaw"))
     ))
   (build-system cmake-build-system)
   (arguments 
     `(#:tests? #f ; There is no test target.
       #:phases
       (modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
                   (lambda _
                     (invoke "make" "build")))
          (replace 'install
                   (lambda* (#:key inputs outputs #:allow-other-keys)
                            (let* ((out (assoc-ref outputs "out"))
                                   (bin (string-append out "/bin")))
                              (for-each (lambda (file)
                                          (install-file (string-append "bin/" file) bin))
                                        (list "preProc" "solver" "mesh" "postProc" "hydrosCal" "QTFpreProc" "QTFsolver" "QTFpostProc"))
                              ))))))
   (native-inputs (list gfortran-toolchain openblas))
   (home-page "https://gitlab.com/lheea/Nemoh")
   (synopsis "")
   (description "")
   (license license:gpl3)))


(define-public hams
 (package
   (name "hams")
   (version "2023-09-08")
   (source (origin
     (method git-fetch)
     (uri (git-reference
            (url "https://github.com/YingyiLiu/HAMS")
            (commit "578d74aa144ce1f4f05453d672d52f5f6f69bc6a")))
     (file-name (git-file-name name version))
     (sha256 (base32 "0kr5x2hi3aqss32pc07wmwysc0m502wwmfa8i0fxjmfzi6w3hl5m"))
     ))
   (build-system gnu-build-system)
   (arguments 
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
                   (lambda* (#:key make-flags #:allow-other-keys)
                     (invoke "make" "-C" "SourceCode")))
          (replace 'install
                   (lambda* (#:key outputs #:allow-other-keys)
                            (let* ((out (assoc-ref outputs "out"))
                                   (bin (string-append out "/bin")))
                                   (install-file "SourceCode/hams" bin))
                              )))))
   (native-inputs (list gfortran-toolchain lapack))
   (home-page "https://github.com/YingyiLiu/HAMS")
   (synopsis "An open-source computer program for the analysis of wave diffraction and radiation of three-dimensional floating or submerged structures")
   (description "An open-source computer program for the analysis of wave diffraction and radiation of three-dimensional floating or submerged structures")
   (license license:asl2.0)))

