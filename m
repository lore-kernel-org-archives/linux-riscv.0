Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE699C5DF8C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 02:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVw89lufEBVjZDCgU+gWIbKg5NJ3hDIgvCHriOf2e+Y=; b=Sw6wUFj5ulD471
	wmehWA18TVDJN7Snf8Ty+gmYiIxUj3yzBaqz1ECdpId/pfSYNryMHnDO4LKzToic8UDYNinSxg+9n
	+HJ1ksCXIxxBwSjn0DXqOsfjgPrFXeiybCG53fd1ayJ/6XW/Zuf2LA9+4ukylP1brcB6U123Oo9VQ
	jOxIvCoVhJ1dhQctFebPUaaRRtt2ucJjKDAZBOKSYsY+fKGdJ8YM9cacdO8xkyjhjpowykRhxTK3H
	Kjs9Bgwjz+nQ1Lhv4mtPDZKjkRvmlpi9d2plfWL1oDCm7KJ2hwMJN3LTDahjeY8b/NK1rHxzL/LEy
	IWJhu0PUnGkaha1hGqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKIm-0000000FlkY-1JGp;
	Mon, 24 Aug 2026 02:20:44 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKIj-0000000FljB-0XfT
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 02:20:42 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-39266382df6so2281212a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 23 Aug 2026 19:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787538040; x=1788142840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMnbX9WNAYiy2tqr9slp35Bxhckluu2H+cH7KyGNMlE=;
        b=jjdZ0IK/yU9cYhIwxQs99Op4AVCKffppm+PWMeb1s3Qop8Bk4jRgnaZw/dhlCKV2qr
         gcjm5U5nNNyfWvngFkwpwU+xaYg7MJjQwHOlmStZuKqRC5pR+NZaVXCuHOpGUiTI5fsQ
         sIvHOux+U+smDlV/nyZSXj8RZkmhytJjMgrGdGJcKv37rh3VpXg4BflwUJ+kuxiMq1b4
         VozdKsMXV8cCeXWWBM8NC+LBCtOEaBisdUIdvoAuUKqWnh2rGgUl6Es4IdvlbNmgzsMt
         Jk4uQfdQ4tp8MF/GTlK2Radw9/i0trKXqXBZYno5w6oyK09c7zPDNU5x79h/9szKmYUV
         BcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787538040; x=1788142840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMnbX9WNAYiy2tqr9slp35Bxhckluu2H+cH7KyGNMlE=;
        b=H+WdAfAktuzphH4Md6wqf5T72fOBGKX8jZaEKT6NLfFKeBvFLb6Po5S0FGEBn8z5bG
         qqgJqMxfhUG/sEZ/3TBdqHzjIDgiInIKsjTYO6Zo8ptEPkGVSJZ8CDDr0A45O5b2ZCNV
         9WCTG1kzUwOF6REfvi+6k5xLjxUdJugoRF4fMB3EUsqBkqAtKvo3tOoZjQRxs+4+YHa8
         jNeMluQ3ul9vqbAyiiFBKGMT2pKmd3x372qxTL4t5IwGZqvTXtSHBBbWYYQsFclxD7vK
         QF+tJ1Wceqtvz802v3VDlIWV6qQj1lcmW9FnRP/Sy3R1ePrYKg+Qb67bf6qTEyDULiGC
         qelQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrsf0/mF9S7pi1OjM+mtmk+eeSjCVvvF5tr6KpXtCUX3i8nE3VqvbwlUPm4QNhzQtP0Zi85mQX1wJFSbw==@lists.infradead.org
X-Gm-Message-State: AFuF++lWUIXdTkETptfYQj41mFnkIdy5rYvuXJBqhMdc2WAL/GOkeeUc
	GdOvtbahbVHDI5MksC6FJnKXh9uTzxuwbmwSts8JNOc/ZBW6GPBlXQKBVPIOSPJANj0=
X-Gm-Gg: AR+sD11f2sk4eXoDyc3dqLJd2yKLgPLx4c8GmAAqyUu9F62aIcIbvtMi0mF2+UGSm0P
	FxQPwglLu+xFMi7llLM46rEjlbLGsxcplbuKIqx1LrY3U41VTlFP7QRGilm7D3JSTEajsTF4x50
	b3UM5TWeNDkBMV+arKDLNZj2kM3Rpf3rZI/ANRVRHAve/Gpp0jRU4TQQHsRpspHuXmUOVSi2Va1
	3HIuzROL1zmaJl12LOMw0w6XQ80i9q+ZxgOFPhxfLgCQYx5Ol7He3zv29haMlIcq/CVL7Xud8SD
	2N5RNk7VDZQEbS4XISGe9rhn7hWE7IIhj0bIBmUMBJ7nWI7+4MO5+xAIymNiJrHamdiI+pQfgd3
	DjspOAtvb0ggEBhPD7KqEaexTOuFDWdGNKN4pDGRR4cPJBCy1kYwmvcJgft81vlhn/uSzWzLTZe
	nSEa315Df6B8wB00slYuJwSkwVSp6q0mcoipKeNHbsfZeSMe/cV707HuhkPN+MJwAAsmBQecez
X-Received: by 2002:a17:90b:3bc6:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-395c354da4fmr41782461a91.10.1787538040293;
        Sun, 23 Aug 2026 19:20:40 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14186183c0esm31175869c88.12.2026.08.23.19.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 19:20:39 -0700 (PDT)
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
Subject: [PATCH v6 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Sun, 23 Aug 2026 19:20:29 -0700
Message-ID: <20260824022034.3916570-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260824022034.3916570-1-zong.li@sifive.com>
References: <20260824022034.3916570-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_192041_178216_E0D43F14 
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
