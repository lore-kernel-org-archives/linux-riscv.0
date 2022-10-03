Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5147C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 11:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmUOFlVKejfy3yL9PphoJjUrFEI81aZzPtezeCGypPw=; b=dhDcDtmUlHN5n5
	r4xrrn9KtZUNNZmarg5R5g9W1/KP/SD1Maikf7+g04Q6KyXtYvjbo/d2GTtyuXRSPD15KGntw+X1X
	v2pMni7HaXzKC8iRjk9JNpCh/r4NRylV7Yom2ZZGUb4mXwP+5ZLbZeLlTK6jKhsyQ2pgf2nvUC71S
	jZtsKxDhgxzFQ424oP6+rYgQlbqVjzlI6uzbKJm9qeHQqj+NPn7gSv+VmwlDQHAonzB6p/j5l/PA+
	Vpa1flbMl/VPl7FgwBJCO9SBoklmbZcP1lL410q0rkia1BRB5Rti4APfpxKeIM8QjuHD4dtze2ZxX
	y1mPQUV21iOTPrLfvstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofJok-005Vl9-QH; Mon, 03 Oct 2022 11:41:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofJoh-005Vjc-1I
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 11:41:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD7E4139F;
	Mon,  3 Oct 2022 04:41:03 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.80.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E7E3F73B;
	Mon,  3 Oct 2022 04:40:53 -0700 (PDT)
Date: Mon, 3 Oct 2022 12:40:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	zouyipeng@huawei.com, bigeasy@linutronix.de,
	David.Laight@aculab.com, chenzhongjin@huawei.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V6 05/11] riscv: traps: Add noinstr to prevent
 instrumentation inserted
Message-ID: <YzrKQkK4Kfbd7Wik@FVFF77S0Q05N>
References: <20221002012451.2351127-1-guoren@kernel.org>
 <20221002012451.2351127-6-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221002012451.2351127-6-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_044059_143393_5A6C2785 
X-CRM114-Status: GOOD (  18.60  )
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

On Sat, Oct 01, 2022 at 09:24:45PM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Without noinstr the compiler is free to insert instrumentation (think
> all the k*SAN, KCov, GCov, ftrace etc..) which can call code we're not
> yet ready to run this early in the entry path, for instance it could
> rely on RCU which isn't on yet, or expect lockdep state. (by peterz)
> 
> Link: https://lore.kernel.org/linux-riscv/YxcQ6NoPf3AH0EXe@hirez.programming.kicks-ass.net/raw
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kernel/traps.c | 4 ++--
>  arch/riscv/mm/fault.c     | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 635e6ec26938..588e17c386c6 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -92,9 +92,9 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
>  }
>  
>  #if defined(CONFIG_XIP_KERNEL) && defined(CONFIG_RISCV_ALTERNATIVE)
> -#define __trap_section		__section(".xip.traps")
> +#define __trap_section __noinstr_section(".xip.traps")

I assume that for CONFIG_XIP_KERNEL, KPROBES is not possible, and so functions
marked with __trap_section don't need to be excluded from kprobes.

Is that assumption correct, or does something need to be done to inhibit that?

Thanks,
Mark.

>  #else
> -#define __trap_section
> +#define __trap_section noinstr
>  #endif
>  #define DO_ERROR_INFO(name, signo, code, str)				\
>  asmlinkage __visible __trap_section void name(struct pt_regs *regs)	\
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index f2fbd1400b7c..c7829289e806 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -203,7 +203,7 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
>   * This routine handles page faults.  It determines the address and the
>   * problem, and then passes it off to one of the appropriate routines.
>   */
> -asmlinkage void do_page_fault(struct pt_regs *regs)
> +asmlinkage void noinstr do_page_fault(struct pt_regs *regs)
>  {
>  	struct task_struct *tsk;
>  	struct vm_area_struct *vma;
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
