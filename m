Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD37C606A324
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kXVktlZd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irgHetGI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P+TFd1Jay8qW0/voypbqiwnTRUoq4oXGebl7vzdfL5Y=; b=kXVktlZdkYYsNb9AkoRGRqPVjD
	pbmIckBWGNFHYwZT+xBlibVWRNI5RWi49JQkQE6xbf36KM/IIqRYJaNxiiL5i10s7QolwOwhiz4gz
	lWoT1CxVUKeejkqGyh8nT74K7bSgvXXsjL1+0bZ7LTnBi2zuxU5pwuaphVrmlOjxnXmbh++Hh5Pth
	XF+trPQRC3409DLUschpY/z+3Tm/0f6weqzARr/98Q3Qt2a4s4ylxEH/Uvzgh8DQvxUf77yNAqAaR
	BG40kMeZbFHqluyFDHcqBXGWB7EI7G/ERXnOgfsOT9bXeSEf3JR/BDrAL+ULkzNaOt1L1r6v0WwgY
	trDKKzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW91-0000000AHMo-29lM;
	Thu, 29 Oct 2026 19:50:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW8z-0000000AHMO-20WR;
	Thu, 29 Oct 2026 19:50:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6C12600DA;
	Thu, 29 Oct 2026 19:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806841F01816;
	Thu, 29 Oct 2026 19:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793303436;
	bh=c0VuI2Veyo+JRtSrCAcVeS3CX/ZAsYeS6ljLG3SOqDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=irgHetGIrvCd5kwq/QQ/Vq/nV/bg4ecvzr2mWJMzdMpDIyvLKpLi2himFIVdrt4kI
	 M5q2L+f0taP7diWMrMYR0ZBn3pcv37Or1ltiyMBJQNTpOXr937yPRKcwpp3R5M5CQg
	 GBbYY0orepwUDQfTumx2i0UVNVsDHuuzwtOun3Q321/l6If6Z9p6AZJTPnfTVpLD2B
	 5NcdQzJJZvNoNaQaPZVR+LMcvpqWkj7ThLpZ0OGNLO9GiFKCBixRrWKwkwASVDJ5O4
	 xo2Agdz5Kxi+/y5a2cEcDPiQRkyzQZoLHgW/bkgPc9Oa3q93hBnsnqCRcaERcl6wIf
	 iZaL1otjPAJjw==
Date: Thu, 29 Oct 2026 19:50:27 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Subject: Re: [PATCH RFC 04/18] dt-bindings: mailbox: add the A210 AP to E902
 doorbell
Message-ID: <20261029-mannish-levitate-d4a1d780f949@spud>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-4-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261027-a210-scmi-v1-4-74d58ce85bd8@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Drew Fustini <fustini@kernel.org>, Radu Rendec <radu@rendec.net>, Yao Zi <me@ziyao.cc>, Paul Walmsley <paul.walmsley@sifive.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-serial@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Paul Walmsley <pjw@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============2324328186893623250=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2324328186893623250==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7TyiCWuFggz3NMfa"
Content-Disposition: inline

--7TyiCWuFggz3NMfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:36:55PM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Describe the AP doorbell and optional endpoint clocks. Firmware may keep
> the clocks enabled before the SCMI transport is available. An optional
> E902 to AP data bank identifies a second, receive-only notification
> channel sharing the doorbell interrupt.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../bindings/mailbox/zhihe,a210-ap-mailbox.yaml    | 76 ++++++++++++++++=
++++++
>  1 file changed, 76 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/zhihe,a210-ap-mail=
box.yaml b/Documentation/devicetree/bindings/mailbox/zhihe,a210-ap-mailbox.=
yaml
> new file mode 100644
> index 000000000000..4541750223eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/zhihe,a210-ap-mailbox.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/zhihe,a210-ap-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Zhihe A210 application processor to E902 doorbell
> +
> +maintainers:
> +  - Han Gao <gaohan@iscas.ac.cn>
> +
> +description: |
> +  The A210 exposes a bidirectional notification channel between the
> +  application processors and E902 firmware. Payloads and transaction
> +  completion are managed by the client using shared memory. The firmware
> +  initializes the remote endpoint before the application processor binds.
> +  When firmware manages the endpoint clocks and keeps them running, omit
> +  clocks and clock-names to avoid a dependency on services using this ma=
ilbox.
> +
> +properties:
> +  compatible:
> +    const: zhihe,a210-ap-mailbox
> +  reg:
> +    minItems: 2
> +    items:
> +      - description: Application processor interrupt status and control
> +      - description: Remote E902 notification channel
> +      - description:
> +          E902 to application processor channel data, which identifies t=
he
> +          channel that raised the shared interrupt

Why is the number of elements ever variable?

> +  reg-names:
> +    minItems: 2
> +    items:
> +      - const: interrupt
> +      - const: tx
> +      - const: rx
> +  interrupts:
> +    maxItems: 1
> +  clocks:
> +    items:
> +      - description: Application processor mailbox clock
> +      - description: E902 mailbox clock
> +  clock-names:
> +    items:
> +      - const: local
> +      - const: remote
> +  '#mbox-cells':
> +    const: 1
> +    description: |
> +      Channel index. Channel 0 carries requests to E902 and their comple=
tion.
> +      Channel 1 receives E902 notifications and requires the rx region.

Whitespace is missing here generally, a blank line between properties
please.
pw-bot: changes-requested

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - '#mbox-cells'
> +
> +additionalProperties: false
> +
> +dependentRequired:
> +  clocks: [clock-names]
> +  clock-names: [clocks]
> +
> +examples:
> +  - |
> +    mailbox@321000 {
> +        compatible =3D "zhihe,a210-ap-mailbox";
> +        reg =3D <0x321000 0x1000>, <0x311000 0x1000>, <0x320000 0x1000>;
> +        reg-names =3D "interrupt", "tx", "rx";
> +        clocks =3D <&clk 0>, <&clk 1>;
> +        clock-names =3D "local", "remote";
> +        #mbox-cells =3D <1>;
> +        interrupts =3D <336 4>;
> +    };
>=20
> --=20
> 2.55.0
>=20
>=20

--7TyiCWuFggz3NMfa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOjgwAKCRB4tDGHoIJi
0ht8AQD7ArK5WVgUv3a70cq5xiO/p/W7d4mBqnyobSVpyyiljgEAmuu3o32sYzON
A24NeuZF+yZakkViR8FkYVgSqESWaAE=
=lqKL
-----END PGP SIGNATURE-----

--7TyiCWuFggz3NMfa--


--===============2324328186893623250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2324328186893623250==--

