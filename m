Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5527BC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 20:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CsXcm1+jKdf33/y7mcmJMDsVTi+ZDOWakIwdavS9pg=; b=c4NBPZoT+T5k45YEpDez5Myw5l
	qxDRc0NdKUTJMdVnqrJbRhBEI4mwkaKQgoFQj3B7AFlOhQxId1xFaPFZ7xepIpCcWc+QtF7W3eCP5
	pOhUyK9QceIpNAdnEByg5/vO3se4H630u/X4tzGAyGNAbllaqNuoJt0siUv78I8BRbFSNaxnuFqnZ
	l3EgXthOiftLwEdzezmNYqnMNSSob23i4l8UyuyJYzYR39H+aYvZx+AYgZBbji3E78Ih96Y6aABhO
	gXckGYCWBJFqXBftgewHVIxHHdDUCwKQ5Spy/g4o/7M/uIl39TG9gz8C4M4jd7Cy0PfHbaVxnYHti
	+RxSWNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6OX-0000000BMRJ-3NdN;
	Wed, 03 Jul 2024 20:16:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6OU-0000000BMQq-1u7c
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 20:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A081F611EA;
	Wed,  3 Jul 2024 20:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8E1C2BD10;
	Wed,  3 Jul 2024 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720037757;
	bh=wB7MoQu//qv+xJk/FI67UFN2r4uKsUWY/KAx4c2q1gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oci8Ge9MNhyBmeV5PHFXlsz9MFWsPEgcBPpaX0Vp4raDuEdk7FPsXoYPbWMzNRnxk
	 3aG6oXOj0SsJBJHkpPyLPLMIOsyoCWWvwOr8JS2gv7njQtTYuJPd8ZxkGEJ5j8cohn
	 FUb6R4CJ/spTC/X1GFPZVaomsMvwZ51jgctPDrmeNJsZiuCdkXZjW7wITdLclATrAU
	 I/wpHqk5Ue3Xj7hJeTQHniNbiel78cMmC4r4g4TC7vUGRW9pUBjwFJJPsvdE9pTpRc
	 NYd4fjAaNKfv2Okv8gbsp/+zL2gaBhYVVpSPFU/gvtD+AFbPu2P6kl7ce501S3oqJ5
	 wCpu/5TJJTZ+A==
Date: Wed, 3 Jul 2024 21:15:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	daire.mcnamara@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
	samuel.holland@sifive.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/5] PolarFire SoC Icicle Reference Design PCIe
 ?support?/fixes
Message-ID: <20240703-girdle-grandly-c6495236fa72@spud>
References: <20240610-vertical-frugally-a92a55427dd9@wendy>
 <mhng-011d3bea-b607-4df2-a65c-7b08547cb85e@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-011d3bea-b607-4df2-a65c-7b08547cb85e@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_131558_649739_824E6A12 
X-CRM114-Status: GOOD (  23.64  )
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
Content-Type: multipart/mixed; boundary="===============0657457157557869762=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0657457157557869762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yJhMjtvuKG7f7QmN"
Content-Disposition: inline


--yJhMjtvuKG7f7QmN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 01:09:43PM -0700, Palmer Dabbelt wrote:
> On Mon, 10 Jun 2024 04:09:12 PDT (-0700), Conor Dooley wrote:
> > Hey all,
> >=20
> > Here's some patches that add an Erratum to enable non-coherent DMA
> > support for PolarFire SoC. By nature of being an FPGA, and due to the
> > PCIe root ports being only 32-bit capable, many bitstreams configure the
> > FPGA fabric such that peripherals in the fabric become non-coherent. The
> > PCIe root ports on PolarFire SoC are connected to the core-complex via
> > the fabric, and therefore can be (and regularly are) made DMA
> > non-coherent. The Icicle Kit Reference Design has been configuring the
> > PCIe root port in this manner since late 2022 and in a way unsupported
> > by mainline since earlier that year. Adding this non-coherent DMA
> > support makes PCIe functional on those FPGA designs. Daire did almost a=
ll
> > the work to figure out how to support these kinds of designs, and this
> > series depends on his patches to introduce the required dma-ranges
> > handling for the root port driver:
> > https://lore.kernel.org/linux-pci/20240531085333.2501399-1-daire.mcnama=
ra@microchip.com/
> >=20
> > The final patch depends on:
> > https://lore.kernel.org/linux-pci/20240527-slather-backfire-db4605ae7cd=
7@wendy/
> >=20
> > I'm not sure if an Erratum is really the right way to go about doing
> > this, but I didn't want to make ARCH_MICROCHIP depend on NONPORTABLE.
> > An alternative would be to add a menu under drivers/soc like Renesas
> > does and allow it to be toggled as an option there instead.
>=20
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> if you want to take this via some other tree.

Yeah, I was expecting to take it myself but hadn't gone fishing for an
ack because the PCI parts haven't landed yet & the copy in my k.org tree
had a KISMET issue reported against it.

> I don't see any issue calling it an erratum, if it lets us keep building
> generic kernels for these systems that seems like a good enough agrument =
to
> me.

Cool :)

--yJhMjtvuKG7f7QmN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoWxeQAKCRB4tDGHoIJi
0ikwAQDPD7tPHabjXO33KB571jCDfKRn/zrUHBQfWC9TTVNVxwEA6etKueKoiNYY
+NDyz6R/QSOy5MbuSNYS+s4oQlR0SgY=
=Insq
-----END PGP SIGNATURE-----

--yJhMjtvuKG7f7QmN--


--===============0657457157557869762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0657457157557869762==--

