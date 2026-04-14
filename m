Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E2FF531EC
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pal979b1brd1QO7PHr8MiCkn2BYmY7QiGbA3z9CJW+8=; b=AE2UfcNey9fprB
	C9FVNlZpzJ8NmTGJp8ELAVPXWFuuOI8j21IgPgHj16AYDpp/Z+fK95sF3lxmE6R1zkiXOutv8Tda9
	KbunmaD3NysXFHPhB5biL0bnLTcRutFpTDYWkO6W5K4Z9t00HOhbgZYElNyiq9unfmU5JXvLfSSoG
	Oyc5bMfLf6awpbXPm05KGkUQG6gPGQvvajNpv9H2vcnsYYy8JWOTeJr+YSYEQdfQbP8vwkYjoVGkz
	OSq4ROEnn/jTwg3hl3wDtuAme30VUTLz5oaXrTs1KaSqvFoL9FYrmaV0GDXhPyKPFbV25SDtRercm
	pa2uRa3hxJzPztgl6Arw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgE-0000000Gekp-284x;
	Tue, 14 Apr 2026 03:43:14 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUg8-0000000Geic-17Mv
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138138;
	bh=0bSsvlTQPtgZft1En88dfC6LD9r9mTj0HchmPAInZpU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=k0SbFZfWRh209JfPEiLKWw2xiZmXcJZSD3QBdy2njNT5iLePmVw9F7t3aAj9yyIM1
	 lEXylyG6Faad9ZCZv2PIX3/pYY1BBvOq+VzLVCKef5OOWDD0teC/WSufnABrjj0nUD
	 vUURca+b7UV6k4xyUEDpu+c2vNJom4Ye2Rmzt1LM=
X-QQ-mid: zesmtpsz5t1776138128tf0e9a02d
X-QQ-Originating-IP: B8mNHFkPhmtdfZ4ttm3zwqIdnDeDr5Qm/4UPzqb8Tx0=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:42:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6506492689565388559
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
Subject: [RFC PATCH 03/12] coresight: Add RISC-V Trace Encoder driver
Date: Tue, 14 Apr 2026 11:41:44 +0800
Message-Id: <20260414034153.3272485-4-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Oaz+cfnT1hxDjixvVyokXMfgmg/BrcCIj7/lGLilvhyIJnrcR/zzYtcz
	whb/eTAEZ0QWc78bUWcIPMVXvtHQ1CUBswclOvNunnaWSaxGOIfOPqpe4jkp7ns7LXKjOna
	zGiAlk7BLFCw+PbOPuW5QhtwwqumbdDTPblH5NWUqAAaTDzzur9IUG8cvn2fZUC7IA00Lj7
	QbcGYDS88XrHCfdM+51LUfuy9nQIzBwJvJuGaaxsfV3ef/zF51J8QAZxXod0MRlkj+y3DyY
	Ux8AnbIYhuRDvgrXkMTfQZYWlFWkQye2b+Qslt06A62MplopLmh6/S9h7s/vHYtF8W7qMbe
	jLwkC8AjuHA+34f48z+cGdF3cIftzL9L/qyGJ+IW79NB8AGmPJ97AGMgaiYJnKgLUNBpewQ
	1e1jh0twkGlunu4kbAgfWiohIsh8UfSR4EDjBkTuvI73XiAJ7ol9g9dti+IMWRjucCfsRrg
	lHXIBulSgki/b2I+OnhITuQxBv/SW89VFhZfM7Hvh49x2RyX00/xTT3w47pIjdUlm9ZHvF8
	DhpA/j8zVrZTLD1skqpFzeKfwcu9/9uracq2OqXb57UDhl4GpzXfVL8PgGkNrizqvt1BO8c
	coL9RkvNdo1pQ7Jsqm9rqxJkFLH9ZwP33Qkzw76aIqTApTg3ZNRwv8FOT6opkvZ18cunSdi
	4KJtN6eN0VlYIjhF4EQ1VZdS2+x/Z1V+OTEIS/vf4i52/JtJzZwhWUb+npEbRHkWZqVurCz
	L2SYVtLPDOug4dplrojk7NjkvDoBTmLk/lmJTalG5VVjYgrWNkPtbfqwB4pv6AE7cPXi767
	DRyHvPIlMxBBAGy0BL2DdXr1NkLHGaW4V5ZVOUOW3pQZjzJKGMdIyZZliUtKl6CXlLJa3DN
	jQWKYcqlmpydDTphPEjTL58CovtE37UkJDqDU/kowYAIw8LBgk2eChtEWi+lphIlrw4BqS5
	iX6cc3Spn/FFB/sgcc5gDu4RTD4msAlCNj+PpuYLkId/RObQ0JS6FbwusH9EegodycujyiY
	94W+AVYe/zvQ4jINaC5gH7GIejaVi3Iy3TAkUYiKuBEFDpIdYvU75bz4iy2XVPOqR1J/QRl
	6BXUKKYsm6C9CjaBy75AP4Bkh6IqGHhmEpsiMOE49OuiVr6lmdMBKq20OIemm0aYA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_204310_360365_7BE366CD 
X-CRM114-Status: GOOD (  20.18  )
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

Add initial implementation of RISC-V trace encoder
driver. The encoder is defined in the RISC-V Trace
Control Interface specification.

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 drivers/hwtracing/coresight/Kconfig           |  12 +
 drivers/hwtracing/coresight/Makefile          |   2 +
 .../coresight/rvtrace-encoder-core.c          | 524 ++++++++++++++++++
 .../coresight/rvtrace-encoder-sysfs.c         | 313 +++++++++++
 drivers/hwtracing/coresight/rvtrace-encoder.h | 143 +++++
 5 files changed, 994 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder-core.c
 create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c
 create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 5adeaf78a080..3e46728f2482 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -288,4 +288,16 @@ config RVTRACE
 	  dynamically aggregated with CoreSight trace infrastructure
 	  at run time to form a complete trace path.
 
+config RVTRACE_ENCODER
+	tristate "RISCV Trace Encoder driver"
+	depends on RVTRACE
+	help
+	  This driver provides support for the Trace Encoder module, tracing
+	  the instructions that a processor is executing. This is primarily
+	  useful for instruction level tracing. Depending on the implemented
+	  version data tracing may also be available.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-encoder.
+
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index c21a9e25e148..9a526b1fb95a 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -59,3 +59,5 @@ coresight-ctcu-y := coresight-ctcu-core.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
 obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o
+obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
+rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
diff --git a/drivers/hwtracing/coresight/rvtrace-encoder-core.c b/drivers/hwtracing/coresight/rvtrace-encoder-core.c
new file mode 100644
index 000000000000..149a3cd97602
--- /dev/null
+++ b/drivers/hwtracing/coresight/rvtrace-encoder-core.c
@@ -0,0 +1,524 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#include <linux/moduleparam.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/bitfield.h>
+#include <linux/smp.h>
+#include <linux/coresight.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rvtrace.h>
+
+#include "rvtrace-encoder.h"
+#include "coresight-etm-perf.h"
+
+static int boot_enable;
+module_param_named(boot_enable, boot_enable, int, 0444);
+
+static struct rvtrace_component *rvtrace_cpu_encoder[NR_CPUS];
+
+static int encoder_cpu_id(struct coresight_device *csdev)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(csdev->dev.parent);
+
+	return comp->cpu;
+}
+
+static void encoder_set_config(struct rvtrace_component *comp)
+{
+	u32 val;
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+	struct device *dev = &encoder_data->csdev->dev;
+	struct encoder_config *config = &encoder_data->config;
+
+	/* Configure Trace Encoder features register */
+	val = (FIELD_PREP(RVTRACE_ENCODER_INST_NO_ADDR_DIFF, config->inst_na_diff) |
+		   FIELD_PREP(RVTRACE_ENCODER_INST_NO_TRAP_ADDR, config->inst_nt_addr) |
+		   FIELD_PREP(RVTRACE_ENCODER_INST_EN_SEQUENTIAL_JUMP, config->seq_jump) |
+		   FIELD_PREP(RVTRACE_ENCODER_INST_EN_IMPLICIT_RETURN, config->impl_ret) |
+		   FIELD_PREP(RVTRACE_ENCODER_INST_EN_BRANCH_PREDICTION, config->branch_pred) |
+		   FIELD_PREP(RVTRACE_ENCODER_INST_IMPLICIT_RETURN_MODE, config->impl_ret_mode) |
+		   FIELD_PREP(RVTRACE_ENCODER_INST_EN_REPEQTED_HISTORT, config->rep_hist) |
+		   FIELD_PREP(RVTRACE_ENCODER_INST_EN_ALL_JUMPS, config->all_jumps) |
+		   FIELD_PREP(RVTRACE_ENCODER_INST_EXTEND_ADDR_MSB, config->ext_msb) |
+		   FIELD_PREP(RVTRACE_ENCODER_SRCID, config->srcid) |
+		   FIELD_PREP(RVTRACE_ENCODER_SRCBITS, config->srcb));
+
+	writel_relaxed(val, comp->base + RVTRACE_ENCODER_INST_FTRS_OFFSET);
+
+	/* Check Trace Encoder features register WARL bits could be set */
+	val = readl_relaxed(comp->base + RVTRACE_ENCODER_INST_FTRS_OFFSET);
+	if (BMVAL(val, 0, 0) != config->inst_na_diff) {
+		dev_warn(dev, "trTeInstNoAddrDiff %#x is not supported\n",
+			 config->inst_na_diff);
+		config->inst_na_diff = BMVAL(val, 0, 0);
+	}
+
+	if (BMVAL(val, 1, 1) != config->inst_nt_addr) {
+		dev_warn(dev, "trTeInstNoTrapAddr %#x is not supported\n",
+			 config->inst_nt_addr);
+		config->inst_nt_addr = BMVAL(val, 1, 1);
+	}
+
+	if (BMVAL(val, 2, 2) != config->seq_jump) {
+		dev_warn(dev, "trTeInstEnSequentialJump %#x is not supported\n",
+			 config->seq_jump);
+		config->seq_jump = BMVAL(val, 2, 2);
+	}
+
+	if (BMVAL(val, 3, 3) != config->impl_ret) {
+		dev_warn(dev, "trTeInstEnImplicitReturn %#x is not supported\n",
+			 config->impl_ret);
+		config->impl_ret = BMVAL(val, 3, 3);
+	}
+
+	if (BMVAL(val, 4, 4) != config->branch_pred) {
+		dev_warn(dev, "trTeInstEnBranchPrediction %#x is not supported\n",
+			 config->branch_pred);
+		config->branch_pred = BMVAL(val, 4, 4);
+	}
+
+	if (BMVAL(val, 5, 5) != config->jump_target_cache) {
+		dev_warn(dev, "trTeInstEnJumpTargetCache %#x is not supported\n",
+			 config->jump_target_cache);
+		config->jump_target_cache = BMVAL(val, 5, 5);
+	}
+
+	if (BMVAL(val, 6, 7) != config->impl_ret_mode) {
+		dev_warn(dev, "trTeInstImplicitReturnMode %#x is not supported\n",
+			 config->impl_ret_mode);
+		config->impl_ret_mode = BMVAL(val, 6, 7);
+	}
+
+	if (BMVAL(val, 8, 8) != config->rep_hist) {
+		dev_warn(dev, "trTeInstEnRepeatedHistory %#x is not supported\n",
+			 config->rep_hist);
+		config->rep_hist = BMVAL(val, 8, 8);
+	}
+
+	if (BMVAL(val, 9, 9) != config->all_jumps) {
+		dev_warn(dev, "trTeInstEnAllJumps %#x is not supported\n",
+			 config->all_jumps);
+		config->all_jumps = BMVAL(val, 9, 9);
+	}
+
+	if (BMVAL(val, 10, 10) != config->ext_msb) {
+		dev_warn(dev, " trTeInstExtendAddrMSB %#x is not supported\n",
+			 config->ext_msb);
+		config->ext_msb = BMVAL(val, 10, 10);
+	}
+
+	if (BMVAL(val, 16, 27) != config->srcid) {
+		dev_warn(dev, "trTeSrcID %#x is not supported\n",
+			 config->srcid);
+		config->srcid = BMVAL(val, 16, 27);
+	}
+
+	if (BMVAL(val, 28, 31) != config->srcb) {
+		dev_warn(dev, "trTeSrcBits %#x is not supported\n",
+			 config->srcb);
+		config->srcb = BMVAL(val, 28, 31);
+	}
+
+	/* Configure Trace Encoder control register */
+	val = readl_relaxed(comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= (FIELD_PREP(RVTRACE_ENCODER_INSTMODE, ENCODER_INSTMODE_HTM) |
+		   FIELD_PREP(RVTRACE_ENCODER_CONTEXT, config->context) |
+		   FIELD_PREP(RVTRACE_ENCODER_INSTTRIGEN, config->inst_trigger) |
+		   FIELD_PREP(RVTRACE_ENCODER_INST_STALL_EN, config->inst_stall) |
+		   FIELD_PREP(RVTRACE_ENCODER_INHBSRC, config->inhb_src) |
+		   FIELD_PREP(RVTRACE_ENCODER_INSTSYNC_MODE, config->inst_syncmode) |
+		   FIELD_PREP(RVTRACE_ENCODER_INSTSYNC_MAX, config->inst_syncmax));
+
+
+	writel_relaxed(val, comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	/* Check Trace Encoder control register WARL bits could be set */
+	val = readl_relaxed(comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	if (BMVAL(val, 9, 9) != config->context) {
+		dev_warn(dev, "trTeContext %#x is not supported\n",
+			 config->context);
+		config->context = BMVAL(val, 9, 9);
+	}
+
+	if (BMVAL(val, 11, 11) != config->inst_trigger) {
+		dev_warn(dev, "trTeInstTrigEnable %#x is not supported\n",
+			 config->inst_trigger);
+		config->inst_trigger = BMVAL(val, 11, 11);
+	}
+
+	if (BMVAL(val, 13, 13) != config->inst_stall) {
+		dev_warn(dev, "trTeInstStallEna %#x is not supported\n",
+			 config->inst_stall);
+		config->inst_stall = BMVAL(val, 13, 13);
+	}
+
+	if (BMVAL(val, 15, 15) != config->inhb_src) {
+		dev_warn(dev, "trTeInhibitSrc %#x is not supported\n",
+			 config->inhb_src);
+		config->inhb_src = BMVAL(val, 15, 15);
+	}
+
+	if (BMVAL(val, 20, 23) != config->inst_syncmax) {
+		dev_warn(dev, "trTeInstSyncMax %#x is not supported\n",
+			 config->inst_syncmax);
+		config->inst_syncmax = BMVAL(val, 20, 23);
+	}
+}
+
+static int encoder_enable_hw(struct rvtrace_component *comp)
+{
+	u32 val;
+	int ret;
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+
+	if (!comp->was_reset) {
+		ret = rvtrace_component_reset(comp);
+		if (ret)
+			goto done;
+	}
+
+	encoder_set_config(comp);
+
+	ret = rvtrace_enable_component(comp);
+	if (ret)
+		goto done;
+
+	val = readl_relaxed(comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= RVTRACE_ENCODER_ITRACE;
+	writel_relaxed(val, comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1);
+
+done:
+	dev_dbg(&encoder_data->csdev->dev, "cpu: %d enable smp call done: %d\n",
+		comp->cpu, ret);
+	return ret;
+}
+
+static void encoder_enable_hw_smp_call(void *info)
+{
+	struct component_enable_arg *arg = info;
+
+	if (WARN_ON(!arg))
+		return;
+	arg->rc = encoder_enable_hw(arg->comp);
+}
+
+static int encoder_enable_perf(struct coresight_device *csdev)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(csdev->dev.parent);
+
+	if (WARN_ON_ONCE(comp->cpu != smp_processor_id()))
+		return -EINVAL;
+
+	return encoder_enable_hw(comp);
+}
+
+static int encoder_enable_sysfs(struct coresight_device *csdev)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(csdev->dev.parent);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+	struct component_enable_arg arg = { };
+	int ret;
+
+	spin_lock(&encoder_data->spinlock);
+
+	/*
+	 * Executing encoder_enable_hw on the cpu whose trace encoder is being
+	 * enabled ensures that register writes occur when cpu is powered.
+	 */
+	arg.comp = comp;
+	ret = smp_call_function_single(comp->cpu,
+				       encoder_enable_hw_smp_call, &arg, 1);
+	if (!ret)
+		ret = arg.rc;
+	if (!ret)
+		encoder_data->sticky_enable = true;
+
+	spin_unlock(&encoder_data->spinlock);
+
+	if (!ret)
+		dev_dbg(&csdev->dev, "Trace Encoder tracing enabled\n");
+	return ret;
+}
+
+static int encoder_enable(struct coresight_device *csdev, struct perf_event *event,
+			  enum cs_mode mode, __maybe_unused struct coresight_path *path)
+{
+	int ret;
+
+	if (!coresight_take_mode(csdev, mode)) {
+		/* Someone is already using the tracer */
+		return -EBUSY;
+	}
+
+	switch (mode) {
+	case CS_MODE_SYSFS:
+		ret = encoder_enable_sysfs(csdev);
+		break;
+	case CS_MODE_PERF:
+		ret = encoder_enable_perf(csdev);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	/* The tracer didn't start */
+	if (ret)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+
+	return ret;
+}
+
+static void encoder_disable_hw(struct rvtrace_component *comp)
+{
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+
+	if (rvtrace_disable_component(comp))
+		dev_err(&encoder_data->csdev->dev,
+			"timeout while waiting for Trace Encoder become disabled\n");
+
+	if (rvtrace_comp_is_empty(comp))
+		dev_err(&encoder_data->csdev->dev,
+			"timeout while waiting for all generated trace have been emitted\n");
+
+	dev_dbg(&encoder_data->csdev->dev, "cpu: %d disable smp call done\n", comp->cpu);
+}
+
+static void encoder_disable_sysfs_smp_call(void *info)
+{
+	struct rvtrace_component *comp = info;
+
+	encoder_disable_hw(comp);
+}
+
+static void encoder_disable_sysfs(struct coresight_device *csdev)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(csdev->dev.parent);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+
+	/*
+	 * Taking hotplug lock here protects from clocks getting disabled
+	 * with tracing being left on (crash scenario) if user disable occurs
+	 * after cpu online mask indicates the cpu is offline but before the
+	 * DYING hotplug callback is serviced by the trace encoder driver.
+	 */
+	cpus_read_lock();
+	spin_lock(&encoder_data->spinlock);
+
+	/*
+	 * Executing encoder_disable_hw on the cpu whose trace encoder is being
+	 * disabled ensures that register writes occur when cpu is powered.
+	 */
+	smp_call_function_single(comp->cpu, encoder_disable_sysfs_smp_call, comp, 1);
+
+	spin_unlock(&encoder_data->spinlock);
+	cpus_read_unlock();
+
+	dev_dbg(&csdev->dev, "Trace Encoder tracing disabled\n");
+}
+
+static void encoder_disable_perf(struct coresight_device *csdev)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(csdev->dev.parent);
+
+	if (WARN_ON_ONCE(comp->cpu != smp_processor_id()))
+		return;
+
+	encoder_disable_hw(comp);
+}
+
+static void encoder_disable(struct coresight_device *csdev,
+			    struct perf_event *event)
+{
+	enum cs_mode mode;
+
+	/*
+	 * For as long as the tracer isn't disabled another entity can't
+	 * change its status.  As such we can read the status here without
+	 * fearing it will change under us.
+	 */
+	mode = coresight_get_mode(csdev);
+
+	switch (mode) {
+	case CS_MODE_DISABLED:
+		break;
+	case CS_MODE_SYSFS:
+		encoder_disable_sysfs(csdev);
+		break;
+	case CS_MODE_PERF:
+		encoder_disable_perf(csdev);
+		break;
+	default:
+		WARN_ON_ONCE(mode);
+		return;
+	}
+
+	if (mode)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+}
+
+static const struct coresight_ops_source encoder_source_ops = {
+	.cpu_id		= encoder_cpu_id,
+	.enable         = encoder_enable,
+	.disable        = encoder_disable,
+};
+
+static const struct coresight_ops encoder_cs_ops = {
+	.source_ops     = &encoder_source_ops,
+};
+
+void encoder_set_default(struct rvtrace_component *comp)
+{
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+
+	if (WARN_ON_ONCE(!encoder_data))
+		return;
+
+	struct encoder_config *config = &encoder_data->config;
+
+	/* Enable sending trace messages/fields with scontext/mcontext values
+	 * and/or privilege levels
+	 */
+	config->context = true;
+
+	/* Allows trTeInstTracing to be set or cleared by Trace-on and Trace-
+	 * off signals generated by the corresponding trigger module.
+	 */
+	config->inst_trigger = true;
+
+	/* Enable periodic instruction trace synchronization */
+	config->inst_syncmode = ENCODER_SYNCMODE_CLOCK;
+	config->inst_syncmax = 0x6;
+
+	/* trace source ID*/
+	config->srcid = encoder_cpu_id(encoder_data->csdev);
+	config->srcb = 0xc;
+}
+
+static int encoder_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct coresight_platform_data *pdata;
+	struct encoder_data *encoder_data;
+	struct rvtrace_component *comp;
+	struct coresight_desc desc = { 0 };
+
+	comp = rvtrace_register_component(pdev);
+	if (IS_ERR(comp))
+		return PTR_ERR(comp);
+
+	encoder_data = devm_kzalloc(dev, sizeof(*encoder_data), GFP_KERNEL);
+	if (!encoder_data)
+		return -ENOMEM;
+
+	spin_lock_init(&encoder_data->spinlock);
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	pdev->dev.platform_data = pdata;
+
+	platform_set_drvdata(pdev, comp);
+
+	desc.name = devm_kasprintf(dev, GFP_KERNEL, "encoder%d", comp->cpu);
+	if (!desc.name)
+		return -ENOMEM;
+
+	desc.access = CSDEV_ACCESS_IOMEM(comp->base);
+	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
+	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_PROC;
+	desc.ops = &encoder_cs_ops;
+	desc.pdata = pdata;
+	desc.dev = dev;
+	desc.groups = trace_encoder_groups;
+	encoder_data->csdev = coresight_register(&desc);
+	if (IS_ERR(encoder_data->csdev))
+		return PTR_ERR(encoder_data->csdev);
+
+	ret = etm_perf_symlink(encoder_data->csdev, true);
+	if (ret) {
+		coresight_unregister(encoder_data->csdev);
+		return ret;
+	}
+
+	comp->id.data = encoder_data;
+
+	rvtrace_cpu_encoder[comp->cpu] = comp;
+
+	encoder_set_default(comp);
+
+	dev_info(dev, "CPU%d: Trace Encoder initialized\n", comp->cpu);
+
+	if (boot_enable) {
+		coresight_enable_sysfs(encoder_data->csdev);
+		encoder_data->boot_enable = true;
+	}
+
+	return 0;
+}
+
+static void clear_encodata(void *info)
+{
+	int cpu = *(int *)info;
+
+	rvtrace_cpu_encoder[cpu]->id.data = NULL;
+	rvtrace_cpu_encoder[cpu] = NULL;
+}
+
+static void encoder_remove(struct platform_device *pdev)
+{
+	struct rvtrace_component *comp = platform_get_drvdata(pdev);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+
+	etm_perf_symlink(encoder_data->csdev, false);
+
+	/*
+	 * Taking hotplug lock here to avoid racing between encoder_remove and
+	 * CPU hotplug call backs.
+	 */
+	cpus_read_lock();
+	/*
+	 * The readers for encodata[] are CPU hotplug call backs
+	 * and PM notification call backs. Change encodata[i] on
+	 * CPU i ensures these call backs has consistent view
+	 * inside one call back function.
+	 */
+	if (smp_call_function_single(comp->cpu, clear_encodata, &comp->cpu, 1)) {
+		rvtrace_cpu_encoder[comp->cpu]->id.data = NULL;
+		rvtrace_cpu_encoder[comp->cpu] = NULL;
+	}
+
+	cpus_read_unlock();
+
+	coresight_unregister(encoder_data->csdev);
+}
+
+static const struct of_device_id encoder_match[] = {
+	{.compatible = "riscv,trace-encoder"},
+	{},
+};
+
+static struct platform_driver encoder_driver = {
+	.probe = encoder_probe,
+	.remove = encoder_remove,
+	.driver = {
+		.name = "trace-encoder",
+		.of_match_table = encoder_match,
+	},
+};
+
+module_platform_driver(encoder_driver);
+
+MODULE_DESCRIPTION("RISC-V Trace Encoder Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c b/drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c
new file mode 100644
index 000000000000..c89af4cb591a
--- /dev/null
+++ b/drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/sysfs.h>
+#include <linux/rvtrace.h>
+#include "rvtrace-encoder.h"
+#include "coresight-priv.h"
+
+static ssize_t cpu_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+
+	val = comp->cpu;
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+}
+static DEVICE_ATTR_RO(cpu);
+
+static ssize_t reset_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t size)
+{
+	unsigned long val;
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	spin_lock(&encoder_data->spinlock);
+
+	if (val) {
+		encoder_set_default(comp);
+		if (rvtrace_component_reset(comp)) {
+			comp->was_reset = false;
+			spin_unlock(&encoder_data->spinlock);
+			return -EINVAL;
+		}
+	}
+
+	spin_unlock(&encoder_data->spinlock);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset);
+
+static struct attribute *trace_encoder_attrs[] = {
+	&dev_attr_cpu.attr,
+	&dev_attr_reset.attr,
+	NULL,
+};
+
+static struct attribute *trace_encoder_mgmt_attrs[] = {
+	coresight_simple_reg32(control, RVTRACE_COMPONENT_CTRL_OFFSET),
+	coresight_simple_reg32(impl, RVTRACE_COMPONENT_IMPL_OFFSET),
+	coresight_simple_reg32(features, RVTRACE_ENCODER_INST_FTRS_OFFSET),
+	NULL,
+};
+
+#define encoder_simple_rw(name)						    \
+static ssize_t name##_show(struct device *dev,				    \
+			   struct device_attribute *attr, char *buf)	    \
+{									    \
+	unsigned long val;						    \
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);	    \
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);   \
+	struct encoder_config *config = &encoder_data->config;		    \
+									    \
+	val = config->name;						    \
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);		    \
+}									    \
+									    \
+static ssize_t name##_store(struct device *dev,				    \
+			    struct device_attribute *attr,		    \
+			    const char *buf, size_t size)		    \
+{									    \
+	unsigned long val;						    \
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);	    \
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);   \
+	struct encoder_config *config = &encoder_data->config;		    \
+									    \
+	if (kstrtoul(buf, 16, &val))					    \
+		return -EINVAL;						    \
+									    \
+	spin_lock(&encoder_data->spinlock);				    \
+	config->name = val;						    \
+	spin_unlock(&encoder_data->spinlock);				    \
+									    \
+	return size;							    \
+}									    \
+static DEVICE_ATTR_RW(name)
+
+static const char *const instmodes_str[] = {
+	[ENCODER_INSTMODE_OFF]	    = "off",
+	[ENCODER_INSTMODE_RESV1]    = "resv1",
+	[ENCODER_INSTMODE_BTM]	    = "btm",
+	[ENCODER_INSTMODE_RESV4]    = "resv4",
+	[ENCODER_INSTMODE_RESV5]    = "resv5",
+	[ENCODER_INSTMODE_HTM]	    = "htm",
+	[ENCODER_INSTMODE_RESV7]    = "resv7",
+};
+
+static ssize_t instmode_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+
+	val = readl_relaxed(comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = BMVAL(val, 4, 6);
+
+	return sysfs_emit(buf, "%s\n", instmodes_str[val]);
+}
+static DEVICE_ATTR_RO(instmode);
+
+static const char *const inst_syncmodes_str[] = {
+	[ENCODER_SYNCMODE_OFF]		= "off",
+	[ENCODER_SYNCMODE_MESSAGES]	= "messages",
+	[ENCODER_SYNCMODE_CLOCK]	= "clock",
+	[ENCODER_SYNCMODE_INSTRUCTION]	= "instruction"
+};
+
+static ssize_t inst_syncmodes_available_show(struct device *dev,
+					     struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s %s %s %s\n",
+			    inst_syncmodes_str[ENCODER_SYNCMODE_OFF],
+			    inst_syncmodes_str[ENCODER_SYNCMODE_MESSAGES],
+			    inst_syncmodes_str[ENCODER_SYNCMODE_CLOCK],
+			    inst_syncmodes_str[ENCODER_SYNCMODE_INSTRUCTION]);
+}
+static DEVICE_ATTR_RO(inst_syncmodes_available);
+
+static ssize_t inst_syncmode_preferred_show(struct device *dev,
+					    struct device_attribute *attr, char *buf)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+	struct encoder_config *config = &encoder_data->config;
+
+	return sysfs_emit(buf, "%s\n", inst_syncmodes_str[config->inst_syncmode]);
+}
+
+static ssize_t inst_syncmode_preferred_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t size)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+	struct encoder_config *config = &encoder_data->config;
+
+	if (sysfs_streq(buf, inst_syncmodes_str[ENCODER_SYNCMODE_OFF]))
+		config->inst_syncmode = ENCODER_SYNCMODE_OFF;
+	else if (sysfs_streq(buf, inst_syncmodes_str[ENCODER_SYNCMODE_MESSAGES]))
+		config->inst_syncmode = ENCODER_SYNCMODE_MESSAGES;
+	else if (sysfs_streq(buf, inst_syncmodes_str[ENCODER_SYNCMODE_CLOCK]))
+		config->inst_syncmode = ENCODER_SYNCMODE_CLOCK;
+	else if (sysfs_streq(buf, inst_syncmodes_str[ENCODER_SYNCMODE_INSTRUCTION]))
+		config->inst_syncmode = ENCODER_SYNCMODE_INSTRUCTION;
+	else
+		return -EINVAL;
+
+	return size;
+}
+static DEVICE_ATTR_RW(inst_syncmode_preferred);
+
+static ssize_t format_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+
+	val = readl_relaxed(comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = BMVAL(val, 24, 26);
+
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+}
+static DEVICE_ATTR_RO(format);
+
+encoder_simple_rw(context);
+encoder_simple_rw(inst_trigger);
+encoder_simple_rw(inst_stall);
+encoder_simple_rw(inhb_src);
+encoder_simple_rw(inst_syncmax);
+
+static struct attribute *trace_encoder_control_attrs[] = {
+	&dev_attr_instmode.attr,
+	&dev_attr_context.attr,
+	&dev_attr_inst_trigger.attr,
+	&dev_attr_inst_stall.attr,
+	&dev_attr_inhb_src.attr,
+	&dev_attr_inst_syncmodes_available.attr,
+	&dev_attr_inst_syncmode_preferred.attr,
+	&dev_attr_inst_syncmax.attr,
+	&dev_attr_format.attr,
+	NULL,
+};
+
+static const char *const inst_implicit_return_modes_str[] = {
+	[ENCODER_IMPLICITRETURNMODE_NOT_SUPPORTED]	= "off",
+	[ENCODER_IMPLICITRETURNMODE_SIMPLE_COUNTING]	= "simple",
+	[ENCODER_IMPLICITRETURNMODE_PARTIAL_ADDRESS]	= "partial",
+	[ENCODER_IMPLICITRETURNMODE_FULL_ADDRESS]	= "full"
+};
+
+static ssize_t inst_implicit_return_modes_available_show(struct device *dev,
+							 struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s %s %s %s\n",
+			inst_implicit_return_modes_str[ENCODER_IMPLICITRETURNMODE_NOT_SUPPORTED],
+			inst_implicit_return_modes_str[ENCODER_IMPLICITRETURNMODE_SIMPLE_COUNTING],
+			inst_implicit_return_modes_str[ENCODER_IMPLICITRETURNMODE_PARTIAL_ADDRESS],
+			inst_implicit_return_modes_str[ENCODER_IMPLICITRETURNMODE_FULL_ADDRESS]);
+}
+static DEVICE_ATTR_RO(inst_implicit_return_modes_available);
+
+
+static ssize_t inst_implicit_return_mode_preferred_show(struct device *dev,
+					    struct device_attribute *attr, char *buf)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+	struct encoder_config *config = &encoder_data->config;
+
+	return sysfs_emit(buf, "%s\n", inst_implicit_return_modes_str[config->impl_ret_mode]);
+}
+
+static ssize_t inst_implicit_return_mode_preferred_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t size)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+	struct encoder_config *config = &encoder_data->config;
+
+	if (sysfs_streq(buf,
+		inst_implicit_return_modes_str[ENCODER_IMPLICITRETURNMODE_NOT_SUPPORTED])) {
+		config->impl_ret_mode = ENCODER_IMPLICITRETURNMODE_NOT_SUPPORTED;
+	} else if (sysfs_streq(buf,
+		inst_implicit_return_modes_str[ENCODER_IMPLICITRETURNMODE_SIMPLE_COUNTING])) {
+		config->impl_ret_mode = ENCODER_IMPLICITRETURNMODE_SIMPLE_COUNTING;
+	} else if (sysfs_streq(buf,
+		inst_implicit_return_modes_str[ENCODER_IMPLICITRETURNMODE_PARTIAL_ADDRESS])) {
+		config->impl_ret_mode = ENCODER_IMPLICITRETURNMODE_PARTIAL_ADDRESS;
+	} else if (sysfs_streq(buf,
+		inst_implicit_return_modes_str[ENCODER_IMPLICITRETURNMODE_FULL_ADDRESS])) {
+		config->impl_ret_mode = ENCODER_IMPLICITRETURNMODE_FULL_ADDRESS;
+	} else {
+		return -EINVAL;
+	}
+	return size;
+}
+static DEVICE_ATTR_RW(inst_implicit_return_mode_preferred);
+
+encoder_simple_rw(inst_na_diff);
+encoder_simple_rw(inst_nt_addr);
+encoder_simple_rw(seq_jump);
+encoder_simple_rw(impl_ret);
+encoder_simple_rw(branch_pred);
+encoder_simple_rw(jump_target_cache);
+encoder_simple_rw(rep_hist);
+encoder_simple_rw(all_jumps);
+encoder_simple_rw(ext_msb);
+encoder_simple_rw(srcid);
+encoder_simple_rw(srcb);
+
+static struct attribute *trace_encoder_features_attrs[] = {
+	&dev_attr_inst_na_diff.attr,
+	&dev_attr_inst_nt_addr.attr,
+	&dev_attr_seq_jump.attr,
+	&dev_attr_impl_ret.attr,
+	&dev_attr_branch_pred.attr,
+	&dev_attr_jump_target_cache.attr,
+	&dev_attr_inst_implicit_return_modes_available.attr,
+	&dev_attr_inst_implicit_return_mode_preferred.attr,
+	&dev_attr_rep_hist.attr,
+	&dev_attr_all_jumps.attr,
+	&dev_attr_ext_msb.attr,
+	&dev_attr_srcid.attr,
+	&dev_attr_srcb.attr,
+	NULL,
+};
+
+static const struct attribute_group trace_encoder_group = {
+	.attrs = trace_encoder_attrs,
+};
+
+static const struct attribute_group trace_encoder_mgmt_group = {
+	.attrs = trace_encoder_mgmt_attrs,
+	.name = "mgmt",
+};
+
+static const struct attribute_group trace_encoder_control_group = {
+	.attrs = trace_encoder_control_attrs,
+	.name = "control",
+};
+
+static const struct attribute_group trace_encoder_features_group = {
+	.attrs = trace_encoder_features_attrs,
+	.name = "features",
+};
+
+const struct attribute_group *trace_encoder_groups[] = {
+	&trace_encoder_group,
+	&trace_encoder_mgmt_group,
+	&trace_encoder_control_group,
+	&trace_encoder_features_group,
+	NULL,
+};
diff --git a/drivers/hwtracing/coresight/rvtrace-encoder.h b/drivers/hwtracing/coresight/rvtrace-encoder.h
new file mode 100644
index 000000000000..44f2066ad869
--- /dev/null
+++ b/drivers/hwtracing/coresight/rvtrace-encoder.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#ifndef _RVTRACE_ENCODER_H
+#define _RVTRACE_ENCODER_H
+
+#include <asm/local.h>
+#include <linux/spinlock.h>
+#include "coresight-priv.h"
+
+/* Trace Encoder Control Register */
+#define RVTRACE_ENCODER_ITRACE				    BIT(2)
+#define RVTRACE_ENCODER_INSTMODE			    GENMASK(6, 4)
+#define RVTRACE_ENCODER_CONTEXT				BIT(9)
+#define RVTRACE_ENCODER_INSTTRIGEN			BIT(11)
+#define RVTRACE_ENCODER_INST_STALL_OR_OVERFLOW		BIT(12)
+#define RVTRACE_ENCODER_INST_STALL_EN			    BIT(13)
+#define RVTRACE_ENCODER_INHBSRC				    BIT(15)
+#define RVTRACE_ENCODER_INSTSYNC_MODE			    GENMASK(17, 16)
+#define RVTRACE_ENCODER_INSTSYNC_MAX			    GENMASK(23, 20)
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT		    2
+
+/* Trace Encoder Implementation Register */
+
+/* Trace Instruction Features Register */
+#define RVTRACE_ENCODER_INST_FTRS_OFFSET		    0x008
+#define RVTRACE_ENCODER_INST_NO_ADDR_DIFF		    BIT(0)
+#define RVTRACE_ENCODER_INST_NO_TRAP_ADDR		    BIT(1)
+#define RVTRACE_ENCODER_INST_EN_SEQUENTIAL_JUMP		    BIT(2)
+#define RVTRACE_ENCODER_INST_EN_IMPLICIT_RETURN		    BIT(3)
+#define RVTRACE_ENCODER_INST_EN_BRANCH_PREDICTION	    BIT(4)
+#define RVTRACE_ENCODER_INST_JUMP_TARGET_CACHE		    BIT(5)
+#define RVTRACE_ENCODER_INST_IMPLICIT_RETURN_MODE	    GENMASK(7, 6)
+#define RVTRACE_ENCODER_INST_EN_REPEQTED_HISTORT	    BIT(8)
+#define RVTRACE_ENCODER_INST_EN_ALL_JUMPS		    BIT(9)
+#define RVTRACE_ENCODER_INST_EXTEND_ADDR_MSB		    BIT(10)
+#define RVTRACE_ENCODER_SRCID				    GENMASK(27, 16)
+#define RVTRACE_ENCODER_SRCBITS				    GENMASK(31, 28)
+
+enum encoder_format {
+	ENCODER_FORMAT_ETRACE,
+	ENCODER_FORMAT_NTRACE,
+	ENCODER_FORMAT_UNKNOWN = 7
+};
+
+enum encoder_instmode {
+	ENCODER_INSTMODE_OFF,
+	ENCODER_INSTMODE_RESV1,
+	ENCODER_INSTMODE_RESV2,
+	ENCODER_INSTMODE_BTM,
+	ENCODER_INSTMODE_RESV4,
+	ENCODER_INSTMODE_RESV5,
+	ENCODER_INSTMODE_HTM,
+	ENCODER_INSTMODE_RESV7
+};
+
+enum encoder_syncmode {
+	ENCODER_SYNCMODE_OFF,
+	ENCODER_SYNCMODE_MESSAGES,
+	ENCODER_SYNCMODE_CLOCK,
+	ENCODER_SYNCMODE_INSTRUCTION
+};
+
+enum encoder_implicit_return_mode {
+	ENCODER_IMPLICITRETURNMODE_NOT_SUPPORTED,
+	ENCODER_IMPLICITRETURNMODE_SIMPLE_COUNTING,
+	ENCODER_IMPLICITRETURNMODE_PARTIAL_ADDRESS,
+	ENCODER_IMPLICITRETURNMODE_FULL_ADDRESS
+};
+
+/**
+ * struct encoder_config - configuration information related to an trace encoder
+ * @context:		Controls sending trace messages/fields with scontext/mcontext
+ *			values and/or privilege levels.
+ * @inst_trig:		Controls trTeInstTracing to be set or cleared by Trace-on and
+ *			Trace-off signals generated by the corresponding trigger module.
+ * @inst_stall:		Controls whether hart is stalled until TE can send a message.
+ * @inhb_src:		Controls whether include source field in trace messages/packets.
+ * @inst_syncmode:	Periodic instruction trace synchronization message/packet
+ *			generation mechanism.
+ * @inst_syncmax:	The maximum interval between instruction trace synchronization
+ *			messages/packets.
+ * @trc_fmt:		Trace recording/protocol format.
+ * @inst_na_diff:	Controls whether trace messages/packets always carry a full address.
+ * @inst_nt_addr:	Controls whether include trap handler address in trap messages/packets.
+ * @seq_jump:		Controls the sequential jump optimization.
+ * @impl_ret:		Controls the implicit return optimization.
+ * @branch_pred:	Branch Predictor based compression.
+ * @jump_target_cache:	Jump Target Cache based compression.
+ * @impl_ret_mode:	Controls how the decoder is handling stack of return addresses.
+ * @rep_hist:		Controls the repeated history optimization.
+ * @all_jumps:		Controls the emitting of trace message or add history/map bit for
+ *			direct unconditional/inferable control flow changes.
+ * @ext_msb:		Controls the extended handing of MSB address bits.
+ * @srcid:		Trace source ID assigned to this trace encoder.
+ * @srcb:		The number of bits in the trace source field, unless disabled by
+ *			inhibit_src.
+ */
+struct encoder_config {
+	bool				    context;
+	bool				    inst_trigger;
+	bool				    inst_stall;
+	bool				    inhb_src;
+	u8				    inst_syncmode;
+	u8				    inst_syncmax;
+	bool				    inst_na_diff;
+	bool				    inst_nt_addr;
+	bool				    seq_jump;
+	bool				    impl_ret;
+	bool				    branch_pred;
+	bool				    jump_target_cache;
+	u8				    impl_ret_mode;
+	bool				    rep_hist;
+	bool				    all_jumps;
+	bool				    ext_msb;
+	u16				    srcid;
+	u8				    srcb;
+};
+
+/**
+ * struct encoder_drvdata - specifics associated to an Trace Encoder component
+ * @csdev:	    Component vitals needed by the framework.
+ * @spinlock:	    Only one at a time pls.
+ * @sticky_enable:  True if trace encoder base configuration has been done.
+ * @boot_enable:    True if we should start tracing at boot time.
+ * @config:	    Structure holding configuration parameters.
+ */
+
+struct encoder_data {
+	struct coresight_device		*csdev;
+	spinlock_t			spinlock;
+	bool				sticky_enable;
+	bool				boot_enable;
+	struct encoder_config		config;
+};
+
+extern const struct attribute_group *trace_encoder_groups[];
+void encoder_set_default(struct rvtrace_component *comp);
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
