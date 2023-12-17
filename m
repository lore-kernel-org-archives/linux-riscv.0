Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0F3C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 21:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCVNV86NrA4Ejcz4G7o6UHSCDUWI71tgqmDTIf/1cP8=; b=StUnrWnZearINwK5JC1ioRLs9w
	UIur6+aQ6MW9B3+oN62kL/5QjBXZh4EaOrwl7eWNo790cBa2KZLP/YmrquLFAOhhAhPXDWrQpq4R5
	c/TID4MVfxvM1unh+GnZN1FDdir2p9z5RlmQZEVta+ZDVYywwhIqpSXV/yXiwX5qjiBc57NDBo27+
	r137HLYATXt7fydcYt1b/p40J5jTTFbJTfoqdMiW1PXYdQ1gjBN4gPjWrrSBuXHADIunStjN/9z+j
	BvysydMdXcDJdwKlFJARwcu4KC553XBHXkcaRNthj+EG8Y/+IJ1I2WMT3pyZ0beVy6NRameBMtGxi
	uGez0z/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyIk-008SZf-0C;
	Sun, 17 Dec 2023 21:03:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyIg-008SYC-0w;
	Sun, 17 Dec 2023 21:03:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C9AA4CE0D9B;
	Sun, 17 Dec 2023 21:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A47C433C7;
	Sun, 17 Dec 2023 21:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702847023;
	bh=mCEcMXWBRCUl8ycxVYQtMfuRfaojP7UvcGTxOXhKDaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvrsPbSDBmXRz7fBWAVgf3e4EySM97yOUjYsBwbpgyiOdI9DY8G/gQoVfOAG5b9io
	 ELWQSRpweiRp25KmFZScZE1R7gu3L4njHUmSeYafmHTHI1hXgkZaaWm+wXueeGyORN
	 sZLgKSVG117kpnXWB//nwjQTcU5HLd07b5ozYEhy3wzX0cuqZ6M2yicJ+k0XCxRjaU
	 bYfavnhJ/435XHwjKKNE8uKp5+tbIyQKUqBUcbUdsw3Poed/utfsxAEUQnqJbL1W+U
	 yBb5EgZjWizSeRZC1XgwZNH1Nz5Hg1OZg9pXcBUMplPIgDrLmtpz+n3p6shg2jcd1L
	 P3At3ee5NOOhQ==
Date: Sun, 17 Dec 2023 21:03:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v3 5/9] riscv: dts: starfive: jh7100-common: Setup pinmux
 and enable gmac
Message-ID: <20231217-rippling-galleria-904152e41f95@spud>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
 <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_130350_789408_42287CBD 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Michael Turquette <mturquette@baylibre.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, kernel@collabora.com, linux-clk@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>, Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: multipart/mixed; boundary="===============1848906633910522306=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1848906633910522306==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kG7DkOG8HSp8FfWf"
Content-Disposition: inline


--kG7DkOG8HSp8FfWf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 16, 2023 at 11:38:53AM -0800, Emil Renner Berthing wrote:
> Cristian Ciocaltea wrote:
> > Add pinmux configuration for DWMAC found on the JH7100 based boards and
> > enable the related DT node, providing a basic PHY configuration.
> >
> > Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.c=
om>
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> >  .../boot/dts/starfive/jh7100-common.dtsi      | 85 +++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/ris=
cv/boot/dts/starfive/jh7100-common.dtsi
> > index 42fb61c36068..5cafe8f5c2e7 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > @@ -72,7 +72,92 @@ wifi_pwrseq: wifi-pwrseq {
> >  	};
> >  };
> >
> > +&gmac {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&gmac_pins>;
> > +	phy-mode =3D "rgmii-id";
> > +	phy-handle =3D <&phy>;
>=20
> I'm not sure if it's a generic policy or not, but I don't really like add=
ing a
> reference to a non-existant node here. I'd move this property to the board
> files where the phy node is actually defined.

FWIW, I don't like the reference-in-the-wrong-place thing either.

--kG7DkOG8HSp8FfWf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZX9iKAAKCRB4tDGHoIJi
0ljjAQDdeQS9ySXycX3Kr1uE7USW6FuoSN3axiU/roL2LS3UxAD/QmhKPwhsop/g
JHAPtH4K9zTWBI5z0reix7grWZuUDgQ=
=ljQG
-----END PGP SIGNATURE-----

--kG7DkOG8HSp8FfWf--


--===============1848906633910522306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1848906633910522306==--

