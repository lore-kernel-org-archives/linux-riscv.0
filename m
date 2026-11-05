Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF15606A32C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fk7tRE9M;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxlXOKrk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X6IwSBcnzOyg2vyG8M5fXVknInb6+7is7Hb+yB4UG84=; b=fk7tRE9MsGylGuaqUPkZ29mSOB
	eEmaLYpAri9jVGgMoBmRIHSmkyFtMSDsNEYZNpa0UPKcX91zQMxVO5fM4FIJt5tE9vwnR0oQfpLCg
	71DE0SpuIDhtosn09krVyrz7KMv2Uy1ws9XT+AFCFSUd87lYo1EvO3BM1NQLlfrzzZ6U2phj65ajP
	ZL4RBxjhktHxlR30S+SCOklrO5RWxFsagpmdBa/ooBGCMywHCTUCD14vcLoqs96wloy0kLrke3WiP
	z3UZwg0SQDm5Qi9a+S4o6WlWMxdERY3oXNjxipXxIBel8lqkCtjdxyPEwK36VXLc1XYYPSir7utY/
	8pRam0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP28X-0000000A7nK-240p;
	Thu, 05 Nov 2026 18:24:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP28U-0000000A7m1-1lk7
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:24:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5C7D415F3;
	Thu,  5 Nov 2026 18:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A5B1F000C1;
	Thu,  5 Nov 2026 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793903068;
	bh=ZtmUTz3ZwmwR9910+Kg+d/RgBwrT3NvRt16MrNazlP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fxlXOKrkd/ih8Okx46HxINwM6CuMC9k3XkFDcDWktB2Lvi9nC84OTal5TiE1jiJCp
	 zI+ZlKsoe+XNrq2L4yQ2abH/8wY8+3BQrGw/oMJ4DzUPxkb7Urt3Y6CcBP0pF0AaZ+
	 UCbnCWToAVwTuA/zW38iJp92W3eV77UJ4LB3qvPKBuQIN6Ck4OjmUaCpm27cTq0op4
	 4IlLdAcdf/7wJPFZX0nYfY0jSpRQbbGo/OOjlQMo09KlakorcwX+G4b/cFpocmlXaT
	 4g1ROKSN+zBA/p2YN/7Xf3RsZIMkm4X4CgQct9xhk425DhOOMaYSOdqCwn1Y9YXDQg
	 E0f2WAhQWgjRA==
Date: Thu, 5 Nov 2026 18:24:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: skip disabled device tree nodes
Message-ID: <20261105-igloo-stunt-534496ad0518@spud>
References: <20261028131939.1014720-2-thnkslprpt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261028131939.1014720-2-thnkslprpt@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5204002985433539982=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5204002985433539982==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CB43f/tqOHsA+9GK"
Content-Disposition: inline

--CB43f/tqOHsA+9GK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 03:19:40PM +0200, Avi Weiss wrote:
> sifive_ccache_init() uses of_find_matching_node_and_match(), which also
> returns nodes marked as disabled. The initializer can therefore map and
> access a cache controller that the device tree marks unavailable.
>=20
> Select the first available matching node before accessing its registers.
> This also handles a disabled node preceding an enabled one.
>=20
> Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller dr=
iver for SiFive SoCs")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/cache/sifive_ccache.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 71d3f94987fa..02878d54381d 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -297,7 +297,9 @@ static int __init sifive_ccache_init(void)
>  	unsigned long quirks __maybe_unused;
>  	int rc;
> =20
> -	np =3D of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
> +	for_each_matching_node_and_match(np, sifive_ccache_ids, &match)
> +		if (of_device_is_available(np))

Are there any devices where this is actually possible? IOW, where there
are 2 ccache instances.

> +			break;
>  	if (!np)
>  		return -ENODEV;
> =20
>=20
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> --=20
> 2.43.0
>=20

--CB43f/tqOHsA+9GK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauzJ2AAKCRB4tDGHoIJi
0k2GAQCcXeNVe+fj3emdZR6xh3IMUE1u8VOnB5po9AZY1Q89nwD+P9vlx+0j5LZa
m37bmmAThH5ypyTRJYeBgmL2YjUTwwk=
=Fl83
-----END PGP SIGNATURE-----

--CB43f/tqOHsA+9GK--


--===============5204002985433539982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5204002985433539982==--

