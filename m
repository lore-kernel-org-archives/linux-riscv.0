Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B816C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sscH/Q59EDeOeykpQVOYAEelsKFTjld/SmvIDpwnrsg=; b=Nj72NdoVLISC+SZjg9rcQKVybN
	VaY2QjV96cDB4QTiHDuBM68yKtqtAXnBbb3q5t5YHno3/vISVMIv/EOQqN7UktIRYaZ/bj7eY+Zsv
	8AU8NOZiBuSkUDKexh5mLoyvVi5vrwoMW0R8A2/UA8Fp/vfiSGU+0qtUnqBqa+TdkCcpa/nokM/mj
	uWRjPZgfWS5+rWYjTAi8F6t9PidSscRO5xjvWgT9Gs9HU8t2cGlhp2mX9SgG0ME6FIfECj55RSExl
	eHC45ewHF10DLYgtYKAmJAA8GVkSGtCi06zmwVtcT1wXSby0Y4TucyIxhAN99e3mowCXlQmeOXp4m
	jV7UpJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhDXw-0000000AHKw-3oAb;
	Mon, 04 Mar 2024 19:00:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhDXs-0000000AHKF-3B6i
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 19:00:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3A4B9CE138D;
	Mon,  4 Mar 2024 19:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68129C433C7;
	Mon,  4 Mar 2024 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709578813;
	bh=SWDsJO4ZHNXRWOcWTB3PKNmeEVWvRKfUX+uqo98LLi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DERdcgyrjXto8iQ69aYWa2VEWcp0xllWKxDjq4BNdq95iZSzXZ/uUDvz8YeZBouA+
	 pT+yax23HQKzVr1KWd0OZ/F2ZBZJ2y+5vRRvffZC8eRABcrSPibC3K5ep21WV6x46l
	 y1rjNu3Ui/i+jkvWwJj8qSQhKFzLbJtaQNe3OnRsLzILkc/ImLhsPPDBlN6ugYh4Lr
	 xH8knnTEHFVtwgjrOv0MNz/qLJkXYfXrHuQq5xZglDpGnUSQraokeB4NpoM2MR6ynv
	 pkdKTG2RI3BUkDypfAVKeOVoNHACr/lETGerfqzZhGLJrf4ETLbKlDcK3Jeirx74mX
	 LOD3XIJBkAvgw==
Date: Mon, 4 Mar 2024 19:00:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] riscv: dts: add initial canmv-k230 and k230-evb dts
Message-ID: <20240304-veteran-frightful-b0700233c98f@spud>
References: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
 <tencent_1DB2D1914F4E30569BC4B103B724A6214405@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_1DB2D1914F4E30569BC4B103B724A6214405@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_110017_180196_3E49E969 
X-CRM114-Status: GOOD (  24.35  )
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
Content-Type: multipart/mixed; boundary="===============6074010712590924082=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6074010712590924082==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UYXkKkp3DI44EvOn"
Content-Disposition: inline


--UYXkKkp3DI44EvOn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

Meant to reply here earlier but I got distracted.

On Sun, Mar 03, 2024 at 09:26:26PM +0800, Yangyu Chen wrote:
> Add initial dts for CanMV-K230 and K230-EVB powered by Canaan Kendryte
> K230 SoC [1].
>=20
> Some key considerations:
> - Only enable BigCore which is 1.6GHz RV64GCBV
>=20
> Since is there cache coherence between two cores remains a mystery since
> they have a dedicated L2 Cache. And the factory SDK uses it for other OS
> by default.
>=20
> Meanwhile, although docs from Canaan said 1.6GHz Core with Vector is
> CPU1, the csr.mhartid of this core is 0.
>=20
> - Support for "zba" "zbb" "zbc" "zbs" are tested by hand
>=20
> The user manual of C908 from T-Head does not document it specifically.
> It just said it supports B extension V1.0-rc1. [2]
>=20
> - Support for "zicbom" is tested by hand
>=20
> Have tested with some out-of-tree drivers that need DMA and they do not
> come to the dts currently.
>=20
> - Cache parameters are inferred from T-Head docs [2] and Cannan docs [1]
>=20
> L1i: 32KB, VIPT 4-Way set-associative, 64B Cacheline
> L1d: 32KB, VIPT 4-Way set-associative, 64B Cacheline
> L2: 256KB, PIPI 16-way set-associative, 64B Cacheline
>=20
> The numbers of cache sets are calculated from these parameters.
>=20
> - MMU only supports Sv39
>=20
> Since T-Head docs [2] says C908 should support sv48. However, it will fail
> during the kernel probe. I also tested it by hand on M-Mode software,
> writing sv48 to satp.mode will not trap but will leave the csr unchanged.
>=20
> [1] https://developer.canaan-creative.com/k230/dev/zh/00_hardware/K230_da=
tasheet.html#chapter-1-introduction
> [2] https://occ-intl-prod.oss-ap-southeast-1.aliyuncs.com/resource//16992=
68369347/XuanTie-C908-UserManual.pdf
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  arch/riscv/boot/dts/canaan/Makefile       |   2 +
>  arch/riscv/boot/dts/canaan/canmv-k230.dts |  23 ++++

Could you name this file "k230-canmv.dts" please, so that the soc comes
first?

>  arch/riscv/boot/dts/canaan/k230-evb.dts   |  23 ++++
>  arch/riscv/boot/dts/canaan/k230.dtsi      | 146 ++++++++++++++++++++++
>  4 files changed, 194 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/canmv-k230.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-evb.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k230.dtsi
>=20
> diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/ca=
naan/Makefile
> index 987d1f0c41f0..b4a0ec668f9a 100644
> --- a/arch/riscv/boot/dts/canaan/Makefile
> +++ b/arch/riscv/boot/dts/canaan/Makefile
> @@ -5,3 +5,5 @@ dtb-$(CONFIG_ARCH_CANAAN) +=3D sipeed_maix_bit.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) +=3D sipeed_maix_dock.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) +=3D sipeed_maix_go.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) +=3D sipeed_maixduino.dtb
> +dtb-$(CONFIG_ARCH_CANAAN) +=3D k230-evb.dtb
> +dtb-$(CONFIG_ARCH_CANAAN) +=3D canmv-k230.dtb
> \ No newline at end of file
> diff --git a/arch/riscv/boot/dts/canaan/canmv-k230.dts b/arch/riscv/boot/=
dts/canaan/canmv-k230.dts
> new file mode 100644
> index 000000000000..09777616d30e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/canmv-k230.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0+

Is there a reason that you only put these under GPL-2.0+?
The usual license for DT stuff is (GPL-2.0 OR BSD-2-Clause), dual
licensing makes it easier for other projects to use the devicetrees.

> +
> +		plic: interrupt-controller@f00000000 {
> +			compatible =3D "thead,c900-plic";
> +			reg =3D <0xf 0x00000000 0x0 0x04000000>;
> +			interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			reg-names =3D "control";
> +			#address-cells =3D <0>;
> +			#interrupt-cells =3D <2>;
> +			riscv,ndev =3D <208>;
> +		};
> +
> +		clint: timer@f04000000 {
> +			compatible =3D "thead,c900-clint";
> +			reg =3D <0xf 0x04000000 0x0 0x04000000>;
> +			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};

Both of these should have SoC-specific compatibles. Without them, this
should not pass dtbs_check. Did you run it?

Cheers,
Conor.


--UYXkKkp3DI44EvOn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYaOQAKCRB4tDGHoIJi
0jU9AP9wbUelD6ratQqXy2IleW+7MGXimY6JP5GbRbgIUomb2gD+O6cGO3g9VH5+
vpEpWkPBpVWXpFbpnYKra7HLPzeuJQE=
=2txQ
-----END PGP SIGNATURE-----

--UYXkKkp3DI44EvOn--


--===============6074010712590924082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6074010712590924082==--

