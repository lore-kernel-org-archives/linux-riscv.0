Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFA4E748E9
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Oct 2023 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nM9SkpweIDDJ1V/1JBBaX4BXQZWouh7BqnelPgF+QdY=; b=QOajIuDS/ORcz9ZkwMR5RZ76nh
	XowV6IvoG7FVCI1jVc9aipihpB4RUL16EWWuwn8pWQT8Ob5Sho+iOmJXtb7UQWUk17ne5IH76n7Gw
	uw/RYwp6NNBcVV+XyElglDKE1dTeCQqNp4QEVG9XlcBrbL3/ELNdrGFDmhFqfZU/E/a8f6uC5FPzc
	BMxgK3v8BMTE6ZQ7t2meLoUfCT0IRTUhu8K+lzEucBs7+IQIVb2X4uvhwfyqexzD1bBju0o5rZ7LQ
	Y19lAED9vmtzuzOXPZEdEA4ZCSoCQv2hh1wZinpoA/LKEsDcAg5eOkCsd1zwOdgBArR0XQzVaRFBc
	fcgAt0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmuif-00AzdL-2Y;
	Sun, 01 Oct 2023 11:34:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmuic-00Azcm-32
	for linux-riscv@lists.infradead.org;
	Sun, 01 Oct 2023 11:34:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0F61AB808C0;
	Sun,  1 Oct 2023 11:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C714C433C8;
	Sun,  1 Oct 2023 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696160075;
	bh=UySuT3n82pxzN3JyaNB1at/D/Zfq00NZatp/XXJYivs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIBtrAyUNlO04O3iMoO6nXArUaVGW8iUS/0pJyr6cF5jE36xDa4hVUesgfQto0I0h
	 KqRGzHAwpST0mbJteXLGw5vhR54dV8/WQMI2GZOvc6n8Xlep3GYQoIxZi1GqSb06Qo
	 rCP45jwqQch4/KnESiSQtcfhV59rdA0uZ4LERT0zbmgMuv6lNRFp8LkYFdIz9rqPcy
	 uc8PZK/FACG1XyOK/LPEMeYx76kUfPhp1PP+SK/H6U1YnOhvsM7AALnwTx+MuKTwvg
	 Djky0FCP3mWt4u4aJaBXNQzI73bBVq7PRtiMBOnXo/Zb8bhtrVp9pm7DIn7JxCfZUI
	 XiwdkZrHSBVfg==
Date: Sun, 1 Oct 2023 12:34:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 4/5] riscv: dts: sophgo: add initial CV1800B SoC device
 tree
Message-ID: <20231001-abruptly-giddily-ef340b924774@spud>
References: <20230930123937.1551-5-jszhang@kernel.org>
 <IA1PR20MB4953CFE2FB68704D03082B4EBBC7A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953CFE2FB68704D03082B4EBBC7A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_043439_273286_D9CA8C64 
X-CRM114-Status: GOOD (  20.69  )
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
Content-Type: multipart/mixed; boundary="===============5835370150131663464=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5835370150131663464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M0NKzAzLKVvyaFiH"
Content-Disposition: inline


--M0NKzAzLKVvyaFiH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2023 at 06:34:21AM +0800, Inochi Amaoto wrote:
> Hi, Jisheng

> >Add initial device tree for the CV1800B RISC-V SoC by SOPHGO.

>=20
> You add the clint dt-bindings of CV1800B clint, but I don't see the clint
> node in this dt. The SBI needs this clint node to provide timer for linux.
> AFAIK, the dt of SBI comes from the linux or the bootloader, and bootload=
er
> may load the linux dt and pass it to the SBI. I think it is better to add
> the clint node.

> In addition, please separate the peripheral node to a different file, whi=
ch
> can be reused by both the CV1800 series and CV1810 series.

How do these SoCs differ?
Documentation seems rather lacking, but I was able to find something on
github that suggests there is also a cv180zb. The difference between the
three seems to, from a quick look, be their video encoding capabilities.
Is that correct?

Cheers,
Conor.

> >
> >Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >---
> > arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 117 ++++++++++++++++++++++++
> > 1 file changed, 117 insertions(+)
> > create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >
> >diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/d=
ts/sophgo/cv1800b.dtsi
> >new file mode 100644
> >index 000000000000..8829bebaa017
> >--- /dev/null
> >+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >@@ -0,0 +1,117 @@
> >+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >+/*
> >+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> >+ */
> >+
> >+#include <dt-bindings/interrupt-controller/irq.h>
> >+
> >+/ {
> >+	compatible =3D "sophgo,cv1800b";
> >+	#address-cells =3D <1>;
> >+	#size-cells =3D <1>;
> >+
> >+	cpus: cpus {
> >+		#address-cells =3D <1>;
> >+		#size-cells =3D <0>;
> >+		timebase-frequency =3D <25000000>;
> >+
> >+		cpu0: cpu@0 {
> >+			compatible =3D "thead,c906", "riscv";
> >+			device_type =3D "cpu";
> >+			reg =3D <0>;
> >+			d-cache-block-size =3D <64>;
> >+			d-cache-sets =3D <512>;
> >+			d-cache-size =3D <65536>;
> >+			i-cache-block-size =3D <64>;
> >+			i-cache-sets =3D <128>;
> >+			i-cache-size =3D <32768>;
> >+			mmu-type =3D "riscv,sv39";
> >+			riscv,isa =3D "rv64imafdc";
> >+			riscv,isa-base =3D "rv64i";
> >+			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zi=
csr",
> >+					       "zifencei", "zihpm";
> >+
> >+			cpu0_intc: interrupt-controller {
> >+				compatible =3D "riscv,cpu-intc";
> >+				interrupt-controller;
> >+				#address-cells =3D <0>;
> >+				#interrupt-cells =3D <1>;
> >+			};
> >+		};
> >+	};
> >+
> >+	osc: oscillator {
> >+		compatible =3D "fixed-clock";
> >+		clock-output-names =3D "osc_25m";
> >+		#clock-cells =3D <0>;
> >+	};
> >+
> >+	soc {
> >+		compatible =3D "simple-bus";
> >+		interrupt-parent =3D <&plic>;
> >+		#address-cells =3D <1>;
> >+		#size-cells =3D <1>;
> >+		dma-noncoherent;
> >+		ranges;
> >+
> >+		uart0: serial@04140000 {
> >+			compatible =3D "snps,dw-apb-uart";
> >+			reg =3D <0x04140000 0x100>;
> >+			interrupts =3D <44 IRQ_TYPE_LEVEL_HIGH>;
> >+			clocks =3D <&osc>;
> >+			reg-shift =3D <2>;
> >+			reg-io-width =3D <4>;
> >+			status =3D "disabled";
> >+		};
> >+
> >+		uart1: serial@04150000 {
> >+			compatible =3D "snps,dw-apb-uart";
> >+			reg =3D <0x04150000 0x100>;
> >+			interrupts =3D <45 IRQ_TYPE_LEVEL_HIGH>;
> >+			clocks =3D <&osc>;
> >+			reg-shift =3D <2>;
> >+			reg-io-width =3D <4>;
> >+			status =3D "disabled";
> >+		};
> >+
> >+		uart2: serial@04160000 {
> >+			compatible =3D "snps,dw-apb-uart";
> >+			reg =3D <0x04160000 0x100>;
> >+			interrupts =3D <46 IRQ_TYPE_LEVEL_HIGH>;
> >+			clocks =3D <&osc>;
> >+			reg-shift =3D <2>;
> >+			reg-io-width =3D <4>;
> >+			status =3D "disabled";
> >+		};
> >+
> >+		uart3: serial@04170000 {
> >+			compatible =3D "snps,dw-apb-uart";
> >+			reg =3D <0x04170000 0x100>;
> >+			interrupts =3D <47 IRQ_TYPE_LEVEL_HIGH>;
> >+			clocks =3D <&osc>;
> >+			reg-shift =3D <2>;
> >+			reg-io-width =3D <4>;
> >+			status =3D "disabled";
> >+		};
> >+
> >+		uart4: serial@041c0000 {
> >+			compatible =3D "snps,dw-apb-uart";
> >+			reg =3D <0x041c0000 0x100>;
> >+			interrupts =3D <48 IRQ_TYPE_LEVEL_HIGH>;
> >+			clocks =3D <&osc>;
> >+			reg-shift =3D <2>;
> >+			reg-io-width =3D <4>;
> >+			status =3D "disabled";
> >+		};
> >+
> >+		plic: interrupt-controller@70000000 {
> >+			compatible =3D "sophgo,cv1800b-plic", "thead,c900-plic";
> >+			reg =3D <0x70000000 0x4000000>;
> >+			interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> >+			interrupt-controller;
> >+			#address-cells =3D <0>;
> >+			#interrupt-cells =3D <2>;
> >+			riscv,ndev =3D <101>;
> >+		};
> >+	};
> >+};
> >--
> >2.40.1
> >
> >

--M0NKzAzLKVvyaFiH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRlZRQAKCRB4tDGHoIJi
0h+QAP9r9LBt9mM2PwBl5eQ396Rbj1v3NBATAR8OIqjGo8QsCwEAoOHxU7rSHYaa
wFnI234UlRRhS7SK0fCwCKEOCOW8+As=
=sfLJ
-----END PGP SIGNATURE-----

--M0NKzAzLKVvyaFiH--


--===============5835370150131663464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5835370150131663464==--

