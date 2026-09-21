Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2824BC982DE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYg8/zpSHioxr5WMcsvrEj/Oaon7xw1nUWd9LQCf6Dk=; b=0hfs/SyN39VHXG
	XvVlkgYfX/PjhliCDXJ/hskWSfUCzAF5IS/GNqdErwcdBODbIugIbwyIPNfiqoqY3FOBthWlG/wLY
	HHPc7/VZvzUM1gWt2TBENzsa8NbNwOPOOynSBkeTgOwKf4q0BHTIEL72MBqRFAvPydMIYLgv+D1e6
	XN6rWE7ywJEnE30ac+GiMV0YCBXzst/81PzGKAnvd9ueipOdAjN4ZoAaTPqV+2xTHGj29xaGXR7mN
	tDZGIpflTVifMxWbn9dkR7vhcMowNGZ65pT98QXoFmFjljpFX6fgcqXU5btqQUSA2hgfk/Xjam3O3
	CExt2V5e7cDyJDsmgWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZC0-00000001JgM-465u;
	Mon, 21 Sep 2026 08:16:04 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZBw-00000001Jf3-1AMw
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 08:16:03 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so1800097a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 01:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789978560; x=1790583360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtF+hEd4zxaSXZ54y5RlnY99ygpvKaq026DcmobuPXU=;
        b=nJWhqPEWM7ckNFzQPuIhmFgRkHoBa8KP6PVMF0uHGN2oluMMfZiO+Z9m3RQxYESCiO
         Np7XFOA5RcR77wTH7zRei0HB+iwTinhp+CEC2jH7HjbcuKyd6/otkAChPDneTJWztN5b
         H//fSXhWB9D+/wvv0U5sJhTrxj40vuKZKoP770s6ruaESrmW+p9GAA5NKMHhZOdpPQMC
         Yg9yiJIF1y6DaRLJ64ZlfgqRiGi1xiCjYSTG6E4WvfwRLD1DyWbaswfGKH/Zkj4YlkhL
         /qCzr6H9TW9uppIBApth//ZHtxmcAdT4DYCzsAA/6KQYJBRgVJxDyeL6w1KImh1ajxwF
         Wasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978560; x=1790583360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtF+hEd4zxaSXZ54y5RlnY99ygpvKaq026DcmobuPXU=;
        b=X7g0wHhUEXZ1rNvSxL0S3nF89fW3ZbjVpMFdbS/4CZRQO74L/KWEUM4l9gmAh/Q4tv
         WVyRS1VDybaUBO4/HqK/f/RcqBHOr1yoYYPJ+L6IFCLadaASJDduHGwwcklr9uAKBWr/
         3Nq71eI23Iv/5Gq8H2RtvjFbkr9IVlUqkpkxc8Gp4vnOaWU9n7ulwGo7c6LGX3fPWiYJ
         eT3eEhsJq2t7zzkdqVsv20y51QTpEO43mjQC85m7fT9pCSNPeQOf0cC7CGNAmPLySyVd
         3DJTPFM4F9uS7P91+Cxf8v4z5K5+s6eE1UisMb9w51kMYrHWNe4SK95cs1+oV06BpghP
         PeuA==
X-Forwarded-Encrypted: i=1; AKwUvBx8H/FausnnpK7d5P9S15wcJnjHFpTRtLu2axj9GXOxvbjYZ00h1l0CrmHMujWUGy+0uFBYTCYSNK9GeA==@lists.infradead.org
X-Gm-Message-State: AFuF++n1OnLFI6vfgv6QJ4DudDrL5eqCmyS9ai3FNM9+ftmOCe00r0gU
	MjdRR94sc72lLpTBtN9DDLPTdkY0R/4w9tccljtj2pfplP3jrhI4nBnUm8m4CYExZds=
X-Gm-Gg: AYBFou2/kej+a9nRUKTVCcXXAADQD9S7lDGaKPTrDDJq9+MquaFEtJ7Wo8AyXpe1zYp
	NqNQvJaotjqClBGjhwZzBaNVDe2Icd8eZN0zFhcpH78EyfvNZyjzX60IDRunjYAktm305JIwqKL
	O+cnEcJ7zi3ejmoUEb6bZZ2jotURA1QMBuyOOiblBznRE6lXnQ0GQbUu3j9vY5W0RCYUNRX5Vz5
	px6CC2+/9B+2UKA+SdYnrWFtaJlt1O5547s9+B6mH2qZ1/WbUH9kgDsvqvshh2EhuSwphI/wPp5
	LYDvcFaelyr/9TWndU/tQqqR7OTX02XrsdXfYHZ8rPDfeCU1B45xl8guyVv35dAtvsqJxQ7dZR7
	/InBkoeBzF2pvzpCp9PmtsUEccyNiaWwalpiuTZyOdz7ZjtnH7KR0SgVv/4Le8Po/ns8lb0ja/9
	bSFxDPr/ylYhdBwHgk3ihozumN+OmYubAuybTKrnvPOdRvJBpqznXpMnLjruPr6UQH81TVVlvai
	tq6JuauJZs=
X-Received: by 2002:a17:90b:57e8:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-39e6c69f4e9mr9704408a91.49.1789978559556;
        Mon, 21 Sep 2026 01:15:59 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f16f9csm17151344eec.2.2026.09.21.01.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:15:59 -0700 (PDT)
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
Subject: [PATCH v13 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Mon, 21 Sep 2026 01:15:43 -0700
Message-ID: <20260921081544.1797510-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260921081544.1797510-1-zong.li@sifive.com>
References: <20260921081544.1797510-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_011602_522215_F5547AF4 
X-CRM114-Status: GOOD (  14.95  )
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
