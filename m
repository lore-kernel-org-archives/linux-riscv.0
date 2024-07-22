Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ADFC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xM76jfs8HY14R5rtNLVVi+lmTve/V9n/6QXnb92OETg=; b=OBpvSpY/mWsOAtqQjWeGpI91GO
	LTbkdIsrQjVieU9yvP8RFAE++sJi3z3qRBpH2Cfzn8r3IekEq1Usk2pKV5DGBCyLCeFhTtiMSOHMQ
	6pbJH0VmCf95DVLx7KawStfHrM0G02c9D8FO3xUelRGI2V6r8wZGh1cU3S4/OB4woHXuc2TPju55d
	Kfca9xZmqf2wP1kzWgxK01rA9gg1sbZpqHKQNTyFl0renW9h/3Ji1VXw2KV8QCEkeTxXjsuQARj84
	ybheAS6wu+SYmYKbKCbaKeyqqoZcfd/jS4Av8E/+4iBt3qhvYFvPUVXQph7L5HCskVx+kXBQ4e19s
	fUhMzpTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVv2z-00000009yJI-23eB;
	Mon, 22 Jul 2024 15:33:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVv2c-00000009yBu-4BCF
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 15:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 817FCCE0B1A;
	Mon, 22 Jul 2024 15:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1110C4AF0D;
	Mon, 22 Jul 2024 15:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721662411;
	bh=15Imh+OFzFlYBfvRORKJOPtZf3LObeq4k/Ll32cYq4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTd8KjIaWTRL96o59+FTMyeXyVvmUaF9nKnGHDMki2C56igprhfGt1eiwhuEkFbvx
	 aOKoYJNFd6c1rscHvVfL7laDKIQJC/U2LOILLSCpE8eIEljrujsjBBSiBzlrtYJBP6
	 bZ8U3G42IHuVIm2NU6HZtF+MAA72WperKHnsyq5WHFh2AxErHO4IoAxUnW0oK1b7+K
	 Z9JFRNUNZ2AyLrAg/7UL1c1YOfXcuAmVgiM4qTTsKp467KIxrFdczOxyiQqSDD4Waq
	 g8Lw01OSoiej6hOnQNExlfTe0ZfTMyd2+KEMKKpTGqiMYtbiHh67XJ4CBCaEOMb5kQ
	 +O8wm+lC0Uynw==
Date: Mon, 22 Jul 2024 16:33:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: StarFive: Require a 64-bit system
Message-ID: <20240722-banter-balance-ead2d4bae7fd@spud>
References: <20240719163841.19018-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240719163841.19018-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_083335_253560_AB51EE86 
X-CRM114-Status: GOOD (  18.33  )
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
Content-Type: multipart/mixed; boundary="===============1981702225794363895=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1981702225794363895==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yYG3E7Nx1SPq8byV"
Content-Disposition: inline


--yYG3E7Nx1SPq8byV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 09:38:41AM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> This has a bunch of {read,write}q() calls, so it won't work on 32-bit
> systems.  I don't think there's any 32-bit StarFive systems, so for now
> just require 64-bit.
>=20
> Fixes: cabff60ca77d ("cache: Add StarFive StarLink cache management")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
if you wanna take it - might be worth being explicit about it causing
build issues for rv32 though.

Thanks,
Conor.

> ---
>  drivers/cache/Kconfig                   | 1 +
>  drivers/cache/starfive_starlink_cache.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 94abd8f632a7..db51386c663a 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -18,6 +18,7 @@ config STARFIVE_STARLINK_CACHE
>  	bool "StarFive StarLink Cache controller"
>  	depends on RISCV
>  	depends on ARCH_STARFIVE
> +	depends on 64BIT
>  	select RISCV_DMA_NONCOHERENT
>  	select RISCV_NONSTANDARD_CACHE_OPS
>  	help
> diff --git a/drivers/cache/starfive_starlink_cache.c b/drivers/cache/star=
five_starlink_cache.c
> index 24c7d078ca22..8ee9569771f8 100644
> --- a/drivers/cache/starfive_starlink_cache.c
> +++ b/drivers/cache/starfive_starlink_cache.c
> @@ -19,7 +19,7 @@
>  #define STARLINK_CACHE_FLUSH_CTL			0x10
>  #define STARLINK_CACHE_ALIGN				0x40
> =20
> -#define STARLINK_CACHE_ADDRESS_RANGE_MASK		GENMASK(39, 0)
> +#define STARLINK_CACHE_ADDRESS_RANGE_MASK		GENMASK(39ULL, 0)
>  #define STARLINK_CACHE_FLUSH_CTL_MODE_MASK		GENMASK(2, 1)
>  #define STARLINK_CACHE_FLUSH_CTL_ENABLE_MASK		BIT(0)
> =20
> --=20
> 2.45.2
>=20

--yYG3E7Nx1SPq8byV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp57xwAKCRB4tDGHoIJi
0vqIAPwOOL4UUdb9ZZeCON6xMr9PV+oapD+cvpcj0rCtKB45ZAD8CNWB7YjcBpxE
+RXtgZPtDU0aI+z8h284aB3cjZ8WVgE=
=rlR+
-----END PGP SIGNATURE-----

--yYG3E7Nx1SPq8byV--


--===============1981702225794363895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1981702225794363895==--

