Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAD2C47258
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 18:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqBEColG3uUGJRJCSZCJ13unpB95MeJcX3t3zodORi0=; b=lKRnspKzaKvbW2oMcqgyVwQ9hf
	jUErO60CenWmJ0+RuXJgRshTTmKHx+0/wzcoLrDconxpHWC2svTUx5hC71Kg9zBjdRtBYrwELrnK+
	oQ3KzpvwhpcjkLy3GISavHB4+kzq8+Kz95THeNiq9ggM5Y0A0GIC/D1kYTcjXOu16Ya+EuANXUHrW
	eht/8JZMH+u2GNBEhADSrS/IYFKRlShSuVZNz8wdAV0gUuQD37VIO+FARk0hu6rTTfpHoL0DffYOK
	ZhMPYVnlEMmELxiiHj4ptQ6ond5pW8da8yzN1VwgGHJbQdSmOFicOFkQWJtwldFFw7/fzCo2VknNl
	4W70EIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU9m2-0000000ADVJ-0UXo;
	Sun, 28 Jan 2024 18:20:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU9lz-0000000ADUk-1b3G
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 18:20:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B00B361BAC;
	Sun, 28 Jan 2024 18:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E69EC433F1;
	Sun, 28 Jan 2024 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706466050;
	bh=/EDJ9bPZKL6/KP5P7C3TliaYe+1owN1nZgWeE1J7WBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAsPL0lAQCw74SQy+jYwS6G5zWkRkNkYsGE5/qlePSLZMp6mJCJGd4klmM3QCx/gW
	 nz3nDvPAvxhP2u6qsZPq5XdOAX6krXiZaQCecF/NbA+NkgMiGOo86gF1GHPCLKc7S6
	 Z73hl2Ku4eC5w1uyJBMofScDirpuaetbM1ZTJ1r8O5uHArG6ZEfTw5NnXqu7BY7R4P
	 dMEZueYdG5srJjtd5J2wht/7PIYg/04LGo8XWxqCschJxvw02kfh9CyIEjyTyaHwRg
	 l6s+03XlLCYvKlnZvvnhCJcM0v/Z/Wc6UUP22E3JJ8AYFCz5I/M+T0GN6bjSpeNeUc
	 GaUtE7ozOVldg==
Date: Sun, 28 Jan 2024 18:20:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: riscv: cpus: reg matches hart ID
Message-ID: <20240128-simile-endocrine-9e8af979d361@spud>
References: <20240128180621.85686-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20240128180621.85686-1-heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_102051_508656_8E53EE2E 
X-CRM114-Status: GOOD (  14.66  )
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
Content-Type: multipart/mixed; boundary="===============6944350016228230326=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6944350016228230326==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NKcSv7G0/mXgkSng"
Content-Disposition: inline


--NKcSv7G0/mXgkSng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 07:06:21PM +0100, Heinrich Schuchardt wrote:
> Add a description to the CPU reg property to clarify that
> the reg property must match the hart ID.

That is the expected usage alright. Did you come across something where
it was not being used in that way?

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index f392e367d673..fa9da59d9316 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -74,6 +74,10 @@ properties:
>        - riscv,sv57
>        - riscv,none
> =20
> +  reg:
> +    description:
> +      The hart ID of this CPU node.
> +
>    riscv,cbom-block-size:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> --=20
> 2.43.0
>=20

--NKcSv7G0/mXgkSng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbaa/gAKCRB4tDGHoIJi
0oSVAP9orjnFbFNcVF/CMAf/Z7LSEnENkf2VgiqS+fQSrBNA2AEAuYDxybBQO7rx
W1n4LVgR0qVah3M+242qdzT9vbg9RgM=
=t3Zf
-----END PGP SIGNATURE-----

--NKcSv7G0/mXgkSng--


--===============6944350016228230326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6944350016228230326==--

