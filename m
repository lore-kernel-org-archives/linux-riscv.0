Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EFCC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Dec 2022 20:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ss1GrBsSJnNaPyX2p4IpTlR+mMUDmdJAhqNrELOmvg=; b=k5V7+Xlh9bIlvHoDgH8cxadpqV
	OrEtnsomE9jjEAr4w3bPJc3PvBRfRPN48hgHwouXc2oVvh2OA0rWSOoRbFx1n8C59BJc0CBUPE8D3
	71O/PT/vgsFPTfAcq6Erwzn58TbcAEOJaawhHDKbGKC2cd7/MY10hKqnGkjS4B9DsdEydNCDqsALy
	0nbpZzAhFPus0qSAbDR6oyXM3RkA36Dyw2K7UHhlruMYTn+d1xxWOCG5RIql6y4H9P5LrBuO78aSG
	x1Ta52bAfux1nRTt2eT0lZemvccxm6r30Yq4m3QX+ImFDS9BsIagIbKfRejPyL2wtW/sMVNAX7cHT
	irbnVGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6eAT-00CmB0-Is; Sat, 17 Dec 2022 20:52:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6eAQ-00Cm3E-K4
	for linux-riscv@lists.infradead.org; Sat, 17 Dec 2022 20:52:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 41541B80946;
	Sat, 17 Dec 2022 20:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510E7C433EF;
	Sat, 17 Dec 2022 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671310339;
	bh=9VVTBzXnV6KBWlFAwdUE+9TcYF61FDpIXiV69L6AWhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJ6DFyt1J9sIoVrokFvRQ0j0HxF75kWqacdFE0Y7N4TLyk3tklsOk2NyKY+DZhvRj
	 +NjndODjOpYBTZKhkCDOwgHcrlTSmfV5Ojd/yev/9NXRCHMUqMMN8FKsGCawBboj+R
	 6D9ASfHdpz024mPaRZJvYV0ceGpcH7ssRfyws5JFSUfQwpNjAWnIv6OJMW984QHglz
	 v37GdIra5YgPuUEqhhVfCvXeHhYvg6xHYY35AHfem++xf6liTvdvkuDtlZ+zn+MVl6
	 w8KjY0hz9VJFp5ILS5SG5/fU2KqIeYJjvPDvM+J0S8obeGuArENTP3ZOTt7uVB+Qm+
	 1caRWivvAnFag==
Date: Sat, 17 Dec 2022 20:52:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 4/6] riscv: mm: dma-noncoherent: Pass direction and
 operation to ALT_CMO_OP()
Message-ID: <Y54r+5lkSvgA9IxR@spud>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20221212115505.36770-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221217_125223_007191_B1789C21 
X-CRM114-Status: GOOD (  19.67  )
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
Content-Type: multipart/mixed; boundary="===============2714491709754222264=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2714491709754222264==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xwBsLtrovXDxZRvK"
Content-Disposition: inline


--xwBsLtrovXDxZRvK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Prabhakar,

On Mon, Dec 12, 2022 at 11:55:03AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Pass direction and operation to ALT_CMO_OP() macro.
>=20
> Vendors might want to perform different operations based on the direction
> and callbacks (arch_sync_dma_for_device/arch_sync_dma_for_cpu/
> arch_dma_prep_coherent) so to handle such cases pass the direction and
> operation to ALT_CMO_OP() macro. This is in preparation for adding errata
> for the Andes CPU core.

This patch seems to break the build on top of the most recent
linux-next:
=2E....../stuff/linux/arch/riscv/mm/pmem.c:13:53: error: too few arguments =
provided to function-like macro invocation
        ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
                                                           ^
/stuff/linux/arch/riscv/include/asm/errata_list.h:127:9: note: macro 'ALT_C=
MO_OP' defined here
#define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)          \
        ^
=2E.  CC      block/partitions/sgi.o
=2E+...+/stuff/linux/arch/riscv/mm/pmem.c:13:2: error: use of undeclared id=
entifier 'ALT_CMO_OP'
        ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
        ^
/stuff/linux/arch/riscv/mm/pmem.c:19:53: error: too few arguments provided =
to function-like macro invocation
        ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
                                                           ^
/stuff/linux/arch/riscv/include/asm/errata_list.h:127:9: note: macro 'ALT_C=
MO_OP' defined here
#define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)          \
        ^
=2E..........  AR      lib/math/built-in.a
=2E/stuff/linux/arch/riscv/mm/pmem.c:19:2: .error: use of undeclared identi=
fier 'ALT_CMO_OP'
        ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
        ^
=2E.4 errors generated.

The pmem stuff is new so that'd be why it has not come up before.

(FWIW, clang allmodconfig)

>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4 -> v5
> * Updated commit message.
>=20
> RFC v3 -> v4
> * New patch
> ---
>  arch/riscv/include/asm/cacheflush.h  |  4 ++++
>  arch/riscv/include/asm/errata_list.h |  8 ++++++--
>  arch/riscv/mm/dma-noncoherent.c      | 15 ++++++++++-----
>  3 files changed, 20 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm=
/cacheflush.h
> index 03e3b95ae6da..e22019668b9e 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -8,6 +8,10 @@
> =20
>  #include <linux/mm.h>
> =20
> +#define NON_COHERENT_SYNC_DMA_FOR_DEVICE	0
> +#define NON_COHERENT_SYNC_DMA_FOR_CPU		1
> +#define NON_COHERENT_DMA_PREP			2
> +
>  static inline void local_flush_icache_all(void)
>  {
>  	asm volatile ("fence.i" ::: "memory");
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index 2ba7e6e74540..48e899a8e7a9 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -124,7 +124,7 @@ asm volatile(ALTERNATIVE(						\
>  #define THEAD_flush_A0	".long 0x0275000b"
>  #define THEAD_SYNC_S	".long 0x0190000b"
> =20
> -#define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
> +#define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)		\
>  asm volatile(ALTERNATIVE_2(						\
>  	__nops(6),							\
>  	"mv a0, %1\n\t"							\
> @@ -146,7 +146,11 @@ asm volatile(ALTERNATIVE_2(						\
>  			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
>  	: : "r"(_cachesize),						\
>  	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
> -	    "r"((unsigned long)(_start) + (_size))			\
> +	    "r"((unsigned long)(_start) + (_size)),			\
> +	    "r"((unsigned long)(_start)),				\
> +	    "r"((unsigned long)(_size)),				\
> +	    "r"((unsigned long)(_dir)),					\
> +	    "r"((unsigned long)(_ops))					\
>  	: "a0")
> =20
>  #define THEAD_C9XX_RV_IRQ_PMU			17
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d919efab6eba..e2b82034f504 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -19,13 +19,16 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size=
_t size,
> =20
>  	switch (dir) {
>  	case DMA_TO_DEVICE:
> -		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size,
> +			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
>  		break;
>  	case DMA_FROM_DEVICE:
> -		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size,
> +			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
>  		break;
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size,
> +			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
>  		break;
>  	default:
>  		break;
> @@ -42,7 +45,8 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t si=
ze,
>  		break;
>  	case DMA_FROM_DEVICE:
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size,
> +			   dir, NON_COHERENT_SYNC_DMA_FOR_CPU);
>  		break;
>  	default:
>  		break;
> @@ -53,7 +57,8 @@ void arch_dma_prep_coherent(struct page *page, size_t s=
ize)
>  {
>  	void *flush_addr =3D page_address(page);
> =20
> -	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
> +	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size,
> +		   0, NON_COHERENT_DMA_PREP);
>  }
> =20
>  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> --=20
> 2.25.1
>=20

--xwBsLtrovXDxZRvK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY54r+wAKCRB4tDGHoIJi
0h2gAP0erGWo9T3Karis7yeYncpvuKo03HROZmPadrJUGiSFWwD/YfCL5tWNgToO
cSJbl11wYttzxvo472uETFhyjvdMSQo=
=dpsF
-----END PGP SIGNATURE-----

--xwBsLtrovXDxZRvK--


--===============2714491709754222264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2714491709754222264==--

