Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C27C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnawY+EH0NQnFAIYKYrUhTdpHJnmphJIbMV9FW6g7OA=; b=P9mYi5y5zjOATF
	BzmBocMYRT4EHfeQCvPUB0ILOYfiAsCUxfqxn3EwqZT62B2+uIck27qwKAwCC7iq+7iaySMtxU/Ic
	7Byo6/HXqG+Uge3OVSF8lkEjum0Hc8QrJbBeYjke7stpjwtRKQfFnGE3LAU2mh1L5MLC8Yt5zc/55
	xBV4Xuz20x1Au4ldl9pO6N2Efok4qG5nxn5T/F9ZWYXYajc6gUtyQileMb9ovdcjaZUeQdD1PavW1
	NZNBgsnWqw5I18bd7QHq/QHCtGtSdb0wRAdleajYs/zWHSUgaPtryr206Sl8wv209SdjJZs1K3lyc
	p59j9+uL8zH0jgrstn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5s1m-00AYwx-OQ; Thu, 15 Dec 2022 17:28:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5s1k-00AYoz-PA
	for linux-riscv@bombadil.infradead.org; Thu, 15 Dec 2022 17:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DolzGJZ4k1W/MT9LsI1bhyuKnszBtHqekaiH9SK1Tyg=; b=p8QKHyLxwy3dViJKW3OQT0/xGO
	wah7EPgSbFAQFvbhY5JGYbLvmk8HCuaotH2IlSvS2JkezsFm4eQ0SvdjxeL+nRYDfEOhsGotJdhi9
	eopX1ZkMR2+ZwTP5zJSK0agARQ/SvcpOQXfKiG/IBRs2xoMyfIOggP/+xoYB8FLJm3jXHNunHIPQ/
	dJDp6xOKxt4AcL2JJYqoa9JRdHfiWinBu6glltRU7ov782TVf8i40GN9q3wbbFRVNBo0bDbhQvwmr
	MmPoowjYUka4T3lSQTqGWYSNx9F49Ly+9+M1fhxL3dpA8E4vQDL4weEa8eR90JO0BxU7k/yzuacAB
	uN9dhCew==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbu-00AtDs-2V
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:01:38 +0000
Received: by mail-pj1-x102d.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so3327649pje.5
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DolzGJZ4k1W/MT9LsI1bhyuKnszBtHqekaiH9SK1Tyg=;
        b=fYYhU/yz/PsFnVvY/oZWXMkqyHqMG2Z2F354DcI+5nf0ncCfTCs8PrfDXqjD/vQkNT
         hpY2Vs2A4jebx52pbA72QOr4svFXXHXHmQTXdCSu3qroMpLzROkWLmjWQBxEWyPouFgz
         fIo4P2yBqeqv/OA4RhjAna13v/igVvCX7kzBx3pV7c4t5aHHaMTS4o0FFR7P10KWOrfD
         twe4tQvHbm3kjWgWbj0fERbIzoX+T3lYE6IZ6fME+BOXHBITV6UabCC7hFBsW7UULlwu
         kRTdNWpu74FfNT1lZdMmnqH55wTiIt1UvVTcRx7g9rPqPr0c8Pb+wCEnIvBIP/eD1Xgn
         /UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DolzGJZ4k1W/MT9LsI1bhyuKnszBtHqekaiH9SK1Tyg=;
        b=ZfUVlnw5+OEsDYDbkGVG1ZCzh5NFBdBRly7RuUwd8Rt64gU+M5eiVKJgFB0HK2qvIg
         mlySH8Bm0tGXVo3CGfvRgUCgY9jfwYOT7ngNAlmVC9/2UtDceAIbsRP3K5j1WzLUsVLw
         w8wbWC0Mwa2YuaRJ8UMhOvUG2bIunwzIGPdKgH98YwM2IzOkJXiGNg6uR1VDT0KHbk65
         eiFA4Ae6InFpETfMxh3SnFt2uNjQgmlvnCEhFMd59GnH9aiICkQxMzhTrdQsoc6sonXw
         ljguPUaUwiX2O1DIqdovBtfhcfvtj9evimPVF0/ANYKQWaDsNA7Q04f1uXedB1VQrdHs
         JuCQ==
X-Gm-Message-State: ANoB5pkCZ34AWare6KwKybN3bcIR0RzGIkrkLvPefy95BCpaChm3ziyb
	7T2716eaymS548LLAfKNWgTo9A==
X-Google-Smtp-Source: AA0mqf6dwRb1jiKJrLleRCD/S0oZPKkH1PjNh45faRbUqj1nX4vJxB6FyWBUqtsz7MHxmezMu1pD9g==
X-Received: by 2002:a17:903:515:b0:189:bcf7:1ec0 with SMTP id jn21-20020a170903051500b00189bcf71ec0mr29399151plb.30.1671123682500;
        Thu, 15 Dec 2022 09:01:22 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001897bfc9800sm4067449pll.53.2022.12.15.09.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 09:01:22 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 10/11] RISC-V: KVM: Implement perf support without sampling
Date: Thu, 15 Dec 2022 09:00:45 -0800
Message-Id: <20221215170046.2010255-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215170046.2010255-1-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_170135_717222_E748DB41 
X-CRM114-Status: GOOD (  27.02  )
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
relies on SBI PMU extension for most the most part while trapping
& emulating the CSRs read for counter access.

This patch doesn't have the event sampling support yet.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 358 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 342 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 53c4163..21c1f0f 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -12,10 +12,163 @@
 #include <linux/perf/riscv_pmu.h>
 #include <asm/csr.h>
 #include <asm/kvm_vcpu_sbi.h>
+#include <asm/bitops.h>
 #include <asm/kvm_vcpu_pmu.h>
 #include <linux/kvm_host.h>
 
 #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
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
+		sample_period = (-pmc->counter_val) & counter_val_mask;
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
+
+	return get_event_type(eidx) == SBI_PMU_EVENT_TYPE_FW;
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
+		return config;
+
+	config = cache_type | (cache_op << 8) | (cache_result << 16);
+
+	return config;
+}
+
+static u64 pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
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
+		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
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
+		    !test_bit(pmc_idx, kvpmu->pmc_in_use)) {
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
 
 static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 			unsigned long *out_val)
@@ -82,7 +235,41 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				 unsigned long ctr_mask, unsigned long flag, uint64_t ival,
 				 struct kvm_vcpu_sbi_ext_data *edata)
 {
-	/* TODO */
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	int i, num_ctrs, pmc_index, sbiret = 0;
+	struct kvm_pmc *pmc;
+
+	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
+	if (ctr_base + __fls(ctr_mask) >= num_ctrs) {
+		sbiret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	/* Start the counters that have been configured and requested by the guest */
+	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
+		pmc_index = i + ctr_base;
+		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
+			continue;
+		pmc = &kvpmu->pmc[pmc_index];
+		if (flag & SBI_PMU_START_FLAG_SET_INIT_VALUE)
+			pmc->counter_val = ival;
+		if (pmc->perf_event) {
+			if (unlikely(pmc->started)) {
+				sbiret = SBI_ERR_ALREADY_STARTED;
+				continue;
+			}
+			perf_event_period(pmc->perf_event, pmu_get_sample_period(pmc));
+			perf_event_enable(pmc->perf_event);
+			pmc->started = true;
+		} else {
+			kvm_debug("Can not start counter due to invalid confiugartion\n");
+			sbiret = SBI_ERR_INVALID_PARAM;
+		}
+	}
+
+out:
+	edata->err_val = sbiret;
+
 	return 0;
 }
 
@@ -90,16 +277,142 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				unsigned long ctr_mask, unsigned long flag,
 				struct kvm_vcpu_sbi_ext_data *edata)
 {
-	/* TODO */
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	int i, num_ctrs, pmc_index, sbiret = 0;
+	u64 enabled, running;
+	struct kvm_pmc *pmc;
+
+	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
+	if ((ctr_base + __fls(ctr_mask)) >= num_ctrs) {
+		sbiret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	/* Stop the counters that have been configured and requested by the guest */
+	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
+		pmc_index = i + ctr_base;
+		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
+			continue;
+		pmc = &kvpmu->pmc[pmc_index];
+		if (pmc->perf_event) {
+			if (pmc->started) {
+				/* Stop counting the counter */
+				perf_event_disable(pmc->perf_event);
+				pmc->started = false;
+			} else
+				sbiret = SBI_ERR_ALREADY_STOPPED;
+
+			if (flag & SBI_PMU_STOP_FLAG_RESET) {
+				/* Relase the counter if this is a reset request */
+				pmc->counter_val += perf_event_read_value(pmc->perf_event,
+									  &enabled, &running);
+				pmu_release_perf_event(pmc);
+				clear_bit(pmc_index, kvpmu->pmc_in_use);
+			}
+		} else {
+			kvm_debug("Can not stop counter due to invalid confiugartion\n");
+			sbiret = SBI_ERR_INVALID_PARAM;
+		}
+	}
+
+out:
+	edata->err_val = sbiret;
+
 	return 0;
 }
 
 int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				     unsigned long ctr_mask, unsigned long flag,
-				     unsigned long eidx, uint64_t edata,
-				     struct kvm_vcpu_sbi_ext_data *extdata)
+				     unsigned long eidx, uint64_t evt_data,
+				     struct kvm_vcpu_sbi_ext_data *ext_data)
 {
-	/* TODO */
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct perf_event *event;
+	struct perf_event_attr attr;
+	int num_ctrs, ctr_idx;
+	u32 etype = pmu_get_perf_event_type(eidx);
+	u64 config;
+	struct kvm_pmc *pmc;
+	int sbiret = 0;
+
+
+	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
+	if (etype == PERF_TYPE_MAX || (ctr_base + __fls(ctr_mask) >= num_ctrs)) {
+		sbiret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	if (pmu_is_fw_event(eidx)) {
+		sbiret = SBI_ERR_NOT_SUPPORTED;
+		goto out;
+	}
+
+	/*
+	 * SKIP_MATCH flag indicates the caller is aware of the assigned counter
+	 * for this event. Just do a sanity check if it already marked used.
+	 */
+	if (flag & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
+		if (!test_bit(ctr_base, kvpmu->pmc_in_use)) {
+			sbiret = SBI_ERR_FAILURE;
+			goto out;
+		}
+		ctr_idx = ctr_base;
+		goto match_done;
+	}
+
+	ctr_idx = pmu_get_pmc_index(kvpmu, eidx, ctr_base, ctr_mask);
+	if (ctr_idx < 0) {
+		sbiret = SBI_ERR_NOT_SUPPORTED;
+		goto out;
+	}
+
+match_done:
+	pmc = &kvpmu->pmc[ctr_idx];
+	pmu_release_perf_event(pmc);
+	pmc->idx = ctr_idx;
+
+	config = pmu_get_perf_event_config(eidx, evt_data);
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
+	attr.exclude_user = !!(flag & SBI_PMU_CFG_FLAG_SET_UINH);
+	attr.exclude_kernel = !!(flag & SBI_PMU_CFG_FLAG_SET_SINH);
+	attr.config = config;
+	attr.config1 = RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS;
+	if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
+		//TODO: Do we really want to clear the value in hardware counter
+		pmc->counter_val = 0;
+	}
+
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
+	set_bit(ctr_idx, kvpmu->pmc_in_use);
+	pmc->perf_event = event;
+	if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
+		perf_event_enable(pmc->perf_event);
+
+	ext_data->out_val = ctr_idx;
+out:
+	ext_data->err_val = sbiret;
+
 	return 0;
 }
 
@@ -119,6 +432,7 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 {
 	int i = 0, num_fw_ctrs, ret, num_hw_ctrs = 0, hpm_width = 0;
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
 
 	ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
 	if (ret < 0)
@@ -134,6 +448,7 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 	else
 		num_fw_ctrs = RISCV_KVM_MAX_FW_CTRS;
 
+	bitmap_zero(kvpmu->pmc_in_use, RISCV_MAX_COUNTERS);
 	kvpmu->num_hw_ctrs = num_hw_ctrs;
 	kvpmu->num_fw_ctrs = num_fw_ctrs;
 	/*
@@ -146,24 +461,26 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 		/* TIME CSR shouldn't be read from perf interface */
 		if (i == 1)
 			continue;
-		kvpmu->pmc[i].idx = i;
+		pmc = &kvpmu->pmc[i];
+		pmc->idx = i;
+		pmc->counter_val = 0;
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
 
@@ -172,13 +489,22 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
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
+	for_each_set_bit(i, kvpmu->pmc_in_use, RISCV_MAX_COUNTERS) {
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
