Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2042FC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EoZLQWP33F9soI4q+5LkBMGQgvf+r4APc2y+2yni/4=; b=ftKJXF+R72/jqgaF/izhJzB3t6
	D+PvA0nQwwDuYEClcj6zO3eF5H2/VR2/YvaBAQpHadPsRH7n+dvnL63n9/OCLZJfV24cj+SCp4IcP
	Yd/8TXN7VK+SOLWYECKFEaKuZ0TRFxPdtvmz4dAbDRyGqtWrJqP99rvaUfSln3cit1p4LaLHxM5GC
	NogTO62kki3CBNPibQZvRwpOj6zLZpDF4PCmGD69+lJ2jC/OGz0zpNE1JFW604BfWk+spkfrZ+Z1f
	jnm+FG6598VS6C2aqOeBzpZ7mVDLdwYI/05BbD6nCsgZg/EOfuLNtVD+2DaF5kL40+d16YuDyMQIg
	IMheFELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGq5-001M7v-0h;
	Thu, 23 Mar 2023 09:02:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGq1-001M75-2G
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 09:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679562145; x=1711098145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PaQtkvTOLRhCk6nrvbWJlygudDxC9m49B4Nt0wj5BMc=;
  b=yJywUyoMCTuAFFAJKjbbZ6a9n3Bw5Y2/uR3PLpCsumlo6yTBeFbZ4AOU
   zSXN09gaRymNAuZ7r/aOnquUFSsnx/FdMnlezSp1vZzQpPpObidqPLnFN
   9ZKIU8684AqFXMG6zcRXKxRnTAWa8OHyQWuOAry262dJAUbhw+CX0MCK8
   h+DXozjLqPRTiwlqXSCZJSX1Jln2RMXDXZ2/R+v+wSHfgE6ffCq/utR+J
   fXpJV7XsjLHBCKp3RXJ7chEnnaNT5QKI6/FP4Mya9qEqwc6LI4YJ0D+ZQ
   EtCYXpnn5V8YRCOVoknXjpsSzMSpv2XF3OPGk0rwmJikpOkntixqburj2
   w==;
X-IronPort-AV: E=Sophos;i="5.98,283,1673938800"; 
   d="asc'?scan'208";a="203031984"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Mar 2023 02:02:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 02:02:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Mar 2023 02:02:16 -0700
Date: Thu, 23 Mar 2023 09:01:58 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <828e8cb9-a4c6-4c2d-8a23-2cfdc4395fe1@spud>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
 <20230320103750.60295-12-hal.feng@starfivetech.com>
 <b4beb457-8581-4b2f-8655-2e3f82a94f75@spud>
 <5b75161e-3d0d-50e5-fd4e-af92edf62317@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <5b75161e-3d0d-50e5-fd4e-af92edf62317@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_020225_843962_E561119D 
X-CRM114-Status: GOOD (  37.79  )
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
Content-Type: multipart/mixed; boundary="===============1960417457114316329=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1960417457114316329==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Foui7XXDAfVTlAsO"
Content-Disposition: inline

--Foui7XXDAfVTlAsO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hal, Emil,

On Thu, Mar 23, 2023 at 03:44:41PM +0800, Hal Feng wrote:
> On Wed, 22 Mar 2023 21:53:37 +0000, Conor Dooley wrote:
> > On Mon, Mar 20, 2023 at 06:37:40PM +0800, Hal Feng wrote:
> >> From: Emil Renner Berthing <kernel@esmil.dk>
> >>=20
> >> Add bindings for the system clock and reset generator (SYSCRG) on the
> >> JH7110 RISC-V SoC by StarFive Ltd.
> >>=20
> >> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
> >>  MAINTAINERS                                   |   8 +-
> >>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
> >>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
> >>  4 files changed, 454 insertions(+), 3 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,j=
h7110-syscrg.yaml
> >>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
> >>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-s=
yscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg=
=2Eyaml
> >> new file mode 100644
> >> index 000000000000..84373ae31644
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.y=
aml
> >> @@ -0,0 +1,104 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: StarFive JH7110 System Clock and Reset Generator
> >> +
> >> +maintainers:
> >> +  - Emil Renner Berthing <kernel@esmil.dk>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: starfive,jh7110-syscrg
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    oneOf:
> >> +      - items:
> >> +          - description: Main Oscillator (24 MHz)
> >> +          - description: GMAC1 RMII reference or GMAC1 RGMII RX
> >> +          - description: External I2S TX bit clock
> >> +          - description: External I2S TX left/right channel clock
> >> +          - description: External I2S RX bit clock
> >> +          - description: External I2S RX left/right channel clock
> >> +          - description: External TDM clock
> >> +          - description: External audio master clock
> >> +
> >> +      - items:
> >> +          - description: Main Oscillator (24 MHz)
> >> +          - description: GMAC1 RMII reference
> >> +          - description: GMAC1 RGMII RX
> >> +          - description: External I2S TX bit clock
> >> +          - description: External I2S TX left/right channel clock
> >> +          - description: External I2S RX bit clock
> >> +          - description: External I2S RX left/right channel clock
> >> +          - description: External TDM clock
> >> +          - description: External audio master clock
> >> +
> >> +  clock-names:
> >> +    oneOf:
> >> +      - items:
> >> +          - const: osc
> >> +          - enum:
> >> +              - gmac1_rmii_refin
> >> +              - gmac1_rgmii_rxin
> >> +          - const: i2stx_bclk_ext
> >> +          - const: i2stx_lrck_ext
> >> +          - const: i2srx_bclk_ext
> >> +          - const: i2srx_lrck_ext
> >> +          - const: tdm_ext
> >> +          - const: mclk_ext
> >> +
> >> +      - items:
> >> +          - const: osc
> >> +          - const: gmac1_rmii_refin
> >> +          - const: gmac1_rgmii_rxin
> >> +          - const: i2stx_bclk_ext
> >> +          - const: i2stx_lrck_ext
> >> +          - const: i2srx_bclk_ext
> >> +          - const: i2srx_lrck_ext
> >> +          - const: tdm_ext
> >> +          - const: mclk_ext
> >=20
> > I'm sorry to be a bit of a bore about these bindings, but Emil mentioned
> > to me today that he had some doubts about whether any of these audio
> > clocks are actually required.
> > I've had a bit of a look at the driver, cos the TRM that I have doesn't
> > describe the clock tree (from what recall at least) and I think he is
> > right.
> > For example, the TDM clock:
> > +	JH71X0_GATE(JH7110_SYSCLK_TDM_AHB, "tdm_ahb", 0, JH7110_SYSCLK_AHB0),
> > +	JH71X0_GATE(JH7110_SYSCLK_TDM_APB, "tdm_apb", 0, JH7110_SYSCLK_APB0),
> > +	JH71X0_GDIV(JH7110_SYSCLK_TDM_INTERNAL, "tdm_internal", 0, 64, JH7110=
_SYSCLK_MCLK),
> > +	JH71X0__MUX(JH7110_SYSCLK_TDM_TDM, "tdm_tdm", 2,
> > +		    JH7110_SYSCLK_TDM_INTERNAL,
> > +		    JH7110_SYSCLK_TDM_EXT),
> >=20
> > Hopefully, I'm not making a balls of something here, but it looks like I
> > can choose an internal TDM clock, that is based on JH7110_SYSCLK_MCLK,
> > which in turn comes from either an internal or external source.
> > If I am following correctly, that'd be:
> > +	JH71X0__DIV(JH7110_SYSCLK_MCLK_INNER, "mclk_inner", 64, JH7110_SYSCLK=
_AUDIO_ROOT),
> >=20
> > Which in turn comes from:
> > +	JH71X0__DIV(JH7110_SYSCLK_AUDIO_ROOT, "audio_root", 8, JH7110_SYSCLK_=
PLL2_OUT),
> >=20
> > This leaves me wondering which clocks are *actually* required for a
> > functioning system - is it actually just osc and one of gmac1_rmii_refin
> > or gmac1_rgmii_rxin.
>=20
> As I had mentioned somewhere before, some audio clocks need to change the=
ir
> parents at different stages of work. I should explain in detail here.
>=20
> For the i2s*_ext clocks, we should use these external clocks as parents w=
hen
> the I2S module is working in the slave mode, while we should use the inte=
rnal
> clocks as parents when the I2S module is working in the master mode.
>=20
> For the tdm_ext clock, we use it as the clock source for an accurate play=
back
> rate. If we use the internal clock as clock source, the TDM can't work
> normally, because it can't get a required rate from the internal divider.
> By the way, note that we need to use the internal clock as clock source w=
hen
> we try to reset the tdm clock, otherwise, the reset will fail.
>=20
> For the mclk_ext clock, which is 12.288MHz, it's used as the clock source
> through all the running time, otherwise, the daughter clocks can't get the
> required rate from the internal PLL2 clock (1188MHz) through dividers.
>=20
> So all these audio external clocks (i2s*_ext / tdm_ext / mclk_ext) are
> actually required.

Okay. I think I am okay with leaving the binding as-is then, and if
someone needs to omit the entire audio subsystem on the SoC, they can
follow Stephen's suggestion.

@Emil, is that okay with you?

--Foui7XXDAfVTlAsO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBwVhgAKCRB4tDGHoIJi
0i/3AP9r2zZm6eoH/54hqo2pd+NSfc9/7hEFva5Rb8WtL+g7jQD/eIwjER83anUB
EBld9LgX9JfHICJiEkV/c3WCtgEtbQo=
=XiNe
-----END PGP SIGNATURE-----

--Foui7XXDAfVTlAsO--


--===============1960417457114316329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1960417457114316329==--

