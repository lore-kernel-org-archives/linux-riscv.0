Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DD6C636D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8ApqwLiW8wI/5M5c61y5wREeZv3xr5zJK+gqdLCfjM=; b=PmAIC28d1dA5v0
	5Hry0Ca1EadXCSYR4pvnxOWJX1JdXg0RPAD178ixXaD8W8MGSlgkaOuyC9G+p5BQZg6kk35xG81+T
	5UoZskb/ypSUW9b2OZqlHrQOVl2PlryLa7EzWFpqv/NJjAFCZ4H/Ol47AuHhMShpREz3GQBqYvC5L
	r0Mbt7i07GhWBB4Jmzi+SCpkqhraQve5cke5Ps7KqNiK6KyQCS+E8erS75p9/ZVvK+4xmjqcF+3Vy
	7GrFjxo0J1YPirTmGzU+s2tsxKpIw6G4fZnOXFD+VN0wvGSYmgm7SfmjApe4egYtP+h6CVoVr24Bs
	OrCnEFOEkppssPrQ6uUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN45-00Dv6E-0h; Thu, 02 Feb 2023 00:02:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN41-00Dv1u-TS
	for linux-riscv@bombadil.infradead.org; Thu, 02 Feb 2023 00:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rolx/xnrEoysE3WFaLOQzjQ8dm7V2jAaNE+aeTsIjHc=; b=pANrE5LqUpE/tMBgS8zQIx/841
	m+YasP/ipuZJowPloUEPhiNrId6x7s9iEHLsKYfEmv8UrHsiX+HvsfppdMUvkgVyZH6IuDYTH9rf7
	S8jSXyYMD9dEHt+lXiBEbLJvtmOH9FAJWi1d8sao7Ya1tcs3CYy1UBob8/53SX5fJ8g/HbDl7Ow3I
	wWEdlGaxHWm0lgbdeb6gJO2hVkR4eVWpY5xyXLbc3qDensscXLXo+AEW9nBSW1ri+9mqWvh0chntj
	fLrPeLbNDfASXS1dTBM2pEn0Gz/wRFnoFfyqSiC1OriLPMuJG+QAZ9SyPCFBe//pHgQafFACdZLh6
	6MqVDM2Q==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pNMHM-004wiv-0q
	for linux-riscv@lists.infradead.org;
	Wed, 01 Feb 2023 23:12:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id v23so106121plo.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rolx/xnrEoysE3WFaLOQzjQ8dm7V2jAaNE+aeTsIjHc=;
        b=cpQIVecDU1bZfw/2cfTqfbOBsbFS7u3svugbrH/bvJqP80BRTw+UFiRKiQW5U47Wgb
         HqE9qBPcgFUG8ksuVfkICQFkynXZIVvzcOrPkhuklvN0XBTjif9DV42huDX1ro4WPLGh
         AyMH0xo8JRQBBaRwltB8rHxO7X1Pssx523AIKP2vv82pf1+dpgUWV3sCy8AGCRBewj+Y
         3SmCNm/ZV8R6NhcaB1G847MK8O639dMpSJ+Cb9IPB2VotN1sHETCJvNY7yXe/jbgmu63
         Qqky/qRnTEa7Ob/ZzMIbk2DgjgdgHpk1/sGhiIWA2HpGIaogTGhyy1qWMC7xlpmVLupq
         X+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rolx/xnrEoysE3WFaLOQzjQ8dm7V2jAaNE+aeTsIjHc=;
        b=KMTmGo9lLy2ovPW05CpPTsPPTYDgVIMINRFxn2G9XJX9MeS29aOwzL/MCcENJGxjnf
         H1mfE96+NRJMNs/3I+g+ylzKCVhMr9ERcyghNb7LiJxF0aqK+lVZ8A8oxadr0FwZN7VQ
         9aFvx2udNbb54F84IIQqwhoZO90MYMtaf2Dyf8ozE75rNT8e4GpNdhnfJCY9owihdGmT
         KiLa1rPi8vzSQuv8BoPI75NzzhRpknEdiDxj3H2wrKjiUeK3PVsVnwCaESk2XWuINZO4
         kQQ1orNyC3Xs1rFjqydKPZ2vVxxgz4f+LG5nnGEIGmZIMyX1S9s6fh0KQgz6FFzJmnkC
         scXg==
X-Gm-Message-State: AO0yUKUFwd3okxPPDgK+rMZ17RGbCYTsgTpIUqRNGMrkfBkvV/tjatFi
	RMVqlHw1o+bSRH+mDraYFWSO+Q==
X-Google-Smtp-Source: AK7set/rfvZ1frL49zCdfP2fy56w4d4ZV/1PQNLZ7rsASnCgpHZ2F/U7jh/fFNV7fvvA53Jr93PyNw==
X-Received: by 2002:a17:90b:4f8d:b0:22b:e5c3:abe6 with SMTP id qe13-20020a17090b4f8d00b0022be5c3abe6mr3831166pjb.4.1675293184925;
        Wed, 01 Feb 2023 15:13:04 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:13:04 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 13/14] RISC-V: KVM: Support firmware events
Date: Wed,  1 Feb 2023 15:12:49 -0800
Message-Id: <20230201231250.3806412-14-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_231236_426186_9C2B25A0 
X-CRM114-Status: GOOD (  27.34  )
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

SBI PMU extension defines a set of firmware events which can provide
useful information to guests about the number of SBI calls. As
hypervisor implements the SBI PMU extension, these firmware events
correspond to ecall invocations between VS->HS mode. All other firmware
events will always report zero if monitored as KVM doesn't implement them.

This patch adds all the infrastructure required to support firmware
events.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  17 +++
 arch/riscv/kvm/vcpu_pmu.c             | 142 ++++++++++++++++++++------
 2 files changed, 125 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 2afaaf5..a1d8b7d 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -22,6 +22,14 @@
 
 #define RISCV_MAX_COUNTERS      64
 
+struct kvm_fw_event {
+	/* Current value of the event */
+	unsigned long value;
+
+	/* Event monitoring status */
+	bool started;
+};
+
 /* Per virtual pmu counter data */
 struct kvm_pmc {
 	u8 idx;
@@ -30,11 +38,14 @@ struct kvm_pmc {
 	union sbi_pmu_ctr_info cinfo;
 	/* Event monitoring status */
 	bool started;
+	/* Monitoring event ID */
+	unsigned long event_idx;
 };
 
 /* PMU data structure per vcpu */
 struct kvm_pmu {
 	struct kvm_pmc pmc[RISCV_MAX_COUNTERS];
+	struct kvm_fw_event fw_event[RISCV_KVM_MAX_FW_CTRS];
 	/* Number of the virtual firmware counters available */
 	int num_fw_ctrs;
 	/* Number of the virtual hardware counters available */
@@ -57,6 +68,7 @@ struct kvm_pmu {
 { .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
 #endif
 
+int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid);
 int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
 				unsigned long *val, unsigned long new_val,
 				unsigned long wr_mask);
@@ -87,6 +99,11 @@ struct kvm_pmu {
 { .base = 0,      .count = 0, .func = NULL },
 
 static inline void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu) {}
+static inline int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid)
+{
+	return 0;
+}
+
 static inline void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu) {}
 static inline void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu) {}
 #endif /* CONFIG_RISCV_PMU_SBI */
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 473ad80..dd16e60 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -202,12 +202,15 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 	struct kvm_pmc *pmc;
 	u64 enabled, running;
+	int fevent_code;
 
 	pmc = &kvpmu->pmc[cidx];
-	if (!pmc->perf_event)
-		return -EINVAL;
 
-	pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
+	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
+		fevent_code = get_event_code(pmc->event_idx);
+		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
+	} else if (pmc->perf_event)
+		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
 	*out_val = pmc->counter_val;
 
 	return 0;
@@ -223,6 +226,55 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
 	return 0;
 }
 
+static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, int ctr_idx,
+				     struct perf_event_attr *attr, unsigned long flag,
+				     unsigned long eidx, unsigned long evtdata)
+{
+	struct perf_event *event;
+
+	kvm_pmu_release_perf_event(pmc);
+	pmc->idx = ctr_idx;
+
+	attr->config = kvm_pmu_get_perf_event_config(eidx, evtdata);
+	if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
+		//TODO: Do we really want to clear the value in hardware counter
+		pmc->counter_val = 0;
+	}
+
+	/*
+	 * Set the default sample_period for now. The guest specified value
+	 * will be updated in the start call.
+	 */
+	attr->sample_period = kvm_pmu_get_sample_period(pmc);
+
+	event = perf_event_create_kernel_counter(attr, -1, current, NULL, pmc);
+	if (IS_ERR(event)) {
+		pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
+		return PTR_ERR(event);
+	}
+
+	pmc->perf_event = event;
+	if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
+		perf_event_enable(pmc->perf_event);
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_fw_event *fevent;
+
+	if (!kvpmu || fid >= SBI_PMU_FW_MAX)
+		return -EINVAL;
+
+	fevent = &kvpmu->fw_event[fid];
+	if (fevent->started)
+		fevent->value++;
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
 				unsigned long *val, unsigned long new_val,
 				unsigned long wr_mask)
@@ -289,6 +341,7 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 	int i, pmc_index, sbiret = 0;
 	struct kvm_pmc *pmc;
+	int fevent_code;
 
 	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
 		sbiret = SBI_ERR_INVALID_PARAM;
@@ -303,7 +356,22 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		pmc = &kvpmu->pmc[pmc_index];
 		if (flag & SBI_PMU_START_FLAG_SET_INIT_VALUE)
 			pmc->counter_val = ival;
-		if (pmc->perf_event) {
+		if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
+			fevent_code = get_event_code(pmc->event_idx);
+			if (fevent_code >= SBI_PMU_FW_MAX) {
+				sbiret = SBI_ERR_INVALID_PARAM;
+				goto out;
+			}
+
+			/* Check if the counter was already started for some reason */
+			if (kvpmu->fw_event[fevent_code].started) {
+				sbiret = SBI_ERR_ALREADY_STARTED;
+				continue;
+			}
+
+			kvpmu->fw_event[fevent_code].started = true;
+			kvpmu->fw_event[fevent_code].value = pmc->counter_val;
+		} else if (pmc->perf_event) {
 			if (unlikely(pmc->started)) {
 				sbiret = SBI_ERR_ALREADY_STARTED;
 				continue;
@@ -330,6 +398,7 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 	int i, pmc_index, sbiret = 0;
 	u64 enabled, running;
 	struct kvm_pmc *pmc;
+	int fevent_code;
 
 	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
 		sbiret = SBI_ERR_INVALID_PARAM;
@@ -342,7 +411,18 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
 			continue;
 		pmc = &kvpmu->pmc[pmc_index];
-		if (pmc->perf_event) {
+		if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
+			fevent_code = get_event_code(pmc->event_idx);
+			if (fevent_code >= SBI_PMU_FW_MAX) {
+				sbiret = SBI_ERR_INVALID_PARAM;
+				goto out;
+			}
+
+			if (!kvpmu->fw_event[fevent_code].started)
+				sbiret = SBI_ERR_ALREADY_STOPPED;
+
+			kvpmu->fw_event[fevent_code].started = false;
+		} else if (pmc->perf_event) {
 			if (pmc->started) {
 				/* Stop counting the counter */
 				perf_event_disable(pmc->perf_event);
@@ -355,11 +435,14 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				pmc->counter_val += perf_event_read_value(pmc->perf_event,
 									  &enabled, &running);
 				kvm_pmu_release_perf_event(pmc);
-				clear_bit(pmc_index, kvpmu->pmc_in_use);
 			}
 		} else {
 			sbiret = SBI_ERR_INVALID_PARAM;
 		}
+		if (flag & SBI_PMU_STOP_FLAG_RESET) {
+			pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
+			clear_bit(pmc_index, kvpmu->pmc_in_use);
+		}
 	}
 
 out:
@@ -373,12 +456,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     unsigned long eidx, uint64_t evtdata,
 				     struct kvm_vcpu_sbi_return *retdata)
 {
-	int ctr_idx, sbiret = 0;
-	u64 config;
+	int ctr_idx, ret, sbiret = 0;
+	bool is_fevent;
+	unsigned long event_code;
 	u32 etype = kvm_pmu_get_perf_event_type(eidx);
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
-	struct perf_event *event;
-	struct kvm_pmc *pmc;
+	struct kvm_pmc *pmc = NULL;
 	struct perf_event_attr attr = {
 		.type = etype,
 		.size = sizeof(struct perf_event_attr),
@@ -399,7 +482,9 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 		goto out;
 	}
 
-	if (kvm_pmu_is_fw_event(eidx)) {
+	event_code = get_event_code(eidx);
+	is_fevent = kvm_pmu_is_fw_event(eidx);
+	if (is_fevent && event_code >= SBI_PMU_FW_MAX) {
 		sbiret = SBI_ERR_NOT_SUPPORTED;
 		goto out;
 	}
@@ -424,33 +509,18 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 	}
 
 	pmc = &kvpmu->pmc[ctr_idx];
-	kvm_pmu_release_perf_event(pmc);
-	pmc->idx = ctr_idx;
-
-	config = kvm_pmu_get_perf_event_config(eidx, evtdata);
-	attr.config = config;
-	if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
-		//TODO: Do we really want to clear the value in hardware counter
-		pmc->counter_val = 0;
-	}
-
-	/*
-	 * Set the default sample_period for now. The guest specified value
-	 * will be updated in the start call.
-	 */
-	attr.sample_period = kvm_pmu_get_sample_period(pmc);
-
-	event = perf_event_create_kernel_counter(&attr, -1, current, NULL, pmc);
-	if (IS_ERR(event)) {
-		pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
-		return PTR_ERR(event);
+	if (is_fevent) {
+		if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
+			kvpmu->fw_event[event_code].started = true;
+	} else {
+		ret = kvm_pmu_create_perf_event(pmc, ctr_idx, &attr, flag, eidx, evtdata);
+		if (ret)
+			return ret;
 	}
 
 	set_bit(ctr_idx, kvpmu->pmc_in_use);
-	pmc->perf_event = event;
-	if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
-		perf_event_enable(pmc->perf_event);
 
+	pmc->event_idx = eidx;
 	retdata->out_val = ctr_idx;
 out:
 	retdata->err_val = sbiret;
@@ -494,6 +564,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 	 */
 	kvpmu->num_hw_ctrs = num_hw_ctrs;
 	kvpmu->num_fw_ctrs = RISCV_KVM_MAX_FW_CTRS;
+	memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
 
 	/*
 	 * There is no correlation between the logical hardware counter and virtual counters.
@@ -507,6 +578,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 			continue;
 		pmc = &kvpmu->pmc[i];
 		pmc->idx = i;
+		pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
 		if (i < kvpmu->num_hw_ctrs) {
 			pmc->cinfo.type = SBI_PMU_CTR_TYPE_HW;
 			if (i < 3)
@@ -543,8 +615,10 @@ void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
 		pmc = &kvpmu->pmc[i];
 		pmc->counter_val = 0;
 		kvm_pmu_release_perf_event(pmc);
+		pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
 	}
 	bitmap_zero(kvpmu->pmc_in_use, RISCV_MAX_COUNTERS);
+	memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
 }
 
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
