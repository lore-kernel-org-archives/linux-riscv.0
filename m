Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D71606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TmuDM+qG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NCv5OLM5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QgHiF4PFf2p44iUyPUynVYI4Olah7vQyLIy79f+RPFE=; b=TmuDM+qGmEtgNzTyQvYnfgkmz0
	4oad1BZnQ3J/VidNl4IHpCNtdohXpmdt/ThZHagxEfpVZu9U4CUaEhsnRZPvQJGR8lX8XRo1WzIiA
	MI0tM0V96+f2CI+IvNX1ctppbBo/ImoDp5Mf8S8pDhYIOMjmkbSYVIS3rQBihFmfFr2wH5uEiT/iq
	PT/7Fbep/bM5Oa555DFRHACYkGVCGO85fZ527K951riPc/7j+t8iGd3uUJT3ifNtsRxduc4DvtJ6a
	+I2xj++IKkR1VfoX+EKxQmJvEcQ2iHJy0KZNGP3OFYgt4VjqAwhMovp2aB1uoECh+v+e1jfF1g9V4
	M2K9kgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRHL-0000000DfRO-26nK;
	Fri, 06 Nov 2026 21:15:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRHK-0000000DfRH-0Uyb
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 21:15:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01A17601E1;
	Fri,  6 Nov 2026 21:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374AE1F008A2;
	Fri,  6 Nov 2026 21:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793999716;
	bh=cDsr5kKiBdFRv3e9B3EpFq9dfSXD/V/9SF4tGqKbj4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NCv5OLM5WaIcpbmKIbDVp6HIAX/E1r/JtzFAqfxFUN1TJlPaaSUDTFIbCQNu0hLwQ
	 E6UhgGHqLb7ULhd0Mb42PUVDpzMeZu56rJb8Qp2kYqLlUYva6WtX/5GPnupLk09vFP
	 Seac2uQW4fwwgblBpzGqFfMFKnBMf7XFgjyPmXrVwsZyx1CZiyJ/O9xUtwO4naNSa+
	 YahfVbCUkMoOXvxo4VPAnNi2Ljy7eJcTriX6knzPCXaQ9TutCmjb7TEH9h0Bwtvx48
	 jcFuMD3RGnXQnSL5zDkPCblDgxQwvwjyXGSvFRzHQ2C7KR6JPgg44+WUBW/4Fp6Av9
	 BO6BXYy1HgqkQ==
Date: Fri, 6 Nov 2026 21:15:12 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Owen O'Hehir <oo.hehir@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
Message-ID: <20261106-tumble-hurt-d1a0be3fddae@spud>
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
 <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
 <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1364040479975949182=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1364040479975949182==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uxj3Bu3KA+9of06z"
Content-Disposition: inline

--uxj3Bu3KA+9of06z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 11:06:22AM -0800, E Shattow wrote:
> Hi Conor,
>=20
> On 11/6/26 10:54, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > On Fri, 06 Nov 2026 18:40:55 +0000, Owen O'Hehir wrote:
> >> The firmware turns the status power LED on, but the node has no
> >> default-state, so the LED switches off when leds-gpio probes and the
> >> board looks powered down.
> >>
> >> Default the LED to on.
> >>
> >> Tested on a VisionFive 2 v1.3B.
> >>
> >> [...]
> >=20
> > Applied to riscv-dt-fixes, thanks!
> >=20
> > [1/1] riscv: dts: starfive: jh7110-common: keep the status power LED on
> >       https://git.kernel.org/conor/c/68dbe2550bd4
> >=20
> > Thanks,
> > Conor.
>=20
> I replied this a moment earlier:
> https://lore.kernel.org/lkml/179fe9e8-322b-4745-8734-d5de5f1e8487@freeshe=
ll.de/
>=20
> This disagrees with VisionFive 2 Lite schematic; if when this node is
> consumed by a bootloader it will be evident we are not describing the
> hardware correctly, no?

I am not sure if that's actually relevant though? If the visionfive2lite
needs this gpio then it shouldn't be listed in a leds node. Changing the
default status of it doesn't affect the fact that it is wrong to begin
with, wrong before the patch and wrong afterwards. If there are some
boards that include this common.dtsi but don't have these leds, they're
not common and should be moved to the relevant dts files. If you know
what those are, please send a patch doing the move.

> If you want the light on and it wasn't on at reset or due to boot ROM,
> then that is userland stuff and not hardware description... but that is
> your decision to make as maintainer.

It's a power status led, I think it's pretty reasonable for it to
actually represent power status without intervention in userspace, the
alternative I guess could be something like setting the function
property to "power" - but I'm not sure if that does anything for
gpio-leds.

Cheers,
Conor.

--uxj3Bu3KA+9of06z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau5DYAAKCRB4tDGHoIJi
0nrFAQDR7pn5SeJlvMs2Unksnuskzogpm5QCuq1mwU5NbmpKOAD/YTa+FWIjGV6W
9G8YF1A1U6fNmtjrNz9b9so+HUo+ZQs=
=IGxj
-----END PGP SIGNATURE-----

--uxj3Bu3KA+9of06z--


--===============1364040479975949182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1364040479975949182==--

