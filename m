Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924EAC88E50
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 03:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXX1Fzxj/mIiAurUk1iRpeoVjjcmBsCNt8KTg7YJegI=; b=yoFTStv5DKZi3J
	Z4h49+C5XvPkkjMGkn+UeuUX8AupHfCfH4cPaGo8r1NwOudjyaS81eK+2U3yAzQ3mFj9AyF7iTws0
	AqKD30nRtsEMzIhqlvNV2FO7/vnRK75bBR3bseBY52N38GiTiElo3eYe5D2s5P6AWX6cG8+MsWt0X
	gB3/PqsUlzi+YwENp4IMBomp4nRuklZGEE2Df1nHmvdz6nixjbp9QrQuwN41Cgl3rdYwCQSLwwRHH
	m5N57knda4wbg8Fo6Uj3ocd1w1wjgm4IXwEga/AWpiWK5zaOl4yZOJ2Vb6k8vmjnoGJkpNx4ZTZn3
	/DOWRnhNQiV8cV2L5QQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xp0-00000002IXC-2MTJ;
	Mon, 14 Sep 2026 03:57:34 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xow-00000002IWW-1lmx
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 03:57:31 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2732514a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 20:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789358249; x=1789963049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrvUvXmaXknLZjg6fXvk/ZHbd24dkX4SY4AyuffyclQ=;
        b=jjcqN7oDkUPpFAXGSz57BXRTrA2nWHLhkYR5jzvufxeGyqpKgEschrDJR9rLf0OoWT
         xQD6eg85yTR0pzxyynpJ+rXbtpJ7Fp7IB6YWItk/9hZr3WL8ZO6OlERsE5hWDgH6at31
         lVcEvZOP1pEdu7/u4PAyuCveS36aUSopZZ7nyFWb2yTNL3tqu0BlnJ+jHKumKRSlgqKB
         s+QC0MTvJ5SowsNCNkIjDHEnM15S5TVNoltPObd8wXGsiJvq63ZrUZVzLrrlUXyMpsIK
         75Fkw68FZYmfeL74rkd2m/mxQVJJsee91edGthhxNrKr1ahJHdVrw8n3aWTOY4zSLShd
         S1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789358249; x=1789963049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrvUvXmaXknLZjg6fXvk/ZHbd24dkX4SY4AyuffyclQ=;
        b=kQxuoIa4tpWW8GJVM5jv0oz/QXoYZ7hHKKOGlZG3cdpQsLPR9ETg5ZvaaHjzLPeI2w
         ovyTWJJxFh6I3brOJtqq+bO3kA4hv9zcKRnhiT1KHXMTnIPdYkzCfbwI6MBXhfp/YQ3J
         W4qpVdU2bT7kir5R43KTx+YWUkrtHWnw/uPWKePHs2FnQtKm8oZJCyNXRL2TyBVILqD4
         30T12WlRi6A++dVcgC5HTvwalzpkmpY51ZkHKPkEvuFtxzYUdSBHhE8fXpxuAG6DQH8v
         tSCb6trmKzq6ittNPEf/uQOLJBt4j5C7e8cLFXuItL0dZW9y6X1K3kTycPq0QOw1zxM2
         Ts8w==
X-Forwarded-Encrypted: i=1; AKwUvBznHNlx7HHxb0MbOHVK0OQc7tDWk7+0hAneXI7TrpSaZt7ZlmcJOQsFn67lxZt3lnLvY3uSzCdBbn8s4A==@lists.infradead.org
X-Gm-Message-State: AFuF++k8cfKnCfZrg8TCb2adHMVfV6iIjuL0JI14J/5k4ZoPl06thKfO
	hKxprnF/Zxl2DTi6lItaYx8LPg2uZbWtn2MC0nLXp3Wpj236T/Yqj9demxyRCebw5N4=
X-Gm-Gg: AYBFou0v3X+Ijxn/HpebIR/fD6kuA4ytfgf5vHEm/PvtLBm6TuA1JZQ+SfA0/4y3G7w
	nTevDzqAOg1/AIglwVb//ODdLcfruKQKLnEDurNh7kYD+T+pkvbR7igGYeHxm3/e4mJ5g6OPiWQ
	fSu8/ZhBMQdHJpCYuUzi2gE0TNq4uGey5+Ox7h2wLUozwSu/5qIaZgz9oZUj43HkY5bL48LfQEA
	7tmGAtTLovsmRynwAWoXG5D3ywCctWAMx8Ia9+dW5m1YXejh58EoJt8NxP8M3o3WurywM1pDpQk
	Mm9R60EJ/VXuPMLL6FJl3es8TwWJRNGNPYEDB0HmgFmL6GFlZaB6oz6QO7cGNH93Tm17THbQ3Vs
	ebYTqH17SZ+cNJoiqMCUQz1zfunDaciZKWjs8ynISPFcHtgVm8S28rewoXYt4PZPDpNPfbLKuvZ
	c7xWnOoozY0sHS5kGzNfgUGRULqAG+BtuA+v/r24yBabisgNqyNI3TJG2OkhIhiOQqRX0Udor3v
	UK5toIrrAe/
X-Received: by 2002:a17:90b:5827:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39dec0bbe04mr2006194a91.18.1789358249365;
        Sun, 13 Sep 2026 20:57:29 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm22862554eec.12.2026.09.13.20.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:57:28 -0700 (PDT)
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
Subject: [PATCH v11 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Sun, 13 Sep 2026 20:57:22 -0700
Message-ID: <20260914035723.2922057-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260914035723.2922057-1-zong.li@sifive.com>
References: <20260914035723.2922057-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_205730_736167_8917D760 
X-CRM114-Status: GOOD (  13.36  )
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
index fe8e6d0f8a23..c7495cc57720 100644
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
@@ -587,6 +591,36 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
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
@@ -1636,6 +1670,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
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
