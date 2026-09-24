Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD66CC98314
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 10:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYg8/zpSHioxr5WMcsvrEj/Oaon7xw1nUWd9LQCf6Dk=; b=bcNrdH/jpRcnhG
	jS1fEaxQdx3y6o/Uk5bDbqPw9EfQSavQZl//OxFWaC4DfiuXEHa1mgMqB9FoofNZF25EEQYWXtpCf
	w7d/zv+zZUQNGp3j3da9sIo/9n1K4WppbxjVVonMWuk9leJpax61Wi1lqLhmLnM6wg6o1rN9sy3dC
	RIUKAGnIzrwQ8zGYVGF3GwuHZhnbg1buqgUkNvSAIYyEBVkbAs7qspsaH4LGFpqWvO93KyW9CErr9
	dlSG8zFHm9EXdFpdHwwEMKo7wWu9+5r+oKjNavXKq3n7WYTcLIFybh+iDvqRJVnhbZdN10UdN3xpQ
	M3eNaZIiHLFBGNfF3GEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gGW-0000000AeW8-3pp4;
	Thu, 24 Sep 2026 10:01:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gGW-0000000AeVU-0N6X
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 10:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QtF+hEd4zxaSXZ54y5RlnY99ygpvKaq026DcmobuPXU=; b=opKJbtD6HIHJxNaO37AZmO9UEf
	QmFk9l0MEwK+Fgc0VYQ6Sq4RyPhNFMrDa048vHwoaou1xO32Z92ncYOP8jBjz1oVNShj3C/pY2zUG
	z50Aje4RQlpZi/SSf+Tio/A0V7uApOyGUipsN/wFOaYDW6asg+i/+HaRFI5RYyDwecH8jWV0QKs3j
	vMNt2/GTPlp6ukE0QN+Tdj+dNPuofjKNH4ZVit0q2HGYMh6lp9bJHFHlunuWj4rmOloNC2Q7+GRew
	eZB9KPWTnl6vLtTDXPsF8+AIG735z+mXUr4QM2yQtkmeFZhZ82HlVafiqXHoQGR2eh1+d2uMykeKa
	+l2SCgOg==;
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9gGT-0000000FoYp-1Qa8
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 10:01:19 +0000
Received: by mail-dy2-x10.google.com with SMTP id 5a478bee46e88-328664ef791so1263348eec.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 03:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790244075; x=1790848875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtF+hEd4zxaSXZ54y5RlnY99ygpvKaq026DcmobuPXU=;
        b=jf3MI5xKMwP/vMmqfdwTNZ3ENhbjAg7ArrDqhxr1OxECWetOoYbEo714PEEg12fyQ9
         No/+3Wgjzu/FiixxvF1ofTS88JbUsKjG+qiNaaLuwpgnDb88XuFXO0YYt2FZg72xXu5z
         jRcjp4woAtrRDX4vJGZDEIBzQ8ovMhAqAvOdBKvImx2a2dJr2cwfE2SZLiYhe6qEMRjL
         EIRqziGeoZxInH4wc/Hdllq7X/UaBaCaVMgstx+S+mnTPBDVlsbs/8TsHtm8E/0oSjdh
         cLjMr5OYiIDILclNaU9PDKAfbWMt9Moz7fesIYouB3rUPg189rfIKhcO+2GC9plW2K+F
         K1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244075; x=1790848875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtF+hEd4zxaSXZ54y5RlnY99ygpvKaq026DcmobuPXU=;
        b=V/JhzGMQvX750UDc9A0Taq+CWKDRN6iRBeNTWPcHX22RavJWBIn8/57jJ1MuUtRByL
         HZUWinuk3Ex4Y4fV9PTJXGU9AN+LVrzJq96d2qDJkaOvO1Lv8CRmQiKbVlTB85GrHNJh
         tOgbDwbtPIuwAqjs7GWNel12iZg/h2/NDce+ECE9wmTm4NnwhGEMB2CCAQ2A7AMpjFqI
         fQlz0puboeuyjvShVf/n4mbrKc8yG6cdPYm7cuZyKIkcKbTpMLH7lPfby+XMaO+02mOh
         pD+C0nJPl7PAs9fUn4tLUR6HO0GWsNGz22rhh+9j9IF+9qFPUPu7uhIm2b57MBRO/uEm
         /iTA==
X-Forwarded-Encrypted: i=1; AKwUvBy457gLOAnhkt7wq+E/wU75XpO7OaTs81SxLZ3LJfD+iEPrK1Qp9ql3JdJkEJuwAo++8XXLDLO9pJQihA==@lists.infradead.org
X-Gm-Message-State: AFuF++n0y+SIPh48vWpmYYo36DA2kTSA9pyc5BrBoCIjDFazC47GziWx
	YLkVmfTNaEG1DRrtNklN+5xVfz9z0U7Sx54gWVmn1dRrSNY9ReIXpjbl7hTBxmrtALA=
X-Gm-Gg: AYBFou27GBNGcx/uGsK1EACdzU2INx81iWZXxTrLTAKYrfMrgOgkHiNvG+9R/VoD7qi
	lJ4zcogG5ron9jYZx9iDdDmsVFnw6TTix/0GhDbNQwUeOHDNLyOzj65u7Davt9bFO5CztPnWTVK
	fCTjo0OOe7eIzI2kJHee0ex9OrmzG2V4un3j5FoMQgwtvnRu66Kycm7ZMa3tZSgBACcWECnMlsU
	SxaTsWhRZR6ZPSIvfOKdupz0Kw87DngQftA9Vcw6F3Sq3/9qebxsWNq05FC1++/c4Bmi1JOtnLt
	nmLWPaS0uPcTvAVhEZQryfuz1WbUbc7GP77daFttzJn8TKjPoQLEakSvV8srRAvhEOWPxgwHEGe
	oXqMZZnw6xyfN2VJ/RzAFwF58p9F8X3FXD8ffAkCtgUpgjOBUKcilN9V/LAATZd8QsUd+J+a0TD
	Am19Qlrp006hvzOFf+ZjqCXI42p5l/yW/l+XKJZm/rG3vtN8ELp4p78oICFClw1uIZropEetmXy
	FyDASP82fHzoqP3uZsuBQ==
X-Received: by 2002:a05:7300:561e:b0:333:b6d8:c2fe with SMTP id 5a478bee46e88-3400439cfbcmr1465583eec.3.1790244075027;
        Thu, 24 Sep 2026 03:01:15 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e498f0sm11649975eec.27.2026.09.24.03.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:01:14 -0700 (PDT)
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
Subject: [PATCH v14 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Thu, 24 Sep 2026 03:01:05 -0700
Message-ID: <20260924100106.2054127-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260924100106.2054127-1-zong.li@sifive.com>
References: <20260924100106.2054127-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_110117_552354_3AD931D4 
X-CRM114-Status: GOOD (  15.03  )
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
