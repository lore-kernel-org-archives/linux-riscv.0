Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D20CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 13:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mAineczqSVrRU/uq5zUOnM2n7m1b1YPvRHE8JHVQ38=; b=nqJjFII1J8SQP5T6lWAdgK7bsg
	8MlJzgK3GsGEMZpsi0iF0+Y84SqjFbC0wPTOB1rODWxlYwzykS1ofKeB4kNuN93vVuNULej/E+4zk
	6zmGLSi4UvgddSBrsLSwe4/i5xEh6N52mfdQIJL7/BUrz58eDc+Mf1Ncz3F9J5uXR2J25ftBdoDVP
	Cg+O6FDLPJjaOsExHqRefdm6547MOUXlHGyRSbwefGMgUCfgm2jQMKY35sLWSe+Ih6RK9Qe8Egawq
	q2ToBrxL5Uwf8MAuWfJcgJ0MQkwTFvFIM8CZ2uaqGCm/Qv+545NEHcuY27lWDgycVUnG5KtBfgCZI
	vBpA3/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrICX-003VS4-1E;
	Fri, 13 Oct 2023 13:27:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrICT-003VRQ-2n
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 13:27:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CB56ACE3035;
	Fri, 13 Oct 2023 13:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F58AC433C7;
	Fri, 13 Oct 2023 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697203650;
	bh=8rOhf3Ud5/yqiJiar6LgFzO4UZyCP5Pzkbe4G8SR2Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTqGHxLTjuAfpIYxm4GFKfmIhuQWXrqsVhtjkxgdouCAtb2X7H2E9uM9IOlpjUGB5
	 ObKTF6pYaudxvMgEvhEwg2BWYEtrNG65q6G7ixjl9864k7aPGZ3d1E/VlndS1OjS5p
	 X+d5xcFc6zqBdu93B1ndsn7Zb0NOrFMy5UKreODLIm6VIB+zR6TyB7opVVAXMTiSaH
	 yBNGyS9TeeOYIRxhZTDURVDXGRRJChfZ5YDn2sEEaWG1oeaRH/QCaGm+oecwY3AX7P
	 MV2PRFJ4S2PVOeKluI1JTSGObMaKviVWuUFIWb1lirvKGR56SHK1llnRlSnL/XPxAj
	 PrY5e7nQUb6RQ==
Date: Fri, 13 Oct 2023 14:27:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 6/7] riscv: dts: sophgo: Separate common devices from
 cv1800b soc
Message-ID: <20231013-tibia-anteater-d96425e1d912@spud>
References: <20231013-catchable-wince-f24060feb639@spud>
 <IA1PR20MB4953434E04427C0940C8DCF5BBD2A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953434E04427C0940C8DCF5BBD2A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_062734_273143_66C0C409 
X-CRM114-Status: GOOD (  38.08  )
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
Content-Type: multipart/mixed; boundary="===============1419086383199457220=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1419086383199457220==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Prj1YP5K/E7Nos1f"
Content-Disposition: inline


--Prj1YP5K/E7Nos1f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 05:52:03PM +0800, Inochi Amaoto wrote:
> Sorry for the wrong title.
>=20
> >Yo,
> >
> >On Mon, Oct 09, 2023 at 07:26:35PM +0800, Inochi Amaoto wrote:
> >> Move the cpu and the common peripherals of CV181x and CV180x to new fi=
le.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> ---
> >>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 95 +------------------
> >>  .../dts/sophgo/{cv1800b.dtsi =3D> cv180x.dtsi}  | 19 +---
> >>  2 files changed, 2 insertions(+), 112 deletions(-)
> >>  copy arch/riscv/boot/dts/sophgo/{cv1800b.dtsi =3D> cv180x.dtsi} (80%)
> >>
> >> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot=
/dts/sophgo/cv1800b.dtsi
> >> index df40e87ee063..0904154f9829 100644
> >> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >> @@ -3,106 +3,13 @@
> >>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> >>   */
> >>
> >> -#include <dt-bindings/interrupt-controller/irq.h>
> >> +#include "cv180x.dtsi"
> >>
> >>  / {
> >>  	compatible =3D "sophgo,cv1800b";
> >> -	#address-cells =3D <1>;
> >> -	#size-cells =3D <1>;
> >> -
> >> -	cpus: cpus {
> >> -		#address-cells =3D <1>;
> >> -		#size-cells =3D <0>;
> >> -		timebase-frequency =3D <25000000>;
> >> -
> >> -		cpu0: cpu@0 {
> >> -			compatible =3D "thead,c906", "riscv";
> >> -			device_type =3D "cpu";
> >> -			reg =3D <0>;
> >> -			d-cache-block-size =3D <64>;
> >> -			d-cache-sets =3D <512>;
> >> -			d-cache-size =3D <65536>;
> >> -			i-cache-block-size =3D <64>;
> >> -			i-cache-sets =3D <128>;
> >> -			i-cache-size =3D <32768>;
> >> -			mmu-type =3D "riscv,sv39";
> >> -			riscv,isa =3D "rv64imafdc";
> >> -			riscv,isa-base =3D "rv64i";
> >> -			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "=
zicsr",
> >> -					       "zifencei", "zihpm";
> >> -
> >> -			cpu0_intc: interrupt-controller {
> >> -				compatible =3D "riscv,cpu-intc";
> >> -				interrupt-controller;
> >> -				#address-cells =3D <0>;
> >> -				#interrupt-cells =3D <1>;
> >> -			};
> >> -		};
> >> -	};
> >> -
> >> -	osc: oscillator {
> >> -		compatible =3D "fixed-clock";
> >> -		clock-output-names =3D "osc_25m";
> >> -		#clock-cells =3D <0>;
> >> -	};
> >>
> >>  	soc {
> >> -		compatible =3D "simple-bus";
> >>  		interrupt-parent =3D <&plic>;
> >> -		#address-cells =3D <1>;
> >> -		#size-cells =3D <1>;
> >> -		dma-noncoherent;
> >> -		ranges;
> >> -
> >> -		uart0: serial@4140000 {
> >> -			compatible =3D "snps,dw-apb-uart";
> >> -			reg =3D <0x04140000 0x100>;
> >> -			interrupts =3D <44 IRQ_TYPE_LEVEL_HIGH>;
> >> -			clocks =3D <&osc>;
> >> -			reg-shift =3D <2>;
> >> -			reg-io-width =3D <4>;
> >> -			status =3D "disabled";
> >> -		};
> >> -
> >> -		uart1: serial@4150000 {
> >> -			compatible =3D "snps,dw-apb-uart";
> >> -			reg =3D <0x04150000 0x100>;
> >> -			interrupts =3D <45 IRQ_TYPE_LEVEL_HIGH>;
> >> -			clocks =3D <&osc>;
> >> -			reg-shift =3D <2>;
> >> -			reg-io-width =3D <4>;
> >> -			status =3D "disabled";
> >> -		};
> >> -
> >> -		uart2: serial@4160000 {
> >> -			compatible =3D "snps,dw-apb-uart";
> >> -			reg =3D <0x04160000 0x100>;
> >> -			interrupts =3D <46 IRQ_TYPE_LEVEL_HIGH>;
> >> -			clocks =3D <&osc>;
> >> -			reg-shift =3D <2>;
> >> -			reg-io-width =3D <4>;
> >> -			status =3D "disabled";
> >> -		};
> >> -
> >> -		uart3: serial@4170000 {
> >> -			compatible =3D "snps,dw-apb-uart";
> >> -			reg =3D <0x04170000 0x100>;
> >> -			interrupts =3D <47 IRQ_TYPE_LEVEL_HIGH>;
> >> -			clocks =3D <&osc>;
> >> -			reg-shift =3D <2>;
> >> -			reg-io-width =3D <4>;
> >> -			status =3D "disabled";
> >> -		};
> >> -
> >> -		uart4: serial@41c0000 {
> >> -			compatible =3D "snps,dw-apb-uart";
> >> -			reg =3D <0x041c0000 0x100>;
> >> -			interrupts =3D <48 IRQ_TYPE_LEVEL_HIGH>;
> >> -			clocks =3D <&osc>;
> >> -			reg-shift =3D <2>;
> >> -			reg-io-width =3D <4>;
> >> -			status =3D "disabled";
> >> -		};
> >>
> >>  		plic: interrupt-controller@70000000 {
> >>  			compatible =3D "sophgo,cv1800b-plic", "thead,c900-plic";
> >> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot=
/dts/sophgo/cv180x.dtsi
> >> similarity index 80%
> >> copy from arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >> copy to arch/riscv/boot/dts/sophgo/cv180x.dtsi
> >> index df40e87ee063..ffaf51724c98 100644
> >
> >Firstly, this form of diff really threw me, I was quite confused for a
> >few minutes. A copy plus a pair of diffs doesn't really make much sense,
> >when the operation being carried is an extraction of some nodes to a
> >different file.
> >
>=20
> I was told to use -C/-M/-B to generate patch, and the git format-patch
> give me this wired output if I use -C, using -M seems no change from v1.
> The -B output is also disappointing. Maybe I need to generate agaion?

I don't think generating it again is going to change the outcome & I
don't really think the -C version of this patch makes much sense, it is
hard to tell what has actually been moved.

> The v1 version:
> https://lore.kernel.org/linux-riscv/IA1PR20MB495360B632D106BBB833D82ABBCF=
A@IA1PR20MB4953.namprd20.prod.outlook.com/
>=20
> >> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> >> @@ -1,12 +1,12 @@
> >>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >>  /*
> >>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> >> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> >
> >Also, is moving around some bits of hw description really a
> >copyrightable change?
> >
>=20
> It seems to be a mistake when I splitting the patch from v1.
> This copyright should in the next patch.
>=20
> >>   */
> >>
> >>  #include <dt-bindings/interrupt-controller/irq.h>
> >>
> >>  / {
> >> -	compatible =3D "sophgo,cv1800b";
> >>  	#address-cells =3D <1>;
> >>  	#size-cells =3D <1>;
> >>
> >> @@ -48,7 +48,6 @@ osc: oscillator {
> >>
> >>  	soc {
> >>  		compatible =3D "simple-bus";
> >> -		interrupt-parent =3D <&plic>;
> >>  		#address-cells =3D <1>;
> >>  		#size-cells =3D <1>;
> >>  		dma-noncoherent;
> >> @@ -103,21 +102,5 @@ uart4: serial@41c0000 {
> >>  			reg-io-width =3D <4>;
> >>  			status =3D "disabled";
> >>  		};
> >> -
> >> -		plic: interrupt-controller@70000000 {
> >> -			compatible =3D "sophgo,cv1800b-plic", "thead,c900-plic";
> >> -			reg =3D <0x70000000 0x4000000>;
> >> -			interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> >> -			interrupt-controller;
> >> -			#address-cells =3D <0>;
> >> -			#interrupt-cells =3D <2>;
> >> -			riscv,ndev =3D <101>;
> >> -		};
> >> -
> >> -		clint: timer@74000000 {
> >> -			compatible =3D "sophgo,cv1800b-clint", "thead,c900-clint";
> >> -			reg =3D <0x74000000 0x10000>;
> >> -			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> >> -		};
> >>  	};
> >>  };
> >
> >What I wanted to comment on was this though - it seems that both the
> >cv1800b and the cv1812h have identical plic and clint nodes, other than
> >their compatibles? If that is the case, why create a cv1800b and a
> >cv1812h specific file containing entirely new nodes, when overriding the
> >compatible would be sufficient? Doubly so if the other SoCs in the
> >cv18xx series are going to have identical layouts.
> >
> >I gave it a quick test locally with the below diff applied on top of
> >this series - although I didn't make sure that I didn't re-order the
> >plic & clint nodes, I just wanted to demonstrate what I had done.
> >
>=20
> Thanks for demonstration. AFAIK, what you said is true. the most devices
> of CV180x and CV181x are the same, including plic and clint. The reason I
> used a new one is to identify these two devices without making the
> compatible string confusing.
> Should I change the binding name of plic and clint to "sophgo,cv1800-xxx"
> to mark there are the same series? I think this can avoid this confusing
> dt nodes.

I personally don't find the compatibles (or the dt nodes) confusing, so
I dunno. Having reusing the compatible is not something that I am a fan of
either, since this seems to be a different soc (given the sram &
coprocessor etc) even if the addresses of the peripherals are identical.

--Prj1YP5K/E7Nos1f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSlFvQAKCRB4tDGHoIJi
0nrCAP0Z9KSrrpiDvlqLdMQ6UnyaXW/yq4HZ5ycnEImzpawa6gD/VkzeVOJKzBA8
LwzP82QebpmhyXVN9U2uoFFav1BwfAY=
=74+y
-----END PGP SIGNATURE-----

--Prj1YP5K/E7Nos1f--


--===============1419086383199457220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1419086383199457220==--

