Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1F9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lV3s7R0X5hoHk/M/7xfAJTbXkn/1KHQ51XpqNDvi8z8=; b=Y5HyC94uw7V2PKb/vjmlTg/6kV
	XXvOIEpT9nqhzr3SfIyMEnj7gm2vmGr726fVUZ4ZR0iyyKiUShIzuEdqPWm2WJeIQKZdhMdkF+6ar
	fOOdmr2wtiLZiVLUJgEeheJ219KEVTGS/Jvn+niUvGIrITZWbUisJMtH96LiuXa+T+ILupewhwuAt
	u+XgQaIQTswK4qEXzF8gGaO1ojgSZZZBzKCGgh1dyyOy3W154o4ydcL+gB33PTdhudhsPXhQFBO3E
	FK8WQ7FcVriQp9qpf6arXDkv6dVmM41j5E0/OZlGY2Z96spYTeSyNChc+2qutEqCHGk0Jj9ev9d6b
	Xnz6kQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2X01-00E3YE-1K;
	Mon, 13 Nov 2023 13:29:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wzy-00E3Xa-1W
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E60C0B80DDF;
	Mon, 13 Nov 2023 13:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FDAC433C7;
	Mon, 13 Nov 2023 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699882144;
	bh=+2mkh4yIyUeEGCrAJG33DcCfBGAjXe3Cgtcf89a4hF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iio+o1ZlrCPEstCtxQLdSWIMmnogrnZwngRPYu01bBu9EjwpelZFO1453Mt3gw1mA
	 /nV8HrQuvpJaUUuOBT1DtzwVtse+JJvk47VAd0OOHrbD6JPPbbPSXvJqzr27x/Knfz
	 V1Wtg75PZKKRDSa/2tuyO8QAX8eov97/d9k+kMq8B1w7jWplHPX1ccNfQcqYbG3s2a
	 COPSGqNdMu/c73cu258LvdttiWiapZknT5p3yjBTtekCi7soPtwWZ8r+4/BNqhAg6Q
	 WF5vMq3Nw3IHH8UQiU0uEYsMrus5eE42JwUJLgnvzTs73PU0CL3TbtshGoto1FW17v
	 UT077SY6SAVTg==
Date: Mon, 13 Nov 2023 13:29:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 1/2] riscv: dts: cv1800b: add pinctrl node for cv1800b
Message-ID: <20231113-mama-underarm-a8bbf0c2a1f1@squawk>
References: <20231113005702.2467-1-jszhang@kernel.org>
 <20231113005702.2467-2-jszhang@kernel.org>
 <58a99001-8260-4970-9fc7-25fe81e557a5@sifive.com>
 <ZVIejw2O6on8QMYy@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZVIejw2O6on8QMYy@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_052906_794161_C6580752 
X-CRM114-Status: GOOD (  33.25  )
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
Content-Type: multipart/mixed; boundary="===============3805166224824677768=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3805166224824677768==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Zoqzoerm7+6YMc4"
Content-Disposition: inline


--7Zoqzoerm7+6YMc4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 09:03:11PM +0800, Jisheng Zhang wrote:
> On Sun, Nov 12, 2023 at 08:51:20PM -0500, Samuel Holland wrote:
> > On 2023-11-12 6:57 PM, Jisheng Zhang wrote:
> > > Add the reset device tree node to cv1800b SoC reusing the
> >           ^^^^^
> >           I assume you mean pinctrl here?
>=20
> oops copy and paste the commit msg ;) thanks
> >=20
> > > pinctrl-single driver.
> > >=20
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  arch/riscv/boot/dts/sophgo/cv-pinctrl.h | 19 +++++++++++++++++++
> > >  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 10 ++++++++++
> > >  2 files changed, 29 insertions(+)
> > >  create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> > >=20
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv-pinctrl.h b/arch/riscv/boo=
t/dts/sophgo/cv-pinctrl.h
> > > new file mode 100644
> > > index 000000000000..ed78b6fb3142
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> >=20
> > A couple of questions: Should this go in include/dt-bindings? And is it=
 worth
>=20
> When I cooked this series two weeks ago, I did put it in dt-binding, but
> then I found commit fe49f2d776f799 ("arm64: dts: ti: Use local header for
> pinctrl register values"), "These definitions were previously put in the
> bindings header to avoid code duplication and to provide some context
> meaning (name), but they do not fit the purpose of bindings." which is
> suggested and acked by Krzysztof, so I just want to follow the style
> here.
>=20
>=20
> > including macros for the actual function mappings, like in the vendor s=
ource[1]?
>=20
> Do you want something as the following?
>=20
> #define UART0_TX	0
> #define CAM_MCLK1	1
> ...
>=20
> #define REG_UART0_TX	0x24
> ...
>=20
> pinctrl-single,pins =3D <REG_UART0_TX UART0_TX>;
>=20
> Other pinctl-single users just uses the register value directly, I have
> no preference. But I'd like to get suggestions from DT and pinctl-single
> maintainers. Hi Rob, Krzysztof, Conor, Tony, what's your opinion?

Basically, if the definitions map directly to registers and are just
used to make writing your devicetree easier then they do not belong
in a binding. This differs from clock or reset indices, where we
essentially make up a set of indices that may or may not correlate to
offsets in the hardware as using the register values without any sort of
abstraction is not defining an ABI.

Cheers,
Conor.
>=20
> >=20
> > [1]:
> > https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/linux_5.10/=
drivers/pinctrl/cvitek/cv180x_pinlist_swconfig.h
> >=20
> > > @@ -0,0 +1,19 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * This header provides constants for pinctrl bindings for Sophgo CV=
* SoC.
> > > + *
> > > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > + */
> > > +#ifndef _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> > > +#define _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> > > +
> > > +#define MUX_M0		0
> > > +#define MUX_M1		1
> > > +#define MUX_M2		2
> > > +#define MUX_M3		3
> > > +#define MUX_M4		4
> > > +#define MUX_M5		5
> > > +#define MUX_M6		6
> > > +#define MUX_M7		7
> > > +
> > > +#endif
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boo=
t/dts/sophgo/cv1800b.dtsi
> > > index e04df04a91c0..7a44d8e8672b 100644
> > > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > @@ -6,6 +6,8 @@
> > >  #include <dt-bindings/interrupt-controller/irq.h>
> > >  #include <dt-bindings/reset/sophgo,cv1800b-reset.h>
> > > =20
> > > +#include "cv-pinctrl.h"
> > > +
> > >  / {
> > >  	compatible =3D "sophgo,cv1800b";
> > >  	#address-cells =3D <1>;
> > > @@ -55,6 +57,14 @@ soc {
> > >  		dma-noncoherent;
> > >  		ranges;
> > > =20
> > > +		pinctrl0: pinctrl@3001000 {
> > > +			compatible =3D "pinctrl-single";
> > > +			reg =3D <0x3001000 0x130>;
> > > +			#pinctrl-cells =3D <1>;
> > > +			pinctrl-single,register-width =3D <32>;
> > > +			pinctrl-single,function-mask =3D <0x00000007>;
> > > +		};
> >=20
> > From the vendor driver[2], it looks like this peripheral block only han=
dles
> > pinmuxing, so indeed this looks like a good use of pinctrl-single.
>=20
> This is deffinitely pinctrl-single style pinmux controller ;)
>=20
> >=20
> > [2]:
> > https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/linux_5.10/=
drivers/pinctrl/cvitek/pinctrl-cv180x.h
> >=20
> > > +
> > >  		rst: reset-controller@3003000 {
> > >  			compatible =3D "sophgo,cv1800b-reset";
> > >  			reg =3D <0x03003000 0x1000>;
> >=20

--7Zoqzoerm7+6YMc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVIkmgAKCRB4tDGHoIJi
0uRlAP9Px887Odlbyj2PwKsTBLE9E6OJ5moG9T721MhExHWzvgEA4FhpvDOu9zKu
fByJynWCnhTHWUzi0litF1aow7IBLwY=
=G+To
-----END PGP SIGNATURE-----

--7Zoqzoerm7+6YMc4--


--===============3805166224824677768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3805166224824677768==--

