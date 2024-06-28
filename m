Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D0FC2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkNj8g6PrW6VFqa/zoqrlYs/5pJ/hC+lEP6NkLQ9lls=; b=OrYcq1BL2vkoiZ
	VYYUKaV96r6l8KNXf4eZfz9X+MyRUrlFWaOE/rORWA72PlxPYQRJ4eHCATnLWY7cFi5zUsu5S0nY7
	Bkaf8UFaWri22Bh/aobxakRod6pQZ4H05kDYB66B6SFFkoNh2GgJNYhisJ2VCrwPQTh9Je7lt7vBf
	XcfSJ66eh3imR4X/y8Wi0qydAEI06+ufswXvXxafmKBI8NQByUbtv5NAUO18DzvsOsqOscK4zyS69
	+lC1tAh16CYIx1OyJqu8HuBMGDxYaoU5/dF9FrM30blcvTmFIWIuca+03QwygQ91Gzwt/rGNBNIWV
	rch9KKvKJuaV0B93JjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6PL-0000000Cxgg-1KDq;
	Fri, 28 Jun 2024 07:52:35 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6Ow-0000000CxOS-0OTi
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 07:52:11 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7067435d376so243226b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719561129; x=1720165929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fc3IuO6YmBNA8s0mWpyu1I7/gJNRg54J9fB76y1B8s=;
        b=Qkemds4v5TheORjCjp38+KXL1kinkNiuACNEBVOKhb2PCmJVwvDIGkI8WVI10Bf06x
         MGrcefQDf0pIbkVRTQCZV2mIlG6NPdlUPv3GM8LZrQfR/1Q5JgnmzCjyr2/JKdplgzV+
         9yjVH/uj3Jzbt54I24Y+GKJ3mWvxh0U0mo+YT5/NKEChDbc10BsuTWCN1slF4vCrwYf8
         mLd6UqFCD+bfgaiLgPNv/oAcVDQCV3pkvci7o1cClhODAskoRuWNoIBPOzrh36fTMkbG
         grVW2K448WfWfOY4DKDY6gvocdO/27aqoe/s4pK03o9VfbQwuuSX+UvzWc5jiI9rcsjB
         qNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719561129; x=1720165929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fc3IuO6YmBNA8s0mWpyu1I7/gJNRg54J9fB76y1B8s=;
        b=GNZoluvQmmXHWwQ3fQ/EDKwAaid6hfISFTUAMlQfk7uXMnPS9xC+vbkk4mPozk130H
         gFfj0gMIU5ZGj5IbcYrJZrUvxHaZiaPh3OAp2IyZbLpEykEZNYKTCo9fULHHKSe2uMXB
         6jtuz/+v5q5M1DbufSdOKcVXINf43VOTHVS9YZPuWDjaDbRWBPktmTi9+ZOIjy21wDby
         tPNSdleIKaWPRtj2xhU01OwfWFhzcZeJuyPOk3/sBbtu/81QRkm+ENXmgrHntzgVJxmL
         ObsyiqvhYI7TC8azAXwnUlG+uO8cg8VBVr69ZQ/so3b9I+nV9noLedBG/YsG9YBxruLY
         Z0/w==
X-Gm-Message-State: AOJu0YwPjkiHIXL8sdE4T1NpyhmAMLKL+CcSkTwWkKFmyZkq7NQTKIjb
	ONq7hvZJqPj05UJpYfYvE1Aescu4ZQRSvSL7TayOPs8xJRwKwCkLVFPzCDCjWXE=
X-Google-Smtp-Source: AGHT+IF3KuUY30k6Fxmt5zQarV5j2YsUdQtDIpW2glwEhLDfVpSu4XavuBx9WBfU01ZxprM4j4Fscw==
X-Received: by 2002:a05:6a00:2e96:b0:708:41c4:8849 with SMTP id d2e1a72fcca58-7085223cda8mr1543391b3a.9.1719561128579;
        Fri, 28 Jun 2024 00:52:08 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c69b53bf2sm685068a12.2.2024.06.28.00.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:52:08 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 28 Jun 2024 00:51:43 -0700
Subject: [PATCH v4 3/3] perf: RISC-V: Check standard event availability
MIME-Version: 1.0
Message-Id: <20240628-misc_perf_fixes-v4-3-e01cfddcf035@rivosinc.com>
References: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
In-Reply-To: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_005210_218929_0EFE5772 
X-CRM114-Status: GOOD (  20.29  )
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

From: Samuel Holland <samuel.holland@sifive.com>

The RISC-V SBI PMU specification defines several standard hardware and
cache events. Currently, all of these events are exposed to userspace,
even when not actually implemented. They appear in the `perf list`
output, and commands like `perf stat` try to use them.

This is more than just a cosmetic issue, because the PMU driver's .add
function fails for these events, which causes pmu_groups_sched_in() to
prematurely stop scheduling in other (possibly valid) hardware events.

Add logic to check which events are supported by the hardware (i.e. can
be mapped to some counter), so only usable events are reported to
userspace. Since the kernel does not know the mapping between events and
possible counters, this check must happen during boot, when no counters
are in use. Make the check asynchronous to minimize impact on boot time.

Fixes: e9991434596f ("RISC-V: Add perf platform driver based on SBI PMU extension")

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c    |  2 +-
 drivers/perf/riscv_pmu_sbi.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 04db1f993c47..bcf41d6e0df0 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -327,7 +327,7 @@ static long kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_att
 
 	event = perf_event_create_kernel_counter(attr, -1, current, kvm_riscv_pmu_overflow, pmc);
 	if (IS_ERR(event)) {
-		pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
+		pr_debug("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
 		return PTR_ERR(event);
 	}
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 94bc369a3454..4e842dcedfba 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -20,6 +20,7 @@
 #include <linux/cpu_pm.h>
 #include <linux/sched/clock.h>
 #include <linux/soc/andes/irq.h>
+#include <linux/workqueue.h>
 
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
@@ -114,7 +115,7 @@ struct sbi_pmu_event_data {
 	};
 };
 
-static const struct sbi_pmu_event_data pmu_hw_event_map[] = {
+static struct sbi_pmu_event_data pmu_hw_event_map[] = {
 	[PERF_COUNT_HW_CPU_CYCLES]		= {.hw_gen_event = {
 							SBI_PMU_HW_CPU_CYCLES,
 							SBI_PMU_EVENT_TYPE_HW, 0}},
@@ -148,7 +149,7 @@ static const struct sbi_pmu_event_data pmu_hw_event_map[] = {
 };
 
 #define C(x) PERF_COUNT_HW_CACHE_##x
-static const struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
+static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
 [PERF_COUNT_HW_CACHE_OP_MAX]
 [PERF_COUNT_HW_CACHE_RESULT_MAX] = {
 	[C(L1D)] = {
@@ -293,6 +294,34 @@ static const struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_M
 	},
 };
 
+static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
+			0, cmask, 0, edata->event_idx, 0, 0);
+	if (!ret.error) {
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
+			  ret.value, 0x1, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+	} else if (ret.error == SBI_ERR_NOT_SUPPORTED) {
+		/* This event cannot be monitored by any counter */
+		edata->event_idx = -EINVAL;
+	}
+}
+
+static void pmu_sbi_check_std_events(struct work_struct *work)
+{
+	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
+		pmu_sbi_check_event(&pmu_hw_event_map[i]);
+
+	for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++)
+		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++)
+			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
+				pmu_sbi_check_event(&pmu_cache_event_map[i][j][k]);
+}
+
+static DECLARE_WORK(check_std_events_work, pmu_sbi_check_std_events);
+
 static int pmu_sbi_ctr_get_width(int idx)
 {
 	return pmu_ctr_list[idx].width;
@@ -478,6 +507,12 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	u64 raw_config_val;
 	int ret;
 
+	/*
+	 * Ensure we are finished checking standard hardware events for
+	 * validity before allowing userspace to configure any events.
+	 */
+	flush_work(&check_std_events_work);
+
 	switch (type) {
 	case PERF_TYPE_HARDWARE:
 		if (config >= PERF_COUNT_HW_MAX)
@@ -1359,6 +1394,9 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_unregister;
 
+	/* Asynchronously check which standard events are available */
+	schedule_work(&check_std_events_work);
+
 	return 0;
 
 out_unregister:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
