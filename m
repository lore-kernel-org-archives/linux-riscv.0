Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924C0ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeYV2P3DV6/XfHU425R74/szsA3+279ULwGxT624TKI=; b=bOMpHNC1Mfssqh
	KsWWyVZj9sFH+/aqeraznf5G78GXG21Uj3ovGV+1yc2x64vrrqaz4fiN6AasigltVBO4F4N9uW5hX
	DZdgO4xcykq2rzVLwsRsLPgLcMw7gcQPkxpgFkkQKL2ZGgU2MwyTz0I2VI/68uNzzqV4NTugta8oJ
	FJkvxBeKpvdxnN/cmyTA8d1ftS4r4aGeczHH8J8Z07mew/kxxlxCcsu7d2wcr6e9Tf6ay/418ZabX
	Iquk+Cufa++8s0SNl8URP2kLXnupR0jxo8tjL6tdrUQmP51x+xzdrmJwvhByAk/1uL7ZL6wn6JqEl
	xjUmOVHm1fMmJbKDNM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT3YL-000PMa-Sk; Tue, 30 Aug 2022 15:53:25 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT3YA-000PHD-71
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 15:53:23 +0000
Received: by mail-lj1-x230.google.com with SMTP id bn9so11817469ljb.6
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TNZBZKT8SF/p8O0eTaaFsl1Wk9j7y12HKn2ypOGrcGM=;
        b=OhTCzyVkB9IS7ZB6DeXHuTtQXfjIWgQvTqg/tCPbROjOrB9ZdTe6sHhBI2XpInIt4k
         I7OpXGltQC6KOfou/uk6t4W7ElMFdSUYd+n3gyMiIaDwEL9z8rkKe35A43dktMr0LJpG
         UNUiI93+GhJyc8GtPy4N8DuTx+HP3x/VpTwYG92EP4rfqUEZQ9iN5zhIunGOe/0iSpIM
         5MxacAm/W9hNyf+52/bNQVt3zBOlcNLub+yOT97qNie+wn70SZYHGG4Prbtpl4xxtJu8
         mPNdWh0QihpS3GWidDZfkvkiTR/OR3WFRyVIDsmQR+pI79M97fMGJQXC5NRn3l0BWWDK
         Qqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TNZBZKT8SF/p8O0eTaaFsl1Wk9j7y12HKn2ypOGrcGM=;
        b=vEwMAD1EM/CEKvbfNoasaO/uVbTIZ9XSmwbJT+dzOL+Kl+vhYgUT6mjLCAIlemoGN8
         4g8PsdmIzR5UjsH12yE9iK5YjCqYZbwvSyKjF5lYh88XkajZQfUtrXudaSU5wvDlK7FL
         xN1EsdAUOpXEH/KN663/w/qi5RQBsptQSMDJxZmv2j1vnnoeci1sEMzr1GAX/NSp3ftB
         8+nAD3eq3q70YBZREaVvxJl6fnaIQh4+tUm7IcXb2Ph7q+CjCJ2AKFlDxYYulyQs1Gsk
         BxhvY//3UNQRRmyCpEXyUnSw8jAQQ/V2dnWXcnASn18YrYMB7wl/D+Aq8T/axPy1MhQn
         uFRw==
X-Gm-Message-State: ACgBeo0yL+4S7pRO2yG0mi27zuJwQpf7cZYb3k7M7xR0hQa2YzwUZp2Q
	Q27QvqFhP3DolECh2XdIZVkPTZ4H/yzMxw==
X-Google-Smtp-Source: AA6agR4bbgDIuYcPUDxSCvWAlw7aqH6FioCr9rqJC6V5UoVQ/z5vA8X9m24TJYsnZ81Bm8YXpXIUEQ==
X-Received: by 2002:a2e:90d3:0:b0:264:bdf4:82d with SMTP id o19-20020a2e90d3000000b00264bdf4082dmr3558246ljg.208.1661874791671;
        Tue, 30 Aug 2022 08:53:11 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id t6-20020a19ad06000000b0048af397c827sm1646572lfc.218.2022.08.30.08.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 08:53:11 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 2/3] perf: RISC-V: exclude invalid pmu counters from SBI calls
Date: Tue, 30 Aug 2022 18:53:05 +0300
Message-Id: <20220830155306.301714-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220830155306.301714-1-geomatsi@gmail.com>
References: <20220830155306.301714-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_085314_278650_2017C48B 
X-CRM114-Status: GOOD (  19.51  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

SBI firmware may not provide information for some counters in response
to SBI_EXT_PMU_COUNTER_GET_INFO call. Exclude such counters from the
subsequent SBI requests. For this purpose use global mask to keep track
of fully specified counters.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c |  4 ++--
 drivers/perf/riscv_pmu_sbi.c    | 27 ++++++++++++++++-----------
 include/linux/perf/riscv_pmu.h  |  2 +-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 342778782359..7d7131c47bc0 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -14,7 +14,6 @@
 
 #define RISCV_PMU_LEGACY_CYCLE		0
 #define RISCV_PMU_LEGACY_INSTRET	1
-#define RISCV_PMU_LEGACY_NUM_CTR	2
 
 static bool pmu_init_done;
 
@@ -83,7 +82,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 {
 	pr_info("Legacy PMU implementation is available\n");
 
-	pmu->num_counters = RISCV_PMU_LEGACY_NUM_CTR;
+	pmu->cmask = BIT(RISCV_PMU_LEGACY_CYCLE) |
+		BIT(RISCV_PMU_LEGACY_INSTRET);
 	pmu->ctr_start = pmu_legacy_ctr_start;
 	pmu->ctr_stop = NULL;
 	pmu->event_map = pmu_legacy_event_map;
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 8de4ca2fef21..bc7db9739d5a 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -271,7 +271,6 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	struct sbiret ret;
 	int idx;
 	uint64_t cbase = 0;
-	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters - 1, 0);
 	unsigned long cflags = 0;
 
 	if (event->attr.exclude_kernel)
@@ -281,11 +280,12 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 
 	/* retrieve the available counter index */
 #if defined(CONFIG_32BIT)
-	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
-			cflags, hwc->event_base, hwc->config, hwc->config >> 32);
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
+			rvpmu->cmask, cflags, hwc->event_base, hwc->config,
+			hwc->config >> 32);
 #else
-	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
-			cflags, hwc->event_base, hwc->config, 0);
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
+			rvpmu->cmask, cflags, hwc->event_base, hwc->config, 0);
 #endif
 	if (ret.error) {
 		pr_debug("Not able to find a counter for event %lx config %llx\n",
@@ -294,7 +294,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	}
 
 	idx = ret.value;
-	if (idx >= rvpmu->num_counters || !pmu_ctr_list[idx].value)
+	if (!test_bit(idx, &rvpmu->cmask) || !pmu_ctr_list[idx].value)
 		return -ENOENT;
 
 	/* Additional sanity check for the counter id */
@@ -463,7 +463,7 @@ static int pmu_sbi_find_num_ctrs(void)
 		return sbi_err_map_linux_errno(ret.error);
 }
 
-static int pmu_sbi_get_ctrinfo(int nctr)
+static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
 {
 	struct sbiret ret;
 	int i, num_hw_ctr = 0, num_fw_ctr = 0;
@@ -478,6 +478,9 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
 			continue;
+
+		*mask |= BIT(i);
+
 		cinfo.value = ret.value;
 		if (cinfo.type == SBI_PMU_CTR_TYPE_FW)
 			num_fw_ctr++;
@@ -498,7 +501,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 	 * which may include counters that are not enabled yet.
 	 */
 	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-		  0, GENMASK_ULL(pmu->num_counters - 1, 0), 0, 0, 0, 0);
+		  0, pmu->cmask, 0, 0, 0, 0);
 }
 
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
@@ -788,8 +791,9 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
 static int pmu_sbi_device_probe(struct platform_device *pdev)
 {
 	struct riscv_pmu *pmu = NULL;
-	int num_counters;
+	unsigned long cmask = 0;
 	int ret = -ENODEV;
+	int num_counters;
 
 	pr_info("SBI PMU extension is available\n");
 	pmu = riscv_pmu_alloc();
@@ -803,7 +807,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	}
 
 	/* cache all the information about counters now */
-	if (pmu_sbi_get_ctrinfo(num_counters))
+	if (pmu_sbi_get_ctrinfo(num_counters, &cmask))
 		goto out_free;
 
 	ret = pmu_sbi_setup_irqs(pmu, pdev);
@@ -812,8 +816,9 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 	}
+
 	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
-	pmu->num_counters = num_counters;
+	pmu->cmask = cmask;
 	pmu->ctr_start = pmu_sbi_ctr_start;
 	pmu->ctr_stop = pmu_sbi_ctr_stop;
 	pmu->event_map = pmu_sbi_event_map;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index bf66fe011fa8..e17e86ad6f3a 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -45,7 +45,7 @@ struct riscv_pmu {
 
 	irqreturn_t	(*handle_irq)(int irq_num, void *dev);
 
-	int		num_counters;
+	unsigned long	cmask;
 	u64		(*ctr_read)(struct perf_event *event);
 	int		(*ctr_get_idx)(struct perf_event *event);
 	int		(*ctr_get_width)(int idx);
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
