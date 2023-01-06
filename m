Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7BFC54EBD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 23:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cuip9yRHe+Pw22nxRb0OdHr1yP5nWVoRW4FfB7bJrk=; b=IQcGWnq+w2VfUjOi99hgGSbSTZ
	wrGPVaztaSpaUdi7Gi+HSplvTLMHPF8CvJ0AwaIndJmrhto/B52+KdZCLlYwa1BrwbmpzbOOasw9N
	z635/6rtyrWoFbKXprjUPd7Pez6c9rnFjvY/R9n4VfDm8QGJVslGt2ZOS+3Uk5aMJS/cui5kQCxhL
	hMb/A4s4XqSDZNewHyMw82t/9/89kRzDTeiDJrIVgd/nbhQ5knVWsDe2GMNcl8880Zj/m4rgUa+FN
	T0KQ/6pwbYYpggLrWlvOaGLqpB6zFQOffJ9HuVjFujK+OXBaPBHkpo8ziIHAYB1qte1oZMN0DuHRA
	UF2IQ+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDwRW-00Fj7a-GS; Fri, 06 Jan 2023 23:48:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDwRS-00Fj52-GP
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 23:48:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7976A61F95;
	Fri,  6 Jan 2023 23:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96556C433EF;
	Fri,  6 Jan 2023 23:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673048884;
	bh=XkRTqB8sAG4tlwF7u/9x9fNMKWrZXQRv9jAGw4m1TmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bM1iasx8ekhvu5zLAkfTrZoB5Wg2LgZiTu+avmkk5GiL5ixOdxbQ+Z16G8nqjxny4
	 xiIw2IUDJDyMzaBPw7Ts9QEObyt8qIUHhXLygdtaMAlzKoxSO8+q6JVT38Xqy38iGi
	 EkZpkrEGSizheAfXcroAsWCGc8a7/ogCPVz/Ss6OROY4JeXH3HQr4dS0wqAjG9CitG
	 Jj4Vvkt6emy3KUf4+yxBCd/mGqXiKnt4BDoC2YGKHfXGjrKNeITbn2CNnnz+3rZFrL
	 T/r+yvd3VicCg9wSe2u8nYHjJN3l+sGEG/m09wxHF0gG01Vl6jPdEE+iR7L13FuIAU
	 LNe0nTIyqi6Pg==
Date: Fri, 6 Jan 2023 23:47:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using
 function pointers for cache management
Message-ID: <Y7izLj0fy/Gj4vXz@spud>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_154806_673346_C24CD299 
X-CRM114-Status: GOOD (  39.50  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Tsukasa OI <research_trasio@irq.a4lg.com>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, open list <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/mixed; boundary="===============1939020447380345921=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1939020447380345921==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6bFwO6AMo3w8sHQ3"
Content-Disposition: inline


--6bFwO6AMo3w8sHQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Icenowy

Hey Prabhakar,

On Fri, Jan 06, 2023 at 06:55:21PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The current implementation of CMO was handled using the ALTERNATIVE_X()
> macro; this was manageable when there were a limited number of platforms
> using this. Now that we are having more and more platforms coming through
> with the CMO the use of the ALTERNATIVE_X() macro becomes unmanageable.

Nitpick time! This opening paragraph is all a little oddly worded IMO.
How about:

Currently, selecting which CMOs to use on a given platform is done using
and ALTERNATIVE_X() macro. This was manageable when there were just two
CMO implementations, but now that there are more and more platforms coming
needing custom CMOs, the use of the ALTERNATIVE_X() macro is unmanageable.

> To avoid such issues this patch switches to use of function pointers
> instead of ALTERNATIVE_X() macro for cache management (the only draw being

s/draw/drawback

> performance over the previous approach).

Did you notice a performance decrease or are you speculating?
Perhaps Icenowy - who I know benched their implmentation of a new CMO
macro for THEAD stuff can do so again for this.

> void (*clean_range)(unsigned long addr, unsigned long size);
> void (*inv_range)(unsigned long addr, unsigned long size);
> void (*flush_range)(unsigned long addr, unsigned long size);
>=20
> The above function pointers are provided to be overridden where platforms
> using standard approach and for platforms who want handle the operation
> based on the operation the below function pointer is provided:

Think you've left out some words here chief!
Perhaps s/and for platforms who/. For platforms that/ & on the line
after, s/operation/direction/ ?

> void (*riscv_dma_noncoherent_cmo_ops)(void *vaddr, size_t size,
>                                       enum dma_data_direction dir,
>                                       enum dma_noncoherent_ops ops);
>=20
> In the current patch we have moved the ZICBOM and T-Head CMO to use
> function pointers.

"Convert ZICBOM..."

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v5->v6
> * New patch
> ---
>  arch/riscv/errata/thead/errata.c         | 71 ++++++++++++++++++
>  arch/riscv/include/asm/dma-noncoherent.h | 83 +++++++++++++++++++++
>  arch/riscv/include/asm/errata_list.h     | 53 -------------
>  arch/riscv/kernel/cpufeature.c           |  2 +
>  arch/riscv/mm/dma-noncoherent.c          | 94 ++++++++++++++++++++++--
>  arch/riscv/mm/pmem.c                     | 18 ++++-
>  6 files changed, 260 insertions(+), 61 deletions(-)
>  create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
>=20
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/e=
rrata.c
> index fac5742d1c1e..826b2ba3e61e 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -8,12 +8,72 @@
>  #include <linux/module.h>
>  #include <linux/string.h>
>  #include <linux/uaccess.h>
> +#include <asm/dma-noncoherent.h>
>  #include <asm/alternative.h>
>  #include <asm/cacheflush.h>
>  #include <asm/errata_list.h>
>  #include <asm/patch.h>
>  #include <asm/vendorid_list.h>
> =20
> +#ifdef CONFIG_ERRATA_THEAD_CMO
> +/*
> + * dcache.ipa rs1 (invalidate, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01010      rs1       000      00000  0001011
> + * dache.iva rs1 (invalida, virtual address)
> + *   0000001    00110      rs1       000      00000  0001011
> + *
> + * dcache.cpa rs1 (clean, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01001      rs1       000      00000  0001011
> + * dcache.cva rs1 (clean, virtual address)
> + *   0000001    00100      rs1       000      00000  0001011
> + *
> + * dcache.cipa rs1 (clean then invalidate, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01011      rs1       000      00000  0001011
> + * dcache.civa rs1 (... virtual address)
> + *   0000001    00111      rs1       000      00000  0001011
> + *
> + * sync.s (make sure all cache operations finished)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000000    11001     00000      000      00000  0001011
> + */
> +#define THEAD_inval_A0	".long 0x0265000b"
> +#define THEAD_clean_A0	".long 0x0245000b"
> +#define THEAD_flush_A0	".long 0x0275000b"
> +#define THEAD_SYNC_S	".long 0x0190000b"
> +
> +#define THEAD_CMO_OP(_op, _start, _size, _cachesize)				\
> +	asm volatile("mv a0, %1\n\t"						\
> +		     "j 2f\n\t"							\
> +		     "3:\n\t"							\
> +		     THEAD_##_op##_A0 "\n\t"					\
> +		     "add a0, a0, %0\n\t"					\
> +		     "2:\n\t"							\
> +		     "bltu a0, %2, 3b\n\t"					\
> +		     THEAD_SYNC_S						\
> +		     : : "r"(_cachesize),					\
> +			 "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
> +			 "r"((unsigned long)(_start) + (_size))			\
> +		     : "a0")

I'm not going to provide a tested-by for the THEAD stuff, as I have no
metrics - but I booted my usual NFS and did some tyre kicking. Seemed
grand.

> +static void thead_cmo_clean_range(unsigned long addr, unsigned long size)
> +{
> +	THEAD_CMO_OP(clean, addr, size, riscv_cbom_block_size);
> +}
> +
> +static void thead_cmo_flush_range(unsigned long addr, unsigned long size)
> +{
> +	THEAD_CMO_OP(flush, addr, size, riscv_cbom_block_size);
> +}
> +
> +static void thead_cmo_inval_range(unsigned long addr, unsigned long size)
> +{
> +	THEAD_CMO_OP(inval, addr, size, riscv_cbom_block_size);
> +}
> +#endif
> +
>  static bool errata_probe_pbmt(unsigned int stage,
>  			      unsigned long arch_id, unsigned long impid)
>  {
> @@ -33,6 +93,8 @@ static bool errata_probe_pbmt(unsigned int stage,
>  static bool errata_probe_cmo(unsigned int stage,
>  			     unsigned long arch_id, unsigned long impid)
>  {
> +	struct riscv_cache_ops thead_cmo_ops;
> +
>  	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_CMO))
>  		return false;
> =20
> @@ -44,6 +106,15 @@ static bool errata_probe_cmo(unsigned int stage,
> =20
>  	riscv_cbom_block_size =3D L1_CACHE_BYTES;
>  	riscv_noncoherent_supported();
> +
> +	memset(&thead_cmo_ops, 0x0, sizeof(thead_cmo_ops));
> +	if (IS_ENABLED(CONFIG_ERRATA_THEAD_CMO)) {

With CONFIG_ERRATA_THEAD_CMO=3Dn:

/stuff/linux/arch/riscv/errata/thead/errata.c: In function 'errata_probe_cm=
o':
/stuff/linux/arch/riscv/errata/thead/errata.c:112:46: error: 'thead_cmo_cle=
an_range' undeclared (first use in this function)
  112 |                 thead_cmo_ops.clean_range =3D &thead_cmo_clean_rang=
e;
      |                                              ^~~~~~~~~~~~~~~~~~~~~
/stuff/linux/arch/riscv/errata/thead/errata.c:112:46: note: each undeclared=
 identifier is reported only once for each function it appears in
/stuff/linux/arch/riscv/errata/thead/errata.c:113:44: error: 'thead_cmo_inv=
al_range' undeclared (first use in this function)
  113 |                 thead_cmo_ops.inv_range =3D &thead_cmo_inval_range;
      |                                            ^~~~~~~~~~~~~~~~~~~~~
/stuff/linux/arch/riscv/errata/thead/errata.c:114:46: error: 'thead_cmo_flu=
sh_range' undeclared (first use in this function)
  114 |                 thead_cmo_ops.flush_range =3D &thead_cmo_flush_rang=
e;
      |                                              ^~~~~~~~~~~~~~~~~~~~~

These functions are only present if CONFIG_ERRATA_THEAD_CMO is set,
so this cannot be an IS_ENABLED() as things stand.

> +		thead_cmo_ops.clean_range =3D &thead_cmo_clean_range;
> +		thead_cmo_ops.inv_range =3D &thead_cmo_inval_range;
> +		thead_cmo_ops.flush_range =3D &thead_cmo_flush_range;

As Arnd suggested, I'd rather see a `static const struct
riscv_cache_ops` type deal too, so you can just call register()
directly.

> +		riscv_noncoherent_register_cache_ops(&thead_cmo_ops);
> +	}
> +
>  	return true;
>  }
> =20
> diff --git a/arch/riscv/include/asm/dma-noncoherent.h b/arch/riscv/includ=
e/asm/dma-noncoherent.h
> new file mode 100644
> index 000000000000..a2af863d2608
> --- /dev/null
> +++ b/arch/riscv/include/asm/dma-noncoherent.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#ifndef __ASM_DMA_NONCOHERENT_H
> +#define __ASM_DMA_NONCOHERENT_H
> +
> +#include <linux/dma-direct.h>
> +
> +enum dma_noncoherent_ops {
> +	NON_COHERENT_SYNC_DMA_FOR_DEVICE =3D 0,
> +	NON_COHERENT_SYNC_DMA_FOR_CPU,
> +	NON_COHERENT_DMA_PREP,
> +	NON_COHERENT_DMA_PMEM,
> +};
> +
> +/*
> + * struct riscv_cache_ops - Structure for CMO function pointers

Drop the "function pointers" from everything here IMO.

> + * @clean_range: Function pointer for clean cache
> + * @inv_range: Function pointer for invalidate cache
> + * @flush_range: Function pointer for flushing the cache
> + * @riscv_dma_noncoherent_cmo_ops: Function pointer for platforms who wa=
nt
> + *  to handle CMO themselves. If this function pointer is set rest of the
> + *  function pointers will be NULL.

Will be NULL? Or must be NULL?
Assuming you keep it, as I see Arnd is questioning it, I think a better
description is needed for this one. And a rename of the function name,
the one you have right now is oddly juxtaposed and a bit confusing.
I don't really have something much better to suggest, so I am gonna use
cmo_omnibus here...

@cmo_omnibus: For platforms whose CMO capabilities do not align with the
              standard cache management operations. If set, the specific
	      ops must be left unset.

Circling back ages later, cmo_universal()?

> +struct riscv_cache_ops {
> +	void (*clean_range)(unsigned long addr, unsigned long size);
> +	void (*inv_range)(unsigned long addr, unsigned long size);
> +	void (*flush_range)(unsigned long addr, unsigned long size);
> +	void (*riscv_dma_noncoherent_cmo_ops)(void *vaddr, size_t size,
> +					      enum dma_data_direction dir,
> +					      enum dma_noncoherent_ops ops);
> +};
> +
> +extern struct riscv_cache_ops zicbom_cmo_ops;
> +
> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> +
> +extern struct riscv_cache_ops noncoherent_cache_ops;
> +
> +void riscv_noncoherent_register_cache_ops(struct riscv_cache_ops *ops);
> +
> +static inline void riscv_dma_noncoherent_clean(void *vaddr, size_t size)
> +{
> +	if (noncoherent_cache_ops.clean_range) {
> +		unsigned long addr =3D (unsigned long)vaddr;
> +
> +		noncoherent_cache_ops.clean_range(addr, size);
> +	}
> +}
> +
> +static inline void riscv_dma_noncoherent_flush(void *vaddr, size_t size)
> +{
> +	if (noncoherent_cache_ops.flush_range) {
> +		unsigned long addr =3D (unsigned long)vaddr;
> +
> +		noncoherent_cache_ops.flush_range(addr, size);
> +	}
> +}
> +
> +static inline void riscv_dma_noncoherent_inval(void *vaddr, size_t size)
> +{
> +	if (noncoherent_cache_ops.inv_range) {
> +		unsigned long addr =3D (unsigned long)vaddr;
> +
> +		noncoherent_cache_ops.inv_range(addr, size);
> +	}
> +}
> +
> +#else
> +
> +static void riscv_noncoherent_register_cache_ops(struct riscv_cache_ops =
*ops) {}
> +
> +static inline void riscv_dma_noncoherent_clean(void *vaddr, size_t size)=
 {}
> +
> +static inline void riscv_dma_noncoherent_flush(void *vaddr, size_t size)=
 {}
> +
> +static inline void riscv_dma_noncoherent_inval(void *vaddr, size_t size)=
 {}

Can these ever be used if DMA_NONCOHERENT is not set? I think
riscv/mm/Makefile gates their usage on the symbol, no?

> +
> +#endif
> +
> +#endif	/* __ASM_DMA_NONCOHERENT_H */
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index 4180312d2a70..ae3fc8b80edd 100644

[...]

> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d919efab6eba..d9445c266bfd 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -9,23 +9,82 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/mm.h>
>  #include <asm/cacheflush.h>
> +#include <asm/dma-noncoherent.h>
> =20
>  static bool noncoherent_supported;
> =20
> +struct riscv_cache_ops noncoherent_cache_ops =3D {
> +	.clean_range =3D NULL,
> +	.inv_range =3D NULL,
> +	.flush_range =3D NULL,
> +	.riscv_dma_noncoherent_cmo_ops =3D NULL,
> +};
> +EXPORT_SYMBOL(noncoherent_cache_ops);

These exports should be _GPL, no? The file is GPLed. Ditto the others.

> +#ifdef CONFIG_RISCV_ISA_ZICBOM
> +#define ZICBOM_CMO_OP(_op, _start, _size, _cachesize)				\
> +	asm volatile("mv a0, %1\n\t"						\
> +		     "j 2f\n\t"							\
> +		     "3:\n\t"							\
> +		     "cbo." __stringify(_op) " (a0)\n\t"			\
> +		     "add a0, a0, %0\n\t"					\
> +		     "2:\n\t"							\
> +		     "bltu a0, %2, 3b\n\t"					\
> +		     : : "r"(_cachesize),					\
> +			 "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
> +			 "r"((unsigned long)(_start) + (_size))			\
> +		     : "a0")
> +
> +static void zicbom_cmo_clean_range(unsigned long addr, unsigned long siz=
e)
> +{
> +	ZICBOM_CMO_OP(clean, addr, size, riscv_cbom_block_size);
> +}
> +
> +static void zicbom_cmo_flush_range(unsigned long addr, unsigned long siz=
e)
> +{
> +	ZICBOM_CMO_OP(flush, addr, size, riscv_cbom_block_size);
> +}
> +
> +static void zicbom_cmo_inval_range(unsigned long addr, unsigned long siz=
e)
> +{
> +	ZICBOM_CMO_OP(inval, addr, size, riscv_cbom_block_size);
> +}
> +
> +struct riscv_cache_ops zicbom_cmo_ops =3D {
> +	.clean_range =3D &zicbom_cmo_clean_range,
> +	.inv_range =3D &zicbom_cmo_inval_range,
> +	.flush_range =3D &zicbom_cmo_flush_range,
> +};
> +#else
> +struct riscv_cache_ops zicbom_cmo_ops =3D {
> +	.clean_range =3D NULL,
> +	.inv_range =3D NULL,
> +	.flush_range =3D NULL,
> +	.riscv_dma_noncoherent_cmo_ops =3D NULL,
> +};
> +#endif
> +EXPORT_SYMBOL(zicbom_cmo_ops);
> +
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  			      enum dma_data_direction dir)
>  {
>  	void *vaddr =3D phys_to_virt(paddr);
> =20
> +	if (noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops) {
> +		noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops(vaddr, size, dir,
> +								    NON_COHERENT_SYNC_DMA_FOR_DEVICE);
> +		return;
> +	}
> +
>  	switch (dir) {
>  	case DMA_TO_DEVICE:
> -		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +		riscv_dma_noncoherent_clean(vaddr, size);
>  		break;
>  	case DMA_FROM_DEVICE:
> -		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +		riscv_dma_noncoherent_clean(vaddr, size);
>  		break;
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		riscv_dma_noncoherent_flush(vaddr, size);
>  		break;
>  	default:
>  		break;
> @@ -37,12 +96,18 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t =
size,
>  {
>  	void *vaddr =3D phys_to_virt(paddr);
> =20
> +	if (noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops) {
> +		noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops(vaddr, size, dir,
> +								    NON_COHERENT_SYNC_DMA_FOR_CPU);
> +		return;
> +	}
> +
>  	switch (dir) {
>  	case DMA_TO_DEVICE:
>  		break;
>  	case DMA_FROM_DEVICE:
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		riscv_dma_noncoherent_flush(vaddr, size);
>  		break;
>  	default:
>  		break;
> @@ -53,7 +118,13 @@ void arch_dma_prep_coherent(struct page *page, size_t=
 size)
>  {
>  	void *flush_addr =3D page_address(page);
> =20
> -	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
> +	if (noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops) {
> +		noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops(flush_addr, size, =
-1,
> +								    NON_COHERENT_DMA_PREP);
> +		return;
> +	}
> +
> +	riscv_dma_noncoherent_flush(flush_addr, size);
>  }
> =20
>  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> @@ -78,3 +149,16 @@ void riscv_noncoherent_supported(void)
>  	     "Non-coherent DMA support enabled without a block size\n");
>  	noncoherent_supported =3D true;
>  }

Barring the function name, which I really don't like - it really is
confusingly named. Something like cmo_universal() would get it's point
across a bit better I think.

> +void riscv_noncoherent_register_cache_ops(struct riscv_cache_ops *ops)
> +{
> +	if (!ops)
> +		return;
> +
> +	if (ops->riscv_dma_noncoherent_cmo_ops)
> +		noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops =3D
> +				ops->riscv_dma_noncoherent_cmo_ops;
> +	else
> +		noncoherent_cache_ops =3D *ops;

Can we just chop off the extra step here? Behaviourally this is going to
be no different whether someone sets the universal op and the individual
ones anyway.

> +}
> +EXPORT_SYMBOL(riscv_noncoherent_register_cache_ops);

_GPL again I think!

I'm happy with this approach, modulo the minor bits I've pointed out.
I do really like that it takes us away from messing with an asm
alternative every time someone wants to do this stuff differently or for
a new platform.

I would like Heiko to have a look at what you've done here, but ye looks
promising IMO.

Thanks,
Conor.


--6bFwO6AMo3w8sHQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7izLgAKCRB4tDGHoIJi
0ug4AP9Sorcp57nmRn92ux/hgyrMPGZTRzvBf5vGvFzT/h1wUwD/ejEfcwo1msEu
vlKBLouNAbTJIbJ6DfViN1d2OU9jwww=
=AAuH
-----END PGP SIGNATURE-----

--6bFwO6AMo3w8sHQ3--


--===============1939020447380345921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1939020447380345921==--

