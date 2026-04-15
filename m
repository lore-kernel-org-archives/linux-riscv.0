Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8BFFA0C30
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 05:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qn7gqeyAoBu28Y1FV60Xb3uy+rRDbq1IkGpCIbOEM8E=; b=MAFSQJ8uNW5MTZ
	4hjuNwn2rbcBxNqURd5JEv+Zvd4Hb3RqUxgemCCZVKR8X8WCMputK19y4Td2vT1tfVJC289/D0JT7
	N3yYCyGFAtqJW7Q6XdwSCon+t7FCzxr3FzgyrsOTU8NRAOJhx6vXhZEDdDMo5nKvIDVk51FfDofG5
	xjgtCDInSo7bBZ2q5dmzWdLBLv8GxDXOdpXCXR+/9/IC6kwAyNSie1Ny3BaaLSm6Ki9iMaQx5qbsC
	ZTXb2u9+wTJwTxIVWge++/d60eH8c9oW4AHCPRoI1VR8ylMEhQEyd4ZwJ9vRyhP5FemCfVut8D5Bl
	/A4LoAVz4WSm13yIiPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCt33-00000000c0F-2BOM;
	Wed, 15 Apr 2026 05:44:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCt30-00000000bzl-2bJQ
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 05:44:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3023B44352;
	Wed, 15 Apr 2026 05:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9476CC2BCB0;
	Wed, 15 Apr 2026 05:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776231861;
	bh=AH20hvpu+D4qi2v6kSM8ydKG6lVcHQUGwCcXo764m2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UQS9PJ2dvuriIS6Zzg9kPQ2SZM4aFsC/Qvika0GQFzqIBh8zFnc73U8uMK6Fcwe4k
	 xepMUFHalQ54HZf+FhrlC/8aMRm1ecB4ELaCy06+lRK5RIW4xMYr9cxqvYJhDCbLwL
	 7IlAhShgZUHV6ZfjIvRE8c4nlz4YP/luIf+4/B9gok/EKBb8EGYVpGY48TGwmlSW+B
	 i+PU0/Bo5HJeit65EKU0UmOmd3yl3pN6fH8FOJE1H4eFlR7VfHCoOD+wYJS1dPd21e
	 KzvyoEuXiEDqySemJydp2XyzCV3DW6bSg1bD14P9kuEZKjE1vtXrHjMQzFuO1WjL0h
	 1yfSclanj1Hvg==
Message-ID: <6f07e5eb-306a-4d29-840c-c29771cff9bd@kernel.org>
Date: Wed, 15 Apr 2026 15:44:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/perf: riscv: do not restart throttled events
 after overflow
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
 atish.patra@linux.dev, anup@brainfault.org, will@kernel.org,
 palmer@dabbelt.com, pjw@kernel.org, cuiyunhui@bytedance.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 yuanzhu@bytedance.com
References: <20260415032017.10712-1-zhangzhanpeng.jasper@bytedance.com>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <20260415032017.10712-1-zhangzhanpeng.jasper@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_224422_708704_2BA7FA1B 
X-CRM114-Status: GOOD (  26.94  )
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

On 15/4/2026 13:20, Zhanpeng Zhang wrote:
> Perf core uses `event->hw.interrupts == MAX_INTERRUPTS` to keep
> throttled events stopped until it explicitly unthrottles them later.
> 
> However, current RISC-V Perf/PMU system unconditionally restarts all the
> counters at the end of overflow handler, which bypasses the perf core's
> throttle mechanism. Therefore, an unreasonable small sampling period
> such as `perf top -c 20` may cause an IRQ storm and eventually leads to
> soft lockup.
> 
> Fix this by filtering the counter start/restart mask: do not restart
> counters for events already marked as throttled by the perf core. This
> retains the throttle effect and prevents interrupt storms in such
> workloads.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>   drivers/perf/riscv_pmu_sbi.c | 45 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 385af5e6e6d0..664f9b86c468 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -60,6 +60,33 @@ asm volatile(ALTERNATIVE(						\
>   #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
>   
>   PMU_FORMAT_ATTR(event, "config:0-55");
> +static inline bool rvpmu_perf_event_is_throttled(struct perf_event *event)
> +{
> +	return event->hw.interrupts == MAX_INTERRUPTS;
> +}

I don't see any other arch or driver code looking for hw.interrupts == 
MAX_INTERRUPTS.

The events/core.c code calls event->pmu->stop(event, 0) when an event is 
throttled. I think the arch/driver code should be using that as the 
signal that the event should no longer be running.

So something like filtering out stopped events (PERF_HES_STOPPED) seems 
like it would be the right fix.

> +/*
> + * Return a mask of counters that must not be restarted.
> + * `base` is the starting bit index to limit the mask to this long word.
> + */
> +static inline unsigned long rvpmu_get_throttled_mask(struct perf_event **events,
> +						     unsigned long mask,
> +						     int base)
> +{
> +	unsigned long tmp = mask, throttled = 0;
> +	int bit = -1;
> +	int nr_bits = min_t(int, BITS_PER_LONG, RISCV_MAX_COUNTERS - base);
> +
> +	for_each_set_bit(bit, &tmp, nr_bits) {
> +		struct perf_event *event = events[bit];
> +
> +		if (!event || rvpmu_perf_event_is_throttled(event))
> +			throttled |= BIT(bit);
> +	}
> +
> +	return throttled;
> +}
> +
>   PMU_FORMAT_ATTR(firmware, "config:62-63");
>   
>   static bool sbi_v2_available;
> @@ -1005,6 +1032,8 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
>   	for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
>   		if (ctr_ovf_mask & BIT(idx)) {
>   			event = cpu_hw_evt->events[idx];
> +			if (!event || rvpmu_perf_event_is_throttled(event))
> +				continue;
>   			hwc = &event->hw;
>   			max_period = riscv_pmu_ctr_get_width_mask(event);
>   			init_val = local64_read(&hwc->prev_count) & max_period;
> @@ -1017,13 +1046,25 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
>   	}
>   
>   	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
> +		int base = i * BITS_PER_LONG;
> +		unsigned long throttled;
> +		unsigned long used;
> +		unsigned long start_mask;
> +
> +		used = cpu_hw_evt->used_hw_ctrs[i];
> +		throttled = rvpmu_get_throttled_mask(cpu_hw_evt->events + base,
> +						     used, base);
> +		start_mask = used & ~throttled;
> +		if (!start_mask)
> +			continue;
> +
>   		/* Restore the counter values to relative indices for used hw counters */
>   		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG)
>   			sdata->ctr_values[idx] =
>   					cpu_hw_evt->snapshot_cval_shcopy[idx + i * BITS_PER_LONG];
>   		/* Start all the counters in a single shot */
> -		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx * BITS_PER_LONG,
> -			  cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
> +		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG,
> +			  start_mask, flag, 0, 0, 0);
>   	}
>   }

You only patch the snapshot case. Is the non-snapshot path unaffected? 
If so you should explain why.

Can you identify a commit where the bad behaviour was introduced? Maybe 
when snapshot support was added, if indeed it's only the snapshot path 
that is buggy.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
