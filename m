Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDFACA5FFF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqJ0OswkIQ4q5g0RZKohT26wW4z+HGI189K/ebmBTMg=; b=RO2rH9eHQKH5YE
	un+v30is7axZbx2Vj7ry5vdbl92G7tFBx6S1sNMKvZulwH0PYog63mFzPrQeEOPYjY0k28EUMH7JW
	ncAOQ3qvngG7hTlVubSmFdq4kvQujfBQ0psEu/IX0xDyLpeGoyvz4n7LF/9XVQ12jKu+HegNHkVHT
	qsPgR4o6fdvh5EfxQaL+SJYpLIHaNJArKDUkzX2Ea4P+DyGvO7+YZ0eaYMx8/PY31Dr4pNTEupROt
	FbBCTpesLdDY07DQHwiwiSSQZqsTk3e25DaPVnqHRsCCCzO2nO2nYYbz7QBl6I9TocP7aIPfhMcQm
	vCa1/qnnUMbV/Frog0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE15G-00000000L0H-1f5b;
	Tue, 06 Oct 2026 09:03:38 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE15E-00000000KzT-1IVG
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 09:03:37 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-31490970b97so513345eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791277415; x=1791882215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsQCM1m1fnFkJf3mOSpgytxAYne0rV7bfE6IaOdnVKQ=;
        b=QlR+ZWyk7buoG/WrQib0S6dLPJHNwiu4WToOYaoL4hB6NBt5kyVkU44JILlo5mOAsm
         gy8C1E/8bSwxAt7IV8/KbyKaUwUfDjSngdEnR+Gy0VXnczwfzqa5k8OywpqMaZT5pYCf
         B4Duwk4PetTOogexoZo/Pmu5laAOyqXj1i5yv+79pjsMP7p9n/9LHIxbjULITs0Oa2M0
         C1nVyVad4pA9a4PnEupVRlWRZcOrV/ztmcV7A7GcI5v5TXi9T2OimgUiTTJKCkgbhCOC
         V43d/KeUC24nCVZyeCDuU7brnXXyhy5R3/phU3Fyqe1ts8mpsyXn7h/U9GaTJsD6vNDg
         WCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791277415; x=1791882215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsQCM1m1fnFkJf3mOSpgytxAYne0rV7bfE6IaOdnVKQ=;
        b=io2PG4ptopLe/6CnDBfbpKzgfOPBCG05a7ef6hzOI4YK4feQAH/4UGDGLv8zRaDceb
         Ygf3R+UOM4qkpgwZXzDi7gNxBx4AGf3JRWmYNB6vYb8PdFyBZxqae52H1K2u3wau1cb7
         SLsYCpYbRe6rVTc2mG6IXYbnxd0clUC0ABHjz2sJ/h27K3StYNmlr12Wllq84gMgqUzA
         cihbsHO903eb7FeQ9CMyuuoI6VfVYlBRBUf17S4Rp3+srNHIHD3b16Kdcq6wDM0sxJfk
         A+YQX73q3BUvlHFTtHhSHgk5l4khKCnfFNRj+RPj2r+7V7lKJTQe+i9c4QQAjZpCaS9B
         o9YA==
X-Forwarded-Encrypted: i=1; AKwUvBzreO/Jbed5iYtStF5JvO2rBrO3tj6O9g47S4OGAWLrZqqq9TfVWZmnT2nR7oxzaDgf9eqJeclqQXwFNw==@lists.infradead.org
X-Gm-Message-State: AFuF++n7JRjsFTdOTjBFDjQQIKK+pTnaLw6MAnfmv1xeM//eY2BM1r9g
	ep1WyWmQmZBmozIXyFWhSc/swFIpc6vBvdLmRX5Lf3oU4+y0eLUBk/FXdjANwfBYpto=
X-Gm-Gg: AYBFou3E9sjHSgMg4iQFdwM/jufbEWxaE3On+sv8hiL644t/+f71zFlod2hy+9LeaBh
	6NedFFJTPeeqe2elAkHepB6WWwybdVX4X6IeLU4mq6mk7pmqMtum8uGpxtO4OYrRL478EEvJxYA
	l5je9bBuVmovIlP8jRczSuf0pV1/VOsPMwO5762/TLcVy7q16VL7kmq97iMkU1KrMsmfMza0TFP
	5PG7Q4MiQWUUbcks1WnPsKG1zuC4IAdGX7/VFH1MTEo8SLOzL6os8Dadh1ZXkMVT6I5O8WQL/z8
	nbUbLXJOVM9TRCZakUxYHce5gxXp+wmvt5WbbHxtMbL866suaHcrr1JbhPQMI9yN2U3NGlLpyNk
	z/O1xgVO/SX/hA5aAmjOBOQ5EC4B9qJIvgxSmRfpfR+ZONOBAumcrIqYFWhSFYjZZq5scFPhEnF
	ldwIyojLb9us25HW4Qgt8BZKupVCZQlpMHZJPAQWrE0ZT/Zrj1qgaBsHnZxMKi5+gCAZEAM/gj+
	7SqNkxuZsE=
X-Received: by 2002:a05:7022:383:b0:143:298e:459e with SMTP id a92af1059eb24-15eca269faamr1150735c88.41.1791277415264;
        Tue, 06 Oct 2026 02:03:35 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d82d04c31sm5891353c88.7.2026.10.06.02.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:03:34 -0700 (PDT)
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
Subject: [PATCH v16 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Tue,  6 Oct 2026 02:03:25 -0700
Message-ID: <20261006090327.309550-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20261006090327.309550-1-zong.li@sifive.com>
References: <20261006090327.309550-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_020336_351272_B8916951 
X-CRM114-Status: GOOD (  17.94  )
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
