Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768AAC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4y0Qp6x8CC1c/FZi5pUWGreE0Kah719J6PgFkKdZzmg=; b=fbgllY74JmOaWQ
	JIAZcINJG/EY/c22wDp8IXBCP1HJ+nccUnp2Ekj7bH0byLk2EKXDHFvHElRpzTcNMSGaTAoh0FUwA
	YXRL9V2uVd1aSc/yTT5Wg6jCGVSEPlRVkwIx0jRK3oOPEXLfW2ZjnE/y7OsIZ1XDFRj8peItRkRht
	aRnOzzbz5/xbFIKakyI0aeLeIftEPYhc9/0gqPMVhBgnxr/gAirfaR5XedZcyxnCcveMdYYrnAzuz
	DmCW78j+JuKGOuI+lhQ3sfRsKy+KI0YrXcpd6eVTshaR2TNbUv7KT189t9iEfBCvPNbABZvZQXKXM
	lzM/x5G56a8wCYBF5BnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDV1v-00HOu2-4v; Mon, 18 Jul 2022 17:59:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDV1r-00HOb0-Ap
	for linux-riscv@bombadil.infradead.org; Mon, 18 Jul 2022 17:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DudDSxwzmUDI8860lqzmSl3O3ezUAmmtuRpFvcpbiqM=; b=nkYsGImbjJBlgMr9MG+Pla+Z1l
	Voe6TRm2UQOEzE8uKSXX2LUDNKmVCA5PkRbGKIVBd+bZ0dpUiUo7b866RcH3lj9fTWjSydlxpUgAd
	C2mX7+nKf7c/PRSB+zOlhKX6xjpBrxbzdiBOer99zIjYqmFoZj6WqCYcAWrKvUS19PD86pHw+VFRD
	jucM07BDQvEqhB2QQTsupCfJY9jBnkOW/wIVrqmiqS0/6tzxMIelNjhV1GKytJg98aabXsyPoc/+m
	q9gXPfLC6aLs1JqN2RyMbB7r97oE+JpTDpbPURH6T8QskeL6xkv/OjmGDliYWPgC9oMyJWPNjg2Mv
	z7vSYsAg==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBv-004rQO-PU
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 17:05:58 +0000
Received: by mail-pg1-x52e.google.com with SMTP id r186so11146442pgr.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 10:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DudDSxwzmUDI8860lqzmSl3O3ezUAmmtuRpFvcpbiqM=;
        b=JMzb1okk1veZl1WbSRPR3z17BIsd9O28rSDVH2XWQZCNRxgtk2tCWrlaeK5NxJTDEb
         FJWxY4TJmoF3uHGy9WZrm9GYkZ36LMHqAlVR2tm8j+c2ZoCZDQrPIBdkGgR+QgAH1Ohi
         z7tYM8RpqGojLgmmp0e0PRXY6gyP8SzP2CCBeQRg95QP6tk4fxllVfcixW1Rm5j/2Zna
         XGs69YvPA2xMlFeY76U7OYenE5lcyVzTa5y98YGTtRBKYt94Azob+tJYzUlSxIseK/ob
         esOf2ChMSWIasebDWTQgiuQoUzqQc/CzzoPjCeNeUQFhr5ygWelbNFItPI9EZr7XrFHo
         8zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DudDSxwzmUDI8860lqzmSl3O3ezUAmmtuRpFvcpbiqM=;
        b=0pmEiP4HYpQWwa+S5GoRP89BjYsT79cZsJcMsm/iOS+OyB+FK7TItIkFCf6w6wqbu1
         heB1Aw2n0kor7e/My2Q1NDTzuZvN73OEZiuWv9AN5orrI12rwl/NuJDPxK1f2MalfeVg
         9cxmw0OQ0+6r5z+cnC/ZuH1pfLhte4zAlwv96yD8UFbgP2HA4YtaCXAHyj5evkgkgATK
         gH+pWWM8NL+7MmlHRxPwuwqdltV5VtuP9JLLpxz0Q1QXRv8KS9StV/vs1frwPEjTcyCl
         GSVcuD1V0C/Iyy+XoIQ2k1dO3AdPiRJ9Nrr3d0521qPSnx5QVPel7MQ8n52ieVb4Chb1
         MI6Q==
X-Gm-Message-State: AJIora8nl0y1tAGBInR7esHIrKNSO31FNI5VbLYE4w/XQ5TafSh+i95l
	aOJoxQcvOLD5lSINw9qmbB06UQ==
X-Google-Smtp-Source: AGRyM1uaEuvYAKQDRhJRtgw3nQLKDv5Q+LFtC+ezT9Le6ONfC43Kv6qU/4zj/oJlbv8mg+IvdwsCug==
X-Received: by 2002:a63:5c42:0:b0:412:b2e9:97e4 with SMTP id n2-20020a635c42000000b00412b2e997e4mr26596777pgm.36.1658163953563;
        Mon, 18 Jul 2022 10:05:53 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902be0a00b0016bc947c5b7sm9733402pls.38.2022.07.18.10.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:05:53 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [RFC  8/9] RISC-V: KVM: Implement perf support
Date: Mon, 18 Jul 2022 10:02:04 -0700
Message-Id: <20220718170205.2972215-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718170205.2972215-1-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_180556_120441_82B7D05B 
X-CRM114-Status: GOOD (  26.67  )
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

RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
the virtualization enviornment as well. KVM implementation
relies on SBI PMU extension for most of the part while traps
& emulates the CSRs read for counter access.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 318 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 301 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 5434051f495d..278c261efad3 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -11,9 +11,163 @@
 #include <linux/kvm_host.h>
 #include <linux/perf/riscv_pmu.h>
 #include <asm/csr.h>
+#include <asm/bitops.h>
 #include <asm/kvm_vcpu_pmu.h>
 #include <linux/kvm_host.h>
 
+#define get_event_type(x) ((x & SBI_PMU_EVENT_IDX_TYPE_MASK) >> 16)
+#define get_event_code(x) (x & SBI_PMU_EVENT_IDX_CODE_MASK)
+
+static inline u64 pmu_get_sample_period(struct kvm_pmc *pmc)
+{
+	u64 counter_val_mask = GENMASK(pmc->cinfo.width, 0);
+	u64 sample_period;
+
+	if (!pmc->counter_val)
+		sample_period = counter_val_mask;
+	else
+		sample_period = pmc->counter_val & counter_val_mask;
+
+	return sample_period;
+}
+
+static u32 pmu_get_perf_event_type(unsigned long eidx)
+{
+	enum sbi_pmu_event_type etype = get_event_type(eidx);
+	u32 type;
+
+	if (etype == SBI_PMU_EVENT_TYPE_HW)
+		type = PERF_TYPE_HARDWARE;
+	else if (etype == SBI_PMU_EVENT_TYPE_CACHE)
+		type = PERF_TYPE_HW_CACHE;
+	else if (etype == SBI_PMU_EVENT_TYPE_RAW || etype == SBI_PMU_EVENT_TYPE_FW)
+		type = PERF_TYPE_RAW;
+	else
+		type = PERF_TYPE_MAX;
+
+	return type;
+}
+
+static inline bool pmu_is_fw_event(unsigned long eidx)
+{
+	enum sbi_pmu_event_type etype = get_event_type(eidx);
+
+	return (etype == SBI_PMU_EVENT_TYPE_FW) ? true : false;
+}
+
+static void pmu_release_perf_event(struct kvm_pmc *pmc)
+{
+	if (pmc->perf_event) {
+		perf_event_disable(pmc->perf_event);
+		perf_event_release_kernel(pmc->perf_event);
+		pmc->perf_event = NULL;
+	}
+}
+
+static u64 pmu_get_perf_event_hw_config(u32 sbi_event_code)
+{
+	/* SBI PMU HW event code is offset by 1 from perf hw event codes */
+	return (u64)sbi_event_code - 1;
+}
+
+static u64 pmu_get_perf_event_cache_config(u32 sbi_event_code)
+{
+	u64 config = U64_MAX;
+	unsigned int cache_type, cache_op, cache_result;
+
+	/* All the cache event masks lie within 0xFF. No separate masking is necesssary */
+	cache_type = (sbi_event_code & SBI_PMU_EVENT_CACHE_ID_CODE_MASK) >> 3;
+	cache_op = (sbi_event_code & SBI_PMU_EVENT_CACHE_OP_ID_CODE_MASK) >> 1;
+	cache_result = sbi_event_code & SBI_PMU_EVENT_CACHE_RESULT_ID_CODE_MASK;
+
+	if (cache_type >= PERF_COUNT_HW_CACHE_MAX ||
+	    cache_op >= PERF_COUNT_HW_CACHE_OP_MAX ||
+	    cache_result >= PERF_COUNT_HW_CACHE_RESULT_MAX)
+		goto out;
+	config = cache_type | (cache_op << 8) | (cache_result << 16);
+out:
+	return config;
+}
+
+static u64 pmu_get_perf_event_config(unsigned long eidx, uint64_t edata)
+{
+	enum sbi_pmu_event_type etype = get_event_type(eidx);
+	u32 ecode = get_event_code(eidx);
+	u64 config = U64_MAX;
+
+	if (etype == SBI_PMU_EVENT_TYPE_HW)
+		config = pmu_get_perf_event_hw_config(ecode);
+	else if (etype == SBI_PMU_EVENT_TYPE_CACHE)
+		config = pmu_get_perf_event_cache_config(ecode);
+	else if (etype == SBI_PMU_EVENT_TYPE_RAW)
+		config = edata & RISCV_PMU_RAW_EVENT_MASK;
+	else if ((etype == SBI_PMU_EVENT_TYPE_FW) && (ecode < SBI_PMU_FW_MAX))
+		config = (1ULL << 63) | ecode;
+
+	return config;
+}
+
+static int pmu_get_fixed_pmc_index(unsigned long eidx)
+{
+	u32 etype = pmu_get_perf_event_type(eidx);
+	u32 ecode = get_event_code(eidx);
+	int ctr_idx;
+
+	if (etype != SBI_PMU_EVENT_TYPE_HW)
+		return -EINVAL;
+
+	if (ecode == SBI_PMU_HW_CPU_CYCLES)
+		ctr_idx = 0;
+	else if (ecode == SBI_PMU_HW_INSTRUCTIONS)
+		ctr_idx = 2;
+	else
+		return -EINVAL;
+
+	return ctr_idx;
+}
+
+static int pmu_get_programmable_pmc_index(struct kvm_pmu *kvpmu, unsigned long eidx,
+					  unsigned long cbase, unsigned long cmask)
+{
+	int ctr_idx = -1;
+	int i, pmc_idx;
+	int min, max;
+
+	if (pmu_is_fw_event(eidx)) {
+		/* Firmware counters are mapped 1:1 starting from num_hw_ctrs for simplicity */
+		min = kvpmu->num_hw_ctrs;
+		max = min + kvpmu->num_fw_ctrs;
+	} else {
+		/* First 3 counters are reserved for fixed counters */
+		min = 3;
+		max = kvpmu->num_hw_ctrs;
+	}
+
+	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
+		pmc_idx = i + cbase;
+		if ((pmc_idx >= min && pmc_idx < max) &&
+		    !test_bit(pmc_idx, kvpmu->used_pmc)) {
+			ctr_idx = pmc_idx;
+			break;
+		}
+	}
+
+	return ctr_idx;
+}
+
+static int pmu_get_pmc_index(struct kvm_pmu *pmu, unsigned long eidx,
+			     unsigned long cbase, unsigned long cmask)
+{
+	int ret;
+
+	/* Fixed counters need to be have fixed mapping as they have different width */
+	ret = pmu_get_fixed_pmc_index(eidx);
+	if (ret >= 0)
+		return ret;
+
+	return pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
+}
+
 int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				unsigned long *out_val)
 {
@@ -43,7 +197,6 @@ int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
 
 	if (!kvpmu)
 		return KVM_INSN_EXIT_TO_USER_SPACE;
-	//TODO: Should we check if vcpu pmu is initialized or not!
 	if (wr_mask)
 		return KVM_INSN_ILLEGAL_TRAP;
 	cidx = csr_num - CSR_CYCLE;
@@ -81,14 +234,62 @@ int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				 unsigned long ctr_mask, unsigned long flag, uint64_t ival)
 {
-	/* TODO */
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	int i, num_ctrs, pmc_index;
+	struct kvm_pmc *pmc;
+
+	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
+	if (ctr_base + __fls(ctr_mask) >= num_ctrs)
+		return -EINVAL;
+
+	/* Start the counters that have been configured and requested by the guest */
+	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
+		pmc_index = i + ctr_base;
+		if (!test_bit(pmc_index, kvpmu->used_pmc))
+			continue;
+		pmc = &kvpmu->pmc[pmc_index];
+		if (flag & SBI_PMU_START_FLAG_SET_INIT_VALUE)
+			pmc->counter_val = ival;
+		if (pmc->perf_event) {
+			perf_event_period(pmc->perf_event, pmu_get_sample_period(pmc));
+			perf_event_enable(pmc->perf_event);
+		}
+	}
+
 	return 0;
 }
 
 int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				 unsigned long ctr_mask, unsigned long flag)
 {
-	/* TODO */
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	int i, num_ctrs, pmc_index;
+	u64 enabled, running;
+	struct kvm_pmc *pmc;
+
+	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
+	if ((ctr_base + __fls(ctr_mask)) >= num_ctrs)
+		return -EINVAL;
+
+	/* Stop the counters that have been configured and requested by the guest */
+	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
+		pmc_index = i + ctr_base;
+		if (!test_bit(pmc_index, kvpmu->used_pmc))
+			continue;
+		pmc = &kvpmu->pmc[pmc_index];
+		if (pmc->perf_event) {
+			/* Stop counting the counter */
+			perf_event_disable(pmc->perf_event);
+			if (flag & SBI_PMU_STOP_FLAG_RESET) {
+				/* Relase the counter if this is a reset request */
+				pmc->counter_val += perf_event_read_value(pmc->perf_event,
+									  &enabled, &running);
+				pmu_release_perf_event(pmc);
+				clear_bit(pmc_index, kvpmu->used_pmc);
+			}
+		}
+	}
+
 	return 0;
 }
 
@@ -96,14 +297,85 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     unsigned long ctr_mask, unsigned long flag,
 				     unsigned long eidx, uint64_t edata)
 {
-	/* TODO */
-	return 0;
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct perf_event *event;
+	struct perf_event_attr attr;
+	int num_ctrs, ctr_idx;
+	u32 etype = pmu_get_perf_event_type(eidx);
+	u64 config;
+	struct kvm_pmc *pmc;
+
+	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
+	if ((etype == PERF_TYPE_MAX) || ((ctr_base + __fls(ctr_mask)) >= num_ctrs))
+		return -EINVAL;
+
+	if (pmu_is_fw_event(eidx))
+		return -EOPNOTSUPP;
+	/*
+	 * SKIP_MATCH flag indicates the caller is aware of the assigned counter
+	 * for this event. Just do a sanity check if it already marked used.
+	 */
+	if (flag & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
+		if (!test_bit(ctr_base, kvpmu->used_pmc))
+			return -EINVAL;
+		ctr_idx = ctr_base;
+		goto match_done;
+	}
+
+	ctr_idx = pmu_get_pmc_index(kvpmu, eidx, ctr_base, ctr_mask);
+	if (ctr_idx < 0)
+		return -EOPNOTSUPP;
+
+match_done:
+	pmc = &kvpmu->pmc[ctr_idx];
+	pmu_release_perf_event(pmc);
+	pmc->idx = ctr_idx;
+
+	config = pmu_get_perf_event_config(eidx, edata);
+	memset(&attr, 0, sizeof(struct perf_event_attr));
+	attr.type = etype;
+	attr.size = sizeof(attr);
+	attr.pinned = true;
+
+	/*
+	 * It should never reach here if the platform doesn't support sscofpmf extensio
+	 * as mode filtering won't work without it.
+	 */
+	attr.exclude_host = true;
+	attr.exclude_hv = true;
+	attr.exclude_user = flag & SBI_PMU_CFG_FLAG_SET_UINH ? 1 : 0;
+	attr.exclude_kernel = flag & SBI_PMU_CFG_FLAG_SET_SINH ? 1 : 0;
+	attr.config = config;
+	attr.config1 = RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS;
+	if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
+		//TODO: Do we really want to clear the value in hardware counter
+		pmc->counter_val = 0;
+	}
+	/*
+	 * Set the default sample_period for now. The guest specified value
+	 * will be updated in the start call.
+	 */
+	attr.sample_period = pmu_get_sample_period(pmc);
+
+	event = perf_event_create_kernel_counter(&attr, -1, current, NULL, pmc);
+	if (IS_ERR(event)) {
+		pr_err("kvm pmu event creation failed event %pe for eidx %lx\n", event, eidx);
+		return -EOPNOTSUPP;
+	}
+
+	set_bit(ctr_idx, kvpmu->used_pmc);
+	pmc->perf_event = event;
+	if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
+		perf_event_enable(pmc->perf_event);
+
+	return ctr_idx;
 }
 
 int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 {
 	int i = 0, num_hw_ctrs, num_fw_ctrs, hpm_width;
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
 
 	if (!kvpmu)
 		return -EINVAL;
@@ -120,6 +392,7 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 		return -EINVAL;
 	}
 
+	bitmap_zero(kvpmu->used_pmc, RISCV_MAX_COUNTERS);
 	kvpmu->num_hw_ctrs = num_hw_ctrs;
 	kvpmu->num_fw_ctrs = num_fw_ctrs;
 	/*
@@ -132,38 +405,49 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 		/* TIME CSR shouldn't be read from perf interface */
 		if (i == 1)
 			continue;
-		kvpmu->pmc[i].idx = i;
-		kvpmu->pmc[i].vcpu = vcpu;
+		pmc = &kvpmu->pmc[i];
+		pmc->idx = i;
+		pmc->counter_val = 0;
+		pmc->vcpu = vcpu;
 		if (i < kvpmu->num_hw_ctrs) {
 			kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_HW;
 			if (i < 3)
 				/* CY, IR counters */
-				kvpmu->pmc[i].cinfo.width = 63;
+				pmc->cinfo.width = 63;
 			else
-				kvpmu->pmc[i].cinfo.width = hpm_width;
+				pmc->cinfo.width = hpm_width;
 			/*
 			 * The CSR number doesn't have any relation with the logical
 			 * hardware counters. The CSR numbers are encoded sequentially
 			 * to avoid maintaining a map between the virtual counter
 			 * and CSR number.
 			 */
-			kvpmu->pmc[i].cinfo.csr = CSR_CYCLE + i;
+			pmc->cinfo.csr = CSR_CYCLE + i;
 		} else {
-			kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_FW;
-			kvpmu->pmc[i].cinfo.width = BITS_PER_LONG - 1;
+			pmc->cinfo.type = SBI_PMU_CTR_TYPE_FW;
+			pmc->cinfo.width = BITS_PER_LONG - 1;
 		}
 	}
 
 	return 0;
 }
 
-void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
 {
-	/* TODO */
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
+	int i;
+
+	if (!kvpmu)
+		return;
+
+	for_each_set_bit(i, kvpmu->used_pmc, RISCV_MAX_COUNTERS) {
+		pmc = &kvpmu->pmc[i];
+		pmu_release_perf_event(pmc);
+	}
 }
 
-void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
 {
-	/* TODO */
+	kvm_riscv_vcpu_pmu_deinit(vcpu);
 }
-
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
