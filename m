Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9507C5DF87
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 02:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVw89lufEBVjZDCgU+gWIbKg5NJ3hDIgvCHriOf2e+Y=; b=ua5drnHt96/O6f
	RHLC0uImx+hsEUWTcg3H1XpRR9b05PlZKsDxkHwy21MZPU1gBEs6m39tKbCdzzEkzWm8waci56OLW
	sDO3f0I21xPYovKzUOo6ryJ0VRmtcBvSDPd9s8hV4h5DC1iZ1ABFqgZzCmDd4c2qEZzPfNGr56Htg
	+cVgOvk+8HbET0IgPXFSmkvL+FXyvI0XUtFJM33HFUBSZDc0W5i/UP8jKn56h8hTBaa1/W0ODnMmI
	+X4JccSuT7WnGYghZNKRpft0n5a9DXSInT7Q6A/KlHn0qwEmZroZvTjA5LSH0sxFDMyMLk+AibUpu
	gMTrvk2/LJ/atm48TndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxF9v-0000000CSlm-22rc;
	Fri, 21 Aug 2026 02:39:07 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxF9p-0000000CSk9-2P78
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 02:39:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2caea3f742bso9413525ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 19:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787279941; x=1787884741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMnbX9WNAYiy2tqr9slp35Bxhckluu2H+cH7KyGNMlE=;
        b=hnLt+zfaZ2Px2BYG1VcZUkQlxFEPqnZ6iSF6W/t+p6aczCfHiDa1OOQ45YvXSnFW6g
         +ugg+zWyyuCy9NOun+Qms5sJ2lw3u9/P/nfm/IaGRp5gwI7LI6LVjVBPPnqXSLcpDr8s
         qhzOTOKr6NdIIpZkHCOYeVYXE2QkPAoQL1FRbS/Jtp972LbTwLxmeHNuaGU+NSyNTucz
         ocWUki63c4lB1Vaf3QHIkWOAEjSaDCTwVxhR0AAK+d5VBJDLWmunN4ZzwLui2NgEyv2S
         xTnpjpqrzlQ41rNgg8WMBCOImu9D7jzuYgfXNRrc8RKo0LBhHO8dQ8YdUOCrQYgmKx7s
         LMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787279941; x=1787884741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMnbX9WNAYiy2tqr9slp35Bxhckluu2H+cH7KyGNMlE=;
        b=qGlrkJwbDrsjtsW0aM+V+yjVpICCwNXzqPaeFtXC3r6dLdutthI55d/OeEg4XRkwSS
         Oiuo6F2jDPgwaGV4Gkznsh1eLjWNmFTm7PIzu4IG6POOkFBmCh1RteD0DHJyjBcYsyvt
         8ynECMlLXuazB1wYmIJf/Gr7JXCQf96S1uc5/ZegEb1NQ4B7E1L7GLoXkr26brqF2hK+
         hqUouk9MIztZDnK2JrUJq6tGbaPqWqJZbcjGxgx4JGFRX1rlq9475+xzSo5OBxxhetec
         wkqqsEwwuGRIZyBBLUV7MUbdGBnYT3JKX1zPZ2fXWZj59ZJbMASeCy0HP1B/1H0XkkDA
         CuUw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7BMtUIRAEW40aZ5iGOIcEbTgORsd8LUVkjvOKvqIJ34V6hSD7ODy/dtnlsLcCFZaAyCZlX2fc4ETDjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5SSmeCkAUU/BVEvsDLTQX9kZsmpgvZvJ5T0xRR2hhFXHiE88E
	rXUmM9u1SWhpbguseNpCdvfnbyXbvUPUcTYpin3kku94Bz6l0BCh3tGoliGkIP0NlfM=
X-Gm-Gg: AR+sD13OUnQ2Pn4MT025PkmIO5IUs4KuTqZSEDeB4So9sHYaBVsrSMdgoCVL7EyR7Q/
	N6ebO5eCaQ7P8lPsOCDcHn+9Hdgce4WlB1hTPVw+Z9qMiVxOm4WLlk2saJOtPU/c7BTJvGlAUOq
	b2VMB0uWKRMVTtHO+646B7CcCZmofXaeXdpeihsNuw9bDD4Fdixt49mRXx3mdhLWLXRjL2vZLy0
	1jopPXCQcm530vd0hQITqUVdcB7dXCg2EJ3Tqy60+0H7TgWyzBhKNrIyf1XXln2hSIywgI1qDwA
	tef9OpyI0E+pkdMf0LFVFUnty5064S2BxpvIW0Daci8hWcnqIyJh8THTRTzSGZpZmhtF3a9mCzk
	yfLKm1p5ZAL9gn+9E6lnEW5XlnN2WFsjjpRmFnGCvNTbzdqK1s0CWUwIWLVZFSvaJO+bW3fTuSc
	0j9ngps6ParVT6YRg4uVNudoBLgbX8Hb829nxOc+L6pckiBqRc63dIK2tfAyqV1o7eIvNhFncD
X-Received: by 2002:a05:6a20:c705:b0:3bf:a7d5:df38 with SMTP id adf61e73a8af0-3cd300613dbmr6157868637.9.1787279940750;
        Thu, 20 Aug 2026 19:39:00 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10b584sm35370427eec.16.2026.08.20.19.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 19:39:00 -0700 (PDT)
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
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Thu, 20 Aug 2026 19:38:53 -0700
Message-ID: <20260821023854.2746349-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260821023854.2746349-1-zong.li@sifive.com>
References: <20260821023854.2746349-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_193901_612206_7554F006 
X-CRM114-Status: GOOD (  13.76  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/Kconfig |  1 +
 drivers/iommu/riscv/iommu.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

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
index cec3ddd7ab10..7f619971bb70 100644
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
@@ -565,6 +569,36 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
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
+	auxdev = __devm_auxiliary_device_create(iommu->dev, "riscv-iommu",
+						"pmu", iommu, id);
+	if (!auxdev)
+		return -ENODEV;
+
+	return 0;
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1613,6 +1647,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
+		riscv_iommu_hpm_enable(iommu);
+
 	return 0;
 
 err_remove_sysfs:
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
