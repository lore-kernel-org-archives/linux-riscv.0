Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255F606A32F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cRSL7Qeq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XrP6fJQb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tbrQo1n19e2lESvFOAH4cjPXac0gGhnXQeCQfXzsdb8=; b=cRSL7QeqOZplbarxFB542tIopr
	1KwLFLFVw4FtkgnLeulGOxC2gP55aAB2XhOspM3BI5vaoJgZp5Kkfc1+B3FqN4wyjppBDQ3zgXhhL
	cfz5LpNq7oQuv5zLhX3p6LX69p5lMYULfo4HtTZyTdoaHVuZH88fR6iSyCAnCrDXmbg0OCUvUGxxX
	gXsTVaRmx7K7QD+G9fwVAkM6YdyNBWB5CcDbxR+ZKl7w0EdSF0+TIgoISrqScogxCtc6TvabegGqV
	9mVfDBDdA50pBDn8sXiJmYK2ub5gy8b4F3DurNpjHwI2mN7IHVlqaS4Z/Ccxv3FPkuCiIs5+Evqg9
	aTziR+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMLR-00000003ltA-11xS;
	Tue, 03 Nov 2026 21:47:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMLQ-00000003lsp-0aWt
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 21:47:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1693415F5;
	Tue,  3 Nov 2026 21:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4F11F000C1;
	Tue,  3 Nov 2026 21:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742423;
	bh=0qIMVRakx8MFE3+X6O+uiOk2xUDzs4Y5tphV+i06Ud4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XrP6fJQbEMevUrTsydlsPVLlGv7HAoO5QaCj+GegM3+0hNUUNIvkkgdh9OZKQQ09y
	 OO1k2l2GiX67dVfoedyKZyy9szczuqj4MY3shuEtW5aet2pHS9lmQ5d2C7jyor97OV
	 aW2WEyv7Ikv6cjwXNLJIRowhq9j0Z/o+zDu04dy95467Oxc2bxUBOpW72mvR3jI/iy
	 ysYWG1U1WD6bgirOIg9FO4C8jT8wd3r3hdvjx8wtdrfCZAc/Iph+jEjFKf6OpznsYy
	 xQZuCCcJ3CuSU4dS5nfnMbJ4vPWa3ZXerB6XO7DuLo/DqZqnGlLZqOGyhAxYA5TAKV
	 sd3Vh7apqLXCg==
Date: Tue, 3 Nov 2026 21:46:57 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: riscv: cpus: add gf,mips-p8700
Message-ID: <20261103-synapse-posing-06a06f09a9cc@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-2-3ac5d49f2c37@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103-p8700-dts-v2-2-3ac5d49f2c37@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1077964124119691518=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1077964124119691518==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MZmL+98OJ3neLu75"
Content-Disposition: inline

--MZmL+98OJ3neLu75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:11:26PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the MIPS P8700 compatible.

Same comment here.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 0da219ae6769767a9b7f41f179a3559ae7160d69..c7f1cf1db6eef5b25403d53bc=
a7cffd9bc1f2240 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -48,6 +48,7 @@ properties:
>                - amd,mbv64
>                - andestech,ax45mp
>                - canaan,k210
> +              - gf,mips-p8700
>                - nuclei,ux900
>                - sifive,bullet0
>                - sifive,e5
>=20
> --=20
> 2.43.0
>=20
>=20

--MZmL+98OJ3neLu75
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupWUQAKCRB4tDGHoIJi
0jzdAP0QRFUSXCqY5Bx3PwIkHe8G4jQ4n++qQHiyt4ZrvklGjwEAq/J4pFCTTSSY
OkWYe1RQ1q9IRpH+0wlrFRb7J/wsbQQ=
=iO2t
-----END PGP SIGNATURE-----

--MZmL+98OJ3neLu75--


--===============1077964124119691518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1077964124119691518==--

