Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325F7C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5sYT69n47WwLlYYL2EMJIrXaL6dxwSFmapWUCDXwyA=; b=r43ppSsa0cyqQV7lfF1LlL92L5
	aQdx4Y10SYcCs1iWabYS1NwZx3S2JtVu20VyZseiJAZp59dnzbc6Fj9d9v6YuL5hV5vMfTeY4Ir78
	hQmeKi5W3IfNRQA23uAwS/z8EXUs/1n27laeV2SDmyG4lcTuYGJUXWfFKrl+YNGPT6Us7pFW6EzvJ
	Md49WAG2iSyn3HbLy8UK+KyE2oN3r9aknz0RZJOOyGuX4Qz8bC8VQc84ldMfrB+EydI7bcU9hemHK
	DIB4xzk1R0Meq7pBH+J4NWWtq751+qUGzO7XTjRpZF3qD0G+pRFR3PEYsH8XRcD4EeSbZCJPidYr8
	00f66hOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAGMO-00Fzps-Eg; Tue, 27 Dec 2022 20:15:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAGMA-00Fzmp-Lu
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 20:15:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29E1961233;
	Tue, 27 Dec 2022 20:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24085C433F1;
	Tue, 27 Dec 2022 20:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672172125;
	bh=05aH1T5J9X8xJdMwaufCNdVfPimoX7Jh2SPx1rTYKAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdvX0FuRE3DZzXJE2NJ8B8iXHgzLBh44LQM3ukhziA1887ExlNtE2PerPLw3RRE6r
	 Gzt4SoUi2Iq5lPBQlRV9yaQD2TKna5BucJVlwKcpBwquw+hIN0RI/Yyg6SrwB9QV1p
	 aF+6xK0cYJskPZPEL8H2YyuBk754wukCQHcNxQRTRm7Q27FNtMX8dN1Mut7bUdLoNj
	 oqqTpR+GfpTga3hWeJbFpAuBKP1lcKHUKvqPPZYnOaerhsl6tg+zeYDfuH6ye2LYaC
	 cOKAFhM/jnob+CN5It7laI/GjTWMLNpYyZF2hcvlgS7Nbhg3kJs3huZRxJCaw3Mhez
	 +Fi2cLLD2ql3w==
Date: Tue, 27 Dec 2022 20:15:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <Y6tSWB2+98a8k9Qw@spud>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-8-hal.feng@starfivetech.com>
 <Y6JB37Pd5TZoGMy4@spud>
 <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_121527_349232_E26E2CA4 
X-CRM114-Status: GOOD (  32.28  )
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
Content-Type: multipart/mixed; boundary="===============1873035297788182285=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1873035297788182285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QeM6KLNzCPBbmiJk"
Content-Disposition: inline


--QeM6KLNzCPBbmiJk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 26, 2022 at 12:26:32AM +0800, Hal Feng wrote:
> On Tue, 20 Dec 2022 23:14:39 +0000, Conor Dooley wrote:
> > On Tue, Dec 20, 2022 at 08:50:50AM +0800, Hal Feng wrote:
> > > From: Emil Renner Berthing <kernel@esmil.dk>
> > >=20
> > > Add bindings for the system clock and reset generator (SYSCRG) on the
> > > JH7110 RISC-V SoC by StarFive Ltd.
> > >=20
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

> > > +  clocks:
> > > +    items:
> > > +      - description: Main Oscillator (24 MHz)
> > > +      - description: GMAC1 RMII reference
> > > +      - description: GMAC1 RGMII RX
> > > +      - description: External I2S TX bit clock
> > > +      - description: External I2S TX left/right channel clock
> > > +      - description: External I2S RX bit clock
> > > +      - description: External I2S RX left/right channel clock
> > > +      - description: External TDM clock
> > > +      - description: External audio master clock
> >=20
> > So, from peeking at the clock driver & the dt - it looks like a bunch of
> > these are not actually required?
>=20
> These clocks are used as root clocks or optional parent clocks in clock t=
ree.
> Some of them are optional, but they are required if we want to describe t=
he
> complete clock tree of JH7110 SoC.

Perhaps I have a misunderstand of what required means. To me, required
means "you must provide this clock for the SoC to operate in all
configurations".
Optional therefore would be for things that are needed only for some
configurations and may be omitted if not required.

=46rom your comment below, boards with a JH7110 may choose not to populate
both external clock inputs to a mux. In that case, "dummy" clocks should
not have to be provided in the DT of such boards to satisfy this binding
which seems wrong to me..

It would seem to me that you need to set minItems < maxItems here to
account for that & you do in fact need clock-names.

>=20
> > I'd have ploughed through this, but having read Krzysztof's comments on
> > the DTS I'm not sure that this binding is correct.
> > https://lore.kernel.org/linux-riscv/20221220011247.35560-1-hal.feng@sta=
rfivetech.com/T/#mdf67621a2344dce801aa8015d4963593a2c28bcc
> >=20
> > I *think* the DT is correct - the fixed clocks are all inputs from clock
> > sources on the board and as such they are empty in soc.dtsi and are
> > populated in board.dts?
>=20
> Yes, the fixed clocks are all clock sources on the board and input to the=
 SoC.
>=20
> >=20
> > However, are they all actually required? In the driver I see:
> > 	JH71X0__MUX(JH7110_SYSCLK_GMAC1_RX, "gmac1_rx", 2,
> > 		    JH7110_SYSCLK_GMAC1_RGMII_RXIN,
> > 		    JH7110_SYSCLK_GMAC1_RMII_RTX),
> > That macro is:
> > #define JH71X0__MUX(_idx, _name, _nparents, ...) [_idx] =3D {			\
> > 	.name =3D _name,								\
> > 	.flags =3D 0,								\
> > 	.max =3D ((_nparents) - 1) << JH71X0_CLK_MUX_SHIFT,			\
> > 	.parents =3D { __VA_ARGS__ },						\
> > }
> >=20
> > AFAICT, RMII reference feeds RMII_RTX & RGMII RX *is* RGMII_RXIN?
> > Does that mean you need to populate only one of GMAC1 RMII reference
> > and GMAC1 RMGII RX and the other is optional?
>=20
> Yes, actually only one of them is chosen as the root clock
> source of the clock "gmac1_rx".
>=20
> >=20
> > What have I missed?
> >=20
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: osc
> > > +      - const: gmac1_rmii_refin
> > > +      - const: gmac1_rgmii_rxin
> > > +      - const: i2stx_bclk_ext
> > > +      - const: i2stx_lrck_ext
> > > +      - const: i2srx_bclk_ext
> > > +      - const: i2srx_lrck_ext
> > > +      - const: tdm_ext
> > > +      - const: mclk_ext
> >=20
> > If all clocks are in fact required though, isn't this kinda pointless to
> > have since we already know that the order is fixed from the "clocks"
> > property?
> > Krzk/Rob?
>=20
> The clock-names are used to easily identify these clocks in the clock dri=
ver.

*IF* all clocks were in fact required, which they aren't, you could rely
on the order alone in the driver as it is enforced by the binding.

Thanks,
Conor.


--QeM6KLNzCPBbmiJk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6tSWAAKCRB4tDGHoIJi
0okFAQDbwbv2vh4vzfMxQaOPh/4qjm21F5guRuUmxtaUrbR/ewD+ITavqwpW/C9k
P7J8TeZguPS5ySAAW47uKDXola3y3QQ=
=YoA4
-----END PGP SIGNATURE-----

--QeM6KLNzCPBbmiJk--


--===============1873035297788182285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1873035297788182285==--

