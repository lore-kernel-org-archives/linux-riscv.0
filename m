Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D34DC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 10:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4e4lqY706UhB9u8BH/viurLBYKgj8qOkQ8F9oQuFqY=; b=ImMt6DS0XiUoD3
	Uw7RS1ToK+O1vRtWIe825aY1GlMGjHlW4nQ9Mfozrt2QUrvyW8DTYpipLcIGYjHU84d84LSmZBKfZ
	/gqSN6QUwUVPlM/WUHL2oiDt6jkjdG2dnl7sQHCnMYsgv+dI8CWk4keOjSa3bIXASpJLlxCi1ec8m
	YcKPrOjbRHpz1qUrj2bFplA0qzJPExfDmIQ5xn8SlKtSNONurMD34TOGexu4SfSSFJn/rmKTa8SSz
	vjwNJR8bzJyrqBr4uOeq5hkGDgmQs+cQF74hp6SUo7gMdPgnIe0dy94WLwZrdlXvffNKhy9D1+CJM
	+8h0H08dKTdgG98uTA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEbx-00000004UGD-1wvX;
	Thu, 20 Jun 2024 10:01:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEbu-00000004UF9-0DdJ;
	Thu, 20 Jun 2024 10:01:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6C6EDA7;
	Thu, 20 Jun 2024 03:02:05 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFCF13F73B;
	Thu, 20 Jun 2024 03:01:36 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:01:34 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yuntao Liu <liuyuntao12@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] randomize_kstack: Remove non-functional per-arch entropy
 filtering
Message-ID: <ZnP9_sDa-oHFepes@J2N7QTR9R3>
References: <20240619214711.work.953-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240619214711.work.953-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_030142_224966_01AEE914 
X-CRM114-Status: GOOD (  27.24  )
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

On Wed, Jun 19, 2024 at 02:47:15PM -0700, Kees Cook wrote:
> An unintended consequence of commit 9c573cd31343 ("randomize_kstack:
> Improve entropy diffusion") was that the per-architecture entropy size
> filtering reduced how many bits were being added to the mix, rather than
> how many bits were being used during the offsetting. All architectures
> fell back to the existing default of 0x3FF (10 bits), which will consume
> at most 1KiB of stack space. It seems that this is working just fine,
> so let's avoid the confusion and update everything to use the default.
> 
> The prior intent of the per-architecture limits were:
> 
>   arm64: capped at 0x1FF (9 bits), 5 bits effective
>   powerpc: uncapped (10 bits), 6 or 7 bits effective
>   riscv: uncapped (10 bits), 6 bits effective
>   x86: capped at 0xFF (8 bits), 5 (x86_64) or 6 (ia32) bits effective
>   s390: capped at 0xFF (8 bits), undocumented effective entropy
> 
> Current discussion has led to just dropping the original per-architecture
> filters. The additional entropy appears to be safe for arm64, x86,
> and s390. Quoting Arnd, "There is no point pretending that 15.75KB is
> somehow safe to use while 15.00KB is not."
> 
> Co-developed-by: Yuntao Liu <liuyuntao12@huawei.com>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> Fixes: 9c573cd31343 ("randomize_kstack: Improve entropy diffusion")
> Link: https://lore.kernel.org/r/20240617133721.377540-1-liuyuntao12@huawei.com
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/arm64/kernel/syscall.c          | 16 +++++++---------
>  arch/s390/include/asm/entry-common.h |  2 +-
>  arch/x86/include/asm/entry-common.h  | 15 ++++++---------
>  3 files changed, 14 insertions(+), 19 deletions(-)

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> 
> diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
> index ad198262b981..7230f6e20ab8 100644
> --- a/arch/arm64/kernel/syscall.c
> +++ b/arch/arm64/kernel/syscall.c
> @@ -53,17 +53,15 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
>  	syscall_set_return_value(current, regs, 0, ret);
>  
>  	/*
> -	 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
> -	 * but not enough for arm64 stack utilization comfort. To keep
> -	 * reasonable stack head room, reduce the maximum offset to 9 bits.
> +	 * This value will get limited by KSTACK_OFFSET_MAX(), which is 10
> +	 * bits. The actual entropy will be further reduced by the compiler
> +	 * when applying stack alignment constraints: the AAPCS mandates a
> +	 * 16-byte aligned SP at function boundaries, which will remove the
> +	 * 4 low bits from any entropy chosen here.
>  	 *
> -	 * The actual entropy will be further reduced by the compiler when
> -	 * applying stack alignment constraints: the AAPCS mandates a
> -	 * 16-byte (i.e. 4-bit) aligned SP at function boundaries.
> -	 *
> -	 * The resulting 5 bits of entropy is seen in SP[8:4].
> +	 * The resulting 6 bits of entropy is seen in SP[9:4].
>  	 */
> -	choose_random_kstack_offset(get_random_u16() & 0x1FF);
> +	choose_random_kstack_offset(get_random_u16());
>  }
>  
>  static inline bool has_syscall_work(unsigned long flags)
> diff --git a/arch/s390/include/asm/entry-common.h b/arch/s390/include/asm/entry-common.h
> index 7f5004065e8a..35555c944630 100644
> --- a/arch/s390/include/asm/entry-common.h
> +++ b/arch/s390/include/asm/entry-common.h
> @@ -54,7 +54,7 @@ static __always_inline void arch_exit_to_user_mode(void)
>  static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
>  						  unsigned long ti_work)
>  {
> -	choose_random_kstack_offset(get_tod_clock_fast() & 0xff);
> +	choose_random_kstack_offset(get_tod_clock_fast());
>  }
>  
>  #define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
> diff --git a/arch/x86/include/asm/entry-common.h b/arch/x86/include/asm/entry-common.h
> index 7e523bb3d2d3..fb2809b20b0a 100644
> --- a/arch/x86/include/asm/entry-common.h
> +++ b/arch/x86/include/asm/entry-common.h
> @@ -73,19 +73,16 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
>  #endif
>  
>  	/*
> -	 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
> -	 * but not enough for x86 stack utilization comfort. To keep
> -	 * reasonable stack head room, reduce the maximum offset to 8 bits.
> -	 *
> -	 * The actual entropy will be further reduced by the compiler when
> -	 * applying stack alignment constraints (see cc_stack_align4/8 in
> +	 * This value will get limited by KSTACK_OFFSET_MAX(), which is 10
> +	 * bits. The actual entropy will be further reduced by the compiler
> +	 * when applying stack alignment constraints (see cc_stack_align4/8 in
>  	 * arch/x86/Makefile), which will remove the 3 (x86_64) or 2 (ia32)
>  	 * low bits from any entropy chosen here.
>  	 *
> -	 * Therefore, final stack offset entropy will be 5 (x86_64) or
> -	 * 6 (ia32) bits.
> +	 * Therefore, final stack offset entropy will be 7 (x86_64) or
> +	 * 8 (ia32) bits.
>  	 */
> -	choose_random_kstack_offset(rdtsc() & 0xFF);
> +	choose_random_kstack_offset(rdtsc());
>  }
>  #define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
>  
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
