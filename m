Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117F606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dQZdPuU+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BbV9vlqP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q2i7RYlxI6U5G3B9BrY/DV/WzV1X9TxR2JbR6FtRXOc=; b=dQZdPuU+qMebvdPoBDtJqvFgHy
	iHIn29r+TrLTA1+CUC0mRbSNjUAlizM9hBii6+5R9iLDIIV95EBtbBIrXT1url2atnrxZOUuXkdO8
	XQWqNnMP+/+aoFTBgmnQIDqsIajBcG4uieiBLrWegnAUcVYnQLOOE+HHjo7dmKK3Om5/4dkl0+O8m
	bzvPoyvlay19xn+EyIxHDMxFP5rF8e4B3bk7/n1rOQj83zdMw1o5KoTArLjfydkDIIxV7UfCThH0f
	fY3JeTd3J+s869WuZFuRsssDc7PS/BP2s39AVOmSZUwXKY5BLEyfQdxleV8FBcQAN2bx9CuKwOACX
	2DAS6+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxT6-000000004IU-20EF;
	Mon, 02 Nov 2026 19:13:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxT4-000000004IM-10rg
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 19:13:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6027860C02;
	Mon,  2 Nov 2026 19:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDF71F00A16;
	Mon,  2 Nov 2026 19:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646797;
	bh=U/h1dd9RoS+VuRtmXiCs9roaZurmiqV74QqfDLQStI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BbV9vlqPwHUPdm3kW82aAIDSi8ejiJRNqBag8HwRiWmVd4S91ELHY7pDEr/S0c+99
	 YNrEOOKQCsyjJ6cml804uLD62Yi0QhWRV/TYNOT7yYxJGSUAz3ZzL1JdLdTrKAq6kd
	 U0WNSqzovG8M0bFQJW1cFlcx2J8rSfsWiH1V/sbXfsb3brf7r1T16eCvA3DZki/2HC
	 teKYbdm8OeofGO3BH22uE9TAdy6p01Ggqq4VPXDH0QI2IFpos3+0M8seWuO4xlesfB
	 lKloEkNVdz0k/rzlFbI6PDHoeI/Xcyyq8HWziUkxi5X+342G+rzItranW4v4bx7P92
	 q/XoB7ZOstFbA==
Date: Mon, 2 Nov 2026 19:13:12 +0000
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
Subject: Re: [PATCH 1/8] dt-bindings: vendor-prefixes: add OpenHW Group
Message-ID: <20261102-imprint-kindred-1c2d1a636a15@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-2-marouene.boubakri@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102141727.640769-2-marouene.boubakri@oss.nxp.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2934575328847316187=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2934575328847316187==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1nuoCU+yS2icvDHP"
Content-Disposition: inline

--1nuoCU+yS2icvDHP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 03:17:20PM +0100, marouene.boubakri@oss.nxp.com wro=
te:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>=20
> The OpenHW Group (https://www.openhwgroup.org) maintains the CORE-V
> family of open source RISC-V cores, including the CVA6 application
> class core and the CVA6 APU FPGA platform built around it.
>=20
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba20029693..82440d498d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1263,6 +1263,8 @@ patternProperties:
>      description: OpenCores.org
>    "^openembed,.*":
>      description: OpenEmbed
> +  "^openhwgroup,.*":
> +    description: OpenHW Group
>    "^openpandora,.*":
>      description: OpenPandora GmbH
>    "^openrisc,.*":
> --=20
> 2.43.0
>=20

--1nuoCU+yS2icvDHP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujgyAAKCRB4tDGHoIJi
0vdPAP9HJoZqHVETh6lvXFfQoqSezjaYtfGhm7AC26W3DnTZcwD/cOaOSLOxduk6
7uPL0h7O5luDzGQha9AH9mL4jd0jRwg=
=jKds
-----END PGP SIGNATURE-----

--1nuoCU+yS2icvDHP--


--===============2934575328847316187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2934575328847316187==--

