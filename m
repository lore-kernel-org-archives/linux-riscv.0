Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1553CC61DBD
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGMkhQV5Jm2ItoO9ePorBECH3Bpx/oCaIVYqcn1GcXM=; b=nGokkI5FZI4FU+mR63AsU4UlQx
	WjFmCIt520QjbpLlaFnl2QRlgPDvWlfOkTNyIZLbay5sdEi4g3GKZIrItrjO8rxT/xZfaKZW7VfKQ
	NEbdufMF9gksSuVJXe534nrTT/EHk3+zHorB4IGlfMzYYYcLt+Dygi/OMcZC5f0XF0NcMElH39HDG
	eP6m5KzAUN5O9XGqbhFgLAEZCL0xeTXLFBSEORNXABStKIR8cls46mpRZVJaEK+jD4VpWTooJGyxq
	M7fZUrskTT+mn6upjGz1/XLU+NqA9a0a3xkI/nlEVOBBx8URN+Hbqi1td6fMZJOv67OTNgV/vmxgo
	rTiAXZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz94O-000000026Tn-2zFn;
	Wed, 26 Aug 2026 08:33:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz94N-000000026TJ-0iuu
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 08:33:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A77AB41AC2;
	Wed, 26 Aug 2026 08:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C2B1F00A3A;
	Wed, 26 Aug 2026 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787733194;
	bh=dv8cFC9XikMoCLZHrZr3gRKX91068B0YkFD4yX25Jig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=onPz2caqwsW2180hKxPhENUOJ4wYAgbHcUinkmMOHTTV+yUrDQiyR9fY+rdVgiC0+
	 xgfM9tdxW1cdTW1eJzIF7WRYyRk1T9xHsz9xdw86d737pQUFe1GnwPSrS52eq+lqrb
	 J8JHEM8Ek7vmmXSrIsIIrF2p8/1VELq3RCbuqcqRK6dY9ZDCfR3qVEUOS7cMYWYJHV
	 pBeYcP3hTVGXp50Zff0a3L76CDbQoKdcXwE3N+oMT0oEzRERKsYmTw9LDX0Rn3kJHt
	 MIKSmwC57tv6/m4NPYOok/cPmi8fF1AfZWi83kmxI7kSbXQIOkP4whaee7otGZ5CrA
	 6YJqLgEL3UoMg==
Date: Wed, 26 Aug 2026 09:33:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Bruno Banelli <bbanelli@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: enable dwc3 and the SpacemiT K1
 thermal sensor
Message-ID: <20260826-ought-tableware-73678af4dd1f@spud>
References: <20260825052233.66850-1-bbanelli@gmail.com>
 <20260825224905-GKD631715@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260825224905-GKD631715@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============6145565440341619285=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6145565440341619285==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j24adMGA/uAym/Uy"
Content-Disposition: inline

--j24adMGA/uAym/Uy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 10:49:05PM +0000, Yixun Lan wrote:
> Hi Bruno,
>=20
> On 07:22 Tue 25 Aug     , Bruno Banelli wrote:
> > Two blocks on SpacemiT K1 boards are unreachable from a stock defconfig
> > build:
> >=20
> >  - USB_DWC3 is not enabled, so the dwc3 controller that drives all of
> >    the USB 3.0 ports on boards like the Milk-V Jupiter never probes.
> >=20
> >  - SPACEMIT_K1_TSENSOR has no default in its Kconfig and is not listed
> >    here, so a K1 board comes up with no temperature readings at all,
> >    even though k1.dtsi describes five thermal zones.
> >=20
> > Enable both.
> >=20
> The patch itself looks good to me, but since it deal with two diferent dr=
ivers
> So, can you split it into two patches? which easy to review and manage

IMO it's fine being one patch, but this temp sensor should probably be a
module?

>=20
> > Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
> > ---
> >  arch/riscv/configs/defconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 04ae305d5..03d9ac2f7 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -209,6 +209,8 @@ CONFIG_USB=3Dy
> >  CONFIG_USB_OTG=3Dy
> >  CONFIG_USB_XHCI_HCD=3Dy
> >  CONFIG_USB_XHCI_PLATFORM=3Dy
> > +CONFIG_USB_DWC3=3Dy
> > +CONFIG_USB_DWC3_GENERIC_PLAT=3Dy
> >  CONFIG_USB_EHCI_HCD=3Dy
> >  CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> >  CONFIG_USB_OHCI_HCD=3Dy
> > @@ -260,6 +262,7 @@ CONFIG_CLK_SOPHGO_SG2042_PLL=3Dy
> >  CONFIG_CLK_SOPHGO_SG2042_CLKGEN=3Dy
> >  CONFIG_CLK_SOPHGO_SG2042_RPGATE=3Dy
> >  CONFIG_SPACEMIT_K1_CCU=3Dy
> > +CONFIG_SPACEMIT_K1_TSENSOR=3Dy
> >  CONFIG_SPACEMIT_K3_CCU=3Dy
> >  CONFIG_SUN8I_DE2_CCU=3Dm
> >  CONFIG_SUN50I_IOMMU=3Dy
> >=20
> > base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
> > --=20
> > 2.43.0
> >=20
>=20
> --=20
> Yixun Lan (dlan)

--j24adMGA/uAym/Uy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao6kxgAKCRB4tDGHoIJi
0v5VAQDYT8jhm+YKA8FT1Q7h0iuPmAOmrpY0WCsMjmlbUFM3SgD+NRQmA/aRKSzC
oKHb76m702nIoXoRdTDuwGBv8GgNbgE=
=XCwW
-----END PGP SIGNATURE-----

--j24adMGA/uAym/Uy--


--===============6145565440341619285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6145565440341619285==--

