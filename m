Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBACC636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mqffYzvXWRKQTfkCK0SoTDBV7TAc+lRT5nKcqc6uOI=; b=wGpG5rrsqRklHW
	NoUzVSCFUrIZ+3XlG/PEuUl4ylIe3F6EGxLn1HZf9AnkBr5AwrVwhJUUPs49rdT1k5LOqR+lWck7V
	4RV2mAwr+8XabcFsAUJVKLrGO/eMZBqiUHl7Pf07RSR1vz09fKYVN0p9WTLBwZjpaTvtYWkTQMtci
	9UGEQNWT8900no+IPX+eZtTVIliC1/XaT845Fw1ZYCDWO9tAvWLj4vc23405i66iV3B/Xuh4qocjd
	TOvJF4sVyOb8MY1GHmDO3cZVqLO2tYDm0y/Y4ndt0O1KEu0PsRU9aVfuUDlZLKUanpeLIyh2toJtO
	vxbgnXqKetzbX587VSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNt5O-001Kqi-VX; Fri, 03 Feb 2023 10:14:27 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNt5M-001Kp8-3L
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 10:14:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id ba1so109583wrb.5
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 02:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=giEhO8XAaminWR9p0s3t8pSgAtiWCy3Wzk/E8kNGc1Y=;
        b=WaFawZsXXNk+S05B2RJH6Xpj+AjFIAFYZQ9eI2j1lq3Ib9ShUWz1fdkxQ7CRttLcb2
         fspQeu2I0KT59qlCQLMkhqf1EExy271w7jTYyJVZjPfWRO1AinW8fxXWymyyZsxMCXUk
         bmyYwta+5WpES1kTs+HCBDzcfm5Azb2M4qnsRmMO/EZooWxaDxcmPS0uY/j7DmS6WT7+
         XT3eoyXEZN/Jnelr06XAq7ni8FCqCZ2loGzv+XJfENtu3XMKrDWCDJMUm7PK3lQzGcJ5
         +jgGgEnByJfNJ0mtCW495Na6HdV3hnSTc3VpJcMnYosCnoIM7YLW0H3I8fNj4e88GQ27
         FOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giEhO8XAaminWR9p0s3t8pSgAtiWCy3Wzk/E8kNGc1Y=;
        b=QwlSSsJNdRFlCgqpOOZfdr68P3SK8clwdHb0BDIlGnpAV5NZbbHltDItWrLMwGrWj3
         E/A+BAiZLkdJLSawMGMUniYSTJTvKWlkyZxScBsvtcFv1lcBnYWdu3vX9C2iUcr2fvoC
         NvoYxee6rb45fUqV8MxuSYcv9VYxhMIUQBID8kYwD8tO94oYZ/BlLVLnlBdaLMl1CcxC
         ANaTm5MXkt34FMOZLGnUyJbDu1DLN5jAIhiAHAG5j1ynx8lG0PSVFyfpU6UIrSchHMe7
         CMygOfNjoy8qK5gbBHrZEood/FdIfrKaQvo74wnvFElBdQp3eDGiodFx1F8C09qpXdsX
         7efQ==
X-Gm-Message-State: AO0yUKXKU72UdjsGpBxE5n5jd0H9Ijwbea9BDA4+EIaYednzi+ZTnk7P
	Q0MM7Uh068XF/4DSLNGlm8iI9w==
X-Google-Smtp-Source: AK7set/1vZENHaapNhdc1YtPq+8LEt7/jHhvN6cKIRFGmCrmRyG6HWl60iz69Ym3jHhPt/TsxybiHA==
X-Received: by 2002:adf:fb92:0:b0:2b5:47ab:6fa0 with SMTP id a18-20020adffb92000000b002b547ab6fa0mr8178851wrr.38.1675419262563;
        Fri, 03 Feb 2023 02:14:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e8-20020adffc48000000b002bdc3f5945dsm1596252wrs.89.2023.02.03.02.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 02:14:22 -0800 (PST)
Date: Fri, 3 Feb 2023 11:14:21 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>, Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 13/14] RISC-V: KVM: Support firmware events
Message-ID: <20230203101421.gykyklow3sbllaou@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-14-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201231250.3806412-14-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_021424_171044_3C70FE83 
X-CRM114-Status: GOOD (  36.91  )
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

On Wed, Feb 01, 2023 at 03:12:49PM -0800, Atish Patra wrote:
> SBI PMU extension defines a set of firmware events which can provide
> useful information to guests about the number of SBI calls. As
> hypervisor implements the SBI PMU extension, these firmware events
> correspond to ecall invocations between VS->HS mode. All other firmware
> events will always report zero if monitored as KVM doesn't implement them.
> 
> This patch adds all the infrastructure required to support firmware
> events.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  17 +++
>  arch/riscv/kvm/vcpu_pmu.c             | 142 ++++++++++++++++++++------
>  2 files changed, 125 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 2afaaf5..a1d8b7d 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -22,6 +22,14 @@
>  
>  #define RISCV_MAX_COUNTERS      64
>  
> +struct kvm_fw_event {
> +	/* Current value of the event */
> +	unsigned long value;
> +
> +	/* Event monitoring status */
> +	bool started;
> +};
> +
>  /* Per virtual pmu counter data */
>  struct kvm_pmc {
>  	u8 idx;
> @@ -30,11 +38,14 @@ struct kvm_pmc {
>  	union sbi_pmu_ctr_info cinfo;
>  	/* Event monitoring status */
>  	bool started;
> +	/* Monitoring event ID */
> +	unsigned long event_idx;
>  };
>  
>  /* PMU data structure per vcpu */
>  struct kvm_pmu {
>  	struct kvm_pmc pmc[RISCV_MAX_COUNTERS];
> +	struct kvm_fw_event fw_event[RISCV_KVM_MAX_FW_CTRS];
>  	/* Number of the virtual firmware counters available */
>  	int num_fw_ctrs;
>  	/* Number of the virtual hardware counters available */
> @@ -57,6 +68,7 @@ struct kvm_pmu {
>  { .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
>  #endif
>  
> +int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid);
>  int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
>  				unsigned long *val, unsigned long new_val,
>  				unsigned long wr_mask);
> @@ -87,6 +99,11 @@ struct kvm_pmu {
>  { .base = 0,      .count = 0, .func = NULL },
>  
>  static inline void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu) {}
> +static inline int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid)
> +{
> +	return 0;
> +}
> +
>  static inline void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu) {}
>  #endif /* CONFIG_RISCV_PMU_SBI */
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 473ad80..dd16e60 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -202,12 +202,15 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>  	struct kvm_pmc *pmc;
>  	u64 enabled, running;
> +	int fevent_code;
>  
>  	pmc = &kvpmu->pmc[cidx];
> -	if (!pmc->perf_event)
> -		return -EINVAL;
>  
> -	pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> +	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +		fevent_code = get_event_code(pmc->event_idx);
> +		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
> +	} else if (pmc->perf_event)
> +		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);

We also need 

       else {
           return -EINVAL;
       }

>  	*out_val = pmc->counter_val;
>  
>  	return 0;
> @@ -223,6 +226,55 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
>  	return 0;
>  }
>  
> +static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, int ctr_idx,
> +				     struct perf_event_attr *attr, unsigned long flag,
> +				     unsigned long eidx, unsigned long evtdata)
> +{
> +	struct perf_event *event;
> +
> +	kvm_pmu_release_perf_event(pmc);
> +	pmc->idx = ctr_idx;
> +
> +	attr->config = kvm_pmu_get_perf_event_config(eidx, evtdata);
> +	if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
> +		//TODO: Do we really want to clear the value in hardware counter
> +		pmc->counter_val = 0;
> +	}
> +
> +	/*
> +	 * Set the default sample_period for now. The guest specified value
> +	 * will be updated in the start call.
> +	 */
> +	attr->sample_period = kvm_pmu_get_sample_period(pmc);
> +
> +	event = perf_event_create_kernel_counter(attr, -1, current, NULL, pmc);
> +	if (IS_ERR(event)) {
> +		pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
> +		return PTR_ERR(event);
> +	}
> +
> +	pmc->perf_event = event;
> +	if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
> +		perf_event_enable(pmc->perf_event);
> +
> +	return 0;
> +}
> +
> +int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	struct kvm_fw_event *fevent;
> +
> +	if (!kvpmu || fid >= SBI_PMU_FW_MAX)
> +		return -EINVAL;
> +
> +	fevent = &kvpmu->fw_event[fid];
> +	if (fevent->started)
> +		fevent->value++;
> +
> +	return 0;
> +}
> +
>  int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
>  				unsigned long *val, unsigned long new_val,
>  				unsigned long wr_mask)
> @@ -289,6 +341,7 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>  	int i, pmc_index, sbiret = 0;
>  	struct kvm_pmc *pmc;
> +	int fevent_code;
>  
>  	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
>  		sbiret = SBI_ERR_INVALID_PARAM;
> @@ -303,7 +356,22 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  		pmc = &kvpmu->pmc[pmc_index];
>  		if (flag & SBI_PMU_START_FLAG_SET_INIT_VALUE)
>  			pmc->counter_val = ival;
> -		if (pmc->perf_event) {
> +		if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +			fevent_code = get_event_code(pmc->event_idx);
> +			if (fevent_code >= SBI_PMU_FW_MAX) {
> +				sbiret = SBI_ERR_INVALID_PARAM;
> +				goto out;
> +			}
> +
> +			/* Check if the counter was already started for some reason */
> +			if (kvpmu->fw_event[fevent_code].started) {
> +				sbiret = SBI_ERR_ALREADY_STARTED;
> +				continue;
> +			}
> +
> +			kvpmu->fw_event[fevent_code].started = true;
> +			kvpmu->fw_event[fevent_code].value = pmc->counter_val;
> +		} else if (pmc->perf_event) {
>  			if (unlikely(pmc->started)) {
>  				sbiret = SBI_ERR_ALREADY_STARTED;
>  				continue;
> @@ -330,6 +398,7 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  	int i, pmc_index, sbiret = 0;
>  	u64 enabled, running;
>  	struct kvm_pmc *pmc;
> +	int fevent_code;
>  
>  	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
>  		sbiret = SBI_ERR_INVALID_PARAM;
> @@ -342,7 +411,18 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
>  			continue;
>  		pmc = &kvpmu->pmc[pmc_index];
> -		if (pmc->perf_event) {
> +		if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +			fevent_code = get_event_code(pmc->event_idx);
> +			if (fevent_code >= SBI_PMU_FW_MAX) {
> +				sbiret = SBI_ERR_INVALID_PARAM;
> +				goto out;
> +			}
> +
> +			if (!kvpmu->fw_event[fevent_code].started)
> +				sbiret = SBI_ERR_ALREADY_STOPPED;
> +
> +			kvpmu->fw_event[fevent_code].started = false;
> +		} else if (pmc->perf_event) {
>  			if (pmc->started) {
>  				/* Stop counting the counter */
>  				perf_event_disable(pmc->perf_event);
> @@ -355,11 +435,14 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  				pmc->counter_val += perf_event_read_value(pmc->perf_event,
>  									  &enabled, &running);
>  				kvm_pmu_release_perf_event(pmc);
> -				clear_bit(pmc_index, kvpmu->pmc_in_use);
>  			}
>  		} else {
>  			sbiret = SBI_ERR_INVALID_PARAM;
>  		}
> +		if (flag & SBI_PMU_STOP_FLAG_RESET) {
> +			pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
> +			clear_bit(pmc_index, kvpmu->pmc_in_use);
> +		}
>  	}
>  
>  out:
> @@ -373,12 +456,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  				     unsigned long eidx, uint64_t evtdata,
>  				     struct kvm_vcpu_sbi_return *retdata)
>  {
> -	int ctr_idx, sbiret = 0;
> -	u64 config;
> +	int ctr_idx, ret, sbiret = 0;
> +	bool is_fevent;
> +	unsigned long event_code;
>  	u32 etype = kvm_pmu_get_perf_event_type(eidx);
>  	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> -	struct perf_event *event;
> -	struct kvm_pmc *pmc;
> +	struct kvm_pmc *pmc = NULL;

I don't think this change initializing pmc is necessary, but OK.

>  	struct perf_event_attr attr = {
>  		.type = etype,
>  		.size = sizeof(struct perf_event_attr),
> @@ -399,7 +482,9 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  		goto out;
>  	}
>  
> -	if (kvm_pmu_is_fw_event(eidx)) {
> +	event_code = get_event_code(eidx);
> +	is_fevent = kvm_pmu_is_fw_event(eidx);
> +	if (is_fevent && event_code >= SBI_PMU_FW_MAX) {
>  		sbiret = SBI_ERR_NOT_SUPPORTED;
>  		goto out;
>  	}
> @@ -424,33 +509,18 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  	}
>  
>  	pmc = &kvpmu->pmc[ctr_idx];
> -	kvm_pmu_release_perf_event(pmc);
> -	pmc->idx = ctr_idx;
> -
> -	config = kvm_pmu_get_perf_event_config(eidx, evtdata);
> -	attr.config = config;
> -	if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
> -		//TODO: Do we really want to clear the value in hardware counter
> -		pmc->counter_val = 0;
> -	}
> -
> -	/*
> -	 * Set the default sample_period for now. The guest specified value
> -	 * will be updated in the start call.
> -	 */
> -	attr.sample_period = kvm_pmu_get_sample_period(pmc);
> -
> -	event = perf_event_create_kernel_counter(&attr, -1, current, NULL, pmc);
> -	if (IS_ERR(event)) {
> -		pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
> -		return PTR_ERR(event);
> +	if (is_fevent) {
> +		if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
> +			kvpmu->fw_event[event_code].started = true;
> +	} else {
> +		ret = kvm_pmu_create_perf_event(pmc, ctr_idx, &attr, flag, eidx, evtdata);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	set_bit(ctr_idx, kvpmu->pmc_in_use);
> -	pmc->perf_event = event;
> -	if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
> -		perf_event_enable(pmc->perf_event);
>  
> +	pmc->event_idx = eidx;
>  	retdata->out_val = ctr_idx;
>  out:
>  	retdata->err_val = sbiret;
> @@ -494,6 +564,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  	 */
>  	kvpmu->num_hw_ctrs = num_hw_ctrs;
>  	kvpmu->num_fw_ctrs = RISCV_KVM_MAX_FW_CTRS;
> +	memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
>  
>  	/*
>  	 * There is no correlation between the logical hardware counter and virtual counters.
> @@ -507,6 +578,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  			continue;
>  		pmc = &kvpmu->pmc[i];
>  		pmc->idx = i;
> +		pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
>  		if (i < kvpmu->num_hw_ctrs) {
>  			pmc->cinfo.type = SBI_PMU_CTR_TYPE_HW;
>  			if (i < 3)
> @@ -543,8 +615,10 @@ void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
>  		pmc = &kvpmu->pmc[i];
>  		pmc->counter_val = 0;
>  		kvm_pmu_release_perf_event(pmc);
> +		pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
>  	}
>  	bitmap_zero(kvpmu->pmc_in_use, RISCV_MAX_COUNTERS);
> +	memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
>  }
>  
>  void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
> -- 
> 2.25.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
