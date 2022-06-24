Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0521C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5z8Hps9izTo1B6xD7Zf4X4SVi2nyPChnIi66Z8QI8Y=; b=djBnnbqPhzAArV
	5sKqIQF29enF0EdUJ8u5SUsEKsi30LneolR3FySr3D8YG26grHjVpoKIkBvZo804NOYmBlSmImR8t
	B+1VBaWW+f5aBjz/09PibG9HIdw4ffkhxbQCCw+NzNiZIcsXeMttRvwMsanNhN7QsDus4L0hHj3OY
	hYd6X8d9TZp+K5ilWYM6BrrkzpynznGso/cw1HVnl3ZmPD0hBVSk5N/676WZdjiuea13FdNJLwvI9
	aholBxOnDsZUy/QSWsSbIQXLzDwvf3JL10lD6YsDZ466uzTVGqqv/IFo4l0yil3GPuSXa5zgX4Cd/
	xb+wCl+BpoOxS/NLldFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jq6-002X0e-RG; Fri, 24 Jun 2022 13:59:14 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jq2-002Wz7-Lo
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 13:59:12 +0000
Received: by mail-lj1-x234.google.com with SMTP id a39so1722668ljq.11
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AdDdPY27NTnQWNMAHy4RtsOuUpe5yuy1qpDCQ20ygFQ=;
        b=qCuDIzbRsL9CAbiZHdUjMy8pkdhUrEAJcBVhHvyljReVUyZMOObsM1+UjEJ9h+Xx8Q
         m1iRBxGul8tzOiJ8icz00enLY68i77CKn0c/O09BRbL13UURReWin9Dn5agyyujFbJ25
         I3OPocneI0p0nZDPXgsQGgacBq/MBX9bd3d8I+aBYwz9QGdAdpSHSE2XAqAKCK+ZwLMP
         R4qvmvA3RhXXJqzsrpKJROuk0vMM13p9xrt7EwODAWOir/UxFLj07Zrnh+xcjBe8KK0M
         Smm8GPqp9BYxtzcildmT1p7DSfN198+m4lUl5W1OVQGw/F4G/etlOMOk0SQWk/NOLdir
         Pofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AdDdPY27NTnQWNMAHy4RtsOuUpe5yuy1qpDCQ20ygFQ=;
        b=lAT77/m99e6gYPB94xvInN31Gl2Y+wUcSPDqqYDGAP1kM2wNjvAYXjauL2IMEvnZVD
         EACQ7uOoPQv3BNiNHS90zPPM0LdukBOAS9SKdQpSlfDFPXHpKD2XbUi5i5zOta3g+Zgn
         2B0SvmcoKGKfkLNR2JRvcQRE6LyxAqDaSfpedOIh90LsDTA6wbFhIsL6yhfQ0F2FH8ts
         u1aO4O3jEp7ivLmgcRz9t+QBHJC42HFPyF3n9GioxEELURH2Jgqvz1521MyOhLSRziSj
         UzlpyoL3WBGUFYSRvSAwFWvC2uTMaN5Ib8+Bxo51uUuSkD6UwiIwDRZn2HGcAR+B4LlF
         rifA==
X-Gm-Message-State: AJIora+xfw0da1uQSZ28Cdb6Racco8cU5mzoJuF5QnY33E05mUEASrOy
	ApTRCDbtvn0HZo//9OJGy8+SzgXSgVoGtg==
X-Google-Smtp-Source: AGRyM1uUkDr8AYKK1GTMSt0ds1mNCMxOJkmD+xsNipJdllEb5Kp1awJtYLJv1viaL7wGS13C0e3/8Q==
X-Received: by 2002:a2e:581:0:b0:25a:6f77:57ed with SMTP id 123-20020a2e0581000000b0025a6f7757edmr7596687ljf.86.1656079146048;
        Fri, 24 Jun 2022 06:59:06 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id p14-20020a05651211ee00b00477cb9b8762sm385762lfs.50.2022.06.24.06.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 06:59:05 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH v2 2/2] perf: RISC-V: exclude invalid pmu counters from SBI calls
Date: Fri, 24 Jun 2022 16:59:02 +0300
Message-Id: <20220624135902.520748-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624135902.520748-1-geomatsi@gmail.com>
References: <20220624135902.520748-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_065910_755386_80CC1057 
X-CRM114-Status: GOOD (  18.62  )
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
 drivers/perf/riscv_pmu_sbi.c    | 22 +++++++++++++---------
 include/linux/perf/riscv_pmu.h  |  2 +-
 3 files changed, 16 insertions(+), 12 deletions(-)

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
index a5d25b51beac..70a3db29427a 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -265,7 +265,6 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	struct sbiret ret;
 	int idx;
 	uint64_t cbase = 0;
-	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters - 1, 0);
 	unsigned long cflags = 0;
 
 	if (event->attr.exclude_kernel)
@@ -274,8 +273,8 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 		cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
 
 	/* retrieve the available counter index */
-	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
-			cflags, hwc->event_base, hwc->config, 0);
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
+			rvpmu->cmask, cflags, hwc->event_base, hwc->config, 0);
 	if (ret.error) {
 		pr_debug("Not able to find a counter for event %lx config %llx\n",
 			hwc->event_base, hwc->config);
@@ -283,7 +282,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	}
 
 	idx = ret.value;
-	if (idx >= rvpmu->num_counters || !pmu_ctr_list[idx].value)
+	if (!test_bit(idx, &rvpmu->cmask) || !pmu_ctr_list[idx].value)
 		return -ENOENT;
 
 	/* Additional sanity check for the counter id */
@@ -447,7 +446,7 @@ static int pmu_sbi_find_num_ctrs(void)
 		return sbi_err_map_linux_errno(ret.error);
 }
 
-static int pmu_sbi_get_ctrinfo(int nctr)
+static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
 {
 	struct sbiret ret;
 	int i, num_hw_ctr = 0, num_fw_ctr = 0;
@@ -462,6 +461,9 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
 			continue;
+
+		*mask |= BIT(i);
+
 		cinfo.value = ret.value;
 		if (cinfo.type == SBI_PMU_CTR_TYPE_FW)
 			num_fw_ctr++;
@@ -482,7 +484,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 	 * which may include counters that are not enabled yet.
 	 */
 	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-		  0, GENMASK_ULL(pmu->num_counters - 1, 0), 0, 0, 0, 0);
+		  0, pmu->cmask, 0, 0, 0, 0);
 }
 
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
@@ -696,8 +698,9 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 static int pmu_sbi_device_probe(struct platform_device *pdev)
 {
 	struct riscv_pmu *pmu = NULL;
-	int num_counters;
+	unsigned long cmask = 0;
 	int ret = -ENODEV;
+	int num_counters;
 
 	pr_info("SBI PMU extension is available\n");
 	pmu = riscv_pmu_alloc();
@@ -711,7 +714,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	}
 
 	/* cache all the information about counters now */
-	if (pmu_sbi_get_ctrinfo(num_counters))
+	if (pmu_sbi_get_ctrinfo(num_counters, &cmask))
 		goto out_free;
 
 	ret = pmu_sbi_setup_irqs(pmu, pdev);
@@ -720,7 +723,8 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 	}
-	pmu->num_counters = num_counters;
+
+	pmu->cmask = cmask;
 	pmu->ctr_start = pmu_sbi_ctr_start;
 	pmu->ctr_stop = pmu_sbi_ctr_stop;
 	pmu->event_map = pmu_sbi_event_map;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 46f9b6fe306e..60f4373fe581 100644
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
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
