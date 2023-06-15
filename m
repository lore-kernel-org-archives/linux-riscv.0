Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FFEEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9cMYZfxOdaovTm/ZYjRWZXHADNknoRCBvCXTECrzks=; b=NaLF+ytOmyKD98
	7qUROPGCFmWpG5S5DpyAWBC5hCJLSPglem6HhF+gXi0+4GcsRzJSJXMAyPk3JZnuoCJr5Jb4/C4Vh
	r3cT+N4LPFFzqtvrWNT+CHKiRDHc7029z59F4kkyrOC+F0V9BEfPZ1S43+N4IscUn4lEC8bPVhWmS
	SUNgt+sceP1bABIPyOJTxOzkOHk1GqMKBSCwu+h12lmSFi78V1LZAN9qIdlCNWU4yNsKctZ6osGUo
	b1sK5gOv6jsk65zRile1VInTUjpuUarK7yxkUaaskBCXb8OsnAeTeiesT41LPyhWaXYRVhbznhnfS
	60/ZaZvKfym+QI3/qdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hMj-00DzYj-2T;
	Thu, 15 Jun 2023 07:25:57 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hMg-00DzXF-2L;
	Thu, 15 Jun 2023 07:25:56 +0000
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEB99E0004;
	Thu, 15 Jun 2023 07:25:45 +0000 (UTC)
Message-ID: <6d9fefd9-472c-b8d3-d871-b81bfdbe4f6d@ghiti.fr>
Date: Thu, 15 Jun 2023 09:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 04/10] drivers: perf: Rename riscv pmu driver
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
 <20230512085321.13259-5-alexghiti@rivosinc.com>
 <20230531-49ed4c2054db0abbacd03632@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230531-49ed4c2054db0abbacd03632@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_002554_914513_093E42C4 
X-CRM114-Status: GOOD (  17.10  )
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


On 31/05/2023 16:09, Andrew Jones wrote:
> On Fri, May 12, 2023 at 10:53:15AM +0200, Alexandre Ghiti wrote:
>> In addition to being more pretty, it will be useful in upcoming commits
>> to distinguish those pmu drivers from the other pmu drivers.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   drivers/perf/riscv_pmu_legacy.c | 2 +-
>>   drivers/perf/riscv_pmu_sbi.c    | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
>> index 0d8c9d8849ee..ffe09d857366 100644
>> --- a/drivers/perf/riscv_pmu_legacy.c
>> +++ b/drivers/perf/riscv_pmu_legacy.c
>> @@ -95,7 +95,7 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
>>   	pmu->ctr_clear_idx = NULL;
>>   	pmu->ctr_read = pmu_legacy_read_ctr;
>>   
>> -	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
>> +	perf_pmu_register(&pmu->pmu, RISCV_PMU_LEGACY_PDEV_NAME, PERF_TYPE_RAW);
>>   }
>>   
>>   static int pmu_legacy_device_probe(struct platform_device *pdev)
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index 70cb50fd41c2..3b0ee2148054 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -897,7 +897,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto out_unregister;
>>   
>> -	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
>> +	ret = perf_pmu_register(&pmu->pmu, RISCV_PMU_PDEV_NAME, PERF_TYPE_RAW);
> Should we include "sbi" in this name?


I'd say that it is safe to do so and I understand your point, @Atish WDYT?


>
>>   	if (ret)
>>   		goto out_unregister;
>>   
>> -- 
>> 2.37.2
>>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
