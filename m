Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A1BC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 20:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKiukUQA+oP03Orf1ntMtHtfqAQLUEnswj+763OACps=; b=aswiM76pYg3YSh
	A1FoNOriclt5cfJwlbBOUyZChyIVH/DeE+n7uK6zolPC749DkwTz09bJ72AwKrSZXsAfPrMfYLj6b
	z9HR1O8h6yQGMikFqjIrijcLUdcKRxXwSQZ48puY8PZBQKipS1cXfLqhU0SE8S9fu3b+szfYgoXo6
	wqHiTI9Y6IG6GL6X4a7GbR0psYb+SCGAUGGNfl1bFStsrS9xyk8ro+WACa2hw6CBFOzHJ66DRYfWI
	z0AWmEMGjpk3P2fmGmZWx75rirqXKtIxeRdmICANkyhBwS2vLK9hV/ka58wR54jqsYY/r9RLWycsV
	JyzHBfBiBimQwT49tWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05Xz-0000000A2Fh-1qZ3;
	Thu, 25 Apr 2024 20:18:23 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05Xw-0000000A2BI-3Jzt
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 20:18:22 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7d6c4c97875so64114039f.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 13:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1714076287; x=1714681087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWjnmD221hSNpHNdFzITrd9KAsNvE8n3VYCb71ou0zo=;
        b=iGDr0y/DFYW1UdFZZjvsAqbtkxpT2wdT3xVmsSb3SArqqqTKKZyi5CduM8WuXu35Q4
         AyKmS/u6uUwpzQrbkX/C87728kvyHQ27r3+v+7SyCWZq654awBlpBdEwsA3vYhB7jvkV
         pRCD69W7XafIJqpUabgZ0rUFvY+IAzAsOGB3YefWc/hFPefA+dFq9L4/lKxkWTAJZ8WE
         mVwQaDhRZXWDBA8Sg1qlzpgszaBPUPPEpOWyLvQdq46iIXw4TyagNV7gQDxjYJLlL2vo
         a/kxrjXiAdLNlMT4/9p3xfXkvFP9VOlO/3skid7BbesR9dHcQzoc79wa3xU1QuRgT2fr
         6E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714076287; x=1714681087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWjnmD221hSNpHNdFzITrd9KAsNvE8n3VYCb71ou0zo=;
        b=wGM1aP230T1gFL5tsxVGv1dMMy08wOLY9YRpdDsCPX330VFquXgqoi6nEVC9XDltTw
         pxbcodbUDH7nUDMWmFVzWeYLvozcfeR5wBAmCGzyClO4nVa+lKlD1zJUJKXchBh2EEFU
         6qr9nHoGzTaLZk7/PaqXd1QjiXi6/HclD24wSQaN2O3qWW8oqRdiGQNhnTtG1JB/Ok+J
         1ILZ1ob8datbYZFE0t4vHPGtkmvhtFeBlxT2lKXeaHyzA3les5oLllDAv/9xUw8W1r5Z
         cNNPXI4b24ceI5zBqWX06xidy4TquCgDoniINaqwVf9U2/3D0BMLlmSAQca8AwX73QO8
         y6xw==
X-Forwarded-Encrypted: i=1; AJvYcCV6X1t69iMmMtDD3CHqZ03AVD0OObaaiS5E24Tpv3/RnxwNiA1rBFFv7AcqoBC5xyfYVrBk9SLwVS2a7mJ+k5SrA5XfwV/drdyMBFntqCJH
X-Gm-Message-State: AOJu0YxUX1SNK7r+Xs3G+nofznpl6uYlFJLDLUraVLYUall09/D0UrWH
	tKr9kTFrjpTalrBoVjV7p/zNRBkNz1jRa2CD891sIicMDlECAFaKZKSq0AiAuA4=
X-Google-Smtp-Source: AGHT+IG8HmJjRXVqIOHll0Uudyp+Y7xrkp2bVDeg0wU13haKno9rciTyPNvJjg/aZDXKF1aDzgxtrg==
X-Received: by 2002:a6b:7b07:0:b0:7de:96b0:da89 with SMTP id l7-20020a6b7b07000000b007de96b0da89mr894274iop.6.1714076286907;
        Thu, 25 Apr 2024 13:18:06 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.197])
        by smtp.gmail.com with ESMTPSA id iq34-20020a056638842200b0048554c4b089sm2379582jab.72.2024.04.25.13.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 13:18:06 -0700 (PDT)
Message-ID: <4fa7ce5b-3ee3-4b04-a950-220eef6a633e@sifive.com>
Date: Thu, 25 Apr 2024 15:18:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-riscv/for-next 2/2] drivers/perf: riscv: Fix RV32 snapshot
 overflow use case
To: Atish Patra <atishp@rivosinc.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20240425232933.4111680-1-atishp@rivosinc.com>
 <20240425232933.4111680-3-atishp@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240425232933.4111680-3-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_131820_887986_63630596 
X-CRM114-Status: GOOD (  31.04  )
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

On 2024-04-25 6:29 PM, Atish Patra wrote:
> The shadow copy alogirthm is implemented incorrectly. This patch fixes
> the behavior by keeping a per cpu shadow copy of the counter values to
> avoid clobbering for the cases where system more than XLEN counters and
> the overflown counter index are beyond XLEN. This issue can only be
> observed only in RV32 if an SBI implementation assigns logical counters
> ids greater than XLEN or firmware counter overflow is supported in the
> future.
> 
> Fixes : commit 22f5dac41004d ("drivers/perf: riscv: Implement SBI PMU snapshot function")

Same comment as for patch 1. The logic looks correct as far as I can tell, so:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

One minor comment below.

> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 49 +++++++++++++++++++---------------
>  include/linux/perf/riscv_pmu.h |  2 ++
>  2 files changed, 30 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 2694110f1cff..98aaeb13e9db 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -588,6 +588,7 @@ static int pmu_sbi_snapshot_setup(struct riscv_pmu *pmu, int cpu)
>  		return sbi_err_map_linux_errno(ret.error);
>  	}
>  
> +	memset(cpu_hw_evt->snapshot_cval_shcopy, 0, sizeof(u64) * RISCV_MAX_COUNTERS);
>  	cpu_hw_evt->snapshot_set_done = true;
>  
>  	return 0;
> @@ -605,7 +606,7 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
>  	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
>  
>  	/* Read the value from the shared memory directly only if counter is stopped */
> -	if (sbi_pmu_snapshot_available() & (hwc->state & PERF_HES_STOPPED)) {
> +	if (sbi_pmu_snapshot_available() && (hwc->state & PERF_HES_STOPPED)) {
>  		val = sdata->ctr_values[idx];
>  		return val;
>  	}
> @@ -769,36 +770,38 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
>  	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
>  	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
>  	unsigned long flag = 0;
> -	int i;
> +	int i, idx;
>  	struct sbiret ret;
> -	unsigned long temp_ctr_values[64] = {0};
> -	unsigned long ctr_val, temp_ctr_overflow_mask = 0;
> +	u64 temp_ctr_overflow_mask = 0;
>  
>  	if (sbi_pmu_snapshot_available())
>  		flag = SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
>  
> +	/* Reset the shadow copy to avoid save/restore any value from previous overflow */
> +	memset(cpu_hw_evt->snapshot_cval_shcopy, 0, sizeof(u64) * RISCV_MAX_COUNTERS);
> +
>  	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
>  		/* No need to check the error here as we can't do anything about the error */
>  		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, i * BITS_PER_LONG,
>  				cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
>  		if (!ret.error && sbi_pmu_snapshot_available()) {
>  			/* Save the counter values to avoid clobbering */
> -			temp_ctr_values[i * BITS_PER_LONG + i] = sdata->ctr_values[i];
> -			/* Save the overflow mask to avoid clobbering */
> -			if (BIT(i) & sdata->ctr_overflow_mask)
> -				temp_ctr_overflow_mask |= BIT(i + i * BITS_PER_LONG);
> +			for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG) {
> +				cpu_hw_evt->snapshot_cval_shcopy[i * BITS_PER_LONG + idx] =
> +							sdata->ctr_values[idx];
> +				/* Save the overflow mask to avoid clobbering */
> +				if (BIT(idx) & sdata->ctr_overflow_mask)
> +					temp_ctr_overflow_mask |= BIT(idx + i * BITS_PER_LONG);

This is equivalent to doing

  temp_ctr_overflow_mask |= sdata->ctr_overflow_mask << (i * BITS_PER_LONG);

outside the for_each_set_bit() loop.

> +			}
>  		}
>  	}
>  
> -	/* Restore the counter values to the shared memory */
> +	/* Restore the counter values to the shared memory for used hw counters */
>  	if (sbi_pmu_snapshot_available()) {
> -		for (i = 0; i < 64; i++) {
> -			ctr_val = temp_ctr_values[i];
> -			if (ctr_val)
> -				sdata->ctr_values[i] = ctr_val;
> -			if (temp_ctr_overflow_mask)
> -				sdata->ctr_overflow_mask = temp_ctr_overflow_mask;
> -		}
> +		for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS)
> +			sdata->ctr_values[idx] = cpu_hw_evt->snapshot_cval_shcopy[idx];
> +		if (temp_ctr_overflow_mask)
> +			sdata->ctr_overflow_mask = temp_ctr_overflow_mask;
>  	}
>  }
>  
> @@ -850,7 +853,7 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
>  static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_evt,
>  						   u64 ctr_ovf_mask)
>  {
> -	int idx = 0;
> +	int i, idx = 0;
>  	struct perf_event *event;
>  	unsigned long flag = SBI_PMU_START_FLAG_INIT_SNAPSHOT;
>  	u64 max_period, init_val = 0;
> @@ -863,7 +866,7 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
>  			hwc = &event->hw;
>  			max_period = riscv_pmu_ctr_get_width_mask(event);
>  			init_val = local64_read(&hwc->prev_count) & max_period;
> -			sdata->ctr_values[idx] = init_val;
> +			cpu_hw_evt->snapshot_cval_shcopy[idx] = init_val;
>  		}
>  		/*
>  		 * We do not need to update the non-overflow counters the previous
> @@ -871,10 +874,14 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
>  		 */
>  	}
>  
> -	for (idx = 0; idx < BITS_TO_LONGS(RISCV_MAX_COUNTERS); idx++) {
> +	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
> +		/* Restore the counter values to relative indices for used hw counters */
> +		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG)
> +			sdata->ctr_values[idx] =
> +					cpu_hw_evt->snapshot_cval_shcopy[idx + i * BITS_PER_LONG];
>  		/* Start all the counters in a single shot */
>  		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx * BITS_PER_LONG,
> -			  cpu_hw_evt->used_hw_ctrs[idx], flag, 0, 0, 0);
> +			  cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
>  	}
>  }
>  
> @@ -898,7 +905,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
>  	int lidx, hidx, fidx;
>  	struct riscv_pmu *pmu;
>  	struct perf_event *event;
> -	unsigned long overflow;
> +	u64 overflow;
>  	u64 overflowed_ctrs = 0;
>  	struct cpu_hw_events *cpu_hw_evt = dev;
>  	u64 start_clock = sched_clock();
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index c3fa90970042..701974639ff2 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -45,6 +45,8 @@ struct cpu_hw_events {
>  	phys_addr_t snapshot_addr_phys;
>  	/* Boolean flag to indicate setup is already done */
>  	bool snapshot_set_done;
> +	/* A shadow copy of the counter values to avoid clobbering during multiple SBI calls */
> +	u64 snapshot_cval_shcopy[RISCV_MAX_COUNTERS];
>  };
>  
>  struct riscv_pmu {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
