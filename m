Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFFCC10DCE
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9ob5EymbIakS0bREJ7ZmVUcx3Dm5OzZ++iWDfRh4KE=; b=WShJJm02V7G1QA
	x0ki/JszGADf67z4PZX0BtqNGZ6ZDIAS6vu3BjpjTe/w5wCvYk2Yt0Zil5iRri154cUeShOYLj58C
	kiJgbeX0ZX3IPTXx0dlawJrzBXt9uZ3+nWSp20E7odxHUCQg8KMKP2MOFe4Q+XBBxi0cTgxlFWGpM
	GijNJ2Kv7qOadAt5mQZHWDxA4C81ErvM+/ZO9hoZUcA1spZyexrAbTPlYNcdPI+JlzFppnllvb4fQ
	6psstMnggS+AN9MZaR3HbaO+XqcKJywGTDmyVvNiQhLT9B7kRXJ6AfJDQbVd/xW5Eki0CYLif6NXb
	W+qPZk2CAY2yVZ1Vqlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPc-00649Y-2h;
	Tue, 05 Dec 2023 02:43:52 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPW-0063yq-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:43:49 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6d99c3bcf7cso1337546a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 18:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701744222; x=1702349022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzrxBS9zzAN2X80OdUne9aaJh676n2ABvleQ+If87nA=;
        b=vIoJ0fzcvvXq3wVYTf04tGTdLo5KOSsaW/IOn63IN2jOFLQmbxcl5eYYjjwTWVvqeK
         5L25WDcfGF1eDFzD6pIQObsmX2vYFnN/8UF7yYOpXAt0Shh+S+ED7+xpJBHP8PTQ180z
         PuWqdFaquOcUmYBrkyWKMjBQ9l0WFdDPNoD+x8Ox/rVLFULzEN8sXqq/xilAbfgUHWA/
         tDhr7hCsyaigOLxqFAyjSjUaBcv0rOk+gmaiJtMFHpStfjWau8R6HCDX0ByE83xAPZ82
         f4cuZdaD57LjhWZeLDmFWr/G+rJEkea34VwCtdxiMVwul+KCWTDAxDd0Gy3xEMlOIn3n
         0oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701744222; x=1702349022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzrxBS9zzAN2X80OdUne9aaJh676n2ABvleQ+If87nA=;
        b=pD5MuMFW8Nhvlnhr4D78rjkEvevRjRIFQ6ShDkBN72DgHsiAEQXj3+Q3ZV39wxcUVI
         YB5/ah6MTTCKQw5pMaYjP6MHEHazcn+7V+A/NCWFSd4ji3S5t7RpyAlDBaSn4+KMalVu
         YMeiJR9DjhIp2kSDYVPDf/DkrViyoT1sSPiduvJFonNKJCsmF9SYxi7UdVPjgxTgz4xs
         fZMWEKw0KPGCTvzuIe943jBUfNP2+O3F+7PbRPodYtzNQ4v45f71GnoebP3Y8Gy7YX3J
         d0qxeo+ZKD5MahdO3UodwQiS4YPVLzCvLSCzs5a0N0leDXap0gb4OTffJDavuINxXn5i
         Ty9A==
X-Gm-Message-State: AOJu0YyZgBPR+kTzTbo36v6GfrHxf5OXOVPtWL0n0bFY/6ekBR2Vwgiq
	VAsgpNef/+UlnPb1QB3Vu0SEyg==
X-Google-Smtp-Source: AGHT+IFry2dKeLDD8omgbo3Lus3pH/5pMUu5z/RJqz64Q0fTcqyZNbGo6MKRIzEbt6ZoO59xkd3s1A==
X-Received: by 2002:a05:6830:3b84:b0:6d8:8077:8017 with SMTP id dm4-20020a0568303b8400b006d880778017mr4639035otb.4.1701744222082;
        Mon, 04 Dec 2023 18:43:42 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z17-20020a9d62d1000000b006b9848f8aa7sm2157655otk.45.2023.12.04.18.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:43:41 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 6/9] drivers/perf: riscv: Implement SBI PMU snapshot function
Date: Mon,  4 Dec 2023 18:43:07 -0800
Message-Id: <20231205024310.1593100-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205024310.1593100-1-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_184346_684992_DD4BA85B 
X-CRM114-Status: GOOD (  32.73  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI v2.0 SBI introduced PMU snapshot feature which adds the following
features.

1. Read counter values directly from the shared memory instead of
csr read.
2. Start multiple counters with initial values with one SBI call.

These functionalities optimizes the number of traps to the higher
privilege mode. If the kernel is in VS mode while the hypervisor
deploy trap & emulate method, this would minimize all the hpmcounter
CSR read traps. If the kernel is running in S-mode, the benfits
reduced to CSR latency vs DRAM/cache latency as there is no trap
involved while accessing the hpmcounter CSRs.

In both modes, it does saves the number of ecalls while starting
multiple counter together with an initial values. This is a likely
scenario if multiple counters overflow at the same time.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu.c       |   1 +
 drivers/perf/riscv_pmu_sbi.c   | 203 ++++++++++++++++++++++++++++++---
 include/linux/perf/riscv_pmu.h |   6 +
 3 files changed, 197 insertions(+), 13 deletions(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 0dda70e1ef90..5b57acb770d3 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -412,6 +412,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 		cpuc->n_events = 0;
 		for (i = 0; i < RISCV_MAX_COUNTERS; i++)
 			cpuc->events[i] = NULL;
+		cpuc->snapshot_addr = NULL;
 	}
 	pmu->pmu = (struct pmu) {
 		.event_init	= riscv_pmu_event_init,
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 1c9049e6b574..1b8b6de63b69 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -36,6 +36,9 @@ PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:63");
 
 static bool sbi_v2_available;
+static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
+#define sbi_pmu_snapshot_available() \
+	static_branch_unlikely(&sbi_pmu_snapshot_available)
 
 static struct attribute *riscv_arch_formats_attr[] = {
 	&format_attr_event.attr,
@@ -485,14 +488,101 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	return ret;
 }
 
+static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
+{
+	int cpu;
+	struct cpu_hw_events *cpu_hw_evt;
+
+	for_each_possible_cpu(cpu) {
+		cpu_hw_evt = per_cpu_ptr(pmu->hw_events, cpu);
+		if (!cpu_hw_evt->snapshot_addr)
+			continue;
+		free_page((unsigned long)cpu_hw_evt->snapshot_addr);
+		cpu_hw_evt->snapshot_addr = NULL;
+		cpu_hw_evt->snapshot_addr_phys = 0;
+	}
+}
+
+static int pmu_sbi_snapshot_alloc(struct riscv_pmu *pmu)
+{
+	int cpu;
+	struct page *snapshot_page;
+	struct cpu_hw_events *cpu_hw_evt;
+
+	for_each_possible_cpu(cpu) {
+		cpu_hw_evt = per_cpu_ptr(pmu->hw_events, cpu);
+		if (cpu_hw_evt->snapshot_addr)
+			continue;
+		snapshot_page = alloc_page(GFP_ATOMIC | __GFP_ZERO);
+		if (!snapshot_page) {
+			pmu_sbi_snapshot_free(pmu);
+			return -ENOMEM;
+		}
+		cpu_hw_evt->snapshot_addr = page_to_virt(snapshot_page);
+		cpu_hw_evt->snapshot_addr_phys = page_to_phys(snapshot_page);
+	}
+
+	return 0;
+}
+
+static void pmu_sbi_snapshot_disable(void)
+{
+	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, -1,
+		  -1, 0, 0, 0, 0);
+}
+
+static int pmu_sbi_snapshot_setup(struct riscv_pmu *pmu, int cpu)
+{
+	struct cpu_hw_events *cpu_hw_evt;
+	struct sbiret ret = {0};
+	int rc;
+
+	cpu_hw_evt = per_cpu_ptr(pmu->hw_events, cpu);
+	if (!cpu_hw_evt->snapshot_addr_phys)
+		return -EINVAL;
+
+	if (cpu_hw_evt->snapshot_set_done)
+		return 0;
+
+#if defined(CONFIG_32BIT)
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, cpu_hw_evt->snapshot_addr_phys,
+		       (u64)(cpu_hw_evt->snapshot_addr_phys) >> 32, 0, 0, 0, 0);
+#else
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, cpu_hw_evt->snapshot_addr_phys,
+			0, 0, 0, 0, 0);
+#endif
+	/* Free up the snapshot area memory and fall back to default SBI */
+	if (ret.error) {
+		if (ret.error != SBI_ERR_NOT_SUPPORTED)
+			pr_warn("%s: pmu snapshot setup failed with error %ld\n", __func__,
+				ret.error);
+		rc = sbi_err_map_linux_errno(ret.error);
+		if (rc)
+			return rc;
+	}
+
+	cpu_hw_evt->snapshot_set_done = true;
+
+	return 0;
+}
+
 static u64 pmu_sbi_ctr_read(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 	struct sbiret ret;
 	u64 val = 0;
+	struct riscv_pmu *pmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
+	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
 
+	/* Read the value from the shared memory directly */
+	if (sbi_pmu_snapshot_available()) {
+		val = sdata->ctr_values[idx];
+		goto done;
+	}
+
 	if (pmu_sbi_is_fw_event(event)) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
 				hwc->idx, 0, 0, 0, 0, 0);
@@ -512,6 +602,7 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
 	}
 
+done:
 	return val;
 }
 
@@ -539,6 +630,7 @@ static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
 	struct hw_perf_event *hwc = &event->hw;
 	unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
 
+	/* There is no benefit setting SNAPSHOT FLAG for a single counter */
 #if defined(CONFIG_32BIT)
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
 			1, flag, ival, ival >> 32, 0);
@@ -559,16 +651,29 @@ static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 {
 	struct sbiret ret;
 	struct hw_perf_event *hwc = &event->hw;
+	struct riscv_pmu *pmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
+	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 
 	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
 	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
 		pmu_sbi_reset_scounteren((void *)event);
 
+	if (sbi_pmu_snapshot_available())
+		flag |= SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
+
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, hwc->idx, 1, flag, 0, 0, 0);
-	if (ret.error && (ret.error != SBI_ERR_ALREADY_STOPPED) &&
-		flag != SBI_PMU_STOP_FLAG_RESET)
+	if (!ret.error && sbi_pmu_snapshot_available()) {
+		/* Snapshot is taken relative to the counter idx base. Apply a fixup. */
+		if (hwc->idx > 0) {
+			sdata->ctr_values[hwc->idx] = sdata->ctr_values[0];
+			sdata->ctr_values[0] = 0;
+		}
+	} else if (ret.error && (ret.error != SBI_ERR_ALREADY_STOPPED) &&
+		flag != SBI_PMU_STOP_FLAG_RESET) {
 		pr_err("Stopping counter idx %d failed with error %d\n",
 			hwc->idx, sbi_err_map_linux_errno(ret.error));
+	}
 }
 
 static int pmu_sbi_find_num_ctrs(void)
@@ -626,10 +731,14 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 {
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
+	unsigned long flag = 0;
+
+	if (sbi_pmu_snapshot_available())
+		flag = SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
 
 	/* No need to check the error here as we can't do anything about the error */
 	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0,
-		  cpu_hw_evt->used_hw_ctrs[0], 0, 0, 0, 0);
+		  cpu_hw_evt->used_hw_ctrs[0], flag, 0, 0, 0);
 }
 
 /*
@@ -638,11 +747,10 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
  * while the overflowed counters need to be started with updated initialization
  * value.
  */
-static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
-					       unsigned long ctr_ovf_mask)
+static noinline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
+						   unsigned long ctr_ovf_mask)
 {
 	int idx = 0;
-	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 	struct perf_event *event;
 	unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
 	unsigned long ctr_start_mask = 0;
@@ -677,6 +785,49 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 	}
 }
 
+static noinline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_evt,
+						   unsigned long ctr_ovf_mask)
+{
+	int idx = 0;
+	struct perf_event *event;
+	unsigned long flag = SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT;
+	uint64_t max_period;
+	struct hw_perf_event *hwc;
+	u64 init_val = 0;
+	unsigned long ctr_start_mask = 0;
+	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
+
+	for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
+		if (ctr_ovf_mask & (1 << idx)) {
+			event = cpu_hw_evt->events[idx];
+			hwc = &event->hw;
+			max_period = riscv_pmu_ctr_get_width_mask(event);
+			init_val = local64_read(&hwc->prev_count) & max_period;
+			sdata->ctr_values[idx] = init_val;
+		}
+		/* We donot need to update the non-overflow counters the previous
+		 * value should have been there already.
+		 */
+	}
+
+	ctr_start_mask = cpu_hw_evt->used_hw_ctrs[0];
+
+	/* Start all the counters in a single shot */
+	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, 0, ctr_start_mask,
+		  flag, 0, 0, 0);
+}
+
+static void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
+					unsigned long ctr_ovf_mask)
+{
+	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
+
+	if (sbi_pmu_snapshot_available())
+		pmu_sbi_start_ovf_ctrs_snapshot(cpu_hw_evt, ctr_ovf_mask);
+	else
+		pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
+}
+
 static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 {
 	struct perf_sample_data data;
@@ -690,6 +841,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	unsigned long overflowed_ctrs = 0;
 	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
+	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 
 	if (WARN_ON_ONCE(!cpu_hw_evt))
 		return IRQ_NONE;
@@ -711,8 +863,10 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	pmu_sbi_stop_hw_ctrs(pmu);
 
 	/* Overflow status register should only be read after counter are stopped */
-	ALT_SBI_PMU_OVERFLOW(overflow);
-
+	if (sbi_pmu_snapshot_available())
+		overflow = sdata->ctr_overflow_mask;
+	else
+		ALT_SBI_PMU_OVERFLOW(overflow);
 	/*
 	 * Overflow interrupt pending bit should only be cleared after stopping
 	 * all the counters to avoid any race condition.
@@ -774,6 +928,7 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
+	int ret = 0;
 
 	/*
 	 * We keep enabling userspace access to CYCLE, TIME and INSTRET via the
@@ -794,7 +949,10 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
 	}
 
-	return 0;
+	if (sbi_pmu_snapshot_available())
+		ret = pmu_sbi_snapshot_setup(pmu, cpu);
+
+	return ret;
 }
 
 static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
@@ -807,6 +965,9 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 	/* Disable all counters access for user mode now */
 	csr_write(CSR_SCOUNTEREN, 0x0);
 
+	if (sbi_pmu_snapshot_available())
+		pmu_sbi_snapshot_disable();
+
 	return 0;
 }
 
@@ -1076,10 +1237,6 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	pmu->event_unmapped = pmu_sbi_event_unmapped;
 	pmu->csr_index = pmu_sbi_csr_index;
 
-	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
-	if (ret)
-		return ret;
-
 	ret = riscv_pm_pmu_register(pmu);
 	if (ret)
 		goto out_unregister;
@@ -1088,8 +1245,28 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_unregister;
 
+	/* SBI PMU Snasphot is only available in SBI v2.0 */
+	if (sbi_v2_available) {
+		ret = pmu_sbi_snapshot_alloc(pmu);
+		if (ret)
+			goto out_unregister;
+		ret = pmu_sbi_snapshot_setup(pmu, smp_processor_id());
+		if (!ret) {
+			pr_info("SBI PMU snapshot is available to optimize the PMU traps\n");
+			/* We enable it once here for the boot cpu. If snapshot shmem fails during
+			 * cpu hotplug on, it should bail out.
+			 */
+			static_branch_enable(&sbi_pmu_snapshot_available);
+		}
+		/* Snapshot is an optional feature. Continue if not available */
+	}
+
 	register_sysctl("kernel", sbi_pmu_sysctl_table);
 
+	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
+	if (ret)
+		return ret;
+
 	return 0;
 
 out_unregister:
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 43282e22ebe1..c3fa90970042 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -39,6 +39,12 @@ struct cpu_hw_events {
 	DECLARE_BITMAP(used_hw_ctrs, RISCV_MAX_COUNTERS);
 	/* currently enabled firmware counters */
 	DECLARE_BITMAP(used_fw_ctrs, RISCV_MAX_COUNTERS);
+	/* The virtual address of the shared memory where counter snapshot will be taken */
+	void *snapshot_addr;
+	/* The physical address of the shared memory where counter snapshot will be taken */
+	phys_addr_t snapshot_addr_phys;
+	/* Boolean flag to indicate setup is already done */
+	bool snapshot_set_done;
 };
 
 struct riscv_pmu {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
