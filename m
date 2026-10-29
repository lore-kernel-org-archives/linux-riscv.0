Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55903606A33A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jobVsd/S;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ETFMsP8s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VIZptbR10ZvPha5D5t+Zf2toYpF7aG2Mr99JK038DDY=; b=jobVsd/SMntqtXz0cucgZGPF3a
	Fi6gO/ozr22p61SvDMu9hmae8Gr6+EXoOW6TQ3CIMdc2sIRfoheYs5IiCqVj1y55mVFfHH5ugtd7Y
	x1LC+/wIsXZ71ZOdnpKeuyc5GDjN+kgT7ZeB9ZYBm39WyOZIRqXS3dOAWreYnudiUKXUuaxmcZ69V
	6D/p1q00CcoMoSqc72KY6TJK7d+loQHT4uhExvsmvW9ZYxzR8mPpYy5cfKk/4RDwlctqqM17kiJTm
	g5tb0oYFyX4gDC5AoZ84X932kczW/anWb1tZaqDE0wmGbncYK/ERLK4tS8NevFXVbUB0NeaUG11OX
	3RO1OgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVHA-0000000ABSV-0WpO;
	Thu, 29 Oct 2026 18:55:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVH7-0000000ABSM-3x4L
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 18:54:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 561FC4388C;
	Thu, 29 Oct 2026 18:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B621F01816;
	Thu, 29 Oct 2026 18:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793300097;
	bh=wEgbHVoAVDi5POFLCru0ShT3/K2/8OJVSBqmnEGYSeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ETFMsP8s7BqWCCvKeR8RYN4ZbgkNL97EI1G0cfCpGTNPDTtpy+LJHIkygumdQSR6Z
	 YZoiaI0cRVFxac43T+75VHxazwRUFK/rY9SRmpVzb2r3Gc1Gm6bcMYPXKN0TFXXG7F
	 D8d0zAbx/00vMCVqqSrjDgZty6kFK5ropSwVzkmzlGVaVUGj7BYoE0bL1UPUCAlO6F
	 clg3Vh4cSWhi5hgmrwheRXHYVWmGRMaJna6/glQxmbmR4pCC4SED8hlOFty84skrfZ
	 OQC1MBwEg9bofBa/HM61P1HBpEBb1daP/Q08BXjHuua7zqnkA8DQlKeRkN9FyM4Yho
	 1AUknEPd2kX4g==
Date: Thu, 29 Oct 2026 18:54:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Kwanghoon Son <asdfkwang@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 05/12] dt-bindings: serial: Add BL808 UART
Message-ID: <20261029-pouch-enunciate-e74cf84e42a7@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-5-b736ee920078@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029-rust-bl808-console-v1-5-b736ee920078@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3537163604013454348=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3537163604013454348==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F1Dhg2KrVTCkSmmT"
Content-Disposition: inline

--F1Dhg2KrVTCkSmmT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 01:05:46AM -0400, Kwanghoon Son wrote:
> Describe the UART register range, interrupt and baud clock input.
> Initial Linux support targets the BL808 32-byte FIFO and reuses
> Zephyr's bflb,uart compatible. UART3 is D0 PLIC source 20.
>=20
> Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial=
/bflb,uart.html
>=20
> Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> ---
>  .../devicetree/bindings/serial/bflb,uart.yaml      | 57 ++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/bflb,uart.yaml b/Do=
cumentation/devicetree/bindings/serial/bflb,uart.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..df29d258f0a1c6d7bb283cf19=
c4157436991b64b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/bflb,uart.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bouffalo Lab UART Controller
> +
> +description: |
> +  UART IP used by Bouffalo Lab SoCs. Initial Linux support covers the
> +  BL808 controller with a 32-byte FIFO. The compatible follows Zephyr.
> +
> +maintainers:
> +  - Kwanghoon Son <asdfkwang@gmail.com>
> +
> +allOf:
> +  - $ref: serial.yaml#
> +
> +properties:
> +  compatible:
> +    const: bflb,uart

This needs to be a device-specific compatible - please just use the
binding already reviewed and agreed upon in Jisheng's 2023 series.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Baud rate generator clock
> +
> +  clock-names:
> +    items:
> +      - const: baud

Drop this clock name, with only one clock there's no more need for it
than the interrupt-names or reg-names that you do not use either.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    uart3: serial@30002000 {
> +        compatible =3D "bflb,uart";
> +        reg =3D <0x30002000 0x1000>;
> +        interrupts =3D <20 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&uart_baud>;
> +        clock-names =3D "baud";
> +    };
> +...
>=20
> --=20
> 2.47.3
>=20

--F1Dhg2KrVTCkSmmT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOWeQAKCRB4tDGHoIJi
0uKtAP0ejRfkQ6TQ/zZ8dEodbmT5akOou9YEluj6A8bUEGnyQgEA1uS4y7a9YWeA
TkOZjaMll9OgIUH9gJmfHcwWaiRo2Q0=
=y6XU
-----END PGP SIGNATURE-----

--F1Dhg2KrVTCkSmmT--


--===============3537163604013454348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3537163604013454348==--

