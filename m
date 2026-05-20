Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78539CD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVO437ORKifSDShnLHBqIETD4YOpJSJK5SboJoRojw4=; b=ohvSQO1a5Yx59H4+3FwMZYvdCL
	g7flhcrdb3DIZZNiJVjO+BhHLlyPj2vXjUbFqEqh3ejqfgzlevSmMj4SyM7p+0IFuJ79cabTyf0cF
	2DJmCpli2lmYyKxVNm2N8gMk5Rerpz6RCviHOD+tDpgP3gXuNhmS6I/2UFHZJhzQiL0e5z/t9FwDB
	XV5t7+8+jTKo8ot9qGohKU0rx+saj+Fl2rpEV9xrC9DLFQrXFpH4N11Bv6e+UCPYzROUndLsj+qtb
	W32/8mQOUc0/G0bmimLfgCHPZ2zU/+N2Al2Ci0QhpmPAfV35XO9TYkqORkPYzchCKvfxwXWxQtlAV
	W/7lwmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjcE-000000058kB-0LMC;
	Wed, 20 May 2026 16:17:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjcB-000000058je-2xPq
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 16:17:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27A7743D8A;
	Wed, 20 May 2026 16:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BEE1F000E9;
	Wed, 20 May 2026 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293867;
	bh=50nNEwYXko+BmsraW2yGRNKOx6hjeiwEGQR9Xa9Nd+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iUvpkw++CXIDgG39Hc92KF9gYAxLGGJGnbXyRg4pKhWDoC3DfFeRUb3X9LuneUjao
	 FXZ/2WUd3RR/KmWcQxc8Y+LTIHA8pAtaRS8sNpCuAoVMnRAZ2PIlWEazDltWGgR9ud
	 CAu20QC9a2NmorfhH4yxKQV2gvL3jFfA2k4qGJ2sPw6MQSn5vDInLNTOIk1l5OAzbn
	 s9i1VQZUa/kXQfJOIpqrjknzEJQR0W3l4O0Fi5e6s6x/pHCmGJK1w0+vQ2nNu5C0gU
	 f1KthJu7CI80H1N9UL5aaMwgwTJoXyvpifKmMkkxWAC/N+WsmxZeHrdwgJ5B5FApkv
	 AyigbNF5qMKgg==
Date: Wed, 20 May 2026 17:17:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
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
Message-ID: <20260520-frayed-fervor-7c887193ab19@spud>
References: <20260520061855.1623468-4-fustini@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260520061855.1623468-4-fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_091747_788968_991E4C73 
X-CRM114-Status: GOOD (  26.31  )
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
Content-Type: multipart/mixed; boundary="===============4467622072678099092=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4467622072678099092==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NGNLZDzmLzoPMudc"
Content-Disposition: inline


--NGNLZDzmLzoPMudc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 11:16:28PM -0700, Drew Fustini wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
>=20
> Extend the binding to cover details specific to the Tenstorrent RISC-V
> IOMMU. In particular, a second register range is added which contains
> M-privileged registers, e.g., PMAs and PMPs.
>=20
> The RISC-V spec S-privileged registers remain in the first register
> range and are compatible with "riscv,iommu" so the Linux driver does not
> notice any difference, but the binding will be used by OpenSBI and
> potentially other M-mode software.
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Acked-by: Joerg Roedel <joerg.roedel@amd.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> [fustini: fix dt_binding_check errors]
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
> v2 changes:
> - Fix dt_binding_check errors
> - Add the Acked-by: from Joerg
> - Drop RFC prefix
>=20
> Link to v1:
> https://lore.kernel.org/lkml/20260310003850.3837030-1-npiggin@gmail.com/
>=20
>  .../bindings/iommu/riscv,iommu.yaml           | 62 ++++++++++++++++---
>  1 file changed, 55 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/D=
ocumentation/devicetree/bindings/iommu/riscv,iommu.yaml
> index d4838c3b3741..5aad8cf67840 100644
> --- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> @@ -32,22 +32,35 @@ properties:
>    # should be specified along with 'reg' property providing MMIO locatio=
n.
>    compatible:
>      oneOf:
> -      - items:
> +      - description: Platform (non-PCIe) IOMMU implementations
> +        items:
>            - enum:
>                - qemu,riscv-iommu
>            - const: riscv,iommu
> -      - items:
> +      - description: PCIe IOMMU implementations
> +        items:
>            - enum:
>                - pci1efd,edf1
>            - const: riscv,pci-iommu
> +      - description: Tenstorrent IOMMUs implementing "riscv,iommu"
> +        items:
> +          - enum:
> +              - tenstorrent,riscv-iommu
> +          - const: riscv,iommu

You should be able to put this into the enum alongside the qemu
compatible, right?

> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>      description:
> -      For non-PCI devices this represents base address and size of for t=
he
> -      IOMMU memory mapped registers interface.
> -      For PCI IOMMU hardware implementation this should represent an add=
ress
> -      of the IOMMU, as defined in the PCI Bus Binding reference.
> +      For non-PCI devices the first item represents base address and siz=
e of
> +      for the IOMMU memory mapped registers interface.
> +      For PCI IOMMU hardware implementation the first item should repres=
ent
> +      an address of the IOMMU, as defined in the PCI Bus Binding referen=
ce.
> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: machine
> =20
>    '#iommu-cells':
>      const: 1
> @@ -75,6 +88,31 @@ required:
> =20
>  additionalProperties: false
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - tenstorrent,riscv-iommu
> +    then:
> +      properties:
> +        reg:

> +          items:
> +            - description: IOMMU base registers
> +            - description: Tenstorrent IOMMU machine mode registers.

Should this also have minItems: 2?

> +        reg-names:

> +          items:
> +            - const: base
> +            - const: machine
> +              description:
> +                Region containing platform specific MMRs for machine-mode
> +                configuration, such as PMA and PMP registers.

And this you should replace with minItems: 2 or delete. The reg property
is where your description here belongs and all the names do here is
re-list what's available outside the condition.

> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
>  examples:
>    - |+
>      /* Example 1 (IOMMU device with wired interrupts) */
> @@ -145,3 +183,13 @@ examples:
>              };
>          };
>      };
> +
> +  - |+
> +    /* Example 5 (Tenstorrent IOMMU device with MSIs) */
> +    iommu5: iommu@d2020000 {
> +        compatible =3D "tenstorrent,riscv-iommu", "riscv,iommu";
> +        reg =3D <0xd2020000 0x10000 0xaa000000 0x10000>;

This is not the correct format for multiple reg properties. Hint: you're
missing ">, <".

pw-bot: changes-requested

Cheers,
Conor.

> +        reg-names =3D "base", "machine";
> +        msi-parent =3D <&imsics_smode>;
> +        #iommu-cells =3D <1>;
> +    };
> --=20
> 2.43.0
>=20

--NGNLZDzmLzoPMudc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag3epQAKCRB4tDGHoIJi
0kjMAQDoJlJN2dTEH+xMoB8Mnr78NFamKp3i7rYNk1U2RW83OQEA0Id4LMpNIS3S
WT9+SVPfv7/qcHgFS9fmA8jE5nXmkgI=
=qrOu
-----END PGP SIGNATURE-----

--NGNLZDzmLzoPMudc--


--===============4467622072678099092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4467622072678099092==--

