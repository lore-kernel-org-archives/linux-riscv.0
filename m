Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7054FC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 08:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCCIIYy8pwAFLQTasYrttmjPb0dw1nS0M8cCa+XahEE=; b=CAV7s1fHALd2LO
	QIAt2I7PBPXrASOb5+/DKIwzwN4PKbBQWsFgtngE0dLoWyQ9ThMzix5aJt/30LxGyWAkmFFdNwp7d
	8vD0wZ3Ov9XGc5L26d3nXGYxTpXYhaj3bLdAfz4Rak5w2uY2jPI3u+nxbT3YppkDzD9DP/wXjTsXz
	DPeNSCAqMtzl9lXPgabpHHS7ZcTLHfdwZiEutXbYuMvyPfqz8ItXNEvOmfDcHwVMiMziWUFqdesyC
	kUy7II71e7UC1HsY9bTx2kAU9M5/v2EIRiVcHiod86VJczCMcXIPdP2Oj/dvfWfL09Y0HQxIY8mLQ
	WqKJuWQJxbGRg7nAJ8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweFx-0000000BT7r-3MZp;
	Tue, 16 Apr 2024 08:33:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweFr-0000000BT3L-0Ni7
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 08:33:31 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso1740830b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 01:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713256405; x=1713861205; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5TvjvzDX9+vy4W2zxmJXwerRo6Lh0Y1bVDzHJUICCWo=;
        b=sXyNacXyhexVAqp4S6e3KWZeKrDFaUUK0r5PqBg5O6vkDgdZqtYRH0qsXxn6Wytf+H
         YIb27tP5x6lFD0Q0HKECBNTAaCCqGqRGN2yGbaRWODI1r9S94+x2XyEmrx8Qs8Ri4Q9Z
         iElAeqpQSYR2fF6wUrZF6FJoFuxpfeTaxfyst0JVMYYAbmtlP8KFiTfF6ePmGpLuvPjS
         uKTQm6H1lddCtYMRVZo6O7a9Aec7PLLQcJqfQllo/kWKldhyNQfh2pU8ke6Q87CJWWxR
         6rV59MJHzpORhuOVEy+NNbnxggqRg8QSTu2uSRDYKTfFuSOuT80S/E4D8eu3hGu1HD00
         4MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713256405; x=1713861205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TvjvzDX9+vy4W2zxmJXwerRo6Lh0Y1bVDzHJUICCWo=;
        b=H9vfpfK4sqFqNPuJV+gaGIUeLK+Ptbypq00kWfS5xRs8/HipoClI0LtptyIt8+iXvq
         SDzkpGXe/U6JJvr7t1bMu5qE07Ofz7IB2lLpC6WW70MP80A91g1LpaiGDzUU+KuSc6dj
         HASRo1jrv+NwpPg5VW47bDoPto5navWwzZWsRu33WCJUWdG4bvMjUNPZlHBzLdmllSZW
         agRyBCz7MRG++gJgxKh5zaf2oJUIPFmqHBGhFCc7RsZJe4ocWSbQWaQg3KJzXcCjgPSh
         S8u3Fr6iZG1DQ6khr/w46HHEV2hTt63pMsC9Gwia733nEd2OwagzrsueSCpcWdCnTMRl
         na7w==
X-Forwarded-Encrypted: i=1; AJvYcCXam7JfyFwFyeUCJQ3pU76JgeLs/uws0/E0ExeOsq2ICgnE2pzNgsAuw/qvXrfZUuXEUtgUKdW9PxX2NF1MyUkOvJwGtHW4wXyStsZN1at8
X-Gm-Message-State: AOJu0YzIKduCKFg2mpPK2s/6Szi9I6qn0zcinAJoHc+bY3XbEQ35lY/U
	bSlUPVGO6OSCo2tYtqlDmrCflW2M3daV+mlvwqRB+jlxmR3HiRycSgIkgfxM+/g=
X-Google-Smtp-Source: AGHT+IHrkeBmdYGDSxY9lkjSHA0b7Iv/w+m0cDIN2acr0IYgXgd79F0r3F5ys4RmCJ4iNsyU6E2Lrg==
X-Received: by 2002:a05:6a20:d49b:b0:1a9:c6fd:d2b9 with SMTP id im27-20020a056a20d49b00b001a9c6fdd2b9mr8196272pzb.8.1713256404819;
        Tue, 16 Apr 2024 01:33:24 -0700 (PDT)
Received: from [172.16.0.33] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id y25-20020aa78559000000b006e6c0f8ce1bsm8490363pfn.47.2024.04.16.01.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 01:33:24 -0700 (PDT)
Message-ID: <dd14fc53-deda-4086-aac0-2dde7f065bb0@rivosinc.com>
Date: Tue, 16 Apr 2024 01:33:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/24] drivers/perf: riscv: Implement SBI PMU snapshot
 function
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Alexey Makhalov <alexey.amakhalov@broadcom.com>,
 Atish Patra <atishp@atishpatra.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Juergen Gross <jgross@suse.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, x86@kernel.org
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-9-atishp@rivosinc.com>
 <20240415-1654deb9446d6c0ebb858b30@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240415-1654deb9446d6c0ebb858b30@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_013327_811718_16DDF663 
X-CRM114-Status: GOOD (  22.47  )
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

On 4/15/24 06:15, Andrew Jones wrote:
> On Wed, Apr 10, 2024 at 05:07:36PM -0700, Atish Patra wrote:
>> SBI v2.0 SBI introduced PMU snapshot feature which adds the following
>> features.
>>
>> 1. Read counter values directly from the shared memory instead of
>> csr read.
>> 2. Start multiple counters with initial values with one SBI call.
>>
>> These functionalities optimizes the number of traps to the higher
>> privilege mode. If the kernel is in VS mode while the hypervisor
>> deploy trap & emulate method, this would minimize all the hpmcounter
>> CSR read traps. If the kernel is running in S-mode, the benefits
>> reduced to CSR latency vs DRAM/cache latency as there is no trap
>> involved while accessing the hpmcounter CSRs.
>>
>> In both modes, it does saves the number of ecalls while starting
>> multiple counter together with an initial values. This is a likely
>> scenario if multiple counters overflow at the same time.
>>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   drivers/perf/riscv_pmu.c       |   1 +
>>   drivers/perf/riscv_pmu_sbi.c   | 224 +++++++++++++++++++++++++++++++--
>>   include/linux/perf/riscv_pmu.h |   6 +
>>   3 files changed, 219 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
>> index b4efdddb2ad9..36d348753d05 100644
>> --- a/drivers/perf/riscv_pmu.c
>> +++ b/drivers/perf/riscv_pmu.c
>> @@ -408,6 +408,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
>>   		cpuc->n_events = 0;
>>   		for (i = 0; i < RISCV_MAX_COUNTERS; i++)
>>   			cpuc->events[i] = NULL;
>> +		cpuc->snapshot_addr = NULL;
>>   	}
>>   	pmu->pmu = (struct pmu) {
>>   		.event_init	= riscv_pmu_event_init,
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index f23501898657..e2881415ca0a 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -58,6 +58,9 @@ PMU_FORMAT_ATTR(event, "config:0-47");
>>   PMU_FORMAT_ATTR(firmware, "config:63");
>>   
>>   static bool sbi_v2_available;
>> +static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
>> +#define sbi_pmu_snapshot_available() \
>> +	static_branch_unlikely(&sbi_pmu_snapshot_available)
>>   
>>   static struct attribute *riscv_arch_formats_attr[] = {
>>   	&format_attr_event.attr,
>> @@ -508,14 +511,109 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>>   	return ret;
>>   }
>>   
>> +static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
>> +{
>> +	int cpu;
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		struct cpu_hw_events *cpu_hw_evt = per_cpu_ptr(pmu->hw_events, cpu);
>> +
>> +		if (!cpu_hw_evt->snapshot_addr)
>> +			continue;
>> +
>> +		free_page((unsigned long)cpu_hw_evt->snapshot_addr);
>> +		cpu_hw_evt->snapshot_addr = NULL;
>> +		cpu_hw_evt->snapshot_addr_phys = 0;
>> +	}
>> +}
>> +
>> +static int pmu_sbi_snapshot_alloc(struct riscv_pmu *pmu)
>> +{
>> +	int cpu;
>> +	struct page *snapshot_page;
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		struct cpu_hw_events *cpu_hw_evt = per_cpu_ptr(pmu->hw_events, cpu);
>> +
>> +		if (cpu_hw_evt->snapshot_addr)
>> +			continue;
>> +
>> +		snapshot_page = alloc_page(GFP_ATOMIC | __GFP_ZERO);
>> +		if (!snapshot_page) {
>> +			pmu_sbi_snapshot_free(pmu);
>> +			return -ENOMEM;
>> +		}
>> +		cpu_hw_evt->snapshot_addr = page_to_virt(snapshot_page);
>> +		cpu_hw_evt->snapshot_addr_phys = page_to_phys(snapshot_page);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pmu_sbi_snapshot_disable(void)
>> +{
>> +	struct sbiret ret;
>> +
>> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, -1,
>> +			-1, 0, 0, 0, 0);
> 
> The SBI_SHMEM_DISABLE patch got moved in front of this patch, but looks
> like it was forgotten to apply it.
> 

Oops. My bad. Fixed it.

> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
