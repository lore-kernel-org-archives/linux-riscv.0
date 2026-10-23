Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55241606A32A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p3U3K3z1;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=PUj+R9gN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZTtIKIYfMTveJQOoSJur3mkhHLAx1W0JylOwPFFZ9ZA=; b=p3U3K3z1J54NOZQmnTBB/0LJXF
	961Z/tBJR/ZFGRtjTzFVFj3Bstidj28RZoWrL8PlL6lIbg/78NJABH8wbHxyoRLqLLddAMvvHLI1/
	iC6IxkNu4sDq1BhYZ5XIYqYlYL3bxan9/YcAqVEkDYMYgpjvkWN0jql0E/6meB4+ZX0yLbjbbyq96
	TnoDR2riOz+UzbjpruI1Xy0bf+sdo+KVg1J+lbXpb8H5Z1C/ziuxIc6QzA4gGR0wfdlFGmC5tggb1
	pGPvYNjpI2TdHLSse6I5Gek0XSlqs9VT3D4Ra403y/r7kzckWMBiZCPo8urmsiM/n90Ua8iERnLf2
	aqXDQBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5mg-0000000FOmS-2W63;
	Fri, 23 Oct 2026 03:17:34 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5mc-0000000FOcw-23oN
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725411;
	bh=H2IWjALvk048zmw1NNQJbWvBa81ip8KPbZToHaA7//w=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=PUj+R9gNtiM0DV8nPfgY/CYMmRT+y4kxvpObW9Ixgb9uWBKzHXqBeX2mD69+gc0OG
	 loDyRRsh5DJ1y80D2Gapo/yoovTqxtx2Kuu7GvSQnJnCONvGZD336703l3jpDq/D9y
	 al+Epl320HL8xDndnxOJDfMZdSaCbosJKJe8EF6o=
X-QQ-mid: esmtpsz11t1792725347t7dc60920
X-QQ-Originating-IP: FlUNMiK0eSMbacfSZBIik/POwMPtq8ySglL4HEmJvX0=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13336916703402963863
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
Subject: [PATCH 10/24] gtrace: Add RISC-V trace funnel driver
Date: Fri, 23 Oct 2026 11:14:51 +0800
Message-Id: <20261023031505.2020925-11-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MsVBbRzZvhHA1gJVb+9GtO3YAxyX3A5aLJznpRFBrSoRZnOxsOJEsrgM
	BzBzVxZu/z3VLSfzNfTBY899fks1tuqILtCQ5Uzqx7BiGQ7Y4HLYPay2mtXAUt76Qn93iRQ
	vLscifRfbQCoE7KeyuKT3AnS6uaTN/zY3/ulCP/Tt2o3/w+xX+lOPmXaTXTbSkPXEiYYT9o
	JTY0BSs5/CdjvuIz76VaNHFU2qvuyamO8703TW098njTaH3gUZp/ATHMEjV+OPox+AXL0aQ
	HAGQDvP3lmnQ/62fvfURb/fnM5BBMVEK+tJCXBnOcjEwenluSKS2e3f4wAcIV1BRz3u/uiN
	0VQLbfnccXVUTLaIjrpJ61IKkIkCs5qaDHqmpAPEsS0uhVFrUibwv4hVr8S4DBiGvNB2iko
	PBkExWp5a/higWs90Pd108k8EJJkmwTEQwS2ty+o3dH58GygC5DyvkP6U6exspMr1i077ar
	hWxQfiGe7GUZw2e9u4DbyiqyPacT9dxj2JPRQAl2lGSFGuqnQ4PuyU0b7tUJaKYWPCRHYn2
	MF11WpUJuxG6dSil0Oe83nZbd6YOshbvDPZ9MPJKOQMKRwBPrX1IOm3yrGYAuPWvaWYIH1j
	wgFO+lV0t/DsoSGMmdPILvtIXw0qtR9zw5sL345i0YMfptH4CGhQQtZaDDvaGejUxj64+Jl
	EMZRqjHGRy7xFHoNXERnokQ/KhNKLAhm1dnLdpqfkcz8hHnUlGvtx5TAElux5pbFYGpNi0/
	9jxq657k43BNIoi0x91OYX49e2aPrAPRPVGWcODdtTU6drx7AWPcFO0DmClzAyKwE1UFQV0
	X1rFdn/LLHNcq2xG/KUNxm6edxy44dqzAm7L89EIlzKHkWC0u0gipdkmzp67UbdOUXvjSgF
	37Ie4rUliIShtKE63DjZMtt/l9AAyeO/+y5q5h8ZntTJEuIupjzJA9QcQvvg32H661PrGF+
	i+5Fcn+gqQ4km+3J3T0NGTJWfp6TiWT65zc1Au8C8MIRKDSRy1o4pt17fEcct+LSBTGOn2q
	bqzSW9U4DGa3XjpEVH4m+lYEOxcbziaNmkUUh76OMHCKWFv/I/JX39WiAukOd2anQicfHPX
	lwxP/ZMft8azdAbKf6NR7A=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201731_185947_09800226 
X-CRM114-Status: GOOD (  25.53  )
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

Add initial implementation of RISC-V Trace funnel driver. The funnel
is defined in the RISC-V Trace Control Interface specification.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Kconfig            |  14 ++
 drivers/hwtracing/gtrace/Makefile           |   1 +
 drivers/hwtracing/gtrace/rvtrace-funnel.c   | 165 ++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-funnel.h   |  21 +++
 drivers/hwtracing/gtrace/rvtrace-platform.c |   3 +
 drivers/hwtracing/gtrace/rvtrace.h          |   1 +
 6 files changed, 205 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-funnel.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-funnel.h

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e5b62d65e2fd..f6026965c54d 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -57,3 +57,17 @@ config RVTRACE_RAMSINK
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-ramsink.
+
+config RVTRACE_FUNNEL
+	tristate "RISC-V Trace Funnel driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for the RISC-V trace funnel component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The funnel merges trace data from multiple input ports into a single
+	  output stream. It is a link component in the trace path between
+	  sources and sinks.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-funnel.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 87cb5add78d4..9c99d917b9f4 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
+obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracing/gtrace/rvtrace-funnel.c
new file mode 100644
index 000000000000..941cd3360395
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+#include "rvtrace-funnel.h"
+
+static int rvtrace_funnel_start(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to start rvtrace funnel.\n");
+
+	return ret;
+}
+
+static int rvtrace_funnel_stop(struct gtrace_component *comp)
+{
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop rvtrace funnel.\n");
+		return ret;
+	}
+
+	if (priv->disinput_mask)
+		gtrace_write32(comp->pdata, RVTRACE_FUNNEL_DISINPUT_MASK,
+				RVTRACE_FUNNEL_DISINPUT_OFFSET);
+
+	return 0;
+}
+
+static int _rvtrace_funnel_start_port(struct gtrace_component *comp, int port)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+	u32 disinput;
+	int ret;
+
+	if (!(priv->disinput_mask & BIT(port)))
+		return 0;
+
+	disinput = gtrace_read32(pdata, RVTRACE_FUNNEL_DISINPUT_OFFSET);
+	disinput &= ~BIT(port);
+	gtrace_write32(pdata, disinput, RVTRACE_FUNNEL_DISINPUT_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_FUNNEL_DISINPUT_OFFSET,
+			      port, 0, comp->pdata->control_poll_timeout_usecs);
+	if (ret)
+		dev_err(&comp->dev, "failed to enable rvtrace funnel inport %d.\n", port);
+
+	return ret;
+}
+
+static int rvtrace_funnel_start_port(struct gtrace_component *comp,
+				     struct gtrace_connection *in,
+				     struct gtrace_connection *out)
+{
+	int ret = 0;
+
+	if (in->dest_refcnt == 0)
+		ret = _rvtrace_funnel_start_port(comp, in->dest_port);
+	if (!ret)
+		in->dest_refcnt++;
+
+	return ret;
+}
+
+static void rvtrace_funnel_stop_port(struct gtrace_component *comp,
+				     struct gtrace_connection *in,
+				     struct gtrace_connection *out)
+{
+	/*
+	 * Setting trFunnelEnable to 0 flushes any queued trace data to output.
+	 * Due to this flush behavior of the RISC-V trace funnel during component
+	 * disablement, we do not disable individual ports here. Instead, we
+	 * defer it and disable all ports at once when the entire component is
+	 * stopped. For now, we only need to decrement the reference count.
+	 */
+	--in->dest_refcnt;
+}
+
+static ssize_t disinput_show(struct device *dev,
+                            struct device_attribute *attr, char *buf)
+{
+	u32 val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	val = gtrace_read32(comp->pdata, RVTRACE_FUNNEL_DISINPUT_OFFSET);
+
+	return scnprintf(buf, PAGE_SIZE, "0x%x\n", val);
+}
+static DEVICE_ATTR_RO(disinput);
+
+static struct attribute *rvtrace_funnel_attrs[] = {
+	&dev_attr_disinput.attr,
+	NULL,
+};
+
+static struct attribute_group rvtrace_funnel_group = {
+	.attrs = rvtrace_funnel_attrs,
+};
+
+const struct attribute_group *rvtrace_funnel_groups[] = {
+	&rvtrace_funnel_group,
+	NULL,
+};
+EXPORT_SYMBOL_GPL(rvtrace_funnel_groups);
+
+static int rvtrace_funnel_probe(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_funnel_priv *priv;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	gtrace_write32(pdata, RVTRACE_FUNNEL_DISINPUT_MASK, RVTRACE_FUNNEL_DISINPUT_OFFSET);
+	priv->disinput_mask = gtrace_read32(pdata, RVTRACE_FUNNEL_DISINPUT_OFFSET);
+	dev_set_drvdata(&comp->dev, priv);
+	return 0;
+}
+
+static const struct gtrace_component_id rvtrace_funnel_ids[] = {
+	{ .type = GTRACE_RVTRACE_FUNNEL,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_funnel_driver = {
+	.id_table = rvtrace_funnel_ids,
+	.start = rvtrace_funnel_start,
+	.stop = rvtrace_funnel_stop,
+	.start_port = rvtrace_funnel_start_port,
+	.stop_port = rvtrace_funnel_stop_port,
+	.probe = rvtrace_funnel_probe,
+	.driver = {
+		.name = "rvtrace-funnel",
+	},
+};
+
+static int __init rvtrace_funnel_init(void)
+{
+	return gtrace_register_driver(&rvtrace_funnel_driver);
+}
+
+static void __exit rvtrace_funnel_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_funnel_driver);
+}
+
+module_init(rvtrace_funnel_init);
+module_exit(rvtrace_funnel_exit);
+
+MODULE_AUTHOR("Zane Leung");
+MODULE_DESCRIPTION("RISC-V Trace Funnel Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.h b/drivers/hwtracing/gtrace/rvtrace-funnel.h
new file mode 100644
index 000000000000..41547c8971ba
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#ifndef __RVTRACE_HENNEL_H__
+#define __RVTRACE_HENNEL_H__
+
+#define RVTRACE_FUNNEL_DISINPUT_OFFSET	0x008
+#define RVTRACE_FUNNEL_DISINPUT_MASK	0xffff
+
+/**
+ * struct rvtrace_encoder_priv - Private driver data for the rvtrace funnel
+ * @disinput_mask: Bitmask of inputs supporting disable.
+ */
+
+struct rvtrace_funnel_priv {
+	u32 disinput_mask;
+};
+
+#endif /* __RVTRACE_ENCODER_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index 64496a638359..ad8daa06e13e 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -133,6 +133,9 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	case GTRACE_RVTRACE_ENCODER:
 		pdata->groups = rvtrace_encoder_groups;
 		break;
+	case GTRACE_RVTRACE_FUNNEL:
+		pdata->groups = rvtrace_funnel_groups;
+		break;
 	default:
 		pdata->groups = NULL;
 	}
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index fee8e2e4f42a..a345ba110267 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -120,5 +120,6 @@ extern const struct gtrace_hw_ops rvtrace_hw_ops;
 
 /* Sysfs attribute groups for RISC-V trace components */
 extern const struct attribute_group *rvtrace_encoder_groups[];
+extern const struct attribute_group *rvtrace_funnel_groups[];
 
 #endif /* __LINUX_RVTRACE_H__ */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
