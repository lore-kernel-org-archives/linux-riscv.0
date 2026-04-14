Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63B6F531EC
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZsvRUyo1kDq2LGLKWFRA2zU/Uuk1GuZYYqwcTKUR4I=; b=dASguL8a3j8c7d
	XqCGabgJNziOHczR2KjG7LYtlwTJmvrAdHL8ObmIorlum0WNrtRnNYIacLm/DySu5CdJBByBUeFWm
	bl9zmz6iRtiksNkio1TXC8HCar4r4oeOs8IT4xRd+ricLfY3PM2SsxZ+TDgXcFv1ifIIfHpwmQr97
	V7w8Wal836vaiV2wflaIEMHKN1dZ1FpbwpZfNiwKb74sLvFMRRslsfSfbk/NIyR2EuTvmf3VjfQ0P
	hjrzntuuHaqP/B/ER7Ma2gXxELl8WvQGqrMf+owr7/3bUO0QJV42x+bv672AblYei4OwDdIiUJMoY
	/v6SchqrLeQXz5yTJm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgE-0000000Gekt-3Prm;
	Tue, 14 Apr 2026 03:43:14 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgA-0000000Geik-2i92
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138140;
	bh=fiydWjDmo6mxg8g0lJHP5DHClz75B9Sfp0H5veYkkTE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=PUP/Xgwo/0Nl1BmTm2uUEOib5XBuIR+uqfKIm6B9+6EtOygxfTcdWibqv4km7V+ZV
	 vKDkumEkRtJoCIiU3O9J8m1EPTMqfLcWtRB6s4NwwrOxG2arQCLPhxeIrRfBOOQIQ4
	 pibR7VlLKeBFu8iyslyJq2kQ/MnFnr6X3d9DWsAg=
X-QQ-mid: zesmtpsz5t1776138131t86ef943c
X-QQ-Originating-IP: 57ysNez3/Fjz0GpYSZnkWeRb8mTL8sRweOCs59F/pfk=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:42:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8828968199206424823
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
Subject: [RFC PATCH 04/12] coresight: Add RISC-V Trace Funnel driver
Date: Tue, 14 Apr 2026 11:41:45 +0800
Message-Id: <20260414034153.3272485-5-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Nuv9EIA+A3Y1K138gIVDLX0TOJs5z1XFN74Smr2zaBCWtUC+tZIH1iLK
	NBDxh/wtdbbQ4LGz0NN1Syvr3WpKU4CVtXzWD5/eNLt+/hAx6Y2oF8wlM6RdwgJmSqDv6Nu
	JvdmjWccYDWDYAn5Qi2mq+ilaT2/ISSMDr97A5SsbwOdyV5j5GLRGxxkUMzl2YWbWr+6MEx
	kRBPru4gNEOf20fDjs61wpvflRD6we968mrLEb6ppBb98K1AtMDjSmPJHChVYx7bWdrwhYr
	Zx0lnhWWW6bQmln1c5/tX5ecfWoeekGbxvA3zfXKIDpsViFcE/TlFIr8KiN2/S+kX9dTgeG
	/KrqbIz8jeGv7mgQGN1U/HkFUd6M3zh6EXwoA9ERlDYZY3DLEv8UxbFd8QuCSBkoxpWV4zP
	Zk/UEnnj6wxoMusOWTmeQjZFwVJU0Td8u9ZgfG7QrOz4VamLCnWBlhGluhFYB++caekyRd9
	Dr4Qr8QwtSS9lpV8xsQW8WfurNbyRPm523xHum1GE2PA/yJO1IVY5aJWTfDrgFqQiKrgxDP
	0665LktjxbHDcjfuX2/QtymOreI4sgIFeEXGomCz3TULIE6uNrK7DdV2ATG3e5GJb7tYHjH
	zT6wxR/RSJ5v3ji9zxcGktLCBmehNL7xqqF1jN+c1wr/pRt66ewIgo3hPk1TyjuIHOA/o9N
	O+HP1+ymPieCdubrpAcurptj5iWN66H/DIo2OjEDVq/UFYK32Nke58qfYgdrqivtebsYRJj
	glyN3lMihTrZw7E5TLgpwPHYCOddyMBWFWyzr1DqK03iEG2S7UO/wtnzf9Inzgl1+U6DnzY
	qjaVp/EDav31qhpnpOC3D1C+HTE8xmrmqjPWamriU0MAslnGzfmsw6Gt9sw27P8+acBXP56
	yMRLf9h0RCV2In+LdAiylR4WiShWUCJwT+qrDctFwD+Knt34rYSRCqerjFkiBaMXqR+9mWr
	9W9gIEjwI83KocKkWsxqWLAf7ZuZEAh2/zyPr4QH1a5Uy4s6sa4ZQJ0SVOvbnUt8aZ1n682
	Eltw9W0+5kxAn+b+h2bQdcNHwur2dTwJ6ZqKAyhl85kVHFokgycqq9cuKhfSvuKbSZGVvak
	gHSGnQX05BRxhl4QcwDRMfdjo7ldGPIBXluFg+V55f4xOU+MFuBM9h02X/GHSN0WZk6EL69
	Nr6Y
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_204311_050480_3306A8E8 
X-CRM114-Status: GOOD (  24.17  )
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

Add initial implementation of RISC-V trace funnel
driver. The funnel is defined in the RISC-V Trace
Control Interface specification.

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 drivers/hwtracing/coresight/Kconfig          |  12 +
 drivers/hwtracing/coresight/Makefile         |   1 +
 drivers/hwtracing/coresight/rvtrace-funnel.c | 244 +++++++++++++++++++
 drivers/hwtracing/coresight/rvtrace-funnel.h |  31 +++
 4 files changed, 288 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/rvtrace-funnel.c
 create mode 100644 drivers/hwtracing/coresight/rvtrace-funnel.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 3e46728f2482..8381a84e2699 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -288,9 +288,21 @@ config RVTRACE
 	  dynamically aggregated with CoreSight trace infrastructure
 	  at run time to form a complete trace path.
 
+config RVTRACE_FUNNEL
+	tristate "RISCV Trace Funnel driver"
+	depends on RVTRACE
+	help
+	  his driver provides support for the Trace Funnel driver. The Funnel
+	  aggregates the trace from each of its inputs and sends the combined
+	  trace stream to its designated Trace Sink or ATB Bridge.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-funnel.
+
 config RVTRACE_ENCODER
 	tristate "RISCV Trace Encoder driver"
 	depends on RVTRACE
+	select RVTRACE_FUNNEL
 	help
 	  This driver provides support for the Trace Encoder module, tracing
 	  the instructions that a processor is executing. This is primarily
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 9a526b1fb95a..409a0abf0642 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -59,5 +59,6 @@ coresight-ctcu-y := coresight-ctcu-core.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
 obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o
+obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
diff --git a/drivers/hwtracing/coresight/rvtrace-funnel.c b/drivers/hwtracing/coresight/rvtrace-funnel.c
new file mode 100644
index 000000000000..0dc7799a64ac
--- /dev/null
+++ b/drivers/hwtracing/coresight/rvtrace-funnel.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/coresight.h>
+#include <linux/platform_device.h>
+#include <linux/rvtrace.h>
+
+#include "coresight-priv.h"
+#include "rvtrace-funnel.h"
+
+DEFINE_CORESIGHT_DEVLIST(funnel_devs, "rvtrace_funnel");
+
+static int funnel_enable_hw(struct rvtrace_component *comp, int port)
+{
+	u32 disinput;
+	int ret = 0;
+	struct funnel_data *funnel_data = rvtrace_component_data(comp);
+
+	if (!comp->was_reset) {
+		ret = rvtrace_component_reset(comp);
+		if (ret)
+			goto done;
+	}
+
+	disinput = readl_relaxed(comp->base + RVTRACE_FUNNEL_DISINPUT_OFFSET);
+	disinput &= ~(1 << port);
+	writel_relaxed(disinput, comp->base + RVTRACE_FUNNEL_DISINPUT_OFFSET);
+	ret = rvtrace_poll_bit(comp, RVTRACE_FUNNEL_DISINPUT_OFFSET, port, 0);
+	if (ret)
+		goto done;
+
+	if (!funnel_data->was_enabled) {
+		ret = rvtrace_enable_component(comp);
+		if (ret)
+			goto done;
+	}
+
+done:
+	return ret;
+}
+
+static int funnel_enable(struct coresight_device *csdev,
+			 struct coresight_connection *in,
+			 struct coresight_connection *out)
+{
+	int ret = 0;
+	struct rvtrace_component *comp = dev_get_drvdata(csdev->dev.parent);
+	struct funnel_data *funnel_data = rvtrace_component_data(comp);
+	unsigned long flags;
+	bool first_enable = false;
+
+	spin_lock_irqsave(&funnel_data->spinlock, flags);
+	if (in->dest_refcnt == 0) {
+		ret = funnel_enable_hw(comp, in->dest_port);
+		if (!ret)
+			first_enable = true;
+	}
+	if (!ret) {
+		in->dest_refcnt++;
+		funnel_data->input_refcnt++;
+	}
+
+	if (first_enable)
+		dev_dbg(&csdev->dev, "Trace funnel inport %d enabled\n",
+			in->dest_port);
+
+	spin_unlock_irqrestore(&funnel_data->spinlock, flags);
+
+	return ret;
+}
+
+static void funnel_disable_hw(struct rvtrace_component *comp, int inport)
+{
+	struct funnel_data *funnel_data = rvtrace_component_data(comp);
+
+	if (--funnel_data->input_refcnt != 0)
+		return;
+
+	writel_relaxed(RVTRACE_FUNNEL_DISINPUT_MASK, comp->base + RVTRACE_FUNNEL_DISINPUT_OFFSET);
+
+	if (rvtrace_disable_component(comp))
+		dev_err(&funnel_data->csdev->dev,
+			"timeout while waiting for Trace Funnel to be disabled\n");
+
+	if (rvtrace_comp_is_empty(comp))
+		dev_err(&funnel_data->csdev->dev,
+			"timeout while waiting for Trace Funnel internal buffers become empty\n");
+}
+
+static void funnel_disable(struct coresight_device *csdev,
+			   struct coresight_connection *in,
+			   struct coresight_connection *out)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(csdev->dev.parent);
+	struct funnel_data *funnel_data = rvtrace_component_data(comp);
+	unsigned long flags;
+	bool last_disable = false;
+
+	spin_lock_irqsave(&funnel_data->spinlock, flags);
+	if (--in->dest_refcnt == 0) {
+		funnel_disable_hw(comp, in->dest_port);
+		last_disable = true;
+	}
+	spin_unlock_irqrestore(&funnel_data->spinlock, flags);
+
+	if (last_disable)
+		dev_dbg(&csdev->dev, "Trace funnel inport %d disabled\n",
+			in->dest_port);
+
+	if (funnel_data->input_refcnt == 0)
+		dev_dbg(&csdev->dev, "Trace funnel disabled\n");
+}
+
+static const struct coresight_ops_link funnel_link_ops = {
+	.enable		= funnel_enable,
+	.disable	= funnel_disable,
+};
+
+static const struct coresight_ops funnel_cs_ops = {
+	.link_ops       = &funnel_link_ops,
+};
+
+static ssize_t reset_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t size)
+{
+	unsigned long val;
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct funnel_data *funnel_data = rvtrace_component_data(comp);
+	unsigned long flags;
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	spin_lock_irqsave(&funnel_data->spinlock, flags);
+
+	if (val) {
+		if (rvtrace_component_reset(comp)) {
+			comp->was_reset = false;
+			spin_unlock_irqrestore(&funnel_data->spinlock, flags);
+			return -EINVAL;
+		}
+	}
+
+	spin_unlock_irqrestore(&funnel_data->spinlock, flags);
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
+static struct attribute *trace_funnel_attrs[] = {
+	coresight_simple_reg32(control, RVTRACE_COMPONENT_CTRL_OFFSET),
+	coresight_simple_reg32(impl, RVTRACE_COMPONENT_IMPL_OFFSET),
+	coresight_simple_reg32(disinput, RVTRACE_FUNNEL_DISINPUT_OFFSET),
+	&dev_attr_reset.attr,
+	&dev_attr_cpu.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(trace_funnel);
+
+static int funnel_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct coresight_platform_data *pdata;
+	struct funnel_data *funnel_data;
+	struct rvtrace_component *comp;
+	struct coresight_desc desc = { 0 };
+
+	comp = rvtrace_register_component(pdev);
+	if (IS_ERR(comp))
+		return PTR_ERR(comp);
+
+	funnel_data = devm_kzalloc(dev, sizeof(*funnel_data), GFP_KERNEL);
+	if (!funnel_data)
+		return -ENOMEM;
+
+	spin_lock_init(&funnel_data->spinlock);
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	pdev->dev.platform_data = pdata;
+
+	platform_set_drvdata(pdev, comp);
+
+	desc.name = coresight_alloc_device_name(&funnel_devs, dev);
+	desc.access = CSDEV_ACCESS_IOMEM(comp->base);
+	desc.type = CORESIGHT_DEV_TYPE_LINK;
+	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
+	desc.ops = &funnel_cs_ops;
+	desc.pdata = pdata;
+	desc.dev = dev;
+	desc.groups = trace_funnel_groups;
+	funnel_data->csdev = coresight_register(&desc);
+	if (IS_ERR(funnel_data->csdev))
+		return PTR_ERR(funnel_data->csdev);
+
+	comp->id.data = funnel_data;
+
+	dev_dbg(dev, "Trace Funnel initialized\n");
+
+	return 0;
+}
+
+static void funnel_remove(struct platform_device *pdev)
+{
+	struct rvtrace_component *comp = platform_get_drvdata(pdev);
+	struct funnel_data *funnel_data = rvtrace_component_data(comp);
+
+	coresight_unregister(funnel_data->csdev);
+}
+
+static const struct of_device_id funnel_match[] = {
+	{.compatible = "riscv,trace-funnel"},
+	{},
+};
+
+static struct platform_driver funnel_driver = {
+	.probe = funnel_probe,
+	.remove = funnel_remove,
+	.driver = {
+		.name	= "trace-funnel",
+		.of_match_table = funnel_match,
+	},
+};
+
+module_platform_driver(funnel_driver);
+
+MODULE_DESCRIPTION("RISC-V Trace funnel driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/coresight/rvtrace-funnel.h b/drivers/hwtracing/coresight/rvtrace-funnel.h
new file mode 100644
index 000000000000..e5247e6c1bf5
--- /dev/null
+++ b/drivers/hwtracing/coresight/rvtrace-funnel.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#ifndef _RVTRACE_FUNNEL_H
+#define _RVTRACE_FUNNEL_H
+
+#include <linux/spinlock.h>
+#include <linux/coresight.h>
+
+/* Disable Individual Funnel Inputs */
+#define RVTRACE_FUNNEL_DISINPUT_OFFSET			0x008
+#define RVTRACE_FUNNEL_DISINPUT_MASK			0xffff
+
+/**
+ * struct funnel_data - specifics associated to a Trace Funnel component
+ * @csdev:        Component vitals needed by the framework.
+ * @spinlock:     Only one at a time pls.
+ * @was_enabled:  Flag showing whether the Trace Funnel was enabled.
+ * @input_refcnt: Record the number of funnel inputs
+ */
+struct funnel_data {
+	struct coresight_device	*csdev;
+	spinlock_t		spinlock;
+	bool			was_enabled;
+	u32			input_refcnt;
+	u32			disintput;
+};
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
