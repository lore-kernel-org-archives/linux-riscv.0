Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE775C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 20:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcaHSjl+SphL/u3NY40vT3r+CsXjqmM39zUK54RmRN0=; b=c7BWXe1fld/z32UpNqBs/bsRD8
	DXJtmRtOaZNBBxI+JblNSCw2qfQFsN2jc18/BMvjpArJybifF6ygGyfVoyzUFzTi3Ow/1jDhs0gwJ
	0yl0vGe122fFnFggdmksy/ihB3dH3kcCz/MQTryepUjVYnezs2tq1Fkyua1oCeSTMEvqMJYvgIE5q
	T6778Q+GrRysFZOqgcqwrZewAzXtZs8YG9D+8ZoTW2XpOGrFLZsTI0K9Z0YuKE/W6qk7BLd4+YmlU
	KMgJ+Mm7lHhpfGDC4U4r1UCsTAD1NPdDA0Iz3W7bF/CMGK4/1SoY5n4s6vx9I14w8Zaq+gkX32NH3
	meEwspwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkVN-00E8k7-29;
	Thu, 18 May 2023 20:45:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjOu-00DyoC-1E
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 19:35:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 346ED60E8D;
	Thu, 18 May 2023 19:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566DAC433D2;
	Thu, 18 May 2023 19:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684438498;
	bh=7ujIWrAt84CAZqQbL29G5T7eA+bKtP7cAoWHbXBRRSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMQutcyQydYIMUy+S4sHDOHbFI3j3EoUAuB0fK97AryoNM3b2FTsoc0xFzqMB4OPw
	 OhEDOzmqLZ+Rl4EHLUYB6geNVB2QAj9vaODRla6CGbujnpL9629f14msjWwjvoGbVb
	 A9XwhsBdQmI34fbiR/TQ5SD0ZuK8F8XpTA3HPVhhVFqvkkXf1WrJhrpmukZT5U0DQe
	 w5V9rY6TAvkqOjpUDupOXGC74qLFnUm6zrnlPnH44eHFegwsZyflWQkJFgonXSHrrH
	 Jlro1LIyXFu60QWNyci6+URTT4xuHAkmO4AJFk8wvkn9ty0rgTuyT24aCNGHtnjw1U
	 opZOZ5LleonIQ==
Date: Thu, 18 May 2023 20:34:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v4 03/10] dt-bindings: serial: add documentation for
 Bouffalolab UART Driver
Message-ID: <20230518-wish-duplicity-a280b19d9dcf@spud>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-4-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230518152244.2178-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_123500_494317_EAEE3513 
X-CRM114-Status: GOOD (  17.69  )
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
Content-Type: multipart/mixed; boundary="===============0194808978500894568=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0194808978500894568==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rVUuxQlCNvY2DQNY"
Content-Disposition: inline


--rVUuxQlCNvY2DQNY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 11:22:37PM +0800, Jisheng Zhang wrote:
> Add bindings doc for Bouffalolab UART Driver
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

As I said previously, happy to grab the non-serial parts of the series
once Greg (or Jiri?) pick the serial bits.

Cheers,
Conor.

> ---
>  .../serial/bouffalolab,bl808-uart.yaml        | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/bouffalolab,=
bl808-uart.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/serial/bouffalolab,bl808-u=
art.yaml b/Documentation/devicetree/bindings/serial/bouffalolab,bl808-uart.=
yaml
> new file mode 100644
> index 000000000000..0ef858e50efb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/bouffalolab,bl808-uart.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/bouffalolab,bl808-uart.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bouffalolab UART Controller
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +allOf:
> +  - $ref: serial.yaml#
> +
> +properties:
> +  compatible:
> +    const: bouffalolab,bl808-uart
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    uart0: serial@30002000 {
> +        compatible =3D "bouffalolab,bl808-uart";
> +        reg =3D <0x30002000 0x1000>;
> +        interrupts =3D <53 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&xtal>;
> +    };
> +...
> --=20
> 2.40.0
>=20

--rVUuxQlCNvY2DQNY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZ93AAKCRB4tDGHoIJi
0teFAP46CSNElMa0c7OcjRrJ/GQ7TOxHpbogOcpZFdwwTXKeNgEAzNPSSkAc4/dK
dd5WbA7VZXyjq0zpoa8VCbEssGLkTQY=
=T+6e
-----END PGP SIGNATURE-----

--rVUuxQlCNvY2DQNY--


--===============0194808978500894568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0194808978500894568==--

