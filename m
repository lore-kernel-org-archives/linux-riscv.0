Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B9FC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 06:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PnPB7tHjuRploIARvQ6aJgJt4bW6N0ojA6afyk/Ms0=; b=C9m8FomAvTcCS5
	X+WgcvWr129FeEv87gQvK5Y2dx15ELj3X77Vl5ThbjKzJHWaMqmmtA+rveW/Hwpk/JdSSdW5rFm3D
	S2FevZfFkJn2U3MTlMN4qzg5XOe6idWXwXPJv2g6B0Q9pWJcv7ScOIGYXWpsyapIXvJT1jCm/qFBL
	4wxvCk8uYfqs7zpplcEPfuyPUc341aKzf/0l4Ae6UKbCnURUN2Or7hLV6hOX3kJYzoZNZz0oo73Uw
	VzruBQqOFnlsba/KCxnU8d3C/8+2hDuzjaJS07IquNAHG8+BuWyWtDaHOHIMTYAouawdf7vQwwia5
	M/5ZhcZNPzJh22SvvC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogKpf-000ICK-Ow; Thu, 06 Oct 2022 06:58:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogKpc-000I9e-G3
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 06:58:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E8BD5CE1474;
	Thu,  6 Oct 2022 06:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C36DC433C1;
	Thu,  6 Oct 2022 06:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665039477;
	bh=Oyr2f6WxgPXWa0Z4Ntcod1sqiu+XPoJXS7GJvpW9qzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WN0Nyy8vfTl6wuVRD+gqBy+UYzCYMv6t5ua9bFIMsHbR2vvQsuKVqqrBPnzF4Gwcg
	 s92qyokcS3OUV/E86lQv0wKCcPGshgD2T8bLK0mCJbDMbEDhhubqbuLjnsmA+SVEGE
	 pBwShFzvlSyDlHFznwgrZlz0oPlwv6Pn4Eg/vnwpxvPSYrQKFEWs5bD5VWgFLnPBV3
	 hUN+ExpwqhfhvhZQkE8dfRJCnqZuZuXKxmn2lsIEoz7G4/vfUSTYGh6Vo/8/fXeWD1
	 xNOvuGtqyJWXPZgnGYTHn1BN/FCJqHFQFKL1dg7mF67E1z3xDN9YwUAoN38UVF4o88
	 T8cQT9z+D1JPQ==
Date: Thu, 6 Oct 2022 14:48:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>, Dao Lu <daolu@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
Message-ID: <Yz56K2W/6ttN1SLT@xhacker>
References: <20220922060958.44203-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220922060958.44203-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_235808_936888_11BA0EFE 
X-CRM114-Status: GOOD (  25.44  )
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

On Thu, Sep 22, 2022 at 01:09:58AM -0500, Samuel Holland wrote:
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

Hi Samuel,

I'm not sure whether it's correct to remove static branch usage from
cpu_relax, but your report inspired my patch of constifying arguments
of arch_static_branch() and arch_static_branch_jump() [1]. Could you
please also test it?

Thanks very much

[1]https://lore.kernel.org/linux-riscv/20221006064028.548-1-jszhang@kernel.org/T/#u

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
> -	}
>  	barrier();
>  }
>  
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
