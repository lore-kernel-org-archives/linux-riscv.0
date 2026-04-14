Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D121F531D0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79ToilXCT/eTemehP1GUIHYuIEiZxdEmtapqCkb/Ytg=; b=kwooVS07ztf+Ll
	5iX0d7KSNSP9kKR4IFNa6CdSKC5Fnw9n+lxJblDtolLvhxRrFKpWsKoDol2hyyk3R/SuV+5sizSjQ
	4QxyOuoXa6Wbz3BZZHj+TEKQuzP5lePtLE5MmkdbjeiY3lTi0GU0g1cBcP44DDJrHnPECgQcmugqi
	3L/bQb4OgUDVHEtPqhp5ar2JJgcOKtBn/J1VQ7ReWSgsdWKdG6hM9FVN+/o3GTWZb72jHeE5LN3ny
	8THnQsLT5F8Z7OAqZj+Tal4phnJRhYhU3tAwbbGnRCgdtJYMwT8uYB1ytt6fu7YwZkBipLdEf5CY5
	+oZFeBtiaJ9hyE3F5Msw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgT-0000000GesG-0CsI;
	Tue, 14 Apr 2026 03:43:29 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgP-0000000Gel9-2TA2
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138146;
	bh=WMK2YSo3F/K+10mV2+1NOqzt6aQdzqbeUoYc7D0Ih4A=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=BlClFKSkIsm+twN32uFjWtf9pwvHW2/3KDCy8zoNJOr0Aem+RCFzmxgIiioqVtlb7
	 AveTx80oeqgv8cSfQTRjLsa8zXvtb7ipHKjIll2ueySSxSsO4+GdgUnKLF7sXTEgB5
	 pieZiD9gxcQY/d+Nm7kIKYi7syedPghTEjnUS5KM=
X-QQ-mid: zesmtpsz5t1776138139t8864a011
X-QQ-Originating-IP: zNpQbJroXY1pqGXRu3jMICbBBcqFR/tlOHp9X6TarP8=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:42:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14641806201959485395
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
Subject: [RFC PATCH 06/12] coresight rvtrace: Add timestamp component support for encoder and funnel
Date: Tue, 14 Apr 2026 11:41:47 +0800
Message-Id: <20260414034153.3272485-7-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MJBMXuJzHaFzavrT8U2mJZoUhuYOVRx9wL3sbvExaARcrmlaLW5ghCX0
	cZkm+GCeCp+pw8Fd7EikRB0gGjsLzdZgNp1vCO1cse43mWoIub845WiyXZhc72zySlB/kze
	hTstEfCo9/JuQW2x+RE4fphHorC62tma4xKfmqE7ycKEDdZIctragwgpK7JaCwmZeoPTZsI
	03f7weT4tCaDzt1PCQAQqcdR8gDw5Si1unWNX6rEAbznI57immByxbomjLdHq4E2rx88kgx
	4V+1C8UOqSqJh8biiV5tLFI5rX+92JVfBYsn6Wdfm8siQshS6XNpqg4f/WST3T+OJYpcRI6
	h52H3fpdiHPbUnMd9Hpp+TuuQ5eGICTe8z7LVY0ehHGOoVxKBfyhwc6r8PpP4IOxPV8vhT/
	grfnwnNBDgJMg9loTQM2jYULBTBiMlOM8z+AB6KM7a9kCPA4Oqt0t70kI6DJs+hpjI8b2na
	R+ShE6XRXUHHHQ04sExZrziWDctWpXutI5zQbK6dKoUFSnMN3h7d8MYMqReDX2zWZjOElxS
	hUzDKejrygK7P4oFW7uZhOUmZ8/ooj44cM/bbIoXD8dVNOJ4uiqAjf3QcRfXyQM6UtI4uxv
	irgsYnIZiWrRjvPgWy6itOOy4+OWKaGmdXIOVDQSNH0uCZTfxqr/n0JAYl5CjCmfG3RYhs3
	KGWZSZlM8jXtp1kUuwCECMYm6KiHJgH+DiSgCQ6F5GLzBKKvfd++MpWOPWco3CdoEKE/V8K
	/VNbeIeq4gkGtoiDsW6i3oLiMQNs0+ac9l5pasPPBpD6QZaQeOHa1jyYb1K5NeJvs26QdVU
	a0HzTJbhPuoIJFbMlTQbVTzPtoqsSuxSAjixdIayYh0z/7ZS5gZdaxcNskntzcZMMtXxK4r
	x2aUc2YKlAq5zPolcutOGVJxhQXHeIK7xKiK4be9dflcW/KXYlHSZaewU+4MNXxlUBuWE0o
	umoi3zZSLxzVJdmCUPrP6ptye2QrMDgcxVITt0OIPAo6c8cQ8+PPrEpZ24TzjSXYNtphFai
	1KW0IWc+N6+UXaZ9WdvjSuGOlqWMa3jzZ8kMXhqg8mbmftZUKrXP06mOQ7gASh1UjxJGVhI
	FEzhz4Aed8Owr0JsauUJeQ02l4q0jauWfFpGSor2OOvGMfq6siYnHX4S4dIEmuPPg==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_204325_938374_7D703565 
X-CRM114-Status: GOOD (  22.20  )
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

Implement timestamp as a configurable sub-component for both encoder
and funnel drivers.

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 drivers/hwtracing/coresight/Makefile          |   2 +-
 .../coresight/rvtrace-encoder-core.c          |  42 ++-
 .../coresight/rvtrace-encoder-sysfs.c         |  50 ++++
 drivers/hwtracing/coresight/rvtrace-encoder.h |   8 +
 drivers/hwtracing/coresight/rvtrace-funnel.c  |  95 +++++-
 drivers/hwtracing/coresight/rvtrace-funnel.h  |   8 +
 .../hwtracing/coresight/rvtrace-timestamp.c   | 278 ++++++++++++++++++
 .../hwtracing/coresight/rvtrace-timestamp.h   |  64 ++++
 8 files changed, 543 insertions(+), 4 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/rvtrace-timestamp.c
 create mode 100644 drivers/hwtracing/coresight/rvtrace-timestamp.h

diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 2264a313a773..3ad1b0399f86 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -58,7 +58,7 @@ obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
 coresight-ctcu-y := coresight-ctcu-core.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
 obj-$(CONFIG_RVTRACE) += rvtrace.o
-rvtrace-y := rvtrace-core.o
+rvtrace-y := rvtrace-core.o rvtrace-timestamp.o
 obj-$(CONFIG_RVTRACE_ATBBRIDGE) += rvtrace-atbbridge.o
 obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/coresight/rvtrace-encoder-core.c b/drivers/hwtracing/coresight/rvtrace-encoder-core.c
index 149a3cd97602..7bd075b8ce4f 100644
--- a/drivers/hwtracing/coresight/rvtrace-encoder-core.c
+++ b/drivers/hwtracing/coresight/rvtrace-encoder-core.c
@@ -14,9 +14,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/rvtrace.h>
 
 #include "rvtrace-encoder.h"
+#include "rvtrace-timestamp.h"
 #include "coresight-etm-perf.h"
 
 static int boot_enable;
@@ -172,6 +174,10 @@ static void encoder_set_config(struct rvtrace_component *comp)
 			 config->inst_syncmax);
 		config->inst_syncmax = BMVAL(val, 20, 23);
 	}
+
+	/* Configure timestamp only if encoder has timestamp component */
+	if (encoder_data->has_timestamp && encoder_data->ts_ctrl)
+		timestamp_set_config(comp, dev, &encoder_data->ts_config);
 }
 
 static int encoder_enable_hw(struct rvtrace_component *comp)
@@ -192,6 +198,16 @@ static int encoder_enable_hw(struct rvtrace_component *comp)
 	if (ret)
 		goto done;
 
+	/* Enable timestamp only if encoder has timestamp component */
+	if (encoder_data->has_timestamp && encoder_data->ts_ctrl) {
+		ret = timestamp_enable(comp);
+		if (ret) {
+			dev_warn(&encoder_data->csdev->dev,
+				 "Failed to enable timestamp\n");
+			ret = 0;  /* Don't fail encoder enable if timestamp fails */
+		}
+	}
+
 	val = readl_relaxed(comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
 	val |= RVTRACE_ENCODER_ITRACE;
 	writel_relaxed(val, comp->base + RVTRACE_COMPONENT_CTRL_OFFSET);
@@ -283,6 +299,10 @@ static void encoder_disable_hw(struct rvtrace_component *comp)
 {
 	struct encoder_data *encoder_data = rvtrace_component_data(comp);
 
+	/* Disable timestamp only if encoder has timestamp component */
+	if (encoder_data->has_timestamp && encoder_data->ts_ctrl)
+		timestamp_disable(comp);
+
 	if (rvtrace_disable_component(comp))
 		dev_err(&encoder_data->csdev->dev,
 			"timeout while waiting for Trace Encoder become disabled\n");
@@ -431,6 +451,26 @@ static int encoder_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, comp);
 
+	/* Check if encoder has timestamp component from device tree early */
+	encoder_data->has_timestamp = fwnode_property_present(dev->fwnode,
+							      "riscv,timestamp-present");
+	if (encoder_data->has_timestamp) {
+		if (rvtrace_init_timestamp(comp, &encoder_data->ts_config)) {
+			dev_err(dev, "Timestamp initialization failed\n");
+			return -EINVAL;
+		}
+
+		/* TODO: Default to enabling timestamp control if present, as
+		 * encoder_data->ts_ctrl can be configured via sysfs attribute,
+		 * but not through perf_event at this time. Future versions may
+		 * add support for configuring timestamps via perf_event.
+		 */
+		encoder_data->ts_ctrl = true;
+	}
+
+	/* Set component data before registration so is_visible callbacks can access it */
+	comp->id.data = encoder_data;
+
 	desc.name = devm_kasprintf(dev, GFP_KERNEL, "encoder%d", comp->cpu);
 	if (!desc.name)
 		return -ENOMEM;
@@ -452,8 +492,6 @@ static int encoder_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	comp->id.data = encoder_data;
-
 	rvtrace_cpu_encoder[comp->cpu] = comp;
 
 	encoder_set_default(comp);
diff --git a/drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c b/drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c
index c89af4cb591a..520f5a16f9a0 100644
--- a/drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c
+++ b/drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c
@@ -7,6 +7,7 @@
 #include <linux/sysfs.h>
 #include <linux/rvtrace.h>
 #include "rvtrace-encoder.h"
+#include "rvtrace-timestamp.h"
 #include "coresight-priv.h"
 
 static ssize_t cpu_show(struct device *dev,
@@ -48,9 +49,38 @@ static ssize_t reset_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(reset);
 
+static ssize_t ts_ctrl_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", encoder_data->ts_ctrl);
+}
+
+static ssize_t ts_ctrl_store(struct device *dev,
+			    struct device_attribute *attr,
+			    const char *buf, size_t size)
+{
+	unsigned long val;
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+
+	spin_lock(&encoder_data->spinlock);
+	encoder_data->ts_ctrl = !!val;
+	spin_unlock(&encoder_data->spinlock);
+
+	return size;
+}
+static DEVICE_ATTR_RW(ts_ctrl);
+
 static struct attribute *trace_encoder_attrs[] = {
 	&dev_attr_cpu.attr,
 	&dev_attr_reset.attr,
+	&dev_attr_ts_ctrl.attr,
 	NULL,
 };
 
@@ -285,6 +315,19 @@ static struct attribute *trace_encoder_features_attrs[] = {
 	NULL,
 };
 
+static umode_t timestamp_attr_is_visible(struct kobject *kobj,
+					 struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct encoder_data *encoder_data = rvtrace_component_data(comp);
+
+	if (encoder_data->has_timestamp)
+		return attr->mode;
+
+	return 0;
+}
+
 static const struct attribute_group trace_encoder_group = {
 	.attrs = trace_encoder_attrs,
 };
@@ -304,10 +347,17 @@ static const struct attribute_group trace_encoder_features_group = {
 	.name = "features",
 };
 
+static const struct attribute_group trace_encoder_timestamp_group = {
+	.attrs = (struct attribute **)timestamp_attrs,
+	.name = "timestamp",
+	.is_visible = timestamp_attr_is_visible,
+};
+
 const struct attribute_group *trace_encoder_groups[] = {
 	&trace_encoder_group,
 	&trace_encoder_mgmt_group,
 	&trace_encoder_control_group,
 	&trace_encoder_features_group,
+	&trace_encoder_timestamp_group,
 	NULL,
 };
diff --git a/drivers/hwtracing/coresight/rvtrace-encoder.h b/drivers/hwtracing/coresight/rvtrace-encoder.h
index 44f2066ad869..7a0ada11de8d 100644
--- a/drivers/hwtracing/coresight/rvtrace-encoder.h
+++ b/drivers/hwtracing/coresight/rvtrace-encoder.h
@@ -9,6 +9,7 @@
 #include <asm/local.h>
 #include <linux/spinlock.h>
 #include "coresight-priv.h"
+#include "rvtrace-timestamp.h"
 
 /* Trace Encoder Control Register */
 #define RVTRACE_ENCODER_ITRACE				    BIT(2)
@@ -126,7 +127,10 @@ struct encoder_config {
  * @spinlock:	    Only one at a time pls.
  * @sticky_enable:  True if trace encoder base configuration has been done.
  * @boot_enable:    True if we should start tracing at boot time.
+ * @has_timestamp:  True if this encoder has timestamp component.
+ * @ts_ctrl:        Controls the insertion of global timestamps in the trace streams.
  * @config:	    Structure holding configuration parameters.
+ * @ts_config:	    Timestamp configuration.
  */
 
 struct encoder_data {
@@ -134,10 +138,14 @@ struct encoder_data {
 	spinlock_t			spinlock;
 	bool				sticky_enable;
 	bool				boot_enable;
+	bool				has_timestamp;
+	bool				ts_ctrl;
 	struct encoder_config		config;
+	struct timestamp_config		ts_config;
 };
 
 extern const struct attribute_group *trace_encoder_groups[];
+extern const struct attribute *timestamp_attrs[];
 void encoder_set_default(struct rvtrace_component *comp);
 
 #endif
diff --git a/drivers/hwtracing/coresight/rvtrace-funnel.c b/drivers/hwtracing/coresight/rvtrace-funnel.c
index 0dc7799a64ac..ab7cdb29e5fd 100644
--- a/drivers/hwtracing/coresight/rvtrace-funnel.c
+++ b/drivers/hwtracing/coresight/rvtrace-funnel.c
@@ -6,9 +6,11 @@
 #include <linux/kernel.h>
 #include <linux/coresight.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/rvtrace.h>
 
 #include "coresight-priv.h"
+#include "rvtrace-timestamp.h"
 #include "rvtrace-funnel.h"
 
 DEFINE_CORESIGHT_DEVLIST(funnel_devs, "rvtrace_funnel");
@@ -36,6 +38,16 @@ static int funnel_enable_hw(struct rvtrace_component *comp, int port)
 		ret = rvtrace_enable_component(comp);
 		if (ret)
 			goto done;
+
+		/* Enable timestamp only if funnel has timestamp component */
+		if (funnel_data->has_timestamp && funnel_data->ts_ctrl) {
+			ret = timestamp_enable(comp);
+			if (ret) {
+				dev_warn(&funnel_data->csdev->dev,
+					 "Failed to enable timestamp\n");
+				ret = 0;  /* Don't fail funnel enable if timestamp fails */
+			}
+		}
 	}
 
 done:
@@ -79,6 +91,10 @@ static void funnel_disable_hw(struct rvtrace_component *comp, int inport)
 	if (--funnel_data->input_refcnt != 0)
 		return;
 
+	/* Disable timestamp only if funnel has timestamp component */
+	if (funnel_data->has_timestamp && funnel_data->ts_ctrl)
+		timestamp_disable(comp);
+
 	writel_relaxed(RVTRACE_FUNNEL_DISINPUT_MASK, comp->base + RVTRACE_FUNNEL_DISINPUT_OFFSET);
 
 	if (rvtrace_disable_component(comp))
@@ -162,15 +178,72 @@ static ssize_t cpu_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(cpu);
 
+static ssize_t ts_ctrl_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct funnel_data *funnel_data = rvtrace_component_data(comp);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", funnel_data->ts_ctrl);
+}
+
+static ssize_t ts_ctrl_store(struct device *dev,
+			    struct device_attribute *attr,
+			    const char *buf, size_t size)
+{
+	unsigned long val;
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct funnel_data *funnel_data = rvtrace_component_data(comp);
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+
+	spin_lock(&funnel_data->spinlock);
+	funnel_data->ts_ctrl = !!val;
+	spin_unlock(&funnel_data->spinlock);
+
+	return size;
+}
+static DEVICE_ATTR_RW(ts_ctrl);
+
 static struct attribute *trace_funnel_attrs[] = {
 	coresight_simple_reg32(control, RVTRACE_COMPONENT_CTRL_OFFSET),
 	coresight_simple_reg32(impl, RVTRACE_COMPONENT_IMPL_OFFSET),
 	coresight_simple_reg32(disinput, RVTRACE_FUNNEL_DISINPUT_OFFSET),
 	&dev_attr_reset.attr,
 	&dev_attr_cpu.attr,
+	&dev_attr_ts_ctrl.attr,
+	NULL,
+};
+
+static umode_t timestamp_attr_is_visible(struct kobject *kobj,
+					 struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct funnel_data *funnel_data = rvtrace_component_data(comp);
+
+	if (funnel_data->has_timestamp)
+		return attr->mode;
+
+	return 0;
+}
+
+static struct attribute_group trace_funnel_group = {
+	.attrs = trace_funnel_attrs,
+};
+
+static struct attribute_group trace_funnel_timestamp_group = {
+	.attrs = (struct attribute **)timestamp_attrs,
+	.name = "timestamp",
+	.is_visible = timestamp_attr_is_visible,
+};
+
+const struct attribute_group *trace_funnel_groups[] = {
+	&trace_funnel_group,
+	&trace_funnel_timestamp_group,
 	NULL,
 };
-ATTRIBUTE_GROUPS(trace_funnel);
 
 static int funnel_probe(struct platform_device *pdev)
 {
@@ -197,6 +270,26 @@ static int funnel_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, comp);
 
+	/* Check if funnel has timestamp component from device tree */
+	funnel_data->has_timestamp = fwnode_property_present(dev->fwnode,
+							     "riscv,timestamp-present");
+	if (funnel_data->has_timestamp) {
+		if (rvtrace_init_timestamp(comp, &funnel_data->ts_config)) {
+			dev_err(dev, "Timestamp initialization failed\n");
+			return -EINVAL;
+		}
+
+		/* TODO: Default to enabling timestamp control if present, as
+		 * encoder_data->ts_ctrl can be configured via sysfs attribute,
+		 * but not through perf_event at this time. Future versions may
+		 * add support for configuring timestamps via perf_event.
+		 */
+		funnel_data->ts_ctrl = true;
+	}
+
+	/* Set component data before registration so is_visible callbacks can access it */
+	comp->id.data = funnel_data;
+
 	desc.name = coresight_alloc_device_name(&funnel_devs, dev);
 	desc.access = CSDEV_ACCESS_IOMEM(comp->base);
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
diff --git a/drivers/hwtracing/coresight/rvtrace-funnel.h b/drivers/hwtracing/coresight/rvtrace-funnel.h
index e5247e6c1bf5..34394f775faa 100644
--- a/drivers/hwtracing/coresight/rvtrace-funnel.h
+++ b/drivers/hwtracing/coresight/rvtrace-funnel.h
@@ -19,6 +19,9 @@
  * @spinlock:     Only one at a time pls.
  * @was_enabled:  Flag showing whether the Trace Funnel was enabled.
  * @input_refcnt: Record the number of funnel inputs
+ * @has_timestamp: True if this funnel has timestamp component.
+ * @ts_ctrl:      Controls the insertion of global timestamps in the trace streams.
+ * @ts_config:    Timestamp configuration.
  */
 struct funnel_data {
 	struct coresight_device	*csdev;
@@ -26,6 +29,11 @@ struct funnel_data {
 	bool			was_enabled;
 	u32			input_refcnt;
 	u32			disintput;
+	bool			has_timestamp;
+	bool			ts_ctrl;
+	struct timestamp_config	ts_config;
 };
 
+extern const struct attribute *timestamp_attrs[];
+
 #endif
diff --git a/drivers/hwtracing/coresight/rvtrace-timestamp.c b/drivers/hwtracing/coresight/rvtrace-timestamp.c
new file mode 100644
index 000000000000..a82714f43d7c
--- /dev/null
+++ b/drivers/hwtracing/coresight/rvtrace-timestamp.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/bitfield.h>
+#include <linux/sysfs.h>
+#include <linux/rvtrace.h>
+
+#include "rvtrace-timestamp.h"
+#include "rvtrace-encoder.h"
+#include "rvtrace-funnel.h"
+#include "coresight-priv.h"
+
+int timestamp_enable(struct rvtrace_component *comp)
+{
+	u32 val;
+
+	val = readl_relaxed(comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	val |= (RVTRACE_TIMESTAMP_ENABLE | RVTRACE_TIMESTAMP_COUNT);
+
+	writel_relaxed(val, comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+
+	return rvtrace_poll_bit(comp, RVTRACE_TIMESTAMP_CTRL_OFFSET,
+				RVTRACE_TIMESTAMP_ENABLE_SHIFT, 1);
+}
+EXPORT_SYMBOL_GPL(timestamp_enable);
+
+void timestamp_disable(struct rvtrace_component *comp)
+{
+	u32 val;
+
+	val = readl_relaxed(comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	val &= ~(RVTRACE_TIMESTAMP_ENABLE | RVTRACE_TIMESTAMP_COUNT);
+	writel_relaxed(val, comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+}
+EXPORT_SYMBOL_GPL(timestamp_disable);
+
+struct timestamp_config *timestamp_get_config(struct rvtrace_component *comp)
+{
+	if (comp->id.type == RVTRACE_COMPONENT_TYPE_ENCODER) {
+		struct encoder_data *encoder_data = rvtrace_component_data(comp);
+
+		return &encoder_data->ts_config;
+	} else if (comp->id.type == RVTRACE_COMPONENT_TYPE_FUNNEL) {
+		struct funnel_data *funnel_data = rvtrace_component_data(comp);
+
+		return &funnel_data->ts_config;
+	} else {
+		return NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(timestamp_get_config);
+
+void timestamp_set_config(struct rvtrace_component *comp, struct device *dev,
+			  struct timestamp_config *config)
+{
+	u32 val;
+
+	val = readl_relaxed(comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+
+	val |= (FIELD_PREP(RVTRACE_TIMESTAMP_RUN_IN_DEBUG, config->run_in_debug) |
+		FIELD_PREP(RVTRACE_TIMESTAMP_MODE, config->mode) |
+		FIELD_PREP(RVTRACE_TIMESTAMP_PRESCALE, config->prescale));
+
+	writel_relaxed(val, comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+
+	/* Verify configuration was applied */
+	val = readl_relaxed(comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+
+	if (BMVAL(val, 3, 3) != config->run_in_debug) {
+		dev_warn(dev, "timestamp run_in_debug %#x not supported\n",
+			 config->run_in_debug);
+		config->run_in_debug = BMVAL(val, 3, 3);
+	}
+
+	if (BMVAL(val, 4, 6) != config->mode) {
+		dev_warn(dev, "timestamp mode %#x not supported\n",
+			 config->mode);
+		config->mode = BMVAL(val, 4, 6);
+	}
+
+	if (BMVAL(val, 8, 9) != config->prescale) {
+		dev_warn(dev, "timestamp prescale %#x not supported\n",
+			 config->prescale);
+		config->prescale = BMVAL(val, 8, 9);
+	}
+}
+EXPORT_SYMBOL_GPL(timestamp_set_config);
+
+static int rvtrace_timestamp_reset(struct rvtrace_component *comp)
+{
+	int ret;
+
+	writel_relaxed(0, comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp, RVTRACE_TIMESTAMP_CTRL_OFFSET,
+			       RVTRACE_TIMESTAMP_ACTIVE_SHIFT, 0);
+
+	if (ret)
+		return ret;
+
+	writel_relaxed(RVTRACE_TIMESTAMP_ACTIVE,
+			comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	return rvtrace_poll_bit(comp, RVTRACE_TIMESTAMP_CTRL_OFFSET,
+				RVTRACE_TIMESTAMP_ACTIVE_SHIFT, 1);
+}
+
+int rvtrace_init_timestamp(struct rvtrace_component *comp,
+			   struct timestamp_config *config)
+{
+	u32 val;
+	int ret;
+
+	val = readl_relaxed(comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	if (!FIELD_GET(RVTRACE_TIMESTAMP_ACTIVE, val)) {
+		ret = rvtrace_timestamp_reset(comp);
+		if (ret)
+			return ret;
+	}
+
+	val = readl_relaxed(comp->base + RVTRACE_TIMESTAMP_CTRL_OFFSET);
+
+	config->run_in_debug = !!(val & RVTRACE_TIMESTAMP_RUN_IN_DEBUG);
+	config->mode = BMVAL(val, 4, 6);
+	config->prescale = BMVAL(val, 8, 9);
+	config->width = BMVAL(val, 24, 29);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rvtrace_init_timestamp);
+
+static ssize_t run_in_debug_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct timestamp_config *config = timestamp_get_config(comp);
+
+	if (!config)
+		return -EINVAL;
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", config->run_in_debug);
+}
+
+static ssize_t run_in_debug_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t size)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct timestamp_config *config = timestamp_get_config(comp);
+	unsigned long val;
+
+	if (!config)
+		return -EINVAL;
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+
+	config->run_in_debug = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(run_in_debug);
+
+static const char * const modes_str[] = {
+	[TIMESTAMP_MODE_NONE] = "none",
+	[TIMESTAMP_MODE_EXTERNAL] = "external",
+	[TIMESTAMP_MODE_INTERNAL_SYSTEM] = "internal_system",
+	[TIMESTAMP_MODE_INTERNAL_CORE] = "internal_core",
+	[TIMESTAMP_MODE_SHARED] = "shared",
+};
+
+static ssize_t modes_available_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s %s %s %s %s\n",
+			    modes_str[TIMESTAMP_MODE_NONE],
+			    modes_str[TIMESTAMP_MODE_EXTERNAL],
+			    modes_str[TIMESTAMP_MODE_INTERNAL_SYSTEM],
+			    modes_str[TIMESTAMP_MODE_INTERNAL_CORE],
+			    modes_str[TIMESTAMP_MODE_SHARED]);
+}
+static DEVICE_ATTR_RO(modes_available);
+
+static ssize_t mode_preferred_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct timestamp_config *config = timestamp_get_config(comp);
+
+	if (!config)
+		return -EINVAL;
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", modes_str[config->mode]);
+}
+
+static ssize_t mode_preferred_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t size)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct timestamp_config *config = timestamp_get_config(comp);
+
+	if (!config)
+		return -EINVAL;
+
+	if (sysfs_streq(buf, modes_str[TIMESTAMP_MODE_NONE]))
+		config->mode = TIMESTAMP_MODE_NONE;
+	else if (sysfs_streq(buf, modes_str[TIMESTAMP_MODE_EXTERNAL]))
+		config->mode = TIMESTAMP_MODE_EXTERNAL;
+	else if (sysfs_streq(buf, modes_str[TIMESTAMP_MODE_INTERNAL_SYSTEM]))
+		config->mode = TIMESTAMP_MODE_INTERNAL_SYSTEM;
+	else if (sysfs_streq(buf, modes_str[TIMESTAMP_MODE_INTERNAL_CORE]))
+		config->mode = TIMESTAMP_MODE_INTERNAL_CORE;
+	else if (sysfs_streq(buf, modes_str[TIMESTAMP_MODE_SHARED]))
+		config->mode = TIMESTAMP_MODE_SHARED;
+	else
+		return -EINVAL;
+	return size;
+}
+static DEVICE_ATTR_RW(mode_preferred);
+
+static ssize_t prescale_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct timestamp_config *config = timestamp_get_config(comp);
+
+	if (!config)
+		return -EINVAL;
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", config->prescale);
+}
+
+static ssize_t prescale_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	unsigned long val;
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct timestamp_config *config = timestamp_get_config(comp);
+
+	if (!config)
+		return -EINVAL;
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	config->prescale = val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(prescale);
+
+static ssize_t width_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct rvtrace_component *comp = dev_get_drvdata(dev->parent);
+	struct timestamp_config *config = timestamp_get_config(comp);
+
+	if (!config)
+		return -EINVAL;
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", config->width);
+}
+static DEVICE_ATTR_RO(width);
+
+const struct attribute *timestamp_attrs[] = {
+	&dev_attr_run_in_debug.attr,
+	&dev_attr_modes_available.attr,
+	&dev_attr_mode_preferred.attr,
+	&dev_attr_prescale.attr,
+	&dev_attr_width.attr,
+	NULL,
+};
+EXPORT_SYMBOL_GPL(timestamp_attrs);
diff --git a/drivers/hwtracing/coresight/rvtrace-timestamp.h b/drivers/hwtracing/coresight/rvtrace-timestamp.h
new file mode 100644
index 000000000000..13cecddbd82c
--- /dev/null
+++ b/drivers/hwtracing/coresight/rvtrace-timestamp.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ * Author: liangzhen <zhen.liang@spacemit.com>
+ */
+
+#ifndef _RVTRACE_TIMESTAMP_H
+#define _RVTRACE_TIMESTAMP_H
+
+#include <linux/types.h>
+
+/* Timestamp Control Register */
+#define RVTRACE_TIMESTAMP_CTRL_OFFSET			0x040
+#define RVTRACE_TIMESTAMP_ACTIVE			BIT(0)
+#define RVTRACE_TIMESTAMP_COUNT				BIT(1)
+#define RVTRACE_TIMESTAMP_RESET				BIT(2)
+#define RVTRACE_TIMESTAMP_RUN_IN_DEBUG			BIT(3)
+#define RVTRACE_TIMESTAMP_MODE				GENMASK(6, 4)
+#define RVTRACE_TIMESTAMP_PRESCALE			GENMASK(9, 8)
+#define RVTRACE_TIMESTAMP_ENABLE			BIT(15)
+#define RVTRACE_TIMESTAMP_WIDTH				GENMASK(29, 24)
+
+#define RVTRACE_TIMESTAMP_ACTIVE_SHIFT			0
+#define RVTRACE_TIMESTAMP_ENABLE_SHIFT			15
+
+/* Timestamp Counter Lower Bits */
+#define RVTRACE_TIMESTAMP_COUNTER_LOW			0x048
+/* Timestamp Counter Upper Bits */
+#define RVTRACE_TIMESTAMP_COUNTER_HIGH			0x04C
+
+enum timestamp_mode {
+	TIMESTAMP_MODE_NONE = 0,
+	TIMESTAMP_MODE_EXTERNAL = 1,
+	TIMESTAMP_MODE_INTERNAL_SYSTEM = 2,
+	TIMESTAMP_MODE_INTERNAL_CORE = 3,
+	TIMESTAMP_MODE_SHARED = 4
+};
+
+/**
+ * struct timestamp_config - timestamp configuration for encoder/funnel
+ * @run_in_debug:       Continue timestamp counting in debug mode
+ * @mode:		Timestamp generation mode (periodic, event-triggered)
+ * @prescale:		Clock prescale factor (1, 4, 16, 64)
+ * @width:		Timestamp counter width in bits (0-63)
+ */
+struct timestamp_config {
+	bool				run_in_debug;
+	u8				mode;
+	u8				prescale;
+	u8				width;
+};
+
+struct rvtrace_component;
+
+/* Timestamp control functions */
+int timestamp_enable(struct rvtrace_component *comp);
+void timestamp_disable(struct rvtrace_component *comp);
+struct timestamp_config *timestamp_get_config(struct rvtrace_component *comp);
+void timestamp_set_config(struct rvtrace_component *comp, struct device *dev,
+			  struct timestamp_config *config);
+int rvtrace_init_timestamp(struct rvtrace_component *comp,
+			   struct timestamp_config *config);
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
