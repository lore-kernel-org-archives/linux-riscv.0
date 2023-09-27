Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E478E82CB0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXRIW9QhewELKi6I27AcPV27IA3cIXSFuVd6O3K/40k=; b=l1pbcZpJtrwuZBEycJMmBv8wDD
	rzNHHIaFRvXWzP9EApmHRx6K074/YjBu7yKE6nFk3tRH4ksoVAJ0CTB7VpDn8H1zJ+HoyUYgmyl4S
	jDrPbZwCTL3I5B3gNH8xkbKx7jTosxKBY1I52fCG+nN52a+ALb1YtWbrinzA7AQSAbhvd9cOFOtL3
	4Kvj/slH607cWC5HEzhWGTkaT/XDc3onMdQA/RPwXEyZY2xGmlwQcgqnwV5Q59NE+nIhmJe/lrJUN
	zx4iZAOIb3cVUY4+70Hg+FnvMJvZ7dpLNoOWAEU0cUNifEPzEPhxj6PF74zNtO8UXhvh7Qma3qlHb
	Ek3f9CNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlX6S-001PBt-0N;
	Wed, 27 Sep 2023 16:09:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlX6O-001P8B-2H
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 16:09:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8AB90CE1A9E;
	Wed, 27 Sep 2023 16:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1129EC433C8;
	Wed, 27 Sep 2023 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695830965;
	bh=pmRruatf2M9pzkEo2JKtfbJP2YXPb720+qamJp+IFyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jR96pQtws9uyhqhzizi6OsL9l47QXKahoiAij7YDdcoRv6vvZEO2U7dR//hIO1FMl
	 kB9tK82+EcAsuUqwSnRjbmXbKJUadzH5qFNNnMs7uyb2hTxQJaptqGVreNT6ROcmdS
	 Ap/u4J/k/sdRqi9QLBh9R6jYSpgGf72+ZnDiA8oJTOszV3bL5uJRfxOxBZ2VMwIASr
	 X6Be9rw+uejWPx7bZ4jo6oH8hkzM52B6kdliHF3DttBmbGgavC1etAu0gX+b1nvDKR
	 rwWzzxmmyBWCJQo3A/K6lab1mSd9E/BoHs3eBZD+CTKhOS0aX/gNOd3CNG14a4yjDk
	 dwgeyngHArgPQ==
Date: Wed, 27 Sep 2023 17:09:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, devicetree@vger.kernel.org,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, apatel@ventanamicro.com
Subject: Re: [PATCH v3 00/11] Add Milk-V Pioneer RISC-V board support
Message-ID: <20230927-ebony-duress-44ff45d3d253@spud>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_090929_090733_AF872DD6 
X-CRM114-Status: GOOD (  21.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5201189873615273332=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5201189873615273332==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hWL+YiRJ6exvVByO"
Content-Disposition: inline


--hWL+YiRJ6exvVByO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Sep 27, 2023 at 04:54:38PM +0800, Chen Wang wrote:
> Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 [2]
> in a standard mATX form factor. Add minimal device
> tree files for the SG2042 SOC and the Milk-V Pioneer board.
>=20
> Now only support basic uart drivers to boot up into a basic console.
>=20
> Thanks,
> Chen
>=20
> ---
>=20
> Changes in v3:
>   The patch series is based on v6.6-rc1. You can simply review or test=20
>   the patches at the link [5].
>   - add new vendor specific compatible strings to identify timer/mswi for=
 sg2042 clint
>   - updated maintainers info. for sophgo devicetree
>   - remove the quirk changes for uart
>   - updated dts, such as:
>     - add "riscv,isa-base"/"riscv,isa-extensions" for cpus
>     - update l2 cache node's name
>     - remove memory and pmu nodes
>   - fixed other issues as per input from reviewers.

v3 looks better indeed. I had some comments on the bindings and dt
patches, but none were particularly major.

Thanks,
Conor.

>=20
> Changes in v2:
>   The patch series is based on v6.6-rc1. You can simply review or test=20
>   the patches at the link [4].
>   - Improve format for comment of commitments as per input from last revi=
ew.
>   - Improve format of DTS as per input from last review.
>   - Remove numa related stuff from DTS. This part is just for optimizatio=
n, may
>     add it later if really needed.=20
>=20
> Changes in v1:
>    The patch series is based on v6.6-rc1. Due to it is not sent in thread,
>    I have listed permlinks of the patchset [v1-0/12] ~ [v1-12/12] here fo=
r=20
>    quick reference. You can simply review or test the patches at the link=
 [3].
>=20
> [1]: https://milkv.io/pioneer
> [2]: https://en.sophgo.com/product/introduce/sg2042.html
> [3]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal
> [4]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minima=
l-v2
> [5]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minima=
l-v3
> [v1-0/12]:https://lore.kernel.org/linux-riscv/20230915070856.117514-1-wan=
gchen20@iscas.ac.cn/
> [v1-1/12]:https://lore.kernel.org/linux-riscv/20230915071005.117575-1-wan=
gchen20@iscas.ac.cn/
> [v1-2/12]:https://lore.kernel.org/linux-riscv/20230915071409.117692-1-wan=
gchen20@iscas.ac.cn/
> [v1-3/12]:https://lore.kernel.org/linux-riscv/20230915072242.117935-1-wan=
gchen20@iscas.ac.cn/
> [v1-4/12]:https://lore.kernel.org/linux-riscv/20230915072333.117991-1-wan=
gchen20@iscas.ac.cn/
> [v1-5/12]:https://lore.kernel.org/linux-riscv/20230915072358.118045-1-wan=
gchen20@iscas.ac.cn/
> [v1-6/12]:https://lore.kernel.org/linux-riscv/20230915072415.118100-1-wan=
gchen20@iscas.ac.cn/
> [v1-7/12]:https://lore.kernel.org/linux-riscv/20230915072431.118154-1-wan=
gchen20@iscas.ac.cn/
> [v1-8/12]:https://lore.kernel.org/linux-riscv/20230915072451.118209-1-wan=
gchen20@iscas.ac.cn/
> [v1-9/12]:https://lore.kernel.org/linux-riscv/20230915072517.118266-1-wan=
gchen20@iscas.ac.cn/
> [v1-10/12]:https://lore.kernel.org/linux-riscv/20230915072558.118325-1-wa=
ngchen20@iscas.ac.cn/
> [v1-11/12]:https://lore.kernel.org/linux-riscv/20230915072624.118388-1-wa=
ngchen20@iscas.ac.cn/
> [v1-12/12]:https://lore.kernel.org/linux-riscv/20230915072653.118448-1-wa=
ngchen20@iscas.ac.cn/
>=20
> ---
>=20
> Chen Wang (9):
>   riscv: Add SOPHGO SOC family Kconfig support
>   dt-bindings: vendor-prefixes: add milkv/sophgo
>   dt-bindings: riscv: add sophgo sg2042 bindings
>   dt-bindings: riscv: Add T-HEAD C920 compatibles
>   dt-bindings: interrupt-controller: Add Sophgo SG2042 PLIC
>   MAINTAINERS: add two files to sophgo devicetrees entry
>   riscv: dts: add initial Sophgo SG2042 SoC device tree
>   riscv: dts: sophgo: add Milk-V Pioneer board device tree
>   riscv: defconfig: enable SOPHGO SoC
>=20
> Inochi Amaoto (2):
>   dt-bindings: timer: Add Sophgo sg2042 CLINT timer
>   dt-bindings: interrupt-controller: Add Sophgo sg2042 CLINT mswi
>=20
>  .../sifive,plic-1.0.0.yaml                    |    1 +
>  .../sophgo,sg2042-clint-mswi.yaml             |   42 +
>  .../devicetree/bindings/riscv/cpus.yaml       |    1 +
>  .../devicetree/bindings/riscv/sophgo.yaml     |   28 +
>  .../timer/sophgo,sg2042-clint-mtimer.yaml     |   42 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    4 +
>  MAINTAINERS                                   |    9 +
>  arch/riscv/Kconfig.socs                       |    5 +
>  arch/riscv/boot/dts/Makefile                  |    1 +
>  arch/riscv/boot/dts/sophgo/Makefile           |    3 +
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi   | 1880 +++++++++++++++++
>  .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   19 +
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  325 +++
>  arch/riscv/configs/defconfig                  |    1 +
>  14 files changed, 2361 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/sophgo,sg2042-clint-mswi.yaml
>  create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml
>  create mode 100644 Documentation/devicetree/bindings/timer/sophgo,sg2042=
-clint-mtimer.yaml
>  create mode 100644 arch/riscv/boot/dts/sophgo/Makefile
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi
>=20
>=20
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> --=20
> 2.25.1
>=20

--hWL+YiRJ6exvVByO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRRTsAAKCRB4tDGHoIJi
0g2VAP94H8Rvt71Dyd1ixHqaF/1R9iWXaooJa0Ox8fcBHEmoPwEA8ZKSS56p54kM
xq1y2pntP9lgfuaqPB5L9vQ68YmtCAQ=
=efvp
-----END PGP SIGNATURE-----

--hWL+YiRJ6exvVByO--


--===============5201189873615273332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5201189873615273332==--

