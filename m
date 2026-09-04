Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7771DC624DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 09:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlMwssB2LyBy9OZEitMGYXUg5mYV5vKmRMJsM0Yaysw=; b=kDVG8v1AstPLkO
	nSQRN33RZF1GUbaQ114yIwwjiQrZPRzK81XOFHsl+I6kcqJ44TdNYQrs7qbWC5gA9Xt0CeHakEKnf
	Meuc8XnSzoUVJFg0Ko1zrrZDfZCpQ8qEr4lesFV+tmoKIA2ka5OCDAZccLWNpBY/wWcDEadu40RNv
	gt39sUK9ikgtpI46gVnD4XdKlGkSIwPiDt17hvrdXsWtjmA5P+0MF3kgEXqk9ybZeyqACiDQBCHr/
	CK8HCV5WGrWXbFFTnrNdhUAJyzntzDTWo4HPexEKYWP7Hok49Qbry/oaw7vhTyfTm13vdZ8vk6/6v
	pepTscCZ+A7o48ZKFfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Q7I-00000001Vwc-2UWK;
	Fri, 04 Sep 2026 09:21:48 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Q7F-00000001VuW-2F8u
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 09:21:46 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7f18c0e03e3so398458a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788513704; x=1789118504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=ZTX7tmvfS+gIacgROGAFyellNN2qfZS9s9qVpppHyCFnkmJVubBAA6Va4cIIhBUNev
         o7jcHnbKXA/LIA2xPqQnDyQVjVXXYee3I4zhbkKY4bVF7nXvx4p4aw9yKzhwaMuiOjDv
         8ZJaOdB9+EajoXqrAy3tNZcbjr59xFbAiBDXK07pfGcL0s+uaKeFO+SCKQ0A+iH/RocX
         xqKmP7GseLHgIG6vivPvwfRoRatFubHwioryFVaoJ6bEhdcGNd0Y8eFwm8whYmR4QhL4
         oZAj2SaxriUlbxWO0AvHkjqlHZaM9hlXRlIrcktbqq0FHyzZYuOLn9cSRJrhcbWKOZlk
         LJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513704; x=1789118504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=nQfL1JbjSKqmaFqIp4AeK6pHVNTOc09Yxp86FtDJ3B6dQiYBsK8Trx5i60kPmjsFYb
         hsnHVnaYvPfj7hByxhjpinb2HOJmMUlQp5bgBzQX3H3VjrxYzc2a18A59kO7mKjJO8sn
         2Fktu/Ifi8Aaojkqtq84DlDUnc+0FEvxv4THEAMtXtct+CiVy9vGTP8cAIFATnk8bY6/
         agAOfwVS+Fjqy2NPZ2ZSwnSFaawL+htX6s5gOSg+gvAxH8NeCPBgfAuV+R67vNJ9P9ot
         dv5LOSf3OMCfUc6pf20l3WL8BIvgo9AYUO9SL1103IZxDMeT4kaqBSUi9R9Vn7fwMGH5
         evaQ==
X-Forwarded-Encrypted: i=1; AKwUvByNpZAMwfHIs5ZMH53VCPojhnPUKFtWz7/J4JX1run0DIURD70Yc2BWHDq4ocg5JZlxkQhhDTY7kY2G7A==@lists.infradead.org
X-Gm-Message-State: AFuF++np6gAg/M/2WIu3h2a0mZgawSuX/TMrqvyV4W+2ZYXs5Ds4L+ox
	O1nBg3EajIQUPeIW/dpdJiQRduguChe5k7P1IpIi8g9keMPyOHxDBr0hTS3ZxxOS56A=
X-Gm-Gg: AYBFou1v14mPQG7XRNy/OnSwsdD/3xuSC8sI1Uva0HHdXvQl5n40Ho+WuACvtfszHly
	rQBFn48SiF/AIZpYehg0Ro/1uTarkWOr4eqNeB2lxGBHznTw5BjSJzcQ3N2aT8oPydS+VdetvHT
	p+agOLUMyrDf9tP3rB1SeMnftff4GzEcn3h1+YZHT0B8chtg/nMJZSl9aNSPvtkGDv/S+8vBLJ3
	VB8PGCXK1lVNSEjXFhRqV2LJA69GYsebvhPkt0G4nxjVwd2E9diLxT5QTD9jc95vEdUhHC8dWTp
	A4O9iqRzD/7nQgObU/wrLGVbA2nEmr8Fup34J+rx3gedM+jBhmhcCQGNNtFymTH9KJv/xczfqKG
	XnhzIfG1m9TIq3lbLim4ouUO2PGIk2WkQ/6vjmFW6Yf1OEsYQQr9G72N1OmBAdPhtEvz9cT0r4l
	8yGYgGu1dxMridOEIXTdfWfTS+0Bj595N+mEtPrWVQRRfzrJhi3E89Wt+ShrtNazvlcHuqkZQ8
X-Received: by 2002:a05:6820:1c91:b0:6b1:2843:1312 with SMTP id 006d021491bc7-6b6f788e384mr2940609eaf.0.1788513704577;
        Fri, 04 Sep 2026 02:21:44 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432438497csm5275575c88.8.2026.09.04.02.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:21:42 -0700 (PDT)
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
Subject: [PATCH v8 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Fri,  4 Sep 2026 02:21:33 -0700
Message-ID: <20260904092136.113321-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260904092136.113321-1-zong.li@sifive.com>
References: <20260904092136.113321-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_022145_580703_E83796FA 
X-CRM114-Status: GOOD (  13.74  )
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
