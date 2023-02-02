Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A25C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 18:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdqg8DZfj+Q3zJFrf6Tvl7MuHlVvvUwvob/IYwbKN/s=; b=BWMx86gyV1u1To
	wLALcK6sH+i5T9+cfXq5q54MEWawwKEnV1lumlZCGvJMzm/gOER8OZpeabxI3ptMjCn7NhyP7OlAZ
	1oNDaW14UdvYJBNNgrZMwaPpqe1/uka4GQ8O1cj41HagZqUZw9u21FDXoyEk1ED2skQPeAaYtAUP6
	MRmCvBYx7RDd+qtSe7uzmslz0EfJY0DCAImzyqb0DkQ7Ip39qdpnk5DmNPX5//ExLwWP7NF6cIJFD
	cmd/tG63fzHSWydsk+bpgSd/4Ml8NuvUtMmB9dRlDAPM2YEr17Bpo2+WeWU3hDwsEuMaQuEw87cN1
	w8GCuCMoc242yncmzaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeZZ-00GzLH-1a; Thu, 02 Feb 2023 18:44:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeZV-00GzKN-In
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 18:44:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l8so2153669wms.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 10:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ly19APJ7xVUC2jMXoju5a8xALoZWJfc0yqZaZntxvZc=;
        b=VYhatobFOd5oobTifCDVpRO+EtnxaE40TkWj+by55+HsXnnK0+IW76zgzjdxQKk5Gx
         ANhrpsefLJj5q1GtvkmKvmV6gI8AXUVjwkdJ4r3getbCEtK3wE/ScHq40R0HaoDaHOWN
         3v9ee8fDYvvY2GjuyEmBZ+pHBTu9SZXS4pSRfzbtd1bWenEmTRsIZeY0eomdyN7kZ/BQ
         s0/ZyZRs7rnN47GiZAzk3UfS16FUMnnwz+gJe0rFkqGl9mXumC/iSb3mMBsPt/aXbSUd
         F/7o93yGnJzSA4J87ZmSc9dtJHDlII4EpKn3YA/lzSfYKXOwkpm0pApIBHn2zVe2EkSv
         sufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ly19APJ7xVUC2jMXoju5a8xALoZWJfc0yqZaZntxvZc=;
        b=40t+A7BD69OhjLQThe6xFNVkOwKo628bTG7FmSlY3lD/deHSwww7MedvJAbY6eMXmK
         hLZiUhIPl1R/trvoq+FIkbE4gDzzTVsMQpjWUTNPqKbU6eENJid/blqEZiQ7OqzTUE9y
         mB75pS12aWL8/DznTxB8FsT2VZr0IOYW1iLOb9QvY7cHmCpBBpg6NdpX55Swn3mx0snR
         zyPTPmSCyoPHhBFbSyvVVvsx3XB9X0G+zhJoWQmd162n8Y/jRP6yNMH+QOmLTlyJ4Snb
         IPfDKWpi7PVKEBb+oWnoO1Cbkx+zyTb4pF94UD03BG2WFZIcsSAEF3G+CImYzR8jdyqf
         Sivw==
X-Gm-Message-State: AO0yUKXo/kTM4OmvFBR3fpKbj9aOQbw+pzK8fWI+uhmtwVOoPn9YxQLp
	yp2l1OtXutMONAJ6+v+6JqUY1A==
X-Google-Smtp-Source: AK7set9jnuAPAJhRkGOMt2spmSwiPzs2KI3eG/8K3aWFLBKVKvZie0qjrqr004NVrHEyaKYU3WQdSg==
X-Received: by 2002:a05:600c:310c:b0:3dc:1f90:35b with SMTP id g12-20020a05600c310c00b003dc1f90035bmr7950630wmo.34.1675363471130;
        Thu, 02 Feb 2023 10:44:31 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p2-20020a05600c358200b003dc4ecfc4d7sm526005wmq.29.2023.02.02.10.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:44:30 -0800 (PST)
Date: Thu, 2 Feb 2023 19:44:29 +0100
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
Subject: Re: [PATCH v4 12/14] RISC-V: KVM: Implement perf support without
 sampling
Message-ID: <20230202184429.jwytwoqdo7oid2hy@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-13-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201231250.3806412-13-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_104433_634782_089A3F7D 
X-CRM114-Status: GOOD (  36.57  )
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

On Wed, Feb 01, 2023 at 03:12:48PM -0800, Atish Patra wrote:
> RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
> the virtualization enviornment as well. KVM implementation
> relies on SBI PMU extension for the most part while trapping
> & emulating the CSRs read for counter access.
> 
> This patch doesn't have the event sampling support yet.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 360 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 356 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 6fa0065..473ad80 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -12,10 +12,189 @@
>  #include <linux/perf/riscv_pmu.h>
>  #include <asm/csr.h>
>  #include <asm/kvm_vcpu_sbi.h>
> +#include <asm/bitops.h>
>  #include <asm/kvm_vcpu_pmu.h>
>  #include <linux/kvm_host.h>
>  
>  #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
> +#define get_event_type(x) (((x) & SBI_PMU_EVENT_IDX_TYPE_MASK) >> 16)
> +#define get_event_code(x) ((x) & SBI_PMU_EVENT_IDX_CODE_MASK)
> +
> +static enum perf_hw_id hw_event_perf_map[SBI_PMU_HW_GENERAL_MAX] = {
> +	[SBI_PMU_HW_CPU_CYCLES] = PERF_COUNT_HW_CPU_CYCLES,
> +	[SBI_PMU_HW_INSTRUCTIONS] = PERF_COUNT_HW_INSTRUCTIONS,
> +	[SBI_PMU_HW_CACHE_REFERENCES] = PERF_COUNT_HW_CACHE_REFERENCES,
> +	[SBI_PMU_HW_CACHE_MISSES] = PERF_COUNT_HW_CACHE_MISSES,
> +	[SBI_PMU_HW_BRANCH_INSTRUCTIONS] = PERF_COUNT_HW_BRANCH_INSTRUCTIONS,
> +	[SBI_PMU_HW_BRANCH_MISSES] = PERF_COUNT_HW_BRANCH_MISSES,
> +	[SBI_PMU_HW_BUS_CYCLES] = PERF_COUNT_HW_BUS_CYCLES,
> +	[SBI_PMU_HW_STALLED_CYCLES_FRONTEND] = PERF_COUNT_HW_STALLED_CYCLES_FRONTEND,
> +	[SBI_PMU_HW_STALLED_CYCLES_BACKEND] = PERF_COUNT_HW_STALLED_CYCLES_BACKEND,
> +	[SBI_PMU_HW_REF_CPU_CYCLES] = PERF_COUNT_HW_REF_CPU_CYCLES,
> +};
> +
> +static u64 kvm_pmu_get_sample_period(struct kvm_pmc *pmc)
> +{
> +	u64 counter_val_mask = GENMASK(pmc->cinfo.width, 0);
> +	u64 sample_period;
> +
> +	if (!pmc->counter_val)
> +		sample_period = counter_val_mask + 1;
> +	else
> +		sample_period = (-pmc->counter_val) & counter_val_mask;
> +
> +	return sample_period;
> +}
> +
> +static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
> +{
> +	enum sbi_pmu_event_type etype = get_event_type(eidx);
> +	u32 type = PERF_TYPE_MAX;
> +
> +	switch (etype) {
> +	case SBI_PMU_EVENT_TYPE_HW:
> +		type = PERF_TYPE_HARDWARE;
> +		break;
> +	case SBI_PMU_EVENT_TYPE_CACHE:
> +		type = PERF_TYPE_HW_CACHE;
> +		break;
> +	case SBI_PMU_EVENT_TYPE_RAW:
> +	case SBI_PMU_EVENT_TYPE_FW:
> +		type = PERF_TYPE_RAW;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return type;
> +}
> +
> +static bool kvm_pmu_is_fw_event(unsigned long eidx)
> +{
> +	return get_event_type(eidx) == SBI_PMU_EVENT_TYPE_FW;
> +}
> +
> +static void kvm_pmu_release_perf_event(struct kvm_pmc *pmc)
> +{
> +	if (pmc->perf_event) {
> +		perf_event_disable(pmc->perf_event);
> +		perf_event_release_kernel(pmc->perf_event);
> +		pmc->perf_event = NULL;
> +	}
> +}
> +
> +static u64 kvm_pmu_get_perf_event_hw_config(u32 sbi_event_code)
> +{
> +	return hw_event_perf_map[sbi_event_code];
> +}
> +
> +static u64 kvm_pmu_get_perf_event_cache_config(u32 sbi_event_code)
> +{
> +	u64 config = U64_MAX;
> +	unsigned int cache_type, cache_op, cache_result;
> +
> +	/* All the cache event masks lie within 0xFF. No separate masking is necessary */
> +	cache_type = (sbi_event_code & SBI_PMU_EVENT_CACHE_ID_CODE_MASK) >>
> +		      SBI_PMU_EVENT_CACHE_ID_SHIFT;
> +	cache_op = (sbi_event_code & SBI_PMU_EVENT_CACHE_OP_ID_CODE_MASK) >>
> +		    SBI_PMU_EVENT_CACHE_OP_SHIFT;
> +	cache_result = sbi_event_code & SBI_PMU_EVENT_CACHE_RESULT_ID_CODE_MASK;
> +
> +	if (cache_type >= PERF_COUNT_HW_CACHE_MAX ||
> +	    cache_op >= PERF_COUNT_HW_CACHE_OP_MAX ||
> +	    cache_result >= PERF_COUNT_HW_CACHE_RESULT_MAX)
> +		return config;
> +
> +	config = cache_type | (cache_op << 8) | (cache_result << 16);
> +
> +	return config;
> +}
> +
> +static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
> +{
> +	enum sbi_pmu_event_type etype = get_event_type(eidx);
> +	u32 ecode = get_event_code(eidx);
> +	u64 config = U64_MAX;
> +
> +	switch (etype) {
> +	case SBI_PMU_EVENT_TYPE_HW:
> +		if (ecode < SBI_PMU_HW_GENERAL_MAX)
> +			config = kvm_pmu_get_perf_event_hw_config(ecode);
> +		break;
> +	case SBI_PMU_EVENT_TYPE_CACHE:
> +		config = kvm_pmu_get_perf_event_cache_config(ecode);
> +		break;
> +	case SBI_PMU_EVENT_TYPE_RAW:
> +		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
> +		break;
> +	case SBI_PMU_EVENT_TYPE_FW:
> +		if (ecode < SBI_PMU_FW_MAX)
> +			config = (1ULL << 63) | ecode;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return config;
> +}
> +
> +static int kvm_pmu_get_fixed_pmc_index(unsigned long eidx)
> +{
> +	u32 etype = kvm_pmu_get_perf_event_type(eidx);
> +	u32 ecode = get_event_code(eidx);
> +
> +	if (etype != SBI_PMU_EVENT_TYPE_HW)
> +		return -EINVAL;
> +
> +	if (ecode == SBI_PMU_HW_CPU_CYCLES)
> +		return 0;
> +	else if (ecode == SBI_PMU_HW_INSTRUCTIONS)
> +		return 2;
> +	else
> +		return -EINVAL;
> +}
> +
> +static int kvm_pmu_get_programmable_pmc_index(struct kvm_pmu *kvpmu, unsigned long eidx,
> +					  unsigned long cbase, unsigned long cmask)
> +{
> +	int ctr_idx = -1;
> +	int i, pmc_idx;
> +	int min, max;
> +
> +	if (kvm_pmu_is_fw_event(eidx)) {
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
> +		    !test_bit(pmc_idx, kvpmu->pmc_in_use)) {
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
> +	ret = kvm_pmu_get_fixed_pmc_index(eidx);
> +	if (ret >= 0)
> +		return ret;
> +
> +	return kvm_pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
> +}
>  
>  static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  			unsigned long *out_val)
> @@ -34,6 +213,16 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	return 0;
>  }
>  
> +static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ctr_base,
> +					 unsigned long ctr_mask)
> +{
> +	/* Make sure the we have a valid counter mask requested from the caller */
> +	if (!ctr_mask || (ctr_base + __fls(ctr_mask) >= kvm_pmu_num_counters(kvpmu)))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
>  				unsigned long *val, unsigned long new_val,
>  				unsigned long wr_mask)
> @@ -97,7 +286,39 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  				 unsigned long ctr_mask, unsigned long flag, uint64_t ival,
>  				 struct kvm_vcpu_sbi_return *retdata)
>  {
> -	/* TODO */
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	int i, pmc_index, sbiret = 0;
> +	struct kvm_pmc *pmc;
> +
> +	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
> +		sbiret = SBI_ERR_INVALID_PARAM;
> +		goto out;
> +	}
> +
> +	/* Start the counters that have been configured and requested by the guest */
> +	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
> +		pmc_index = i + ctr_base;
> +		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
> +			continue;
> +		pmc = &kvpmu->pmc[pmc_index];
> +		if (flag & SBI_PMU_START_FLAG_SET_INIT_VALUE)
> +			pmc->counter_val = ival;
> +		if (pmc->perf_event) {
> +			if (unlikely(pmc->started)) {
> +				sbiret = SBI_ERR_ALREADY_STARTED;
> +				continue;
> +			}
> +			perf_event_period(pmc->perf_event, kvm_pmu_get_sample_period(pmc));
> +			perf_event_enable(pmc->perf_event);
> +			pmc->started = true;
> +		} else {
> +			sbiret = SBI_ERR_INVALID_PARAM;
> +		}
> +	}
> +
> +out:
> +	retdata->err_val = sbiret;
> +
>  	return 0;
>  }
>  
> @@ -105,7 +326,45 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  				unsigned long ctr_mask, unsigned long flag,
>  				struct kvm_vcpu_sbi_return *retdata)
>  {
> -	/* TODO */
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	int i, pmc_index, sbiret = 0;
> +	u64 enabled, running;
> +	struct kvm_pmc *pmc;
> +
> +	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
> +		sbiret = SBI_ERR_INVALID_PARAM;
> +		goto out;
> +	}
> +
> +	/* Stop the counters that have been configured and requested by the guest */
> +	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
> +		pmc_index = i + ctr_base;
> +		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
> +			continue;
> +		pmc = &kvpmu->pmc[pmc_index];
> +		if (pmc->perf_event) {
> +			if (pmc->started) {
> +				/* Stop counting the counter */
> +				perf_event_disable(pmc->perf_event);
> +				pmc->started = false;
> +			} else
> +				sbiret = SBI_ERR_ALREADY_STOPPED;
> +
> +			if (flag & SBI_PMU_STOP_FLAG_RESET) {
> +				/* Relase the counter if this is a reset request */
> +				pmc->counter_val += perf_event_read_value(pmc->perf_event,
> +									  &enabled, &running);
> +				kvm_pmu_release_perf_event(pmc);
> +				clear_bit(pmc_index, kvpmu->pmc_in_use);
> +			}
> +		} else {
> +			sbiret = SBI_ERR_INVALID_PARAM;
> +		}
> +	}
> +
> +out:
> +	retdata->err_val = sbiret;
> +
>  	return 0;
>  }
>  
> @@ -114,7 +373,88 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  				     unsigned long eidx, uint64_t evtdata,
>  				     struct kvm_vcpu_sbi_return *retdata)
>  {
> -	/* TODO */
> +	int ctr_idx, sbiret = 0;
> +	u64 config;
> +	u32 etype = kvm_pmu_get_perf_event_type(eidx);
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	struct perf_event *event;
> +	struct kvm_pmc *pmc;
> +	struct perf_event_attr attr = {
> +		.type = etype,
> +		.size = sizeof(struct perf_event_attr),
> +		.pinned = true,
> +		/*
> +		 * It should never reach here if the platform doesn't support the sscofpmf
> +		 * extension as mode filtering won't work without it.
> +		 */
> +		.exclude_host = true,
> +		.exclude_hv = true,
> +		.exclude_user = !!(flag & SBI_PMU_CFG_FLAG_SET_UINH),
> +		.exclude_kernel = !!(flag & SBI_PMU_CFG_FLAG_SET_SINH),
> +		.config1 = RISCV_PMU_CONFIG1_GUEST_EVENTS,
> +	};
> +
> +	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
> +		sbiret = SBI_ERR_INVALID_PARAM;
> +		goto out;
> +	}
> +
> +	if (kvm_pmu_is_fw_event(eidx)) {
> +		sbiret = SBI_ERR_NOT_SUPPORTED;
> +		goto out;
> +	}
> +
> +	/*
> +	 * SKIP_MATCH flag indicates the caller is aware of the assigned counter
> +	 * for this event. Just do a sanity check if it already marked used.
> +	 */
> +	if (flag & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
> +		if (!test_bit(ctr_base + __ffs(ctr_mask), kvpmu->pmc_in_use)) {
> +			sbiret = SBI_ERR_FAILURE;
> +			goto out;
> +		}
> +		ctr_idx = ctr_base + __ffs(ctr_mask);
> +	} else  {
> +

extra blank line here

> +		ctr_idx = pmu_get_pmc_index(kvpmu, eidx, ctr_base, ctr_mask);
> +		if (ctr_idx < 0) {
> +			sbiret = SBI_ERR_NOT_SUPPORTED;
> +			goto out;
> +		}
> +	}
> +
> +	pmc = &kvpmu->pmc[ctr_idx];
> +	kvm_pmu_release_perf_event(pmc);
> +	pmc->idx = ctr_idx;
> +
> +	config = kvm_pmu_get_perf_event_config(eidx, evtdata);
> +	attr.config = config;
> +	if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
> +		//TODO: Do we really want to clear the value in hardware counter
> +		pmc->counter_val = 0;
> +	}
> +
> +	/*
> +	 * Set the default sample_period for now. The guest specified value
> +	 * will be updated in the start call.
> +	 */
> +	attr.sample_period = kvm_pmu_get_sample_period(pmc);
> +
> +	event = perf_event_create_kernel_counter(&attr, -1, current, NULL, pmc);
> +	if (IS_ERR(event)) {
> +		pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
> +		return PTR_ERR(event);
> +	}
> +
> +	set_bit(ctr_idx, kvpmu->pmc_in_use);
> +	pmc->perf_event = event;
> +	if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
> +		perf_event_enable(pmc->perf_event);
> +
> +	retdata->out_val = ctr_idx;
> +out:
> +	retdata->err_val = sbiret;
> +
>  	return 0;
>  }
>  
> @@ -192,7 +532,19 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  
>  void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
>  {
> -	/* TODO */
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	struct kvm_pmc *pmc;
> +	int i;
> +
> +	if (!kvpmu)
> +		return;
> +
> +	for_each_set_bit(i, kvpmu->pmc_in_use, RISCV_MAX_COUNTERS) {
> +		pmc = &kvpmu->pmc[i];
> +		pmc->counter_val = 0;
> +		kvm_pmu_release_perf_event(pmc);
> +	}
> +	bitmap_zero(kvpmu->pmc_in_use, RISCV_MAX_COUNTERS);
>  }
>  
>  void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
> -- 
> 2.25.1
>

Other than the extra blank line,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
