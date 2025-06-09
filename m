Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50197C61CE8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae5ipZPwMkrfiXUHvylbRSDLt+EVR69nVvB99CumXVo=; b=nWVugpFEbwqDotq3K87d2DUBDJ
	W96WyfO+gwciz9Mpe8fKuuslr5SsPe3Ja01yxbHDx4YDrNTTl556vueeEqISvf6u3d/cA0OEILeYD
	NteHpu7p2AyT0FhcvG2PZ6O9yOxUW6tLi2zy1kqLkEWSEYkp32H1xpVz2D0JXkrkc2ZENSdWlJerp
	hqS/0Cet8NhTmFeuL7Xq4xdUaBtYp4s+Mq54zwEe1pWaMa0xToakBhCXKbircCEH3wajnnum3QXrG
	+Lv3KejHKreczdiveplvnoMGrPNP9ABjtsrM1fetitcasSEkLcw5SeQWwjPWY4Mn+i3S+K5fSTgwe
	KcNlbYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfRG-00000004gPC-3Okl;
	Mon, 09 Jun 2025 16:33:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOevt-00000004bBn-2FM5
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 16:01:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC4F644F2A;
	Mon,  9 Jun 2025 16:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215E7C4CEEF;
	Mon,  9 Jun 2025 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749484868;
	bh=4UANBXEFzzWNDjzkZyhCusk/3Ln3IBad0owyMaZA9s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BwLoh8juJpB1j2JIPMu6yve9smAo41URpJXx8TMaktX+DpqaR3bMltvW/NELsNxaq
	 /mOBn3syLkiglEqEFPXGQMRzsZ/M06DsQHc8b9Ui2VopZpmtcZ17jIccv0bkmr3khZ
	 0Uye/8ScstG1DK4cE4r6vXnzrRRdBsxpcSJB9JFtk8LdTjBHfNw+qjEkkkTP9gk4ww
	 23hgllO3bCkLvr5N5rIDf3HC3kKju/R9jmEydgiKNdGuhd0jSDCSSZ4k1Ucb751j2t
	 XXBHgain3C8Z+mHZHr5kZcQomNJ8940/QnTIpHW+jUx4wapbkMTnNQVpQy3Wugsr4d
	 bk2BHaMbaKVww==
Date: Mon, 9 Jun 2025 17:01:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: interrupt-controller: add generic
 Risc-v aclint-sswi
Message-ID: <20250609-rejoice-disclose-b677f617f2de@spud>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250609134749.1453835-4-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
In-Reply-To: <20250609134749.1453835-4-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_090109_618750_4CA592F5 
X-CRM114-Status: GOOD (  23.06  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Anup Patel <anup@brainfault.org>, Chen Wang <unicorn_wang@outlook.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Ryo Takakura <takakura@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Content-Type: multipart/mixed; boundary="===============9166071655740035477=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9166071655740035477==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0bO5XdsS6ddgc29+"
Content-Disposition: inline


--0bO5XdsS6ddgc29+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 04:47:45PM +0300, Vladimir Kondratiev wrote:
> Add generic, Risc-V spec compliant (see [1]) aclint-sswi binding
>=20
> Thead specific binding preserved, and converted to variant of the
> generic aclint-sswi
>=20
> Link: https://github.com/riscvarchive/riscv-aclint [1]

What is the ratification status of this spec?

>=20
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  .../riscv,aclint-sswi.yaml                    | 89 +++++++++++++++++++
>  .../thead,c900-aclint-sswi.yaml               | 58 ------------
>  2 files changed, 89 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/riscv,aclint-sswi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/thead,c900-aclint-sswi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
riscv,aclint-sswi.yaml
> new file mode 100644
> index 000000000000..cffddfcfcfea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint=
-sswi.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-ssw=
i.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Risc-V ACLINT Supervisor-level Software Interrupt Device

s/Risc-V/RISC-V/g

> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +description:
> +  The SSWI device is a part of the Risc-V ACLINT device. It provides
> +  supervisor-level IPI functionality for a set of HARTs on a THEAD
> +  platform. It provides a register to set an IPI (SETSSIP) for each
> +  HART connected to the SSWI device. See specification
> +  https://github.com/riscvarchive/riscv-aclint
> +
> +  T-HEAD C900 ACLINT is a variant of the ACLINT, using dedicated
> +  compatible string
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sophgo,sg2044-aclint-sswi
> +          - const: thead,c900-aclint-sswi
> +      - items:
> +          - const: riscv,aclint-sswi

You need a specific compatible for your implementation.
Whether or not this compatible is viable depends on the answer to the
ratification status and/or plan for the spec.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  interrupt-controller: true
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +  riscv,hart-indexes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 16384

maxItems is 4x what is allowed for interrupts-extended. Why?

> +    description:
> +      A list of hart indexes that APLIC should use to address each hart
> +      that is mentioned in the "interrupts-extended"

Please constrain this property to only be permitted on !thead.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#interrupt-cells"
> +  - interrupt-controller
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    //Example 1
> +    interrupt-controller@94000000 {
> +      compatible =3D "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-ssw=
i";
> +      reg =3D <0x94000000 0x00004000>;
> +      #interrupt-cells =3D <0>;
> +      interrupt-controller;
> +      interrupts-extended =3D <&cpu1intc 1>,
> +                            <&cpu2intc 1>,
> +                            <&cpu3intc 1>,
> +                            <&cpu4intc 1>;
> +    };
> +
> +  - |
> +    //Example 2
> +    interrupt-controller@94000000 {
> +      compatible =3D "riscv,aclint-sswi";
> +      reg =3D <0x94000000 0x00004000>;
> +      #interrupt-cells =3D <0>;
> +      interrupt-controller;
> +      interrupts-extended =3D <&cpu1intc 1>,
> +                            <&cpu2intc 1>,
> +                            <&cpu3intc 1>,
> +                            <&cpu4intc 1>;
> +      riscv,hart-indexes =3D <0 1 0x10 0x11>;

Please be consistent. Hex or decimal, but not both.

Cheers,
Conor.

--0bO5XdsS6ddgc29+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcFPgAKCRB4tDGHoIJi
0syLAQCKcAg5MoUg65x8c8wmRQ4jrRHsbMrQwMf6m1ZzX/hBTQEA1/TVJcYfSH3+
tw9Ntl2G7mMGqeR1bjZWhBGDnH0mxgE=
=zT3n
-----END PGP SIGNATURE-----

--0bO5XdsS6ddgc29+--


--===============9166071655740035477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9166071655740035477==--

