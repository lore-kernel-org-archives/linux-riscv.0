Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D03C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 10:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRUEwhoZSqyvpT/Hk3LOi68QZcd/Ze8LPrcE2NU8Qwk=; b=ewsfsrbn+rnBos
	g5mOr34c9+3J/aAS589uIYtufqe4loYgRnduBrkjmqgNzFPTra2vo48vmuT8zLB1izAFH+38V5MDH
	EpzrPftmsHN5wnMxHdBhIPkWmOkkxff66uFkI0DFqbtlk/RnVBTVJ21nZUJfpNs9t0ser2TOsautU
	wnDHftcqjNZbKRoOIwxVt8wn/12cduLnUvTWyJtR7TXYFtWXjwJy/QqHLsIwFNtw1iVhRJHc54f9Y
	aLLNDjadlugAmbvC77syn8RuhDM+4SS4jSxLRICDM2UUmyULYekGffF8aUA4PA76mxt+IdGQ2Ev4b
	yf+VT4BK6tVVt27g2rkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tra0u-00000002CMs-0tq2;
	Mon, 10 Mar 2025 10:05:36 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZtt-00000002Asc-1sOu
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 09:58:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB5DC44201;
	Mon, 10 Mar 2025 09:58:15 +0000 (UTC)
Message-ID: <346ecf28-807f-4ae9-be5d-08ebd649d241@ghiti.fr>
Date: Mon, 10 Mar 2025 10:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] entry: Inline syscall_exit_to_user_mode()
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
 <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudeltdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeehvdekmedufheijeemkedugedumeekgegvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemhedvkeemudhfieejmeekudegudemkeegvgekpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeehvdekmedufheijeemkedugedumeekgegvkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrt
 ghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhesgigvnhdtnhdrnhgrmhgvpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_025821_629118_34D04BC4 
X-CRM114-Status: GOOD (  21.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Charlie,

On 06/03/2025 01:43, Charlie Jenkins wrote:
> Architectures using the generic entry code can be optimized by having
> syscall_exit_to_user_mode inlined.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>   include/linux/entry-common.h | 43 ++++++++++++++++++++++++++++++++++++--
>   kernel/entry/common.c        | 49 +-------------------------------------------
>   2 files changed, 42 insertions(+), 50 deletions(-)
>
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index fc61d0205c97084acc89c8e45e088946f5e6d9b2..f94f3fdf15fc0091223cc9f7b823970302e67312 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -14,6 +14,7 @@
>   #include <linux/kmsan.h>
>   
>   #include <asm/entry-common.h>
> +#include <asm/syscall.h>
>   
>   /*
>    * Define dummy _TIF work flags if not defined by the architecture or for
> @@ -366,6 +367,15 @@ static __always_inline void exit_to_user_mode(void)
>   	lockdep_hardirqs_on(CALLER_ADDR0);
>   }
>   
> +/**
> + * syscall_exit_work - Handle work before returning to user mode
> + * @regs:	Pointer to current pt_regs
> + * @work:	Current thread syscall work
> + *
> + * Do one-time syscall specific work.
> + */
> +void syscall_exit_work(struct pt_regs *regs, unsigned long work);
> +
>   /**
>    * syscall_exit_to_user_mode_work - Handle work before returning to user mode
>    * @regs:	Pointer to currents pt_regs
> @@ -379,7 +389,30 @@ static __always_inline void exit_to_user_mode(void)
>    * make the final state transitions. Interrupts must stay disabled between
>    * return from this function and the invocation of exit_to_user_mode().
>    */
> -void syscall_exit_to_user_mode_work(struct pt_regs *regs);
> +static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
> +{
> +	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
> +	unsigned long nr = syscall_get_nr(current, regs);
> +
> +	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
> +
> +	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> +		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
> +			local_irq_enable();
> +	}
> +
> +	rseq_syscall(regs);
> +
> +	/*
> +	 * Do one-time syscall specific work. If these work items are
> +	 * enabled, we want to run them exactly once per syscall exit with
> +	 * interrupts enabled.
> +	 */
> +	if (unlikely(work & SYSCALL_WORK_EXIT))
> +		syscall_exit_work(regs, work);
> +	local_irq_disable_exit_to_user();
> +	exit_to_user_mode_prepare(regs);
> +}
>   
>   /**
>    * syscall_exit_to_user_mode - Handle work before returning to user mode
> @@ -410,7 +443,13 @@ void syscall_exit_to_user_mode_work(struct pt_regs *regs);
>    * exit_to_user_mode(). This function is preferred unless there is a
>    * compelling architectural reason to use the separate functions.
>    */
> -void syscall_exit_to_user_mode(struct pt_regs *regs);
> +static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
> +{
> +	instrumentation_begin();
> +	syscall_exit_to_user_mode_work(regs);
> +	instrumentation_end();
> +	exit_to_user_mode();
> +}
>   
>   /**
>    * irqentry_enter_from_user_mode - Establish state before invoking the irq handler
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index e33691d5adf7aab4af54cf2bf8e5ef5bd6ad1424..f55e421fb196dd5f9d4e34dd85ae096c774cf879 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -146,7 +146,7 @@ static inline bool report_single_step(unsigned long work)
>   	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
>   }
>   
> -static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
> +void syscall_exit_work(struct pt_regs *regs, unsigned long work)
>   {
>   	bool step;
>   
> @@ -173,53 +173,6 @@ static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
>   		ptrace_report_syscall_exit(regs, step);
>   }
>   
> -/*
> - * Syscall specific exit to user mode preparation. Runs with interrupts
> - * enabled.
> - */
> -static void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
> -{
> -	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
> -	unsigned long nr = syscall_get_nr(current, regs);
> -
> -	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
> -
> -	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> -		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
> -			local_irq_enable();
> -	}
> -
> -	rseq_syscall(regs);
> -
> -	/*
> -	 * Do one-time syscall specific work. If these work items are
> -	 * enabled, we want to run them exactly once per syscall exit with
> -	 * interrupts enabled.
> -	 */
> -	if (unlikely(work & SYSCALL_WORK_EXIT))
> -		syscall_exit_work(regs, work);
> -}
> -
> -static __always_inline void __syscall_exit_to_user_mode_work(struct pt_regs *regs)
> -{
> -	syscall_exit_to_user_mode_prepare(regs);
> -	local_irq_disable_exit_to_user();
> -	exit_to_user_mode_prepare(regs);
> -}
> -
> -void syscall_exit_to_user_mode_work(struct pt_regs *regs)
> -{
> -	__syscall_exit_to_user_mode_work(regs);
> -}
> -
> -__visible noinstr void syscall_exit_to_user_mode(struct pt_regs *regs)
> -{
> -	instrumentation_begin();
> -	__syscall_exit_to_user_mode_work(regs);
> -	instrumentation_end();
> -	exit_to_user_mode();
> -}
> -
>   noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
>   {
>   	enter_from_user_mode(regs);
>

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
