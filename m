Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8126C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaR+LUKtPxPWSxo6wqpGaIw0Uyffs3szAXIL7PHaBX4=; b=lmrqY1II9OdxIA
	ww1zylC1ktsoca6AmDPjaBqNGbRlfhY4YruCvpTRCWPOgIWAPTCEVEhUR1J3KhmjA92RwJw5XwLYM
	S0BBRYuVf/KjgPPh6Y4yDUs4HlwtN0/6YS+GuqzO30hY2pfRJvLujbt3+Ji4+SfusaXnd1gjC//QB
	OYmu9Of4U8A2v00tIB/30ekhnnYZIaCv99vBf4+x5cl0t2mzZ+BU/Q2mwAI+azo884aWSbE2GHtDh
	PzBFPdgEGk0LlHNVbbL9ig3fqDh04SCz8J+xDmDkhH3x76AvTiViOuaRWGVbvNtmabA5Epb4vV6yK
	2saEcd+yezO2/z51TLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obOO4-00GWWu-5S; Thu, 22 Sep 2022 15:45:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obOO1-00GWVD-Ma
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 15:45:15 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1obONw-00085T-PU; Thu, 22 Sep 2022 17:45:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, Dao Lu <daolu@rivosinc.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
Date: Thu, 22 Sep 2022 17:45:07 +0200
Message-ID: <2546376.ElGaqSPkdT@phil>
In-Reply-To: <20220922060958.44203-1-samuel@sholland.org>
References: <20220922060958.44203-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_084513_768533_AAB2A2AD 
X-CRM114-Status: GOOD (  25.65  )
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

Am Donnerstag, 22. September 2022, 08:09:58 CEST schrieb Samuel Holland:
> commit 8eb060e10185 ("arch/riscv: add Zihintpause support") broke
> building with CONFIG_CC_OPTIMIZE_FOR_SIZE enabled (gcc 11.1.0):
> 
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> In file included from <command-line>:
> ./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
> ././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0 probably does not match constraints
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> ././include/linux/compiler_types.h:285:33: error: impossible constraint in 'asm'
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> make[1]: *** [scripts/Makefile.build:249: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
> make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2
> 
> Having a static branch in cpu_relax() is problematic because that
> function is widely inlined, including in some quite complex functions
> like in the VDSO. A quick measurement shows this static branch is
> responsible by itself for around 40% of the jump table.
> 
> Drop the static branch, which ends up being the same number of
> instructions anyway. If Zihintpause is supported, we trade the nop from
> the static branch for a div. If Zihintpause is unsupported, we trade the
> jump from the static branch for (what gets interpreted as) a nop.
> 
> Fixes: 8eb060e10185 ("arch/riscv: add Zihintpause support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  arch/riscv/include/asm/hwcap.h          |  3 ---
>  arch/riscv/include/asm/vdso/processor.h | 25 ++++++++++---------------
>  2 files changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 6f59ec64175e..b21d46e68386 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -68,7 +68,6 @@ enum riscv_isa_ext_id {
>   */
>  enum riscv_isa_ext_key {
>  	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
> -	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_KEY_MAX,
>  };
>  
> @@ -88,8 +87,6 @@ static __always_inline int riscv_isa_ext2key(int num)
>  		return RISCV_ISA_EXT_KEY_FPU;
>  	case RISCV_ISA_EXT_d:
>  		return RISCV_ISA_EXT_KEY_FPU;
> -	case RISCV_ISA_EXT_ZIHINTPAUSE:
> -		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
> index 1e4f8b4aef79..789bdb8211a2 100644
> --- a/arch/riscv/include/asm/vdso/processor.h
> +++ b/arch/riscv/include/asm/vdso/processor.h
> @@ -4,30 +4,25 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -#include <linux/jump_label.h>
>  #include <asm/barrier.h>
> -#include <asm/hwcap.h>
>  
>  static inline void cpu_relax(void)
>  {
> -	if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTPAUSE])) {
>  #ifdef __riscv_muldiv
> -		int dummy;
> -		/* In lieu of a halt instruction, induce a long-latency stall. */
> -		__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> +	int dummy;
> +	/* In lieu of a halt instruction, induce a long-latency stall. */
> +	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>  #endif
> -	} else {
> -		/*
> -		 * Reduce instruction retirement.
> -		 * This assumes the PC changes.
> -		 */
> +	/*
> +	 * Reduce instruction retirement.
> +	 * This assumes the PC changes.
> +	 */
>  #ifdef __riscv_zihintpause
> -		__asm__ __volatile__ ("pause");
> +	__asm__ __volatile__ ("pause");
>  #else
> -		/* Encoding of the pause instruction */
> -		__asm__ __volatile__ (".4byte 0x100000F");
> +	/* Encoding of the pause instruction */
> +	__asm__ __volatile__ (".4byte 0x100000F");
>  #endif

hmm, though before this part of the code was only ever accessed
when the zhintpause extension was really available on the running
machine while now the pause instruction is called every time.

So I'm just wondering, can't this run into some "illegal instruction"
thingy on machines not supporting the extension?

Heiko

> -	}
>  	barrier();
>  }
>  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
