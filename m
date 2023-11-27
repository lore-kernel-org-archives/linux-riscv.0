Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B11FC0755A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jlq/z5OtPZnk4JQSNsQ1+oZO6JoS6tjYtHBI3T8WcM=; b=0Po5BUQYZV9Owg
	R1H4e4iw6rZjS6eUhD32jSAmcVXmE1PVoy6Ck06OCQKi72nYd6AcN32v1Qn52UO988w++z8ReN8AZ
	Hw5V46AATImJ6/78VZNIwGmBxt6ImcKoBFgoBG8EN15OFYi2VtglhQBJU53zc/CScz+50OOXb22qs
	UnlqIOHSj8x4KV3chSGewuxqUvfIssLDy0v27bgCgX+Q4kd7HB9vQDPipsHj9tuV6mKy1h2B0RNCE
	1aLFx20jXjFjsknBaaqZSlRs+MauD3KWdMAlcPg+gDTB9PlhLrCQUI0iYSD60fQByoe7GunrTUV1D
	8DabrBkn3g3gePvdm5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bfd-002a1I-2v;
	Mon, 27 Nov 2023 13:29:07 +0000
Received: from [2607:5300:203:b2ee::31e5] (helo=smtpout.efficios.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bfY-002Zzg-0P
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 13:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1701091738;
	bh=eA/Ebz+NfzTlrh+9vkBwg8LcxLGPp/UbUBh8p02oCwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YsJiiOuzAJRQsxju0pHZ+mnHUHZ4BwE2N1WyS3xLcuAAusgZzlGo8p/1rwJx8A4Ea
	 4eJTVAtuMUREMyv59zAEegOMWQWg0yLbNaySDKIXqBpf1L6BMcmlwfdqCWe6nymeb4
	 J3r/jkDzWa9qggLNrQs73W8xpotSRulMP+IDOUVhmzbIkUf6idZkVexDaypYDUXmrY
	 uyhMx/4eCREw9f2vkVtlVZOh8W6bgljQYrLG7opnUYJhnWUV6zcQ47U6v88FUd8oFx
	 QRWQBYB6XvuWE1AA08PlIUPyIqeM4HhzEfy5w4VdF+aNIPgb/1ZILu7po0jPxC13ne
	 o8slyvWf88+0A==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4Sf5yf322qz1dXq;
	Mon, 27 Nov 2023 08:28:58 -0500 (EST)
Message-ID: <91ab0210-07f9-42c4-af7f-a98799250cf7@efficios.com>
Date: Mon, 27 Nov 2023 08:28:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>, paulmck@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Cc: mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
 charlie@rivosinc.com, rehn@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231127103235.28442-1-parri.andrea@gmail.com>
 <20231127103235.28442-3-parri.andrea@gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <20231127103235.28442-3-parri.andrea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_052900_226958_11FA3397 
X-CRM114-Status: GOOD (  18.88  )
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

On 2023-11-27 05:32, Andrea Parri wrote:
> RISC-V uses xRET instructions on return from interrupt and to go back
> to user-space; the xRET instruction is not core serializing.
> 
> Use FENCE.I for providing core serialization as follows:
> 
>   - by calling sync_core_before_usermode() on return from interrupt (cf.
>     ipi_sync_core()),
> 
>   - via switch_mm() and sync_core_before_usermode() (respectively, for
>     uthread->uthread and kthread->uthread transitions) to go back to
>     user-space.
> 
> On RISC-V, the serialization in switch_mm() is activated by resetting
> the icache_stale_mask of the mm at prepare_sync_core_cmd().
> 
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---

[...]

> +
> +#ifdef CONFIG_SMP
> +/*
> + * Ensure the next switch_mm() on every CPU issues a core serializing
> + * instruction for the given @mm.
> + */
> +static inline void prepare_sync_core_cmd(struct mm_struct *mm)
> +{
> +	cpumask_setall(&mm->context.icache_stale_mask);

I am concerned about the possibility that this change lacks two barriers in the
following scenario:

On a transition from uthread -> uthread on [CPU 0], from a thread belonging to
another mm to a thread belonging to the mm [!mm -> mm] for which a concurrent
membarrier sync-core is done on [CPU 1]:

- [CPU 1] sets all bits in the mm icache_stale_mask [A]. There are no barriers
   associated with these stores.

- [CPU 0] store to rq->curr [B] (by the scheduler) vs [CPU 1] loads rq->curr [C]
   within membarrier to decide if the IPI should be skipped. Let's say CPU 1 observes
   cpu_rq(0)->curr->mm != mm, so it skips the IPI.

- This means membarrier relies on switch_mm() to issue the sync-core.

- [CPU 0] switch_mm() loads [D] the icache_stale_mask. If the bit is zero, switch_mm()
   may incorrectly skip the sync-core.

AFAIU, [C] can be reordered before [A] because there is no barrier between those
operations within membarrier. I suspect it can cause the switch_mm() code to skip
a needed sync-core.

AFAIU, [D] can be reordered before [B] because there is no documented barrier
between those operations within the scheduler, which can also cause switch_mm()
to skip a needed sync-core.

We possibly have a similar scenario for uthread->uthread when the scheduler
switches between mm -> !mm.

One way to fix this would be to add the following barriers:

- A smp_mb() between [A] and [C], possibly just after cpumask_setall() in
   prepare_sync_core_cmd(), with comments detailing the ordering it guarantees,
- A smp_mb() between [B] and [D], possibly just before cpumask_test_cpu() in
   flush_icache_deferred(), with appropriate comments.

Am I missing something ?

Thanks,

Mathieu

> +}
> +#else
> +static inline void prepare_sync_core_cmd(struct mm_struct *mm)
> +{
> +}
> +#endif /* CONFIG_SMP */
> +
> +#endif /* _ASM_RISCV_SYNC_CORE_H */

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
