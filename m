Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D251CC02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 23:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zL7uK8c4DKVAGKe3hzEVME7EBdjChnsyNcYpBaP3rBY=; b=LfY+uBEfRZPB+r
	4JK1NSZcu3Oo3QNFB/M2WoMyUnzGyDcKlLMbHbMrROke9wBBSM+PYyoVln1uoXtQ+E/GuA9B8qA9Z
	y8P1Wksm9tCuyOEOlcR2+B+80C3ZlOYdLb3OWX7NcvqGoNL3XDc4L04pvRIiQvaDAMmlrVCfe5nCh
	NHrBov+PZSa0+iwfEMpOT4TEAUbTJUiKrn3LFkvpy6oJcuxSpwsycVEDiVjrsSQT6nohOjCWtXB+g
	CE2eKIqGHZYWpF/de2vOAd98mFofQz6wtWsZGpQTIncKWbhESs9ju1UajN3wI3H6fCEpdtTy+iQ/E
	HJHvkEfXrXLYlwYF1M1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0Y-0000000GJp2-11d2;
	Thu, 16 Jan 2025 23:10:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0U-0000000GJig-1Vlb
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 23:10:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436249df846so9653495e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 15:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737069033; x=1737673833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hcwn1RBtRoJipu7fOBlFbI2SRrDtGNtcTvKQWm9rBOc=;
        b=doqiTKZT/xLrpBLEJp9ceg0g1dOZN0tFByUO6isvggQk0ml+PczKuPS5y+5uhKlAm+
         DJdeUJlDSMjCxe6az/FdGvKYeiSsA9pojkhXyMch6sNcJrXmnJMUFbJsdKcuyJGCP+nF
         wNMXtWdAipIRHQOTFRzhu906B3XtX6PyPHsEhQ5i/ZdMSYSKRyq87Km0cosYZ2ax+wcL
         0mqwcbVcKjctcri65eXYMe5EfJQmcyP/C3oKbw14u9v2iGELmfu5nzh0bWfnVYW1gytD
         42zWhUahUYbmoteRjOR8cuaDbQ4QtZ+Wmwt5lJbLaqpLzzARIAHIML5PU8edzGKlq+ME
         is8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737069033; x=1737673833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hcwn1RBtRoJipu7fOBlFbI2SRrDtGNtcTvKQWm9rBOc=;
        b=kZmBfRIZev0nsoY1G7TM2C+MpfBDS0uqbSOrlnX/EG73qnopTKD4QG1wpfraZZsXsc
         1tDJxbWOMe2Gdzayno5dR7+npWyHKKilpD/MT+1zlFTvIVtO57ievhfxuDDC1YLyDSq5
         Pp4P28qnDJbXB4vpAD03pLGoeyS99pNGlio/Oh6aNGRP2yc7P/74J43D2ikEhw0GsprT
         KAoPS2xx2tEryQXhxyh43BAoa+swsmk6sQq/IX7B2NH/+qUFLXsk4V4Yj9L9yIh4RY2G
         Is9lfo9W2gUDkbz9mD5/ZPhp3fAqg3MqRxWRxninOrkotnMbHMGRuhxEpdzNo6DDdX0d
         XYjA==
X-Forwarded-Encrypted: i=1; AJvYcCXi5qT/NvZ/3co0IgcwQur60RJcVqZoV670e/JgjBmV/LqZ906+BhcVocKJFNF4sqo+u36K1caydzYtFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnWAIHm1hiKWV3QqYUXEkZD+AcGeA4bntrkE6s+X4hrfvnEuky
	wC21H0PMlbMbJIJbe4jmfeC/NzIEeDFy5rr0JJf8/QsBS7VYPY7dbuPBpfzISpk=
X-Gm-Gg: ASbGncsZ1KeAch9htGUD2/t3+6IJNPjm0tBKKAmaI3rtIXhM7tc1NI/tRUnbbZgQRf5
	C68YNN8dUS5E9oiiFBe6dA5CgB+jabSIBS81RTrkxC++7HYcwzIjdQNMPlqo7VzBZf6F3X6uNf5
	wDoYbgNpNwP6lag+swVAS/Fl2lHbTWklU/n/42o8phwe91KpfBF+n/YTXecwq1yQKlX1js1oLK0
	v8Ya4WzA3BFpzSuPbEo4F8QSQ9TVZ605iv23HJav7Zf6aqOgxcNjdZIxJKwkqHGLiuHodVftujM
	k77byXOixmmTUaJM
X-Google-Smtp-Source: AGHT+IGhZmz9Itp7KaTHT92wABYL6U7X2X4dHUE4Or0Kr1OPRGRfA1au2n+XsimRBSL8IAL2MNW8AQ==
X-Received: by 2002:a05:600c:3d06:b0:434:eb73:b0c0 with SMTP id 5b1f17b1804b1-438913c7e31mr4321905e9.5.1737069032813;
        Thu, 16 Jan 2025 15:10:32 -0800 (PST)
Received: from rkanwal-XPS-15-9520.uk.rivosinc.com ([2a02:c7c:75ac:6300:b3f2:3a24:1767:7db0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322b337sm974991f8f.59.2025.01.16.15.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:10:32 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-perf-users@vger.kernel.org,
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
	will@kernel.org,
	kaiwenxue1@gmail.com,
	vincent.chen@sifive.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH v2 5/7] riscv: pmu: Add infrastructure for Control Transfer Record
Date: Thu, 16 Jan 2025 23:09:53 +0000
Message-Id: <20250116230955.867152-6-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116230955.867152-1-rkanwal@rivosinc.com>
References: <20250116230955.867152-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_151034_398798_C9DAB175 
X-CRM114-Status: GOOD (  18.26  )
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

To support Control Transfer Records (CTR) extension, we need to extend the
riscv_pmu framework with some basic infrastructure for branch stack sampling.
Subsequent patches will use this to add support for CTR in the riscv_pmu_dev
driver.

With CTR, the branches are stored into a hardware FIFO, which will be sampled
by software when perf events overflow. A task may be context-switched between
overflows, and to avoid leaking samples we need to clear the last task's
records when a task is context-switched in. To do this we will be using the
pmu::sched_task() callback added in this patch.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 drivers/perf/riscv_pmu_common.c | 20 ++++++++++++++++++++
 drivers/perf/riscv_pmu_dev.c    | 17 +++++++++++++++++
 drivers/perf/riscv_pmu_legacy.c |  2 ++
 include/linux/perf/riscv_pmu.h  | 18 ++++++++++++++++++
 4 files changed, 57 insertions(+)

diff --git a/drivers/perf/riscv_pmu_common.c b/drivers/perf/riscv_pmu_common.c
index 7644147d50b4..c4c4b5d6bed0 100644
--- a/drivers/perf/riscv_pmu_common.c
+++ b/drivers/perf/riscv_pmu_common.c
@@ -157,6 +157,19 @@ u64 riscv_pmu_ctr_get_width_mask(struct perf_event *event)
 	return GENMASK_ULL(cwidth, 0);
 }
 
+static void riscv_pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
+				 bool sched_in)
+{
+	struct riscv_pmu *pmu;
+
+	if (!pmu_ctx)
+		return;
+
+	pmu = to_riscv_pmu(pmu_ctx->pmu);
+	if (pmu->sched_task)
+		pmu->sched_task(pmu_ctx, sched_in);
+}
+
 u64 riscv_pmu_event_update(struct perf_event *event)
 {
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
@@ -269,6 +282,8 @@ static int riscv_pmu_add(struct perf_event *event, int flags)
 	cpuc->events[idx] = event;
 	cpuc->n_events++;
 	hwc->state = PERF_HES_UPTODATE | PERF_HES_STOPPED;
+	if (rvpmu->ctr_add)
+		rvpmu->ctr_add(event, flags);
 	if (flags & PERF_EF_START)
 		riscv_pmu_start(event, PERF_EF_RELOAD);
 
@@ -286,6 +301,9 @@ static void riscv_pmu_del(struct perf_event *event, int flags)
 
 	riscv_pmu_stop(event, PERF_EF_UPDATE);
 	cpuc->events[hwc->idx] = NULL;
+	if (rvpmu->ctr_del)
+		rvpmu->ctr_del(event, flags);
+
 	/* The firmware need to reset the counter mapping */
 	if (rvpmu->ctr_stop)
 		rvpmu->ctr_stop(event, RISCV_PMU_STOP_FLAG_RESET);
@@ -402,6 +420,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 	for_each_possible_cpu(cpuid) {
 		cpuc = per_cpu_ptr(pmu->hw_events, cpuid);
 		cpuc->n_events = 0;
+		cpuc->ctr_users = 0;
 		for (i = 0; i < RISCV_MAX_COUNTERS; i++)
 			cpuc->events[i] = NULL;
 		cpuc->snapshot_addr = NULL;
@@ -416,6 +435,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 		.start		= riscv_pmu_start,
 		.stop		= riscv_pmu_stop,
 		.read		= riscv_pmu_read,
+		.sched_task	= riscv_pmu_sched_task,
 	};
 
 	return pmu;
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index d28d60abaaf2..b9b257607b76 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -1027,6 +1027,12 @@ static void rvpmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 	}
 }
 
+static void pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
+			   bool sched_in)
+{
+	/* Call CTR specific Sched hook. */
+}
+
 static int rvpmu_sbi_find_num_ctrs(void)
 {
 	struct sbiret ret;
@@ -1569,6 +1575,14 @@ static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
 	return -ENOENT;
 }
 
+static void rvpmu_ctr_add(struct perf_event *event, int flags)
+{
+}
+
+static void rvpmu_ctr_del(struct perf_event *event, int flags)
+{
+}
+
 static void rvpmu_ctr_start(struct perf_event *event, u64 ival)
 {
 	struct hw_perf_event *hwc = &event->hw;
@@ -1984,6 +1998,8 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 	else
 		pmu->pmu.attr_groups = riscv_sbi_pmu_attr_groups;
 	pmu->cmask = cmask;
+	pmu->ctr_add = rvpmu_ctr_add;
+	pmu->ctr_del = rvpmu_ctr_del;
 	pmu->ctr_start = rvpmu_ctr_start;
 	pmu->ctr_stop = rvpmu_ctr_stop;
 	pmu->event_map = rvpmu_event_map;
@@ -1995,6 +2011,7 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 	pmu->event_mapped = rvpmu_event_mapped;
 	pmu->event_unmapped = rvpmu_event_unmapped;
 	pmu->csr_index = rvpmu_csr_index;
+	pmu->sched_task = pmu_sched_task;
 
 	ret = riscv_pm_pmu_register(pmu);
 	if (ret)
diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 93c8e0fdb589..bee6742d35fa 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -115,6 +115,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 		BIT(RISCV_PMU_LEGACY_INSTRET);
 	pmu->ctr_start = pmu_legacy_ctr_start;
 	pmu->ctr_stop = NULL;
+	pmu->ctr_add = NULL;
+	pmu->ctr_del = NULL;
 	pmu->event_map = pmu_legacy_event_map;
 	pmu->ctr_get_idx = pmu_legacy_ctr_get_idx;
 	pmu->ctr_get_width = pmu_legacy_ctr_get_width;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index e58f83811988..883781f12ae0 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -46,6 +46,13 @@
 	},								\
 }
 
+#define MAX_BRANCH_RECORDS 256
+
+struct branch_records {
+	struct perf_branch_stack branch_stack;
+	struct perf_branch_entry branch_entries[MAX_BRANCH_RECORDS];
+};
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;
@@ -65,6 +72,12 @@ struct cpu_hw_events {
 	bool snapshot_set_done;
 	/* A shadow copy of the counter values to avoid clobbering during multiple SBI calls */
 	u64 snapshot_cval_shcopy[RISCV_MAX_COUNTERS];
+
+	/* Saved branch records. */
+	struct branch_records *branches;
+
+	/* Active events requesting branch records */
+	int ctr_users;
 };
 
 struct riscv_pmu {
@@ -78,6 +91,8 @@ struct riscv_pmu {
 	int		(*ctr_get_idx)(struct perf_event *event);
 	int		(*ctr_get_width)(int idx);
 	void		(*ctr_clear_idx)(struct perf_event *event);
+	void		(*ctr_add)(struct perf_event *event, int flags);
+	void		(*ctr_del)(struct perf_event *event, int flags);
 	void		(*ctr_start)(struct perf_event *event, u64 init_val);
 	void		(*ctr_stop)(struct perf_event *event, unsigned long flag);
 	int		(*event_map)(struct perf_event *event, u64 *config);
@@ -85,10 +100,13 @@ struct riscv_pmu {
 	void		(*event_mapped)(struct perf_event *event, struct mm_struct *mm);
 	void		(*event_unmapped)(struct perf_event *event, struct mm_struct *mm);
 	uint8_t		(*csr_index)(struct perf_event *event);
+	void		(*sched_task)(struct perf_event_pmu_context *ctx, bool sched_in);
 
 	struct cpu_hw_events	__percpu *hw_events;
 	struct hlist_node	node;
 	struct notifier_block   riscv_pm_nb;
+
+	unsigned int ctr_depth;
 };
 
 #define to_riscv_pmu(p) (container_of(p, struct riscv_pmu, pmu))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
