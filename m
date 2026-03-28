Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E76010F3DCA
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 03:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkZe13VUAjREspYw4N0gmM/zlBHjxe6aSzQTbiUjDuM=; b=AwA4R/7seTEXZl
	orjjxzvTm0SqPPtzrRVvKMmfJmW9E/g6E/53HHuiUKTrxaFvHf3uJl4FHLolCUE6CJsOjmS4to/z4
	273x2BbfWHkBn6NF70SDx5KL0d8vPGa9YoK1W1+FQmCXXeFA17vbbhanN0hV0Hw3QOmR7vmjC/Y+j
	MyFEnc19VlAS0cZ3iO1cvyLj5E5qtCkyCIMYyr8XsyFfNQUJOd1DVH5ZmUTWrKoQAjTVUOMvjAAco
	CIDMxAlb+X9fpfqdCCeLeGvH9tNsYH0qYFCgDS7bewDB1oKYZYwQKcQXhBhbYcOBfN82dF/ljY8EL
	7/kXBTbaNvKF9R6w94Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Ko3-00000008VMg-3LQp;
	Sat, 28 Mar 2026 03:57:51 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Ko1-00000008VMJ-3SlB
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 03:57:51 +0000
Message-ID: <82e5de29-389c-47bc-987e-c68844f5a222@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774670267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aR7uOXRp1x8ZhUAL+7zmNWHcPIhJ14T6hDCDpBflCIU=;
	b=mW+1XgjOfJryk8Bz8OpLJzK74wB92Q3xWCQHPHgCktNQBN2/ks7bWur73RwMk5WawfYjv6
	uaiXibVH8ZB8DwWnrCfp93hlJ5oLYkvMwQbr2OwMC3VKUIm2L2BM4esbznQIb+tFW6G7t+
	+OIAF/6yAnVr3B/BJTPaFGiDnni5yFo=
Date: Fri, 27 Mar 2026 20:57:31 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] drivers/perf: riscv: Keep the fixed counter counting
To: cp0613@linux.alibaba.com
Cc: anup@brainfault.org, alex@ghiti.fr, pjw@kernel.org, guoren@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <aab19ab9-0946-4477-8ca2-bc93621a54a0@linux.dev>
 <20260209123628.1866-1-cp0613@linux.alibaba.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20260209123628.1866-1-cp0613@linux.alibaba.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_205750_025122_E361A460 
X-CRM114-Status: GOOD (  27.63  )
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


On 2/9/26 4:36 AM, cp0613@linux.alibaba.com wrote:
> On Wed, 4 Feb 2026 01:17:25 -0800, atish.patra@linux.dev wrote:
>
>>> The RISC-V SBI PMU driver disables all PMU counters during initialization
>>> via pmu_sbi_stop_all. For fixed counters CYCLE, TIME and INSTRET, this is
>>> unnecessary for the following two reasons:
>>>
>>> 1. Some kernel driver code may directly read CYCLE and INSTRET to perform
>>>      simple performance analysis.
>> Is this for some debugging purpose to read the instret/cycle count at
>> boot time or real use case for driver performance analysis ?
>>
>> If it is the latter, that will be problematic for various reasons such
>> as context switching will lead to inaccurate numbers.
> Hi Atish,
>
> Thanks for the reminder, but I might not be able to provide specific scenarios
> due to our niche usage. Therefore, let's just discuss the legacy usage of
> sysctl_perf_user_access.
>
>>> 2. In legacy mode, user space directly reads CYCLE and INSTRET. (echo 2 >
>>>      /proc/sys/kernel/perf_user_access)
>>>
>>> Therefore, We keep counting CYCLE, TIME and INSTRET.
>>>
>>> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
>>> ---
>>>    drivers/perf/riscv_pmu_sbi.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>>> index 7dd282da67ce..93aaab324443 100644
>>> --- a/drivers/perf/riscv_pmu_sbi.c
>>> +++ b/drivers/perf/riscv_pmu_sbi.c
>>> @@ -899,6 +899,9 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
>>>    
>>>    static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>>>    {
>>> + /* We keep counting CYCLE, TIME and INSTRET. */
>>> + pmu->cmask &= ~0x7;
>>> +
>> This is incorrect. The cmask should be set based on the perf_user_access
>> value. We should not continue counting the CYCLE/INSTRET when legacy
>> mode is not set. if (sysctl_perf_user_access == SYSCTL_LEGACY)
>> csr_write(CSR_SCOUNTEREN, 0x7); else csr_write(CSR_SCOUNTEREN, 0x2);
> I have a slightly different understanding here. Regarding perf_user_access, I think
> it is only used to control user mode access permissions to CYCLE, TIME, and INSTRET
> (via SCOUNTEREN), but whether the counters themselves are in a counting state is
> another issue (via MCOUNTINHIBIT). I think the cmask in pmu_sbi_stop_all should
> represent a counter to stop the counting, rather than a permission configuration.
>
> The problem we are currently encountering is that even when switching to LEGACY mode,
> CYCLE and INSTRET are not counting, so we want to change this default behavior so
> that these three fixed counters are always in counting.

Ahh. We should just enable counting when you user turn on the legacy 
mode not the default
behavior.

> Sorry for the late reply. I've reviewed some previous related discussions, and it
> seems that using time is more reasonable between cycle and time. However, for some
> small code snippets, there is a need to use cycle and instant (at least instant),
> so keeping them constantly counting doesn't seem to have any downsides.

This thread slipped through cracks unfortunately. Apologies for the late 
reply as well.
I understand the usage which is quick debugging purpose only. So we 
should not introduce
side channel exploits in production code for that purpose.
We keep revisiting topic even after numerous discussion in the past.

We must ensure that legacy mode is the only way where this is enabled.

> Thanks,
> Pei
>
>>>     /*
>>>      * No need to check the error because we are disabling all the counters
>>>      * which may include counters that are not enabled yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
