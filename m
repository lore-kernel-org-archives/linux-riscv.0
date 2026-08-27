Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A349DC61DC6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXYIPRi5ArHkNJ/NW3Fr9B/J7lb1+kcD88cE/WpoJVk=; b=S+1JMCJwIQTKXb
	QTKAQapW1jVf0SfJC7bRtJgmvNmni8kRUZcPX4Cw1L+D6OtxQhi0WzVkqGrQd3VPRDjZCrgZ3KlM8
	jXwJaUyrWjz/O5gFajjdC74Egj6tHka5qaQX5tyWdHRchXOr3mMVoxAg4aEKJtI6qR38baq8f2LxF
	m85T0dKGZ/BkO4Gbehb9vV0c0UQOp8uDmJSudC5gOqAJk72XT4MH3vbIH18bX1CoHNXX1J5lvk8Km
	CozbzVgnAw4Ha6qq89SRzrhFGP4mEpgTOH5bC4I3lkCZxEZxNekdNjq/1g2kj0sfR0FytVEREn3Br
	5n5+LV1LAWQMmAhfMN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZO7-00000003yvZ-1Tva;
	Thu, 27 Aug 2026 12:39:23 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZO3-00000003yv6-3D9L
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 12:39:22 +0000
Received: from localhost.localdomain (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAXHz3kL5Bq4ERiBg--.38527S2;
	Thu, 27 Aug 2026 20:39:03 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: xujiakai2025@iscas.ac.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	dev.mbstr@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	qirui.001@bytedance.com,
	samuel.holland@sifive.com,
	zhangchunyan@iscas.ac.cn
Subject: Re: [PATCH v5] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
Date: Thu, 27 Aug 2026 20:38:48 +0800
Message-Id: <20260827123849.816-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1.windows.2
In-Reply-To: <20260705063656.237676-1-xujiakai2025@iscas.ac.cn>
References: <20260705063656.237676-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAXHz3kL5Bq4ERiBg--.38527S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKF13Aw4Uuw1DZryDGFyxGrg_yoW3uw48pF
	Z8CFnrArZrKryIva4avrn7WFy5Jrs5W345KFW7Jw15Aa1rtFyrZr909as0qr1UAry0qa40
	qF12yws3Can0va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUC1v3UUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCRMMCWqP79DjiwAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_053920_175330_49D8606F 
X-CRM114-Status: GOOD (  29.39  )
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

gentle ping ?

> The fp_is_valid() function uses ALIGN(sp, THREAD_SIZE) as the upper
> bound for the frame pointer check. This bound is calculated relative
> to the current sp and shifts upward when sp itself exceeds the valid
> stack region, allowing the unwinder to read past the end of the
> allocated task stack and triggering KASAN stack-out-of-bounds.
> 
> Fix this by using absolute stack boundaries determined once before
> the unwind loop:
> 
> - When sp is on the task stack, use the task's pt_regs as the upper
>   bound.
> - When sp is on the overflow_stack (CONFIG_VMAP_STACK=y), use the
>   overflow_stack's top as the boundary.
> - When sp is on the IRQ stack (CONFIG_IRQ_STACKS=y), use the IRQ
>   stack's top as the boundary.
> - When sp is not on any known stack, warn and return.
> - For remote tasks (task != current), if sp is not on the task
>   stack, warn and return since we cannot reliably determine the
>   correct boundary from a different CPU's stacks.
> 
> Make the DECLARE_PER_CPU(overflow_stack) unconditional in
> asm/stacktrace.h so that stacktrace.c can use
> IS_ENABLED(CONFIG_VMAP_STACK) instead of #ifdef, in line with the
> kernel coding style which discourages the use of #ifdef in .c files
> (https://docs.kernel.org/process/coding-style.html).  This is safe
> because the DEFINE_PER_CPU (memory allocation) in traps.c remains
> guarded by CONFIG_VMAP_STACK; the reference in stacktrace.c is only
> compiled when IS_ENABLED(CONFIG_VMAP_STACK) evaluates to true.
> 
> Fixes: a2a4d4a6a0bf ("riscv: stacktrace: fixed walk_stackframe()")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Assisted-by: YuanSheng:DeepSeek-V3.2
> ---
> V4 -> V5:
> - Made DECLARE_PER_CPU(overflow_stack) unconditional in
>   asm/stacktrace.h so that stacktrace.c can use IS_ENABLED()
>   instead of #ifdef, as suggested by Nam Cao.
> - Converted #ifdef CONFIG_VMAP_STACK to else if
>   (IS_ENABLED(CONFIG_VMAP_STACK)) in walk_stackframe() and folded
>   the overflow_stack and IRQ stack checks into a single if-else
>   chain, eliminating the !high sentinel variable.
> Link: https://lore.kernel.org/linux-riscv/20260630090535.4103888-1-xujiakai2025@iscas.ac.cn/T/#u
> 
> V3 -> V4:
> - Switched to #include <asm/irq_stack.h> instead of hand-written
>   DECLARE_PER_CPU, as suggested by Nam Cao.  This also fixes a
>   build failure when CONFIG_IRQ_STACKS=n since the header
>   unconditionally declares irq_stack_ptr.
> - Added dedicated overflow_stack handling (CONFIG_VMAP_STACK)
>   with the correct 4 KiB boundary. v3 fell through to the 32 KiB
>   IRQ stack bound when unwinding from the overflow_stack,
>   triggering KASAN OOB reads past the small overflow_stack
>   allocation. Reported by Sashiko AI review and reproduced by Xiao Wu.
> - Changed the fallback else branch to warn and return instead of
>   silently falling back to task_pt_regs(), as suggested by Nam Cao.
> - For remote tasks (task != current), bail out with a warning when
>   sp is not on the task stack, since we cannot reliably use the
>   local CPU's IRQ/overflow stacks as the boundary.
> Link: https://lore.kernel.org/linux-riscv/20260625123906.211981-1-xujiakai2025@iscas.ac.cn/T/#u
> 
> V2 -> V3:
> - Handled the case where sp is on the IRQ stack (CONFIG_IRQ_STACKS),
>   as suggested by Nam Cao: when sp is not within the task stack
>   range, use the IRQ stack's top (irq_stack_ptr + IRQ_STACK_SIZE)
>   as the upper bound instead of task_pt_regs(), which would point
>   to the wrong stack. The check uses the sp variable directly rather
>   than on_thread_stack(), because on_thread_stack() reads the
>   current CPU register sp which may differ from the unwinder's sp
>   when regs is provided.
> - Used IS_ENABLED(CONFIG_IRQ_STACKS) to guard the IRQ stack check,
>   and cast irq_stack_ptr to unsigned long for byte-level arithmetic.
> Link: https://lore.kernel.org/linux-riscv/20260517143704.659416-1-xujiakai2025@iscas.ac.cn/T/#u
> 
> V1 -> V2:
> - Moved the NULL task check from fp_is_valid() into walk_stackframe(),
>   as suggested by Matthew Bystrin.
> - Changed the upper bound from task_stack_page(task) + THREAD_SIZE to
>   task_pt_regs(task) for a tighter boundary, as suggested by Matthew
>   Bystrin.
> Link: https://lore.kernel.org/linux-riscv/20260514100711.838895-1-xujiakai2025@iscas.ac.cn/t/#u
> ---
>  arch/riscv/include/asm/stacktrace.h |  8 +++++--
>  arch/riscv/kernel/stacktrace.c      | 37 ++++++++++++++++++++++++-----
>  2 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
> index b1495a7e06ce..2d13c35a8c05 100644
> --- a/arch/riscv/include/asm/stacktrace.h
> +++ b/arch/riscv/include/asm/stacktrace.h
> @@ -22,8 +22,12 @@ static inline bool on_thread_stack(void)
>  }
>  
>  
> -#ifdef CONFIG_VMAP_STACK
> +/*
> + * Declare unconditionally so that arch/riscv/kernel/stacktrace.c can use
> + * IS_ENABLED(CONFIG_VMAP_STACK) rather than #ifdef, in line with the kernel
> + * coding style. The DEFINE_PER_CPU (memory allocation) remains guarded by
> + * CONFIG_VMAP_STACK in traps.c.
> + */
>  DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
> -#endif /* CONFIG_VMAP_STACK */
>  
>  #endif /* _ASM_RISCV_STACKTRACE_H */
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index c7555447149b..7a66c7ee2c81 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -12,6 +12,7 @@
>  #include <linux/stacktrace.h>
>  #include <linux/ftrace.h>
>  
> +#include <asm/irq_stack.h>
>  #include <asm/stacktrace.h>
>  
>  #ifdef CONFIG_FRAME_POINTER
> @@ -35,12 +36,12 @@
>  extern asmlinkage void handle_exception(void);
>  extern unsigned long ret_from_exception_end;
>  
> -static inline int fp_is_valid(unsigned long fp, unsigned long sp)
> +static inline int fp_is_valid(unsigned long fp, unsigned long sp,
> +			       unsigned long high)
>  {
> -	unsigned long low, high;
> +	unsigned long low;
>  
>  	low = sp + sizeof(struct stackframe);
> -	high = ALIGN(sp, THREAD_SIZE);
>  
>  	return !(fp < low || fp > high || fp & 0x07);
>  }
> @@ -48,7 +49,7 @@ static inline int fp_is_valid(unsigned long fp, unsigned long sp)
>  void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			     bool (*fn)(void *, unsigned long), void *arg)
>  {
> -	unsigned long fp, sp, pc;
> +	unsigned long fp, sp, pc, high = 0;
>  	int graph_idx = 0;
>  	int level = 0;
>  
> @@ -68,19 +69,43 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  		pc = task->thread.ra;
>  	}
>  
> +	if (!task)
> +		task = current;
> +
> +	if (sp >= (unsigned long)task_stack_page(task) &&
> +	    sp < (unsigned long)task_stack_page(task) + THREAD_SIZE) {
> +		high = (unsigned long)task_pt_regs(task);
> +	} else if (task != current) {
> +		pr_warn("%s: sp (%lx) is not in task stack of %s\n",
> +			__func__, sp, task->comm);
> +		return;
> +	} else if (IS_ENABLED(CONFIG_VMAP_STACK) &&
> +		   sp >= (unsigned long)this_cpu_ptr(overflow_stack) &&
> +		   sp < (unsigned long)this_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE) {
> +		high = (unsigned long)this_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE;
> +	} else if (IS_ENABLED(CONFIG_IRQ_STACKS) &&
> +		   sp >= (unsigned long)this_cpu_read(irq_stack_ptr) &&
> +		   sp < (unsigned long)this_cpu_read(irq_stack_ptr) + IRQ_STACK_SIZE) {
> +		high = (unsigned long)this_cpu_read(irq_stack_ptr) + IRQ_STACK_SIZE;
> +	} else {
> +		pr_warn("%s: sp (%lx) is not on any known stack\n",
> +			__func__, sp);
> +		return;
> +	}
> +
>  	for (;;) {
>  		struct stackframe *frame;
>  
>  		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
>  			break;
>  
> -		if (unlikely(!fp_is_valid(fp, sp)))
> +		if (unlikely(!fp_is_valid(fp, sp, high)))
>  			break;
>  
>  		/* Unwind stack frame */
>  		frame = (struct stackframe *)fp - 1;
>  		sp = fp;
> -		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp)) {
> +		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp, high)) {
>  			/* We hit function where ra is not saved on the stack */
>  			fp = frame->ra;
>  			pc = regs->ra;
> -- 
> 2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
