Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5777CD13DA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 19:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aS7pDIAbhOhO3FGvEsFSij6mksDJkC9FNUpTHXW6JFs=; b=DeLQ/lvjr/uQWdr2yK7FVY6cdN
	gVD8nD5OPL2YfP8V1hOLVeuHEsVqO1Le1n9R3iOxg2EpI9TSsBzH/sWkrv3Utl0NjGBoWVHKaGClM
	fo8LpOpgo1DHZWkFXNi6uX1a6aIq5BtysHMzAJ0VxXYVuLXY7I0wAjNgNXaqVvsKWTQbgUSqi5qgC
	R5oGIgC7I0t/XLHgrcabAhrFCaAqksazlnW+LxWzHW5r7x4kRSeGBWqFu9Em4NjFujfTC4eNh3lDW
	SIJaYM6t+jA/cU3FtGTunsrqnqTl8Tv4sVaFIxaJ0/q/mhb6bnb/ifNxa/ALOt8Cp+pF4KzKcu37h
	mJ9RniXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWpq-00000005ryI-01u8;
	Thu, 30 Apr 2026 19:14:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWpm-00000005rxX-1Mb9
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 19:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7AA5441D6;
	Thu, 30 Apr 2026 19:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04470C2BCB3;
	Thu, 30 Apr 2026 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777576441;
	bh=tO9222P2XCcdDssvF5Leobc2AmmtM1cHlctc/r09V6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0fDgqkfnobv3nu5Y7xU42v5a9/Xps5sd6i7oNHF3UbA9MNz4w3rZVwsPev/XCEaO
	 MjVlJTXe2P0y/BfhTXW+IatFci3q8ZphaKBg8t0Xjx4KK8ZmOWusritwKUrkRgvwLm
	 y6yj/XxgMioVD0AlD/zjoAXFsLxqwxjD6YzmQ272Wo0OzXcV5PIR50+i3Ce6OXkdOv
	 u3nz5au0/8JIZUBhxtf7Lnv5PuLWm43bzxF3FxH3ckMw81uyh8mDzlqxUsC8I+iuHU
	 q9gnoWRyA3fEuv53A6gotTAqerAvFdFatepUydSb3mKa8frq9MLX3mgCwFbfUZCKLh
	 XKplszh3hKA6Q==
Date: Thu, 30 Apr 2026 20:13:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Dominique Belhachemi <domibel@debian.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: Add StarFive JH7110 SoC support
Message-ID: <20260430-celibacy-semifinal-db18fc2fe553@spud>
References: <20260430035259.3402954-1-domibel@debian.org>
MIME-Version: 1.0
In-Reply-To: <20260430035259.3402954-1-domibel@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_121402_993581_64878C0B 
X-CRM114-Status: GOOD (  17.11  )
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
Content-Type: multipart/mixed; boundary="===============8650800344327127996=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8650800344327127996==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XDlUZPfitVSZRGpY"
Content-Disposition: inline


--XDlUZPfitVSZRGpY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 03:52:59AM +0000, Dominique Belhachemi wrote:
> This cache controller is also used on the StarFive JH7110 SoC. It does
> not have the data-uncorrectable ECC quirk that JH7100 has, so only
> QUIRK_NONSTANDARD_CACHE_OPS is set.

What's the motivation for enabling the nonstandard cache ops here?
The driver already binds with the generic sifive compatible on this
platform, and there's no peripherals currently supported on this
platform that need non-coherent DMA.

>=20
> Signed-off-by: Dominique Belhachemi <domibel@debian.org>
> ---
>  drivers/cache/sifive_ccache.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index a86800b123b9..2acb8bdf06d5 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -124,6 +124,8 @@ static const struct of_device_id sifive_ccache_ids[] =
=3D {
>  	{ .compatible =3D "sifive,fu740-c000-ccache" },
>  	{ .compatible =3D "starfive,jh7100-ccache",
>  	  .data =3D (void *)(QUIRK_NONSTANDARD_CACHE_OPS | QUIRK_BROKEN_DATA_UN=
CORR) },
> +	{ .compatible =3D "starfive,jh7110-ccache",
> +	  .data =3D (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
>  	{ .compatible =3D "sifive,ccache0" },
>  	{ /* end of table */ }
>  };
> --=20
> 2.53.0
>=20

--XDlUZPfitVSZRGpY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafOp9QAKCRB4tDGHoIJi
0qMnAP4oqhfACHixRWZZQs+LKjPTc/Bj+NO4iynB0vEmvOAm+wEAsLlB7LLO4r1o
MPzkWxGek1jevcKe3HA6PYlZgZs8LQE=
=DH2q
-----END PGP SIGNATURE-----

--XDlUZPfitVSZRGpY--


--===============8650800344327127996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8650800344327127996==--

