<br />
<div align="center">
    <img src="https://raw.githubusercontent.com/kubernetes/kubernetes/master/logo/logo.png" alt="Kubernetes Logo" width="240" height="240">
</div>

<p align="center">
  <a href="https://github.com/andrewthomaslee/kubefetch/releases"><img src="https://img.shields.io/github/v/release/andrewthomaslee/kubefetch?include_prereleases&style=for-the-badge" alt="Latest Release"></a>
  <a href="https://github.com/andrewthomaslee/kubefetch/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/andrewthomaslee/kubefetch/ci.yml?style=for-the-badge" alt="CI Status"></a>
  <a href="https://github.com/andrewthomaslee/kubefetch/blob/main/LICENSE"><img src="https://img.shields.io/github/license/andrewthomaslee/kubefetch?style=for-the-badge&color=blue" alt="License"></a>
</p>

<p align="center">
  <a href="https://github.com/andrewthomaslee/kubefetch"><img src="https://img.shields.io/badge/github-repo-24292e?logo=github&style=for-the-badge" alt="GitHub Repo"></a>
  <a href="https://flakehub.com/flake/andrewthomaslee/kubefetch?view=usage"><img src="https://img.shields.io/badge/flakehub-repo-purple?style=for-the-badge" alt="FlakeHub Repo"></a>
</p>



<h1 align="center">Kubefetch</h1>
  <p align="center">
    <h3 align="center"><strong>A <u>neofetch-inspired</u> CLI that displays stats about your <u>Kubernetes</u>☸️ cluster</strong></h3>
  </p>
</div>



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

### Kubefetch in Action:

<br>

![](docs/assets/k3s.png?raw=true)
![](docs/assets/rke2.png?raw=true)

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

### Usage

#### Show
```console
nix flake show "https://flakehub.com/f/andrewthomaslee/kubefetch/*"
```

#### Run
```console
nix run "https://flakehub.com/f/andrewthomaslee/kubefetch/*" -- --help
```

#### Docker
Run it with a mounted kubeconfig:
```console
docker run --rm \
  -e KUBECONFIG=/kubeconfig/config \
  -v "$HOME/.kube:/kubeconfig:ro" \
  kubefetch:latest
```


#### Installation

##### Nix Flake
1. Add repo to `flake.nix`
  ```nix
  {
    inputs.kubefetch.url = "https://flakehub.com/f/andrewthomaslee/kubefetch/0.9.*";

    outputs = { self, kubefetch }: {
      # Use in your outputs
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

##### OCI Container
The flake also exposes an `oci-kubefetch` output with the binary in a minimal OCI image, for use with the Docker CLI or in OCI environments like Kubernetes.

```console
nix build "https://flakehub.com/f/andrewthomaslee/kubefetch/*"#oci-kubefetch
docker load < result
```

Run it with a mounted kubeconfig:
```console
docker run --rm \
  -e KUBECONFIG=/kubeconfig/config \
  -v "$HOME/.kube:/kubeconfig:ro" \
  kubefetch:latest
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


### Feel free to open an issue if your Kubernetes distro or some other aspect does not get recognized!
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
