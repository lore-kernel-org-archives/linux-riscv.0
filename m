Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEDACD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLk+fqkA0o/F7jhZjY0IbNmnjHzsyKmJiCehijPhGxE=; b=yhozkaAMiHLQQ7xOGiB1hesvi9
	vg3tymm0ynTHwNu3It4rh9I7+yoNRzMSzNriGXrw2jo1Icd3tgLC5/ZpMFG+ZcMkEMdw2XU1jBlz0
	1NtpdgnZ28Yppt5T+A2TDnCKA3fCTAmxJ60ZZfo0i9GLqhqjNHm07whSJl628CXtjPjaWguZlLjrv
	+Ei6RKaa7UDLCQlVqtDkGoj/J7D1bdzFAhLg/UsBZE02lb7dM9apuqNq2K0147Dztt6OMdr4fN8yF
	LGbewx3qGssvvENWwwx9VWXFa/ZNHRw7a2kZ9afM0L3Q849cY1pcbiBBwaTY4h7YvI2vK0QAtt69s
	z4AuvBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2XS-00000006KGL-3FqV;
	Tue, 09 Jun 2026 19:55:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2XR-00000006KGC-17CA
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 19:55:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DCE744440C;
	Tue,  9 Jun 2026 19:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1541F00893;
	Tue,  9 Jun 2026 19:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781034904;
	bh=euZno7GZr+Jmg5WizSgIMbhpNKl9ApCStT4sFxS+cFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mrqlhrls3LdqaIVU1g64Wu2SiYFz2mLopQXvHtAsrgcg3Pc89rmXeHrO3vqEWV3YI
	 03K6M+reJZaQZ/WPOOu4i9P2dZYGPrl3L9vpQMZioWuUe3tzh86bBDnBDpUmYwsBWK
	 XjfmM0s6F7eKxLySUq8CJ+33N5wSu0d8sCEVb5RUaTHZbxeItD7Lz3IugeVwHSf6po
	 kyBprH79O6I/lEjWZs2t1G/AzfBW5qWnruqgHHqFPkqqaYq7UlMH4GiKVppqiyzM6n
	 pcB+TPZUZBkGM63FTH56XNFiIAcjeZXwyVeMW53Jt4M0sMoxRNO0Pz1CUEXiIMTNSW
	 Czw9Sse+q86ow==
Date: Tue, 9 Jun 2026 20:54:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: Add SpacemiT K1 PDMA request
 numbers
Message-ID: <20260609-freeload-luckiness-7a143eae62f4@spud>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
 <20260607-b4-k1-pdma-req-macros-v1-1-5b2a3955007c@gmail.com>
 <20260608-dazzling-hacksaw-dbe84766ec76@spud>
 <qxcpvj3eseclgonwuwx2szn2tj4uxci27mvpqwotj6uaiyj65p@7sx5tyzbfs2g>
MIME-Version: 1.0
In-Reply-To: <qxcpvj3eseclgonwuwx2szn2tj4uxci27mvpqwotj6uaiyj65p@7sx5tyzbfs2g>
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
Content-Type: multipart/mixed; boundary="===============6726213727268656439=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6726213727268656439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ss8ao6rj68qSdhm9"
Content-Disposition: inline


--Ss8ao6rj68qSdhm9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 02:55:59PM -0400, Guodong Xu wrote:
> Hi, Conor
>=20
> On 2026-06-08 18:33, Conor Dooley wrote:
> > On Sun, Jun 07, 2026 at 01:41:30PM -0400, Guodong Xu wrote:
> > > Add a dt-bindings header that gives symbolic names to the SpacemiT K1
> > > PDMA request lines of the non-secure peripherals. Device trees can use
> > > these K1_PDMA_* macros instead of magic numbers.
> > >=20
> > > Point the spacemit,k1-pdma binding's #dma-cells description at the new
> > > header.
> > >=20
> > > Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> > > ---
> > >  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
> > >  include/dt-bindings/dma/spacemit,k1-pdma.h         | 56 ++++++++++++=
++++++++++
> > >  2 files changed, 59 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.y=
aml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
> > > index ec06235baf5ca..0d4ac9849e27b 100644
> > > --- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
> > > +++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
> > > @@ -35,7 +35,9 @@ properties:
> > >    '#dma-cells':
> > >      const: 1
> > >      description:
> > > -      The DMA request number for the peripheral device.
> > > +      The single cell is the DMA request number for the peripheral d=
evice.
> > > +      See <dt-bindings/dma/spacemit,k1-pdma.h> for the list of valid=
 request
> > > +      numbers.
> > >=20
> > >  required:
> > >    - compatible
> > > diff --git a/include/dt-bindings/dma/spacemit,k1-pdma.h b/include/dt-=
bindings/dma/spacemit,k1-pdma.h
> >=20
> > Why does this need to be in a binding when there is no use of this in
> > the driver? May as well be a header, particularly if these are numbers
>=20
> Thanks for the review. You are correct that these are not referenced in t=
he
> driver. My change to k1-pdma.yaml should be dropped.
>=20
> > with a set meaning that are lifted from the TRM, rather than made up
> > numbers to make a driver work. The former seems likely, given you're
> > indexing from 3 not 0.
>=20
> Yes, it is defined in the K1 manual [1], see 9.4.3 DMA Connectivity &
> Assignments
>=20
> Link: https://www.spacemit.com/community/document/info?lang=3Den&nodepath=
=3Dhardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]
>=20
> I will fix that in v2.

Just in case I wasn't clear (and I think I wasn't), when I said "may as
well be a header" I meant a header in arch/riscv/boot/dts/spacemit.

--Ss8ao6rj68qSdhm9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaihvkwAKCRB4tDGHoIJi
0quDAP9NVs88iuV9CNHJrkUTyg0JS0+g4jZfML658Gh5VCV4AQD9HAvgmQaWFy28
V+fx0E0a2bXDRTY3o0eZOk3dv/55WQg=
=3h5W
-----END PGP SIGNATURE-----

--Ss8ao6rj68qSdhm9--


--===============6726213727268656439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6726213727268656439==--

