Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D98ECAAA3
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 20:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfeCmuo8FvkPE1E2BGctL/gT4RYAKy1dw0dW1PGhGCs=; b=JsPiHOV8QIfQsy
	wcitJVqULAxXrz93ckf73zhp4kvZ/Za0WLiIOl9cHNVwnsRJrb20YKzHFtS3YvIywR0JRhcKpiJPK
	kXSNClnFzZKKFYKsCyvkRxG+TsFIsYpANxQuunRljtCUYfZ1XfUk3U9H/Q3sVBTTmRBJYYfTk57O7
	iAW49OK0HoAMoHzLs+vSw6a0JyUcLJSwrQCPbypuivIwXSIkMGhkHrw3uVoWW22p4zvaXoTRctsOd
	W0whNAQCbOtKjHQnRm8jn/DtAQeJY37NrdP9wRxfdt1OcuxR+QWNMo708L713zpzni3p8ID+9Ykll
	LAV/fQir9drUI/8R8ooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRg2f-00BtYX-NA; Fri, 26 Aug 2022 20:35:01 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRg2b-00BtR7-0Q
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 20:34:58 +0000
Received: by mail-lf1-x12f.google.com with SMTP id q7so3415318lfu.5
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5bHDZzng8yFDqxWm/MtoBzFqGf8BM/bAAov45GhFSZU=;
        b=n0NuMEWenwMyauNjZ7JCUPipyT4Ww68x5/OTY9rwhW1Xq6OEjHp6aRpkcF/0ABJ/Cn
         bfq7qAOAixhC1r3+n79igjQybQTazlLT8Ghe51ExBcHR8zmnTJBgh2WCBNYbqg8FoOW9
         lS9WoAZs9NAQKnf2BY0B1k8UU4IUzjhXiIKFFu0lLaKA6Da89Eh5aX71/yinF77aLDc4
         5Z5HbziwNoT3yIX2f2h+TYqQc+qBifc1VnQG7pxxo+6mifkNb8Rf7cMqEJdq42gfOkTP
         CtxYbkbBWGbOs2Q/DJwai97bt4JNxb2aIP/Fq9sAdRplbC7dYBiw0QhFW0q4EeVhlPo3
         4Ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5bHDZzng8yFDqxWm/MtoBzFqGf8BM/bAAov45GhFSZU=;
        b=nODSEVDN52EJ/jWabdNKN2BCWYY+2C57gKnXicXD2B77+42pf6cP/BsqdT9xwoAZ2o
         N3PTDyQs3SoV62xvQEuVsd8kFSezvP9XiGyP+3rzSXZxCnpMHfQEoLuc+6JT+++jDW0T
         L6ofV4cD1SkOca4mIiQJm5frH4cz+tH/W7+KPHcGPyuzUuYsHx1i+sM36AgWuglF62WA
         wyKsh1Lr0Ymu2eEp9ILMg/Xt49mcfKepBKAxJBq4LdHEwcy054mzciQ2kaPcPJpYzKOC
         uh3v5ju2br10sqCZOBbwU/AgP4I1sWDquuTNo5wagDzK4CTAlSt4DwV49kEOt0Vqos1o
         3Wyw==
X-Gm-Message-State: ACgBeo2kL2D8hRxjgJDY4ML8di2EB4RasWA0kJdunLNjJaHOTaM8z+9h
	tz4oacMkiS3o3bUoZHyPEejBIcmG7eA=
X-Google-Smtp-Source: AA6agR6/rH9sbAFh5L398qBfGVa02ViPFRlfjeI4nSdTkB993TZFP310QtHq1EIqC5MUO5jhn8beDw==
X-Received: by 2002:a05:6512:e98:b0:492:cf3c:8860 with SMTP id bi24-20020a0565120e9800b00492cf3c8860mr2935705lfb.603.1661546094535;
        Fri, 26 Aug 2022 13:34:54 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id v6-20020a05651203a600b00493014c3d7csm452424lfp.309.2022.08.26.13.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 13:34:54 -0700 (PDT)
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
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH v3 2/3] perf: RISC-V: exclude invalid pmu counters from SBI calls
Date: Fri, 26 Aug 2022 23:34:42 +0300
Message-Id: <20220826203443.823906-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826203443.823906-1-geomatsi@gmail.com>
References: <20220826203443.823906-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_133457_089137_6128EBC0 
X-CRM114-Status: GOOD (  19.39  )
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
