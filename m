Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570A9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 11:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obbd5SNycNoH1kECt1ey7nOhXn9KAf4yfriqywoXZ8E=; b=w9OXoUsr9CcmT+
	r1OsrBg3qP95CuicL4xSDnybc0e+xbaGhP5NYpg0972r2MAt24CMGXMCa9PRjhFE852Ku2QxcBslk
	tqY87Y7sX97dkKBOXLyYIjOhVJJU+JyxyQlH+HWLIcu8c2hGmOtfB4RLKGhxhY3bc9Uqakqhduiv0
	g/7iCMjiZrgWmnDqDs88oUGJmK/5OaF+08InRnEO3PAvXheUagK3Qt5wVFP6hJvK3WI6sVo9O+vbU
	VSwxaObhxxb5KgHy6v3eWFDUHWAki1GA9wu0FvXCSkuVs71bIzHrBd/AViAkcq2lxnd+tN1FL8ZMl
	dreqarMSANOr37N6iq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Kzz-00EiV0-RV; Thu, 23 Jun 2022 11:27:47 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Kzv-00EiSc-Lm
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 11:27:45 +0000
Received: by mail-lj1-x230.google.com with SMTP id n15so11303378ljg.8
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 04:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=amOFHndAgs6m/PmD0Ti0oJctV2AMrtBj5P0f6sdbQIw=;
        b=R7aHGW/6VfLzKYTP+suWDv9FPm5sKDzyrrYHwyrz/3gWjMtuL8TwJDlr360H5W8pnt
         rZtwbVnauD3dzZsbXsx2Wyjj0dYYdsgm0jhtg+Z5ZvUICJNm00IQn8JDeyAAx0Ocj/j8
         j7yhe25E9dsTICMTWNnsaMluo8q4EScAhBvIlTSPQ3adqvBtEF+pw+wA12n6LqsILxec
         Np3q3FOpfLb40InP4k//fPbomtRxTpK2vN6rrqpEzDMScndbumdEjifaLA1qT7mLxTgn
         ZpRZycJAv4FmBJuQHGf4VDOkwolwsQ/uwGfH8tsR4sInndO44cbIi23X6Hu/+76Owp+g
         Ab1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=amOFHndAgs6m/PmD0Ti0oJctV2AMrtBj5P0f6sdbQIw=;
        b=gqaBzMl+NRrKtqCxE08+xojshqWJG36pTUdn590SE4cKPi07RHs57jHbb+w2ftOy+/
         6n7dFj8BC1AXc4T22I/B8XfzUWRK8PxasAE7EEhuLfUKP9dD9FeFVwZaFeMrFTu7AmO3
         iPW6ExcYmFI0aUmthd2Le3DEL/O2vZqYFdZ4oG3YbOf5H+eu6DjRx9N+8N9KcKiC0r8l
         HQpUMzRN2oTathvrOS1Z1OfMn7CTOZusvcRw5i20Sgby7MGSxHaGsMUiVgTIQXhQ+L15
         4KBD8i6qkLliMoESfwmm8BDuWR9/GSqD1hqaD2oCxEjXg8kvDlZ+1LhA3ndKK//ExtS7
         BbKA==
X-Gm-Message-State: AJIora9agKZSgZGC8KsdAbbBSzt74R7SZYmzxmm3r9rl6p7W/VPOCHmS
	naR72CD5LnXpNGYdDGOBF91QDxqQxxA=
X-Google-Smtp-Source: AGRyM1uHWJGwdgq5dRub4f5XnQFBBYSyOoXzLvUmePubXj8gWFs+LOGtlGHEd0zQXKnnCkZI+lxmzw==
X-Received: by 2002:a2e:b8c4:0:b0:25a:8b96:621e with SMTP id s4-20020a2eb8c4000000b0025a8b96621emr3654691ljp.514.1655983660771;
        Thu, 23 Jun 2022 04:27:40 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id p4-20020a2e93c4000000b00255bd6e1923sm2752124ljh.45.2022.06.23.04.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:27:40 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH 3/3] perf: RISC-V: support noncontiguous pmu counter IDs
Date: Thu, 23 Jun 2022 14:27:35 +0300
Message-Id: <20220623112735.357093-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623112735.357093-1-geomatsi@gmail.com>
References: <20220623112735.357093-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_042743_779704_508617D0 
X-CRM114-Status: GOOD (  25.28  )
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

OpenSBI and Linux driver assume that pmu counter IDs are not expected
to be contiguous. Current support for noncontiguous IDs is limited by
the special treatment of the index 1 used by hardware for TM control.
Replace counter array by IDR to support gaps in hardware counter IDs.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 drivers/perf/riscv_pmu_legacy.c |  4 +-
 drivers/perf/riscv_pmu_sbi.c    | 88 +++++++++++++++++++++++----------
 include/linux/perf/riscv_pmu.h  |  2 +-
 3 files changed, 65 insertions(+), 29 deletions(-)

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
index 294d4bded59e..57bea421f014 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -39,7 +39,7 @@ union sbi_pmu_ctr_info {
  * RISC-V doesn't have hetergenous harts yet. This need to be part of
  * per_cpu in case of harts with different pmu counters
  */
-static union sbi_pmu_ctr_info *pmu_ctr_list;
+static DEFINE_IDR(pmu_ctr_list);
 static unsigned int riscv_pmu_irq;
 
 struct sbi_pmu_event_data {
@@ -243,14 +243,20 @@ static const struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_M
 
 static int pmu_sbi_ctr_get_width(int idx)
 {
-	return pmu_ctr_list[idx].width;
+	union sbi_pmu_ctr_info *info;
+
+	info = idr_find(&pmu_ctr_list, idx);
+	if (!info)
+		return 0;
+
+	return info->width;
 }
 
 static bool pmu_sbi_ctr_is_fw(int cidx)
 {
 	union sbi_pmu_ctr_info *info;
 
-	info = &pmu_ctr_list[cidx];
+	info = idr_find(&pmu_ctr_list, cidx);
 	if (!info)
 		return false;
 
@@ -264,8 +270,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
 	struct sbiret ret;
 	int idx;
-	uint64_t cbase = 0;
-	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters, 0);
+	u64 cbase = 0;
 	unsigned long cflags = 0;
 
 	if (event->attr.exclude_kernel)
@@ -274,8 +279,8 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 		cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
 
 	/* retrieve the available counter index */
-	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
-			cflags, hwc->event_base, hwc->config, 0);
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
+			rvpmu->cmask, cflags, hwc->event_base, hwc->config, 0);
 	if (ret.error) {
 		pr_debug("Not able to find a counter for event %lx config %llx\n",
 			hwc->event_base, hwc->config);
@@ -283,7 +288,8 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	}
 
 	idx = ret.value;
-	if (idx > rvpmu->num_counters || !pmu_ctr_list[idx].value)
+
+	if (!idr_find(&pmu_ctr_list, idx))
 		return -ENOENT;
 
 	/* Additional sanity check for the counter id */
@@ -393,7 +399,7 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 	struct sbiret ret;
-	union sbi_pmu_ctr_info info;
+	union sbi_pmu_ctr_info *info;
 	u64 val = 0;
 
 	if (pmu_sbi_is_fw_event(event)) {
@@ -402,10 +408,12 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 		if (!ret.error)
 			val = ret.value;
 	} else {
-		info = pmu_ctr_list[idx];
-		val = riscv_pmu_ctr_read_csr(info.csr);
+		info = idr_find(&pmu_ctr_list, idx);
+		if (!info)
+			return 0;
+		val = riscv_pmu_ctr_read_csr(info->csr);
 		if (IS_ENABLED(CONFIG_32BIT))
-			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
+			val = ((u64)riscv_pmu_ctr_read_csr(info->csr + 0x80)) << 31 | val;
 	}
 
 	return val;
@@ -447,27 +455,46 @@ static int pmu_sbi_find_num_ctrs(void)
 		return sbi_err_map_linux_errno(ret.error);
 }
 
-static int pmu_sbi_get_ctrinfo(int nctr)
+static int pmu_sbi_get_ctrinfo(int nctr, u64 *mask)
 {
 	struct sbiret ret;
 	int i, num_hw_ctr = 0, num_fw_ctr = 0;
-	union sbi_pmu_ctr_info cinfo;
-
-	pmu_ctr_list = kcalloc(nctr + 1, sizeof(*pmu_ctr_list), GFP_KERNEL);
-	if (!pmu_ctr_list)
-		return -ENOMEM;
+	union sbi_pmu_ctr_info *cinfo;
+	int err;
 
-	for (i = 0; i <= nctr; i++) {
+	for (i = 0; i < 8 * sizeof(*mask); i++) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
 			continue;
-		cinfo.value = ret.value;
-		if (cinfo.type == SBI_PMU_CTR_TYPE_FW)
+
+		*mask |= BIT(i);
+
+		cinfo = kzalloc(sizeof(*cinfo), GFP_KERNEL);
+		if (!cinfo)
+			return -ENOMEM;
+
+		err = idr_alloc(&pmu_ctr_list, cinfo, i, i + 1, GFP_KERNEL);
+		if (err < 0) {
+			pr_err("Failed to allocate PMU counter index %d\n", i);
+			kfree(cinfo);
+			return err;
+		}
+
+		cinfo->value = ret.value;
+		if (cinfo->type == SBI_PMU_CTR_TYPE_FW)
 			num_fw_ctr++;
 		else
 			num_hw_ctr++;
-		pmu_ctr_list[i].value = cinfo.value;
+
+		if (nctr == (num_fw_ctr + num_hw_ctr))
+			break;
+	}
+
+	if (nctr != (num_fw_ctr + num_hw_ctr)) {
+		pr_err("Invalid PMU counters: fw(%d) + hw(%d) != total(%d)\n",
+		       num_fw_ctr, num_hw_ctr, nctr);
+		return -EINVAL;
 	}
 
 	pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num_hw_ctr);
@@ -482,7 +509,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 	 * which may include counters that are not enabled yet.
 	 */
 	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-		  0, GENMASK_ULL(pmu->num_counters, 0), 0, 0, 0, 0);
+		  0, pmu->cmask, 0, 0, 0, 0);
 }
 
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
@@ -582,7 +609,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 		if (!event || !is_sampling_event(event))
 			continue;
 
-		info = &pmu_ctr_list[lidx];
+		info = idr_find(&pmu_ctr_list, lidx);
 		/* Do a sanity check */
 		if (!info || info->type != SBI_PMU_CTR_TYPE_HW)
 			continue;
@@ -698,6 +725,9 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	struct riscv_pmu *pmu = NULL;
 	int num_counters;
 	int ret = -ENODEV;
+	u64 cmask = 0;
+	void *entry;
+	int idx;
 
 	pr_info("SBI PMU extension is available\n");
 	pmu = riscv_pmu_alloc();
@@ -711,7 +741,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	}
 
 	/* cache all the information about counters now */
-	if (pmu_sbi_get_ctrinfo(num_counters))
+	if (pmu_sbi_get_ctrinfo(num_counters, &cmask))
 		goto out_free;
 
 	ret = pmu_sbi_setup_irqs(pmu, pdev);
@@ -720,7 +750,8 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 	}
-	pmu->num_counters = num_counters;
+
+	pmu->cmask = cmask;
 	pmu->ctr_start = pmu_sbi_ctr_start;
 	pmu->ctr_stop = pmu_sbi_ctr_stop;
 	pmu->event_map = pmu_sbi_event_map;
@@ -742,6 +773,11 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	return 0;
 
 out_free:
+	idr_for_each_entry(&pmu_ctr_list, entry, idx) {
+		idr_remove(&pmu_ctr_list, idx);
+		kfree(entry);
+	}
+
 	kfree(pmu);
 	return ret;
 }
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 46f9b6fe306e..b46e7e6d3209 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -45,7 +45,7 @@ struct riscv_pmu {
 
 	irqreturn_t	(*handle_irq)(int irq_num, void *dev);
 
-	int		num_counters;
+	u64		cmask;
 	u64		(*ctr_read)(struct perf_event *event);
 	int		(*ctr_get_idx)(struct perf_event *event);
 	int		(*ctr_get_width)(int idx);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
