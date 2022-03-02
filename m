Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F26C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Fz6x/maQrjfsRGUlbd7xakyaZa4zLq1/fJCDWoLkGFA=; b=BjPs47ymXGNC1JipJpK3DKnSMX
	7oTrn0Tc/1LkXueLy3kDmUn7XD01VYwU7nt/IgERHlo6Cr0Uxijxc+k29UQ5yKLIL+bFNA7UEgyQN
	biPlZzfqQbXodDE/j1IY/WOGs6+ykd8+SHeGR4rBaC+Y1pRb7+PC9T3iAitPD6wMMWQ3PY+eh6n3K
	+uIam4cN/kAiirEYNGVlTqai9MBC2lXiZQ9Qh9KExGf4pkFgjm3dkhr2jSrXQnv+P+G60AeFsrM9h
	U+nsYBwzUMvgScRxpVoO1QIJo+LBvuLgZMrevZUiLff6TRMP8RYhKYR/OHWoymO1z1CjWI/OnCoIW
	B5CUK6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPRrL-003L9M-0w; Wed, 02 Mar 2022 16:29:51 +0000
Received: from mail.efficios.com ([167.114.26.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPRr9-003L7U-3F
 for linux-riscv@lists.infradead.org; Wed, 02 Mar 2022 16:29:42 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 2A9752ACF65;
 Wed,  2 Mar 2022 11:29:24 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id c1IjD9b563KN; Wed,  2 Mar 2022 11:29:23 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id A5DCD2ACEDE;
 Wed,  2 Mar 2022 11:29:23 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com A5DCD2ACEDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1646238563;
 bh=M23joKmJ84vH6pcyqmJK54E++qRiKOf3AxQaM37AdgA=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ItySryBxFx15KfH5oIeeRMgDyYG/K3s8mv11VQQ9OhOMbfh+ODOEgatj6nh5Z1xpy
 RDeNk8nloYSKLBgh20GIEpnVjrPSSK9mWh/CHkROl3cYYMGMtv0kBTcgg6Vu20dPRT
 ZtT4nGkn6BSPcPk3RqQBnG1qo0ZZJltIix+7FgeZRKLrQbjsxXwyzm73KrwghlweBF
 nfUQDzV8a7qurrI12sdN2hkjYQQK5/5KfXHd7Jb7qkkW3o19zi6q3VQxbEzmBJMc3s
 aKp5cF4V2tY6ZBoa+t0pGON3QrRmFZCmxSZidRsopMU6HXgJUtY2br7Cy4pZCUYRLJ
 kq3wqeuVWKXkQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5f9gwOuaMgDY; Wed,  2 Mar 2022 11:29:23 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 8CEDD2AD285;
 Wed,  2 Mar 2022 11:29:23 -0500 (EST)
Date: Wed, 2 Mar 2022 11:29:23 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Peter Zijlstra <peterz@infradead.org>
Message-ID: <1029793052.117276.1646238563508.JavaMail.zimbra@efficios.com>
In-Reply-To: <20220302023048.6140-2-vincent.chen@sifive.com>
References: <20220302023048.6140-1-vincent.chen@sifive.com>
 <20220302023048.6140-2-vincent.chen@sifive.com>
Subject: Re: [PATCH v3 1/2] RISC-V: Add support for restartable sequence
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4203 (ZimbraWebClient - FF97 (Linux)/8.8.15_GA_4232)
Thread-Topic: RISC-V: Add support for restartable sequence
Thread-Index: DmlkRBNFeTtBnZPonQizbFCYIbqQUw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_082939_324871_28862F96 
X-CRM114-Status: GOOD (  16.52  )
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

----- On Mar 1, 2022, at 9:30 PM, Vincent Chen vincent.chen@sifive.com wrote:

> Add calls to rseq_signal_deliver() and rseq_syscall() to introduce RSEQ
> support.
> 
> 1. Call the rseq_signal_deliver() function to fixup on the pre-signal
>   frame when a signal is delivered on top of a restartable sequence
>   critical section.
> 
> 2. Check that system calls are not invoked from within rseq critical
>   sections by invoking rseq_signal() from ret_from_syscall(). With
>   CONFIG_DEBUG_RSEQ, such behavior results in termination of the
>   process with SIGSEGV.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Will it be picked by by riscv maintainers ?

Thanks,

Mathieu

> ---
> arch/riscv/Kconfig         | 1 +
> arch/riscv/kernel/entry.S  | 4 ++++
> arch/riscv/kernel/signal.c | 2 ++
> 3 files changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5adcbd9b5e88..67a671b099b6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -101,6 +101,7 @@ config RISCV
> 	select HAVE_FUNCTION_ARG_ACCESS_API
> 	select HAVE_STACKPROTECTOR
> 	select HAVE_SYSCALL_TRACEPOINTS
> +	select HAVE_RSEQ
> 	select IRQ_DOMAIN
> 	select IRQ_FORCED_THREADING
> 	select MODULES_USE_ELF_RELA if MODULES
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index ed29e9c8f660..56ada2a583fa 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -225,6 +225,10 @@ ret_from_syscall:
> 	 * (If it was configured with SECCOMP_RET_ERRNO/TRACE)
> 	 */
> ret_from_syscall_rejected:
> +#ifdef CONFIG_DEBUG_RSEQ
> +	move a0, sp
> +	call rseq_syscall
> +#endif
> 	/* Trace syscalls, but only if requested by the user. */
> 	REG_L t0, TASK_TI_FLAGS(tp)
> 	andi t0, t0, _TIF_SYSCALL_WORK
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index c2d5ecbe5526..16da3c3b53a1 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -258,6 +258,8 @@ static void handle_signal(struct ksignal *ksig, struct
> pt_regs *regs)
> 		}
> 	}
> 
> +	rseq_signal_deliver(ksig, regs);
> +
> 	/* Set up the stack frame */
> 	ret = setup_rt_frame(ksig, oldset, regs);
> 
> --
> 2.17.1

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
