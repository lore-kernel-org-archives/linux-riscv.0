Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717641099B2D
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 17:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y42nKjaJSCI/uefpeCkzRVwqPVDM67W1wloCvEkES+8=; b=3b7axBM2nZbusqsCUYDzE9Pn++
	WDDfWbea7PjbIVkbaWEPfOcMEpZz7zDT/ru9mMKrZFj9NRlNriKgzW/vbcWdzitQLnNWxR55BM2NU
	PegTMzEnvS6ui+Jjv1uIK4K2+XyO3QxP9khaSPLxsrDPWYHZdpaDmCyeYLFa9FuJZlregY3vIZ6KE
	bX+osGH75F3ZwoI71epJ07CN1c08GIrPW+o7+oJtraxsPor8pUgsw1Aatm/z9aguH6Cl7Y10NY9VU
	stbF/ajG0HPd1aqwuIqig4O9yAByOCmd4GwYCgZTGoFRZ/XW1O+1CucT5h4stLFvkCoiDLnXhAOzJ
	/uVAWCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e5w-0000000DKjZ-2h6u;
	Fri, 20 Mar 2026 17:57:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e5v-0000000DKjT-0dtR
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 17:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28EAA60126;
	Fri, 20 Mar 2026 17:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BF8C4CEF7;
	Fri, 20 Mar 2026 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774029429;
	bh=8glEvNnreBwR1w2oGJ8ufIdnmrUmRY35kJIHcmNZ0RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TxPSODsGNorclc3tsg+OMczBTjPIbL0qdr0uUYVvgH4uGPxMgi0WpgOtPvboOW6Pb
	 yt+QmKPoAITQQLJ0fkMUHOSmdJhU3Nj3XdIzHepscWJrC0nqiT5RFBgBFJeBQeBV6R
	 07BPHLjUjXIcJFjJ7fjjKgXUjEKu8lD8GhPgj6bxZm/OfbhTmVmkgznZNUuPZgAYwE
	 15HYrJBvZcfpSRyLLJx0X9mUM2gYuGPtc/RafwF5PGusO2/RwAtu8DYqS7wBZbpYyW
	 ysuR0LIffpGD5DGpo9PnVGRWTZ+jqOh7AQnxaX5LdhqWv0F4m98XblMi7dddu88xoU
	 DbUymsQ50Ob2Q==
Date: Fri, 20 Mar 2026 17:57:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] reset: spacemit: k3: Decouple composite reset lines
Message-ID: <20260320-starlit-isolation-40c3c80e77a4@spud>
References: <20260320-01-k3-reset-usb-pci-v5-1-07f4a5ddd728@kernel.org>
 <272ed19e2c0d8c9f53b6e621c01dc09f0635bf9d.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <272ed19e2c0d8c9f53b6e621c01dc09f0635bf9d.camel@pengutronix.de>
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
Content-Type: multipart/mixed; boundary="===============2379347718328782147=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2379347718328782147==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hP8vo3n1R88/WzCL"
Content-Disposition: inline


--hP8vo3n1R88/WzCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 01:02:04PM +0100, Philipp Zabel wrote:
> On Fr, 2026-03-20 at 11:06 +0000, Yixun Lan wrote:
> > Instead of grouping several different reset lines into one composite
> > reset, decouple them to individual ones which make it more aligned
> > with underlying hardware. And for DWC USB driver, it will match well
> > with the number of the reset property in the DT bindings.
> >=20
> > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > PHY. The PCIe controller also has three reset lines - DBI, Slave, Maste=
r.
> > Also three reset lines each for UCIE and RCPU block.
>=20
> Although I can't validate correctness of the id-to-bit assignments, the
> changes look consistent.
>=20
> I trust that the reason for the grouped reset lines was just
> convenience, and not some hardware limitation that requires them to be
> controlled at the same time.
>=20
> There are no patches using the USB/UCIE/RCPU/PCIE resets found on lore,
> so this is not an ABI break.
>=20

Eh, I think it's an ABI break either way, but it is being done fast
enough that there's no users since this is new as of -rc1.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Just be careful Yixun that U-Boot doesn't import and starting using it,
I forget if they use -rc1 or released kernels as their import point.

pw-bot: not-applicable

Cheers,
Conor.

> > As an agreement with maintainer, the reset IDs has been rearranged as
> > contiguous number but keep most part unchanged to avoid break patches
> > which already sent to mailing list. The changes of DT binding header fi=
le
> > and reset driver are merged together as one single commit to avoid
> > git-bisect breakage.
> >=20
> > Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver")
> > Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support =
and IDs")
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> If there are no objections, I'll pick this up into reset/fixes for
> v7.0-rc6.
>=20
> regards
> Philipp

--hP8vo3n1R88/WzCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCab2KcQAKCRB4tDGHoIJi
0n4FAQCnnReUmA8clg/MCzX+jyZCk7NbP4dF2JecIAuY7go4WgEAy9VobUGZbInL
sYap5dRIMkC5Q4cA1ppov9UzFaiY5A4=
=oCVp
-----END PGP SIGNATURE-----

--hP8vo3n1R88/WzCL--


--===============2379347718328782147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2379347718328782147==--

