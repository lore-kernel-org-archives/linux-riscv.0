Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60A0C6FA82
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 13:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hO0YgeBusZY7bPC2AyA8BTo3Z2G3+LICsOGtGeTmfPA=; b=SRnYTxYB18IBXb
	vjKiMuCK+0+Y9PVrHodD3T4aa86HTirmuq/WAw4bMuvsB1/ahrsfB4P32gtnetPq3OLKhEZvuSHUn
	3N5/X9acXD7L17sQUy7svWnonadvTOcyLbdW5tS/xo48uwCFGOwrCJwf2sk9HzbM/u1mDQuh2LMNo
	MC3cl9ZswcrQY1OX0y3yg3UY9d7MvGqcNFXTv6zC6lRyN45War3U95Q315nbGDb9By5EiACqvZ3jn
	LlYa5joylc3Qrut3rtBcWrgoXdrr3m+cxGXpeiRJeh/L2qSaMqfnEOYXfomuDBURSC785/KCBUG8v
	L2kyV1wRhU63VsZJsgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMD6-00Fens-HR; Thu, 22 Sep 2022 13:25:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMD2-00Fel8-9l
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 13:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663853144; x=1695389144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cidiMQOO2/CtvRETpS3xh6wH67slG7ERsjd5cZuGqpU=;
  b=gBeoWcKhL+prUqCbg17iZxNlDzv68e8N/OnlGN2Dy5PUHGijaqnKx+7j
   N/xeurT16FNBdQ4uzwnKC7gn3GFp50A4t5iG2FmV2PdWWWiiS/VedztTZ
   6jtezXDKLU9ZOduiDf8kKJVLT5YK35I8NaXgG79bn2tdulEFNskyGBFrR
   LplD6COpAJi7BPW9mCzYz6FO6jnk/wgKertXt/H5S7LJmYW86R7A+mbuu
   Ah2H2i6olI6S4/cUG5hdEEz+rzJdoCmzQtI31CL8+KxQB/id+kjF5yX8f
   TGMcNGgKCKddkbIZ5aCND6KuPKlEuVE2pKJZJHZAsZhlVO1kQE+FWCEhp
   w==;
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="181533061"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Sep 2022 06:25:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 22 Sep 2022 06:25:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 22 Sep 2022 06:25:37 -0700
Date: Thu, 22 Sep 2022 14:25:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel@sholland.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Atish
 Patra <atishp@rivosinc.com>, Dao Lu <daolu@rivosinc.com>, Guo Ren
	<guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang
	<jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
Message-ID: <YyxiO0OHvloqJEK6@wendy>
References: <20220922060958.44203-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220922060958.44203-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_062544_435691_3F85E670 
X-CRM114-Status: GOOD (  24.68  )
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

clang-15 chucks a fit too..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

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
> -	}
>  	barrier();
>  }
>  
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
