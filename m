Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E529BCA6007
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBI2Tl6+EuHOTxhS4rTdnPkVacQ1K2tZ737y9dMTd3M=; b=IkouNXTe8RLJSx/Q96qLlqTxOD
	TwC/scK5Ri8zB7FgmodR7vSej+eC0wX/+eoD6Y0WzL1wplExvO9LTnhaEnlcBRALkYSCt4rXOicPS
	6YW/2XA8oOVwwuqNhoupck5FruukPrR5aZ2jAKMZMHrJEL57QoVhJ/3KkLWp3fTcBh9fD8Altow43
	Ypgk424VQSB2TOlKBYEHbiLV+sgXYmMcEnF/vPdh9oFt7glOh9iRpX6ayX3N8BbsmW6Lzafejeuws
	3VFAcRC0k5pCisXzBEtgF8jB/0Ngeoe8Aqhl5UUDxUBDpqU4Yk9TdoMfYjsiapelM5B7y3iOY8iyZ
	sHI0aqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESvj-00000002eJe-19Y6;
	Wed, 07 Oct 2026 14:47:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESvi-00000002eJV-1LpG
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 14:47:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDF16601FF;
	Wed,  7 Oct 2026 14:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA3A1F000FF;
	Wed,  7 Oct 2026 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384457;
	bh=06RGgKlxhI3vAlMgeGy/b7SYRVhXDEzCGrCMBv0sed8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WZI9//toGvDYZoaT/CLNRjlb+05x69EuOQOyTUl41rGutzmGprFywCX/2xoeMMji7
	 DZL3b/aWJAGOnycWSqfitcUWLoUVX+DGr5xLV8E8SF8kpBcjGpcOueAU5YI/PnO1l+
	 HNnkhTqhCUQdxxd5Ue8SkCD3ZiTkfIs78m2Q0LQwd7IQcB2E1pvMUu8/KmI6OEP+ix
	 VBq0jG7bf5LjSkSt5thIezqbBaw0CdPydD9fjlu1OlBmqed1vEBs3HMNFoa5CiOwlM
	 yjRoHARUEZJRAV1iCI1KjB5NmHNSfa5iqb1bL47GQ0rUYv/XsTLBKdqe0FNyjJEm+r
	 Jdt0oZ+DiIU8g==
Date: Wed, 7 Oct 2026 15:47:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, rahul@summations.net,
	anup@brainfault.org, lftan.linux@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Message-ID: <20261007-5a8b6f7be01bd3d8c7aed8e1@squawk>
References: <20261007100022.2512187-1-joshua.yeong@starfivetech.com>
 <20261007100022.2512187-2-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20261007100022.2512187-2-joshua.yeong@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============7186082487583769629=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7186082487583769629==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jqnVNRoY4Gnsz1e7"
Content-Disposition: inline

--jqnVNRoY4Gnsz1e7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 06:00:18PM +0800, Joshua Yeong wrote:
> Add device tree bindings for the RISC-V Platform Management Interface
> (RPMI) voltage service group, both for the supervisor-facing regulator
> controller and for the SBI MPXY channel which the SBI implementation
> uses to expose the service group.
>=20
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
> Based on the RPMI device power series ("Add RISC-V RPMI device power
> service support"), which has been applied for next. The cover letter
> links the mail saying so.

What actual basis on that does this patch have?
It's just the same pattern, but this pattern applies to clks etc etc
too.

> diff --git a/Documentation/devicetree/bindings/regulator/riscv,rpmi-volta=
ge.yaml b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.ya=
ml
> new file mode 100644
> index 000000000000..3be47703af5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/riscv,rpmi-voltage.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI voltage service group based regulator controller
> +
> +maintainers:
> +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> +  messaging protocol which is modular and extensible. The supervisor
> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> +  or some dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines voltage service group for accessing
> +  and controlling the voltage domains managed by a platform
> +  microcontroller. The supervisor software can access RPMI voltage
> +  service group via SBI MPXY channel or some dedicated supervisor-mode
> +  RPMI transport.
> +
> +  The voltage domains are discovered at runtime from the platform
> +  microcontroller, which reports the name, the level format, the support=
ed
> +  levels and the always-on capability of each one, so none of that is
> +  described here.
> +
> +  A consumer names a domain through a "<name>-supply" phandle to a child=
 of
> +  the optional "regulators" container, whose "reg" is the domain's RPMI
> +  DOMAIN_ID. A domain without such a child is still registered, but has =
no
> +  node for a consumer to point at:
> +
> +    codec {
> +            compatible =3D "vendor,codec";
> +            vdd-supply =3D <&volt2_reg>;
> +    };
> +
> +  A child may also say what the board permits the rail to supply, which =
the
> +  platform microcontroller has no way to express. A child that gives no
> +  voltage constraint leaves the rail free to move within the levels the
> +  domain advertises.
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the supervisor software.
> +    const: riscv,rpmi-voltage
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message pr=
oxy channel.
> +
> +  regulators:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Optional container giving discovered domains a node of their own, =
for
> +      consumers to reference and for board level constraints.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^regulator@[0-9a-f]+$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +            description:
> +              RPMI DOMAIN_ID of the voltage domain this node describes.
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +
> +required:
> +  - compatible
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rpmi-voltage {
> +        compatible =3D "riscv,rpmi-voltage";
> +        mboxes =3D <&mpxy_mbox 0x1004 0x0>;
> +
> +        regulators {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            // A node only so that a consumer can name the domain with a
> +            // "<name>-supply". Its voltage stays free to move within the
> +            // advertised levels.

I think this is incorrectly worded. I think it should say something like
"A supply where the voltage is free to move within the levels advertised
by the domain". The "A node only" wording is just hard to understand.

> +            volt1_reg: regulator@1 {
> +                reg =3D <1>;
> +            };
> +
> +            // A board level constraint. Equal bounds pin the rail, so t=
he
> +            // supervisor applies 1.8V and refuses to move it afterwards.

I'd skip the detail on how all regulators work, I'd rather "A supply
where board-level constraints apply in addition to those advertised by
the domain" or something like that.

Cheers,
Conor.

> +            volt2_reg: regulator@2 {
> +                reg =3D <2>;
> +                regulator-min-microvolt =3D <1800000>;
> +                regulator-max-microvolt =3D <1800000>;
> +            };
> +        };
> +    };
> +...
> --=20
> 2.43.0
>=20

--jqnVNRoY4Gnsz1e7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasZbfwAKCRB4tDGHoIJi
0jFwAQDK1c1W651sxPGJY367Zo6Xnw7s9dQaJyKiyTvSZ1ghdQD+J6hM745+DaSy
ea/br6QCDazjXJ1rJ48v/d1veCo6oAM=
=JWUo
-----END PGP SIGNATURE-----

--jqnVNRoY4Gnsz1e7--


--===============7186082487583769629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7186082487583769629==--

