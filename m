Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B98ECD992
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 18:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KB4jdUSE80NqeK1vUXEpnmUn7z55N2QIYLGbkRF9C2k=; b=2Dn6MYe0HGw1uj58SJM9BYS3Jj
	CviatqyJe7AcoA0uiMYZsrV7qSQjwewLzhrpKnKkn53d23eZc17TY5SMeg6Rd/DHK4PAb9ruxUxju
	w0EgkB4su4h8VCWTuJM6d4JqHAmYbBHQjk9+Ptjd9GswS+ynXeYJlb1Qfw1xsq/8uHp2Yeo+eKv4t
	G0wzTYvtAxsp+fgEuCkx5a4I3enL5rOnkLsiXXdmTZNIs6M6DwDrcH85I0JVLdUIiB1vKOUpkuAdX
	lVv4TcpYSr1+BjZ9QeHGNboTnGNYV3QwZjT69tpqERyd/+g7JtyjNeeMOylJ1dmcYsmcU3LCI4yJ6
	qcNoDsuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo42D-0000000AMRz-1kLR;
	Thu, 05 Feb 2026 18:24:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo42B-0000000AMRq-4AFm
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 18:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 574DA60010;
	Thu,  5 Feb 2026 18:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4B5C4CEF7;
	Thu,  5 Feb 2026 18:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770315895;
	bh=YZdRm6j/1RjK92bL0k3iE9k5fnW/KimFREVqtvMe0ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2uYPBCcO6b275QVJPFhVdQk1xJY4UZ+W/oDdPgeutXljSp97OgSOFT0T8G0qmWEy
	 aMa1yKdYBFi6Rt8PBsYoHCylvaHJy/Q8AhTcoXnMV9k4/y1X5l2qwsDkCwLmmyfZ3L
	 9fzrEd8MFuenABxvkd4oOarbqE2ZKnm8zXymdXLbxX3LCSd4/zrV+fWVTrB/WmWh3l
	 RyobmoPK6HIb/5C377l6jYNtviWnnqyqY+YD53ovh4nQ5kjDziU7/yte+t2RCCcqpq
	 KmDNM8r1DJ3YLsK1gNybCsyZ+Fr4TTZ9l/DGW7l/8zfm3AzanLoMDS2m/D2ZpmyLNp
	 9hDGa0WxO+ROQ==
Date: Thu, 5 Feb 2026 18:24:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jingyu Li <joey.li@spacemit.com>,
	Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/8] dt-bindings: iommu: Add spacemit/t100 features
Message-ID: <20260205-attitude-customer-129fe2bd5dc7@spud>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <A0E91F323138E92F+a27d73b00f3324f0d3885128f5596230b3f1370b.1770195980.git.lv.zheng@linux.spacemit.com>
 <20260204-primer-wrought-6f64b14bf152@spud>
 <53171BEB06F43599+7c1f54bc-e72d-4cbd-9d10-194ae6b13744@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <53171BEB06F43599+7c1f54bc-e72d-4cbd-9d10-194ae6b13744@linux.spacemit.com>
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
Content-Type: multipart/mixed; boundary="===============0918356626336728227=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0918356626336728227==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ooHQUgLkDlcZ8EA"
Content-Disposition: inline


--7ooHQUgLkDlcZ8EA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2026 at 11:11:51AM +0800, Lv Zheng wrote:
> On 2/5/2026 1:37 AM, Conor Dooley wrote:
> > On Wed, Feb 04, 2026 at 05:09:12PM +0800, Lv Zheng wrote:
> > > Adds device tree bindings for SpacemiT T100 specific features by
> > > introducing spacemit,100 compatible. T100 contains distributed IOATCs,
> > > each of which exposes pmiv interrupt.
> > >=20
> > > Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
> > > Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> > > ---
> > >   .../bindings/iommu/riscv,iommu.yaml           | 37 ++++++++++++++++=
+++
> > >   1 file changed, 37 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml=
 b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> > > index d4838c3b3741..2da3456e7402 100644
> > > --- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> > > @@ -32,6 +32,12 @@ properties:
> > >     # should be specified along with 'reg' property providing MMIO lo=
cation.
> > >     compatible:
> > >       oneOf:
> > > +      - description: SpacemiT distributed IOMMUs
> > > +        items:
> > > +          - enum:
> > > +              - spacemit,t100
> > > +          - const: spacemit,riscv-iommu
> >=20
> > What actually is the t100? Is it an SoC or is it the name of the core
> > complex IP that spacemit is using in multiple SoCs?
>=20
> T100 is the name of the IOMMU IP developed by SpacemiT, announced in RISC=
-V
> 2024 China Summit:
> https://www.bilibili.com/video/BV1DNtCeiEBk/
> It's world first server SPEC IOMMU in RISC-V, supports IOTLB placed in
> adjacent to the DMA masters and supports PCIe ATS and PRI.
> You can find it shipped in the recent publicly purchasable SoC SpacemiT K=
3.

Right, then what you need here is something like:

items:
  - enum:
      - spacemit,k3-iommu
  - spacemit,t100-iommu
  - riscv,iommu

Driver can then match on spacemit,t100-iommu - but you need to have
soc-specific compatibles.
I'm not convinced that riscv,iommu is suitable here though, does the
driver work on your platform without the portions of code that are added
by this series and enabled by your new compatible? If not, the I don't
think the riscv,iommu fallback should be here.

Additionally, please stop sending new versions so frequently and in
response to earlier submissions. I have a v4 in my inbox while we are
still discussing v3.

Cheers,
Conor.

--7ooHQUgLkDlcZ8EA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYTgbgAKCRB4tDGHoIJi
0ssWAPsF5Rd+jQ7R6SGcIrIBk89+5VCaZ95mGoswvO24RrJzZwEAn8dZ/hbPRkc6
Sf2i1ewjvjvVkP1NrBBbi7NlZH383ws=
=DdGy
-----END PGP SIGNATURE-----

--7ooHQUgLkDlcZ8EA--


--===============0918356626336728227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0918356626336728227==--

