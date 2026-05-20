Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3841ACD5BA4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 18:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBrpfitvKD9z1wxLV4IgHghYwn8niFpP+vm0+eUmGwQ=; b=DZAH2oABkRBdyaR1KZLFn60S4l
	l3g1f02fIvbcVFquYWJd/0LkKTJDCzKmKQSwdkE1zxF6ENqlNc5RCirVB6R5gUv+fdoKRJ9gadefv
	H1w49noyu9mqrcI7/Mrx2M9TQUgl4tSkOary/8UI3+AZT3EaGx9JVoQYe9APvJOMwAselxhV9oiks
	SNgGCyhpi3mvfr2AIT1rKcounWKSjJcHPuaLUqEOIAc6osx1hspPQy48962SWrQJhdGLIeWa5+JWJ
	aGEEW2XhE/aY5RjXYWxHiq0LYLbA5W6UvXbh8J3O/VbXFzTzlhfhl65Lb5xcZb9o8AUlKZBRPeFPA
	a234a3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlRD-00000005PLL-45L4;
	Wed, 20 May 2026 18:14:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlRC-00000005PKk-3SQu
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 18:14:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E97D060145;
	Wed, 20 May 2026 18:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D051F000E9;
	Wed, 20 May 2026 18:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779300873;
	bh=BGBszge9vQulelJ4juObSE+D6PPOGDG420pjFZMqYjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q4SI655JpsOeDedSSlGyk1TnKl4jp5wgVqnYn+Am9tukdG1cWsV6wErApbFCWzsCt
	 +KaZ7b5TKTaSADkUydBu7Wuy+LR/p5kGWD2PZUicgKqCnCmyxgHVGfswvFjGS4zn3I
	 qTBXYnafMw4J4eg73pr2eFS0dJSaHnWpS9CjKppvhMgZIXFM8c4zw7jjBLs/i81Wt+
	 eCZqMQfWxVygUtMprU8iujT9wL9kiqve0enOEtSEiABfQ4ceH3f1TdJ5OHNVf76lWz
	 d28l3xzlNr+pcrD3Ky2stPnHFlwmVrMoOBDhc0gVB9ih+UENCA3zi+CN5imNuhz2ru
	 5Iy+cTgwsZ5dQ==
Date: Wed, 20 May 2026 11:14:32 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, Joerg Roedel <joerg.roedel@amd.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <ag36CHVAERc3ZYmi@x1>
References: <20260520061855.1623468-4-fustini@kernel.org>
 <20260520-frayed-fervor-7c887193ab19@spud>
MIME-Version: 1.0
In-Reply-To: <20260520-frayed-fervor-7c887193ab19@spud>
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
Content-Type: multipart/mixed; boundary="===============0241855147479353753=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0241855147479353753==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/FRbjWFmhZcRL80s"
Content-Disposition: inline


--/FRbjWFmhZcRL80s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 05:17:41PM +0100, Conor Dooley wrote:

Thanks for the review...

> On Tue, May 19, 2026 at 11:16:28PM -0700, Drew Fustini wrote:
> > From: Nicholas Piggin <npiggin@gmail.com>
> >=20
> > Extend the binding to cover details specific to the Tenstorrent RISC-V
> > IOMMU. In particular, a second register range is added which contains
> > M-privileged registers, e.g., PMAs and PMPs.
> >=20
> > The RISC-V spec S-privileged registers remain in the first register
> > range and are compatible with "riscv,iommu" so the Linux driver does not
> > notice any difference, but the binding will be used by OpenSBI and
> > potentially other M-mode software.
> >=20
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > Acked-by: Joerg Roedel <joerg.roedel@amd.com>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > [fustini: fix dt_binding_check errors]
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > ---
> > v2 changes:
> > - Fix dt_binding_check errors
> > - Add the Acked-by: from Joerg
> > - Drop RFC prefix
> >=20
> > Link to v1:
> > https://lore.kernel.org/lkml/20260310003850.3837030-1-npiggin@gmail.com/
> >=20
> >  .../bindings/iommu/riscv,iommu.yaml           | 62 ++++++++++++++++---
> >  1 file changed, 55 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b=
/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> > index d4838c3b3741..5aad8cf67840 100644
> > --- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> > @@ -32,22 +32,35 @@ properties:
> >    # should be specified along with 'reg' property providing MMIO locat=
ion.
> >    compatible:
> >      oneOf:
> > -      - items:
> > +      - description: Platform (non-PCIe) IOMMU implementations
> > +        items:
> >            - enum:
> >                - qemu,riscv-iommu
> >            - const: riscv,iommu
> > -      - items:
> > +      - description: PCIe IOMMU implementations
> > +        items:
> >            - enum:
> >                - pci1efd,edf1
> >            - const: riscv,pci-iommu
> > +      - description: Tenstorrent IOMMUs implementing "riscv,iommu"
> > +        items:
> > +          - enum:
> > +              - tenstorrent,riscv-iommu
> > +          - const: riscv,iommu
>=20
> You should be able to put this into the enum alongside the qemu
> compatible, right?

Good point, I'll move tenstorrent,riscv-iommu to the enum with
qemu,riscv-iommu.

> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - tenstorrent,riscv-iommu
> > +    then:
> > +      properties:
> > +        reg:
>=20
> > +          items:
> > +            - description: IOMMU base registers
> > +            - description: Tenstorrent IOMMU machine mode registers.
>=20
> Should this also have minItems: 2?

I think items: with 2 items implies minItems: 2 but I see your later
point about the description and names don't belong in the allOf: block.

>=20
> > +        reg-names:
>=20
> > +          items:
> > +            - const: base
> > +            - const: machine
> > +              description:
> > +                Region containing platform specific MMRs for machine-m=
ode
> > +                configuration, such as PMA and PMP registers.
>=20
> And this you should replace with minItems: 2 or delete. The reg property
> is where your description here belongs and all the names do here is
> re-list what's available outside the condition.

Ah, so I just have minItems: 2 here and rely on the reg: section to have
the descriptions.

> > +  - |+
> > +    /* Example 5 (Tenstorrent IOMMU device with MSIs) */
> > +    iommu5: iommu@d2020000 {
> > +        compatible =3D "tenstorrent,riscv-iommu", "riscv,iommu";
> > +        reg =3D <0xd2020000 0x10000 0xaa000000 0x10000>;
>=20
> This is not the correct format for multiple reg properties. Hint: you're
> missing ">, <".

Thanks, I'll fix that.

-Drew

--/FRbjWFmhZcRL80s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCag36AAAKCRDb7CzD2Six
DAbHAQDI8harIo/I9V4a7tM1mvAiTRjwsbfDx9qcEXfqctGFxQEAqNTzD7k59K0s
62Yzl0w6qzRZRPFcwzTyMIchGmGu0wI=
=T+gz
-----END PGP SIGNATURE-----

--/FRbjWFmhZcRL80s--


--===============0241855147479353753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0241855147479353753==--

