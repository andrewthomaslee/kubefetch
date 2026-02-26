<br />
<div align="center">
    <img src="https://raw.githubusercontent.com/kubernetes/kubernetes/master/logo/logo.png" alt="Kubernetes Logo" width="80" height="80">
  </a>

<h1 align="center">Kubefetch</h1>

  <p align="center">
    A neofetch-inspired application that displays stats about your Kubernetes cluster.
    <br />
    ·
    <a href="https://github.com/andrewthomaslee/kubefetch/issues">Report Bug</a>
    ·
    <a href="https://github.com/andrewthomaslee/kubefetch/issues">Request Feature</a>
  </p>
</div>


## Feel free to open an issue if your Kubernetes distro or some other aspect does not get recognized!

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#usage">Usage</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

### Uses:

Neofetch for Kubernetes Clusters

<br>

![](https://github.com/andrewthomaslee/kubefetch/blob/main/kubefetch.png?raw=true)
![](https://github.com/andrewthomaslee/kubefetch/blob/main/rke2.png?raw=true)

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

### Usage

#### Nix Flake
1. With `nix`
    ```sh
    nix run github:andrewthomaslee/kubefetch
    ```

### Installation

#### Nix Flake
1. Add repo to `flake.nix`
    ```nix
    {
      inputs = {
        kubefetch.url = "github:andrewthomaslee/kubefetch";
        kubefetch.inputs.nixpkgs.follows = "nixpkgs";
      };
    }
    ```

2. Add to `systemPackages`
    ```nix
    {
      environment.systemPackages = [
        inputs.kubefetch.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    }
    ```

#### Make
1. With `make`
    Clone the repo
    ```sh
    git clone https://github.com/andrewthomaslee/kubefetch
    cd kubefetch
    ```

2. Build and install the binary
    ```sh
    make build
    sudo make install
    ```

3. To uninstall, run:
    ```
    sudo make uninstall
    make clean
    ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [x] Auth via kubeconfig
- [ ] AUR package
- [ ] Nixpkgs package
- [x] Nix Flake
- [ ] More displayed info
- [x] CNI used (currently only detection for Cilium, Calico, WeaveNet and Flannel)
- [x] CRI used
- [x] Storage Solution used

See the [open issues](https://github.com/andrewthomaslee/kubefetch/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- LICENSE -->
## License

Distributed under the GNU GPL v3 License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Project Link: [https://github.com/andrewthomaslee/kubefetch](https://github.com/andrewthomaslee/kubefetch)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [k8s@home](https://k8s-at-home.com/)
* [kubefetch](https://github.com/jkulzer/kubefetch)

<p align="right">(<a href="#top">back to top</a>)</p>
