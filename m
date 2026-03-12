Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F2B106ACCD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 17:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+HQKvPrwQSUDmOgA4yDN502so0MbgN8iZWoxo6Ny6E=; b=cfD0TRAv/U0ZI4ogr9yh2PZWnT
	v4mfjAzyqt+MMLMvA4fJAvuoWCSv/tWIgzKTL7G4iLhTs9+A3KiJfh3IAiPlFMLeDoSfz+bfwiB29
	QkHtwGghN9VD0a2h4Ze08ct4mZ+qCZFWqVaEVZIIlFxmWgDgUmxgm5FYOP3/dLpndwocTI7QWiFst
	YM8aYQ0Hddu4SgN57/3jguB9pkjfA59iZGydfEVHHahSq9XuHjIiVh5seP2EU6ULkX3JCFp4Owaf2
	9jgiiKkmnNndtyxXpQnwGRunD01Nqt707sKQ26+8uuJXm6FR7j4Di3IU8H6S+h73jolLQO91ob0C0
	NWavsFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0js7-0000000EivI-3ptV;
	Thu, 12 Mar 2026 17:30:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0js5-0000000EiuW-3c75
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 17:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 477D44348C;
	Thu, 12 Mar 2026 17:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05248C19424;
	Thu, 12 Mar 2026 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336651;
	bh=W6tGZ3NCS57fycGB4Z6FjTao9Hr+IRejW/1XW8Q2EbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9KRHsRiqVMm1UsQicox1Kr9qVSuXsJ98bMYR51K/SnUhXS1yx0aTqGt4Nm6p6XD4
	 jRsZfPwgNxkSy1hFZEp9kv3Z9rNst9vugRPBg7pVI1nhuiGFHj67PxTHHnR8TBH2et
	 JWZmBtLsGZhq53JfLKB5Js7T6bgp1OZlRmloKHrd207TrQq075Q+h/H/FHVjpl697C
	 tsFPToxalvLUwM9gHDjtJ+bNoBj9ItAqDLNANw9GHpXSAH3PhAgxA2Xvd6JXe7U+fm
	 IPum2fqKPaEib0tDzoI6TUFDKzGfWmOwnNJKR0GWUIj2baKBy7uGWCWO0xvtzi/KXs
	 DCHoa+oZnEOxw==
Date: Thu, 12 Mar 2026 17:30:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
Message-ID: <20260312-legume-unstitch-129b278e14d6@spud>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
 <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>
 <20260312112858-GKH302167@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260312112858-GKH302167@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_103054_522202_95EC6474 
X-CRM114-Status: GOOD (  24.84  )
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
Content-Type: multipart/mixed; boundary="===============4894150250953331253=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4894150250953331253==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Ay2qMKpijP+JeF+"
Content-Disposition: inline


--7Ay2qMKpijP+JeF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 07:28:58PM +0800, Yixun Lan wrote:
> Hi Philipp,
>=20
> On 12:09 Thu 12 Mar     , Philipp Zabel wrote:
> > On Do, 2026-03-12 at 10:34 +0000, Yixun Lan wrote:
> > > Instead of grouping several different reset lines into one composite
> > > reset, decouple them to individual ones which make it more aligned
> > > with underlying hardware.
> > >
> > > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, V=
CC,
> > > PHY. The PCIe controller also has three reset lines - DBI, Slave, Mas=
ter.
> > >=20
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > ---
> > >  include/dt-bindings/reset/spacemit,k3-resets.h | 42 ++++++++++++++++=
++++------
> > >  1 file changed, 32 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include=
/dt-bindings/reset/spacemit,k3-resets.h
> > > index 79ac1c22b7b5..c12f8bd32047 100644
> > > --- a/include/dt-bindings/reset/spacemit,k3-resets.h
> > > +++ b/include/dt-bindings/reset/spacemit,k3-resets.h
> > > @@ -97,11 +97,7 @@
> > >  #define RESET_APMU_SDH0          13
> > >  #define RESET_APMU_SDH1          14
> > >  #define RESET_APMU_SDH2          15
> > > -#define RESET_APMU_USB2          16
> > > -#define RESET_APMU_USB3_PORTA    17
> > > -#define RESET_APMU_USB3_PORTB    18
> > > -#define RESET_APMU_USB3_PORTC    19
> > > -#define RESET_APMU_USB3_PORTD    20
> >=20
> > This is backwards incompatible.
> > Are there any device trees using the APMU resets yet?
> > If not, I wonder if we should just renumber all APMU resets into a
> > contiguous range and try to get it into v7.0 as a fix.
> >=20
> No, there is currently no consumers, so I could rework them into a contig=
uous
> version, thanks for the suggestion

Only as long as it goes into 7.0, IMO, as a fix.

> > Also, this breaks bisectability.
> > reset-spacemit-k3.c will fail to compile between patches 1 and 2.
> >=20
> I've tried a first version to squash the two patches, but got a checkpatc=
h.pl complait
> for binding should follow into a separate patch.
>=20
> I can combine these two patches into one, is this Ok for you?

Be very very very clear about why they're going together, otherwise you'll
get yelled at!

--7Ay2qMKpijP+JeF+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL4RgAKCRB4tDGHoIJi
0lFCAQC8R0krTCJ3h8LENWd4AYu7AGIS+9Kr+nwqeEhqxLlJ6gEA9efqzwnlJkD2
xl++M7pPu/XyyZgMduLa1mwL6FPpUgs=
=uTkh
-----END PGP SIGNATURE-----

--7Ay2qMKpijP+JeF+--


--===============4894150250953331253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4894150250953331253==--

