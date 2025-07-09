Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF1CC83F03
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4509mEE86ES5mqqclXaf0oz4hH11wQ2YCRrrFICsxI=; b=lg42lcME8mVfDEt2f9mabJQ49k
	PqStvJn/W5RX+YacDrXHQORJC3m3PK7nyY/txxZZhbpU5uV/HeEuWLrpb4cUsidclkb9suqwR/mtT
	nCnFhhym75ZjIomt2USi7BmwDjUkJFABbE4lN1cYpXCGLzJyUaUTrNsLCAUr2X+ipyXA4VxsldmWH
	svjGRFLg55zDyx35G5S/R3C4I51GLgfPZjcSwhD1KBPxBsJMcSjOynAPGQblDH7PlwtLquXTWEe2P
	u/hUfPeBEBbN+VgBvpdICnUy6uGqKvwkkJ10M1jGCY/OLoRWWCMxm0uBM0HApFLDYJ8cXnnFEdgjz
	LKKSlFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPd2-00000007rbN-0wda;
	Wed, 09 Jul 2025 07:54:08 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOng-00000007kN0-1v7C
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 07:01:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 012BA442EF;
	Wed,  9 Jul 2025 07:00:58 +0000 (UTC)
Message-ID: <6a07cf54-8e97-4726-ba38-67feb90f3e7f@ghiti.fr>
Date: Wed, 9 Jul 2025 09:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Enable interrupt during exception handling
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-rt-devel@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250625085630.3649485-1-namcao@linutronix.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250625085630.3649485-1-namcao@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefieeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeufeegheehgedtvdegleegjeejfedukeegteffieejgfevjeduheffffdtlefhhfenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegrjegvvdemrgguledvmeelrggsjeemfeduhegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegrjegvvdemrgguledvmeelrggsjeemfeduhegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegrjegvvdemrgguledvmeelrggsjeemfeduhegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnrghmtggroheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdpr
 hgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsghighgvrghshieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegtlhhrkhiflhhlmhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_000104_631534_24CE148E 
X-CRM114-Status: GOOD (  16.46  )
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

Hi Nam,

On 6/25/25 10:56, Nam Cao wrote:
> force_sig_fault() takes a spinlock, which is a sleeping lock with
> CONFIG_PREEMPT_RT=y. However, exception handling calls force_sig_fault()
> with interrupt disabled, causing a sleeping in atomic context warning.
>
> This can be reproduced using userspace programs such as:
>      int main() { asm ("ebreak"); }
> or
>      int main() { asm ("unimp"); }
>
> There is no reason that interrupt must be disabled while handling
> exceptions from userspace.
>
> Enable interrupt while handling user exceptions. This also has the added
> benefit of avoiding unnecessary delays in interrupt handling.
>
> Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> v2: stop enabling interrupts for kernel exceptions. For exceptions treated
> like NMI, it is wrong. For page faults, interrupts are already
> (conditionally) enabled.
> ---
>   arch/riscv/kernel/traps.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 9c83848797a78..80230de167def 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -6,6 +6,7 @@
>   #include <linux/cpu.h>
>   #include <linux/kernel.h>
>   #include <linux/init.h>
> +#include <linux/irqflags.h>
>   #include <linux/randomize_kstack.h>
>   #include <linux/sched.h>
>   #include <linux/sched/debug.h>
> @@ -151,7 +152,9 @@ asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
>   {										\
>   	if (user_mode(regs)) {							\
>   		irqentry_enter_from_user_mode(regs);				\
> +		local_irq_enable();						\
>   		do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
> +		local_irq_disable();						\
>   		irqentry_exit_to_user_mode(regs);				\
>   	} else {								\
>   		irqentry_state_t state = irqentry_nmi_enter(regs);		\
> @@ -173,17 +176,14 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>   
>   	if (user_mode(regs)) {
>   		irqentry_enter_from_user_mode(regs);
> -
>   		local_irq_enable();
>   
>   		handled = riscv_v_first_use_handler(regs);
> -
> -		local_irq_disable();
> -
>   		if (!handled)
>   			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
>   				      "Oops - illegal instruction");
>   
> +		local_irq_disable();
>   		irqentry_exit_to_user_mode(regs);
>   	} else {
>   		irqentry_state_t state = irqentry_nmi_enter(regs);
> @@ -308,9 +308,11 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
>   {
>   	if (user_mode(regs)) {
>   		irqentry_enter_from_user_mode(regs);
> +		local_irq_enable();
>   
>   		handle_break(regs);
>   
> +		local_irq_disable();
>   		irqentry_exit_to_user_mode(regs);
>   	} else {
>   		irqentry_state_t state = irqentry_nmi_enter(regs);


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Let's also add:

Cc: stable@vger.kernel.org

I pick this up for next week fixes PR.

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
