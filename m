Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F0AEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFpOQN6KYTrMdCpzTW0AnTy816EvVrohyxU3vGxFmxE=; b=jqWHEDT/dgRASE
	8CALFbhtRn3poMifUtQ07mgXwLp4SW2tT+lSx0XEvplvhgmDPWoV8a3m7B8okF5tW3RJ5p0t8xjlS
	LdK1zHMfZCq4YBC4gZDF55ltGJX6JYlQdvTsvW2iJFK7UMseMiXvmkBtnnRdNdYab5K5vOwI5TfHx
	rnmjWuwRMAOmxwtEO8dwI3mLaHNX9Gx6nbmnfV08hlD6Xb/Rx1YLHzp9dJyjEG0WpMeWIFSbRZC2A
	H/8jKlOXnEA2M8lJ6Q5waWkG/lE2t+vTQcTtT/UHdczmlN/Mx8vWf/rR1t2wbiNiy7a4Cq8b2U38c
	KkyQRggTzNQ8fP1Q1PRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj4e-00DqWp-0s;
	Tue, 04 Jul 2023 16:40:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj4c-00DqWQ-1d
	for linux-riscv@bombadil.infradead.org;
	Tue, 04 Jul 2023 16:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rt0Sgef/0mx0ZYOvMVPEM6yNpv3ovZQ+3Nf5gB6MWzc=; b=rBDJ16SWf0Ay6zMTwd7f3d6kAy
	qL6gCNlEfMBkK0U+jU0qBzOfVEhTXG/Jv0AuHH3G28F0sguOTd83Pszb1jR+PaLG5s56Umax07fky
	V+iLFsLcxqEwkx3CI+pXhlpUSnVO+D96+/aU9xo4KoKnlqy9OpOKBBhZC+Vpw6TFOGUgslA1GZTkZ
	SBEi2TSZLYKwyfiKoMzYJyrNhynZiXZMtVBtouqBeRApWVW9F5b6hYk8oICgkC4wCyIR5RqJ6hssZ
	ZWjQWEW9UvhulmSJ8hJiipJeZ+BV+g0ahag6kXdsU0gmmWJLGcd55LQxknsw7phyM1cb1bgZs3jD+
	/FUXh9nA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qGj4R-009J9Z-4f; Tue, 04 Jul 2023 16:40:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 270993002E1;
	Tue,  4 Jul 2023 18:40:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 081F120292D0E; Tue,  4 Jul 2023 18:40:04 +0200 (CEST)
Date: Tue, 4 Jul 2023 18:40:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org,
	mark.rutland@arm.com, bjorn@kernel.org, palmer@dabbelt.com,
	bjorn@rivosinc.com, daniel.thompson@linaro.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
Message-ID: <20230704164003.GB83892@hirez.programming.kicks-ass.net>
References: <20230702025708.784106-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702025708.784106-1-guoren@kernel.org>
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

On Sat, Jul 01, 2023 at 10:57:07PM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The irqentry_nmi_enter/exit would force the current context into in_interrupt.
> That would trigger the kernel to dead panic, but the kdb still needs "ebreak" to
> debug the kernel.
> 
> Move irqentry_nmi_enter/exit to exception_enter/exit could correct handle_break
> of the kernel side.

This doesn't explain much if anything :/

I'm confused (probably because I don't know RISC-V very well), what's
EBREAK and how does it happen?

Specifically, if EBREAK can happen inside an local_irq_disable() region,
then the below change is actively wrong. Any exception/interrupt that
can happen while local_irq_disable() must be treated like an NMI.

If that makes kdb unhappy, fix kdb.

> Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
> Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/riscv/kernel/traps.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index efc6b649985a..ed0eb9452f9e 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -18,6 +18,7 @@
>  #include <linux/irq.h>
>  #include <linux/kexec.h>
>  #include <linux/entry-common.h>
> +#include <linux/context_tracking.h>
>  
>  #include <asm/asm-prototypes.h>
>  #include <asm/bug.h>
> @@ -257,11 +258,11 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
>  
>  		irqentry_exit_to_user_mode(regs);
>  	} else {
> -		irqentry_state_t state = irqentry_nmi_enter(regs);
> +		enum ctx_state prev_state = exception_enter();
>  
>  		handle_break(regs);
>  
> -		irqentry_nmi_exit(regs, state);
> +		exception_exit(prev_state);
>  	}
>  }
>  
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
