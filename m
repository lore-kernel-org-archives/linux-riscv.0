Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE1606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zvX24X2y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gf3rGWJU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EjYuSrLe+OEoyIriA7ejf7JGtj72qR49XE/hxBpWXqE=; b=zvX24X2ynhcUeF/7HlUTLjbFWF
	mynFH/dmxrJj04JkZeU8BD3veVL3Filh19xDD9Wf0xF5df/1pZirety4ML91qyq3QH+WWnaUcJ1sN
	29ypiEAlkCxj3ahdp3thIQSddRaPK4+HiQCKimXaj1gBV+/hNpMv5dst2KELtrbK+kG6Uryn28eLT
	B7flK8nC/IwFq8fIhyU3rqD9uROdF+nohi0f5DScu87RQONG7Ip0/RQD/eVOYTNYNbCUT8AaxYflW
	ZgrXmCXmxisRP8Jw4u1RFbkjnuleqoMFoBqCsN5yQPW3764Dm/jvma34KwL8BedkQZ/eP9zgiftyd
	XUh1iv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVeD-0000000AEKs-02VI;
	Thu, 29 Oct 2026 19:18:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVeB-0000000AEKf-1b6D
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 19:18:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 50E65600DA;
	Thu, 29 Oct 2026 19:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A11C1F01824;
	Thu, 29 Oct 2026 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793301526;
	bh=ph8C1jmnpdrdeev4LCocOpai7bmb4a/dXqzWxHzIVz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gf3rGWJU5hbTZOexRbTZOJDmxHULJI5KXdcRKAlnfLmHqVHp9ZGY+dEmN25dhzEAl
	 3DEuSOE0mIwV8CyctydR6aiUqxOr9XHMH7VyF2VXTSZmFsNkHwUiEGyo/Vk8brWuD7
	 2HH1Utj+X9rzkIQtOPZBqQWXqugxM1exuPJRbHt8SycgJ74axOP/RiOmdoJGeWe+zF
	 hBIh2PFr8Jf+U/lG0ANzGDoHDUwPpZlQwjc22JnLMWY+Q1O4rTuJQaKOUWodAKpVeo
	 UUQI8rgTznnArkRPRZgSdHJT0tshbP3lJkbuHTHgwK4CqTVhjsO0omZdPWqpGjFea1
	 IsrJQJpFIHaeQ==
Date: Thu, 29 Oct 2026 19:18:38 +0000
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
Message-ID: <20261029-sequester-countable-6a7b597c2551@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-5-b736ee920078@gmail.com>
 <20261029-pouch-enunciate-e74cf84e42a7@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029-pouch-enunciate-e74cf84e42a7@spud>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8774869871292557996=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8774869871292557996==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oo1FlmzmZPb07xbS"
Content-Disposition: inline

--Oo1FlmzmZPb07xbS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 06:54:49PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:46AM -0400, Kwanghoon Son wrote:
> > Describe the UART register range, interrupt and baud clock input.
> > Initial Linux support targets the BL808 32-byte FIFO and reuses
> > Zephyr's bflb,uart compatible. UART3 is D0 PLIC source 20.
> >=20
> > Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/seri=
al/bflb,uart.html
> >=20
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > ---
> >  .../devicetree/bindings/serial/bflb,uart.yaml      | 57 ++++++++++++++=
++++++++
> >  1 file changed, 57 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/serial/bflb,uart.yaml b/=
Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..df29d258f0a1c6d7bb283cf=
19c4157436991b64b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/serial/bflb,uart.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Bouffalo Lab UART Controller
> > +
> > +description: |
> > +  UART IP used by Bouffalo Lab SoCs. Initial Linux support covers the
> > +  BL808 controller with a 32-byte FIFO. The compatible follows Zephyr.
> > +
> > +maintainers:
> > +  - Kwanghoon Son <asdfkwang@gmail.com>
> > +
> > +allOf:
> > +  - $ref: serial.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: bflb,uart
>=20
> This needs to be a device-specific compatible - please just use the
> binding already reviewed and agreed upon in Jisheng's 2023 series.
>=20
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Baud rate generator clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: baud
>=20
> Drop this clock name, with only one clock there's no more need for it
> than the interrupt-names or reg-names that you do not use either.

And additionally, I see no value in picking something to suit zephyr,
when zephyr uses things like "bflb,clock-controller" or "bflb,pwm-1" and
"bflb,pwm2" and so on. Make a clean break and do things correctly rather
than try (and fail) to be compatible with the zephyr dts.

>=20
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    uart3: serial@30002000 {
> > +        compatible =3D "bflb,uart";
> > +        reg =3D <0x30002000 0x1000>;
> > +        interrupts =3D <20 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&uart_baud>;
> > +        clock-names =3D "baud";
> > +    };
> > +...
> >=20
> > --=20
> > 2.47.3
> >=20



--Oo1FlmzmZPb07xbS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOcDQAKCRB4tDGHoIJi
0vgpAP0Ykz6jLYW3pZLrj+OXAuKEfEQ7s4+gO6k+C0dlr9qAfwD/Rk+Q3480s7KS
h4SKrbAvl0+aogP6ibLD6PeZLk0/vAc=
=kFab
-----END PGP SIGNATURE-----

--Oo1FlmzmZPb07xbS--


--===============8774869871292557996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8774869871292557996==--

