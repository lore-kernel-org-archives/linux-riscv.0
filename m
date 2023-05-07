Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A478FC77B75
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1QsQdUKO4BZS4XTIAeuu3YugOYlIs81llDqebEH4ag=; b=JkpiuKIPw9MdASv2S4vfs5fDDe
	YHFRxgxnY2vVM6oTft3Wxa9ThpLzpZG66NJYtck11Uirn2wpIa+Ixwbud+xtVe5llYXKZMAJnR6JN
	srpkl2iQ+umwINN1o/lixQB/v/3jmK/8nuuMcmk4pzXnimmp1kzGSmrgIGrm0dqE4u6jPJZ80n8cS
	CGdQNuaLC7dMK+jTqz1xQHWx2XaUB27927JBJPVKpXJxCx5yG4cwp1/tMVOe/MoAvzno0vFrskDaS
	lD8A5SFK85ln+cSb4REzcfj7uH46SBFYTzTU60rpSXscGPThAcCJk+b6b0nKYy1lu5U5oBxVC7H96
	qLtp5Geg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvlub-00GiCM-0n;
	Sun, 07 May 2023 21:27:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvluY-00GiBr-0G
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 21:27:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BC9560E9D;
	Sun,  7 May 2023 21:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A472C433D2;
	Sun,  7 May 2023 21:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683494836;
	bh=TdiB9qq4NKwSAWAk561rIMN33nbPQBYWdvZc4tGL7o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Whs5HRMRpIZg1LqDq/3Cn/M5Xz0P1VsyMK4Rr9vuheEMXt/lvcn0SqUb81ef+QcXa
	 +JOLPEuoBEPQlL5bvwqmgMV3c8EbrljPixPnBQutAtfUKxmxccZPzf8RFIGjHZ1tXO
	 vKMWIyNKcbHHgqtGxn8PG8W+KKAFyHT0SsNo0f4+hnAmOtwQ1FuN3KI1K6kgGVpoPz
	 ST7PTgadGfSS9hEwRczZo8Ao5OWV0l+AgsGl5s8TXDQLyLDHBY02WO2QpayWhywgDW
	 8ci2eEFWZi751AxVVc9t0Wm0vHn74Qh+aekItB5Q+96m+/kqWMkmui5yQUiT90kK7/
	 id9IarPpw7AZw==
Date: Sun, 7 May 2023 22:27:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 4/5] riscv: dts: thead: add sipeed Lichee Pi 4A board
 device tree
Message-ID: <20230507-splashed-pulverize-3f0e6f4dce09@spud>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230507182304.2934-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_142718_207127_2E174C69 
X-CRM114-Status: GOOD (  22.47  )
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
Content-Type: multipart/mixed; boundary="===============0890256204227545272=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0890256204227545272==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hEbItDNiZnP7w/mU"
Content-Disposition: inline


--hEbItDNiZnP7w/mU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Mon, May 08, 2023 at 02:23:03AM +0800, Jisheng Zhang wrote:
> Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> module which is powered by T-HEAD's light(a.k.a TH1520) SoC. Add
> minimal device tree files for the core module and the development
> board.
>=20
> Support basic uart/gpio/dmac drivers, so supports booting to a basic
> shell.

There are quite a lot of dtbs_check warnings etc produced by this patch.
RISC-V is *almost* W=3D1 clean for dtbs_check & I'd like to get that to
clean once the non-coherent DMA situation for Renesas is sorted out.
That said, I think some of the issues I noticed will crop up at the
default warning level too.

Please fix all of the W=3D1 complaints from dtbs_check, which will require
the creation of some additional dt-bindings.

>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/thead/Makefile            |  2 +
>  .../dts/thead/light-lichee-module-4a.dtsi     | 38 +++++++++++++++++++
>  .../boot/dts/thead/light-lichee-pi-4a.dts     | 32 ++++++++++++++++
>  4 files changed, 73 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/thead/Makefile
>  create mode 100644 arch/riscv/boot/dts/thead/light-lichee-module-4a.dtsi

As I mentioned in one of the earlier patches, I don't think using
"light" here is all that great. I would much rather see "th1520" used
instead.

Thanks,
Conor.

>  create mode 100644 arch/riscv/boot/dts/thead/light-lichee-pi-4a.dts
>=20
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index f0d9f89054f8..1e884868ccba 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -2,6 +2,7 @@
>  subdir-y +=3D allwinner
>  subdir-y +=3D sifive
>  subdir-y +=3D starfive
> +subdir-y +=3D thead
>  subdir-y +=3D canaan
>  subdir-y +=3D microchip
>  subdir-y +=3D renesas
> diff --git a/arch/riscv/boot/dts/thead/Makefile b/arch/riscv/boot/dts/the=
ad/Makefile
> new file mode 100644
> index 000000000000..9e00acc714cc
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_THEAD) +=3D light-lichee-pi-4a.dtb
> diff --git a/arch/riscv/boot/dts/thead/light-lichee-module-4a.dtsi b/arch=
/riscv/boot/dts/thead/light-lichee-module-4a.dtsi
> new file mode 100644
> index 000000000000..24c9971e0fb5
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/light-lichee-module-4a.dtsi
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "light.dtsi"
> +
> +/ {
> +	model =3D "Sipeed Lichee Module 4A";
> +	compatible =3D "sipeed,lichee-module-4a", "thead,light";
> +
> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x00000000 0x2 0x00000000>;
> +	};
> +};
> +
> +&osc {
> +	clock-frequency =3D <24000000>;
> +};
> +
> +&osc_32k {
> +	clock-frequency =3D <32768>;
> +};
> +
> +&apb_clk {
> +	clock-frequency =3D <62500000>;
> +};
> +
> +&uart_sclk {
> +	clock-frequency =3D <100000000>;
> +};
> +
> +&dmac0 {
> +	status =3D "okay";
> +};
> diff --git a/arch/riscv/boot/dts/thead/light-lichee-pi-4a.dts b/arch/risc=
v/boot/dts/thead/light-lichee-pi-4a.dts
> new file mode 100644
> index 000000000000..4f0ba2149d2d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/light-lichee-pi-4a.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include "light-lichee-module-4a.dtsi"
> +
> +/ {
> +	model =3D "Sipeed Lichee Pi 4A";
> +	compatible =3D "sipeed,lichee-pi-4a", "sipeed,lichee-module-4a", "thead=
,light";
> +
> +	aliases {
> +		gpio0 =3D &gpio0;
> +		gpio1 =3D &gpio1;
> +		gpio2 =3D &gpio2;
> +		gpio3 =3D &gpio3;
> +		serial0 =3D &uart0;
> +		serial1 =3D &uart1;
> +		serial2 =3D &uart2;
> +		serial3 =3D &uart3;
> +		serial4 =3D &uart4;
> +		serial5 =3D &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +};
> +
> +&uart0 {
> +	status =3D "okay";
> +};
> --=20
> 2.40.0
>=20

--hEbItDNiZnP7w/mU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFgXrwAKCRB4tDGHoIJi
0oa9AQDiwUgCT1AKpn8T2OoNS/mDSGlA+akXB2lE6u0XR3jD1wD/bDxIuIFiLXPx
ZeKuZotqXSv3MT1GuGKgw6wX6JRfvw0=
=TftX
-----END PGP SIGNATURE-----

--hEbItDNiZnP7w/mU--


--===============0890256204227545272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0890256204227545272==--

