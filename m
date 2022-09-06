Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C90C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUchTEI7UqJ+asLVN4/hHHUoL9yCv+noLAucD70Zv1Q=; b=jSUTxmYdLdyUfx
	MkvN2HqYunUixk2QV+L2GInX55JyUa2BFbbQDONZx37M/QkKJoT7sY16sFaLuKaflY+zIY5LV9NkK
	ROtFleCwpenv9BoZJA4eOYkTcnxNOE0wkqdQejGIh79NxDw9xjPTBGTpIXzr9/GIfRtFsKkEyCB7v
	JbutefqZ4ZfM9ni7LNqev0ECkfMuqPDbPxVJXixnjAuydeb2m5rYPo4rNCA8DDU3oHcpSElGw/5kG
	Iw3UIiXwY+457XeVZJaSLlpM46yGnBP3sMy03n6hpr92kjyP5xUMnnT0O1eyg76FyjbDT9WjKdsdz
	B4iKS0doqnMfzp3RIl1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUlI-00BkSI-GM; Tue, 06 Sep 2022 09:20:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUlG-00BkRw-O0
	for linux-riscv@bombadil.infradead.org; Tue, 06 Sep 2022 09:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vy6nhn+svKRWk4UHHjIpjrQPm3rnkDXTTEC9kQv7hsI=; b=m+cdFEpiagnAD0rrm6GsVDWg3B
	2Rk21UjJ5I47wq+rl9+JefLh4rt5d2c1T78jtRBAsTx5gYUmfEZRipHr8uCSESCeyQClCka0t2xlZ
	MLSQ9OwhvtSviIC5TGH3xqEkE9Wey1XadKVr7M2HPoSnX0v1pBdnnIErQmZNA5ocZY0A/kjqvWixG
	pPjyC8sULaMaAERtQZK1Hdvdj3FwcA2qT5w4ZtnSSF2QGKuZnxsfigyGCrcBs94/42/TMXO3Xofj9
	/p9I+ae4AHtYpM7Cn7zb+IDsUVlSYPqn1uJgUqD0vd3e8qvcosd+IE26idDdnYpEK7sZiYytz6NOy
	/yamx01g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUlA-00AGRW-KJ; Tue, 06 Sep 2022 09:20:44 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B0909300023;
	Tue,  6 Sep 2022 11:20:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5EA1920239D76; Tue,  6 Sep 2022 11:20:40 +0200 (CEST)
Date: Tue, 6 Sep 2022 11:20:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, bigeasy@linutronix.de,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V3 4/7] riscv: convert to generic entry
Message-ID: <YxcQ6NoPf3AH0EXe@hirez.programming.kicks-ass.net>
References: <20220906035423.634617-1-guoren@kernel.org>
 <20220906035423.634617-5-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906035423.634617-5-guoren@kernel.org>
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

On Mon, Sep 05, 2022 at 11:54:20PM -0400, guoren@kernel.org wrote:

> +asmlinkage void noinstr do_riscv_irq(struct pt_regs *regs)
> +{
> +	struct pt_regs *old_regs;
> +	irqentry_state_t state = irqentry_enter(regs);
> +
> +	irq_enter_rcu();
> +	old_regs = set_irq_regs(regs);
> +	handle_arch_irq(regs);
> +	set_irq_regs(old_regs);
> +	irq_exit_rcu();
> +
> +	irqentry_exit(regs, state);
> +}

The above is right in that everything that calls irqentry_enter() should
be noinstr; however all the below instances get it wrong:

>  #define DO_ERROR_INFO(name, signo, code, str)				\
>  asmlinkage __visible __trap_section void name(struct pt_regs *regs)	\
>  {									\
> +	irqentry_state_t state = irqentry_enter(regs);			\
>  	do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
> +	irqentry_exit(regs, state);					\
>  }
>  
>  DO_ERROR_INFO(do_trap_unknown,
> @@ -123,18 +126,22 @@ int handle_misaligned_store(struct pt_regs *regs);
>  
>  asmlinkage void __trap_section do_trap_load_misaligned(struct pt_regs *regs)
>  {
> +	irqentry_state_t state = irqentry_enter(regs);
>  	if (!handle_misaligned_load(regs))
>  		return;
>  	do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
>  		      "Oops - load address misaligned");
> +	irqentry_exit(regs, state);
>  }
>  
>  asmlinkage void __trap_section do_trap_store_misaligned(struct pt_regs *regs)
>  {
> +	irqentry_state_t state = irqentry_enter(regs);
>  	if (!handle_misaligned_store(regs))
>  		return;
>  	do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
>  		      "Oops - store (or AMO) address misaligned");
> +	irqentry_exit(regs, state);
>  }
>  #endif
>  DO_ERROR_INFO(do_trap_store_fault,
> @@ -158,6 +165,8 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
>  
>  asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
>  {
> +	irqentry_state_t state = irqentry_enter(regs);
> +
>  #ifdef CONFIG_KPROBES
>  	if (kprobe_single_step_handler(regs))
>  		return;
> @@ -185,6 +194,8 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
>  		regs->epc += get_break_insn_length(regs->epc);
>  	else
>  		die(regs, "Kernel BUG");
> +
> +	irqentry_exit(regs, state);
>  }
>  NOKPROBE_SYMBOL(do_trap_break);

> +asmlinkage void do_page_fault(struct pt_regs *regs)
> +{
> +	irqentry_state_t state = irqentry_enter(regs);
> +
> +	__do_page_fault(regs);
> +
> +	irqentry_exit(regs, state);
> +}
>  NOKPROBE_SYMBOL(do_page_fault);

Without noinstr the compiler is free to insert instrumentation (think
all the k*SAN, KCov, GCov, ftrace etc..) which can call code we're not
yet ready to run this early in the entry path, for instance it could
rely on RCU which isn't on yet, or expect lockdep state.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
