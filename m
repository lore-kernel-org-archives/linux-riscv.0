Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A1C3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 15:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfngfLWjLfgT5uK/4V8RhHZgpi2GKze87/YvikSwfXA=; b=AndRqRh2zq839C1AdMX9VimbEa
	BOLqkVhyehZG4nHXrn69cYHp5SerTmYmFId5/aBudq8TObKcNb4CQWb2DchFgvNsQyVHEZlAqbUeI
	+Btrc3BBoc+OIxmDkchSMoQHa9tCwhS9smaxwPSCMuuDxuOAiwphj2cJZ7UTjJ4+ZiLUhtXCRalCS
	eIHYT6NwLTzUUji+7EAwvTY6idX2UAPaVpU/OhMRg84sC/T4Ax9FK5GoyHxbZXem1Kwq0NxpVeNEn
	mxUID8UObSZiVWbIp7N5R8LyZIsqOtIuhFcPqj+NVJpZDR77WHi7F+zp8pF5D4ALGSetwB1FyCzy5
	SPHMs9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVv5j-00000009yhp-25KV;
	Mon, 22 Jul 2024 15:36:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVv5V-00000009yfB-3vdq
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 15:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 41F67CE0B26;
	Mon, 22 Jul 2024 15:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57A3C116B1;
	Mon, 22 Jul 2024 15:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721662591;
	bh=c8XJUKVipzgG6bshh67IQzibzrmFTB9DjTJesJCKQU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HcYB0Q7PYhoYQOalscTo9Z2t2Jzzb+QUwxd0+W28AkLJveb5bzS9mhD8o4N9tunBl
	 UR5Qu6N0SVOAcri/6B5XQb70robfoLrcNC35irosf7CH6YhU4ZCe+aUlZNo5d7k2Fg
	 bLCiWqCBUNTtg1+/SkZCCp3pq4D/yNUIMHQ15eQ2DBDVaKa02Rs7FtfUYrwuRQJEvU
	 jALuHmvMbpqFcDTFg8ksKsamLhBzauFLH8oMI9XC5vVO1ueA1BDf+KZMY7DQMJtqYm
	 f2bNUp+zsR5mqMqY8xds1+MaweuvDOtXDbGUm4Vqfl71t+n3zQ9ILWh85oa/7F5DvU
	 XKIEmmQGB/GKg==
Date: Mon, 22 Jul 2024 16:36:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: StarFive: Require a 64-bit system
Message-ID: <20240722-audible-stopwatch-d3f45920991c@spud>
References: <20240719163841.19018-1-palmer@rivosinc.com>
 <20240722-banter-balance-ead2d4bae7fd@spud>
MIME-Version: 1.0
In-Reply-To: <20240722-banter-balance-ead2d4bae7fd@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_083634_174053_B10243A4 
X-CRM114-Status: GOOD (  22.37  )
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
Content-Type: multipart/mixed; boundary="===============7659008122964759173=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7659008122964759173==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n6QJBe2aH/xjIHwA"
Content-Disposition: inline


--n6QJBe2aH/xjIHwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 04:33:27PM +0100, Conor Dooley wrote:
> On Fri, Jul 19, 2024 at 09:38:41AM -0700, Palmer Dabbelt wrote:
> > From: Palmer Dabbelt <palmer@rivosinc.com>
> >=20
> > This has a bunch of {read,write}q() calls, so it won't work on 32-bit
> > systems.  I don't think there's any 32-bit StarFive systems, so for now
> > just require 64-bit.
> >=20
> > Fixes: cabff60ca77d ("cache: Add StarFive StarLink cache management")
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> if you wanna take it - might be worth being explicit about it causing
> build issues for rv32 though.
>=20
> > ---
> >  drivers/cache/Kconfig                   | 1 +
> >  drivers/cache/starfive_starlink_cache.c | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> > index 94abd8f632a7..db51386c663a 100644
> > --- a/drivers/cache/Kconfig
> > +++ b/drivers/cache/Kconfig
> > @@ -18,6 +18,7 @@ config STARFIVE_STARLINK_CACHE
> >  	bool "StarFive StarLink Cache controller"
> >  	depends on RISCV
> >  	depends on ARCH_STARFIVE
> > +	depends on 64BIT
> >  	select RISCV_DMA_NONCOHERENT
> >  	select RISCV_NONSTANDARD_CACHE_OPS
> >  	help
> > diff --git a/drivers/cache/starfive_starlink_cache.c b/drivers/cache/st=
arfive_starlink_cache.c
> > index 24c7d078ca22..8ee9569771f8 100644
> > --- a/drivers/cache/starfive_starlink_cache.c
> > +++ b/drivers/cache/starfive_starlink_cache.c
> > @@ -19,7 +19,7 @@
> >  #define STARLINK_CACHE_FLUSH_CTL			0x10
> >  #define STARLINK_CACHE_ALIGN				0x40
> > =20
> > -#define STARLINK_CACHE_ADDRESS_RANGE_MASK		GENMASK(39, 0)
> > +#define STARLINK_CACHE_ADDRESS_RANGE_MASK		GENMASK(39ULL, 0)

Actually, Emil pointed out on IRC that this looks wrong. Should probably
be GENMASK_ULL(39, 0), not GENMASK(39ULL, 0)



--n6QJBe2aH/xjIHwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp58fAAKCRB4tDGHoIJi
0rGDAP9YAE/K5up87c62L88UahOr9K6q0vu4D0I6JD+zYMEkAgEA+SctjzzOCIrn
vHJwoYoORNBsXuX8hIG/EqOc9zSfXQ8=
=ZoRM
-----END PGP SIGNATURE-----

--n6QJBe2aH/xjIHwA--


--===============7659008122964759173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7659008122964759173==--

