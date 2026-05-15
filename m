Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF03CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Srr7fQH/SLPDugw5cywH+LnAreDgqsXJ22x8NcFVnfU=; b=VNYQhFlHKlYzGDFslXgd2GRNUv
	zw63DtxON0NBx/lHLsQQHsazOveAUc/rr6Vdo+CV43cYLQKZRbVOFCuQiyooihO+hPU71XeY4Vs45
	GPAgT0p/qTF9zEO9zHOt1EB5pyIabPU0GwGba4530Mzb9mn5d6cpet0Jla0H4aYpNOnejf+55yhqE
	r0UPtdZD6BQfI+SzFO7Yr3c0EQvm13NBeLrYyw0X5u19AlLa4YUMPIT/HKspD1FxXSbAdnsXCtg+O
	FJg/L17smgktUOAv/O/aQUMTRVT59lvHOjZe4VQG4xRieaO/+NcknCzrrMtvGGr69t9k45aJNvrFL
	j68zbHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNplH-000000082Rn-1v2h;
	Fri, 15 May 2026 10:27:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNplE-000000082Qa-0g20
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 10:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778840836; x=1810376836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qk9NZ7WqcT4v7DKQJ7GeuukI5VSD3ZxkWEeReTD+ruU=;
  b=SsEWvzcxcsnOijTU1AZHawowtWxgeDnuLs/x0+gXqkXQCkLL8yN2dg5f
   5pQ8rOU2xBnx2wuRDbSsa6rX6QdoLpHwfSjQ4XbWw6FbqB+lgt5FsiwR0
   PyxhieqRpfexnXmbX50R82Dp+xmjfDeilR/wpimQgllMzyGOIo2fwjW+P
   i1eiTwmajMY0QWer9dLDj6wKn2tfYn4HEt70u4Nf3zkRRWJMAkQ4RQgrh
   7RHS98mLyVn8evSCsVvIv4asqQz+pAPjhxbSxdJnBBYSaf4EnO5cbpd4k
   B+Yj6ZxtWnPIDQdRUlrr1ofo+6PlhH2gxaH6mcFq24tap2U48Zq/0sUb0
   Q==;
X-CSE-ConnectionGUID: Xy4zyqk9RhyxiOqI97z15Q==
X-CSE-MsgGUID: e72aybRuTAKsM/JwMIIimQ==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="57968182"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 03:27:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 03:27:12 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 03:27:09 -0700
Date: Fri, 15 May 2026 11:26:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jia Wang <wangjia@ultrarisc.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Conor Dooley
	<conor@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 5/9] riscv: dts: ultrarisc: Add initial device tree for
 UltraRISC DP1000
Message-ID: <20260515-morbidity-rule-d8504467b252@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-5-bf559589ea8a@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-5-bf559589ea8a@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_032716_270669_26EB14F2 
X-CRM114-Status: GOOD (  24.68  )
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
Content-Type: multipart/mixed; boundary="===============5581858224474332132=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5581858224474332132==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YkSoZU4ahkAk+Ef4"
Content-Disposition: inline

--YkSoZU4ahkAk+Ef4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 09:18:01AM +0800, Jia Wang wrote:
> Add the base device tree for the UltraRISC DP1000 SoC. It describes the
> 8=D7CP100 CPU cores and essential SoC peripherals including the interrupt
> controller, pinctrl, GPIO, UART, SPI, I2C, PCIe, GMAC and the DMA
> controller.
>=20
> Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-2-98935f6cd=
fb5@ultrarisc.com/
> Link: https://lore.kernel.org/lkml/20260429-ultrarisc-serial-v7-3-e475cce=
9e274@ultrarisc.com/
>=20

No blank line here FYI.

> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  MAINTAINERS                               |   1 +
>  arch/riscv/boot/dts/ultrarisc/dp1000.dtsi | 851 ++++++++++++++++++++++++=
++++++
>  2 files changed, 852 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index baaaa46b1a56..832e01898ae5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23087,6 +23087,7 @@ M:	Jia Wang <wangjia@ultrarisc.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> +F:	arch/riscv/boot/dts/ultrarisc/
> =20
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boot/=
dts/ultrarisc/dp1000.dtsi
> new file mode 100644
> index 000000000000..1aae53fc1a2b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> @@ -0,0 +1,851 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	compatible =3D "ultrarisc,dp1000";
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		timebase-frequency =3D <10000000>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "ultrarisc,cp100", "riscv";
> +			reg =3D <0x0>;
> +			device_type =3D "cpu";
> +			riscv,isa =3D "rv64imafdcbh";

Drop this property, its replacements (below) should be supported by all
users.

> +			riscv,isa-base =3D "rv64i";
> +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "b", "h",
> +					       "zba", "zbb", "zbc", "zbs", "zicntr",
> +					       "zicsr", "zifencei", "zihpm", "ziccif",
> +					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
> +					       "zicbop", "zicboz", "zkt", "svade",
> +					       "ssccptr", "sstvecd", "sscounterenw",
> +					       "shcounterenw", "shtvala", "shvstvecd",
> +					       "shvsatpa", "svvptc";
> +			mmu-type =3D "riscv,sv48";
> +			clock-frequency =3D <2000000000>;
> +			/* L1 I-cache and D-cache:

FYI, the comment format outside of drivers/net/ has a newline after /*.

> +			 * block-size 64B
> +			 * 4-way set associative, size 64KB
> +			 * per-core.
> +			 */
> +			d-cache-block-size =3D <64>;
> +			d-cache-sets =3D <256>;
> +			d-cache-size =3D <0x10000>;
> +			i-cache-block-size =3D <64>;
> +			i-cache-sets =3D <256>;
> +			i-cache-size =3D <0x10000>;
> +			next-level-cache =3D <&l2_cache0>;
> +			riscv,cbom-block-size =3D <64>;
> +			riscv,cboz-block-size =3D <64>;
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells =3D <0x01>;
> +			};
> +
> +			l2_cache0: l2-cache {
> +				/* L2 cache:
> +				 * cache-unified, block-size 64B
> +				 * 8-way set associative, size 512KB
> +				 * per-core.
> +				 */
> +				compatible =3D "cache";
> +				cache-block-size =3D <64>;
> +				cache-level =3D <2>;
> +				cache-size =3D <0x80000>;
> +				cache-sets =3D <1024>;
> +				cache-unified;
> +				next-level-cache =3D <&cluster0_l3>;
> +			};
> +		};

> +		cpu4: cpu@4 {
> +			compatible =3D "ultrarisc,cp100", "riscv";
> +			reg =3D <0x10>;

Sashiko correctly pointed out that this is wrong.

> +		cpu5: cpu@5 {
> +			compatible =3D "ultrarisc,cp100", "riscv";
> +			reg =3D <0x11>;

And so is this.

> +		cpu6: cpu@6 {
> +			compatible =3D "ultrarisc,cp100", "riscv";
> +			reg =3D <0x12>;

And this.

> +		cpu7: cpu@7 {
> +			compatible =3D "ultrarisc,cp100", "riscv";
> +			reg =3D <0x13>;

And this.

> +	clocks {

I've commented on this in the cover letter.

> +		device_clk: device_clk {
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <62500000>;
> +			#clock-cells =3D <0>;
> +		};
> +
> +		timer_clk: timer_clk {
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <50000000>;
> +			#clock-cells =3D <0>;
> +		};
> +
> +		csr_clk: csr_clk {
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <250000000>;
> +			#clock-cells =3D <0>;
> +		};
> +	};

> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x00 0x80000000 0x4 0x00000000>;
> +	};

This looks incorrectly placed, memory should be in the board dts unless
it is actually a part of the chip.

> +
> +	soc {
> +		compatible =3D "simple-bus";
> +		ranges;
> +		#address-cells =3D <0x02>;
> +		#size-cells =3D <0x02>;
> +
> +		clint: clint@8000000 {
> +			compatible =3D "sifive,clint0", "riscv,clint0";

Missing a device-specific clint compatible.

> +			reg =3D <0x00 0x8000000 0x00 0x100000>;
> +			interrupts-extended =3D <&cpu0_intc 0x03>, <&cpu0_intc 0x07>,
> +					      <&cpu1_intc 0x03>, <&cpu1_intc 0x07>,
> +					      <&cpu2_intc 0x03>, <&cpu2_intc 0x07>,
> +					      <&cpu3_intc 0x03>, <&cpu3_intc 0x07>,
> +					      <&cpu4_intc 0x03>, <&cpu4_intc 0x07>,
> +					      <&cpu5_intc 0x03>, <&cpu5_intc 0x07>,
> +					      <&cpu6_intc 0x03>, <&cpu6_intc 0x07>,
> +					      <&cpu7_intc 0x03>, <&cpu7_intc 0x07>;
> +		};
> +
> +		plic: plic@9000000 {
> +			compatible =3D "ultrarisc,dp1000-plic", "ultrarisc,cp100-plic";
> +			reg =3D <0x00 0x9000000 0x00 0x4000000>;
> +			#interrupt-cells =3D <1>;
> +			#address-cells =3D <0>;
> +			interrupt-controller;
> +			interrupts-extended =3D <&cpu0_intc 0xb>, <&cpu0_intc 0x9>, <&cpu0_in=
tc 0xa>,
> +					      <&cpu1_intc 0xb>, <&cpu1_intc 0x9>, <&cpu1_intc 0xa>,
> +					      <&cpu2_intc 0xb>, <&cpu2_intc 0x9>, <&cpu2_intc 0xa>,
> +					      <&cpu3_intc 0xb>, <&cpu3_intc 0x9>, <&cpu3_intc 0xa>,
> +					      <&cpu4_intc 0xb>, <&cpu4_intc 0x9>, <&cpu4_intc 0xa>,
> +					      <&cpu5_intc 0xb>, <&cpu5_intc 0x9>, <&cpu5_intc 0xa>,
> +					      <&cpu6_intc 0xb>, <&cpu6_intc 0x9>, <&cpu6_intc 0xa>,
> +					      <&cpu7_intc 0xb>, <&cpu7_intc 0x9>, <&cpu7_intc 0xa>;
> +			riscv,ndev =3D <160>;
> +		};
> +
> +		pmx0: pinmux@11081000 {
> +			compatible =3D "ultrarisc,dp1000-pinctrl";
> +			reg =3D <0x0 0x11081000  0x0 0x1000>;
                                             ^^ extra space here btw

> +			#pinctrl-cells =3D <2>;
> +		};
> +
> +		spi0: spi@20320000 {
> +			compatible =3D "snps,dw-apb-ssi";

Missing a device-specific compatible here, can just fall abck to the
dw-apb-ssi one, so no need to make driver changes.

> +			reg =3D <0x0 0x20320000 0x0 0x1000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			clocks =3D <&device_clk>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <19>;
> +			num-cs =3D <3>;
> +		};

> +
> +		i2c0: i2c@20330000 {
> +			compatible =3D "snps,designware-i2c";

Same applies here.

> +			reg =3D <0x0 0x20330000 0x0 0x100>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			clock-frequency =3D <400000>;
> +			clocks =3D <&device_clk>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <20>;
> +		};

> +
> +		ethernet: ethernet@38000000 {
> +			compatible =3D "snps,dwmac", "snps,dwmac-5.10a";

Surprised this passes dtbs_check. Same here, you need a specific
compatible.

> +			reg =3D <0x00 0x38000000 0x00 0x1000000>;
> +			clocks =3D <&csr_clk>;
> +			clock-names =3D "stmmaceth";
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <84>;
> +			interrupt-names =3D "macirq";
> +			local-mac-address =3D [ff ff ff ff ff ff];
> +			max-speed =3D <1000>;
> +			phy-mode =3D "rgmii-id";
> +			snps,txpbl =3D <8>;
> +			snps,rxpbl =3D <8>;
> +		};
> +
> +		dmac: dma-controller@39000000 {
> +			compatible =3D "snps,axi-dma-1.01a";

Same thing here, I'd like to see a device specific compatible too.

> +			reg =3D <0x0 0x39000000 0x0 0x400>;
> +			clocks =3D <&device_clk>, <&device_clk>;

This kind of thing is what makes me think that you're over simplifying
your clock tree. Sure, maybe you do use the same clock here for both
ports, but it's suspect.

Cheers,
Conor.

> +			clock-names =3D "core-clk", "cfgr-clk";
> +			#dma-cells =3D <1>;
> +			dma-channels =3D <8>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <152>;
> +			snps,dma-masters =3D <1>;
> +			snps,data-width =3D <4>;
> +			snps,block-size =3D <512 512 512 512 512 512 512 512>;
> +			snps,priority =3D <0 1 2 3 4 5 6 7>;
> +			snps,axi-max-burst-len =3D <256>;
> +		};
> +	};
> +};
>=20
> --=20
> 2.34.1
>=20

--YkSoZU4ahkAk+Ef4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagb01wAKCRB4tDGHoIJi
0vgLAP9uHie8ekeBr5yzJlkDGTFyTizgLiDpL9cTNsn7ocsDygD9HhxPN8tXjgAS
sxt6qsr2Jb5SGx9eXn3M2MeK4NnzUw4=
=p8DX
-----END PGP SIGNATURE-----

--YkSoZU4ahkAk+Ef4--


--===============5581858224474332132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5581858224474332132==--

