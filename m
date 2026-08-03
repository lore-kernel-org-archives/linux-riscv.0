Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF5CC55196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 21:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGADm4syRgIN2qrlYYYdvPgqQe9M9sbKXizdK1JvIOQ=; b=Ceadso1JKu+MaC
	OJ6KGXCE7K0/SYwKfuwBsU+KSqIJF4pZSyB5DhAHidWrwWQS7VZbVrG0LLD4bw1wgDvtNuZ3HB3g9
	6iwgV9ZyweZ1k8rNCPJ///GDGA4kTtVuQVw1sBB6GESGoM+f/3ZuxordonIXc0jFfTJecRJOBJM30
	y3lhHPa8aCGxT4k2yPNFav79xV/VflO1kCW/qgVWu8SszvYWD24CWMg2UChvXZ58/mWFV5uHLhUd6
	V19pDkj+v5p/YNTh4AaZnPDQhCzKkM5E6tKjMD5A85jp4bhajPBGZU2cz3PvWIhcg7CgMkCSAyCGm
	BD95GfKLBNx+Wz41umZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0c6-00000000ZC3-16h1;
	Mon, 03 Aug 2026 21:54:26 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0c1-00000000Z9h-43ND
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 21:54:24 +0000
Message-ID: <437bcc6d-2c4c-4c4d-b5fc-885e92db8975@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785794056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJsH3atiMvuqZlBdNBMGMLmGM8erxFtkd8bNSMbxCKg=;
	b=mufWI0bg7WUM3d7yyKdwTIZ+NlgDza6LCWtFbzMW1ZSuLobWL6PwE3Hm4zHgBvMt9cCeuQ
	l4Z9aJG5sTyt9ukTVOnobGpTJxtQFx0DJb/M/N+BNWyulfLSgSqO28du56efN+YqzvU3td
	tjy8GDwSm2LdYrnPZGDgXT9x52vomTM=
Date: Mon, 3 Aug 2026 14:53:58 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v8 13/22] RISC-V: perf: Add a mechanism to defined legacy
 event encoding
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>,
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-13-7909f863a645@meta.com>
 <37db8fc7-4702-4af6-878a-b46572d6f2f4@picoheart.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <37db8fc7-4702-4af6-878a-b46572d6f2f4@picoheart.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_145423_314788_DCDBC7C8 
X-CRM114-Status: GOOD (  20.10  )
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


On 7/7/26 12:51 AM, Yicong Yang wrote:
> On 7/1/26 4:47 PM, Atish Patra wrote:
>> From: Atish Patra <atishp@rivosinc.com>
>>
>> RISC-V ISA doesn't define any standard event encodings or specify
>> any event to counter mapping. Thus, event encoding information
>> and corresponding counter mapping fot those events needs to be
>> provided in the driver for each vendor.
>>
>> Add a framework to support that. The individual platform events
>> will be added later.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   drivers/perf/riscv_pmu_sbi.c | 70 +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 69 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index c20f1e33c65d..2568c6808f5d 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -10,6 +10,7 @@
>>   
>>   #define pr_fmt(fmt) "riscv-pmu-sbi: " fmt
>>   
>> +#include <linux/limits.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/perf/riscv_pmu.h>
>>   #include <linux/platform_device.h>
>> @@ -379,6 +380,71 @@ static int pmu_sbi_check_event_info(void)
>>   	return result;
>>   }
>>   
>> +/*
>> + * Vendor specific PMU events.
>> + */
>> +struct riscv_pmu_event {
>> +	u64 event_id;
>> +	u32 counter_mask;
> could we name it as counterid_mask to match to the PMU format
> name (introduced in patch 16/22)?

Sure. I will change it.

> thanks.
>
>> +};
>> +
>> +#define HW_OP_UNSUPPORTED		U64_MAX
>> +#define CACHE_OP_UNSUPPORTED		U64_MAX
>> +
>> +#define PERF_MAP_ALL_UNSUPPORTED					\
>> +	[0 ... PERF_COUNT_HW_MAX - 1] = {HW_OP_UNSUPPORTED, 0x0}
>> +
>> +#define PERF_CACHE_MAP_ALL_UNSUPPORTED					\
>> +[0 ... PERF_COUNT_HW_CACHE_MAX - 1] = {					\
>> +	[0 ... PERF_COUNT_HW_CACHE_OP_MAX - 1] = {			\
>> +		[0 ... PERF_COUNT_HW_CACHE_RESULT_MAX - 1] = {		\
>> +			CACHE_OP_UNSUPPORTED, 0x0			\
>> +		},							\
>> +	},								\
>> +}
>> +
>> +struct riscv_vendor_pmu_events {
>> +	unsigned long vendorid;
>> +	unsigned long archid;
>> +	unsigned long implid;
>> +	const struct riscv_pmu_event *hw_event_map;
>> +	const struct riscv_pmu_event (*cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
>> +						       [PERF_COUNT_HW_CACHE_RESULT_MAX];
>> +};
>> +
>> +#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, _cache_event_map) \
>> +	{ .vendorid = _vendorid, .archid = _archid, .implid = _implid, \
>> +	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map },
>> +
>> +static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
>> +};
>> +
>> +static const struct riscv_pmu_event *current_pmu_hw_event_map;
>> +static const struct riscv_pmu_event (*current_pmu_cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
>> +							   [PERF_COUNT_HW_CACHE_RESULT_MAX];
>> +
>> +static void __init rvpmu_vendor_register_events(void)
>> +{
>> +	int cpu = raw_smp_processor_id();
>> +	unsigned long vendor_id = riscv_cached_mvendorid(cpu);
>> +	unsigned long impl_id = riscv_cached_mimpid(cpu);
>> +	unsigned long arch_id = riscv_cached_marchid(cpu);
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(pmu_vendor_events_table); i++) {
>> +		if (pmu_vendor_events_table[i].vendorid == vendor_id &&
>> +		    pmu_vendor_events_table[i].implid == impl_id &&
>> +		    pmu_vendor_events_table[i].archid == arch_id) {
>> +			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
>> +			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!current_pmu_hw_event_map || !current_pmu_cache_event_map) {
>> +		pr_info("No default PMU events found\n");
>> +	}
>> +}
>> +
>>   static void rvpmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>>   {
>>   	struct sbiret ret;
>> @@ -1670,8 +1736,10 @@ static int __init rvpmu_devinit(void)
>>   	 */
>>   	if (riscv_isa_extension_available(NULL, SSCCFG) &&
>>   	    riscv_isa_extension_available(NULL, SMCDELEG) &&
>> -	    riscv_isa_extension_available(NULL, SSCSRIND))
>> +	    riscv_isa_extension_available(NULL, SSCSRIND)) {
>>   		static_branch_enable(&riscv_pmu_cdeleg_available);
>> +		rvpmu_vendor_register_events();
>> +	}
>>   
>>   	if (!(riscv_pmu_sbi_available_boot() || riscv_pmu_cdeleg_available_boot()))
>>   		return 0;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
