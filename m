Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ACECD6E64
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6HKH0LGxcAEzpzqJlW6tYUUkRKS53IMlswVoEi9G0o=; b=zGRmzoy89i8+8M6xINl0loRCAS
	Lm0PAra+qHEsrXuHYxVlkQfYwCMbPUE+J3ny/cRFjLDIkiiHafm6puinl07iWShNbAiHBzsNdK3lt
	7wH/76xiYTKgILR70KoRhtGv/tutXq5N5EgZ4/i9BtqHITOjZOxE0k3vLUb4kt/cFn+tHeyfJGtHP
	39Y3VJqH0dHIUUaRqprEeK5E9ZaWyRNAiEb++NTP84L8TCRMm8KaY1ozGU9Ptfn9Kg0VUawSy7bq/
	/O+ACjLRwvsS8t2NNrHwSQNDhY4EYNKxJzVDQo8P8O7hJ8WOHcKGSlcGlQDJXov42HTKHzDr9omNU
	/aOEW9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhof-0000000EhAH-1sBs;
	Wed, 03 Jun 2026 09:23:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhod-0000000EhAB-3fDN
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 09:23:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 04AA86008A;
	Wed,  3 Jun 2026 09:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447161F00893;
	Wed,  3 Jun 2026 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780478590;
	bh=MLar3ANMHIxzd0/TZSbopHbn8uvHPGqcW/THb8H8Wpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nrXGIQAh74jCUtbevLOqC+mfavS9ryQNqs1HIjofoUA56EhwX8AXExoZXazeqFav9
	 Mq2eSrXhhKhaHwzGmjGPWB+kZoR/zAkwA8rLvM6Dbnlq2hXwpX5jOoEHnZVixfWi9j
	 nml9wm2zagZxwm3uc062IrCKysID7gWBmZTd0aA9WBvlSVSKXxQ/i3FBTCeDq5kG9O
	 qrbJ0RKyZoUNCa67ya8KoDT/n50u8XIPKE6sqXiIvgUCnaRUIK7ntKUvG0pYIkbYtU
	 ej2TYRBB8d+jusvq0jPOVHBsbWB6kb82HVPCzgr23IZMxXJpUwfSAxI/JsCPXwqP0/
	 lnoco2seDujfg==
Date: Wed, 3 Jun 2026 10:23:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: timer: Add RISC-V ACLINT bindings
Message-ID: <20260603-tadpole-slept-8b6eeae9cd47@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-5-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260603074222.593243-5-joel@jms.id.au>
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
Content-Type: multipart/mixed; boundary="===============2524296756278195661=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2524296756278195661==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="snG+5dRCAbEpDZ3t"
Content-Disposition: inline


--snG+5dRCAbEpDZ3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:16PM +0930, Joel Stanley wrote:
> Document the bindings for the RISC-V ACLINT.
>=20
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  MAINTAINERS                                   |  1 +
>  .../bindings/timer/riscv,aclint-mtimer.yaml   | 52 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-=
mtimer.yaml
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..43dd9873bbc5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23005,6 +23005,7 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/tenstorrent/linux.git
> +F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
>  F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcp=
u.yaml
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
> diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.=
yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> new file mode 100644
> index 000000000000..192ff3fcf79f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Advanced Core Local Interruptor (ACLINT)
> +
> +maintainers:
> +  - Joel Stanley <jms@oss.tenstorrent.com>
> +
> +description:
> +  This RISC-V ACLINT specification defines a set of memory mapped device=
s which
> +  provide inter-processor interrupts (IPI) and timer functionalities for=
 each
> +  HART on a multi-HART RISC-V platform. The specification can be found at
> +  https://github.com/riscvarchive/riscv-aclint/

This is a draft specification, so having a "riscv,aclint-mtimer"
compatible is not appropriate. Ordinarily I would say that you should be
able to do this once frozen, but this spec is archived and unlikely to
have that happen.
pw-bot: changes-requested

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - tenstorrent,atlantis-aclint
> +          - qemu,aclint-mtimer
> +      - const: riscv,aclint-mtimer
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 4095

I don't see why this permits so many regions, the draft spec has two
regions, one for MTIME and one for MTIMECMP0-4094.

> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    // Example 1

Delete this comment please.

Thanks,
Conor.

> +
> +    timer@ac000000 {
> +      compatible =3D "tenstorrent,atlantis-aclint", "riscv,aclint-mtimer=
";
> +      interrupts-extended =3D <&cpu1intc 7>,
> +                            <&cpu2intc 7>,
> +                            <&cpu3intc 7>,
> +                            <&cpu4intc 7>;
> +      reg =3D <0xac000000 0x00010000>;
> +    };
> +...
> --=20
> 2.47.3
>=20

--snG+5dRCAbEpDZ3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah/yegAKCRB4tDGHoIJi
0s9fAPwIGS5mhVyWlH71tkgaZ2FaQPoMl3V1VqK1FLqK583X7gEAz61WFaDPpR4R
RRnPjJ0eWtwQEGIU6Iy6QvxYaOezQwA=
=yBrM
-----END PGP SIGNATURE-----

--snG+5dRCAbEpDZ3t--


--===============2524296756278195661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2524296756278195661==--

