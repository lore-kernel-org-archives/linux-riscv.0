Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66612F531EE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4BZxznYdN2PZIugEp2Oh75RTcK6e2ZqzNkOr7Enwbo=; b=b0nBuhrJKMxKhL
	4n6FIQFEmICmwZ+hHMDCmVVCThIQz6MOxUUqBLx+Oba+m7HqZmkoLsyjXQQVIaCKIL0mX6kDQKUPq
	L3GlJEcxdRMX9FbW2uwgnL0Kr90SF9M3Znf4mtGoXaUPSMN69PC+22/Pp+hc9UQ0YYb/AeaGmNPwY
	9dcPP9ZyCmsQXeJ1U7pFfZ/ITpHPa3VbJ+JySFMi/khw2ATvbHBF5bPY+iC/wzPSR28rOR9L1rqWT
	j0bWEIbNqi8PSodqEV1Q6dyTJ4DO5O8ZzA9+6YNH+WYaUXg0etR0W5JDYXq2h6KdLcmeTO8Kk13Z0
	Rs2qDliTfTkm1ftUOWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgP-0000000Gep5-3756;
	Tue, 14 Apr 2026 03:43:25 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgM-0000000Gej6-2GEa
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138144;
	bh=P3GVjBCXRU7adb+cVqE903QHuJnoDiq/UFyGJ9773gI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=DDBdggK93ZjS4jwrQznP0Z+tPyEZ+HdPKtK78OWojARJwKkN4ImtrjOJIJ3UcGDeQ
	 rix1lyL2zso7Qc058tLJvZrLBQ2D/zSef4DtanVOcd1od4sVVqjA2nQ5I4vlG1UZRj
	 RIwrn+evUp/UixhPzelIQCpeOs0HNVjWfDrGMwWo=
X-QQ-mid: zesmtpsz5t1776138135tb7d97203
X-QQ-Originating-IP: A4h7SvXs75OmbzLY+NVyMu9/GokZCmGtd1XspNpuU8g=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:42:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1804587517364881883
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
Subject: [RFC PATCH 05/12] coresight: Add RISC-V Trace ATB Bridge driver
Date: Tue, 14 Apr 2026 11:41:46 +0800
Message-Id: <20260414034153.3272485-6-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MUpBpno6CNFp9qauP+PsTjMlVH8wfAz0xc7VYyLmdXxPmi0L2buouPq0
	3+xdpVM9YyYpAs+HbQfKg4zcMeBaw8t3GUPnMR/x7rHEDKt6JdKMAFU1PziQ6z6J9ZzqAOX
	qFoNS1G2+aEGJxJRyGdAl1mQ9BqNhs7KV5tcci+xlmh4s4ILyuBXVacV+Id28pgsKihu29r
	F3+JsgWWVhdnGh1fpu+dfanPQRW8uqWejFYtGMlede7+KYuB9ToKLqEiHDnJurEEOsbb4L0
	0WFpkE+Qw/IPcW9WTZTV7L0zUJobWeUNhyn5OKGov2hDQjZfrXFpai1khyXat86rUecNWDG
	6db7P2Pl8Cf9l4g6p7r6vkSpqdqBlKGFFothwOSWH/z1sL1HljeZARseMlOqgLQVCmp6eXz
	+1Ox/3CEpU1UaIOVDgMXgs7VZaJTIpGtjrDcjXKet1n1hjmngFWYnMsVxSH+DuuH2Qy82iT
	gSaY8wL4u8NTRONWtxbkM5GmCCknMxGs9tCjVDbhe0UKDr0Ssieydqr7kgc8DttqY6C6DW1
	4TmVCT/8m75ll/2oq8xZf0KA8WEK+WpI8KHBBGR0yFuCEk4i+1FBrjNZWzhcWf7GsEAz3iW
	bx4/vKQ/WZXnlC0pRYfkZFr2mNYVIHZONC9mJTeUltaNm1Q0vpyU118j8+IJ7ZNlxSRCKPX
	Ned81iWHyA1TE5pOa3k8T0k2zi98alAEi6aRPyfkrUzeXultp5Klys4F3q4qrvatHVwDzCV
	oGSaBqShc6iBvfEkrsBvCS2gNeY6lEjf20vOS7fwA7GYcaFrhIr/0/e1YP8T+VCa2eh6kLP
	w0bJ+iHZwZTUPOTv4WxM1jVdTPeUgqwWzn4Eh8Pmg3MHAtt5f5jD/X5n95ooxbzM7FF79ik
	k595NoNlMsqqwRczhJ6tVL3c44Kqx2YIf6IKiIs+0VGR0nFETZmRm12z/zjDq8nnK5fI06X
	lfK6TR4XWZuVOmrmWRMsTRGCAU0vfsrqZy/km0uVIq2OyhkuPXx2h8Gk9khQ4UItAlQmdJz
	96m54SLOIBHY+M8sfNCEJppd17Wwww9Y7IsD1Mh+nQ7sFEwwZ1sBU5V1e/Z7BDuOiYWTRLQ
	cJ4uKoadLRgAtE7U5IaEp1cNzgpyWUryHI19KZPnnvk
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_204323_470184_32D762B0 
X-CRM114-Status: GOOD (  23.60  )
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

Add initial implementation of RISC-V trace ATB
Bridge driver. The ATB Bridge is defined in the
RISC-V Trace Control Interface specification.

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 drivers/hwtracing/coresight/Kconfig           |  12 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 .../hwtracing/coresight/rvtrace-atbbridge.c   | 239 ++++++++++++++++++
 3 files changed, 252 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/rvtrace-atbbridge.c

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 8381a84e2699..1cd88a1a7d08 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -288,6 +288,17 @@ config RVTRACE
 	  dynamically aggregated with CoreSight trace infrastructure
 	  at run time to form a complete trace path.
 
+config RVTRACE_ATBBRIDGE
+	tristate "RISCV Trace ATB Bridge driver"
+	depends on RVTRACE
+	help
+	  This driver provides support for the ATB Bridge driver. The ATB
+	  Bridge allows sending RISC-V trace to Arm CoreSight infrastructure
+	  (instead of RISC-V compliant sink) as an ATB initiator.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-atbbridge.
+
 config RVTRACE_FUNNEL
 	tristate "RISCV Trace Funnel driver"
 	depends on RVTRACE
@@ -303,6 +314,7 @@ config RVTRACE_ENCODER
 	tristate "RISCV Trace Encoder driver"
 	depends on RVTRACE
 	select RVTRACE_FUNNEL
+	select RVTRACE_ATBBRIDGE
 	help
 	  This driver provides support for the Trace Encoder module, tracing
 	  the instructions that a processor is executing. This is primarily
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 409a0abf0642..2264a313a773 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -59,6 +59,7 @@ coresight-ctcu-y := coresight-ctcu-core.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
 obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o
+obj-$(CONFIG_RVTRACE_ATBBRIDGE) += rvtrace-atbbridge.o
 obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
diff --git a/drivers/hwtracing/coresight/rvtrace-atbbridge.c b/drivers/hwtracing/coresight/rvtrace-atbbridge.c
new file mode 100644
index 000000000000..a931be322a2f
--- /dev/null
+++ b/drivers/hwtracing/coresight/rvtrace-atbbridge.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/coresight.h>
+#include <linux/platform_device.h>
+#include <linux/bitfield.h>
+#include <linux/rvtrace.h>
+
+#include "coresight-priv.h"
+#include "coresight-trace-id.h"
+
+#define RVTRACE_ATBBRIDGE_CONTROL_ID_MASK	GENMASK(14, 8)
+/**
+ * struct atbbridge_data - specifics associated to a ATB bridge component
+ * @csdev:      Component vitals needed by the framework.
+ * @spinlock:   Only one at a time pls.
+ * @traceid:    Value of the current ID for this component.
+ */
+struct atbbridge_data {
+	struct coresight_device	*csdev;
+	spinlock_t		spinlock;
+	u8			traceid;
+};
+
+DEFINE_CORESIGHT_DEVLIST(atbbridge_devs, "atbbridge");
+
+static int atbbridge_enable(struct coresight_device *csdev,
+			    struct coresight_connection *in,
+			    struct coresight_connection *out)
+{
+	u32 control;
+	int ret = 0;
+	struct rvtrace_component *comp = dev_get_drvdata(csdev->dev.parent);
+	struct atbbridge_data *atbbridge_data = rvtrace_component_data(comp);
+	unsigned long flags;
+
+	spin_lock_irqsave(&atbbridge_data->spinlock, flags);
+	if (!comp->was_reset) {
+		ret = rvtrace_component_reset(comp);
+		if (ret)
+			goto done;
+	}
+
+	control = readl_relaxed(comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	control |= FIELD_PREP(RVTRACE_ATBBRIDGE_CONTROL_ID_MASK, atbbridge_data->traceid);
+	writel_relaxed(control, comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	ret = rvtrace_enable_component(comp);
+	if (ret)
+		goto done;
+
+	spin_unlock_irqrestore(&atbbridge_data->spinlock, flags);
+
+	dev_dbg(&csdev->dev, "Trace ATB bridge enabled\n");
+done:
+	return ret;
+}
+
+static void atbbridge_disable(struct coresight_device *csdev,
+			      struct coresight_connection *in,
+			      struct coresight_connection *out)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(csdev->dev.parent);
+	struct atbbridge_data *atbbridge_data = rvtrace_component_data(comp);
+	unsigned long flags;
+
+	spin_lock_irqsave(&atbbridge_data->spinlock, flags);
+
+	if (rvtrace_disable_component(comp))
+		dev_err(&csdev->dev,
+			"timeout while waiting for Trace ATB Bridge to be disabled\n");
+
+	if (rvtrace_comp_is_empty(comp))
+		dev_err(&csdev->dev,
+			"timeout while waiting for Trace ATB Bridge internal buffers become empty\n");
+
+	spin_unlock_irqrestore(&atbbridge_data->spinlock, flags);
+
+	dev_dbg(&csdev->dev, "Trace ATB bridge disabled\n");
+}
+
+static int atbbridge_link_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+				   __maybe_unused struct coresight_device *sink)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(csdev->dev.parent);
+	struct atbbridge_data *atbbridge_data = rvtrace_component_data(comp);
+
+	return atbbridge_data->traceid;
+}
+
+static const struct coresight_ops_link atbbridge_link_ops = {
+	.enable		= atbbridge_enable,
+	.disable	= atbbridge_disable,
+};
+
+static const struct coresight_ops atbbridge_cs_ops = {
+	.trace_id	= atbbridge_link_trace_id,
+	.link_ops       = &atbbridge_link_ops,
+};
+
+static ssize_t reset_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t size)
+{
+	unsigned long val;
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct atbbridge_data *atbbridge_data = rvtrace_component_data(comp);
+	unsigned long flags;
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	if (val) {
+		if (rvtrace_component_reset(comp)) {
+			comp->was_reset = false;
+			spin_unlock_irqrestore(&atbbridge_data->spinlock, flags);
+			return -EINVAL;
+		}
+	}
+
+	spin_unlock_irqrestore(&atbbridge_data->spinlock, flags);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset);
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
+static ssize_t traceid_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct atbbridge_data *atbbridge_data = rvtrace_component_data(comp);
+
+	val = atbbridge_data->traceid;
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+}
+static DEVICE_ATTR_RO(traceid);
+
+static struct attribute *trace_atbbridge_attrs[] = {
+	coresight_simple_reg32(control, RVTRACE_COMPONENT_CTRL_OFFSET),
+	coresight_simple_reg32(impl, RVTRACE_COMPONENT_IMPL_OFFSET),
+	&dev_attr_reset.attr,
+	&dev_attr_cpu.attr,
+	&dev_attr_traceid.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(trace_atbbridge);
+
+static int atbbridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct coresight_platform_data *pdata;
+	struct atbbridge_data *atbbridge_data;
+	struct rvtrace_component *comp;
+	struct coresight_desc desc = { 0 };
+	int trace_id = 0;
+
+	comp = rvtrace_register_component(pdev);
+	if (IS_ERR(comp))
+		return PTR_ERR(comp);
+
+	atbbridge_data = devm_kzalloc(dev, sizeof(*atbbridge_data), GFP_KERNEL);
+	if (!atbbridge_data)
+		return -ENOMEM;
+
+	spin_lock_init(&atbbridge_data->spinlock);
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	pdev->dev.platform_data = pdata;
+
+	platform_set_drvdata(pdev, comp);
+
+	desc.name = coresight_alloc_device_name(&atbbridge_devs, dev);
+	desc.access = CSDEV_ACCESS_IOMEM(comp->base);
+	desc.type = CORESIGHT_DEV_TYPE_LINK;
+	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
+	desc.ops = &atbbridge_cs_ops;
+	desc.pdata = pdata;
+	desc.dev = dev;
+	desc.groups = trace_atbbridge_groups;
+	atbbridge_data->csdev = coresight_register(&desc);
+	if (IS_ERR(atbbridge_data->csdev))
+		return PTR_ERR(atbbridge_data->csdev);
+
+	trace_id = coresight_trace_id_get_system_id();
+	if (trace_id < 0)
+		return -EINVAL;
+	atbbridge_data->traceid = (u8)trace_id;
+
+	comp->id.data = atbbridge_data;
+
+	dev_dbg(dev, "Trace ATB Bridge initialized\n");
+
+	return 0;
+}
+
+static void atbbridge_remove(struct platform_device *pdev)
+{
+	struct rvtrace_component *comp = platform_get_drvdata(pdev);
+	struct atbbridge_data *atbbridge_data = rvtrace_component_data(comp);
+
+	coresight_trace_id_put_system_id(atbbridge_data->traceid);
+	coresight_unregister(atbbridge_data->csdev);
+}
+
+static const struct of_device_id atbbridge_match[] = {
+	{.compatible = "riscv,trace-atbbridge"},
+	{},
+};
+
+static struct platform_driver atbbridge_driver = {
+	.probe = atbbridge_probe,
+	.remove = atbbridge_remove,
+	.driver = {
+		.name	= "trace-atbbridge",
+		.of_match_table = atbbridge_match,
+	},
+};
+
+module_platform_driver(atbbridge_driver);
+
+MODULE_DESCRIPTION("RISC-V Trace ATB Bridge driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
