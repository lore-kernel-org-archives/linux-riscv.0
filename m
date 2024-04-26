Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C0DC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSw08FbZlul9PumBqKNsVCcVHgxN5Os4E2tO73axSv8=; b=JpXquVeawpKA77
	hGC4j0L5kteYzryECQMt4NIbGNyWAyqXrRsoPk50nzeLqrobnBgj8F7C/zcjbrKT0FbwM5ZhbUXou
	JN00kRi4mMgTULplx3wk9rHVDx8S7AjOcAX79plqAXl+MXxellq1+75bc44Es76ZjHd7OLKAuxC3P
	iDoZBDVtP599Fb+KSJ5CQcrW6yQTCtOYvEEJ2BtFZ5yiT5uMP4XgVArlMvn8oMgxd+jIYmErIZ8PJ
	kSZX8fUsHCOX5i7QTDsrOkDy1H+hHl56LifoZmz4GFVrY1dbpXvS+GUZvzLrArq4EqaEhA0MZtH7c
	Lbx5f/betR45sA47SMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Nea-0000000D5ZF-3Dh0;
	Fri, 26 Apr 2024 15:38:24 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NeX-0000000D5Xr-1kse
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 15:38:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ee0642f718so2543265b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 08:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714145899; x=1714750699; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rMiLznvZUs0GBNB1OZlTr0KrJy8gIZ6aV85pKvWU848=;
        b=H2/ggZnS0EMPfeZeQqiP8K2TwycBvK2By8w2sVNu1JCWQ7nlQVbBTDKisDK0bVRpGl
         WeQADhyQzzw2dg/gi+zlmsfoTjMPJViiMYU46KEpMg4bDqlR8zj6mtRFHaztlo5I2Jnf
         Iix7Z8eUjlPYGFuDbQLcSSMxWYiLxYSy5V8ZIbrAJKINikCxwvB1PR9bPJwe9DInRNsP
         4of01tATBEqdd9ZmvvcIlPzW6S/28wXWZRb1Y+2b88bk4iL5wyvGbF+4Rhq5QkQ2/hmR
         NBSyF0x24tb2bHqtBwf0/+8qR+jeb8RChvHb6kfU8CE7yEeklcJCU279iXw8exwwsP4y
         +H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145899; x=1714750699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMiLznvZUs0GBNB1OZlTr0KrJy8gIZ6aV85pKvWU848=;
        b=aoQNHokH89Q4gPDCBcXURF4/ppSdTcrbMBPZEbmeX5e1wp7Py/zv5BkcHrkD3bnXBO
         x1x/FitS3UESMDwvrSMRnzkaZibpJsjDkJzqt5wnmKI988RYJ/1Xm5Oa3qD1TosbRoRr
         4o4kUZq4b/wS4ZcW0+knmlA+pqHy6hhxT66g6vUcbhwYwVrmT3G6OdrATYUtKXDv/02R
         Kd10BlrAjy7RWNhr08oQDL+1eSmxW3s0e1W7xYLl4UgZzZYKR3/XFfJ5znzH1TOqaORK
         nW0WJzK6tCk3eHAEGum2xuj8Tby/wBnFpf8B8RdMISqDNNHevCMbGj5Ytpy1cANOohXy
         8Ogg==
X-Forwarded-Encrypted: i=1; AJvYcCWNidFponjoT+sUFGmMxqfs9yK0o8hSQkskvwMjcWm7vKHOG9KBUMsIrJ3GmESCxLX/g8/fezjK3/K8hT3rSxgROS6sXcUPxfp+MQv5A/u4
X-Gm-Message-State: AOJu0YwoeDoEyHHJod9xiwrP/usIfgc1jxu51eX2wxIY61QCwcLUiuRX
	U486YvsCH+CfBou8N1gSUrpQ19Ri79a7FBJHMnLpocyInjvRVt7w3zNFKC4mtBo=
X-Google-Smtp-Source: AGHT+IF7VkjqrxPNuetS5kHNa1v13FsD2dn4ho4/1+CPXzzhAsz+Jvc4yJ+oFnPmy62QYNKdzqrmRA==
X-Received: by 2002:a05:6a20:2d29:b0:1ad:8e36:7c07 with SMTP id g41-20020a056a202d2900b001ad8e367c07mr4986467pzl.1.1714145898738;
        Fri, 26 Apr 2024 08:38:18 -0700 (PDT)
Received: from [172.16.0.22] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id r8-20020aa78448000000b006e724ccdc3esm14966301pfn.55.2024.04.26.08.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 08:38:18 -0700 (PDT)
Message-ID: <79087773-9115-4d4c-b566-028a21049d61@rivosinc.com>
Date: Fri, 26 Apr 2024 08:38:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf: RISC-V: Check standard event availability
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Mark Rutland <mark.rutland@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240418014652.1143466-1-samuel.holland@sifive.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240418014652.1143466-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_083821_666881_DB687E39 
X-CRM114-Status: GOOD (  35.02  )
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

On 4/17/24 18:46, Samuel Holland wrote:
> The RISC-V SBI PMU specification defines several standard hardware and
> cache events. Currently, all of these events are exposed to userspace,
> even when not actually implemented. They appear in the `perf list`
> output, and commands like `perf stat` try to use them.
> 
> This is more than just a cosmetic issue, because the PMU driver's .add
> function fails for these events, which causes pmu_groups_sched_in() to
> prematurely stop scheduling in other (possibly valid) hardware events.
> 
> Add logic to check which events are supported by the hardware (i.e. can
> be mapped to some counter), so only usable events are reported to
> userspace. Since the kernel does not know the mapping between events and
> possible counters, this check must happen during boot, when no counters
> are in use. Make the check asynchronous to minimize impact on boot time.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> Before this patch:
> $ perf list hw
> 
> List of pre-defined events (to be used in -e or -M):
> 
>    branch-instructions OR branches                    [Hardware event]
>    branch-misses                                      [Hardware event]
>    bus-cycles                                         [Hardware event]
>    cache-misses                                       [Hardware event]
>    cache-references                                   [Hardware event]
>    cpu-cycles OR cycles                               [Hardware event]
>    instructions                                       [Hardware event]
>    ref-cycles                                         [Hardware event]
>    stalled-cycles-backend OR idle-cycles-backend      [Hardware event]
>    stalled-cycles-frontend OR idle-cycles-frontend    [Hardware event]
> 
> $ perf stat -ddd true
> 
>   Performance counter stats for 'true':
> 
>                4.36 msec task-clock                       #    0.744 CPUs utilized
>                   1      context-switches                 #  229.325 /sec
>                   0      cpu-migrations                   #    0.000 /sec
>                  38      page-faults                      #    8.714 K/sec
>           4,375,694      cycles                           #    1.003 GHz                         (60.64%)
>             728,945      instructions                     #    0.17  insn per cycle
>              79,199      branches                         #   18.162 M/sec
>              17,709      branch-misses                    #   22.36% of all branches
>             181,734      L1-dcache-loads                  #   41.676 M/sec
>               5,547      L1-dcache-load-misses            #    3.05% of all L1-dcache accesses
>       <not counted>      LLC-loads                                                               (0.00%)
>       <not counted>      LLC-load-misses                                                         (0.00%)
>       <not counted>      L1-icache-loads                                                         (0.00%)
>       <not counted>      L1-icache-load-misses                                                   (0.00%)
>       <not counted>      dTLB-loads                                                              (0.00%)
>       <not counted>      dTLB-load-misses                                                        (0.00%)
>       <not counted>      iTLB-loads                                                              (0.00%)
>       <not counted>      iTLB-load-misses                                                        (0.00%)
>       <not counted>      L1-dcache-prefetches                                                    (0.00%)
>       <not counted>      L1-dcache-prefetch-misses                                               (0.00%)
> 
>         0.005860375 seconds time elapsed
> 
>         0.000000000 seconds user
>         0.010383000 seconds sys
> 
> After this patch:
> $ perf list hw
> 
> List of pre-defined events (to be used in -e or -M):
> 
>    branch-instructions OR branches                    [Hardware event]
>    branch-misses                                      [Hardware event]
>    cache-misses                                       [Hardware event]
>    cache-references                                   [Hardware event]
>    cpu-cycles OR cycles                               [Hardware event]
>    instructions                                       [Hardware event]
> 
> $ perf stat -ddd true
> 
>   Performance counter stats for 'true':
> 
>                5.16 msec task-clock                       #    0.848 CPUs utilized
>                   1      context-switches                 #  193.817 /sec
>                   0      cpu-migrations                   #    0.000 /sec
>                  37      page-faults                      #    7.171 K/sec
>           5,183,625      cycles                           #    1.005 GHz
>             961,696      instructions                     #    0.19  insn per cycle
>              85,853      branches                         #   16.640 M/sec
>              20,462      branch-misses                    #   23.83% of all branches
>             243,545      L1-dcache-loads                  #   47.203 M/sec
>               5,974      L1-dcache-load-misses            #    2.45% of all L1-dcache accesses
>     <not supported>      LLC-loads
>     <not supported>      LLC-load-misses
>     <not supported>      L1-icache-loads
>     <not supported>      L1-icache-load-misses
>     <not supported>      dTLB-loads
>              19,619      dTLB-load-misses
>     <not supported>      iTLB-loads
>               6,831      iTLB-load-misses
>     <not supported>      L1-dcache-prefetches
>     <not supported>      L1-dcache-prefetch-misses
> 
>         0.006085625 seconds time elapsed
> 
>         0.000000000 seconds user
>         0.013022000 seconds sys
> 
> 
> Changes in v2:
>   - Move the event checking to a workqueue to make it asynchronous
>   - Add more details to the commit message based on the v1 discussion
> 
>   drivers/perf/riscv_pmu_sbi.c | 45 +++++++++++++++++++++++++++++++++---
>   1 file changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 8cbe6e5f9c39..c326954af066 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -20,6 +20,7 @@
>   #include <linux/cpu_pm.h>
>   #include <linux/sched/clock.h>
>   #include <linux/soc/andes/irq.h>
> +#include <linux/workqueue.h>
>   
>   #include <asm/errata_list.h>
>   #include <asm/sbi.h>
> @@ -109,7 +110,7 @@ struct sbi_pmu_event_data {
>   	};
>   };
>   
> -static const struct sbi_pmu_event_data pmu_hw_event_map[] = {
> +static struct sbi_pmu_event_data pmu_hw_event_map[] = {
>   	[PERF_COUNT_HW_CPU_CYCLES]		= {.hw_gen_event = {
>   							SBI_PMU_HW_CPU_CYCLES,
>   							SBI_PMU_EVENT_TYPE_HW, 0}},
> @@ -143,7 +144,7 @@ static const struct sbi_pmu_event_data pmu_hw_event_map[] = {
>   };
>   
>   #define C(x) PERF_COUNT_HW_CACHE_##x
> -static const struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
> +static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
>   [PERF_COUNT_HW_CACHE_OP_MAX]
>   [PERF_COUNT_HW_CACHE_RESULT_MAX] = {
>   	[C(L1D)] = {
> @@ -288,6 +289,34 @@ static const struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_M
>   	},
>   };
>   
> +static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
> +			0, cmask, 0, edata->event_idx, 0, 0);
> +	if (!ret.error) {
> +		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> +			  ret.value, 0x1, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
> +	} else if (ret.error == SBI_ERR_NOT_SUPPORTED) {
> +		/* This event cannot be monitored by any counter */
> +		edata->event_idx = -EINVAL;
> +	}
> +}
> +
> +static void pmu_sbi_check_std_events(struct work_struct *work)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
> +		pmu_sbi_check_event(&pmu_hw_event_map[i]);
> +
> +	for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++)
> +		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++)
> +			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
> +				pmu_sbi_check_event(&pmu_cache_event_map[i][j][k]);
> +}
> +
> +static DECLARE_WORK(check_std_events_work, pmu_sbi_check_std_events);
> +
>   static int pmu_sbi_ctr_get_width(int idx)
>   {
>   	return pmu_ctr_list[idx].width;
> @@ -473,6 +502,12 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>   	u64 raw_config_val;
>   	int ret;
>   
> +	/*
> +	 * Ensure we are finished checking standard hardware events for
> +	 * validity before allowing userspace to configure any events.
> +	 */
> +	flush_work(&check_std_events_work);
> +
>   	switch (type) {
>   	case PERF_TYPE_HARDWARE:
>   		if (config >= PERF_COUNT_HW_MAX)
> @@ -634,7 +669,8 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>   	 * which may include counters that are not enabled yet.
>   	 */
>   	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -		  0, pmu->cmask, 0, 0, 0, 0);
> +		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
> +

Why is this required for this patch?

If the intention is a generic improvement to reset mhpmevent at boot 
time, it should be separate patch.

>   }
>   
>   static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> @@ -1108,6 +1144,9 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>   
>   	register_sysctl("kernel", sbi_pmu_sysctl_table);
>   
> +	/* Asynchronously check which standard events are available */
> +	schedule_work(&check_std_events_work);
> +
>   	return 0;
>   
>   out_unregister:

Until we have the new SBI interface defined to optimize these SBI calls, 
we can use this individual call approach to fix the current issue.

lgtm otherwise.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Atish Patra <atishp@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
