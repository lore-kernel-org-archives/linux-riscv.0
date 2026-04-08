Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DCD10F9960
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 17:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndeS+7SDpZHe2e230yOnRKPhj7dsYU+IrhM3SnD2R68=; b=NPBAgeY1HFaolqRKVxq5zCqWwa
	lXJQmzezq8eJQQizkMKtYDhWspliCBU45MJq6FMvaYNVW0p0fhDGzOEufV0GXr458nPxDU5oqo/6I
	m16X3MiiVQOl6ef2WDG2lBOFEqQjfzU/qLUkgVqBj198T/gDCa18GbsHsLfdR6OKAJLMFLnSBx0++
	rXMBtJsJOwqFpp55TaeAH5mR6RhjTMnGxBGG/76+qe16GBQy/sPEpQ9y6lTdLMv2oZx4wwtrwUPqs
	8VsR3+7C4ox3S2EhSggDnbA+x7LIi02hnln/AbA4l9HGbHOvSTC3MW5yfh9B7kL3cld4ikUkGrazu
	eHLkt+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWQH-000000099j3-2qi7;
	Wed, 08 Apr 2026 17:10:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWQF-000000099ig-1SeP
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 17:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAA03438D4;
	Wed,  8 Apr 2026 17:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721F8C19421;
	Wed,  8 Apr 2026 17:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775668233;
	bh=VemTHUNOHqbQhomT+Nwffv1fwuVRoqZYJeo1rBqbfRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQyxn6a3xAGTnA/HWecd7jmECH8FShhe631u+N2mcXjikdaV6k6i7k0b2sPOn2/yp
	 OiaqyUPWqyYZ5RL228fsYVJ9ZafY8X0vhci7EI6k+6tkcracqOvWprcs0nRiHMjIiN
	 etgDQSA0NwChnr7dRHPbkww1RAGqo7kBLhz2sdhjgbvNLmdPp5a0+Z1TMTKoIxArf/
	 xhLBAdsKinHFh7bAFTGfgOz0svtiu1MDSsmME57iXE8KI4LadeqXfUa4km6fuHp4LA
	 FT3m+gjV9NBEcAWB5ndoBFgQeowUYnfWVNZ3gQpn3XINr9OucV2+d+atc2T6KH9hxG
	 9UwnlkUtDdc2Q==
Date: Wed, 8 Apr 2026 18:10:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] riscv: add UltraRISC SoC family Kconfig support
Message-ID: <20260408-wise-dividers-ec8a057d4bd2@spud>
References: <20260407-ultrarisc-pcie-v2-0-2aa2a19a7fb3@ultrarisc.com>
 <20260407-ultrarisc-pcie-v2-1-2aa2a19a7fb3@ultrarisc.com>
 <20260407-shown-guileless-5c8b8d94f5e5@spud>
 <177561282495.2731393.9548650582911498336.b4-reply@b4>
MIME-Version: 1.0
In-Reply-To: <177561282495.2731393.9548650582911498336.b4-reply@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_101035_450365_594466F0 
X-CRM114-Status: GOOD (  27.50  )
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
Content-Type: multipart/mixed; boundary="===============3420553234931970349=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3420553234931970349==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PAOwAJ1VswMSS1Ix"
Content-Disposition: inline


--PAOwAJ1VswMSS1Ix
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2026 at 09:47:04AM +0800, Jia Wang wrote:
> On 2026-04-07 17:29 +0100, Conor Dooley wrote:
> > On Tue, Apr 07, 2026 at 10:40:52AM +0800, Jia Wang wrote:
> > > The first SoC in the UltraRISC series is UR-DP1000, containing octa
> > > UltraRISC C100 cores.
> >=20
> > Not gonna lie, I find it odd that pcie is where this platform starts
> > off, but sure. What's the plan for adding the rest of the platform?
> >
>=20
> Hi Conor,
>=20
> Thanks for the question.
>=20
> Our next step is to upstream the pinctrl driver together with the related
> DTS updates. The pinctrl series only affects the SoC=E2=80=99s low-speed =
peripheral
> interfaces. For GMAC, SPI, I2C, and GPIO, we plan to use the existing
> kernel drivers, so no new controller drivers are needed=20

And clocks? pinctrl and clocks would be the bare minimum level of
support required before a platform should be merged. Obviously, you can
get device drivers for PCI etc etc merged without clock drivers, but the
initial dts should contain the clocks too.

> > >=20
> > > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > > ---
> > >  arch/riscv/Kconfig.socs | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index d621b85dd63b..98708569ec6a 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -84,6 +84,15 @@ config ARCH_THEAD
> > >  	help
> > >  	  This enables support for the RISC-V based T-HEAD SoCs.
> > > =20
> > > +config ARCH_ULTRARISC
> > > +	bool "UltraRISC RISC-V SoCs"
> > > +	help
> > > +	  This enables support for UltraRISC SoC platform hardware,
> > > +	  including boards based on the UR-DP1000.
> >=20
> > > +	  UR-DP1000 is an 8-core 64-bit RISC-V SoC that supports
> > > +	  the RV64GCBHX ISA. It supports Hardware Virtualization
> > > +	  and RISC-V RV64 ISA H(v1.0) Extension.
> >=20
> > Delete this section IMO, doesn't provide any real value. Don't need nor
> > want the marketing brochure in the help text. The first sentence is
> > sufficient.
> >
>=20
> I=E2=80=99ll drop the SoC description part from the Kconfig help text as =
you
> suggested.
> =20
> > > +
> > >  config ARCH_VIRT
> > >  	bool "QEMU Virt Machine"
> > >  	select POWER_RESET
> > >=20
> > > --=20
> > > 2.34.1
> > >=20
>=20
> Best regards,
> Jia Wang
>=20

--PAOwAJ1VswMSS1Ix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadaMAwAKCRB4tDGHoIJi
0s4aAP4/zVM8abd/kBx74iWV4RRMqLs8Q8+zIaMqjQAhxLbkDQEAt8x6jy+kcvVd
XeqklOhbRz0kXh31JASEBm4BQ3iRhQQ=
=nYVT
-----END PGP SIGNATURE-----

--PAOwAJ1VswMSS1Ix--


--===============3420553234931970349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3420553234931970349==--

