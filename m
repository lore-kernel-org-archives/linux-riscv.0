Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88641E6ADF9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 21:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoLrR2eOt0vfx+TBVV8vZjY3QgFjgsRwsEmIxvvWMq8=; b=V9cy6X82QHZe5gg/DFnuL8CHIq
	ScNjpZjtwNrMaQJmy8+0rrkav/a/ZU0w8eBNUAPzbSZWKANVJOy0qfYflmDtlSGI9dxMGsiFCpJgO
	Ws5zPXhP3uv8fl9vVYESRgekpeaz9M3VhyKg7vEzawD6DoV6e6ebwQuKOw6eh7LAB6zQ38KHr483r
	B1e98Sst7neJe9vv0NiHvcRW4wNfLERm990v7s0AaTGZjGpgC4V1ivLom88juh3ki8nXgHBqXGqh9
	oGXYxOAxtWUtALaP2ThmSgyUuNMMP/FhWs8qloIDfXjOwrQ+kxiLvtsp2+z19aL+K7yQYYYu5nOiT
	qW8JA9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXnHj-0000000EB2N-48Dm;
	Mon, 22 Dec 2025 21:17:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXnHi-0000000EB20-0aa0
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 21:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3015E43AEC;
	Mon, 22 Dec 2025 21:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF833C4CEF1;
	Mon, 22 Dec 2025 21:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766438261;
	bh=GfY5s1jBkGPXNhoUhVc6wQFpoyh0UvGJ5YyvJZLCOU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HvrOQ6FDET9p406hSffOsoZvYWTj6v5TN/N2i4HCb/CTWVTnLjRppHqXHYq7U3nRu
	 tVoBFjZw5R60v+rGElR8NJjk1ZkPfGENW7HgJvll8x1HZDxXsVuSHvWl3VFhz/r+6l
	 Q3CwBUak5YyrBNanchDTVwCI3BIQy8/BFQ3E1icYkgfjxLPpbLxenbLXOiWmtIuX81
	 F7JxNLyvBo8yoF9/XqA01X6SmAresQnRV8pKbz4Gty80uMMlDv7gZURB403V7Kcmv7
	 F7OdgVDHIQSQ/3l57b5Ljl3QO4uYOhRKv1zzTpcEEcMIzlk+qcWJosqth23TVSWDVv
	 UzufiPLm68s9A==
Date: Mon, 22 Dec 2025 21:17:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
Message-ID: <20251222-stitch-preachy-3fab87fd6f0f@spud>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_131742_222585_3A51D09F 
X-CRM114-Status: GOOD (  20.22  )
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
Content-Type: multipart/mixed; boundary="===============2322778294692637957=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2322778294692637957==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ycfAa/SXC6QLLG2U"
Content-Disposition: inline


--ycfAa/SXC6QLLG2U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 09:04:17PM +0800, Guodong Xu wrote:
> Add description of the single-letter "B" extennsion for Bit Manipulation.
> B is mandatory for RVA23U64.
>=20
> The B extension is ratified in the 20240411 version of the unprivileged
> ISA specification. According to the ratified spec, "the B standard
> extension comprises instructions provided by the Zba, Zbb, and Zbs
> extensions.
>=20
> Hence add a schema check rule to enforce that B implies Zba, Zbb and Zbs.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>  .../devicetree/bindings/riscv/extensions.yaml         | 19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 565cb2cbb49b552959392810a9b731b43346a594..385e1deb23996d294e7662693=
f1257f910a6e129 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -109,6 +109,13 @@ properties:
>              The standard C extension for compressed instructions, as rat=
ified in
>              the 20191213 version of the unprivileged ISA specification.
> =20
> +        - const: b
> +          description:
> +            The standard B extension for bit manipulation instructions, =
as
> +            ratified in the 20240411 version of the unprivileged ISA
> +            specification. The B standard extension comprises instructio=
ns
> +            provided by the Zba, Zbb, and Zbs extensions.
> +
>          - const: v
>            description:
>              The standard V extension for vector operations, as ratified
> @@ -735,6 +742,18 @@ properties:
>          then:
>            contains:
>              const: f
> +      # b comprises the following extensions
> +      - if:
> +          contains:
> +            const: b

What's the value in adding b, if it depends on having all 3 of the
components defined individually too? Currently all "superset" types of
extensions are permitted without their component parts also being defined,
this doesn't follow convention and therefore needs to be explained.

You obviously need this construct because the kernel does not understand
"b", and even if you added support for interpreting "b" to the kernel
this is probably still needed to make sure the ABI is maintained for
anything importing a devicetree from the kernel.

> +        then:
> +          allOf:
> +            - contains:
> +                const: zba
> +            - contains:
> +                const: zbb
> +            - contains:
> +                const: zbs
>        # Zcb depends on Zca
>        - if:
>            contains:
>=20
> --=20
> 2.43.0
>=20

--ycfAa/SXC6QLLG2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUm1awAKCRB4tDGHoIJi
0vUSAP0fICE8zvMf7nKsGMB1PUziS2TeQFTUfBwL6F1gkBjJBgD9Hx+1K5//DD3s
nFLDmffVAL3rtA/B5gNBII8pxhYASwQ=
=bj2o
-----END PGP SIGNATURE-----

--ycfAa/SXC6QLLG2U--


--===============2322778294692637957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2322778294692637957==--

