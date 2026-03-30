Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF9E1061B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 15:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFlouZQOoXgGeYu2AsRGKtbU+1IwoWEaA5rU7GusBws=; b=qyrlxf9yoV57pWp6IGCd85PNXi
	JrsPzdLUdMnU0VL7rC4mEgzRDKXjjoku0Dg6AHFzhhGc8CpZLiYZNoBo7D4TX/gSGAWbrgBRbOI8Z
	40rwMDaBfPmhaDM+ZxdrG9/ak0XtjJ7bbK05Pj1y729bphWIKQhMZ1MTnqVclKpsYSYadfQ9iRxm+
	ptWkcmBVDDgMkl4UE7V8GU/Ad4aES/zywW855QyLFRWo1iHZ0IlHabbK3LaE9syKqljBslgPRG1is
	rngP8KxM99eYXCd3v6PnAJsVqygYWE0opugyYIRS2I8kc2y5V9BkaBbcmPV5wtERcPr+cNL3gJPec
	rWzOVlcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EXd-0000000BZcQ-3ZOA;
	Mon, 30 Mar 2026 15:28:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EXb-0000000BZbV-0yK0
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 15:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDB1D41B2A;
	Mon, 30 Mar 2026 15:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FAEC4CEF7;
	Mon, 30 Mar 2026 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884513;
	bh=dLr9IE97aBjxPIZhRnEAOelMA8nPQc0RVFhTr/xWxPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hfifa7pnY2K1tvImhulbUDiK1T4gOO1GJcAE3Pn+c8i+77oOPUm8JsVWzHPa/uYqV
	 ShxtjGoRqocpdr6mloGB5CEIXTUuozuRzsAK60ivJ6mWrHJY/tzp6FroOMjQrdT8g/
	 1FUuOMoyBZOSDv7CBWHA3awV71KM8A+VbRhSy14eS1+IpQTyy+SVmp0ak9p/qtcl91
	 2eqYcYof0VmIAFslinhqAg7mX0X10RhvOWpL6GmH0AAr/5Nee7HIoGkv+P03Sn8wrp
	 q7vaFHZDaJw1Dw+3i+g2RMOgyH6M63UK6BJUZWN9QH5tIO/aezz+hdEvldgvvHfe5B
	 7tkUCKtC4CWhw==
Date: Mon, 30 Mar 2026 16:28:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Hui Min Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
	ben717@andestech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jonathan.cameron@huawei.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	tim609@andestech.com, alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 5/7] dt-bindings: cache: ax45mp-cache: rename
 ax45mp-cache to llcache
Message-ID: <20260330-depravity-rake-6a9745d03ea2@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-6-minachou@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20260330102724.1012470-6-minachou@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_082835_377989_B0868406 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Type: multipart/mixed; boundary="===============2845465953094794501=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2845465953094794501==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1YWh0I2nTEtlrVXn"
Content-Disposition: inline


--1YWh0I2nTEtlrVXn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 06:27:22PM +0800, Hui Min Mina Chou wrote:
> The AX45MP-specific cache binding is renamed to a generic Last Level
> Cache (LLC) schema, as the driver now supports more Andes CPU cores
> beyond just AX45MP.
>=20
> Updated compatible strings:
>   andestech,qilai-ax45mp-cache    -> andestech,qilai-llcache
>   renesas,r9a07g043f-ax45mp-cache -> renesas,r9a07g043f-llcache
>   andestech,ax45mp-cache          -> andestech,llcache
>=20
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
> ---
>  ...ache.yaml =3D> andestech,andes-llcache.yaml} | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>  rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.y=
aml =3D> andestech,andes-llcache.yaml} (76%)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cac=
he.yaml b/Documentation/devicetree/bindings/cache/andestech,andes-llcache.y=
aml
> similarity index 76%
> rename from Documentation/devicetree/bindings/cache/andestech,ax45mp-cach=
e.yaml
> rename to Documentation/devicetree/bindings/cache/andestech,andes-llcache=
=2Eyaml
> index b135ffa4ab6b..5b97625edd37 100644
> --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> +++ b/Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml
> @@ -2,17 +2,17 @@
>  # Copyright (C) 2023 Renesas Electronics Corp.
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> +$id: http://devicetree.org/schemas/cache/andestech,llcache.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Andestech AX45MP L2 Cache Controller
> +title: Andestech Last Level Cache Controller
> =20
>  maintainers:
>    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> =20
>  description:
> -  A level-2 cache (L2C) is used to improve the system performance by pro=
viding
> -  a large amount of cache line entries and reasonable access delays. The=
 L2C
> +  A last level cache (LLC) is used to improve the system performance by =
providing
> +  a large amount of cache line entries and reasonable access delays. The=
 LLC
>    is shared between cores, and a non-inclusive non-exclusive policy is u=
sed.
> =20
>  select:
> @@ -20,7 +20,7 @@ select:
>      compatible:
>        contains:
>          enum:
> -          - andestech,ax45mp-cache
> +          - andestech,llcache
> =20
>    required:
>      - compatible
> @@ -29,9 +29,9 @@ properties:
>    compatible:
>      items:
>        - enum:
> -          - andestech,qilai-ax45mp-cache
> -          - renesas,r9a07g043f-ax45mp-cache
> -      - const: andestech,ax45mp-cache
> +          - andestech,qilai-llcache
> +          - renesas,r9a07g043f-llcache
> +      - const: andestech,llcache
>        - const: cache

If you want to add a more generalied compatible to use as a fallback,
insert it underneath andestech,ax45mp-cache. andestech,llcache is far
too generic though, and there appears to be no user that isn't an ax45mp
now anyway, so not sure what this even gives us right now?

--1YWh0I2nTEtlrVXn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqWmwAKCRB4tDGHoIJi
0jvkAQDi3CN5vV+aStgwXt4oRcQkKYMfS2J7J2wKpU8a77p5lwD9HNxDpxInwC/9
il505Wz41Ck087E3pY8AsuYysAnXDAI=
=V7yC
-----END PGP SIGNATURE-----

--1YWh0I2nTEtlrVXn--


--===============2845465953094794501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2845465953094794501==--

