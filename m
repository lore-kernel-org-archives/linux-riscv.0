Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B9AC61DBD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 07:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlMwssB2LyBy9OZEitMGYXUg5mYV5vKmRMJsM0Yaysw=; b=43wvqrhAfiuCFc
	R6+sV21bZP+ObEPvj4EYrcUOqUkGV/5HqLUcUsJ0p2JtM2sn+DmYhTug43Q79xe2drPr/MO9D82rt
	MsWnzg4kUX8vnEgVX2elF3cR/L6Lfo4/SfqHKEDKPkKxq1Eh/qFpyK+T6nXtSb+I3uZOOX9gq4VCR
	OkG18fqH5GxqBlFUDj8vqE589Upk2+vjmk6uB1H19FEE3gmf4aiqimld1y6H3InQlMjNu7Lgq12nX
	lhcKbumdr14KZ/v2WjbDWTSUOq8UTMXmWxVfObcvepccx4eo+xD+oyIubT1RAyJmrkPh1c4acdHE7
	8VNNOpA1JqRliJ1+c74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqgv-00000005FpG-1I8W;
	Fri, 28 Aug 2026 07:07:57 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqgq-00000005FoF-34YT
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 07:07:54 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so707374a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787900872; x=1788505672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=ECab3bcBTQWtsDR1ehjQ90UTVdX65R3IoOCyrA1HzpWwURT7Cm+0o/sOGo1AeXxhJB
         hohEKJ6rA3vlJw+m/wLh01ZDNo9kiS3Ya/NkwhHQ9MB4JVNmFZffFAeAokZ+lvNO0R9m
         vHgLMP3UF1SZeCsoSLMaHFiO1lN08QwbHsgwAqyLfrfM5LrMfezUHhtM2FziHESlqhkR
         WYCfVC5HTIYdEWT2k9zO89h1MQ/kby+hzDjIqZtchUDjezrQc8PV3kOGbLSokBSpd+GM
         HzhTYMFU10QDwzeeWw1QuLX1plbeOFscoetZDB3YruAkZ4rB71ve479mjopdIRRmAeGk
         +RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900872; x=1788505672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=EKvzGeklgIiqRWW+1FXtSMuU8sMjNgWVcj8NVXFu7SPwb3/LoF0rH10kYqqhHZH3WL
         trMAr42eWlFjgsuTptlS2siCajndCrAtNdCXAMb4yR6ljEWYwbOQHvXzbXKtJSFKTZjL
         d+tzy8qCKguVYtQsEP+l6yQs0aUL3jzTP5rUy2mSExy0f46itav9b+gWimbTxbCEX7tm
         2kBvEqm5c775B+ckEIEKMuLJYiVGMItlIvIatK5VpBZ5FrMPA5yVnX0CL0qoOOv/AxhT
         hJwqHs4Awlv+mCx68l+uRBA9uwsAk+SwNAFC8fbhH2qPakTEvIVyWW7k/HthviLVUZGE
         Eg2w==
X-Forwarded-Encrypted: i=1; AHgh+Rq1VO0m5ELKVRAEXB91CgHZHcF4US9YieoR9fQxRa+0SKKGdu6rHBegMLWZqrSu27hMsCPTz7dZykLSsA==@lists.infradead.org
X-Gm-Message-State: AFuF++mLgol87YvJb1YI2Nr2TW5tSNpxIiTCUpyjuwpkkW62ONlLjkCU
	Fe4jSl8nUEW4g1jkYRhuuo7sWzGOLJFj22aR8RcdkvqxSDNnb7x/EWlseEa+hLP69Oc=
X-Gm-Gg: AR+sD13fTjPkM3wGxc8r/Pge+ks1jb0eazgZ4Cut4KU6/gPslPPa0j5w/6S1ozmHp1P
	8uStwoVGMWJELb3OgjSnAJFVEHPJrUK6a+wlYUFweVMKVuau3/25AMYdKjtFb4sTUwRRBTQDVEW
	kR7A+JTsdqMOIIzGttl2nWWIUI/S3Yp9/+0I+fgBC9XFT90yEHFeIlW9gyt+PQSD4eSpSeghSaH
	BoeQSyWcyDwK5RZFQFGE1m/hnJkiXghQRM7LmJkI6CUM2QgDdbbrU29nUKY1FMfuiMrbA864fYh
	6gBGGfIYBR66zUb1xE6aTW/cMdTT4wnGShYcHfKrFn/JLinzaw3UU0/yipxQuqDVjjT01kVYEjv
	OMI90JC0SbYVSef2NUqeoKZK+G6gBlXzoz+eN+FHFbKvovLW8dGZ9Yj4oDa2X2EqvgGevzwgJbg
	mR1/GxqZYhhiB117iqOtp4ZP5ioLcD5fvpvEpVEFueWf2rSQy+46W18br4ZfLlQVzSNmgUHJDk6
	xoQb6mV6xw=
X-Received: by 2002:a17:90b:388e:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396d0eaabfamr9040736a91.1.1787900871742;
        Fri, 28 Aug 2026 00:07:51 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1b38esm3156610c88.3.2026.08.28.00.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:07:51 -0700 (PDT)
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
Subject: [PATCH v7 1/2] iommu/riscv: create a auxiliary device for HPM
Date: Fri, 28 Aug 2026 00:07:46 -0700
Message-ID: <20260828070747.4009519-2-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260828070747.4009519-1-zong.li@sifive.com>
References: <20260828070747.4009519-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_000752_772393_BE6B4805 
X-CRM114-Status: GOOD (  13.65  )
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
