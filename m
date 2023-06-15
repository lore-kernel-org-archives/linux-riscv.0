Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14522EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxaUowKepHGQyZi8MTe1XfohNU6kD9KU6wuvvKqtv+A=; b=A9DzaRXx21AzEi
	/9SEc/hviIyW4cEUCWxug7taYKXmGwYIxLUPxvem1njRnVfkavgwecxVxFvvZ9UTqCch1hn75XsN1
	VtYkZyFGtJ5CrgSMGU9GU4FC3BuKdhu+5RGQBTC+dlblPViP+5OGeI2W6Ps2GztXfTKXi5ez0yrTe
	VReqF7Rc3V/CQ6OTm+HD6JOVHt0CvgK0jUZdTg1WZAT55VKKXpF+zQU3HMspdYbA9BWf/KYOKPt4s
	krrE5Z3mlyJ7gvYcDMy8Em8LgJVRzR4G8RsCv1br8DcXk5jwpNKBcYXGmWHNT4QzUcdirVIfvQ1YI
	ymt9c8YysGyLw1sGVlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hZ9-00E2nF-2E;
	Thu, 15 Jun 2023 07:38:47 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hYv-00E2i7-2T;
	Thu, 15 Jun 2023 07:38:35 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A1B84000F;
	Thu, 15 Jun 2023 07:38:27 +0000 (UTC)
Message-ID: <4c511218-eb54-0ec4-6820-265f06d91730@ghiti.fr>
Date: Thu, 15 Jun 2023 09:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 06/10] drivers: perf: Implement perf event mmap support
 in the legacy backend
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-7-alexghiti@rivosinc.com>
 <20230531-705f2911e8d66938ece04905@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230531-705f2911e8d66938ece04905@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003834_098266_9185CFFA 
X-CRM114-Status: GOOD (  19.53  )
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


On 31/05/2023 16:27, Andrew Jones wrote:
> On Fri, May 12, 2023 at 10:53:17AM +0200, Alexandre Ghiti wrote:
>> Implement the needed callbacks in the legacy driver so that we can
>> directly access the counters through perf in userspace.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   drivers/perf/riscv_pmu_legacy.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
>> index ffe09d857366..f0f5bd856f66 100644
>> --- a/drivers/perf/riscv_pmu_legacy.c
>> +++ b/drivers/perf/riscv_pmu_legacy.c
>> @@ -74,6 +74,31 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
>>   	local64_set(&hwc->prev_count, initial_val);
>>   }
>>   
>> +static uint8_t pmu_legacy_csr_index(struct perf_event *event)
>> +{
>> +	return event->hw.idx;
>> +}
>> +
>> +static void pmu_legacy_event_mapped(struct perf_event *event, struct mm_struct *mm)
>> +{
>> +	/* In legacy mode, the first 3 CSRs are available. */
> Shouldn't this be
>
>   /* In legacy mode, the first and third CSR are available. */
>
> ?


Yes, I guess this comment is not right in this context, so I'll remove 
the comment entirely as it does bring much.


>> +	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
>> +	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
>> +		return;
>> +
>> +	event->hw.flags |= PERF_EVENT_FLAG_USER_READ_CNT;
>> +}
>> +
>> +static void pmu_legacy_event_unmapped(struct perf_event *event, struct mm_struct *mm)
>> +{
>> +	/* In legacy mode, the first 3 CSRs are available. */
> same comment
>
>> +	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
>> +	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
>> +		return;
>> +
>> +	event->hw.flags &= ~PERF_EVENT_FLAG_USER_READ_CNT;
>> +}
>> +
>>   /*
>>    * This is just a simple implementation to allow legacy implementations
>>    * compatible with new RISC-V PMU driver framework.
>> @@ -94,6 +119,9 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
>>   	pmu->ctr_get_width = NULL;
>>   	pmu->ctr_clear_idx = NULL;
>>   	pmu->ctr_read = pmu_legacy_read_ctr;
>> +	pmu->event_mapped = pmu_legacy_event_mapped;
>> +	pmu->event_unmapped = pmu_legacy_event_unmapped;
>> +	pmu->csr_index = pmu_legacy_csr_index;
>>   
>>   	perf_pmu_register(&pmu->pmu, RISCV_PMU_LEGACY_PDEV_NAME, PERF_TYPE_RAW);
>>   }
>> -- 
>> 2.37.2
>>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


Thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
