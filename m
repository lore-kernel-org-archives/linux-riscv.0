Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CEBEF06E2
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWHuYYTlHmFvy4PibezgiUe///r7yTAvbkYALzmVsaQ=; b=e1F/eoEQlXkhXc
	VcCVtESHR2bQYC9mllMT9PhqFhvW4UtOuw0gbS4H5MZuo8fDiEeJuBrD2P+NRC+/3Ald8Gk0mVQ7k
	tp7lROj4irSTTD+mRWARmKJ8ZapX3t62nZW+fUlnOfGD42GGY5WkFx5ogPbL08xi9j6/LODjL0zQt
	GT5asm3NalU/2hWNHByVWQibRZO1r9U/ZXBMnhdPUTbFhavlV5ixI3YeN6yoPWTkriYvUfHGu/9GB
	HmHIYuCHrMhVvoeqT7I90j87Be0qXK6LwFQawK1nt9fKvmXxTID4NrgkIm764XPIXl0wQGv98CaTL
	RQtph5iftE1yFzyjmZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp19Q-0000000DCKt-44Ya;
	Sun, 08 Feb 2026 09:32:21 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp19N-0000000DCKS-1T2m
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 09:32:19 +0000
Message-ID: <fd316311-91cb-4a95-bc56-4f2b6c8fb87c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770543130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1CWhrmyvp8UhILa66Gxm7tpIQjK5QG/i9orbqL8doRk=;
	b=nxafQ58sCCuEIytdobpH10lnLTdLcUlboS9wCoPJ8kf02MBcLcPMi0zl8FPCOV7Cw6u/uF
	gsNUizTfwdcbimsblyD/6d5lgBuUVI13YKDmuO9cRMEiZHWDssJydwbblGdjx/s4mjnXry
	4p5eaQGzFCH1+F37mSh4zw7Mqr4dYTc=
Date: Sun, 8 Feb 2026 01:32:02 -0800
MIME-Version: 1.0
Subject: Re: [PATCH] drivers/perf: riscv: Keep the fixed counter counting
To: qingwei hu <huqingwei.kernel@gmail.com>
Cc: cp0613@linux.alibaba.com, anup@brainfault.org, alex@ghiti.fr,
 pjw@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260131112440.2915-1-cp0613@linux.alibaba.com>
 <aab19ab9-0946-4477-8ca2-bc93621a54a0@linux.dev>
 <0E982A8E-9CD2-4712-AC59-56D7CA043A2A@bytedance.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <0E982A8E-9CD2-4712-AC59-56D7CA043A2A@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_013217_649300_FD0C8075 
X-CRM114-Status: GOOD (  21.11  )
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


On 2/4/26 5:13 AM, qingwei hu wrote:
>> On Feb 4, 2026, at 17:17, Atish Patra <atish.patra@linux.dev> wrote:
>>
>>
>> On 1/31/26 3:24 AM, cp0613@linux.alibaba.com wrote:
>>> From: Chen Pei <cp0613@linux.alibaba.com>
>>>
>>> The RISC-V SBI PMU driver disables all PMU counters during initialization
>>> via pmu_sbi_stop_all. For fixed counters CYCLE, TIME and INSTRET, this is
>>> unnecessary for the following two reasons:
>>>
>>> 1. Some kernel driver code may directly read CYCLE and INSTRET to perform
>>>     simple performance analysis.
>> Is this for some debugging purpose to read the instret/cycle count at boot time or real use case for driver performance analysis ?
>>
>> If it is the latter, that will be problematic for various reasons such as context switching will lead to inaccurate numbers.
> Hello Atish.
>
> Besides boot time scenarios and performance analysis, there is another case
> where user mode needs to access the cycle counter via rdcycle.
>
>>> 2. In legacy mode, user space directly reads CYCLE and INSTRET. (echo 2 >
>>>     /proc/sys/kernel/perf_user_access)
>>>
>>> Therefore, We keep counting CYCLE, TIME and INSTRET.
>>>
>>> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
>>> ---
>>>   drivers/perf/riscv_pmu_sbi.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>>> index 7dd282da67ce..93aaab324443 100644
>>> --- a/drivers/perf/riscv_pmu_sbi.c
>>> +++ b/drivers/perf/riscv_pmu_sbi.c
>>> @@ -899,6 +899,9 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
>>>     static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>>>   {
>>> + /* We keep counting CYCLE, TIME and INSTRET. */
>>> + pmu->cmask &= ~0x7;
>>> +
>> This is incorrect. The cmask should be set based on the perf_user_access value. We should not continue counting the CYCLE/INSTRET when legacy mode is not set. if (sysctl_perf_user_access == SYSCTL_LEGACY) csr_write(CSR_SCOUNTEREN, 0x7); else csr_write(CSR_SCOUNTEREN, 0x2);
> Legacy mode refers to the perf framework. When perf_user_access is not in
> legacy mode, the application may need to use rdcycle.
>
> As discussed in [1], the rdcycle is necessary, and applications such as
> DPDK should use rdcycle in user mode.
>
> So how to use the rdcycle when perf_user_access is not in legacy mode?
>
> [1] https://lists.riscv.org/g/tech-privileged/topic/should_rdcycle_be_deprecated/115162737

Based on this thread, it was very clear that the dpdk use case of 
rdcycle is incorrect.

We also had many discussions why enabling rdcycle without perf is a bad 
idea. That's the reason
why we added the *sysctl_perf_user_access* legacy to preserve legacy 
usage. Eventually, it is expected that folks would move away from 
rdcycle usage which was incorrect to begin with.

Let me know if you want me dig up the old threads about the discussion.

> Best Regards,
> Qingwei Hu
>
>>>    /*
>>>     * No need to check the error because we are disabling all the counters
>>>     * which may include counters that are not enabled yet.
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
