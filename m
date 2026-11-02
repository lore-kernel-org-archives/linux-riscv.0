Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EAA606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 19:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zhj6sexa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vk8EScHH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aaCh4TM7kee84lLOiJN6i7wvyeISQ9EOiSalW0rsS9Q=; b=Zhj6sexa8yUDULiISS7rfyvVzF
	i9oC6ErdIwJBiTRCUdCWUek/5u92Y7bLOYOSmb+uRQT8NGqSzoHJjuvcXmXYAzi4CZZtcqeslFeCF
	P0qriN8r4WCw1EtDC4ugG8W0tmYCFt8bGBS5Wx5gpM4XjsK9EUDvCOm6pCvyS0GOxS5knMxUmwEJz
	A9YSb4K1xr6BK3GcoyrA8zfJke35bKpdrrv97LVhwMdSfPkve68CVzVF+VKe5jW9fUuN4UYBDCdEX
	o4H67VZh4aAwaXvjkpSnLl6GuO17PNjB7YbYxPbocoIAg6/d0N7ys3b0D/CwlokA88NKhaw9RaehR
	nfYkEpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxdC-000000005gt-1vLb;
	Mon, 02 Nov 2026 19:23:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxdB-000000005gc-3I4r
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 19:23:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 742DA41A0E;
	Mon,  2 Nov 2026 19:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D2E1F00A16;
	Mon,  2 Nov 2026 19:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647425;
	bh=EwvMk+FvxyHkKynm6O8LyVDYXYAT5668MebC2DyFOqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vk8EScHH4BY0tv2o/GU5Nl90Wz0Al+tOJrBKf0Swgc5pqAkaU46RRlHsUL/GYHqYM
	 kGWsCIQzCgxX11emEjYGu+09Yb/kKLE7Yi9qR4OoigCIyvtJyGHxfwkaHKD/JNdY6T
	 Sl0LM4U6oDdhQ6RcjHFgMWOSwzYdNmFJXRs91RM/5R2bMAEbjd9TgoRMVF7BfBCs4y
	 jFDwoFYSS1+VR4pDZ8Q8AxF5IazJzKNMoqbj2UQZuVpJpjYpUzv6cWMr0H5D3T9JN2
	 xH6h2L2hh2khoEhVdKpxJve4UsM91o3xUdvHXLwHeBsfMWj3X4rChstUbT+lo5KsxR
	 i6DtVbZES/WSQ==
Date: Mon, 2 Nov 2026 19:23:40 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: riscv: add OpenHW Group CVA6 APU boards
Message-ID: <20261102-breeze-upstate-4d9b96db18aa@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-6-marouene.boubakri@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102141727.640769-6-marouene.boubakri@oss.nxp.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6649983117730315403=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6649983117730315403==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EzvXeiIbN3v5MlHk"
Content-Disposition: inline

--EzvXeiIbN3v5MlHk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 03:17:24PM +0100, marouene.boubakri@oss.nxp.com wro=
te:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>=20
> The CVA6 APU is the FPGA SoC built around the OpenHW Group CVA6 core in
> the CVA6 repository (corev_apu/fpga). Add the board compatible strings
> for its Digilent Genesys 2 builds with the 32-bit (cv32a6) and the
> 64-bit (cv64a6) configurations of the core.
>=20
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
>  .../bindings/riscv/openhwgroup.yaml           | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/openhwgroup.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/openhwgroup.yaml b/D=
ocumentation/devicetree/bindings/riscv/openhwgroup.yaml
> new file mode 100644
> index 0000000000..3bca66cad5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/openhwgroup.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/openhwgroup.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenHW Group SoC-based boards
> +
> +maintainers:
> +  - Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> +
> +description:
> +  OpenHW Group SoC-based boards. The CVA6 APU is the FPGA SoC built arou=
nd
> +  the CVA6 core in the CVA6 repository (corev_apu/fpga).
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: CVA6 APU on the Digilent Genesys 2 board
> +        items:
> +          - enum:
> +              - openhwgroup,cv32a6-genesys2
> +              - openhwgroup,cv64a6-genesys2
> +          - const: openhwgroup,cva6-apu

On riscv, the rule for platforms implemented on FPGAs is that they must
be strictly versioned and match with some clear and obvious release from
the vendor. In your case, this should be easy, because you have github
releases of the platform to match with.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +additionalProperties: true
> +
> +...
> --=20
> 2.43.0
>=20

--EzvXeiIbN3v5MlHk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujjPAAKCRB4tDGHoIJi
0nVwAP9AoxwPfhIeSgR5WU7RTWmZxKvataQAbsLxoHx97QlQ7AEAi8hMNBrVghJU
PZNzs81fYIhAJ8KZSqZQWSuC51Bk2gs=
=67u3
-----END PGP SIGNATURE-----

--EzvXeiIbN3v5MlHk--


--===============6649983117730315403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6649983117730315403==--

