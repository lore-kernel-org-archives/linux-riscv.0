Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED66606A335
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SRDrQvwI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=USZU3hoc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=VklU3FCZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hQMDwLoaU9RuCoypL4AdXgodO62XXxLiU42Sfx7BJ1w=; b=SRDrQvwIJjwuYPyTIuzQm2AwqA
	ZqBsym682a3nkg0NDPC9LTE+SZVo/pfZBOdsnzpO8xnDqIcuZ1wdXHFZL1/iCXe90xbG2PLnkCTYN
	2v9ym1KFRpQrxHeAWPNgx+NWJ33XPKEjUnjQHFM6Zo28ucJQDJDnZ9DipAj7kBD74yhArytgwaotf
	OQGTNd7ndsjMg0+jWFhUhTR0ApYLfg6KLLsfduZBxV4LRmHsOFgEby5MH3/Eg7PePOBCgC11+g2LM
	Q72S1s+GAsPYVBohlXrrjfBpJvQTpta7v/ZBnbA8UT51Dur1XPchfw4DjHDvZcgqPG4VJbLuItoWn
	kOiv67lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5nP-0000000FPWu-1Wm5;
	Fri, 23 Oct 2026 03:18:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5nN-0000000FPTm-2FSi
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 Oct 2026 03:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4i8JwP6oCKvaWFiCr0xBtQ3S5XL/T5PUUSds+1oSotw=; b=USZU3hocpbdZqmclvfAXkG6g5h
	I2iK6zyHtBoMZ1h2MEH3FrP0dXwBG4P//Q12CPQMk2c9UTPvBszvlg/eYPuKWRsEZnNH4UJz787VM
	4CKeTAZaVbBZ6J97uAcwfjmgwOeZfjjJFc/aCef4ZDMvSwKgJsiUeR62M3Uw8yM83FL9QRsG4H65S
	tclT98ShoV/13J4oZ5eWlKd732Nx5ZYRO+Wre2mQJFxLYChrAVVPP2+cE9SrTyYhv7qBVMtLt0+Ri
	Y416Ya7ilptR8GVdzKC6bxw/0WvXXE4AcsHa0awtM5dPQN5IG5UY2MCsWSl0KGkjpZKy4tO5eX1VM
	b2pYwo5w==;
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5n8-00000008cDy-3pqR
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725416;
	bh=4i8JwP6oCKvaWFiCr0xBtQ3S5XL/T5PUUSds+1oSotw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=VklU3FCZ9l+k3G839R7yD/NulkJswVc74YKE00LnWlFk/otLUeqXjM9AF7qRGwFXs
	 pBxOGmbm9AgOrXnIiB/qNQguJva+4nW6xP5GqkBbNcbYRrkVBTtlUnwmIPATmZJthU
	 NV5Xu8RIQd438+fryXhSo6cW+8eOdqwoa3dQuquA=
X-QQ-mid: esmtpsz11t1792725355td00874e0
X-QQ-Originating-IP: OUbCtLgyPlEsH2hTIB5YNITd6hW6VB/tUQYHlZsP6gU=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 745812888069500600
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
Subject: [PATCH 12/24] gtrace: Add RISC-V trace ATB bridge driver
Date: Fri, 23 Oct 2026 11:14:53 +0800
Message-Id: <20261023031505.2020925-13-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: ON42YI7R3macNPKX5ZyvX/bC41mVhhZ+Or3guCM/eKDDsxTRjo2+r0MY
	KGbtssKK/ZBVekllhGDT0/KB07qUbm3xRJ1j/JGlQx+gQi5TDgDeE3GdrIKujJba/jcpFGy
	pCCEUOhF9jjTMpg3c0Z5pbvNVXNyMVIcmeg1ERLhb+r346Fn1m6Zh4tf4ag80iOyuW8hfUT
	Enj6yiJ7W+nWYzkwKfoJC2Ci68mq4KVDI7vKPYWdpY73kQhBk/4ZdhIBw+UChIvz49ecILK
	E1nVpNwojjD44GrPj6ocOrPPSHlb5EmImLae1D5/T6ogv7+3FN0OMnrajIsjhU6Lk6DrKqR
	iDiQ+DZCgQnbbWQBfrcqrb51HuzvzbxoI67alRDJahKhzgPvSYA6XFPIFjC1qnqjWShoFEP
	me5O7nxzr1+3pGh5KKtAj2aXEZhsVvtsrTOVcQpEUipoeGkhoMNnDJVvIWQLBbH3AtKjUdX
	JnXoEfXrBpLwa6yJmkyGAKqH0BQaWdVaF9sMqpYj3VLgI9vlEQd6M9eXR9jchEFgzTuyy+Z
	KsOmz5HCu2Jk1YOBK9zhyK1GWwLS6tRoOLnmfWdaOm6C9vf0QLpr7nT77KZpRywJl3dXoAv
	BV5nAUZpYNs3kjbbJN2MBvRAXORtT6LxMXnrJXQuESHi8sbppEGEnRuek+2Hob8yR+c4iih
	4E2pwTgclXDYoHUKPkQa0GNZQ2fwC4Mk5J0tSN3yM5OwysD3ob3C2XzKH+nnXBDk7DNW6RR
	xC+t4dLGfM11Ro3nWetZzkniOzbu7VcFiSrDIriP8jOndISXlSUK/OG4EPn5dr2Sx4UBOIw
	rZi6koOJ4S81BOuI1nw6lQq1dsy1+lnwRtumGdod4oO3NI5GT5NDjxqIttJrYgGk7G4QM8z
	ZhZ+meRHqb2AgHi9W1FounI3e5tRJodx7nmnSC1e6rdhx4ohnUMbo0MJRKTe311o/4OfrjR
	go7VBN2lHliqT3c5eBkDSXxhH9wT4Lge8Nb9/J1uMGmVKGzHW2Eh2dmkEz2c28TSOAObgHM
	JfStLkeqrihfe16LLKLlhH2GpkGzu/RQcKWO6OsoCgAEd2w1jhi0hXvrDrjaGEo2/VPItEK
	OB2pKnSzcDu20F0vxr/13Y=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_041809_533331_96B3B9E8 
X-CRM114-Status: GOOD (  21.73  )
X-Spam-Score: -0.2 (/)
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

Add initial implementation of RISC-V Trace atbbridge driver. The
atbbridge is defined in the RISC-V Trace Control Interface specification.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Kconfig             |  15 ++
 drivers/hwtracing/gtrace/Makefile            |   1 +
 drivers/hwtracing/gtrace/rvtrace-atbbridge.c | 153 +++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-platform.c  |   3 +
 drivers/hwtracing/gtrace/rvtrace.h           |   1 +
 5 files changed, 173 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-atbbridge.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index f6026965c54d..3af47d7c3ce3 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -71,3 +71,18 @@ config RVTRACE_FUNNEL
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-funnel.
+
+config RVTRACE_ATBBRIDGE
+	tristate "RISC-V Trace ATB Bridge driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for the RISC-V trace ATB bridge
+	  component which is defined by the RISC-V Trace Control Interface
+	  specification. The ATB bridge converts the RISC-V trace stream
+	  to the ARM Advanced Trace Bus (ATB) protocol, allowing RISC-V
+	  trace sources to feed into ARM CoreSight trace components. It is
+	  a link component in the trace path.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-atbbridge.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index b60d3cfe5248..3f1dcb5664a2 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
 obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
+obj-$(CONFIG_RVTRACE_ATBBRIDGE) += rvtrace-atbbridge.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-atbbridge.c b/drivers/hwtracing/gtrace/rvtrace-atbbridge.c
new file mode 100644
index 000000000000..92a59ed80a11
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-atbbridge.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/idr.h>
+#include <linux/types.h>
+#include <linux/bitfield.h>
+#include "rvtrace.h"
+
+#define RVTRACE_ATBBRIDGE_CTRL_ATID_MASK    GENMASK(14, 8)
+#define RVTRACE_ATBBRIDGE_ATID_MIN	    0x1
+#define RVTRACE_ATBBRIDGE_ATID_MAX	    0x6f
+
+static DEFINE_IDA(rvtrace_atbbridge_atid_ida);
+
+struct rvtrace_atbbridge_priv {
+	int atid;
+};
+
+static int rvtrace_atbbridge_start(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to start atbbridge.\n");
+
+	return ret;
+}
+
+static int rvtrace_atbbridge_stop(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to stop atbbridge.\n");
+
+	return ret;
+}
+
+static ssize_t cpu_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	return sysfs_emit(buf, "%d\n", comp->pdata->bound_cpu);
+}
+static DEVICE_ATTR_RO(cpu);
+
+static ssize_t atid_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_atbbridge_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->atid);
+}
+static DEVICE_ATTR_RO(atid);
+
+static struct attribute *rvtrace_atbbridge_attrs[] = {
+	&dev_attr_cpu.attr,
+	&dev_attr_atid.attr,
+	NULL,
+};
+
+static const struct attribute_group rvtrace_atbbridge_group = {
+	.attrs = rvtrace_atbbridge_attrs,
+};
+
+const struct attribute_group *rvtrace_atbbridge_groups[] = {
+	&rvtrace_atbbridge_group,
+	NULL,
+};
+EXPORT_SYMBOL_GPL(rvtrace_atbbridge_groups);
+
+static void rvtrace_atbbridge_cleanup(struct gtrace_component *comp)
+{
+	struct rvtrace_atbbridge_priv *priv = dev_get_drvdata(&comp->dev);
+
+	ida_free(&rvtrace_atbbridge_atid_ida, priv->atid);
+}
+
+static int rvtrace_atbbridge_probe(struct gtrace_component *comp)
+{
+	struct rvtrace_atbbridge_priv *priv;
+	u32 val;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->atid = ida_alloc_range(&rvtrace_atbbridge_atid_ida,
+				     RVTRACE_ATBBRIDGE_ATID_MIN,
+				     RVTRACE_ATBBRIDGE_ATID_MAX,
+				     GFP_KERNEL);
+	if (priv->atid < 0) {
+		dev_err(&comp->dev, "failed to allocate ATID.\n");
+		return priv->atid;
+	}
+
+	val = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~RVTRACE_ATBBRIDGE_CTRL_ATID_MASK;
+	val |= FIELD_PREP(RVTRACE_ATBBRIDGE_CTRL_ATID_MASK, priv->atid);
+	gtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	dev_set_drvdata(&comp->dev, priv);
+
+	return 0;
+}
+
+static void rvtrace_atbbridge_remove(struct gtrace_component *comp)
+{
+	rvtrace_atbbridge_cleanup(comp);
+}
+
+static const struct gtrace_component_id rvtrace_atbbridge_ids[] = {
+	{ .type = GTRACE_RVTRACE_ATBBRIDGE,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_atbbridge_driver = {
+	.id_table = rvtrace_atbbridge_ids,
+	.probe = rvtrace_atbbridge_probe,
+	.remove = rvtrace_atbbridge_remove,
+	.start = rvtrace_atbbridge_start,
+	.stop = rvtrace_atbbridge_stop,
+	.driver = {
+		.name = "rvtrace-atbbridge",
+	},
+};
+
+static int __init rvtrace_atbbridge_init(void)
+{
+	return gtrace_register_driver(&rvtrace_atbbridge_driver);
+}
+
+static void __exit rvtrace_atbbridge_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_atbbridge_driver);
+	ida_destroy(&rvtrace_atbbridge_atid_ida);
+}
+
+module_init(rvtrace_atbbridge_init);
+module_exit(rvtrace_atbbridge_exit);
+
+MODULE_AUTHOR("Zane Leung");
+MODULE_DESCRIPTION("RISC-V Trace ATB Bridge Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index ad8daa06e13e..9bd315867082 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -136,6 +136,9 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	case GTRACE_RVTRACE_FUNNEL:
 		pdata->groups = rvtrace_funnel_groups;
 		break;
+	case GTRACE_RVTRACE_ATBBRIDGE:
+		pdata->groups = rvtrace_atbbridge_groups;
+		break;
 	default:
 		pdata->groups = NULL;
 	}
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index a345ba110267..5cbe3405e274 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -121,5 +121,6 @@ extern const struct gtrace_hw_ops rvtrace_hw_ops;
 /* Sysfs attribute groups for RISC-V trace components */
 extern const struct attribute_group *rvtrace_encoder_groups[];
 extern const struct attribute_group *rvtrace_funnel_groups[];
+extern const struct attribute_group *rvtrace_atbbridge_groups[];
 
 #endif /* __LINUX_RVTRACE_H__ */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
