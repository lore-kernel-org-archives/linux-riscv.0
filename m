Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D12CEDD91
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpmo2ED3Z0b09Co0DupmNB43vwxz9sIgexYcxMYdPpE=; b=bNQyL8Z4hwiFNk
	tcyPF3shazcHNgw9RCTnlhICVFko9cbMPX9ZVBtqBURi8eeJG8FICxdja2ogXE4NDTSBEQuzF782d
	wT/aFdGrJX7IxTS1O2Je8ThWRlqQ9jOdh6QhyW8mfx5jBm189BgLGcpDUtMMxoZ9u/hdGGwcGrQ1d
	OxR+2PPsUZHZLJ+8uKL3E/jyQKmbScER+X3uSpPt672aW4HxcM5giEJaJfdQoM7SkXtfFbE0DaWEu
	yjT1dV43c6gpOaaf7Y/O+HPnaIg6KNRgF09Sk9ATDj2NrqovCMtG7tEWjYkx9RyOTJjOLeUUdBsZb
	p7uFYxAD9YkRKvLmd9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWQ7-00000009LW5-2jV2;
	Wed, 09 Oct 2024 13:08:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWLP-00000009KWM-0UFd
	for linux-riscv@bombadil.infradead.org;
	Wed, 09 Oct 2024 13:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W4vAvWfJ3r8piE5vQC7Xpi8Qfy+6fcrJmdiJulu4Dig=; b=rXIacV4ZasTLVgie3bNrUpp4nR
	QEB9ZDFEP6lMNW1VVe7ORy/lvZQqVYcZrKnWruvjsH6IM7KbluG8AGm74fDmANJGVZEPvJBx6xcdn
	dztpoSqD7Mm+t7RTjJeyoC5e2ArRm6i1j9JC9gQvNR75GvkeBDEHApVPs9GjfIMmfvu0LbZ/KYGT6
	p0FZMcByEghwrfl1ZogJdBLp31eArNfaw9Tl4mIK5sh6ZBXLeyvahgwriMGZrJjxdATwROm3EacUU
	xdxRZuBMUpw7D28iKNhgIiPJJN40OIaOvYfyCrtdx8pQA7iTO5Wfwzuy0vXXuQRDQ0wnno8g+2gEm
	SC4C1GWw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1syWLM-00000004xYw-18dM;
	Wed, 09 Oct 2024 13:03:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E283730057A; Wed,  9 Oct 2024 15:03:07 +0200 (CEST)
Date: Wed, 9 Oct 2024 15:03:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, ankur.a.arora@oracle.com, efault@gmx.de,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] riscv: add PREEMPT_LAZY support
Message-ID: <20241009130307.GN17263@noisy.programming.kicks-ass.net>
References: <20241009105709.887510-1-bigeasy@linutronix.de>
 <20241009105709.887510-4-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241009105709.887510-4-bigeasy@linutronix.de>
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

On Wed, Oct 09, 2024 at 12:50:57PM +0200, Sebastian Andrzej Siewior wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> riscv has switched to GENERIC_ENTRY, so adding PREEMPT_LAZY is as simple
> as adding TIF_NEED_RESCHED_LAZY related definitions and enabling
> ARCH_HAS_PREEMPT_LAZY.
> 
> [bigeasy: Replace old PREEMPT_AUTO bits with new PREEMPT_LAZY ]
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/riscv/Kconfig                   | 1 +
>  arch/riscv/include/asm/thread_info.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 62545946ecf43..3516c58480612 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -39,6 +39,7 @@ config RISCV
>  	select ARCH_HAS_MMIOWB
>  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>  	select ARCH_HAS_PMEM_API
> +	select ARCH_HAS_PREEMPT_LAZY
>  	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
>  	select ARCH_HAS_PTE_DEVMAP if 64BIT && MMU
>  	select ARCH_HAS_PTE_SPECIAL
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 9c10fb180f438..8b5a5ddea4293 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -107,6 +107,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
>   * - pending work-to-be-done flags are in lowest half-word
>   * - other flags in upper half-word(s)
>   */
> +#define TIF_NEED_RESCHED_LAZY	0       /* Lazy rescheduling needed */
>  #define TIF_NOTIFY_RESUME	1	/* callback before returning to user */
>  #define TIF_SIGPENDING		2	/* signal pending */
>  #define TIF_NEED_RESCHED	3	/* rescheduling necessary */

So for x86 I shuffled the flags around to have the two NEED_RESCHED ones
side-by-side. Not strictly required ofcourse, but...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
