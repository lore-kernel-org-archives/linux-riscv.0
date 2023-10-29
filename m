Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CAEC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brAcoYiOqA7UNuA4eA5GRu02U+QgXU8O87YLTH5v0CA=; b=kbkb9tGxZz06SRfQOLunX390sj
	ECYW3FHSDO+o9Ip4i66yhzOChgEdS0lrKrgDBkFbVMxzEuQF0febmR7EBhijZR3BvaLmVtSXXLrJU
	WsBevi82lYyKDfuEW0tXRqTSSQKUGDys0rpEZ4MzGdLw//pDNP9GBUnVrnEMWusgmzsTRWjc+xmcH
	yHxSJVvstSiNAvf3Nz4bA7YttL/yKClNmdCLHTUW4D5NXPIZHZQAvGaiONgYBSv24LLsV573s/Vqp
	8UjDH0DYA6+rpW+pcSxOuv2qKMXAHxFQQlQqnMPds0qbWrnXoLazlk5hQByQvs10oUqUBgruBDPhb
	cfYWaVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx7Aq-001pZS-2u;
	Sun, 29 Oct 2023 14:53:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx7Am-001pYz-2X
	for linux-riscv@lists.infradead.org;
	Sun, 29 Oct 2023 14:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4DF5CE10B9;
	Sun, 29 Oct 2023 14:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37787C433C8;
	Sun, 29 Oct 2023 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698591225;
	bh=B77paaWavuJBoV76+uT6kv3JeTujUuxIv7T2SkTKO1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0T5Ukdin8LJMZ70k7O9IyjSUqDJHhzJ5pTPTYGcwJk0p6dDRLeMRfxtRwkxYWJ0k
	 XtC6NZ4s3vGwbBc1FuTCr80pfBRYZcOgtPpZWSN6AQWJSxQoNrdKvGWbHFvKkOygfH
	 xs3eL+qwd99/qB5b/KaSHUT4tZsk1ZgTQiGsOxCdEEWX0fjM36TT2zswTyvBI6FrgG
	 zbjZ2tjs4kF7hUoql8akr2d949b8YbpTODf7aN1X6CiWiukBUmg8bWg/9RkE2PmkBG
	 YZyN0K1P7EMe3k0Kjr3yH4rBCP6U9OqTgZmHcfam24M2/3AMPDoz3aAHJSEr2iAU4q
	 v3sTeAvOngTuQ==
Date: Sun, 29 Oct 2023 14:53:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, apatel@ventanamicro.com,
	palmer@dabbelt.com, devicetree@vger.kernel.org,
	ajones@ventanamicro.com, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] dt-bindings: riscv: Document cbop-block-size
Message-ID: <20231029-kitten-provider-1602fa805c35@spud>
References: <20231029123500.739409-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231029123500.739409-1-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_075353_206594_574D6547 
X-CRM114-Status: GOOD (  19.01  )
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
Content-Type: multipart/mixed; boundary="===============5843563197328114699=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5843563197328114699==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tyFSOvf0FmUbRd4a"
Content-Disposition: inline


--tyFSOvf0FmUbRd4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Sun, Oct 29, 2023 at 09:35:00AM -0300, Daniel Henrique Barboza wrote:
> Following the examples of cbom-block-size and cboz-block-size,
> cbop-block-size is the cache size of Zicbop (cbo.prefetch) operations.
> The most common case is to have all cache block sizes to be the same
> size (e.g. profiles such as rva22u64 mandates a 64 bytes size for all
> cache operations), but there's no specification requirement for that,
> and an implementation can have different cache sizes for each operation.
>=20
> Cc: Rob Herring <robh@kernel.org>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Firstly, odd CC list. Please CC the output of get_maintainer.pl in the
future.

IIRC, I mentioned defining this to Drew when he was add zicboz, but he
didn't want to add it - although he seems to have asked you to document
this. Drew, change of heart or am I not remembering correctly?
I think he cited some interpretation of the spec from Andrei W that
implied the Zicbop size would be the same as one of the other ones, but
I cannot find that on lore atm.

If Drew's okay with it, then I am too, so a conditional
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 97e8441eda1c..1660b296f7de 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -78,6 +78,11 @@ properties:
>      description:
>        The blocksize in bytes for the Zicbom cache operations.
> =20
> +  riscv,cbop-block-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The blocksize in bytes for the Zicbop cache operations.
> +
>    riscv,cboz-block-size:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> --=20
> 2.41.0
>=20
>=20

--tyFSOvf0FmUbRd4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZT5x9QAKCRB4tDGHoIJi
0rHgAP9mMGabZ8oZuilD5QVEH/IQImiR4kJXJX509fCK4Q1LMAD/UKI0W9asmhs1
7+asQ3dMCGcWYy4rEQgKHcIWBXGInw4=
=j177
-----END PGP SIGNATURE-----

--tyFSOvf0FmUbRd4a--


--===============5843563197328114699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5843563197328114699==--

