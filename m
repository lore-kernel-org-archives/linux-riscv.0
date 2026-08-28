Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAF6C61DC6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlMwssB2LyBy9OZEitMGYXUg5mYV5vKmRMJsM0Yaysw=; b=sWhMe3Zw8XcZP+
	gw5sHw2McTdyzmrWu5pFKLnBLg5JpM8uq8FVNEr1EO0PDBWvO2MqCshUfnvGz4JuRn7RaTpv5DUZT
	NjCitBGoZjEbirs/zKO5+PKN0Qq31rn2UU3hHCvtoIQx9qv3yzc6m/VFGP0Sl2Weuxm+3bHe5a9li
	oqfSaTSc1bjdwgrRsLpDpl4EwPGc2dt1R451HgBlqnOE6MxTTjifuejZw6IzirU9nonI8j9zZ4C2S
	x1a4iawLUM10GRKQ8iELIVjIxYyZTYQfR1yJ1ol4Hjf4quc25qS6UWYjlpaDKscJX7y4PCbr5Nuev
	r9pspX42ZH8q9ZsBufCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsPs-00000005NeX-14Mw;
	Fri, 28 Aug 2026 08:58:28 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsPp-00000005Ncf-1c3H
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 08:58:27 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso967801a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787907504; x=1788512304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=XHlGjpw61pxEivC1Yz7zyH1zca65zeNu9qH8d6eKBiuNAW/+UE34GvyS5ergEZLTIW
         4m+f7x14kF09H7tdpq2LiKl1VGkaXJ4cGhmE8d2FrUbh1FVQ3MBzH0lF1qHh8/FDuE1F
         dhFiVp3+rIqK95ghf4vxvqXgsT28aTsutk7GHozSg4b7Yb/RVdXBP4CiHAGW9FMfQzhY
         Xua16lpzp6PccuRNiOegDuiL5yKFVXoxEvtfdUCvWeuOZ2Sy4xBxF+yFDfm+SYXP+VgD
         Ut3oEXLv5L6VaurMQHhGL1E/+Olueekq4WOVre9mDOfbUg63uYLJtc3CXZbhzD1m0dpS
         itYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907504; x=1788512304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=BYcVV9OyN/umHLF9oo3WnvIV5fIVsacc3UKTMiTUOFI/4ukx/11wmWSlXn2BbkcfvB
         MiStRDXJXTnuL3/uwXK5NTIUhjtJJjvdVQ34WNMPf6ukWNXRIcCg/+Z9f3XzkuLAMo6U
         XaJ2+WI9mbw/Lao8zQwGOl3CE71XNnT35wqBQ/0pmXXhV3wNQPI8I7uvBKmMk4t4MPiH
         bnHVWUJGvz7iRjHy2hVB6lX8pB/8jEjzhCGppPczzDGwl4JXhY49cbem8TW5sCLef5Of
         Cvrmvwy21hll1H4U9DwFhhmNhh8tlejPVE3kDZD/E11VEevwSt2lyA56RSgY69sqO5zF
         fKDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiRqIROmLOiZG5KeQekQOymspEBr6T92YNF6i4XMnyZyMUgR5zW5lLTWC6BfLLWFTtKzUXV+6cocM4fw==@lists.infradead.org
X-Gm-Message-State: AFuF++lt2JHcuPVZJxHTAtBm8WLhBDmJWMXB11mJJ3nOpiJMnZpZLwZL
	JpTj53blhQtqFgRivhSO4c4RPO65ocP8sTwA3dbKZCWBBLAI7BvrgAzjfIk0JTzfSE8=
X-Gm-Gg: AR+sD119CF1xENPPU4YXpT8vkt6fsTqmF3zFCXMq+CH/JAyX1nOdQmjpYMFztsHpzpG
	wiOeae9ij4hGRmaxh/x+5iTsRDhrSJTNRf2dJtWSRPyiTgtKmoP/jwyZPKNJ8EUfj4+Euo7AHSP
	ILTHdQb7eLBU7ZD6KzZqybs2qXbcma3rlMZ7xIJxOcanrJhiEr0WOnBbI3SZQTpC5YgHIVb8Ai0
	Py0fIFhH61KMB7Y6iOyYrt3vKxLPZvObq8HSuFAO+l1OhkbeTvgG9fp4yFGdTw70NfTcXumiNeL
	rjmCERudDeivNUC1gAR+NWSIcuW+SSQ7S38BcCxI0hk114ljUMw5KhLHV18PLCIiH4disRJp3Vb
	GJvyD/t3BZGFc9yDJEcAgQPcRhk/GrSSXLFJup6IgrUzuXBZi/FYWgZS/IEA7KIYVhJkw6Q5qib
	jiwVZ3R3bmoWZ3Q1hYZLfm5uFbFm6o5PqmdS/kZ01J3uLH1BmcZ87dWm1GQu/zbc9Kz/ofWh+f
X-Received: by 2002:a05:6a20:7345:b0:3d1:7238:33d9 with SMTP id adf61e73a8af0-3d26532756amr10426288637.3.1787907504506;
        Fri, 28 Aug 2026 01:58:24 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9ecaa9sm3838814eec.26.2026.08.28.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:58:24 -0700 (PDT)
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
Subject: [PATCH RESEND v7 2/3] iommu/riscv: create a auxiliary device for HPM
Date: Fri, 28 Aug 2026 01:58:16 -0700
Message-ID: <20260828085819.4076449-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260828085819.4076449-1-zong.li@sifive.com>
References: <20260828085819.4076449-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015825_416875_DF470A98 
X-CRM114-Status: GOOD (  13.55  )
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
Reviewed-by: Yicong Yang <yang.yicong@picoheart.com>
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
