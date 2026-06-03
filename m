Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DF5CD6E5D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 01:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEQvxu/m9tEZSYK3U9WxJTLycz6japrISgrXJvx17NY=; b=T/jFgkzcTLvbXE
	7dMdffHqq5rp/9ADUlACrx2Fzvxx5CJ7aExTxnRwDeievkQrZVoOzaj8hymxOqm+Uu9PmHOoO2Znu
	MZC76FZb4tPQ9WqswzeDBGETYS9jCI2ilyDMvFoUWeOyvWuKHlY2jTU0i/MC7GpCTMgYpqPctYQJI
	4aaVrWcyhg590RBhNP3hWGimxMF4ybzJi6VbGcdmF4yK85lhie36Xyn+aOEOOFqoavv+FAoCQPkFL
	6pres2LaWbWmorGtq1YGr9VuH+5khYvSqqNyHmiLuMh/8tsPEQ7dib/89Qwodmm6CYCXURPP89FAG
	cvqcO7gvg/E6DKRjKwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaKG-0000000E2ZK-1tQg;
	Wed, 03 Jun 2026 01:23:20 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaKC-0000000E2Yq-3ZjW
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 01:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780449793; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=aOvj40vd9kLAuQk7SPrErsDX1z7W+8ls3a4xdTv8HMg=;
	b=v0T79xHV3oyjexi2kUcB99zuD5zwCChUQcTVtyIWMr3NH9jrcttg/i8bENMBpmTU4ojqs99qJ/DiYt0y4XpxpAlOlFzc2eksLaM+X+El8GqP1IacuXySYZAUxwZT3NYi9uHv04Tye7ITyKr1UuDvozuqDldk3ota9UN4GRvw/S0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X45kknw_1780449789;
Received: from 30.246.177.175(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X45kknw_1780449789 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 09:23:11 +0800
Message-ID: <461a727f-e2cd-4192-9e19-16172500053c@linux.alibaba.com>
Date: Wed, 3 Jun 2026 09:23:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] riscv: stacktrace: introduce stack-bound tracking
 helpers
To: Wang Han <wanghan@linux.alibaba.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chen Pei <cp0613@linux.alibaba.com>, Andy Chiu <andybnac@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Deepak Gupta <debug@rivosinc.com>, Puranjay Mohan <puranjay@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, oliver.yang@linux.alibaba.com,
 zhuo.song@linux.alibaba.com, jkchen@linux.alibaba.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
 <20260528082310.1994388-6-wanghan@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260528082310.1994388-6-wanghan@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_182317_417951_9449CCA1 
X-CRM114-Status: GOOD (  24.80  )
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



On 5/28/26 4:23 PM, Wang Han wrote:
> A reliable unwinder needs to validate that every frame record it reads
> is fully contained in a known kernel stack, and it needs to refuse to
> walk back into a stack it has already left. Add the building blocks
> for that:
> 
>    * struct stack_info / struct unwind_state in a new
>      asm/stacktrace/common.h, modelled on the arm64 reference
>      implementation.
>    * stackinfo_get_irq() / stackinfo_get_task() / stackinfo_get_overflow()
>      plus the corresponding on_*_stack() predicates in asm/stacktrace.h,
>      so callers can ask "is this object on stack X?" by stack kind
>      rather than open-coded address arithmetic.
>    * unwind_init_common(), unwind_find_stack() and
>      unwind_consume_stack() helpers that enforce the
>      forward-progress-only invariant required for reliability.
> 
> No existing user is wired up to these helpers in this commit; the
> unwinder switch comes in a follow-up. The header changes leave
> on_thread_stack() with the same semantics as before, just expressed in
> terms of the new helpers.
> 
> Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
> ---
>   arch/riscv/include/asm/stacktrace.h        |  65 ++++++++-
>   arch/riscv/include/asm/stacktrace/common.h | 159 +++++++++++++++++++++
>   2 files changed, 222 insertions(+), 2 deletions(-)
>   create mode 100644 arch/riscv/include/asm/stacktrace/common.h
> 
> diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
> index b1495a7e06ce..bc87c4940379 100644
> --- a/arch/riscv/include/asm/stacktrace.h
> +++ b/arch/riscv/include/asm/stacktrace.h
> @@ -3,8 +3,13 @@
>   #ifndef _ASM_RISCV_STACKTRACE_H
>   #define _ASM_RISCV_STACKTRACE_H
>   
> +#include <linux/percpu.h>
>   #include <linux/sched.h>
> +#include <linux/sched/task_stack.h>
> +
> +#include <asm/irq_stack.h>
>   #include <asm/ptrace.h>
> +#include <asm/stacktrace/common.h>
>   
>   struct stackframe {
>   	unsigned long fp;
> @@ -16,14 +21,70 @@ extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *re
>   extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
>   			   const char *loglvl);
>   
> -static inline bool on_thread_stack(void)
> +/*
> + * IRQ stack accessors
> + */
> +static inline struct stack_info stackinfo_get_irq(void)
> +{
> +	unsigned long low = (unsigned long)raw_cpu_read(irq_stack_ptr);
> +	unsigned long high = low + IRQ_STACK_SIZE;
> +
> +	return (struct stack_info) {
> +		.low = low,
> +		.high = high,
> +	};
> +}
> +
> +static inline bool on_irq_stack(unsigned long sp, unsigned long size)
> +{
> +	struct stack_info info = stackinfo_get_irq();
> +
> +	return stackinfo_on_stack(&info, sp, size);
> +}
> +
> +/*
> + * Task stack accessors
> + */
> +static inline struct stack_info stackinfo_get_task(const struct task_struct *tsk)
>   {
> -	return !(((unsigned long)(current->stack) ^ current_stack_pointer) & ~(THREAD_SIZE - 1));
> +	unsigned long low = (unsigned long)task_stack_page(tsk);
> +	unsigned long high = low + THREAD_SIZE;
> +
> +	return (struct stack_info) {
> +		.low = low,
> +		.high = high,
> +	};
> +}
> +
> +static inline bool on_task_stack(const struct task_struct *tsk,
> +				 unsigned long sp, unsigned long size)
> +{
> +	struct stack_info info = stackinfo_get_task(tsk);
> +
> +	return stackinfo_on_stack(&info, sp, size);
>   }
>   
> +/*
> + * Cast is necessary since current->stack is an opaque ptr.
> + */
> +#define on_thread_stack()	(on_task_stack(current, current_stack_pointer, 1))
>   
> +/*
> + * Overflow stack accessors
> + */
>   #ifdef CONFIG_VMAP_STACK
>   DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
> +
> +static inline struct stack_info stackinfo_get_overflow(void)
> +{
> +	unsigned long low = (unsigned long)raw_cpu_ptr(overflow_stack);
> +	unsigned long high = low + OVERFLOW_STACK_SIZE;
> +
> +	return (struct stack_info) {
> +		.low = low,
> +		.high = high,
> +	};
> +}
>   #endif /* CONFIG_VMAP_STACK */
>   
>   #endif /* _ASM_RISCV_STACKTRACE_H */
> diff --git a/arch/riscv/include/asm/stacktrace/common.h b/arch/riscv/include/asm/stacktrace/common.h
> new file mode 100644
> index 000000000000..87d6d40672f3
> --- /dev/null
> +++ b/arch/riscv/include/asm/stacktrace/common.h
> @@ -0,0 +1,159 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * RISC-V common stack unwinder types and helpers.
> + *
> + * See: arch/arm64/include/asm/stacktrace/common.h for the reference
> + * implementation.
> + *
> + * Copyright (C) 2024

Nit: The new common.h carries "Copyright (C) 2024", but this is a 2026
submission.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
