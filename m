Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E88EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DQ4EDnlrB2OOgW7wcqO6i01UpUSTcvExwxfkL/Xv7w=; b=fe3/YaTu/SyWUf
	1bw6YB7hpQhDzEnWwBWXqu999MRQiMH8ZcehDk3Hf5mgt65WINw/WCnRFs54shNjuqsNAE2/+35r+
	x/qnzihcTJvD4BJwcYdUuhmEtIUzn4i5ld1DB/mWs6PybrXb1tUKFaUhwqZLiwXxUnzBU+JavahZx
	5Zcc8GltoFOF0hG+Qyzl7NU4xRrz3ZYDyNgGWnKs9NNm+qBvpuslNkQ+Z3W5+HhLzm75SwD1wscnH
	ihSjJcR033fBjJWeFyk1g/NDAgq977YNq7Ho/IxlTx5mcCWz/oniZyZTprYhTXL5yH8NuvNk+QaP6
	5B5XPvLgHY/8jYOD6voA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9ca-003C4L-23;
	Fri, 30 Jun 2023 08:36:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9cY-003C2Q-0m
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:36:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so4640995e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114206; x=1690706206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbFrV/q7Aw3mH90ZjkDcoZb78N1NQiIc7nnyXH9eDMc=;
        b=lk4ROx+445tjGoiFoANbfoxzkU/tTN0mTJrJx7aWYCV262XC66c5hSNLo6pJryncjC
         FaAZsSwUMZVVIGrUk2nq0JvLfgk4zShuHsZDCgmzBUpYcbFKpkHwLDlg4Wz8ysOW83Ko
         TieV7rqnvdXVDf+yeoLeOYUADZ7zHQZZ/CwEFEBNhZX26aXYy7qI3gFc/m2tmtWQbpLw
         Mn/N/+AzNfGZ4garHVqizQAh0/Pl5TdSiegTXP2bCOYPbaf4BDsq6xtDmz2sDKuV24dc
         +6SoRTE7RPAHsY8jra+nTGvLlPBQTB7lgBxh4sXnbvIY0pskHqVSaJdDVxiZIe8M172Q
         97sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114206; x=1690706206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbFrV/q7Aw3mH90ZjkDcoZb78N1NQiIc7nnyXH9eDMc=;
        b=OgxXPnxjRvyYJTEmVQnLe5/M+Sn20P99MFl4w7ggZB3NdrUyiBpbewZCTa9cMsLw9H
         5Ms8HFNUytPrYTmY+9Lwc/6Io4tXMUhw4H/T7dsUEp4JgqorK8sClYdUzY9XbP9UaRBU
         tfERzhRi1IG3xd1WRWGGOK+Jyk1emYkJXwQabeZxaF4ybLYebf7zqpgNWiOb6T9gXOFL
         Oi9qa/WW7yDopCwbXhWCnGe3sNKBb8CINhrf8VUiQKSy2rgoypAXkpbpy9FCUmbOmWUl
         1SmMkhMp7eGCLCChYnm/6UmoQSeiwhTMfhYSEs+/9I/BHdiBmpuV4VvmCXt8blyGPQw/
         weVg==
X-Gm-Message-State: AC+VfDzVfXCW35/9/F2JMpUjkTGZPYkK/HvRxTVX08gPk/f8XsRs6qu+
	dp3ik1IWLlTXoO1PP5FKVh2Xxg==
X-Google-Smtp-Source: ACHHUZ5E6Ts0FdjdtogyYoZnx3gLffIu8xGsaINIU3rFCRVUCOnwwLWUUeKyhOEVWUyaOE/vpwyl5Q==
X-Received: by 2002:a1c:7706:0:b0:3fb:b61f:c719 with SMTP id t6-20020a1c7706000000b003fbb61fc719mr1388538wmi.33.1688114206421;
        Fri, 30 Jun 2023 01:36:46 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c028c00b003fbaade072dsm8024200wmk.23.2023.06.30.01.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:36:45 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 05/10] riscv: Prepare for user-space perf event mmap support
Date: Fri, 30 Jun 2023 10:30:08 +0200
Message-Id: <20230630083013.102334-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_013650_280112_F84060E8 
X-CRM114-Status: GOOD (  20.95  )
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

Provide all the necessary bits in the generic riscv pmu driver to be
able to mmap perf events in userspace: the heavy lifting lies in the
driver backend, namely the legacy and sbi implementations.

Note that arch_perf_update_userpage is almost a copy of arm64 code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/perf/riscv_pmu.c       | 106 +++++++++++++++++++++++++++++++++
 include/linux/perf/riscv_pmu.h |   4 ++
 2 files changed, 110 insertions(+)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index ebca5eab9c9b..e1b0992f34df 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -14,9 +14,74 @@
 #include <linux/perf/riscv_pmu.h>
 #include <linux/printk.h>
 #include <linux/smp.h>
+#include <linux/sched_clock.h>
 
 #include <asm/sbi.h>
 
+static bool riscv_perf_user_access(struct perf_event *event)
+{
+	return ((event->attr.type == PERF_TYPE_HARDWARE) ||
+		(event->attr.type == PERF_TYPE_HW_CACHE) ||
+		(event->attr.type == PERF_TYPE_RAW)) &&
+		!!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT);
+}
+
+void arch_perf_update_userpage(struct perf_event *event,
+			       struct perf_event_mmap_page *userpg, u64 now)
+{
+	struct clock_read_data *rd;
+	unsigned int seq;
+	u64 ns;
+
+	userpg->cap_user_time = 0;
+	userpg->cap_user_time_zero = 0;
+	userpg->cap_user_time_short = 0;
+	userpg->cap_user_rdpmc = riscv_perf_user_access(event);
+
+	if (userpg->cap_user_rdpmc)
+		userpg->pmc_width = 64;
+
+	do {
+		rd = sched_clock_read_begin(&seq);
+
+		userpg->time_mult = rd->mult;
+		userpg->time_shift = rd->shift;
+		userpg->time_zero = rd->epoch_ns;
+		userpg->time_cycles = rd->epoch_cyc;
+		userpg->time_mask = rd->sched_clock_mask;
+
+		/*
+		 * Subtract the cycle base, such that software that
+		 * doesn't know about cap_user_time_short still 'works'
+		 * assuming no wraps.
+		 */
+		ns = mul_u64_u32_shr(rd->epoch_cyc, rd->mult, rd->shift);
+		userpg->time_zero -= ns;
+
+	} while (sched_clock_read_retry(seq));
+
+	userpg->time_offset = userpg->time_zero - now;
+
+	/*
+	 * time_shift is not expected to be greater than 31 due to
+	 * the original published conversion algorithm shifting a
+	 * 32-bit value (now specifies a 64-bit value) - refer
+	 * perf_event_mmap_page documentation in perf_event.h.
+	 */
+	if (userpg->time_shift == 32) {
+		userpg->time_shift = 31;
+		userpg->time_mult >>= 1;
+	}
+
+	/*
+	 * Internal timekeeping for enabled/running/stopped times
+	 * is always computed with the sched_clock.
+	 */
+	userpg->cap_user_time = 1;
+	userpg->cap_user_time_zero = 1;
+	userpg->cap_user_time_short = 1;
+}
+
 static unsigned long csr_read_num(int csr_num)
 {
 #define switchcase_csr_read(__csr_num, __val)		{\
@@ -171,6 +236,8 @@ int riscv_pmu_event_set_period(struct perf_event *event)
 
 	local64_set(&hwc->prev_count, (u64)-left);
 
+	perf_event_update_userpage(event);
+
 	return overflow;
 }
 
@@ -267,6 +334,9 @@ static int riscv_pmu_event_init(struct perf_event *event)
 	hwc->idx = -1;
 	hwc->event_base = mapped_event;
 
+	if (rvpmu->event_init)
+		rvpmu->event_init(event);
+
 	if (!is_sampling_event(event)) {
 		/*
 		 * For non-sampling runs, limit the sample_period to half
@@ -283,6 +353,39 @@ static int riscv_pmu_event_init(struct perf_event *event)
 	return 0;
 }
 
+static int riscv_pmu_event_idx(struct perf_event *event)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+
+	if (!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT))
+		return 0;
+
+	if (rvpmu->csr_index)
+		return rvpmu->csr_index(event) + 1;
+
+	return 0;
+}
+
+static void riscv_pmu_event_mapped(struct perf_event *event, struct mm_struct *mm)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+
+	if (rvpmu->event_mapped) {
+		rvpmu->event_mapped(event, mm);
+		perf_event_update_userpage(event);
+	}
+}
+
+static void riscv_pmu_event_unmapped(struct perf_event *event, struct mm_struct *mm)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+
+	if (rvpmu->event_unmapped) {
+		rvpmu->event_unmapped(event, mm);
+		perf_event_update_userpage(event);
+	}
+}
+
 struct riscv_pmu *riscv_pmu_alloc(void)
 {
 	struct riscv_pmu *pmu;
@@ -307,6 +410,9 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 	}
 	pmu->pmu = (struct pmu) {
 		.event_init	= riscv_pmu_event_init,
+		.event_mapped	= riscv_pmu_event_mapped,
+		.event_unmapped	= riscv_pmu_event_unmapped,
+		.event_idx	= riscv_pmu_event_idx,
 		.add		= riscv_pmu_add,
 		.del		= riscv_pmu_del,
 		.start		= riscv_pmu_start,
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 5deeea0be7cb..43282e22ebe1 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -55,6 +55,10 @@ struct riscv_pmu {
 	void		(*ctr_start)(struct perf_event *event, u64 init_val);
 	void		(*ctr_stop)(struct perf_event *event, unsigned long flag);
 	int		(*event_map)(struct perf_event *event, u64 *config);
+	void		(*event_init)(struct perf_event *event);
+	void		(*event_mapped)(struct perf_event *event, struct mm_struct *mm);
+	void		(*event_unmapped)(struct perf_event *event, struct mm_struct *mm);
+	uint8_t		(*csr_index)(struct perf_event *event);
 
 	struct cpu_hw_events	__percpu *hw_events;
 	struct hlist_node	node;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
