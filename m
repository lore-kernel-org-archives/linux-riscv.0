Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3130ACDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxmLQCmYbRr6cl634Edg6MufmIdXhBVHbLl/0jou0Xo=; b=NcjWJ09viVpTfqI9D56OBowpcD
	sUjEqLlMOJhUnYRisV/53sIpfi9h6VPMnEAthVhcpmudV4ikU5vwNXKtH4p4YPgTkmyQ1Zm7zFySD
	5MG+P+E/wtCyml16RszmvlaOuHR675Ay/F7/nQ8PlmX8TPqCwFvv3CJaCie0KdZk/0MON2BJEVTEc
	xxNcREJ4mC/P/6uyZLLTaVfazvkDuJRiCB/YNnjFkMuFPiwV3YF4KxlX9wnsGUcs5CSO7umYYnqlS
	1VkVj49u5T2tdG/HRJLX1NeVchO+oL7tgiwcIfme4IANj9TqxKJ+72W8ewd1YP7Cp21giyEpZfGhf
	Ov0vc6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyei-001QjC-0s;
	Thu, 12 Oct 2023 16:35:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyed-001QiZ-2a
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 16:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0408961EA4;
	Thu, 12 Oct 2023 16:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD1DC433C9;
	Thu, 12 Oct 2023 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697128518;
	bh=NzPnqibzF2upn4jm8KZCaKXCOa5mbd6V+kdKukg1bho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWF9XZZBPSGaIGB9GxRD/AIU3rNbEv502xv/ptW08UTsvC4RJzsoDszsiWtnHnPeB
	 IYnlPGBdG/Qmhd2SM5T+spot7Zx1/qQS/uuXt2MlQA0Rs/QfuPd15xpkuTaeGFFAjg
	 ypYZPaN5w2auKfG9PV2ugkcOKGXJEZpOJB8bR/va25xh7o+m59RTcpSDSSmssFGIgt
	 nFgU1QJ5XEHlMpofy24kYCa4qL3sNDulzL4HV82fko8QrqJJ6ZspbGlds8p7cgUlFk
	 2bOYsfN4eGL8Egic4KKVmT/tSx18vhejN1zU/3+tnPq461nPfVK6e4UYxH/FVKSAEj
	 /4YeEoVjpdZAg==
Date: Thu, 12 Oct 2023 17:35:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v10 07/15] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
Message-ID: <20231012-countable-darkish-7e449edc763d@spud>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
 <20231003044403.1974628-8-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231003044403.1974628-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_093519_943069_7DCE2DAD 
X-CRM114-Status: GOOD (  31.21  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============5527873196415306277=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5527873196415306277==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I6UQvs0M76IAl9Q0"
Content-Disposition: inline


--I6UQvs0M76IAl9Q0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Tue, Oct 03, 2023 at 10:13:55AM +0530, Anup Patel wrote:
> We add DT bindings document for the RISC-V incoming MSI controller
> (IMSIC) defined by the RISC-V advanced interrupt architecture (AIA)
> specification.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Just FYI, since they'll reply to this themselves, but some of the
Microchip folks have run into problems with sparse hart indexes while
trying to use the imsic binding to describe some configurations they
have. I think there were also so problems with how to describe to a
linux guest which file to use, when the first hart available to the
guest does not use the first file. They'll do a better job of describing
their problems than I will, so I shall leave it to them!

Cheers,
Conor.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../interrupt-controller/riscv,imsics.yaml    | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/riscv,imsics.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv=
,imsics.yaml
> new file mode 100644
> index 000000000000..84976f17a4a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics=
=2Eyaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,imsics.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Incoming MSI Controller (IMSIC)
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V advanced interrupt architecture (AIA) defines a per-CPU inc=
oming
> +  MSI controller (IMSIC) for handling MSIs in a RISC-V platform. The RIS=
C-V
> +  AIA specification can be found at https://github.com/riscv/riscv-aia.
> +
> +  The IMSIC is a per-CPU (or per-HART) device with separate interrupt fi=
le
> +  for each privilege level (machine or supervisor). The configuration of
> +  a IMSIC interrupt file is done using AIA CSRs and it also has a 4KB MM=
IO
> +  space to receive MSIs from devices. Each IMSIC interrupt file supports=
 a
> +  fixed number of interrupt identities (to distinguish MSIs from devices)
> +  which is same for given privilege level across CPUs (or HARTs).
> +
> +  The device tree of a RISC-V platform will have one IMSIC device tree n=
ode
> +  for each privilege level (machine or supervisor) which collectively de=
scribe
> +  IMSIC interrupt files at that privilege level across CPUs (or HARTs).
> +
> +  The arrangement of IMSIC interrupt files in MMIO space of a RISC-V pla=
tform
> +  follows a particular scheme defined by the RISC-V AIA specification. A=
 IMSIC
> +  group is a set of IMSIC interrupt files co-located in MMIO space and w=
e can
> +  have multiple IMSIC groups (i.e. clusters, sockets, chiplets, etc) in a
> +  RISC-V platform. The MSI target address of a IMSIC interrupt file at g=
iven
> +  privilege level (machine or supervisor) encodes group index, HART inde=
x,
> +  and guest index (shown below).
> +
> +  XLEN-1            > (HART Index MSB)                  12    0
> +  |                  |                                  |     |
> +  -------------------------------------------------------------
> +  |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
> +  -------------------------------------------------------------
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qemu,imsics
> +      - const: riscv,imsics
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 16384
> +    description:
> +      Base address of each IMSIC group.
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  msi-controller: true
> +
> +  "#msi-cells":
> +    const: 0
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 16384
> +    description:
> +      This property represents the set of CPUs (or HARTs) for which given
> +      device tree node describes the IMSIC interrupt files. Each node po=
inted
> +      to should be a riscv,cpu-intc node, which has a CPU node (i.e. RIS=
C-V
> +      HART) as parent.
> +
> +  riscv,num-ids:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 63
> +    maximum: 2047
> +    description:
> +      Number of interrupt identities supported by IMSIC interrupt file.
> +
> +  riscv,num-guest-ids:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 63
> +    maximum: 2047
> +    description:
> +      Number of interrupt identities are supported by IMSIC guest interr=
upt
> +      file. When not specified it is assumed to be same as specified by =
the
> +      riscv,num-ids property.
> +
> +  riscv,guest-index-bits:
> +    minimum: 0
> +    maximum: 7
> +    default: 0
> +    description:
> +      Number of guest index bits in the MSI target address.
> +
> +  riscv,hart-index-bits:
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Number of HART index bits in the MSI target address. When not
> +      specified it is calculated based on the interrupts-extended proper=
ty.
> +
> +  riscv,group-index-bits:
> +    minimum: 0
> +    maximum: 7
> +    default: 0
> +    description:
> +      Number of group index bits in the MSI target address.
> +
> +  riscv,group-index-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 55
> +    default: 24
> +    description:
> +      The least significant bit position of the group index bits in the
> +      MSI target address.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - msi-controller
> +  - "#msi-cells"
> +  - interrupts-extended
> +  - riscv,num-ids
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    // Example 1 (Machine-level IMSIC files with just one group):
> +
> +    interrupt-controller@24000000 {
> +      compatible =3D "qemu,imsics", "riscv,imsics";
> +      interrupts-extended =3D <&cpu1_intc 11>,
> +                            <&cpu2_intc 11>,
> +                            <&cpu3_intc 11>,
> +                            <&cpu4_intc 11>;
> +      reg =3D <0x28000000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells =3D <0>;
> +      msi-controller;
> +      #msi-cells =3D <0>;
> +      riscv,num-ids =3D <127>;
> +    };
> +
> +  - |
> +    // Example 2 (Supervisor-level IMSIC files with two groups):
> +
> +    interrupt-controller@28000000 {
> +      compatible =3D "qemu,imsics", "riscv,imsics";
> +      interrupts-extended =3D <&cpu1_intc 9>,
> +                            <&cpu2_intc 9>,
> +                            <&cpu3_intc 9>,
> +                            <&cpu4_intc 9>;
> +      reg =3D <0x28000000 0x2000>, /* Group0 IMSICs */
> +            <0x29000000 0x2000>; /* Group1 IMSICs */
> +      interrupt-controller;
> +      #interrupt-cells =3D <0>;
> +      msi-controller;
> +      #msi-cells =3D <0>;
> +      riscv,num-ids =3D <127>;
> +      riscv,group-index-bits =3D <1>;
> +      riscv,group-index-shift =3D <24>;
> +    };
> +...
> --=20
> 2.34.1
>=20

--I6UQvs0M76IAl9Q0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSggQAAKCRB4tDGHoIJi
0jX7AQD05XfWt/zooqoq0GNcS4OA6AvVl1iuwcakZQzEOODm2gD/bITckI/qpW0Q
tM4K+OXVgXTg/vqHtWmSbrolQSzhhwc=
=63QK
-----END PGP SIGNATURE-----

--I6UQvs0M76IAl9Q0--


--===============5527873196415306277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5527873196415306277==--

