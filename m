Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80928C5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxRnTuNXERHLQj34ZA5hZj+JtNPJSF2VBOWTZnN90U0=; b=zOjLCcxYq+Y/cLrJNx5LJ/CIrV
	l3IjMIFt6Af9uOQx4toIFf3fTZwa4hSxxgCbVXPEiXwmTqrRhoKxxBSjJ/Fsw7WYiJHidDf73JNv0
	kwyCYo0TIlnw7RyniV0Pjdl2LLjgkBQuNaC1CqDvaAqRmrStFexPLQ8mvXtHs0v2xkdvbAfPdhagh
	MzVwpxvSoz3u8gcCpGBF3GyDM/yu1LCkj+vqn3kR0s3fY7GOS+2Qko9sBT+JVSQjhNjygsQ01EDpI
	/yLanBA10utsYDiUDJbOdw05gEBMRqCzsKIOL+A3MkBy4oU2lYT9hCJbJOZW3MmvxzUr7X4Sv+yKC
	xSu29spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSke-0000000CNBa-3Agi;
	Mon, 10 Aug 2026 16:21:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSkd-0000000CNBU-1jXV
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 16:21:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBBF260052;
	Mon, 10 Aug 2026 16:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927BC1F000E9;
	Mon, 10 Aug 2026 16:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786378882;
	bh=79wU8Yu+NU/DAJsW8oNPy2dh73JmWMKiOiNsiNjnXuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=msiK0/eO7wCa2Tk2DxziiJ0C3L2OOdlgv+bcr5VxXwDMkczKlG8H8SkRlHH6BSuM7
	 2PcWoP/n3jPiYRWJEbWoY8Wjin6u6nUBIBlCo7Uk9/D3m7ewxJ22a1c2QOihIbyOF7
	 yjEq0Epx58Q8OP5hNXhAlSOcIWL4/OjPERr+JL+XAlCBYNPTkdeFKQCLSoPOWx11fj
	 HW8nHtS/lkJqEb79LQEFG5L7eLPhOh/SJNWWKz6eUXR0leOTvNSkpYyzSqi/Ar3USz
	 j0UCmYjt5pygnqOFt4Q5mrUri/i+RYh5n3q0IWFP8D4osZ0yApeKBtCaycxDkwKmIK
	 Uig9r1yrn5XuA==
Date: Mon, 10 Aug 2026 17:21:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 8/8] riscv: dts: starfive: jhb100: Add syscon nodes
Message-ID: <20260810-cattle-cloud-87676dc2b9d7@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-9-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260809015054.210577-9-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============2551700975714619092=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2551700975714619092==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4x6DHvYA0rn/lkY"
Content-Disposition: inline

--y4x6DHvYA0rn/lkY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2026 at 06:50:54PM -0700, Changhuang Liang wrote:
> Add syscon nodes for JHB100 RISC-V BMC SoC. They contain
> pcieep0_ecsr_syscon | host0_syscon | husb0_syscon | husbd0_syscon |
> pcieep1_ecsr_syscon | host1_syscon | husb1_syscon | husbd1_syscon |
> gpu0_syscon | gpu1_syscon | husbcmn_syscon | b2h_syscon | h2b_syscon |
> vout_syscon | pcierp_ecsr_syscon | pcierp_syscon | usb_syscon |
> npu_syscon | per0_syscon | per1_syscon | per2_syscon | per3_syscon |
> sys0_syscon | sys1_syscon | sys2_syscon | strap_syscon |
> sfc0_filter_syscon | sfc1_filter_syscon | sfc2_filter_syscon.
>=20
> Also update the references of pll nodes.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

This looks okay to me. I'll expect to see it later squashed with the
initial support, as we discussed previously.

Cheers,
Conor.

> ---
>  arch/riscv/boot/dts/starfive/jhb100.dtsi | 193 +++++++++++++++++++----
>  1 file changed, 159 insertions(+), 34 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/d=
ts/starfive/jhb100.dtsi
> index 6b2863fd3fd3..e76cf0f3c380 100644
> --- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
> @@ -282,36 +282,6 @@ pll1: clock-pll1 {
>  		clock-frequency =3D <1000000000>;
>  	};
>=20
> -	pll2: clock-pll2 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <903168000>;
> -	};
> -
> -	pll4: clock-pll4 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <100700000>;
> -	};
> -
> -	pll5: clock-pll5 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <100700000>;
> -	};
> -
> -	pll6: clock-pll6 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <2400000000>;
> -	};
> -
> -	pll7: clock-pll7 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <1950000000>;
> -	};
> -
>  	per2_gmac2_rgmii_rx: clock-per2-gmac2-rgmii-rx {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
> @@ -393,6 +363,97 @@ bus_nioc: bus {
>  				     <0x4 0x00000000 0x4 0x00000000 0x2 0x0>;
>  			ranges;
>=20
> +			pcieep0_ecsr_syscon: syscon@10511000 {
> +				compatible =3D "starfive,jhb100-pcieep-ecsr-syscon", "syscon";
> +				reg =3D <0x0 0x10511000 0x0 0x1000>;
> +			};
> +
> +			host0_syscon: syscon@10519000 {
> +				compatible =3D "starfive,jhb100-host-syscon", "syscon";
> +				reg =3D <0x0 0x10519000 0x0 0x1000>;
> +			};
> +
> +			husb0_syscon: syscon@10695000 {
> +				compatible =3D "starfive,jhb100-husb-syscon", "syscon";
> +				reg =3D <0x0 0x10695000 0x0 0x800>;
> +			};
> +
> +			husbd0_syscon: syscon@10695800 {
> +				compatible =3D "starfive,jhb100-husbd-syscon", "syscon";
> +				reg =3D <0x0 0x10695800 0x0 0x800>;
> +			};
> +
> +			gpu0_syscon: syscon@10745000 {
> +				compatible =3D "starfive,jhb100-gpu-syscon", "syscon";
> +				reg =3D <0x0 0x10745000 0x0 0x1000>;
> +			};
> +
> +			pcieep1_ecsr_syscon: syscon@10d11000 {
> +				compatible =3D "starfive,jhb100-pcieep-ecsr-syscon", "syscon";
> +				reg =3D <0x0 0x10d11000 0x0 0x1000>;
> +			};
> +
> +			host1_syscon: syscon@10d19000 {
> +				compatible =3D "starfive,jhb100-host-syscon", "syscon";
> +				reg =3D <0x0 0x10d19000 0x0 0x1000>;
> +			};
> +
> +			husb1_syscon: syscon@10e95000 {
> +				compatible =3D "starfive,jhb100-husb-syscon", "syscon";
> +				reg =3D <0x0 0x10e95000 0x0 0x800>;
> +			};
> +
> +			husbd1_syscon: syscon@10e95800 {
> +				compatible =3D "starfive,jhb100-husbd-syscon", "syscon";
> +				reg =3D <0x0 0x10e95800 0x0 0x800>;
> +			};
> +
> +			gpu1_syscon: syscon@10f45000 {
> +				compatible =3D "starfive,jhb100-gpu-syscon", "syscon";
> +				reg =3D <0x0 0x10f45000 0x0 0x1000>;
> +			};
> +
> +			husbcmn_syscon: syscon@11045000 {
> +				compatible =3D "starfive,jhb100-husbcmn-syscon", "syscon";
> +				reg =3D <0x0 0x11045000 0x0 0x1000>;
> +			};
> +
> +			b2h_syscon: syscon@11135000 {
> +				compatible =3D "starfive,jhb100-b2h-syscon", "syscon";
> +				reg =3D <0x0 0x11135000 0x0 0x400>;
> +			};
> +
> +			h2b_syscon: syscon@11135400 {
> +				compatible =3D "starfive,jhb100-h2b-syscon", "syscon";
> +				reg =3D <0x0 0x11135400 0x0 0x200>;
> +			};
> +
> +			vout_syscon: syscon@11135800 {
> +				compatible =3D "starfive,jhb100-vout-syscon", "syscon";
> +				reg =3D <0x0 0x11135800 0x0 0x400>;
> +			};
> +
> +			pcierp_ecsr_syscon: syscon@11711000 {
> +				compatible =3D "starfive,jhb100-pcierp-ecsr-syscon", "syscon";
> +				reg =3D <0x0 0x11711000 0x0 0x1000>;
> +			};
> +
> +			pcierp_syscon: syscon@11719000 {
> +				compatible =3D "starfive,jhb100-pcierp-syscon", "syscon";
> +				reg =3D <0x0 0x11719000 0x0 0x1000>;
> +				#reset-cells =3D <1>;
> +			};
> +
> +			usb_syscon: syscon@11820000 {
> +				compatible =3D "starfive,jhb100-usb-syscon", "syscon";
> +				reg =3D <0x0 0x11820000 0x0 0x10000>;
> +			};
> +
> +			npu_syscon: syscon@118e5000 {
> +				compatible =3D "starfive,jhb100-npu-syscon", "syscon";
> +				reg =3D <0x0 0x118e5000 0x0 0x100>;
> +			};
> +
>  			uart6: serial@11982000 {
>  				compatible =3D "starfive,jhb100-uart", "snps,dw-apb-uart";
>  				reg =3D <0x0 0x11982000 0x0 0x400>;
> @@ -410,7 +471,8 @@ uart6: serial@11982000 {
>  			per0crg: clock-controller@11a08000 {
>  				compatible =3D "starfive,jhb100-per0crg";
>  				reg =3D <0x0 0x11a08000 0x0 0x1000>;
> -				clocks =3D <&osc>, <&pll6>,
> +				clocks =3D <&osc>,
> +					 <&per0_syscon JHB100_PER0PLL_PLL6_OUT>,
>  					 <&sys0crg JHB100_SYS0CLK_BMCPER0_CFG_400>,
>  					 <&sys0crg JHB100_SYS0CLK_BMCPER0_CFG_800>,
>  					 <&sys0crg JHB100_SYS0CLK_BMCPER0_NCNOC_INIT>,
> @@ -422,10 +484,17 @@ per0crg: clock-controller@11a08000 {
>  				#reset-cells =3D <1>;
>  			};
>=20
> +			per0_syscon: syscon@11a09000 {
> +				compatible =3D "starfive,jhb100-per0-syscon", "syscon";
> +				reg =3D <0x0 0x11a09000 0x0 0x1000>;
> +				clocks =3D <&osc>;
> +				#clock-cells =3D <1>;
> +			};
> +
>  			per1crg: clock-controller@11b40000 {
>  				compatible =3D "starfive,jhb100-per1crg";
>  				reg =3D <0x0 0x11b40000 0x0 0x1000>;
> -				clocks =3D <&pll7>,
> +				clocks =3D <&per1_syscon JHB100_PER1PLL_PLL7_OUT>,
>  					 <&sys0crg JHB100_SYS0CLK_BMCPER1_NCNOC_INIT>,
>  					 <&sys0crg JHB100_SYS0CLK_BMCPER1_CFG_800>,
>  					 <&sys2crg JHB100_SYS2CLK_BMCPER1_NCNOC_TARG>,
> @@ -437,6 +506,13 @@ per1crg: clock-controller@11b40000 {
>  				#reset-cells =3D <1>;
>  			};
>=20
> +			per1_syscon: syscon@11b41000 {
> +				compatible =3D "starfive,jhb100-per1-syscon", "syscon";
> +				reg =3D <0x0 0x11b41000 0x0 0x1000>;
> +				clocks =3D <&osc>;
> +				#clock-cells =3D <1>;
> +			};
> +
>  			per2crg: clock-controller@11bc0000 {
>  				compatible =3D "starfive,jhb100-per2crg";
>  				reg =3D <0x0 0x11bc0000 0x0 0x1000>;
> @@ -458,6 +534,11 @@ per2crg: clock-controller@11bc0000 {
>  				#reset-cells =3D <1>;
>  			};
>=20
> +			per2_syscon: syscon@11bc1000 {
> +				compatible =3D "starfive,jhb100-per2-syscon", "syscon";
> +				reg =3D <0x0 0x11bc1000 0x0 0x1000>;
> +			};
> +
>  			per3crg: clock-controller@11c40000 {
>  				compatible =3D "starfive,jhb100-per3crg";
>  				reg =3D <0x0 0x11c40000 0x0 0x1000>;
> @@ -477,11 +558,16 @@ per3crg: clock-controller@11c40000 {
>  				#reset-cells =3D <1>;
>  			};
>=20
> +			per3_syscon: syscon@11c41000 {
> +				compatible =3D "starfive,jhb100-per3-syscon", "syscon";
> +				reg =3D <0x0 0x11c41000 0x0 0x1000>;
> +			};
> +
>  			sys0crg: clock-controller@13000000 {
>  				compatible =3D "starfive,jhb100-sys0crg";
>  				reg =3D <0x0 0x13000000 0x0 0x4000>;
>  				clocks =3D <&osc>, <&pll0>, <&pll1>,
> -					 <&pll2>;
> +					 <&sys0_syscon JHB100_SYS0PLL_PLL2_OUT>;
>  				clock-names =3D "osc", "pll0", "pll1", "pll2";
>  				#clock-cells =3D <1>;
>  				#reset-cells =3D <1>;
> @@ -491,7 +577,9 @@ sys1crg: clock-controller@13004000 {
>  				compatible =3D "starfive,jhb100-sys1crg";
>  				reg =3D <0x0 0x13004000 0x0 0x4000>;
>  				clocks =3D <&osc>, <&pll0>, <&pll1>,
> -					 <&pll2>, <&pll4>, <&pll5>,
> +					 <&sys0_syscon JHB100_SYS0PLL_PLL2_OUT>,
> +					 <&sys0_syscon JHB100_SYS0PLL_PLL4_OUT>,
> +					 <&sys0_syscon JHB100_SYS0PLL_PLL5_OUT>,
>  					 <&sys0crg JHB100_SYS0CLK_NPU_NCNOC_INIT>;
>  				clock-names =3D "osc", "pll0", "pll1", "pll2",
>  					      "pll4", "pll5", "npu_ncnoc_init";
> @@ -511,6 +599,28 @@ sys2crg: clock-controller@13008000 {
>  				#reset-cells =3D <1>;
>  			};
>=20
> +			sys0_syscon: syscon@13010000 {
> +				compatible =3D "starfive,jhb100-sys0-syscon", "syscon";
> +				reg =3D <0x0 0x13010000 0x0 0x2000>;
> +				clocks =3D <&osc>;
> +				#clock-cells =3D <1>;
> +			};
> +
> +			sys1_syscon: syscon@13014000 {
> +				compatible =3D "starfive,jhb100-sys1-syscon", "syscon";
> +				reg =3D <0x0 0x13014000 0x0 0x4000>;
> +			};
> +
> +			sys2_syscon: syscon@13018000 {
> +				compatible =3D "starfive,jhb100-sys2-syscon", "syscon";
> +				reg =3D <0x0 0x13018000 0x0 0x2000>;
> +			};
> +
> +			strap_syscon: syscon@1301a000 {
> +				compatible =3D "starfive,jhb100-strap-syscon", "syscon";
> +				reg =3D <0x0 0x1301a000 0x0 0x2000>;
> +			};
> +
>  			intc: interrupt-controller@13220000 {
>  				compatible =3D "starfive,jhb100-intc";
>  				reg =3D <0x0 0x13220000 0x0 0x80>;
> @@ -518,6 +628,21 @@ intc: interrupt-controller@13220000 {
>  				interrupt-controller;
>  				#interrupt-cells =3D <1>;
>  			};
> +
> +			sfc0_filter_syscon: syscon@14090000 {
> +				compatible =3D "starfive,jhb100-sfc-filter-syscon", "syscon";
> +				reg =3D <0x0 0x14090000 0x0 0x1000>;
> +			};
> +
> +			sfc1_filter_syscon: syscon@14091000 {
> +				compatible =3D "starfive,jhb100-sfc-filter-syscon", "syscon";
> +				reg =3D <0x0 0x14091000 0x0 0x1000>;
> +			};
> +
> +			sfc2_filter_syscon: syscon@14092000 {
> +				compatible =3D "starfive,jhb100-sfc-filter-syscon", "syscon";
> +				reg =3D <0x0 0x14092000 0x0 0x1000>;
> +			};
>  		};
>  	};
>  };
> --
> 2.25.1

--y4x6DHvYA0rn/lkY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann6fAAKCRB4tDGHoIJi
0hBCAQDVK9rLq93tfFflke4FNIJBMWbcVaXBWPLgEGL6YahE9gEA+J+BgtSwc8rP
+EtwVJ/ULG+ugnCgqveyph9v8NXdrw0=
=vfMb
-----END PGP SIGNATURE-----

--y4x6DHvYA0rn/lkY--


--===============2551700975714619092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2551700975714619092==--

