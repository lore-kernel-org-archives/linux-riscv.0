Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3402C43217
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfjPXdlH9o+dOPQv4S4b4JbZcbobcNTGtbj3+l0NlTo=; b=SdqiAH0Sqy0AQM
	axuVfH3ZzsL+zq9Pad/KxPuiXmvHf95ThMim4kQdvOMCCMOyCIMqqEFaMlmlpszW9YkPqdoMwRVGr
	ybng0UwJ+OROT/vMzSp58NAMkCLuiC9UrzTzrNHu1Wwjf9kB+218Rec5T3zfC8lw/vLgxccvGlmox
	Z9qk5eqy3aaRnPrK8TIarfi0utCD+DS1lMktotEWze4aUBCrbvtVTsfvWH/7pMUJLM4dYdE743Jco
	bHxptW/T8q5RTANV8j7UtdhqMCwMo//NEvQIW65E7zY5uuDjD8JO7m2RBjKhfYtaxiyOIkRTGiiha
	Cumw7cVL1a0DepvimveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1optEo-005oiy-IH; Tue, 01 Nov 2022 15:31:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1optEn-005ogP-8c
	for linux-riscv@bombadil.infradead.org; Tue, 01 Nov 2022 15:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VaW2ytNAoGjLS7s93SMuJqCgihDbue7mGljwoNvr7+o=; b=NY3jC8x+wj0waf4vpvASd5jywT
	4fsKlHhQwAtYKHbtqGOmmw6YTYYvR1qDCPXpFGsH2L/Xvf5F84MmV5rvg51zr88ulPssb/XJfT/Vt
	DY5K/6g6/Bgj0ba4kTXfH+UFWSa5ERPFdKKArorGGb1pE+Yg9oly8VjHZUgRSLkLiPhnY+1BH15Nh
	mxWkgfrVAwSF3/qQT6BTCit7Tn1bpZJkEqKRE2o1xBSDz2DMuj9syNbVPz08u4EIpefZtvlCfSfuB
	DWOAeEVfXP1BHoGy6DBXD3Ze+qFBBDz+zSA/n72qPw60iYvZKcBuAk1X/ffkySFy7ZqO5nZUIdJZI
	GE4xpk9Q==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1optEV-0089n1-5W
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 15:31:21 +0000
Received: by mail-ej1-x635.google.com with SMTP id k2so37978680ejr.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VaW2ytNAoGjLS7s93SMuJqCgihDbue7mGljwoNvr7+o=;
        b=WxxDmunO7yisxTX1qJDyxFEofs8Z6TwDYUJwzWjxnZHyTdJhvHE/G6Ub0UKU/7oOOp
         uqK/q/VQA/97k6pAls6A6t0kaHYJgbMrH5LPQVCSUVP9JzGbW403XGb6eq1ABWh44d2g
         7AZmipcnGHrC85dHDPWP+o/G0U6tASQ+Xw4nDgewKsH6C0KjUNKk8sT9Rj8lwxPmyp5X
         olXzyLF1fydJTxMN6JdjsofE15K8R2o2Ol5Mza16Veod/PzxAfN2dSD0y3uyeq79npvr
         hZUN5TPaaEmPkrE55zakQeKkwHlPLQHFMUwIoaZDkbLim/sRBIXaZW8aC9w2dML3GIgi
         Ebaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaW2ytNAoGjLS7s93SMuJqCgihDbue7mGljwoNvr7+o=;
        b=nv3me47XWyGUpyWTToZxwyIwTamTiaFGiRcVwxmabWJm+L177IIk4vDAl6C0MSWZKi
         HmPMnNUqTPCxj3TQIxIzzrwvsDk6CkcYpoOPyAQt5NhorJwpEUj5qiUpdIiFTfsMaUWy
         /2P9J/Ledkb3aXSvQYX5gIJAuZct2RlCcSul20JSFCZxYnmdE2iMcciUOkFRDot7/IJ9
         44CvtevfwD5W0UxqOKOxdcMbSIj+zVyhIN98eHC96Po53CU8UMxiYlR2xtIRhzIm9ag/
         krvrtAY+ikadY2VciFbVz1Iq0EQJIRkWKvLLnb3sKFTeQBPyWhHyo2S5Mo2YHAp0zdJ+
         K4ag==
X-Gm-Message-State: ACrzQf3gbzDsMSQ13AV/NqthHJjoSIfPI3SyqfVAfhrKXM4FPbCiI+Kl
	DiCpPKlJx6RBLMdv/vwwmChO8Q==
X-Google-Smtp-Source: AMsMyM4iNekg5tHCQzhbfNyjmQ/e2lNEFNKwEJG4sKiQjidXCuPwfH4x2jonj/DsXW+8+TtYzNj5lQ==
X-Received: by 2002:a17:906:5dd8:b0:78d:efa7:f78d with SMTP id p24-20020a1709065dd800b0078defa7f78dmr19272458ejv.641.1667316673990;
        Tue, 01 Nov 2022 08:31:13 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id mj21-20020a170906af9500b00773f3ccd989sm4324092ejb.68.2022.11.01.08.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 08:31:13 -0700 (PDT)
Date: Tue, 1 Nov 2022 16:31:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC  8/9] RISC-V: KVM: Implement perf support
Message-ID: <20221101153112.hpst2bohsdvqours@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-9-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718170205.2972215-9-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_153119_441905_99F1E6E9 
X-CRM114-Status: GOOD (  37.15  )
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

On Mon, Jul 18, 2022 at 10:02:04AM -0700, Atish Patra wrote:
> RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
> the virtualization enviornment as well. KVM implementation
> relies on SBI PMU extension for most of the part while traps

...relies on the SBI PMU extension for the most part while trapping
and emulating...

> & emulates the CSRs read for counter access.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 318 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 301 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 5434051f495d..278c261efad3 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -11,9 +11,163 @@
>  #include <linux/kvm_host.h>
>  #include <linux/perf/riscv_pmu.h>
>  #include <asm/csr.h>
> +#include <asm/bitops.h>
>  #include <asm/kvm_vcpu_pmu.h>
>  #include <linux/kvm_host.h>
>  
> +#define get_event_type(x) ((x & SBI_PMU_EVENT_IDX_TYPE_MASK) >> 16)
> +#define get_event_code(x) (x & SBI_PMU_EVENT_IDX_CODE_MASK)
> +
> +static inline u64 pmu_get_sample_period(struct kvm_pmc *pmc)
> +{
> +	u64 counter_val_mask = GENMASK(pmc->cinfo.width, 0);
> +	u64 sample_period;
> +
> +	if (!pmc->counter_val)
> +		sample_period = counter_val_mask;
> +	else
> +		sample_period = pmc->counter_val & counter_val_mask;
> +
> +	return sample_period;
> +}
> +
> +static u32 pmu_get_perf_event_type(unsigned long eidx)
> +{
> +	enum sbi_pmu_event_type etype = get_event_type(eidx);
> +	u32 type;
> +
> +	if (etype == SBI_PMU_EVENT_TYPE_HW)
> +		type = PERF_TYPE_HARDWARE;
> +	else if (etype == SBI_PMU_EVENT_TYPE_CACHE)
> +		type = PERF_TYPE_HW_CACHE;
> +	else if (etype == SBI_PMU_EVENT_TYPE_RAW || etype == SBI_PMU_EVENT_TYPE_FW)
> +		type = PERF_TYPE_RAW;
> +	else
> +		type = PERF_TYPE_MAX;
> +
> +	return type;
> +}
> +
> +static inline bool pmu_is_fw_event(unsigned long eidx)
> +{
> +	enum sbi_pmu_event_type etype = get_event_type(eidx);
> +
> +	return (etype == SBI_PMU_EVENT_TYPE_FW) ? true : false;

 return get_event_type(eidx) == SBI_PMU_EVENT_TYPE_FW;

> +}
> +
> +static void pmu_release_perf_event(struct kvm_pmc *pmc)
> +{
> +	if (pmc->perf_event) {
> +		perf_event_disable(pmc->perf_event);
> +		perf_event_release_kernel(pmc->perf_event);
> +		pmc->perf_event = NULL;
> +	}
> +}
> +
> +static u64 pmu_get_perf_event_hw_config(u32 sbi_event_code)
> +{
> +	/* SBI PMU HW event code is offset by 1 from perf hw event codes */
> +	return (u64)sbi_event_code - 1;
> +}
> +
> +static u64 pmu_get_perf_event_cache_config(u32 sbi_event_code)
> +{
> +	u64 config = U64_MAX;
> +	unsigned int cache_type, cache_op, cache_result;
> +
> +	/* All the cache event masks lie within 0xFF. No separate masking is necesssary */
> +	cache_type = (sbi_event_code & SBI_PMU_EVENT_CACHE_ID_CODE_MASK) >> 3;
> +	cache_op = (sbi_event_code & SBI_PMU_EVENT_CACHE_OP_ID_CODE_MASK) >> 1;
> +	cache_result = sbi_event_code & SBI_PMU_EVENT_CACHE_RESULT_ID_CODE_MASK;
> +
> +	if (cache_type >= PERF_COUNT_HW_CACHE_MAX ||
> +	    cache_op >= PERF_COUNT_HW_CACHE_OP_MAX ||
> +	    cache_result >= PERF_COUNT_HW_CACHE_RESULT_MAX)
> +		goto out;

No goto necessary

        if (...)
                return U64_MAX;
        return cache_type | (cache_op << 8) | (cache_result << 16);

> +	config = cache_type | (cache_op << 8) | (cache_result << 16);
> +out:
> +	return config;
> +}
> +
> +static u64 pmu_get_perf_event_config(unsigned long eidx, uint64_t edata)
> +{
> +	enum sbi_pmu_event_type etype = get_event_type(eidx);
> +	u32 ecode = get_event_code(eidx);
> +	u64 config = U64_MAX;
> +
> +	if (etype == SBI_PMU_EVENT_TYPE_HW)
> +		config = pmu_get_perf_event_hw_config(ecode);
> +	else if (etype == SBI_PMU_EVENT_TYPE_CACHE)
> +		config = pmu_get_perf_event_cache_config(ecode);
> +	else if (etype == SBI_PMU_EVENT_TYPE_RAW)
> +		config = edata & RISCV_PMU_RAW_EVENT_MASK;
> +	else if ((etype == SBI_PMU_EVENT_TYPE_FW) && (ecode < SBI_PMU_FW_MAX))
> +		config = (1ULL << 63) | ecode;
> +
> +	return config;
> +}
> +
> +static int pmu_get_fixed_pmc_index(unsigned long eidx)
> +{
> +	u32 etype = pmu_get_perf_event_type(eidx);
> +	u32 ecode = get_event_code(eidx);
> +	int ctr_idx;
> +
> +	if (etype != SBI_PMU_EVENT_TYPE_HW)
> +		return -EINVAL;
> +
> +	if (ecode == SBI_PMU_HW_CPU_CYCLES)
> +		ctr_idx = 0;
> +	else if (ecode == SBI_PMU_HW_INSTRUCTIONS)
> +		ctr_idx = 2;
> +	else
> +		return -EINVAL;
> +
> +	return ctr_idx;
> +}
> +
> +static int pmu_get_programmable_pmc_index(struct kvm_pmu *kvpmu, unsigned long eidx,
> +					  unsigned long cbase, unsigned long cmask)
> +{
> +	int ctr_idx = -1;
> +	int i, pmc_idx;
> +	int min, max;
> +
> +	if (pmu_is_fw_event(eidx)) {
> +		/* Firmware counters are mapped 1:1 starting from num_hw_ctrs for simplicity */
> +		min = kvpmu->num_hw_ctrs;
> +		max = min + kvpmu->num_fw_ctrs;
> +	} else {
> +		/* First 3 counters are reserved for fixed counters */
> +		min = 3;
> +		max = kvpmu->num_hw_ctrs;
> +	}
> +
> +	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
> +		pmc_idx = i + cbase;
> +		if ((pmc_idx >= min && pmc_idx < max) &&
> +		    !test_bit(pmc_idx, kvpmu->used_pmc)) {
> +			ctr_idx = pmc_idx;
> +			break;
> +		}
> +	}
> +
> +	return ctr_idx;
> +}
> +
> +static int pmu_get_pmc_index(struct kvm_pmu *pmu, unsigned long eidx,
> +			     unsigned long cbase, unsigned long cmask)
> +{
> +	int ret;
> +
> +	/* Fixed counters need to be have fixed mapping as they have different width */
> +	ret = pmu_get_fixed_pmc_index(eidx);
> +	if (ret >= 0)
> +		return ret;
> +
> +	return pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
> +}
> +
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				unsigned long *out_val)
>  {
> @@ -43,7 +197,6 @@ int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
>  
>  	if (!kvpmu)
>  		return KVM_INSN_EXIT_TO_USER_SPACE;
> -	//TODO: Should we check if vcpu pmu is initialized or not!
>  	if (wr_mask)
>  		return KVM_INSN_ILLEGAL_TRAP;
>  	cidx = csr_num - CSR_CYCLE;
> @@ -81,14 +234,62 @@ int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
>  int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  				 unsigned long ctr_mask, unsigned long flag, uint64_t ival)
>  {
> -	/* TODO */
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	int i, num_ctrs, pmc_index;
> +	struct kvm_pmc *pmc;
> +
> +	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
> +	if (ctr_base + __fls(ctr_mask) >= num_ctrs)
> +		return -EINVAL;
> +
> +	/* Start the counters that have been configured and requested by the guest */
> +	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
> +		pmc_index = i + ctr_base;
> +		if (!test_bit(pmc_index, kvpmu->used_pmc))
> +			continue;
> +		pmc = &kvpmu->pmc[pmc_index];
> +		if (flag & SBI_PMU_START_FLAG_SET_INIT_VALUE)
> +			pmc->counter_val = ival;
> +		if (pmc->perf_event) {
> +			perf_event_period(pmc->perf_event, pmu_get_sample_period(pmc));
> +			perf_event_enable(pmc->perf_event);
> +		}

What about checking the "SBI_ERR_ALREADY_STARTED" condition?

> +	}
> +
>  	return 0;
>  }
>  
>  int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  				 unsigned long ctr_mask, unsigned long flag)
>  {
> -	/* TODO */
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	int i, num_ctrs, pmc_index;
> +	u64 enabled, running;
> +	struct kvm_pmc *pmc;
> +
> +	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
> +	if ((ctr_base + __fls(ctr_mask)) >= num_ctrs)
> +		return -EINVAL;
> +
> +	/* Stop the counters that have been configured and requested by the guest */
> +	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
> +		pmc_index = i + ctr_base;
> +		if (!test_bit(pmc_index, kvpmu->used_pmc))
> +			continue;
> +		pmc = &kvpmu->pmc[pmc_index];
> +		if (pmc->perf_event) {
> +			/* Stop counting the counter */
> +			perf_event_disable(pmc->perf_event);
> +			if (flag & SBI_PMU_STOP_FLAG_RESET) {
> +				/* Relase the counter if this is a reset request */
> +				pmc->counter_val += perf_event_read_value(pmc->perf_event,
> +									  &enabled, &running);
> +				pmu_release_perf_event(pmc);
> +				clear_bit(pmc_index, kvpmu->used_pmc);
> +			}

What about checking the "SBI_ERR_ALREADY_STOPPED" condition?

> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -96,14 +297,85 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  				     unsigned long ctr_mask, unsigned long flag,
>  				     unsigned long eidx, uint64_t edata)
>  {
> -	/* TODO */
> -	return 0;
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	struct perf_event *event;
> +	struct perf_event_attr attr;
> +	int num_ctrs, ctr_idx;
> +	u32 etype = pmu_get_perf_event_type(eidx);
> +	u64 config;
> +	struct kvm_pmc *pmc;
> +
> +	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
> +	if ((etype == PERF_TYPE_MAX) || ((ctr_base + __fls(ctr_mask)) >= num_ctrs))

nit: Unnecessary ()

> +		return -EINVAL;
> +
> +	if (pmu_is_fw_event(eidx))
> +		return -EOPNOTSUPP;

nit: need blank line here

> +	/*
> +	 * SKIP_MATCH flag indicates the caller is aware of the assigned counter
> +	 * for this event. Just do a sanity check if it already marked used.
> +	 */
> +	if (flag & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
> +		if (!test_bit(ctr_base, kvpmu->used_pmc))
> +			return -EINVAL;
> +		ctr_idx = ctr_base;
> +		goto match_done;
> +	}
> +
> +	ctr_idx = pmu_get_pmc_index(kvpmu, eidx, ctr_base, ctr_mask);
> +	if (ctr_idx < 0)
> +		return -EOPNOTSUPP;
> +
> +match_done:
> +	pmc = &kvpmu->pmc[ctr_idx];
> +	pmu_release_perf_event(pmc);
> +	pmc->idx = ctr_idx;
> +
> +	config = pmu_get_perf_event_config(eidx, edata);
> +	memset(&attr, 0, sizeof(struct perf_event_attr));
> +	attr.type = etype;
> +	attr.size = sizeof(attr);
> +	attr.pinned = true;
> +
> +	/*
> +	 * It should never reach here if the platform doesn't support sscofpmf extensio
> +	 * as mode filtering won't work without it.
> +	 */
> +	attr.exclude_host = true;
> +	attr.exclude_hv = true;
> +	attr.exclude_user = flag & SBI_PMU_CFG_FLAG_SET_UINH ? 1 : 0;
> +	attr.exclude_kernel = flag & SBI_PMU_CFG_FLAG_SET_SINH ? 1 : 0;

nit: can use !!(flag & SBI_PMU_CFG_FLAG_SET_UINH)

> +	attr.config = config;
> +	attr.config1 = RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS;
> +	if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
> +		//TODO: Do we really want to clear the value in hardware counter
> +		pmc->counter_val = 0;
> +	}

nit: add blank line

> +	/*
> +	 * Set the default sample_period for now. The guest specified value
> +	 * will be updated in the start call.
> +	 */
> +	attr.sample_period = pmu_get_sample_period(pmc);
> +
> +	event = perf_event_create_kernel_counter(&attr, -1, current, NULL, pmc);
> +	if (IS_ERR(event)) {
> +		pr_err("kvm pmu event creation failed event %pe for eidx %lx\n", event, eidx);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	set_bit(ctr_idx, kvpmu->used_pmc);
> +	pmc->perf_event = event;
> +	if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
> +		perf_event_enable(pmc->perf_event);
> +
> +	return ctr_idx;
>  }
>  
>  int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  {
>  	int i = 0, num_hw_ctrs, num_fw_ctrs, hpm_width;
>  	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	struct kvm_pmc *pmc;
>  
>  	if (!kvpmu)
>  		return -EINVAL;
> @@ -120,6 +392,7 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  		return -EINVAL;
>  	}
>  
> +	bitmap_zero(kvpmu->used_pmc, RISCV_MAX_COUNTERS);
>  	kvpmu->num_hw_ctrs = num_hw_ctrs;
>  	kvpmu->num_fw_ctrs = num_fw_ctrs;
>  	/*
> @@ -132,38 +405,49 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  		/* TIME CSR shouldn't be read from perf interface */
>  		if (i == 1)
>  			continue;
> -		kvpmu->pmc[i].idx = i;
> -		kvpmu->pmc[i].vcpu = vcpu;
> +		pmc = &kvpmu->pmc[i];

Better to introduce this with the patch that introduced this loop.

> +		pmc->idx = i;
> +		pmc->counter_val = 0;
> +		pmc->vcpu = vcpu;
>  		if (i < kvpmu->num_hw_ctrs) {
>  			kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_HW;
>  			if (i < 3)
>  				/* CY, IR counters */
> -				kvpmu->pmc[i].cinfo.width = 63;
> +				pmc->cinfo.width = 63;
>  			else
> -				kvpmu->pmc[i].cinfo.width = hpm_width;
> +				pmc->cinfo.width = hpm_width;
>  			/*
>  			 * The CSR number doesn't have any relation with the logical
>  			 * hardware counters. The CSR numbers are encoded sequentially
>  			 * to avoid maintaining a map between the virtual counter
>  			 * and CSR number.
>  			 */
> -			kvpmu->pmc[i].cinfo.csr = CSR_CYCLE + i;
> +			pmc->cinfo.csr = CSR_CYCLE + i;
>  		} else {
> -			kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_FW;
> -			kvpmu->pmc[i].cinfo.width = BITS_PER_LONG - 1;
> +			pmc->cinfo.type = SBI_PMU_CTR_TYPE_FW;
> +			pmc->cinfo.width = BITS_PER_LONG - 1;
>  		}
>  	}
>  
>  	return 0;
>  }
>  
> -void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
> +void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
>  {
> -	/* TODO */
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	struct kvm_pmc *pmc;
> +	int i;
> +
> +	if (!kvpmu)
> +		return;
> +
> +	for_each_set_bit(i, kvpmu->used_pmc, RISCV_MAX_COUNTERS) {
> +		pmc = &kvpmu->pmc[i];
> +		pmu_release_perf_event(pmc);
> +	}
>  }
>  
> -void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
> +void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
>  {
> -	/* TODO */
> +	kvm_riscv_vcpu_pmu_deinit(vcpu);
>  }
> -
> -- 
> 2.25.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
