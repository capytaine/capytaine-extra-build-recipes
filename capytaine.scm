;; This file is a tentative of build recipe for the Guix package manager.
;; <https://guix.gnu.org/>

;(define-module (gnu packages python-capytaine)
(define-module (capytaine)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages python)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
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

