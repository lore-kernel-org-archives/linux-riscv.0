Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74C5C47073
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpFDuSi4vHkDm1qO4E3eZJZ4XZAVzXwxwrDESlp4Vw0=; b=fpHaEji2Cg41gTu2iKRjT4kP8L
	1aFgY8EjPoBvvzBnRFpzSMn76rwDNC1QykiLhwMyBds/sFLiTVGarRLOBsrsqT4DSlKHjNxzKBy54
	c37JjQFLmBDHoz8Xx+ehbLg0hKZDXRUUVuDg7zLOPr1YvXxgMz3u7y7LaKXLZPaqwDOVy/hD20ATL
	spj/YEVXx2NxGsilj8tpCxAygZCffatpLm1Byg4uhqWFgRrBNUi+xzlUcgBbzv1BVSq9CELMC94p5
	u1NIYtk994KK7WB5N81EXcXYaSUaHes+o6YEJaqbC6CXs7dW3hrvQojm7tJxsLwhDBeBC4Ab7MX23
	6DuElbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNBo3-008KY8-2R;
	Tue, 09 Jan 2024 13:06:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNBo0-008KXC-0c
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 13:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1704805568; x=1736341568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xpBv9CLJKeH2ktyG75BQLyQVSsvCPHK4QXybdij5Pio=;
  b=prEKb8cr8nvfpOBhqv5+4BmpBHNOqOH4r/T3BZYcarSBhDPHOpmhPTL/
   3XP7TOZsS0O1Q7Yd5FEZwtjZJCisV3dp5/EF2m9KhOxS6XCH+YxY49j8i
   rLRK2M0qkzMhBsf37Uk2q+XGLhGzHRZSTjCFccybHqVr6MOQjLEVhvCE2
   ka+4j673nZraysFV13Dhy/ijGh5ap1d+FlvoOlWVZWDCQGkemDk7Gol2n
   VUddsPg7SXwqkH6sODGahrLHjPmtHl7jvCT18raCJW/OiA3ky4pnFnII9
   7h+ZhpeQ8wCoITtruXpiFpjsP22NB9z162QJlPS9o5zYsYFWUPolrxjjj
   w==;
X-CSE-ConnectionGUID: z9oYC0TYRhSMRpXWHeg5bw==
X-CSE-MsgGUID: iYtnSFXNRk2uY32sOXE+VQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="asc'?scan'208";a="14904599"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jan 2024 06:06:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 06:05:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 9 Jan 2024 06:05:27 -0700
Date: Tue, 9 Jan 2024 13:04:52 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Conor Dooley <conor@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Message-ID: <20240109-tiptoeing-twirl-ebb943e17a29@wendy>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-4-emil.renner.berthing@canonical.com>
 <20240108-majorette-overtly-4ec65d0a15e9@spud>
 <CAJM55Z_2zhELW3E7p94J05We17xTC2Rejs5AigNJOHCGHVr_zg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_2zhELW3E7p94J05We17xTC2Rejs5AigNJOHCGHVr_zg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_050608_413832_03C4F6BE 
X-CRM114-Status: GOOD (  27.78  )
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
Content-Type: multipart/mixed; boundary="===============4298664616186865828=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4298664616186865828==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XthaSr7XjsnpG3pO"
Content-Disposition: inline

--XthaSr7XjsnpG3pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 04:02:01AM -0800, Emil Renner Berthing wrote:
> Conor Dooley wrote:
> > On Wed, Jan 03, 2024 at 02:28:40PM +0100, Emil Renner Berthing wrote:
> > > Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.
> > >
> > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.c=
om>
> > > ---
> > >  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  4 ++++
> > >  .../dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
> > >  arch/riscv/boot/dts/thead/th1520.dtsi         | 24 +++++++++++++++++=
++
> > >  3 files changed, 32 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arc=
h/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > index 70e8042c8304..6c56318a8705 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > @@ -44,6 +44,10 @@ &osc_32k {
> > >  	clock-frequency =3D <32768>;
> > >  };
> > >
> > > +&aonsys_clk {
> > > +	clock-frequency =3D <73728000>;
> > > +};
> > > +
> > >  &apb_clk {
> > >  	clock-frequency =3D <62500000>;
> > >  };
> > > diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b=
/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > index a802ab110429..9865925be372 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > @@ -25,6 +25,10 @@ &osc_32k {
> > >  	clock-frequency =3D <32768>;
> > >  };
> > >
> > > +&aonsys_clk {
> > > +	clock-frequency =3D <73728000>;
> > > +};
> > > +
> > >  &apb_clk {
> > >  	clock-frequency =3D <62500000>;
> > >  };
> > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/=
dts/thead/th1520.dtsi
> > > index ba4d2c673ac8..e65a306ff575 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > @@ -134,6 +134,12 @@ osc_32k: 32k-oscillator {
> > >  		#clock-cells =3D <0>;
> > >  	};
> > >
> > > +	aonsys_clk: aonsys-clk {
> > > +		compatible =3D "fixed-clock";
> > > +		clock-output-names =3D "aonsys_clk";
> > > +		#clock-cells =3D <0>;
> > > +	};
> >
> > Did this stuff sneak into this commit accidentally?
>=20
> Not really by accident no. It turns out the clock tree has gates for the =
bus
> clock of each pinctrl block and I think it's better to add this clock
> dependency to the bindings and driver up front.

Maybe if I had looked a wee bit more deeply I would've noticed that it
was used there, but it's always good to mention the rationale in the
commit message so that it's more obvious why you're doin it.

> Since there is not yet any clock driver the initial device tree for the T=
H1520
> included the dummy apb_clk that two of the pinctrl blocks derive their cl=
ock
> from, but not the "aonsys" clock needed by the "always-on" pinctrl. I tho=
ught
> it was better to add this dummy clock with the only (so far) user of it, =
but if
> you have a better idea, let me know.

No, that's fine. I was just wondering why there was an unmentioned set
of clocks being added. If they're stubbed fixed clocks I dunno if it
makes sense to add them to the board.dts/module.dtsi files though. Where
do the initial values come from for the rates? Out of reset values or
set by firmware that may vary from board to board?

Cheers,
Conor.

--XthaSr7XjsnpG3pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ1EdAAKCRB4tDGHoIJi
0ttJAPsEUXEE+T2o1HyH4EYifCCIDWdJZg4jidJGk2a0Yy+zNQD/UmU1FXzzcPlx
B6tqiO1KUss7XC5DTIAZ9oVaxy5K9gU=
=cRuY
-----END PGP SIGNATURE-----

--XthaSr7XjsnpG3pO--


--===============4298664616186865828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4298664616186865828==--

