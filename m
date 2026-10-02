Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ABFCA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 06:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqJ0OswkIQ4q5g0RZKohT26wW4z+HGI189K/ebmBTMg=; b=Ugp99LUCFKie0P
	xoqWB4TKWL3jM+3JIKgBThOkLh0UvkN7684oaDIFX5xYc2Hu0xFMxLkmUmC4ZHBsoDDt6WGCW8U3u
	dTTFHn9HQOjqCE9txV6qBFs8iI7xAB+lZC44a3XMu8Iey9hJIukLBx25By7ZWO/Eq4deRDaJiwF3S
	GPKJjHZ9gxoQZMxUU8SY3l/a3jZnhywA3y+SXsQ5VQMf6VgTKCBfYRr47mNig/7DdVOTPtut7PboI
	bVwbxJ7x7NoNdvwIwbjKFRQ25fuxs4JAgF/OZfW0cpODeh4Bd7lbnsUaMs6lHkeYc4Hbzqu0dJx7F
	Wf1QXT2jhlelw40Ooxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWph-0000000AjBI-2ewa;
	Fri, 02 Oct 2026 06:33:25 +0000
Received: from mail-dl2-x0d.google.com ([2607:f8b0:4864:38::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWpf-0000000AjAI-0hXV
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 06:33:24 +0000
Received: by mail-dl2-x0d.google.com with SMTP id a92af1059eb24-148b5c829e8so5770436c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 23:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790922802; x=1791527602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsQCM1m1fnFkJf3mOSpgytxAYne0rV7bfE6IaOdnVKQ=;
        b=IMzWjywzQQzBnvoPZoMppqIJkR9Mii5oEZGLMOQZ94Xe3wgoX/uWHonwUgBrug7G+n
         C7dtJ2l58ogzdyNgBDNK4syX5KY4WMCeYc+kiqOhXlwzWrEAmz4u2TnMrx379cuMFiHm
         Bi8ECMjZAgWPWX/wVnJiCKgTsRaS2a9E63lLNg8SfmE/SyVJ25Y54fs42sc86yo/9rg4
         3oS2qb+NOPa7ZepWzNzH2mOrQjVC3FoJZ7kZKNKW2lYSVX8WrLR7UOp3WU0d4uiJv5Wr
         8S1UnsmHzuleIZOy+6inNOvmjZO86wFTp/FW41OPza9zcSbU1+/IoYK0368I2FDrO2lR
         hiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922802; x=1791527602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsQCM1m1fnFkJf3mOSpgytxAYne0rV7bfE6IaOdnVKQ=;
        b=Ap0tsaa2URxMJGIo/6TEi4gkYbG9F2HN9F4x/eaEkgZB1fbiboz1zskNJKWrMpGbIX
         GHtNkwtohqy8S5KSUmpmIWGkBneGd9uHew3S8uJrJLbLMZ0FDgw1RDOZcrEOaLpKIbZ1
         zhesORvWGorS0FxbQlf5Yx4KZ7xf5Ki02Bo7V6AiwilbNjVnpfpArsT3e9SMpw74++kG
         BhxliD9mNJj6nFczeKoD+GY6VNdD1TtaNvjy/iQe83PfKNg9Zcut9cAbn9vevcLYb/jF
         K01SgIHgwtc8pnB7RdJCQe+eqyQ08T5hjip69s1oOay1214lCH0dtjPjSVb7RtfKnA6Q
         wDYg==
X-Forwarded-Encrypted: i=1; AKwUvBxbFNUbixyUa/FR+eLSBo4agk82abRxFTkMZNb0fl16Jtbb1FDYFZRMGnEZV2CTNBHdwgyVPS0zyJcCHA==@lists.infradead.org
X-Gm-Message-State: AFuF++lPZoz/c1o1XKaeOpLULkdvy1zeeCNvxXnD0FxPY7PHVHVbbyLb
	vLIcPmVz1iKaX1ABIOENoD/cFTTMqGNKG9Lm+m66zlaP4Ol+SydpLgQ6iJEevKGy+6WR+Awl7pw
	2mg6gMj7txw==
X-Gm-Gg: AYBFou0zjM1ecgn0vIlz3PJM8NQAhZK0c5YJZkhyqXcJ90AITV7r5C0DHLYI++T9R6G
	Qk3YC6X/cD1R3TcoFvi1qUeRE+s9MS2tM8mRAj0tJY72fRX20DW7DnrJireVphuTzjjFiFYqjST
	g/PDNteU+eclZADNjWjElUMRlB3kS1DC3c+N3Eu0XEkLWAW3tX+iHJmzHJ/a4ggSaDVFjml1cgX
	zNAGpGd4jDSUoI+w1F030upEA+bpaL63kUioHoN16PNDtKVD1kCFG8nT6iS4XRg4xvlItScDZ4A
	KWiXnN8xO0sgYgXPASxH2wq7fm8JVuz46biiJy5CbmEQatkixc48V7R8Gdf+DO9CppJZjoapgbI
	yddFAqr1/poneYzSpae9JyS+3NyWBWCIWmQwUlUtBPJ3WAuykPHQqC3lzhvLWiGuFPj/gGrVJlA
	XRzL66hQ1iUm2wWEnsFwSkBNdE/5JBcJUgF6ZgRBTNHPsHSVWXHsrrv7esYvJ/74R4Ekc8k1lSy
	QoCkOiXx2A=
X-Received: by 2002:a05:701b:454c:20b0:150:696:26c4 with SMTP id a92af1059eb24-15006962925mr411174c88.29.1790922802378;
        Thu, 01 Oct 2026 23:33:22 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6315754c88.4.2026.10.01.23.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:33:21 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	david.laight.linux@gmail.com,
	zhangzhanpeng.jasper@bytedance.com,
	yang.yicong@picoheart.com,
	nutty.liu@hotmail.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v15 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Thu,  1 Oct 2026 23:33:12 -0700
Message-ID: <20261002063315.1535817-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20261002063315.1535817-1-zong.li@sifive.com>
References: <20261002063315.1535817-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_233323_212145_EAD40DE9 
X-CRM114-Status: GOOD (  18.13  )
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

Create an auxiliary device for HPM when the IOMMU supports a
hardware performance monitor.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Yicong Yang <yang.yicong@picoheart.com>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/Kconfig |  1 +
 drivers/iommu/riscv/iommu.c | 58 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  4 +++
 3 files changed, 63 insertions(+)

diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
index b86e5ab94183..8025bf0fb67f 100644
--- a/drivers/iommu/riscv/Kconfig
+++ b/drivers/iommu/riscv/Kconfig
@@ -10,6 +10,7 @@ config RISCV_IOMMU
 	select GENERIC_PT
 	select IOMMU_PT
 	select IOMMU_PT_RISCV64
+	select AUXILIARY_BUS
 	help
 	  Support for implementations of the RISC-V IOMMU architecture that
 	  complements the RISC-V MMU capabilities, providing similar address
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index fe8e6d0f8a23..1cb7369bd962 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -14,6 +14,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_rimt.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
 #include <linux/init.h>
@@ -48,6 +49,9 @@
 static DEFINE_IDA(riscv_iommu_pscids);
 #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
 
+/* IOMMU PMU auxiliary device id allocation namespace. */
+static DEFINE_IDA(riscv_iommu_pmu_ida);
+
 /* Device resource-managed allocations */
 struct riscv_iommu_devres {
 	void *addr;
@@ -587,6 +591,46 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/*
+ * IOMMU Hardware performance monitor
+ */
+static void riscv_iommu_pmu_id_free(void *data)
+{
+	ida_free(&riscv_iommu_pmu_ida, (unsigned long)data);
+}
+
+static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
+{
+	struct auxiliary_device *auxdev;
+	int id, ret;
+
+	id = ida_alloc(&riscv_iommu_pmu_ida, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	ret = devm_add_action_or_reset(iommu->dev, riscv_iommu_pmu_id_free,
+				       (void *)(unsigned long)id);
+	if (ret)
+		return ret;
+
+	auxdev = auxiliary_device_create(iommu->dev, "riscv-iommu",
+					 "pmu", iommu, id);
+	if (!auxdev)
+		return -ENODEV;
+
+	iommu->pmu_dev = auxdev;
+	return 0;
+}
+
+static void riscv_iommu_hpm_disable(struct riscv_iommu_device *iommu)
+{
+	if (!iommu->pmu_dev)
+		return;
+
+	auxiliary_device_destroy(iommu->pmu_dev);
+	iommu->pmu_dev = NULL;
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1570,6 +1614,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 
 void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 {
+	riscv_iommu_hpm_disable(iommu);
 	iommu_device_unregister(&iommu->iommu);
 	iommu_device_sysfs_remove(&iommu->iommu);
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
@@ -1636,6 +1681,19 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM) {
+		/*
+		 * The IOMMU is fully functional without the PMU, so keep it
+		 * operational if the HPM device cannot be created - but do not
+		 * leave the failure unreported either.
+		 */
+		rc = riscv_iommu_hpm_enable(iommu);
+		if (rc)
+			dev_warn(iommu->dev,
+				 "cannot create HPM device, PMU unavailable: %d\n",
+				 rc);
+	}
+
 	return 0;
 
 err_remove_sysfs:
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 5676001548cc..7fcd79fa47c8 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -19,6 +19,7 @@
 #include "iommu-bits.h"
 
 struct riscv_iommu_device;
+struct auxiliary_device;
 
 struct riscv_iommu_queue {
 	atomic_t prod;				/* unbounded producer allocation index */
@@ -62,6 +63,9 @@ struct riscv_iommu_device {
 	unsigned int ddt_mode;
 	dma_addr_t ddt_phys;
 	u64 *ddt_root;
+
+	/* PMU auxiliary device; torn down explicitly before MSI teardown */
+	struct auxiliary_device *pmu_dev;
 };
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
