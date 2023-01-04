Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7BBC46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 22:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sa9ORH0iHdW3nvVI0v47ETxfkbM795DrO5nvTHXhjn0=; b=ufBfs2JAG05FXcjwNXdWtIO/Pm
	VLQFIo/L0k2/73ozOsbXFPJWKz91StH3LUTf9Q+e/u06ZNyni+ikhgfFNxKdWFBEKU6o2RcK6kJ5p
	Hw96LgcWMog+rkOtplXKdq7dd3XKWobFjQPi5s887bMxWYG/VeFBPqTdVjthV0QDOJ+7k6a1sawak
	xqarb65Rd8JtkxVecC8X6lWpi5RZ0J9MlzOazs4xkpQLRlH2PIr7ERYEgPsOw7+Ihy3H3PnaIQICI
	8fYMCiEetR2idSTB6q8Vl2j6TM/p7plndyVpVUlTMJ3Uzrzk1CpDLFR9hzewLu5vVtQMktWvL5+1t
	SNGV5Hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDC4K-00CStU-1k; Wed, 04 Jan 2023 22:17:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDC4G-00CSrG-JS
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 22:17:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F83861857;
	Wed,  4 Jan 2023 22:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9CCC43392;
	Wed,  4 Jan 2023 22:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672870623;
	bh=nTOZE+n1x/HPxCpxyWWYLQviHIqmDTpR/4NccwtHT+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IoJlp+b1uXIaXFHUxj+Ce2apRzAZDrapooHr9EBzBVf9qXgfCSTbbmlb8q/1UPgi1
	 DJLeY67pw21s2QLNCimRumKSVcikEtJBKJrIFgOCMF1IxWY4fUDa5R7nrkzr/DRTuL
	 yKUtHutzxz0QbWy19JidFkwfHfESoNqco1tRCcKdfHQ0GuvlkS8uslWj/OPvhsJEzn
	 1FwkjijYTga8XPpRorWH5Z69r+aQnoVdt6bb6CK0yCS5jXchwcKbcEIjLjOHx4Ub3b
	 9/ks/XYDKey4/5wBoO+8YeSIbcNZIz8xCYG9rI4RQ7eEaSnIUXbcrOUZ4MdBcNjc79
	 UecqYixuIVYaA==
Date: Wed, 4 Jan 2023 22:16:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/9] dt-bindings: interrupt-controller: Add RISC-V
 advanced PLIC
Message-ID: <Y7X62v5Zp6+thx5A@spud>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-7-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230103141409.772298-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_141704_741009_E3DFF2E5 
X-CRM114-Status: GOOD (  26.34  )
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
Content-Type: multipart/mixed; boundary="===============7138617967886669470=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7138617967886669470==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CM+OG7HiznyhPXQ1"
Content-Disposition: inline


--CM+OG7HiznyhPXQ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Anup,

On Tue, Jan 03, 2023 at 07:44:06PM +0530, Anup Patel wrote:
> We add DT bindings document for RISC-V advanced platform level
> interrupt controller (APLIC) defined by the RISC-V advanced
> interrupt architecture (AIA) specification.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../interrupt-controller/riscv,aplic.yaml     | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/riscv,aplic.yaml

> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 16384
> +    description:
> +      Given APLIC domain directly injects external interrupts to a set of
> +      RISC-V HARTS (or CPUs). Each node pointed to should be a riscv,cpu=
-intc
> +      node, which has a riscv node (i.e. RISC-V HART) as parent.
> +
> +  msi-parent:
> +    description:
> +      Given APLIC domain forwards wired interrupts as MSIs to a AIA inco=
ming
> +      message signaled interrupt controller (IMSIC). This property shoul=
d be
> +      considered only when the interrupts-extended property is absent.

Considered by what?
On v1 you said:
<quote>
If both "interrupts-extended" and "msi-parent" are present then it means
the APLIC domain supports both MSI mode and Direct mode in HW. In this
case, the APLIC driver has to choose between MSI mode or Direct mode.
<\quote>

The description is still pretty ambiguous IMO. Perhaps incorporate
some of that expanded comment into the property description?
Say, "If both foo and bar are present, the APLIC domain has hardware
support for both MSI and direct mode. Software may then chose either
mode".
Have I misunderstood your comment on v1? It read as if having both
present indicated that both were possible & that "should be considered
only..." was more of a suggestion and a comment about the Linux driver's
behaviour.
Apologies if I have misunderstood, but I suppose if I have then the
binding's description could be improved!!

> +  riscv,children:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 1024
> +    items:
> +      maxItems: 1
> +    description:
> +      A list of child APLIC domains for the given APLIC domain. Each chi=
ld
> +      APLIC domain is assigned child index in increasing order with the

btw, missing article before child (& a comma after order I think).

> +      first child APLIC domain assigned child index 0. The APLIC domain
> +      child index is used by firmware to delegate interrupts from the
> +      given APLIC domain to a particular child APLIC domain.
> +
> +  riscv,delegate:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 1024

Is it valid to have a delegate property without children? If not, the
binding should reflect that dependency IMO.

> +    items:
> +      items:
> +        - description: child APLIC domain phandle
> +        - description: first interrupt number (inclusive)
> +        - description: last interrupt number (inclusive)
> +    description:
> +      A interrupt delegation list where each entry is a triple consisting
> +      of child APLIC domain phandle, first interrupt number, and last
> +      interrupt number. The firmware will configure interrupt delegation

btw, drop the article before firmware here.
Also, "firmware will" or "firmware must"? Semantics perhaps, but they
are different!

Kinda for my own curiosity here, but do you expect these properties to
generally be dynamically filled in by the bootloader or read by the
bootloader to set up the configuration?

> +      registers based on interrupt delegation list.

I'm sorry Anup, but this child versus delegate thing is still not clear
to me binding wise. See below.

> +    aplic0: interrupt-controller@c000000 {
> +      compatible =3D "riscv,qemu-aplic", "riscv,aplic";
> +      interrupts-extended =3D <&cpu1_intc 11>,
> +                            <&cpu2_intc 11>,
> +                            <&cpu3_intc 11>,
> +                            <&cpu4_intc 11>;
> +      reg =3D <0xc000000 0x4080>;
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +      riscv,num-sources =3D <63>;
> +      riscv,children =3D <&aplic1>, <&aplic2>;
> +      riscv,delegate =3D <&aplic1 1 63>;

Is aplic2 here for demonstrative purposes only, since it has not been
delegated any interrupts?
I suppose it is hardware present on the SoC that is not being used by
the current configuration?

Thanks,
Conor.

> +    };
> +
> +    aplic1: interrupt-controller@d000000 {
> +      compatible =3D "riscv,qemu-aplic", "riscv,aplic";
> +      interrupts-extended =3D <&cpu1_intc 9>,
> +                            <&cpu2_intc 9>;
> +      reg =3D <0xd000000 0x4080>;
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +      riscv,num-sources =3D <63>;
> +    };
> +
> +    aplic2: interrupt-controller@e000000 {
> +      compatible =3D "riscv,qemu-aplic", "riscv,aplic";
> +      interrupts-extended =3D <&cpu3_intc 9>,
> +                            <&cpu4_intc 9>;
> +      reg =3D <0xe000000 0x4080>;
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +      riscv,num-sources =3D <63>;
> +    };


--CM+OG7HiznyhPXQ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7X62gAKCRB4tDGHoIJi
0jdPAQDE7jaXqDBSHkYz30DfCDF68e8vHV/nGNfwySX74TqkmAEA8kiQVjEAphNj
VrxoMV535/dnuFew0/H+emA4BYc1swU=
=Whsj
-----END PGP SIGNATURE-----

--CM+OG7HiznyhPXQ1--


--===============7138617967886669470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7138617967886669470==--

