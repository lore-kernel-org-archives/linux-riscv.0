Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09F4C54EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6PWoPTrPtWMcCDz9lveAF6o3C7AMrqyjkORyveY0mE=; b=DpgCJ8Zt868b8C
	bMAttsYeef5178wtlJY0gqEbTbaSgaFnfgLLVwyueeLydF6cR+3j4X7nw7QQWHrnghmZeg47dhXJu
	qjx5RGEDfkmVgGoX6TE2kZfBfOJHv6Z03+yKxczs/7JhtKbAGYjxEujVzu2MR7LrEw71J6wYdFfnm
	nq7tSzTAq4FCzQ2sho1IMnxR5JsJ2gZ9VJql2+wic/Tnz42DjSXPgQBQKNN7byxnecyRewLozQTPu
	5DsmS6uklqmdHeWejcsQZCwH5OK6RS7T/Q+OK27AZCin7FpBcDbTs69EalesZ+I2UOBnFm290B1Fe
	mwafiLSwUBo+tSGp0Dmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGv3-00BtEt-2D; Mon, 19 Sep 2022 13:34:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGv0-00BtDz-V0
	for linux-riscv@bombadil.infradead.org; Mon, 19 Sep 2022 13:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YrQErvD5aTHNtMMFMvCNd+tRu0DRAE3Ac96/4No0n68=; b=UXM58Jc95iA8ylu7QLPL+yn1UC
	KwsT7hYHmSlBdWXnqdOhFLBkfmHGlipreMaL6DMvVy+BxkgCTt15NtVMwiI5x4W7QuWfxuIWfEXSM
	sKLOxo4BXbChNP8AQsRKj742EQwGc5f0DiDOeNujrgWId3A9DbXFzdLnl4EmALX9+62dslQhBwjAq
	+7/OkGvK+ckl0vX8AeGreyg1lh+viJRTp0Z6AOkDHYr6ryFzqxxxnOwrkzZXOdQIqE9pG8KrLwTVX
	BHNcyqy3xqvvghmxsqElO6YYtXBt49SIkgc33wcpcTOyB8Une1v9/Os9FVEEG50QeOv0p77Q7m3mS
	wJelsIqA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGus-004jbu-IG; Mon, 19 Sep 2022 13:34:30 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D2C4F300074;
	Mon, 19 Sep 2022 15:34:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id B37DA2B634088; Mon, 19 Sep 2022 15:34:25 +0200 (CEST)
Date: Mon, 19 Sep 2022 15:34:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, mark.rutland@arm.com,
	zouyipeng@huawei.com, bigeasy@linutronix.de,
	David.Laight@aculab.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V5 07/11] riscv: convert to generic entry
Message-ID: <Yyhv4UUXuSfvMOw+@hirez.programming.kicks-ass.net>
References: <20220918155246.1203293-1-guoren@kernel.org>
 <20220918155246.1203293-8-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918155246.1203293-8-guoren@kernel.org>
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

On Sun, Sep 18, 2022 at 11:52:42AM -0400, guoren@kernel.org wrote:

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

FWIW; on x86 I've classified many of the 'from-kernel' traps as
NMI-like, since those traps can happen from any context, including with
IRQs disabled.

The basic shape of the trap handlers looks a little like:

	if (user_mode(regs)) {
		irqenrty_enter_from_user_mode(regs);
		do_user_trap();
		irqentry_exit_to_user_mode(regs);
	} else {
		irqentry_state_t state = irqentry_nmi_enter(regs);
		do_kernel_trap();
		irqentry_nmi_exit(regs, state);
	}

Not saying you have to match Risc-V in this patch-set, just something to
consider.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
