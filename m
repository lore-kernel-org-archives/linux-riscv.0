Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53E1C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 00:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gsq0TzDxjNZ4zySKfi/g/41c8kgYxuTTJaaOI6u3/Q=; b=oVMdY0KksIrFne
	Wg7ajO4LPRxEYq8yDXIlq4fvYsKwl/70+IgNHfHYzSs++WuuUKwbKdJgRfB+EGXGeSjtiHdHYhMbh
	CQpF2yAY1EE21URtnsfdslpvyFUv7FAWKc5tEAakZ1imMweYqayWNKGwOWSv0ORu09XHTg8R9CEnT
	PlC0yRWVMQJ+bA0SJliSQhf5x//BwyxEv7xG5KBMILdKdIAiEHzADZ8hIk3mBHGaG3oxHpl1c2E7n
	t8fYIKmkEWWXdMFQuPwJeFqhda1pIJ1GmVzmguKWWZCsR5Rt7z3qrNMBx7nqc+62s274CyzMDoPuo
	u4aiTToBYosCQGDpF+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wejBD-00000000Qgb-1cV4;
	Wed, 01 Jul 2026 00:51:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wejBB-00000000QgI-2bAS
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 00:51:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE817404A9;
	Wed,  1 Jul 2026 00:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AE31F000E9;
	Wed,  1 Jul 2026 00:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782867112;
	bh=zLi7Vg2dPMjNzDP//hBvVKYr8bQb2SeKAXa4U7pR2ko=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=X16rURSX7a1ZcuXZZyv6neAvXp/8RmXIg4iNMWu0ldcqoTZnWIQEA5unHAhf05B0W
	 KDL4T0J2SCUMMy3LySSpl/9vdzfM5Q5xkdqOMgcruvjKPysnycz2jVDDK7yGNlWDak
	 Im33dqEQkGfLOv/LNRfa08VpbdEPD67NDcpkApBWvRXx9evaS4QiY62zdICz5M2Pir
	 RcqqHI+b64K71nvGvaMDv5fA/kXkz/AWXTqxbUt1gQvuhgU4X9fHSYUWWKtOfeHY8C
	 UL52V/WOFdtKzPNdjAcs1JsdpOQUzEIiB0xnl+CRTwvFUg2LsOnGl/SRlxgKwlWRFP
	 A7t6FuHcTZteQ==
Date: Tue, 30 Jun 2026 18:51:49 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Martin Kaiser <martin@kaiser.cx>, Masami Hiramatsu <mhiramat@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: probes: save original sp in rethook trampoline
In-Reply-To: <20260701073335.548d8f0b435b1a5fb4e41a69@kernel.org>
Message-ID: <d588ef0f-6eb0-665b-871f-5fb5a6c90547@kernel.org>
References: <20260630194010.1824039-1-martin@kaiser.cx> <20260701073335.548d8f0b435b1a5fb4e41a69@kernel.org>
MIME-Version: 1.0
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

On Wed, 1 Jul 2026, Masami Hiramatsu wrote:

> On Tue, 30 Jun 2026 21:40:03 +0200
> Martin Kaiser <martin@kaiser.cx> wrote:
> 
> > Reading a word from the stack in a kretprobe crashes a risc-v kernel.
> > 
> > $ cd /sys/kernel/tracing/
> > $ echo 'r n_tty_write $stack0' > dynamic_events
> > $ echo 1 > events/kprobes/enable
> > Unable to handle kernel paging request at virtual address 0000000200000128
> > ...
> > [<ffffffff80016d16>] regs_get_kernel_stack_nth+0x26/0x38
> > [<ffffffff80177196>] process_fetch_insn+0x3ee/0x760
> > [<ffffffff80177836>] kretprobe_trace_func+0x116/0x1f0
> > [<ffffffff8017795a>] kretprobe_dispatcher+0x4a/0x58
> > [<ffffffff8013572e>] kretprobe_rethook_handler+0x5e/0x90
> > [<ffffffff80180838>] rethook_trampoline_handler+0x70/0x108
> > [<ffffffff8001ba32>] arch_rethook_trampoline_callback+0x12/0x1c
> > [<ffffffff8001ba84>] arch_rethook_trampoline+0x48/0x94
> > [<ffffffff8067872a>] tty_write+0x1a/0x30
> > 
> > In regs_get_kernel_stack_nth, regs->sp contains an arbitrary value.
> > 
> > arch_rethook_trampoline saves the registers from the probed function in a
> > struct pt_regs. sp is not saved. Instead, sp is decremented for
> > arch_rethook_trampoline's local stack.
> > 
> > Fix this crash and save the original sp along with the other registers.
> > Use a0 as a temporary register, it is overwritten anyway.
> 
> Good catch!
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> I would like this to be handled by the RISC-V maintainers.

Thanks, added a Fixes: tag and cc'ed stable, and queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
