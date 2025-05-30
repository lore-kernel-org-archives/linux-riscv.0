Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4230AC5B543
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBhQcuoxO3caMQr+eTsspGZC6MbMabULXJLQL+qTUsg=; b=SOG5tXjWwXm8jjTGQDUShEs7Kn
	e4BPG5oo0uSMhMTXH8JNvULZAP2k3n8lRGBw8xuI2fMB3TbJ26isKg1ni1f5EiXe/jx66LDnafu/4
	xCKQC31FuqJe5wfKx4huEcYsyk+aWAgmutKPWs4uHTvN0IJxiQpUsnr8O0BN8JlhxgZw0zvlM4NY9
	NTw8ObNdZ5GjjMYSvRKx66IfVszz1vtZY7aD8DbBUcleSj2QXqZLwO4Cr4WCihq84V038dbprqpQx
	rYbzVxnslenYceWo+VqNGH9RTAhbb5PrSib5XXf1FL8/RjAosp9PEFhnPAZ1TsOnV9BSGUI3gaju3
	xMEKiVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL35l-00000001IgW-39fn;
	Fri, 30 May 2025 17:00:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2nM-00000001D0H-2mEj
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 16:41:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 81DB3A4F997;
	Fri, 30 May 2025 16:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363FEC4CEE9;
	Fri, 30 May 2025 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748623283;
	bh=NNIZMqtV5b/laCJ78xBzh8tAvbijms9RwhfGqszJY4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6rdKF6EW0yFAyrcq2MrEEVWAhxbmkkpt/vleZ8NidsgHlFzNbSP6QGAlzRhLWaAE
	 uUs1Fa42tEFx3aPUZPLnFBKusm3zESYUyUqdvTHxn60y2Rg3bD7rRUlB7fEGG+n6DQ
	 +P4KeASYSUuWASNe8ALRkMfHScGUtgdhIpHPcjwRCdSHF9ibe+eT/NDtTT9H2U8EKb
	 V825bsIFE7WHppnu6OFXLPqsZKR9gYVd8t3Xo9WQTkQjsZelQbQWBbM0/Hb9wsLUQQ
	 w12RDR6rNlKW1CLnJS9MGzJI/JaWw8pCW0qJm+jYB9MK+9c12mEkKdqOSbO7pNrnZi
	 6xKHRYv8rMdyw==
Date: Fri, 30 May 2025 17:41:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 09/23] dt-bindings: clock: Add RPMI clock service
 controller bindings
Message-ID: <20250530-squatting-chatroom-230f035f18ef@spud>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-10-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20250525084710.1665648-10-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_094124_855537_FC129C0B 
X-CRM114-Status: GOOD (  23.72  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============6596069330182459118=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6596069330182459118==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nkVldtvynGlh9wsR"
Content-Disposition: inline


--nkVldtvynGlh9wsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 02:16:56PM +0530, Anup Patel wrote:
> Add device tree bindings for the RPMI clock service group based
> controller for the supervisor software.
>=20
> The RPMI clock service group is defined by the RISC-V platform
> management interface (RPMI) specification.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/clock/riscv,rpmi-clock.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-cl=
ock.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yam=
l b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> new file mode 100644
> index 000000000000..9c672a38595a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI clock service group based clock controller
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> +  messaging protocol which is modular and extensible. The supervisor
> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> +  or some dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines clock service group for accessing
> +  system clocks managed by a platform microcontroller. The supervisor
> +  software can access RPMI clock service group via SBI MPXY channel or
> +  some dedicated supervisor-mode RPMI transport.
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the supervisor software.
> +    const: riscv,rpmi-clock
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message pr=
oxy channel.
> +
> +  "#clock-cells":
> +    const: 1

Could you please add some description here as to what this clock-cell
actually does? On a normal clock controller someone might cite an
include file with a huge list of defines for what numbers map to what
clock. In this case, this value is CLOCK_ID in the spec, so it's
completely platform specific as to what they mean so citing some include
isn't helpful, so just mention that it is CLOCK_ID and the meanings are
platform specific.

I suppose technically it can be something other than CLOCK_ID, if this is
used when the SBI message proxy extension is provided by an SBI
implementation that uses a non-RPMI transport, but I don't think that's a
can of worms worth bringing up in the binding. Anyone doing that can put
2+2 together I think.

Otherwise, the bindings are all:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - mboxes
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller {
> +        compatible =3D "riscv,rpmi-clock";
> +        mboxes =3D <&mpxy_mbox 0x1000 0x0>;
> +        #clock-cells =3D <1>;
> +    };
> +...
> --=20
> 2.43.0
>=20

--nkVldtvynGlh9wsR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnfrAAKCRB4tDGHoIJi
0uDZAP44sukoA1LPqYegMtV2uiSKQF4gXRTD8Qx7XhkuHFJQfwD7B2qEkWLyTKAW
D1359VQetNBQvvyAK7YiFoZG3o+KcgM=
=LFdp
-----END PGP SIGNATURE-----

--nkVldtvynGlh9wsR--


--===============6596069330182459118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6596069330182459118==--

