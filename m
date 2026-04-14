Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D7FF531EC
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1N5fsoAC1ItaVwUCa4DuF2EYKM8eofXJhEEiEuG5krk=; b=JOQdwso02W/C3N
	H5Ur25Fsr5GYy2/qJU604N0fedubFOaahkdUr41ARF0QIklfTwIfNWGdwvW+4CrM4YKVxA/eW+cgz
	wI903qpaPhF5OFnM39bV58SLYWLs05y4SxhI0bM+u17DPOH8STm13U2RFR3vONtWspmlqawjvnLgs
	tY921WxUnyGTkxTEVwSnKMLr6T3vf5U4yXdKpeDTs7BvbZNdHE1ON67Um7hpxjkjR+Pv54MrSUE2s
	jZ8AEcpRnXxwSm5rwmZ2WaF8Had2PUzUFwbx6PX1L8Z5LQpfEpRWBal+5JvgJUvQzNmYsEij6mY/5
	CCJvEifwnUUND+Wi2ldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgT-0000000Gese-1aT7;
	Tue, 14 Apr 2026 03:43:29 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgQ-0000000GelA-1BEC
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138133;
	bh=iSbOge2rZ0clwseYaYE9Cu/TuLiV5T3RqaR0b6WSJmw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=wmgpLklfMNVdFQZ5lqe+n/NnH7AiomVOtmGVvADf5Sth9ng040+JJLotoKW52vRT2
	 eTMMXQ+BjR1Tpdza9xmtQZ18BwJqMPzMgFI+rPKd8Ep+Hxp2cLq0q6AjS5niCXAFO1
	 FyTBEGIiEcxs2JO6XIVAqgCoeNUA7ktlcJJ960IQ=
X-QQ-mid: zesmtpsz5t1776138124t358ef25d
X-QQ-Originating-IP: CzPsqtwPvjJQ2v52XxmFdlX/powKwJi1Tn4QUEhQpsg=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:42:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3322854439866736697
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
Subject: [RFC PATCH 02/12] coresight: Initial implementation of RISC-V trace driver
Date: Tue, 14 Apr 2026 11:41:43 +0800
Message-Id: <20260414034153.3272485-3-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NfVrc1yo43JxS/sa5pXz8MblI7iUjb09sbMr8AA2VPQDDJsiVlHQPkwc
	TELVlTpJkibVRzwReQUqAWpBkWXryiZu+iM587w56+sGnMAC7t+y6pBTRR7FIVHolANdyCV
	6Ysz+kvDF6BYu+y/QvFmvu3L+KZHZsnavuTIHn9pXXbsp7WQxxu81Yr4pBADAZQvE9+WzQk
	rft/OTCLZg0+259MwqKsTIIfYcounV3hCMZ1Rc85diqnV4APvP2ay0BTTv8sR0YGIYrFbv2
	w9KHTsHBVGolrNG+0Y22Geyr5mxRYFIjjei8mXcDSFF0ZwKc3wICFlq6zdb8vbnXQS6IdGd
	FuXkHTIUtfN+7/ywrY8e1fZv3pf2pVEcWvvQUCkFOygtRMXQepSS2mxVd/VbBY5xrz5KRJ6
	gwPrQmN492Ch6vltaGpomFSAZr6Dq0UgbBQGih6myW6QzqOOCu0BC2Sjz363MCGzuCPA6zL
	fUq2VKfxiMR8V7WrQA2ygnh2HBTnmDArjVGiJwwfkqfK1nozBLQ++kGUUFKl99sIQcRiKQH
	hjCJpZ8DIZwDfjSUK/naekSJ0Ef7iZ6NUGrEpjjowFuDtl0Q5F1WCXa8IqMDfGGyWp/jxTt
	b7iDfz265DEsz8vS/NHmAITA5zmYc/Ra7SZow/WaJykdjvtyQ+nYeoXMm5gX4IJz6uFQtbY
	t/3GVHRjoCaWn9QcoJ6bN4jWavAnBZt2oS/bfHgsXfl5LEE4K9lC2b8UdYXI8+PdRQspY1q
	DCFgOhQ9mcuy9D0FzvblrbXXVZK4t2GBH5G8WkpJx/s0gyeW149fjqdsrxtEbJ+16Ep/nK/
	nmKXJ6cymWqCQfZJRKcee0GfUKfUWxJbik6qCNDbzCohqo0Rc7aJFybyClKivtV9cwC2k/B
	q2p2kRtyhu9Shfn0uXU2APrCbxwxdzHsbd+xzh8ME30s5Lj1Qxi+VLATbPopR9ugyq76gIr
	hiJ0HZViabThfCUiXXqBgqrxPutD+NfwUAvrhw96eZkzjyzNsR6IxhZQQ6XaAEaJCWuphJB
	uU8LJIXhIk9NGvYZcrZktwp1XDqYKg6N2TnA95HCfby5Xb8zkJse7Vgz5t2+yEbSTB2zjBx
	snIEpKV3tXyVhHNRRDVb5/md4WzsKoES94DcR/+485/FgtEImz0xbW4p1Zu46YIQcBOak+H
	6C0R
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_204326_705527_A1CA3E8D 
X-CRM114-Status: GOOD (  23.73  )
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

Implement some common driver interfaces RISC-V trace
where RISC-V trace components are instantiated by a
common platform driver and a separate RISC-V trace
driver for each type of RISC-V trace component.

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 drivers/hwtracing/coresight/Kconfig        |   8 ++
 drivers/hwtracing/coresight/Makefile       |   2 +
 drivers/hwtracing/coresight/rvtrace-core.c | 135 +++++++++++++++++++++
 include/linux/rvtrace.h                    | 116 ++++++++++++++++++
 4 files changed, 261 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/rvtrace-core.c
 create mode 100644 include/linux/rvtrace.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 2b1ebe3f614d..5adeaf78a080 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -280,4 +280,12 @@ config CORESIGHT_TNOC
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-tnoc.
 
+config RVTRACE
+	bool "RISC-V Trace Support"
+	help
+	  This enables support for the RISC-V trace drivers. drivers
+	  (including Trace Encoder, Trace Funnel and  ATB Bridge) are
+	  dynamically aggregated with CoreSight trace infrastructure
+	  at run time to form a complete trace path.
+
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a5..c21a9e25e148 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -57,3 +57,5 @@ obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
 coresight-ctcu-y := coresight-ctcu-core.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
+obj-$(CONFIG_RVTRACE) += rvtrace.o
+rvtrace-y := rvtrace-core.o
diff --git a/drivers/hwtracing/coresight/rvtrace-core.c b/drivers/hwtracing/coresight/rvtrace-core.c
new file mode 100644
index 000000000000..c74f43869d8b
--- /dev/null
+++ b/drivers/hwtracing/coresight/rvtrace-core.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/percpu.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/rvtrace.h>
+
+int rvtrace_poll_bit(struct rvtrace_component *comp, int offset,
+		     int bit, int bitval)
+{
+	int i = RVTRACE_TIMEOUT_US;
+	u32 val;
+
+	while (i--) {
+		val = readl_relaxed(comp->base + offset);
+		if (((val >> bit) & 0x1) == bitval)
+			break;
+		udelay(1);
+	}
+
+	return (i < 0) ? -ETIMEDOUT : 0;
+}
+EXPORT_SYMBOL_GPL(rvtrace_poll_bit);
+
+int rvtrace_enable_component(struct rvtrace_component *comp)
+{
+	u32 val;
+
+	val = readl_relaxed(comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	writel_relaxed(val, comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(comp, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1);
+}
+EXPORT_SYMBOL_GPL(rvtrace_enable_component);
+
+int rvtrace_disable_component(struct rvtrace_component *comp)
+{
+	u32 val;
+
+	val = readl_relaxed(comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	writel_relaxed(val, comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(comp, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0);
+}
+EXPORT_SYMBOL_GPL(rvtrace_disable_component);
+
+int rvtrace_component_reset(struct rvtrace_component *comp)
+{
+	int ret;
+
+	writel_relaxed(0, comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 0);
+	if (ret)
+		return ret;
+
+	writel_relaxed(RVTRACE_COMPONENT_CTRL_ACTIVE_MASK,
+			comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(comp, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 1);
+}
+EXPORT_SYMBOL_GPL(rvtrace_component_reset);
+
+struct rvtrace_component *rvtrace_register_component(struct platform_device *pdev)
+{
+	int ret;
+	void __iomem *base;
+	struct device *dev = &pdev->dev;
+	struct rvtrace_component *comp;
+	struct resource *res;
+	struct device_node *node;
+	u32 impl, type, major, minor;
+
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
+	if (!comp) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base)) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+	comp->base = base;
+
+	comp->cpu = -1;
+	for (int i = 0; ; i++) {
+		node = of_parse_phandle(dev->of_node, "cpus", i);
+		if (!node)
+			break;
+
+		ret = of_cpu_node_to_id(node);
+		of_node_put(node);
+		if (ret >= 0 && cpu_online(ret)) {
+			comp->cpu = ret;
+			break;
+		}
+	}
+
+	if (comp->cpu < 0) {
+		dev_err(dev, "No valid CPU found in 'cpus' property\n");
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	ret = rvtrace_component_reset(comp);
+	if (ret)
+		goto err_out;
+	comp->was_reset = true;
+
+	impl = readl_relaxed(comp->base + RVTRACE_COMPONENT_IMPL_OFFSET);
+	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
+	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK;
+	minor = (impl >> RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMINOR_MASK;
+
+	comp->id.type = type;
+	comp->id.version = rvtrace_component_mkversion(major, minor);
+
+	return comp;
+
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(rvtrace_register_component);
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
new file mode 100644
index 000000000000..e7028d82f8fd
--- /dev/null
+++ b/include/linux/rvtrace.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#ifndef __LINUX_RVTRACE_H__
+#define __LINUX_RVTRACE_H__
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/coresight.h>
+#include <linux/types.h>
+
+/* Control register common across all RISC-V trace components */
+#define RVTRACE_COMPONENT_CTRL_OFFSET		0x000
+#define RVTRACE_COMPONENT_CTRL_ACTIVE_MASK	0x1
+#define RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT	0
+#define RVTRACE_COMPONENT_CTRL_ENABLE_MASK	0x1
+#define RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT	1
+#define RVTRACE_COMPONENT_CTRL_EMPTY_SHIFT	3
+
+/* Implementation register common across all RISC-V trace components */
+#define RVTRACE_COMPONENT_IMPL_OFFSET		0x004
+#define RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT	0
+#define RVTRACE_COMPONENT_IMPL_VERMINOR_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT	4
+#define RVTRACE_COMPONENT_IMPL_TYPE_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_TYPE_SHIFT	8
+
+#define RVTRACE_TIMEOUT_US			100
+
+/* Possible component types defined by the RISC-V Trace Control Interface */
+enum rvtrace_component_type {
+	RVTRACE_COMPONENT_TYPE_RESV0,
+	RVTRACE_COMPONENT_TYPE_ENCODER, /* 0x1 */
+	RVTRACE_COMPONENT_TYPE_RESV2,
+	RVTRACE_COMPONENT_TYPE_RESV3,
+	RVTRACE_COMPONENT_TYPE_RESV4,
+	RVTRACE_COMPONENT_TYPE_RESV5,
+	RVTRACE_COMPONENT_TYPE_RESV6,
+	RVTRACE_COMPONENT_TYPE_RESV7,
+	RVTRACE_COMPONENT_TYPE_FUNNEL, /* 0x8 */
+	RVTRACE_COMPONENT_TYPE_RAMSINK, /* 0x9 */
+	RVTRACE_COMPONENT_TYPE_PIBSINK, /* 0xA */
+	RVTRACE_COMPONENT_TYPE_RESV11,
+	RVTRACE_COMPONENT_TYPE_RESV12,
+	RVTRACE_COMPONENT_TYPE_RESV13,
+	RVTRACE_COMPONENT_TYPE_ATBBRIDGE, /* 0xE */
+	RVTRACE_COMPONENT_TYPE_RESV15,
+	RVTRACE_COMPONENT_TYPE_MAX
+};
+
+/* Encoding/decoding macros for RISC-V trace component version */
+#define rvtrace_component_version_major(__version)	\
+	(((__version) >> 16) & 0xffff)
+#define rvtrace_component_version_minor(__version)	\
+	((__version) & 0xffff)
+#define rvtrace_component_mkversion(__major, __minor)	\
+	((((__major) & 0xffff) << 16) |	((__minor) & 0xffff))
+
+/**
+ * struct rvtrace_component_id - Details to identify or match a RISC-V trace component
+ * @type:      Type of the component
+ * @version:   Version of the component
+ * @data:      Data pointer for driver use
+ */
+struct rvtrace_component_id {
+	enum rvtrace_component_type type;
+	u32 version;
+	void *data;
+};
+
+/**
+ * struct rvtrace_component - Representation of a RISC-V trace component
+ * base:             Memory mapped base address for the component
+ * id:               Details to match the component
+ * dev:              Device instance
+ * cpu:              The cpu this component is affined to
+ * was_reset:        Flag showing whether RISC-V trace driver was reset successfully
+ */
+struct rvtrace_component {
+	void __iomem *base;
+	struct rvtrace_component_id id;
+	struct device *dev;
+	int cpu;
+	bool was_reset;
+};
+
+struct component_enable_arg {
+	struct rvtrace_component *comp;
+	int rc;
+};
+
+struct rvtrace_component *rvtrace_register_component(struct platform_device *pdev);
+
+int rvtrace_poll_bit(struct rvtrace_component *comp, int offset,
+		     int bit, int bitval);
+
+int rvtrace_enable_component(struct rvtrace_component *comp);
+int rvtrace_disable_component(struct rvtrace_component *comp);
+int rvtrace_component_reset(struct rvtrace_component *comp);
+
+static inline void *rvtrace_component_data(struct rvtrace_component *comp)
+{
+	return comp->id.data;
+}
+
+static inline int rvtrace_comp_is_empty(struct rvtrace_component *comp)
+{
+	return rvtrace_poll_bit(comp, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_EMPTY_SHIFT, 1);
+}
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
