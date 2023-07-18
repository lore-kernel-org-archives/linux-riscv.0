Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4069C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2xmIb0Jh/b9MyYaGKIzlwuxtnX5hqX9A/mfkazE5rw=; b=J5BRLaWsMgg9n4NNi5ZSBzDSwk
	fwFzbP6c4eJnC11t/J9Z2ZMPDLaehUQf2EXbqEYfOPIqAq5M7ujK/br5xz1kDIgQaPVury9o+EnrV
	fxVCbe3gHwGw4srfHYX98OiPMAvOJgtjJrS0M9C1wuzJd/eIDQgoD4U3Z7irvG9FIXElHffzGBALf
	QQnppsL3ksGuJcnS6ehw+iGqZ1yi3ZyldKIvKDTiTbldQNkzyf3czTgt1wbEuGDkzRFtJ2soCqKs1
	esEsXq6MEf9iaILwa2BgqcB13iaAXFw7qSia9+a3Ko7hzPYosaLOsLbFWpYgH8HIC5Niq1ip6kwTr
	pCAtyTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM178-005zP1-1a;
	Wed, 19 Jul 2023 06:56:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM171-005zIC-2E
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ac+IZGhK/LfC59pAhnqYMsO3nWtpTw/81ml/Yo0vHpI=; b=YTVRfERZuXX3GvVPPzzRW9zsQL
	+iC5rqbzN6TfmlQ1+1LAPVW2VPws7/wWUh4lBe0zBZ2tfbr6e1tnVpFC+Y2plNpFZsCobsPAwDfz4
	hPnZAUX9MVjxx87p1hwZBgfbJSXI/yLcvFoKalRX4gIYqKrUlfiwIX8pTu6UHw0Ki/bZt+M6S7ExR
	dY2AYWlgfaep18W3DOvT2SM2XYTqdAZBO3BGLRMmv0S5VGaYjTXCDddXT1Ro8aoDtVi8l5c7s9YDn
	bzTS/sv9E+c/T9wC5/hjRO86YTDTqLFs8cZep7ed+g/MsrYoXScGZggUfsYMwHCc98mRYy11siT/M
	q1/AJZqg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhsf-00BPNi-1S
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 10:24:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D7AB614FD;
	Tue, 18 Jul 2023 10:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE33C433C8;
	Tue, 18 Jul 2023 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689675834;
	bh=KVnXnhr7240E++pNIqUU7VhBqqkwwFZpVa77Qo9jFUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV1nKPq+kFRc0jN95sl/B7jhJsb01Jjyx8PzBYFS6N5GRjr+jbhzVU5sG3Q9yzBup
	 pLpyRtFp7b9WG/FYaPXlKsXXgJ3chlwx2qGQQqy5//VbaZNZRHdDXGcYU74/edNB6N
	 VfM93kzoUm7GBy1tv37VUTvNyKRwM9c/CBTfz7/MLMbRBQJomhdY4fvB9wCIq3gFEU
	 cXQQalMImJOiMi9ixKwCTNgdHEaeoCEL6YiEOQHTYQhG8KpgtsxuTHtYQ2+r1t3+xP
	 092rQ9xMVQCCjru/O3zxfsTUWBBer8mQlSo/ma2flA9CnHbb2IsloMLXHx4BHwUZT/
	 P96ZAerxNg27Q==
Date: Tue, 18 Jul 2023 11:23:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: allow kmalloc() caches aligned to the
 smallest value
Message-ID: <20230718-brook-engross-1e7c273facdb@spud>
References: <20230716165147.1897-1-jszhang@kernel.org>
 <20230716165147.1897-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230716165147.1897-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_112434_373617_6333D9FB 
X-CRM114-Status: GOOD (  35.59  )
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
Content-Type: multipart/mixed; boundary="===============7062546973069175912=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7062546973069175912==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ukHnNSShkeJEQlWy"
Content-Disposition: inline


--ukHnNSShkeJEQlWy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Mon, Jul 17, 2023 at 12:51:46AM +0800, Jisheng Zhang wrote:
> Currently, riscv defines ARCH_DMA_MINALIGN as L1_CACHE_BYTES, I.E
> 64Bytes, if CONFIG_RISCV_DMA_NONCOHERENT=3Dy. To support unified kernel
> Image, usually we have to enable CONFIG_RISCV_DMA_NONCOHERENT, thus
> it brings some bad effects to coherent platforms:
>=20
> Firstly, it wastes memory, kmalloc-96, kmalloc-32, kmalloc-16 and
> kmalloc-8 slab caches don't exist any more, they are replaced with
> either kmalloc-128 or kmalloc-64.
>=20
> Secondly, larger than necessary kmalloc aligned allocations results
> in unnecessary cache/TLB pressure.
>=20
> This issue also exists on arm64 platforms. From last year, Catalin
> tried to solve this issue by decoupling ARCH_KMALLOC_MINALIGN from
> ARCH_DMA_MINALIGN, limiting kmalloc() minimum alignment to
> dma_get_cache_alignment() and replacing ARCH_KMALLOC_MINALIGN usage
> in various drivers with ARCH_DMA_MINALIGN etc.[1]
>=20
> One fact we can make use of for riscv: if the CPU doesn't support
> ZICBOM or T-HEAD CMO, we know the platform is coherent. Based on
> Catalin's work and above fact, we can easily solve the kmalloc align
> issue for riscv: we can override dma_get_cache_alignment(), then let
> it return ARCH_DMA_MINALIGN at the beginning and return 1 once we know
> the underlying HW neither supports ZICBOM nor supports T-HEAD CMO.
>=20
> So what about if the CPU supports ZICBOM and T-HEAD CMO, but all the
> devices are dma coherent? Well, we use ARCH_DMA_MINALIGN as the
> kmalloc minimum alignment, nothing changed in this case. This case
> can be improved in the future.
>=20
> After this patch, a simple test of booting to a small buildroot rootfs
> on qemu shows:
>=20
> kmalloc-96           5041    5041     96  ...
> kmalloc-64           9606    9606     64  ...
> kmalloc-32           5128    5128     32  ...
> kmalloc-16           7682    7682     16  ...
> kmalloc-8           10246   10246      8  ...
>=20
> So we save about 1268KB memory. The saving will be much larger in normal
> OS env on real HW platforms.
>=20
> [1] Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031=
-1-catalin.marinas@arm.com/

In the future,

Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-cat=
alin.marinas@arm.com/ [1]

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Change-Id: Ica249d0f8058a02bd4bc6543b4ffc2946a4734a2

How come this has ended up with a Change-ID? Checkpatch says this is
something to do with Gerrit & needs to be removed.

> ---
>  arch/riscv/include/asm/cache.h      | 14 ++++++++++++++
>  arch/riscv/include/asm/cacheflush.h |  2 ++
>  arch/riscv/kernel/setup.c           |  1 +
>  arch/riscv/mm/dma-noncoherent.c     |  8 ++++++++
>  4 files changed, 25 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cach=
e.h
> index d3036df23ccb..2174fe7bac9a 100644
> --- a/arch/riscv/include/asm/cache.h
> +++ b/arch/riscv/include/asm/cache.h
> @@ -13,6 +13,7 @@
> =20
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
>  #define ARCH_DMA_MINALIGN L1_CACHE_BYTES
> +#define ARCH_KMALLOC_MINALIGN	(8)
>  #endif
> =20
>  /*
> @@ -23,4 +24,17 @@
>  #define ARCH_SLAB_MINALIGN	16
>  #endif
> =20
> +#ifndef __ASSEMBLY__
> +
> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> +extern int dma_cache_alignment;
> +#define dma_get_cache_alignment dma_get_cache_alignment
> +static inline int dma_get_cache_alignment(void)
> +{
> +	return dma_cache_alignment;
> +}
> +#endif
> +
> +#endif	/* __ASSEMBLY__ */
> +
>  #endif /* _ASM_RISCV_CACHE_H */
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm=
/cacheflush.h
> index 8091b8bf4883..c640ab6f843b 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -55,8 +55,10 @@ void riscv_init_cbo_blocksizes(void);
> =20
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
>  void riscv_noncoherent_supported(void);
> +void __init riscv_set_dma_cache_alignment(void);
>  #else
>  static inline void riscv_noncoherent_supported(void) {}
> +static inline void riscv_set_dma_cache_alignment(void) {}
>  #endif
> =20
>  /*
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 971fe776e2f8..027879b1557a 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -311,6 +311,7 @@ void __init setup_arch(char **cmdline_p)
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
>  	    riscv_isa_extension_available(NULL, ZICBOM))
>  		riscv_noncoherent_supported();
> +	riscv_set_dma_cache_alignment();
>  }
> =20
>  static int __init topology_init(void)
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d51a75864e53..811227e54bbd 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -11,6 +11,8 @@
>  #include <asm/cacheflush.h>
> =20
>  static bool noncoherent_supported __ro_after_init;
> +int dma_cache_alignment __ro_after_init =3D ARCH_DMA_MINALIGN;
> +EXPORT_SYMBOL(dma_cache_alignment);

Why is this not EXPORT_SYMBOL_GPL()?

Otherwise, this is generally good to me, thanks.

Conor.

> =20
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  			      enum dma_data_direction dir)
> @@ -78,3 +80,9 @@ void riscv_noncoherent_supported(void)
>  	     "Non-coherent DMA support enabled without a block size\n");
>  	noncoherent_supported =3D true;
>  }
> +
> +void __init riscv_set_dma_cache_alignment(void)
> +{
> +	if (!noncoherent_supported)
> +		dma_cache_alignment =3D 1;
> +}
> --=20
> 2.40.1
>=20

--ukHnNSShkeJEQlWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLZoNgAKCRB4tDGHoIJi
0kI7AQCMT8JQWfRRZSoTqXGLN7caPWS5Thzp0Y4Wj2rWAITvZQD/edOv1Rt3cU5k
IFZugwdsDZDoZ0uij4spCAwKC8xKLQQ=
=FrpO
-----END PGP SIGNATURE-----

--ukHnNSShkeJEQlWy--


--===============7062546973069175912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7062546973069175912==--

