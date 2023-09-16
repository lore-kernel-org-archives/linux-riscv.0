Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49695CD37B2
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 06:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YWt8nIEn9Jg4772auRvBA4tlYuXR/Rj02elMPJDakA=; b=eszzqlZHtyb0gQ
	P1h2nMvb9Wlk7SvVKz9J+sfZnBTvrBxBaHLVfDRkzheJ/biql0EZu3GNogvUKCqVdF0OCXuQyMGhK
	LdE1/Axtt3MKmSmL8VJ6WmowBWmBuUMfubktrSXgcFadMkXPlwI5p1E+5lq+r9yOmXK/stGQZfWuN
	dH4uCbE5BpN2SospRwph04olI9R7Kh6mYg6vsUBky5nY6iyO46SEBIldTeTnB1Tv9UhvwZ9Xao4aR
	n4VntEYR3Xmry7c42NHV6u51IwXuCg9svpqfE6HosWidUzQFA6er2dE3pLtEAl3jE7Zi61S4P3Ei2
	MuNtrrKeWFTFOtX5NIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhOmP-00C1yq-34;
	Sat, 16 Sep 2023 06:27:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhOmN-00C1x4-00
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 06:27:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-403004a96eeso30485635e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 23:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694845650; x=1695450450; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qA3m7Wd97NA+1WsAxBYaL/T9+9FFGYaq89NwpPExPUw=;
        b=IcoJBhUKiwDSk/98s3zc+2FGvzdawdAenA9PVtHiX3jkW68a/4vHu1WYDujcJUQ/RE
         ufvior7s59PAuJfuqnsWr9oVQdK+Tom7rwB9PsxKS3iQMoTTje6K4D72DuD/aqeLIxd4
         SEYDNo5Ak/x/vBNntYgT81+TYb9w7o9Rwg7nbuPmjuMwNAuO9E/iVS0LMfM1WW2YX57w
         jToS8+n2bd/4WkQLgvV0ytG2ZQabKZJ4N291I8rXQddw0C0Z88hTv/d+0LO5oRD2449Z
         Gw1czJI3Dj1FLAOWQlsG0MkYdq6GzkTrXhwUg0v830DQQFB/pPq5JtfOS/P8nNNgx1JZ
         +l5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694845650; x=1695450450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA3m7Wd97NA+1WsAxBYaL/T9+9FFGYaq89NwpPExPUw=;
        b=ZOS65MlSv0nZ/Vtwytw01gSNpVPuwj0l85f9C2BdN1AIXMAmrMzF0gH5BM7BYip35b
         MIiAox+dFNtNfdfm1pqS8yarvRnG5JS9RJQa84oPNAavUrrOKD29GiB3QF4od/3x4s5R
         5pjDYTZNNsZWOAtuMGZJn0MPYUrdnQtcvqGSZtP9XqFYeByOcdcVlbjHAXxkpA+NO3Id
         DDwvGi6+7rUzdW42/7QSazNIxPdTxVwsjFuuSyzw1+QDPALg733kmHDlDvEakbPsmb2E
         QbQRByub5kaLO40FhPzF25AUP/WI8cyCabB6rAlmRR/X5T48eK3pSLBoHNTJmuT9cl5C
         DsnQ==
X-Gm-Message-State: AOJu0YyBUIU0Ri4iN995wM11rN0LXu1F/vQ6v/0qVkg2qk08TFIToESd
	fcIEOYg+At/U1ioy8CIGfzM5+g==
X-Google-Smtp-Source: AGHT+IHVEHn33nx/6pAxr7bxRFYSjBiKm4pipPDJ4FNTUFpg0tRVOz6FVszXyFWu8k+IhzcaqXgF+A==
X-Received: by 2002:a5d:62d2:0:b0:31a:d4e4:4f63 with SMTP id o18-20020a5d62d2000000b0031ad4e44f63mr2929892wrv.18.1694845650282;
        Fri, 15 Sep 2023 23:27:30 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id j6-20020adfff86000000b0031c56218984sm6156170wrr.104.2023.09.15.23.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 23:27:29 -0700 (PDT)
Date: Sat, 16 Sep 2023 08:27:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: capitalise CMO op macros
Message-ID: <20230916-b290c565eabad8c5935a85c2@orel>
References: <20230915-aloe-dollar-994937477776@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915-aloe-dollar-994937477776@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_232743_047485_085AC616 
X-CRM114-Status: GOOD (  20.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 15, 2023 at 04:40:44PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The CMO op macros initially used lower case, as the original iteration
> of the ALT_CMO_OP alternative stringified the first parameter to
> finalise the assembly for the standard variant.
> As a knock-on, the T-Head versions of these CMOs had to use mixed case
> defines. Commit dd23e9535889 ("RISC-V: replace cbom instructions with
> an insn-def") removed the asm construction with stringify, replacing it
> an insn-def macro, rending the lower-case surplus to requirements.
> As far as I can tell from a brief check, CBO_zero does not see similar
> use and didn't require the mixed case define in the first place.
> Replace the lower case characters now for consistency with other
> insn-def macros in the standard and T-Head forms, and adjust the
> callsites.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/include/asm/errata_list.h |  6 +++---
>  arch/riscv/include/asm/insn-def.h    |  8 +++----
>  arch/riscv/lib/clear_page.S          | 32 ++++++++++++++--------------
>  arch/riscv/mm/dma-noncoherent.c      |  8 +++----
>  arch/riscv/mm/pmem.c                 |  4 ++--
>  5 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index e2ecd01bfac7..5801af83d154 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -117,9 +117,9 @@ asm volatile(ALTERNATIVE(						\
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
>   *   0000000    11001     00000      000      00000  0001011
>   */
> -#define THEAD_inval_A0	".long 0x0265000b"
> -#define THEAD_clean_A0	".long 0x0245000b"
> -#define THEAD_flush_A0	".long 0x0275000b"
> +#define THEAD_INVAL_A0	".long 0x0265000b"
> +#define THEAD_CLEAN_A0	".long 0x0245000b"
> +#define THEAD_FLUSH_A0	".long 0x0275000b"
>  #define THEAD_SYNC_S	".long 0x0190000b"
>  
>  #define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index 6960beb75f32..e27179b26086 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -180,19 +180,19 @@
>  	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(51),		\
>  	       __RD(0), RS1(gaddr), RS2(vmid))
>  
> -#define CBO_inval(base)						\
> +#define CBO_INVAL(base)						\
>  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
>  	       RS1(base), SIMM12(0))
>  
> -#define CBO_clean(base)						\
> +#define CBO_CLEAN(base)						\
>  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
>  	       RS1(base), SIMM12(1))
>  
> -#define CBO_flush(base)						\
> +#define CBO_FLUSH(base)						\
>  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
>  	       RS1(base), SIMM12(2))
>  
> -#define CBO_zero(base)						\
> +#define CBO_ZERO(base)						\
>  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
>  	       RS1(base), SIMM12(4))
>  
> diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> index d7a256eb53f4..b22de1231144 100644
> --- a/arch/riscv/lib/clear_page.S
> +++ b/arch/riscv/lib/clear_page.S
> @@ -29,41 +29,41 @@ SYM_FUNC_START(clear_page)
>  	lw	a1, riscv_cboz_block_size
>  	add	a2, a0, a2
>  .Lzero_loop:
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
>  	CBOZ_ALT(11, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
>  	CBOZ_ALT(10, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
>  	CBOZ_ALT(9, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
>  	CBOZ_ALT(8, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
> -	CBO_zero(a0)
> +	CBO_ZERO(a0)
>  	add	a0, a0, a1
>  	bltu	a0, a2, .Lzero_loop
>  	ret
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index b76e7e192eb1..607d5f47d437 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -31,7 +31,7 @@ static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  		return;
>  	}
>  #endif
> -	ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +	ALT_CMO_OP(CLEAN, vaddr, size, riscv_cbom_block_size);
>  }
>  
>  static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> @@ -45,7 +45,7 @@ static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  	}
>  #endif
>  
> -	ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> +	ALT_CMO_OP(INVAL, vaddr, size, riscv_cbom_block_size);
>  }
>  
>  static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
> @@ -59,7 +59,7 @@ static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
>  	}
>  #endif
>  
> -	ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +	ALT_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
>  }
>  
>  static inline bool arch_sync_dma_clean_before_fromdevice(void)
> @@ -131,7 +131,7 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
>  	}
>  #endif
>  
> -	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
> +	ALT_CMO_OP(FLUSH, flush_addr, size, riscv_cbom_block_size);
>  }
>  
>  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> diff --git a/arch/riscv/mm/pmem.c b/arch/riscv/mm/pmem.c
> index c5fc5ec96f6d..370a422ede11 100644
> --- a/arch/riscv/mm/pmem.c
> +++ b/arch/riscv/mm/pmem.c
> @@ -17,7 +17,7 @@ void arch_wb_cache_pmem(void *addr, size_t size)
>  		return;
>  	}
>  #endif
> -	ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
> +	ALT_CMO_OP(CLEAN, addr, size, riscv_cbom_block_size);
>  }
>  EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
>  
> @@ -29,6 +29,6 @@ void arch_invalidate_pmem(void *addr, size_t size)
>  		return;
>  	}
>  #endif
> -	ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
> +	ALT_CMO_OP(INVAL, addr, size, riscv_cbom_block_size);
>  }
>  EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
> -- 
> 2.39.2
>

If it compiles, ship it :-)

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
