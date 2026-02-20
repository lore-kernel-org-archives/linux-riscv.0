Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51895C5B568
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 22:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfwQDWPUIZnKCT98O0pIzNO6oiz0bwlGMq5J4u6VV0c=; b=cEfo31N7SATkF65P5IwGEomNKF
	Yy9VKdhuidyFpxSQKL3W2vB9D6jt2ZWwdCIrgyRnQtfu0kpQ6/lBh0JBf8tdMg4KkNNp7VZTlKeF7
	bCJvLRSZxtAgM2L1zUZauwORFBv2h1UGyesaJbI/a3Q5FWviMe8lOZnoW5pJCPccnpifJKG7Rud5C
	4rzDfYq55lk8pJJipLZDbSgUfXWsWSqWMMJ0km65jKGOOU5YTgBhX9lUxiqOX5ZvQ3rrJ2hg4lAaa
	ak9DOQH9vvJQ0w+ATfBZIwswtg4TkPCoBpe/hiig5Pu5p40jld74L05t7/w9bW+r/8IhNeyQLIdCy
	RYbORICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtYxc-0000000FehP-2T6U;
	Fri, 20 Feb 2026 22:26:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtYxZ-0000000Fegt-3SCs
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 22:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31BE7445B5;
	Fri, 20 Feb 2026 22:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C14FC19423;
	Fri, 20 Feb 2026 22:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771626413;
	bh=V3OWm83najdWDMMrySIRsb/XPcxnbfexYIsnMcMRUO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQCYEsDdoHIq3L4PuaJ3kgONXH0doh6BMxww+xY2Rsjw01KmxOdddhPxFWbLRhLIp
	 fpqgtQpHnET4LqokAL5+iU67DYcfuJDT3FXtL3Eo5zwAbN0IwwNWRUI6asCsubQvNU
	 6mUQy4I+Fq4uIFLXmmGboFpHvW9rSkOtFa0Cxr+5G8iVCFV5bjZmgQ0y5u7wof+HyY
	 +fFDHRbsYGOsJiVzfE7/7eeK2DWVq6WA9Ju2Wx6/vqw9Om4kq4BkIi2bTJA/CBU1wE
	 kUU7eh9AeKeAzlJvzZoLdicHpwglrVvgLojkcjs1JAAXbMkvDOxTlnzn5kl0nYIzHM
	 DvDhFKm0sEFrg==
Date: Fri, 20 Feb 2026 22:26:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Max Hsu <max.hsu@sifive.com>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Green Wan <green.wan@sifive.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Debbelt <palmer@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dmaengine: sf-pdma: add missing PDMA base offset to
 register calculations
Message-ID: <20260220-embargo-fretful-2db21a5c3c3c@spud>
References: <20260221-pdma-v1-0-838d929c2326@sifive.com>
 <20260221-pdma-v1-1-838d929c2326@sifive.com>
 <aZi_xAe8o1dNTz3t@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <aZi_xAe8o1dNTz3t@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_142653_907215_139B33BA 
X-CRM114-Status: GOOD (  32.77  )
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
Content-Type: multipart/mixed; boundary="===============1026249781384933487=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1026249781384933487==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SIz7zDW2+qG1pVVX"
Content-Disposition: inline


--SIz7zDW2+qG1pVVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 03:10:44PM -0500, Frank Li wrote:
> On Sat, Feb 21, 2026 at 03:43:53AM +0800, Max Hsu wrote:
> > The PDMA control registers start at offset 0x80000 from the PDMA base
> > address, according to the FU540-C000 v1p1 manual [1].
> >
> > The current SF_PDMA_REG_BASE macro is missing this offset:
> >     Current:  pdma->membase + (PDMA_CHAN_OFFSET * ch)
> >     Correct:  pdma->membase + 0x80000 + (PDMA_CHAN_OFFSET * ch)
>=20
> How it work at previous version? suppose it is tested when upstream this
> driver?

Yeah, it's been tested alright. I'm pretty sceptical about this patch
being correct even if it does match the documentation as both mpfs and
the fu540 have dt nodes that look like:
		dma: dma-controller@3000000 {
			compatible =3D "sifive,fu540-c000-pdma", "sifive,pdma0";
			reg =3D <0x0 0x3000000 0x0 0x8000>;
			interrupt-parent =3D <&plic0>;
			interrupts =3D <23>, <24>, <25>, <26>, <27>, <28>, <29>,
				     <30>;
			dma-channels =3D <4>;
			#dma-cells =3D <1>;
		};
and on at least mpfs the pdma works. In fact, adding 0x8_0000 to membase
would lead to accessing outside of the reg region described by the
property.
The docs for PolarFire SoC (that's mpfs) don't mention this 0x80000
offset - see 3.1.10.1 of https://ww1.microchip.com/downloads/aemDocuments/d=
ocuments/FPGA/ProductDocuments/ReferenceManuals/PolarFire_SoC_FPGA_MSS_Tech=
nical_Reference_Manual_VC.pdf

On the fu540 it may actually not work, I don't know as I have never
tried, but that's what the driver was originally written for. Given that
mpfs has the exact same setup I suspect it does work though...

The 0x8_0000 offset is very weird though, why offset like that and what's
in that region? The original documentation for the fu540 also doesn't
have the offset in it: https://pdos.csail.mit.edu/6.828/2025/readings/FU540=
-C000-v1.0.pdf
Why did this get changed? Should we also have changed this in our
documentation for mpfs and there are actually two interfaces for this IP
block, with the higher address being preferred?

Making this change blindly will break existing devicetrees, so it cannot
go in in this form.

If the fu740 requires this, then add a fu740 compatible and make this
offset fu740 specific. If it actually works with the current driver, I
vote for leaving this as-is with a comment explaining how it works.
For the fu540, could you test if the current driver and dts work? If
they don't, then we can consider more invasive changes.

mpfs works (and matches our docs), so I don't think we should make any
changes that affect it unless you can provide me with an explanation for
why the fu540 docs changed etc.

Cheers,
Conor.

>=20
> >
> > Fix by adding PDMA_BASE_OFFSET (0x80000) to the register address
> > calculation.
> >
> > Link: https://www.sifive.com/document-file/freedom-u540-c000-manual [1]
> > Fixes: 6973886ad58e ("dmaengine: sf-pdma: add platform DMA support for =
HiFive Unleashed A00")
> > Signed-off-by: Max Hsu <max.hsu@sifive.com>
> > ---
> >  drivers/dma/sf-pdma/sf-pdma.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdm=
a.h
> > index 215e07183d7e..d33551eb2ee8 100644
> > --- a/drivers/dma/sf-pdma/sf-pdma.h
> > +++ b/drivers/dma/sf-pdma/sf-pdma.h
> > @@ -24,7 +24,7 @@
> >
> >  #define PDMA_MAX_NR_CH					4
> >
> > -#define PDMA_BASE_ADDR					0x3000000
>=20
> This change belong to cleanup, don't mix to fixes into fix patch.
>=20
> > +#define PDMA_BASE_OFFSET				0x80000
> >  #define PDMA_CHAN_OFFSET				0x1000
> >
> >  /* Register Offset */
> > @@ -54,7 +54,7 @@
> >  /* Error Recovery */
> >  #define MAX_RETRY					1
> >
> > -#define SF_PDMA_REG_BASE(ch)	(pdma->membase + (PDMA_CHAN_OFFSET * (ch)=
))
> > +#define SF_PDMA_REG_BASE(ch)	(pdma->membase + PDMA_BASE_OFFSET + (PDMA=
_CHAN_OFFSET * (ch)))
>=20
> why not set membase to pdma->membase + PDMA_BASE_OFFSET directly? are the=
re
> registers between pdma->membase and pdma->membase + PDMA_BASE_OFFSET?
>=20
> Frank
>=20
> >
> >  struct pdma_regs {
> >  	/* read-write regs */
> >
> > --
> > 2.43.0
> >

--SIz7zDW2+qG1pVVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZjfpwAKCRB4tDGHoIJi
0jvHAQCh9xJEloyQ+M/OvhjpKjpXhZ0kah1uvtI2tyiD6+enVwEA0HuwetJ+1Cs6
6tfRZ0V8UH+Iz2B9qASmL3OATkx6FQw=
=C1Jl
-----END PGP SIGNATURE-----

--SIz7zDW2+qG1pVVX--


--===============1026249781384933487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1026249781384933487==--

