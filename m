Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480BDC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LaI5v98UWd/Sv+Rtn1qKiN2B2AtAjzHKcCvY2DUY7oI=; b=hkPGOlQxWi0/Ign4V0cU+K3RKI
	cPWlZzxRgnyFNEqFp5gZlywnijYhT8EPY654KkCgz1wOSPEPqL+eiAuKhf8MgC+LeheXwjICNtBer
	OXzb/u5WF0s7uotFcJHu6MvP3eS8gwxJkTjdVJZXSFTls9wf+xFI5blnZe/PtfgAEScRPOgpw9vdP
	MRf/QQzugCIWCMh2KHi2/7olDyer/e5F3icl/zLFq0bFE3Gat0cCx+cLFUDtQsf9GY4pSjdiJrHJX
	vDZi8YIh2PYdabNdFjAXuszWf9KNBxUiIiG115Vul/zWj6kVP50ZeFHrwLAGST17EwY8AGgdYUgUv
	X2d9l+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNFzb-0090us-1j;
	Tue, 09 Jan 2024 17:34:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNFzX-0090tw-1s
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 17:34:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D5D8614D8;
	Tue,  9 Jan 2024 17:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4607C433C7;
	Tue,  9 Jan 2024 17:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704821657;
	bh=syCE0BwfVDeT7qH/cCOtSq9aFIuBR8gzEpq+znSgolk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WtDy9JMoBJ8Bqdzgh4pdgHwfeHnq/lTRlgWOjpVrsVDh9iQUpWTaCcbauLGaYfMVt
	 PMwEzI3ItkcSQAaYRbsO2fnDxjRWVqpZ2lKto9elLBlu+RHndSsAgQTudV6zbS8G2t
	 6pUx78AGOpsTp/Yju8lgUpLpNZngGJVCdzP6guysEzeWmlzcEgihoLbbBKBk1yYsH/
	 NcvQ48SixJR3Kr04zgXJRJ3QazKc3AiWQo0XhMkjJRq99Jo8Tu0bLjbkUclRuFIMMI
	 nI0N8DtwtWV4H+/0RMm5mzRLRkZeEHJgHA3T3aYzxz0vkI/QU+N6GB2ey/BucqCUEn
	 M3UxvVa7cdXhQ==
Date: Tue, 9 Jan 2024 17:34:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Message-ID: <20240109-boggle-frugality-03a77cab8308@spud>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-4-emil.renner.berthing@canonical.com>
 <20240108-majorette-overtly-4ec65d0a15e9@spud>
 <CAJM55Z_2zhELW3E7p94J05We17xTC2Rejs5AigNJOHCGHVr_zg@mail.gmail.com>
 <20240109-tiptoeing-twirl-ebb943e17a29@wendy>
 <CAJM55Z9Ka3hiNmgFuy01Yd0YyxL-SzS=A7S3k84=B1xABKbJhA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z9Ka3hiNmgFuy01Yd0YyxL-SzS=A7S3k84=B1xABKbJhA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_093419_750030_6D558D02 
X-CRM114-Status: GOOD (  37.32  )
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
Content-Type: multipart/mixed; boundary="===============7060685226532439036=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7060685226532439036==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hJD6qYXNgkRLNOMK"
Content-Disposition: inline


--hJD6qYXNgkRLNOMK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 06:28:19AM -0800, Emil Renner Berthing wrote:
> Conor Dooley wrote:
> > On Tue, Jan 09, 2024 at 04:02:01AM -0800, Emil Renner Berthing wrote:
> > > Conor Dooley wrote:
> > > > On Wed, Jan 03, 2024 at 02:28:40PM +0100, Emil Renner Berthing wrot=
e:
> > > > > Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.
> > > > >
> > > > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonic=
al.com>
> > > > > ---
> > > > >  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  4 ++++
> > > > >  .../dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
> > > > >  arch/riscv/boot/dts/thead/th1520.dtsi         | 24 +++++++++++++=
++++++
> > > > >  3 files changed, 32 insertions(+)
> > > > >
> > > > > diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b=
/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > > index 70e8042c8304..6c56318a8705 100644
> > > > > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > > @@ -44,6 +44,10 @@ &osc_32k {
> > > > >  	clock-frequency =3D <32768>;
> > > > >  };
> > > > >
> > > > > +&aonsys_clk {
> > > > > +	clock-frequency =3D <73728000>;
> > > > > +};
> > > > > +
> > > > >  &apb_clk {
> > > > >  	clock-frequency =3D <62500000>;
> > > > >  };
> > > > > diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dt=
si b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > > > index a802ab110429..9865925be372 100644
> > > > > --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > > > +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > > > @@ -25,6 +25,10 @@ &osc_32k {
> > > > >  	clock-frequency =3D <32768>;
> > > > >  };
> > > > >
> > > > > +&aonsys_clk {
> > > > > +	clock-frequency =3D <73728000>;
> > > > > +};
> > > > > +
> > > > >  &apb_clk {
> > > > >  	clock-frequency =3D <62500000>;
> > > > >  };
> > > > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/b=
oot/dts/thead/th1520.dtsi
> > > > > index ba4d2c673ac8..e65a306ff575 100644
> > > > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > > @@ -134,6 +134,12 @@ osc_32k: 32k-oscillator {
> > > > >  		#clock-cells =3D <0>;
> > > > >  	};
> > > > >
> > > > > +	aonsys_clk: aonsys-clk {
> > > > > +		compatible =3D "fixed-clock";
> > > > > +		clock-output-names =3D "aonsys_clk";
> > > > > +		#clock-cells =3D <0>;
> > > > > +	};
> > > >
> > > > Did this stuff sneak into this commit accidentally?
> > >
> > > Not really by accident no. It turns out the clock tree has gates for =
the bus
> > > clock of each pinctrl block and I think it's better to add this clock
> > > dependency to the bindings and driver up front.
> >
> > Maybe if I had looked a wee bit more deeply I would've noticed that it
> > was used there, but it's always good to mention the rationale in the
> > commit message so that it's more obvious why you're doin it.
>=20
> You absolutely right. I forgot to update the commit message.
>=20
> > > Since there is not yet any clock driver the initial device tree for t=
he TH1520
> > > included the dummy apb_clk that two of the pinctrl blocks derive thei=
r clock
> > > from, but not the "aonsys" clock needed by the "always-on" pinctrl. I=
 thought
> > > it was better to add this dummy clock with the only (so far) user of =
it, but if
> > > you have a better idea, let me know.
> >
> > No, that's fine. I was just wondering why there was an unmentioned set
> > of clocks being added. If they're stubbed fixed clocks I dunno if it
> > makes sense to add them to the board.dts/module.dtsi files though. Where
> > do the initial values come from for the rates? Out of reset values or
> > set by firmware that may vary from board to board?
>=20
> The vendor u-boot sets the PLLs different from the reset values. For now I
> think it's the same code for every board using the Lichee Pi 4A module (a=
nd
> probably also for the BeagleV Ahead), but it might still make sense to mo=
ve the
> freqency to the board instead of the module device tree.

Yeah, think so. Only temporarily though, do you have a clue if anyone is
working on the actual clock driver stuff? Seems pretty Deadge?
https://lore.kernel.org/linux-clk/?q=3Dth1520

Cheers,
Conor.

--hJD6qYXNgkRLNOMK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ2DkwAKCRB4tDGHoIJi
0pcOAPoD+P51AMazIRXDSkpKgUQM6eBblVNkqmaR1okaVmmX7wEA7wVS+pAjp9hI
N8snAcL1efQHu26mrSkIAL4yScknnwg=
=wI/n
-----END PGP SIGNATURE-----

--hJD6qYXNgkRLNOMK--


--===============7060685226532439036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7060685226532439036==--

