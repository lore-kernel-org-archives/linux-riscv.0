Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E529C88E75
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 07:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYg8/zpSHioxr5WMcsvrEj/Oaon7xw1nUWd9LQCf6Dk=; b=vQLWNSZ3Z1z411
	wBkUe6imIhapDrRKcVHnFik7vO21WyGF2Z9fc3fGCySmlWJ2FrSuy+tHVJ3D5pjYDWrc0EoVlCMuV
	s/3p468CEDXtSitaH5Tl+vF/ctelpdul+mYQSpYfFlsBTlwGKXEk/sB7/RHld+zvtDHy/S9i3jCOk
	gb3+SJKr7FgeF45DcmSqIX/BLBN/TX9BAuJU9sdGquKHjPMzxGR1xjNILy2kGv5JykKEbGbc86oWc
	QrlD21YwM8x5c08qmxsjczKdtN6pl0SpaD6I5GbS6tA4pjXUbV2ogkj2JiKN8bOx7ufu1fEkhQdBB
	hOIoDMGFN0017A5et+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Stn-0000000Dg42-30ig;
	Fri, 18 Sep 2026 07:20:43 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Stl-0000000Dg2b-1V7w
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 07:20:42 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso290926a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789716040; x=1790320840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtF+hEd4zxaSXZ54y5RlnY99ygpvKaq026DcmobuPXU=;
        b=H0NSFy69iRACDQEtL6eZ0x81rPl0giYBBOw3fY0e6XP/z39HP5Mio3bmFn+xoEF60L
         NWXy4taP2O2S6duXxN7VhmVmzlg0UUPaFJ3t0l20ZDiE5g/I6Cekjcscdvu+M3JHtobE
         15jmnZEB1mrFo9lDUemgAsRfDKKo5rCjEZbUxSxgAocwuTYiS8arqIzsFeZnIJ1Gyj+5
         jeJe84w0522tJChc72gzBPqZBQsYn44VwZJ4hH2b4bUg5n6FD/64nV9abYFKt2fN0BTx
         zPTwrqhq5NC7yJ8l2ZdUhityQ6GqhxMyaJOwPy9GP7t86RqPLUHVDtXsmzH0UwwzcHw2
         H7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716040; x=1790320840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtF+hEd4zxaSXZ54y5RlnY99ygpvKaq026DcmobuPXU=;
        b=xDpK5m0LRecfU2hktPxXSJEQvQ+5WUfYrrOPlzUo6Uz0QjFk06P9TcFs82OqpUeDdH
         GB9VNulYWvNnSC/scNfN8ewbebXysWj9udBSjQVFg+d2wrxEXqYLnqbiZ6e78FPvaJv/
         SvE/0+gbwCtJJCPIZCtRUx7ExSalq6nipuhfa50pgUzdaZ4ZRqEqvaMQQ+2JorAFF2z0
         +KDia80x7RaihFb3b5YibCJ1xDux52rqUKADOfJjyJ3Z1w4PlcgNR7Uo2BABqB9l1CDg
         Jwf0khhZ3bQ+BAHTzxW+fvZ8cQ+pUf6VuRXqdAFZr/Z3vCiOc7oZRwSRyeXlw5CLdQSX
         2cIg==
X-Forwarded-Encrypted: i=1; AKwUvBxVeevTMnYh8/GgdH9Cuyv7esLI70aXLw62CUlboOeBWTM7QHbMHebroXrb5KNg9g4MKdFMdruaKE+fgg==@lists.infradead.org
X-Gm-Message-State: AFuF++nQzcwE29Odwbl1/A4LDiEjbiHUUv70M5yqCkvy+AYhixK3FRHP
	FdNPraaM/3OUvRQpoPGD1T8DLHe8D2VKndRZh2IXfFxtYrtAo6BZm+JhT7/UMTViI1o=
X-Gm-Gg: AYBFou2lU2Cl1i5v2vCIZScTEsHjeLVxEThTmxp8jYWLDRzwyyU75CRrs8ipnj0GF23
	4FjeLK/6EjoUWevX7o46k/utRKk5dlvFFDHmO5Q0oexe5UhnDj39TaNK4KMMkaeRQ0Tqalj9KnQ
	NcRjDCzwRrtnBh7yl6Xiq9QsMPmrsW9QYUCDctVufqahfNcqd1zgUI94ofI7S8kolAZI8XKobjn
	/BnfItS7652YVX6wjeWbCt8HF0uqVC8ha9tr0LCw3aWkZUG27R8+lLVvteN38ajITPngfRDiHzC
	scJyvZmpvA/DpBM2vnPHItVb972dSiSqMFl/M9rZigJd9HKdaRwUYwEjqSL1eBYou6MRcTy9nAE
	yDbelrpCV1kvlX3CMKdlXbwrZ+DSdB81/6XuMNL2n4s2jYiWHJG/fVyMwXLtcE5/XSZEU/6p1fy
	mrZvRkzEjDKdOHXTAuOsgxk/Mf8nTiuSBe5whWWze0vk9roBNbTL0wA4y4YXuWp7Nt3BlS4NpdZ
	60NZzC0kcE=
X-Received: by 2002:a17:90b:17cc:b0:39e:135e:130e with SMTP id 98e67ed59e1d1-39e54af6a0emr3710326a91.3.1789716040219;
        Fri, 18 Sep 2026 00:20:40 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce03c682sm4416046c88.10.2026.09.18.00.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:20:39 -0700 (PDT)
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
Subject: [PATCH v12 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Fri, 18 Sep 2026 00:20:26 -0700
Message-ID: <20260918072027.639239-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260918072027.639239-1-zong.li@sifive.com>
References: <20260918072027.639239-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_002041_402265_81BD3577 
X-CRM114-Status: GOOD (  15.13  )
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
 drivers/iommu/riscv/iommu.c | 48 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  4 ++++
 3 files changed, 53 insertions(+)

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
index fe8e6d0f8a23..3c8f8adba647 100644
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
@@ -1636,6 +1681,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
+		riscv_iommu_hpm_enable(iommu);
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
