Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2880DC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9nclMZTCb/gMxsVPuYOeRxmqJbzDVcP/o5yAXX3UNw=; b=BZjutfimh6WpBx
	1Um6N01JJDFuvcbCQ8viYZBKwggprLnjI+OrGTC/vfquD7CTNOpQxjkOeMVa7TZm+bEWfbiGopp28
	u/GHD09Pn/sjG+ffTwAOL5yOs9Em6T4gB4THJkf4uDzInEwdsdPyPbl5CqhxJefjENUX3I/3Vpvht
	Wex7rH/yHZy3cjTGi/p50qgaMHu1q1jwk20PMJo2MhYzfTPz8nlqFmRQ2yib6Lmydkbe5wyKBnaAi
	epG+4zVeHJy/u4O/dKFEgrGoLdV4NzVHdjmaE9GdN4O2nH67GGXKFIT6RzicQbMT978zo1Vo86r/L
	qsGUqqHHwO3bsoHgKR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORq-00000005GGF-0KN2;
	Wed, 29 May 2024 18:54:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORg-00000005G7z-1G1C
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 18:54:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4202ca70289so459415e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 11:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717008876; x=1717613676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+2U8h+2rvtM/KDIv8ZmxGGBqHz1DJ98r4cPzpRskE8=;
        b=Ldq+ClFnl/FAxbV3+arlpEa/zUkB9mX7qXlSqY8Q04gMaTLNT9efh4fFoLXkqwmGca
         gX6R3KlH0q2J8NO1bG+OeIq1nK06ltONVUZ744fkpMy3qZ4yIHVGR5b9g/Q09zHh4dvq
         EKr/IJ46IlLjYH06vMdBXrkqJScCCd2/RAcAsj+spDQBMEgP1GDG66mlNJk7nmgfOkCh
         wQawsvyfpatVFAF13dumZlDH5GsLQCSnvSjpVWSFgE/k/tWEYp8SlcBvTkKAMWDo900n
         KAOgszNpzhrGi5xcFH+/5byv81+YiIR6aHT56hHnWZdLWc6oazUq8ARPdNyPKYbFVgP8
         C7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717008876; x=1717613676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+2U8h+2rvtM/KDIv8ZmxGGBqHz1DJ98r4cPzpRskE8=;
        b=DMpGRpboOICmuHeXYnVr75Aly2PPhgZQGz5SeK4DKAU8zOG6S1OA1WW+/wIiNjccQZ
         kccBsjqlPhmztSZo8Ek/bH6B1ezzKjLAHkhExfywhPeWSBFxjirynMyty3qKijvOFFm9
         c43NEoDIRCEWmx2P3QhTZK//Nokl5jFBA6keJGYAACbxFYpNu0NWdGueSd0/3ueO61y0
         dMagYV3ZrRENseQi+B7thutwh0/rEY6j/Awbclbhk7tiQ4tQ7bdJ0kXAM62Sf8IQvFk/
         /DVT6x+axDTkPICV+V79B5jKsyOy75fqe5f9l9FA/YPfXj9m2cq6fsXU0kwmShXwnl8Y
         9BCg==
X-Forwarded-Encrypted: i=1; AJvYcCU7BqEOibGtTn4gCSoSlopsmWhtplcRLpgwdqGQ1k11zq6Vyx0IMNmAU5S2a0ts6RVDwXrZe3Mx8ncWGDcfu50Y5MyJevsFSvXJY08gBaiD
X-Gm-Message-State: AOJu0YznM5rCJHgMFrwh2iwJebZ8S+wWhyq0bkWIAtvkyOvLAJLVRdUV
	xrc4zUtsSLRG6dup7h6nmUdWD/sOmxDhl0MlElce/xoNuYyl3Lr0NjS/W5dNymQ=
X-Google-Smtp-Source: AGHT+IHyilA5pn7bTk5wG0if56ayFdi//JSBq/3E0JiJr67lveFf/JA8ZYRTkFP5SiaOqO8femclbQ==
X-Received: by 2002:a7b:c391:0:b0:420:1db0:53c1 with SMTP id 5b1f17b1804b1-421279375bamr150315e9.41.1717008876402;
        Wed, 29 May 2024 11:54:36 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.Home ([2a02:c7c:7527:ee00:7446:71c1:a41a:da9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212706a23csm2787885e9.27.2024.05.29.11.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:54:35 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	acme@kernel.org,
	atishp@rivosinc.com,
	beeman@rivosinc.com,
	brauner@kernel.org,
	conor@kernel.org,
	heiko@sntech.de,
	irogers@google.com,
	mingo@redhat.com,
	james.clark@arm.com,
	renyu.zj@linux.alibaba.com,
	jolsa@kernel.org,
	jisheng.teoh@starfivetech.com,
	palmer@dabbelt.com,
	tech-control-transfer-records@lists.riscv.org,
	will@kernel.org,
	kaiwenxue1@gmail.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH RFC 6/6] riscv: perf: Integrate CTR Ext support in riscv_pmu_dev driver
Date: Wed, 29 May 2024 19:53:37 +0100
Message-Id: <20240529185337.182722-7-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529185337.182722-1-rkanwal@rivosinc.com>
References: <20240529185337.182722-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_115444_381577_5FF0D913 
X-CRM114-Status: GOOD (  21.77  )
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

This integrates recently added CTR ext support in riscv_pmu_dev driver
to enable branch stack sampling using PMU events.

This mainly adds CTR enable/disable callbacks in rvpmu_ctr_stop()
and rvpmu_ctr_start() function to start/stop branch recording along
with the event.

PMU overflow handler rvpmu_ovf_handler() is also updated to sample
CTR entries in case of the overflow for the particular event programmed
to records branches. The recorded entries are fed to core perf for
further processing.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 drivers/perf/riscv_pmu_common.c |  3 +-
 drivers/perf/riscv_pmu_dev.c    | 77 +++++++++++++++++++++++++++------
 2 files changed, 65 insertions(+), 15 deletions(-)

diff --git a/drivers/perf/riscv_pmu_common.c b/drivers/perf/riscv_pmu_common.c
index e794675e4944..e1f3a33b479f 100644
--- a/drivers/perf/riscv_pmu_common.c
+++ b/drivers/perf/riscv_pmu_common.c
@@ -326,8 +326,7 @@ static int riscv_pmu_event_init(struct perf_event *event)
 	u64 event_config = 0;
 	uint64_t cmask;
 
-	/* driver does not support branch stack sampling */
-	if (has_branch_stack(event))
+	if (has_branch_stack(event) && !riscv_pmu_ctr_supported(rvpmu))
 		return -EOPNOTSUPP;
 
 	hwc->flags = 0;
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 40ae5fc897a3..1b2c04c35bed 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -675,7 +675,7 @@ static void pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
 {
 	struct riscv_pmu *pmu = to_riscv_pmu(pmu_ctx->pmu);
 
-	/* Call CTR specific Sched hook. */
+	riscv_pmu_ctr_sched_task(pmu_ctx, sched_in);
 }
 
 static int rvpmu_sbi_find_num_ctrs(void)
@@ -935,17 +935,25 @@ static irqreturn_t rvpmu_ovf_handler(int irq, void *dev)
 		hw_evt = &event->hw;
 		riscv_pmu_event_update(event);
 		perf_sample_data_init(&data, 0, hw_evt->last_period);
-		if (riscv_pmu_event_set_period(event)) {
-			/*
-			 * Unlike other ISAs, RISC-V don't have to disable interrupts
-			 * to avoid throttling here. As per the specification, the
-			 * interrupt remains disabled until the OF bit is set.
-			 * Interrupts are enabled again only during the start.
-			 * TODO: We will need to stop the guest counters once
-			 * virtualization support is added.
-			 */
-			perf_event_overflow(event, &data, regs);
+		if (!riscv_pmu_event_set_period(event))
+			continue;
+
+		if (needs_branch_stack(event)) {
+			riscv_pmu_ctr_consume(cpu_hw_evt, event);
+			perf_sample_save_brstack(
+				&data, event,
+				&cpu_hw_evt->branches->branch_stack, NULL);
 		}
+
+		/*
+		 * Unlike other ISAs, RISC-V don't have to disable interrupts
+		 * to avoid throttling here. As per the specification, the
+		 * interrupt remains disabled until the OF bit is set.
+		 * Interrupts are enabled again only during the start.
+		 * TODO: We will need to stop the guest counters once
+		 * virtualization support is added.
+		 */
+		perf_event_overflow(event, &data, regs);
 	}
 
 	rvpmu_start_overflow_mask(pmu, overflowed_ctrs);
@@ -1103,10 +1111,12 @@ static void rvpmu_ctr_start(struct perf_event *event, u64 ival)
 	else
 		rvpmu_sbi_ctr_start(event, ival);
 
-
 	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
 	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
 		rvpmu_set_scounteren((void *)event);
+
+	if (needs_branch_stack(event))
+		riscv_pmu_ctr_enable(event);
 }
 
 static void rvpmu_ctr_stop(struct perf_event *event, unsigned long flag)
@@ -1128,6 +1138,9 @@ static void rvpmu_ctr_stop(struct perf_event *event, unsigned long flag)
 	} else {
 		rvpmu_sbi_ctr_stop(event, flag);
 	}
+
+	if (needs_branch_stack(event))
+		riscv_pmu_ctr_disable(event);
 }
 
 static int rvpmu_find_ctrs(void)
@@ -1161,6 +1174,9 @@ static int rvpmu_find_ctrs(void)
 
 static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
 {
+	if (needs_branch_stack(event) && !riscv_pmu_ctr_valid(event))
+		return -EOPNOTSUPP;
+
 	if (static_branch_likely(&riscv_pmu_cdeleg_available) && !pmu_sbi_is_fw_event(event))
 		return rvpmu_deleg_event_map(event, econfig);
 	else
@@ -1207,6 +1223,8 @@ static int rvpmu_starting_cpu(unsigned int cpu, struct hlist_node *node)
 		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
 	}
 
+	riscv_pmu_ctr_starting_cpu();
+
 	return 0;
 }
 
@@ -1218,6 +1236,7 @@ static int rvpmu_dying_cpu(unsigned int cpu, struct hlist_node *node)
 
 	/* Disable all counters access for user mode now */
 	csr_write(CSR_SCOUNTEREN, 0x0);
+	riscv_pmu_ctr_dying_cpu();
 
 	return 0;
 }
@@ -1331,6 +1350,29 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
 	cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 }
 
+static int branch_records_alloc(struct riscv_pmu *pmu)
+{
+	struct branch_records __percpu *tmp_alloc_ptr;
+	struct branch_records *records;
+	struct cpu_hw_events *events;
+	int cpu;
+
+	if (!riscv_pmu_ctr_supported(pmu))
+		return 0;
+
+	tmp_alloc_ptr = alloc_percpu_gfp(struct branch_records, GFP_KERNEL);
+	if (!tmp_alloc_ptr)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		events = per_cpu_ptr(pmu->hw_events, cpu);
+		records = per_cpu_ptr(tmp_alloc_ptr, cpu);
+		events->branches = records;
+	}
+
+	return 0;
+}
+
 static void rvpmu_event_init(struct perf_event *event)
 {
 	/*
@@ -1490,6 +1532,12 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 		pmu->pmu.attr_groups = riscv_cdeleg_pmu_attr_groups;
 	else
 		pmu->pmu.attr_groups = riscv_sbi_pmu_attr_groups;
+
+	riscv_pmu_ctr_init(pmu);
+	ret = branch_records_alloc(pmu);
+	if (ret)
+		goto out_ctr_finish;
+
 	pmu->cmask = cmask;
 	pmu->ctr_start = rvpmu_ctr_start;
 	pmu->ctr_stop = rvpmu_ctr_stop;
@@ -1506,7 +1554,7 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 
 	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 	if (ret)
-		return ret;
+		goto out_ctr_finish;
 
 	ret = riscv_pm_pmu_register(pmu);
 	if (ret)
@@ -1523,6 +1571,9 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 out_unregister:
 	riscv_pmu_destroy(pmu);
 
+out_ctr_finish:
+	riscv_pmu_ctr_finish(pmu);
+
 out_free:
 	kfree(pmu);
 	return ret;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
