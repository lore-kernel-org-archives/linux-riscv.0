Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA27606A31F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qoYboeqZ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=dRq2txoK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tlv5l2o227P6/mUvhJ6sgXF5F0+RMEQZEUpi8YmdSyE=; b=qoYboeqZXvyhgEKJ1vPW+mlZ+D
	6k7Ridrz5W41XBt895flDdUvljWbxFc8sTDmLeWOhnglpMt8LAGxdcc2J+TUrkEwi3UljN/FatT0n
	fjEt/n1AwZfHUykl1wrBE/SqPagsu2rETMlIof0mA7chmQMlKqxBsiZFLykaLSzSS0t+iQInimhek
	j5Rn5qzmnN39qk7Xihp6hFb8TW21jvm5f5es1cPEn/bFab1F8xzfBGCJgmYohXM0V8AGoXkOcAh2Q
	lUP+zYtMVWW5Yc1hfMIzM6ms5Z0Qfs4supPfVt1ZWsvN1bWdYWYI6nZ87/cBarJ2O2QE+3ac/+Odt
	efwgxo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5n2-0000000FP9b-3Vdb;
	Fri, 23 Oct 2026 03:17:58 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5my-0000000FOtw-1Xpv
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725422;
	bh=bsuNMawsZswDZeHZEj3++8TLnfQ2KNVFzLTMhe5/fD8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=dRq2txoKN2EDhc90MFkidRPL+2nShBSkbpN1zmvRNrI/lpyhOG6yj7WJ/29JRk9Zd
	 pU9lYnDLdpae7HUxXCq2oMC0pH77Bdq9464ph4Z/rr63hqoJECM2u5VvYmh8EJ+iLw
	 u1SHXTUP/Kaoo/SsDqfAqS2eZcmo3yUCWiCokEi4=
X-QQ-mid: esmtpsz11t1792725362t82081f48
X-QQ-Originating-IP: VcyNqYW9njYNpQVBfz/f1c7Vuj+E1gizXSEdWY5ikc0=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18250832488890256495
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/24] gtrace: Add CoreSight funnel driver
Date: Fri, 23 Oct 2026 11:14:55 +0800
Message-Id: <20261023031505.2020925-15-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NY6OurWw+pG/c2vUUaVNPATZbmhJi9emAsaHRrBPMtOfBjns9xSIMM0U
	QMyDnY5fbdF1+IlDTck+0FRY7lnvz0C+2XqnMboHVCoSZo+7uW1ZsvB6lsGkvhZ0ZhI0vhz
	3Xc1JEd+DUgeK9/D1FJdcowmPi5qJnkOP0k317OMo4K6TvXWNQeZUujndJ6AbnfE5f11S2d
	yDiyt0fQaqfA3Up/ZdTSp7SwFjEPxrp9GLGUCu0RRYG61EAKYtHuyV+p0QKGmxXkXEg+/zF
	mufHrnD9WRZGFEbt9tVkBhsHSfs8aZYmy4tetM30cnaR6lIiNDzfQslY46bBVi33p1OAmV9
	4SEol1aT0idsEYZuesFIcJmDV4jFj8SJjicZRVMkp+rzGq5zggrVtyRKdqnFRql/eHZiB0d
	fpXdOOyPz2EQJCX1y4gLj/TIdM37j4CEeX83Db45qW7jgfQWdT59pIhYDKpAY5TA2hemoRc
	bSyUod2CEgxvcP7SfDVmTG0KlVyXU65wNPg9w5w0EXAKTQ59SRt3yYW34ZHNAiYInjKPrAy
	tx5y1oUjoBxmn+1bi5qZlNtNGLDVmhZsoUkoeKCLkR7NsNemnKCuKOAEJEgfRuWTFI1dkpH
	ck9P2szuzX1ACxZIbTbIkRVCeOH+i1BQY0O9GkGWGbyeNoke5yXO7EzTyaa6gdH80C4uRBJ
	RRp7GGb9hvs2Y2SWzutGgpJu9ldj2uENkIx1+lrojm7ts3kJFMbc9GtD7uHQSLdUJb9q6Ni
	X61b9HWCB4MAV6xm1wgOqWWuVZ+Cljtwp0RXeYE4cWEMgrh2Cph6WQwzQqp3T9itugnqxfg
	1Ojf6mtlyZNHZrvj0vs5p1Qf9MDYp0AIQrfuLkBKuOg/lLrEz4GU7TFaM8bqJSQXwWLrNVI
	5oma35igTjcpOJ/xXIWxDYct0Zc+3RQpbH7IJSS7avToDUNV5X8InEkjNfpMxKB5N5caww/
	+VDmpCDNYFXPZ0fOalH8WZM/yGP/uC6yJcwSiXoYdnFt+axk/ml6jhfgSLk4t1kY3YvN53C
	ZsLFTzrzibH3ZvM1Io9y2ct5l2bLHyQByc9xBiWzaMbvYob6ZT1ZVKKLt32w4m1bfIabaBy
	AQ6IW+2IfyUs/Yi4DV94b7AvUtg9LYO9w==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201753_046871_ED095538 
X-CRM114-Status: GOOD (  26.20  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a CoreSight funnel driver for the gtrace framework, derived from
drivers/hwtracing/coresight/coresight-funnel.c.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Kconfig            |  13 +
 drivers/hwtracing/gtrace/Makefile           |   1 +
 drivers/hwtracing/gtrace/coresight-funnel.c | 430 ++++++++++++++++++++
 3 files changed, 444 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/coresight-funnel.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index 5dce4474db7c..081af9c0c670 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -101,3 +101,16 @@ config GTRACE_CORESIGHT
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called coresight.
+
+config CORESIGHT_FUNNEL
+	tristate "CoreSight Trace Funnel driver"
+	depends on GTRACE_CORESIGHT
+	default y
+	help
+	  This driver provides support for the CoreSight funnel component.
+	  The funnel merges trace data from multiple input ports into a single
+	  output stream. It supports both static funnels (platform bus,
+	  arm,coresight-static-funnel) and dynamic funnels (AMBA bus).
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called coresight-funnel.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 0833a40c397c..d2745c961a75 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
 obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
 obj-$(CONFIG_RVTRACE_ATBBRIDGE) += rvtrace-atbbridge.o
 obj-$(CONFIG_GTRACE_CORESIGHT) += coresight-platform.o
+obj-$(CONFIG_CORESIGHT_FUNNEL) += coresight-funnel.o
diff --git a/drivers/hwtracing/gtrace/coresight-funnel.c b/drivers/hwtracing/gtrace/coresight-funnel.c
new file mode 100644
index 000000000000..e7a3f185da56
--- /dev/null
+++ b/drivers/hwtracing/gtrace/coresight-funnel.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2011-2012, The Linux Foundation. All rights reserved.
+ *
+ * Description: CoreSight Funnel driver for the gtrace framework.
+ * Derived from drivers/hwtracing/coresight/coresight-funnel.c.
+ */
+
+#include <linux/acpi.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/amba/bus.h>
+#include <linux/clk.h>
+
+#include "coresight.h"
+
+#define FUNNEL_FUNCTL		0x000
+#define FUNNEL_PRICTL		0x004
+
+#define FUNNEL_HOLDTIME_MASK	0xf00
+#define FUNNEL_HOLDTIME_SHFT	0x8
+#define FUNNEL_HOLDTIME		(0x7 << FUNNEL_HOLDTIME_SHFT)
+#define FUNNEL_ENSx_MASK	0xff
+
+/**
+ * struct funnel_drvdata - specifics associated to a funnel component
+ * @base:	memory mapped base address for this component.
+ * @atclk:	optional clock for the core parts of the funnel.
+ * @pclk:	APB clock if present, otherwise NULL
+ * @comp:	component vitals needed by the framework.
+ * @priority:	port selection order.
+ */
+struct funnel_drvdata {
+	void __iomem		*base;
+	struct clk		*atclk;
+	struct clk		*pclk;
+	struct gtrace_component *comp;
+	unsigned long		priority;
+};
+
+static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
+{
+	u32 functl;
+	int rc = 0;
+	struct gtrace_component *comp = drvdata->comp;
+
+	CS_UNLOCK(drvdata->base);
+
+	functl = readl_relaxed(drvdata->base + FUNNEL_FUNCTL);
+	/* Claim the device only when we enable the first slave */
+	if (!(functl & FUNNEL_ENSx_MASK)) {
+		rc = coresight_claim_device_unlocked(comp);
+		if (rc)
+			goto done;
+	}
+
+	functl &= ~FUNNEL_HOLDTIME_MASK;
+	functl |= FUNNEL_HOLDTIME;
+	functl |= (1 << port);
+	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
+	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
+done:
+	CS_LOCK(drvdata->base);
+	return rc;
+}
+
+static int funnel_enable(struct gtrace_component *comp,
+			 struct gtrace_connection *in,
+			 struct gtrace_connection *out)
+{
+	int rc = 0;
+	struct funnel_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+	bool first_enable = false;
+
+	if (in->dest_refcnt == 0) {
+		if (drvdata->base)
+			rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
+		if (!rc)
+			first_enable = true;
+	}
+	if (!rc)
+		in->dest_refcnt++;
+
+	if (first_enable)
+		dev_dbg(&comp->dev, "FUNNEL inport %d enabled\n",
+			in->dest_port);
+	return rc;
+}
+
+static void dynamic_funnel_disable_hw(struct funnel_drvdata *drvdata,
+				      int inport)
+{
+	u32 functl;
+	struct gtrace_component *comp = drvdata->comp;
+
+	CS_UNLOCK(drvdata->base);
+
+	functl = readl_relaxed(drvdata->base + FUNNEL_FUNCTL);
+	functl &= ~(1 << inport);
+	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
+
+	/* Disclaim the device if none of the slaves are now active */
+	if (!(functl & FUNNEL_ENSx_MASK))
+		coresight_disclaim_device_unlocked(comp);
+
+	CS_LOCK(drvdata->base);
+}
+
+static void funnel_disable(struct gtrace_component *comp,
+			   struct gtrace_connection *in,
+			   struct gtrace_connection *out)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+	bool last_disable = false;
+
+	if (--in->dest_refcnt == 0) {
+		if (drvdata->base)
+			dynamic_funnel_disable_hw(drvdata, in->dest_port);
+		last_disable = true;
+	}
+
+	if (last_disable)
+		dev_dbg(&comp->dev, "FUNNEL inport %d disabled\n",
+			in->dest_port);
+}
+
+static ssize_t priority_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val = drvdata->priority;
+
+	return sprintf(buf, "%#lx\n", val);
+}
+
+static ssize_t priority_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	int ret;
+	unsigned long val;
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	ret = kstrtoul(buf, 16, &val);
+	if (ret)
+		return ret;
+
+	drvdata->priority = val;
+	return size;
+}
+static DEVICE_ATTR_RW(priority);
+
+static u32 get_funnel_ctrl_hw(struct funnel_drvdata *drvdata)
+{
+	u32 functl;
+
+	CS_UNLOCK(drvdata->base);
+	functl = readl_relaxed(drvdata->base + FUNNEL_FUNCTL);
+	CS_LOCK(drvdata->base);
+
+	return functl;
+}
+
+static ssize_t funnel_ctrl_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	u32 val;
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	pm_runtime_get_sync(dev->parent);
+
+	val = get_funnel_ctrl_hw(drvdata);
+
+	pm_runtime_put(dev->parent);
+
+	return sprintf(buf, "%#x\n", val);
+}
+static DEVICE_ATTR_RO(funnel_ctrl);
+
+static struct attribute *coresight_funnel_attrs[] = {
+	&dev_attr_funnel_ctrl.attr,
+	&dev_attr_priority.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(coresight_funnel);
+
+static int funnel_probe(struct device *dev, struct resource *res)
+{
+	void __iomem *base;
+	struct gtrace_platform_data *pdata = NULL;
+	struct funnel_drvdata *drvdata;
+	struct gtrace_component_id id = {
+		.type = GTRACE_CORESIGHT_FUNNEL,
+		.version = CORESIGHT_COMPONENT_ID_VERSION,
+	};
+	int ret;
+
+	if (is_of_node(dev_fwnode(dev)) &&
+	    of_device_is_compatible(dev->of_node, "arm,coresight-funnel"))
+		dev_warn_once(dev, "Uses OBSOLETE CoreSight funnel binding\n");
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
+	/*
+	 * Map the device base for dynamic-funnel, which has been
+	 * validated by AMBA core.
+	 */
+	if (res) {
+		base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+		drvdata->base = base;
+		pdata->groups = coresight_funnel_groups;
+		pdata->io_mem = true;
+		pdata->base = base;
+		coresight_clear_self_claim_tag(pdata);
+	}
+
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->comp = gtrace_register_component(&id, "cs_funnel", pdata);
+	if (IS_ERR(drvdata->comp))
+		return PTR_ERR(drvdata->comp);
+
+	return 0;
+}
+
+static void funnel_remove(struct device *dev)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
+
+	gtrace_unregister_component(drvdata->comp);
+}
+
+#ifdef CONFIG_PM
+static int funnel_runtime_suspend(struct device *dev)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
+
+	return 0;
+}
+
+static int funnel_runtime_resume(struct device *dev)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
+}
+#endif
+
+static const struct dev_pm_ops funnel_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(funnel_runtime_suspend, funnel_runtime_resume, NULL)
+};
+
+static int funnel_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	int ret;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = funnel_probe(&pdev->dev, res);
+	pm_runtime_put(&pdev->dev);
+	if (ret)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void funnel_platform_remove(struct platform_device *pdev)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
+
+	if (WARN_ON(!drvdata))
+		return;
+
+	funnel_remove(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id funnel_match[] = {
+	{.compatible = "arm,coresight-static-funnel"},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, funnel_match);
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id funnel_acpi_ids[] = {
+	{"ARMHC9FE", 0, 0, 0}, /* ARM Coresight Static Funnel */
+	{"ARMHC9FF", 0, 0, 0}, /* ARM CoreSight Dynamic Funnel */
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, funnel_acpi_ids);
+#endif
+
+static struct platform_driver funnel_driver = {
+	.probe		= funnel_platform_probe,
+	.remove		= funnel_platform_remove,
+	.driver		= {
+		.name   = "coresight-funnel",
+		/* THIS_MODULE is taken care of by platform_driver_register() */
+		.of_match_table = funnel_match,
+		.acpi_match_table = ACPI_PTR(funnel_acpi_ids),
+		.pm	= &funnel_dev_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int dynamic_funnel_probe(struct amba_device *adev,
+				const struct amba_id *id)
+{
+	int ret;
+
+	ret = funnel_probe(&adev->dev, &adev->res);
+	if (!ret)
+		pm_runtime_put(&adev->dev);
+
+	return ret;
+}
+
+static void dynamic_funnel_remove(struct amba_device *adev)
+{
+	funnel_remove(&adev->dev);
+}
+
+static const struct amba_id dynamic_funnel_ids[] = {
+	{
+		.id     = 0x000bb908,
+		.mask   = 0x000fffff,
+	},
+	{
+		/* Coresight SoC-600 */
+		.id     = 0x000bb9eb,
+		.mask   = 0x000fffff,
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, dynamic_funnel_ids);
+
+static struct amba_driver dynamic_funnel_driver = {
+	.drv = {
+		.name	= "coresight-dynamic-funnel",
+		.pm	= &funnel_dev_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+	.probe		= dynamic_funnel_probe,
+	.remove		= dynamic_funnel_remove,
+	.id_table	= dynamic_funnel_ids,
+};
+
+static const struct gtrace_component_id coresight_funnel_ids[] = {
+	{ .type = GTRACE_CORESIGHT_FUNNEL,
+	  .version = CORESIGHT_COMPONENT_ID_VERSION, },
+	{},
+};
+
+static struct gtrace_driver coresight_funnel_driver = {
+	.id_table = coresight_funnel_ids,
+	.start_port = funnel_enable,
+	.stop_port = funnel_disable,
+	.driver = {
+		.name = "coresight-funnel",
+	},
+};
+
+static int __init funnel_init(void)
+{
+	int ret;
+
+	ret = gtrace_register_driver(&coresight_funnel_driver);
+	if (ret)
+		return ret;
+
+	ret = coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver);
+	if (ret) {
+		gtrace_unregister_driver(&coresight_funnel_driver);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit funnel_exit(void)
+{
+	coresight_remove_driver(&dynamic_funnel_driver, &funnel_driver);
+	gtrace_unregister_driver(&coresight_funnel_driver);
+}
+
+module_init(funnel_init);
+module_exit(funnel_exit);
+
+MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
+MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
+MODULE_AUTHOR("Zane Leung <liangzhen@linux.spacemit.com>");
+MODULE_DESCRIPTION("Arm CoreSight Funnel Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
