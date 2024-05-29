Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AFCC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 18:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDqJxnsVEWDpYWG6qQfCXY/ezyMyZmwN5f3+0QDH4AM=; b=zrd8RyPBut6gxm
	tTY2aOiGzV6k5DK0psj5v4UoGVJz9xCM6vrII7gdqR+HXVhRiLEiC7tI1M4iX8MOWw1NuYmW3fFfF
	Onmvpncw0If3z3eofO8sOq82+9lnwQR3HrYbQpCqxrwAoweSNVw2of6+Y8O9WNqjxY8a9y6eUo0N1
	byyiQ+mzsbG1gRivOE5htKL0m+BLZG7v4A64a6lNwvccWIDOhunY5YZSVFICqNmODjx4v+C2op5sb
	IPL9OHDZyArXaoJGFRtW2E0eKAgk6ryDRx1YTEv0m7/Qjv5AV17fYRp3mqwuNt/wftVwZCpUglZFl
	1tf8zBhoxdwNXPVbeStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORf-00000005GAL-0ZcR;
	Wed, 29 May 2024 18:54:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORX-00000005G6d-32v3
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 18:54:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3550134ef25so36977f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717008874; x=1717613674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7vDEMF2Cse3GKKKWWJPFMdZWN9OHL0jv0BqXqFqZx0=;
        b=WhwYS/Ay/YiedcmHtA4JQyn5TvY1RXGRc0AeXI5VlJWDc+gLuTz1hCDvK+C+/SGvkJ
         RxGHAaYPZ6ptJtqshZ0yMqhVFq7eeIwCCkk3WBF5N5gujmQP9kysJD2B7N6ciFbVLX/a
         4hzeZrFkf1QxFjdJC9dkW1vTytYBRs7kELP+xWvxWSN8WU1MzXPrrsIqjwKlwv93IjWb
         Fz5VB6iWP3TyCUbz+vvo/DO5WAwx0+GOB6qZTw2pyamQqGwhHzv2PEKXLlvl4KxIdWZv
         4ATaO1P0Ar46C6BSQ3NY7aAbboTYC0rN9WEjNua2hAfh3ShtRZNb9zyNaXtybNsvRCWi
         IH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717008874; x=1717613674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7vDEMF2Cse3GKKKWWJPFMdZWN9OHL0jv0BqXqFqZx0=;
        b=odQPARP+U9T6UUlf306wOBpBBPkfYUHAWuLFr5X1bnxM711wExM3j5pctvkLq0N/1E
         cK0ama1XnkgxpPCEL8c0OIiHUWIorARxJnXROZTMAyv0+aMhUWEGtOunzoTVz+BiGuz9
         zJEKdH032dAXjQestTs20i2bkj3NcJ0pE60kLMDZhpitwBwaQTPaUz0lCGlHucwP/IA3
         KqzG3wuiYBbVc2g0Zk/T5a3m1km2uhkvGx6b3DulxFLWDAMjpw06vl9Avg8NBIk/XZ8c
         suSWK3aNF7ctjOeCQEbFkg+8runoz1Gx6CKAxZlBrBk2b7CW5JAeKw4Vs39WMyvZu5bA
         4tEw==
X-Forwarded-Encrypted: i=1; AJvYcCX+1oxlP9E3XNu/exJwinbe5b074iYXkn3vmwoyUh+JEHJ/APQrXDE7Vd3/d5VO4+xwfUMDqlCTY+0O3Em0M/F8xjHT807I0ivBtv1TOETC
X-Gm-Message-State: AOJu0Yx6N078lsyW1XCGSsg/YIxHCagHiWAetQd2FFEpgeQMtOOV9HDY
	xLRwHKsY0MHa0CfMwnzeCekQ4UjSbHtm7BseUCoqGNkMlLuIIfTq62s3EJhGRHU=
X-Google-Smtp-Source: AGHT+IG0aFRXbEPemdv8ro3r0XN3H/rTAxOwWSQmMr3iD1+X74b6QY7y655sl+IdhOd5xfv/zlwFfw==
X-Received: by 2002:a05:600c:1d9a:b0:421:2065:3799 with SMTP id 5b1f17b1804b1-42127929560mr208155e9.29.1717008873888;
        Wed, 29 May 2024 11:54:33 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.Home ([2a02:c7c:7527:ee00:7446:71c1:a41a:da9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212706a23csm2787885e9.27.2024.05.29.11.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:54:33 -0700 (PDT)
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
Subject: [PATCH RFC 4/6] riscv: perf: Add infrastructure for Control Transfer Record
Date: Wed, 29 May 2024 19:53:35 +0100
Message-Id: <20240529185337.182722-5-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529185337.182722-1-rkanwal@rivosinc.com>
References: <20240529185337.182722-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_115435_831803_01E631B6 
X-CRM114-Status: GOOD (  17.75  )
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
by software when perf events overflow. A task may be context- switched between
overflows, and to avoid leaking samples we need to clear the last task's
records when a task is context-switched In. To do this we will be using the
pmu::sched_task() callback added in this patch.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 drivers/perf/riscv_pmu_common.c | 15 +++++++++++++++
 drivers/perf/riscv_pmu_dev.c    |  9 +++++++++
 include/linux/perf/riscv_pmu.h  | 16 ++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/perf/riscv_pmu_common.c b/drivers/perf/riscv_pmu_common.c
index b4efdddb2ad9..e794675e4944 100644
--- a/drivers/perf/riscv_pmu_common.c
+++ b/drivers/perf/riscv_pmu_common.c
@@ -159,6 +159,19 @@ u64 riscv_pmu_ctr_get_width_mask(struct perf_event *event)
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
@@ -406,6 +419,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 	for_each_possible_cpu(cpuid) {
 		cpuc = per_cpu_ptr(pmu->hw_events, cpuid);
 		cpuc->n_events = 0;
+		cpuc->ctr_users = 0;
 		for (i = 0; i < RISCV_MAX_COUNTERS; i++)
 			cpuc->events[i] = NULL;
 	}
@@ -419,6 +433,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 		.start		= riscv_pmu_start,
 		.stop		= riscv_pmu_stop,
 		.read		= riscv_pmu_read,
+		.sched_task	= riscv_pmu_sched_task,
 	};
 
 	return pmu;
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 5ca8a909f3ab..40ae5fc897a3 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -670,6 +670,14 @@ static void rvpmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 			hwc->idx, sbi_err_map_linux_errno(ret.error));
 }
 
+static void pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
+			   bool sched_in)
+{
+	struct riscv_pmu *pmu = to_riscv_pmu(pmu_ctx->pmu);
+
+	/* Call CTR specific Sched hook. */
+}
+
 static int rvpmu_sbi_find_num_ctrs(void)
 {
 	struct sbiret ret;
@@ -1494,6 +1502,7 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 	pmu->event_mapped = rvpmu_event_mapped;
 	pmu->event_unmapped = rvpmu_event_unmapped;
 	pmu->csr_index = rvpmu_csr_index;
+	pmu->sched_task = pmu_sched_task;
 
 	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 	if (ret)
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 425edd6685a9..5a6b840018bd 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -33,6 +33,13 @@
 #define RISCV_PMU_CYCLE_FIXED_CTR_MASK 0x01
 #define RISCV_PMU_INSTRUCTION_FIXED_CTR_MASK 0x04
 
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
@@ -44,6 +51,12 @@ struct cpu_hw_events {
 	DECLARE_BITMAP(used_hw_ctrs, RISCV_MAX_COUNTERS);
 	/* currently enabled firmware counters */
 	DECLARE_BITMAP(used_fw_ctrs, RISCV_MAX_COUNTERS);
+
+	/* Saved branch records. */
+	struct branch_records *branches;
+
+	/* Active events requesting branch records */
+	int ctr_users;
 };
 
 struct riscv_pmu {
@@ -64,10 +77,13 @@ struct riscv_pmu {
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
