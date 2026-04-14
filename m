Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CA0F531ED
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FZoUWSwHme9llfzdPuTTqqnf7xbjoaSi+HWFFxvpGc=; b=cdk7HURGNG19IK
	2xQ+rR/2Oa3rZLBRNq5Lvb0cy4H1Yg8DiTWYjQDAyouPzNM8GaRoUllC+FmbJwlR5Ni31us5rvNzw
	BtItIcUaZGnk90SgrD2ES14CkHstApl+njuVzRjrO6kO3O8c3kig+A8ozlbnl+iko5cLi7sxJXrzj
	mWk5qdUvZBytnDd6OStRcCrdamhfmu8jEhDAfvZLFNoV7Zjs2SKRsFiEbzAXm9vgeGr2UL2j8b+ij
	FV0aQ3D4W327tMu0/XncseVckQYdBzA1dVF2As5qrnfJNvXTDo1irsBJMjKCsYcp7a+CUzrE7ZzYr
	4O2A8MNraVbWSELHY8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgH-0000000GemZ-1q5T;
	Tue, 14 Apr 2026 03:43:17 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgE-0000000Geit-1HAz
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138129;
	bh=/8YEo9Fpa6X2nfI8zB5cPmwLZMnhM0EVOr5H8PO1hcI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=ECSD64TXCSb/ryEM1Z2RPKkrBJr305jPr/ctnrgPdFu8/uUGVthEYWAtAL3tZLi0G
	 xeD5roNQRI29k4qoHpy33ONWoGmOjlpw41NjYCi5B9a7aju8A3Pb/Fjc5zCbteau4j
	 JjHoubP2+ehRc2ifOrqYBo2icdIomRWstBkwDq4s=
X-QQ-mid: zesmtpsz5t1776138120ted4d29b0
X-QQ-Originating-IP: kl3+y6DFT4YtzEPa1Z5e8/kbAEH78IRgrQ/pQRrO5x0=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:41:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2782345312967798588
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gregkh@linuxfoundation.org,
	alexander.shishkin@linux.intel.com,
	irogers@google.com
Cc: coresight@lists.linaro.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	anup.patel@oss.qualcomm.com,
	mayuresh.chitale@oss.qualcomm.com,
	zhuangqiubin@linux.spacemit.com
Subject: [RFC PATCH 01/12] coresight: Add RISC-V support to CoreSight tracing
Date: Tue, 14 Apr 2026 11:41:42 +0800
Message-Id: <20260414034153.3272485-2-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NJVYoP7aqd/U+/B+MBoPySiiE89XjkOOjVfKFZ++dtVL6nRRLIr+stvP
	uGFdlVio6x6Y2e0QjysRLiIKo8EFVMLffsWwoEXqSZFjXOPoG3rSAsaLs0FLWkklLkkWxSr
	IG+aMiBto/SWijjNOrNGNCRVpnN7C1ZYFde7NDb8HVDpJpe/Hb5KN36eknndx+cUp98wXsb
	Wyijx1Kx9zy/VVQlbWrAt20zP4kwK+389N/cYf+nj2dXN9ob6Yqn0rmxq3b04EHwNkvs/VV
	OPpbra1AIR+B4M/pZyxpCD3KRf9K0amXdbc/VZxG6p/pke2x5zMut4QGGQcg2vdzWaNPYi+
	F3ry22dTZq7Y4vvhidnD5310k5ziKLBfwCphnVSoCb9grksA+D9qgbuLGrSJsLrax5RCyM7
	F3FEaMQ4DsLanpF31kjbPYK1qi5FUSBpNHlPrH4U5xAiF7Uwn6k+c6sZlSqAVTBokwREDlU
	Po7dBu8s9KlCywNw5OgDJt4UT3elpf1jO5UzCbwOIQY8KVtfsU66kgILND3Mbbhj0vMOBhg
	gTbr755Ib1PA2kCmt196UM3i2iFrf01XREPXfifeQHKI+Bm8MdR855Sujd97y4yLdznr1Wg
	+UiFRnid/MOwc/Snzsxx3ScoA75/mSGLUr/M3ud+hqINV/wbtey+T0SgqjvxPovLkkPpm0a
	Ge4WZ/eQx667YW7GHLgFBjUX096xtGghcE+3vR4D2VsO/01qKTi+jTCHKXzcM+4gSsk013a
	8ZKfUJvsjd4jLbotycUXKrp2B/aC63VoMzuLgKztRv4/iQXcn28ST60mly+JNkIFPfvEisa
	mH9GRJjIw0FshydapY/VkNzeFVA1kQnmZISBD1vicX2b0UhOChKAdVidnD2m26VHvGh+OHj
	I83iuRKIf0s0aHl7u61jYLH0j1kEZ6u2U0+LJ2c4hLHLWJIxobGbOv4Mg+pocfAY9jmtjKF
	DbhqTqEkThO6uGaYb/IMpTmB9jba4ViOJ4bDfsSI/wHhzpvaqS1mBFy0oFbz/YUoS4SEivt
	+cOubHFqQ1OMbxeo7TNfdZIFEiUz7Ao6PGECZY0XxSMl8mxf2WtJrhmnxQrereI6oR/RKUR
	IyHx3ddoJHr+5d3QXsTit1cAxxbjW7fDA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_204315_261086_D1B6E1FA 
X-CRM114-Status: GOOD (  13.07  )
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

From: liangzhen <zhen.liang@spacemit.com>

Enable CoreSight tracing support on RISC-V architecture by:
- Adding RISC-V to Kconfig dependencies for CoreSight
- Replacing ARM-specific memory barriers (isb, dmb) with
  RISC-V equivalents (local_flush_icache_all, __mb)
- Removing ARM-specific header dependencies:
  perf/arm_pmu.h, asm/smp_plat.h
- Adding PMU format attribute macros for cross-architecture
  support

This allows CoreSight tracing infrastructure to work on RISC-V
systems while maintaining compatibility with existing ARM/ARM64
implementations.

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 drivers/hwtracing/Kconfig                     |  2 ++
 drivers/hwtracing/coresight/Kconfig           |  2 +-
 drivers/hwtracing/coresight/coresight-core.c  |  8 +++++++
 .../hwtracing/coresight/coresight-etm-perf.c  |  1 -
 .../hwtracing/coresight/coresight-etm-perf.h  | 21 +++++++++++++++++++
 .../hwtracing/coresight/coresight-platform.c  |  1 -
 .../hwtracing/coresight/coresight-tmc-etf.c   |  4 ++++
 .../hwtracing/coresight/coresight-tmc-etr.c   |  4 ++++
 8 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..167ff172dd72 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "HW tracing support"
 
+source "drivers/hwtracing/coresight/Kconfig"
+
 source "drivers/hwtracing/stm/Kconfig"
 
 source "drivers/hwtracing/intel_th/Kconfig"
diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 6a4239ebb582..2b1ebe3f614d 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -4,7 +4,7 @@
 #
 menuconfig CORESIGHT
 	tristate "CoreSight Tracing Support"
-	depends on ARM || ARM64
+	depends on ARM || ARM64 || RISCV
 	depends on OF || ACPI
 	select ARM_AMBA
 	select PERF_EVENTS
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 80e26396ad0a..1ca202153cc4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -141,7 +141,11 @@ static void coresight_set_self_claim_tag_unlocked(struct coresight_device *csdev
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMSET);
+#if defined(__riscv)
+	local_flush_icache_all();
+#else
 	isb();
+#endif
 }
 
 void coresight_clear_self_claim_tag(struct csdev_access *csa)
@@ -158,7 +162,11 @@ void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
 {
 	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
+#if defined(__riscv)
+	local_flush_icache_all();
+#else
 	isb();
+#endif
 }
 EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 72017dcc3b7f..70a6aaffbf9d 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -13,7 +13,6 @@
 #include <linux/mm.h>
 #include <linux/init.h>
 #include <linux/perf_event.h>
-#include <linux/perf/arm_pmu.h>
 #include <linux/percpu-defs.h>
 #include <linux/slab.h>
 #include <linux/stringhash.h>
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 24d929428633..e48c0ad46db1 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -58,6 +58,27 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_cc_threshold_LO		0
 #define ATTR_CFG_FLD_cc_threshold_HI		11
 
+#define __GEN_PMU_FORMAT_ATTR(cfg, lo, hi)			\
+	(lo) == (hi) ? #cfg ":" #lo "\n" : #cfg ":" #lo "-" #hi
+
+#define _GEN_PMU_FORMAT_ATTR(cfg, lo, hi)			\
+	__GEN_PMU_FORMAT_ATTR(cfg, lo, hi)
+
+#define GEN_PMU_FORMAT_ATTR(name)				\
+	PMU_FORMAT_ATTR(name,					\
+	_GEN_PMU_FORMAT_ATTR(ATTR_CFG_FLD_##name##_CFG,		\
+			     ATTR_CFG_FLD_##name##_LO,		\
+			     ATTR_CFG_FLD_##name##_HI))
+
+#define _ATTR_CFG_GET_FLD(attr, cfg, lo, hi)			\
+	((((attr)->cfg) >> lo) & GENMASK_ULL(hi - lo, 0))
+
+#define ATTR_CFG_GET_FLD(attr, name)				\
+	_ATTR_CFG_GET_FLD(attr,					\
+			  ATTR_CFG_FLD_##name##_CFG,		\
+			  ATTR_CFG_FLD_##name##_LO,		\
+			  ATTR_CFG_FLD_##name##_HI)
+
 /**
  * struct etm_filter - single instruction range or start/stop configuration.
  * @start_addr:	The address to start tracing on.
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 0db64c5f4995..261ba6a75b86 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -14,7 +14,6 @@
 #include <linux/amba/bus.h>
 #include <linux/coresight.h>
 #include <linux/cpumask.h>
-#include <asm/smp_plat.h>
 
 #include "coresight-priv.h"
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 8882b1c4cdc0..dc366f4a5ca8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -661,7 +661,11 @@ static int tmc_panic_sync_etf(struct coresight_device *csdev)
 	 * Make sure all previous writes are ordered,
 	 * before we mark valid
 	 */
+#if defined(__riscv)
+	__mb();
+#else
 	dmb(sy);
+#endif
 	mdata->valid = true;
 	/*
 	 * Below order need to maintained, since crc of metadata
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4dc1defe27a5..ac379d1751e6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1883,7 +1883,11 @@ static int tmc_panic_sync_etr(struct coresight_device *csdev)
 	 * Make sure all previous writes are ordered,
 	 * before we mark valid
 	 */
+#if defined(__riscv)
+	__mb();
+#else
 	dmb(sy);
+#endif
 	mdata->valid = true;
 	/*
 	 * Below order need to maintained, since crc of metadata
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
