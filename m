Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA19C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 02:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTIknYAjb+iwOYUCvPhsLURInoExiB8hlDWSQKt+YBk=; b=bnFLwn3GOMvIto
	k2pjqawG2SeprMjXkMFRsHkbNUuHryHd1n3HZQQFtxODQf0o8t4SlvzI1JlJhUBfL5xUC6mtMcybR
	pZdW/TaAjFVtQtjGZqkYzr6N/WLsRWzmMWz4gEzIpOUmaB0Ll7aA7Tor7K2WY+Q0XZXMkFf4cZnGs
	cKOgTaaTtKH1NXBYg42ZMEgOu3Y9/t5DLfU+D4hUE8aM/ikwr2/lhTw9BUWaCzwWr2An7pRU8rvqA
	jtOXXX/ExKWY+00zJF5oxHb0aZBGAEn3O89blnVBO8GF21m3OWyaTfn0wJ/cUdIHcay8O00zG3H31
	Knodzo0vvIrWCMR7u4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3lBp-00000007umY-1rp4;
	Tue, 08 Sep 2026 02:04:01 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3lBi-00000007ulH-2102
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 02:03:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4182225a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 19:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788833033; x=1789437833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Db3wlFQ7tWb65H2cUA6T2ug5PcDOcaldDbKEP2DhiPU=;
        b=epBF7pmu2OGGHml+VGPhfp+uwmnYxoj6/1eelGTuad7+LbjTPCWz6tTvz30uUKMxGz
         ZSBL/e38gshOYy0Uhzb1z6uUgWo8unMDyjpq21SU4AMOtU/o0IxAFDQTCDu/OlVAXgg9
         toGRI2oF4u67xVKhDcofF7OVOT8TDMycJiyNLgTC/DNCpGA4IUYFNfI7p9XgJu5UnsiY
         iDMSEnsl1posr+z6E5V1U26qcwabO+wYD1LN8AZVpYwjSSN1spLiOv/7StBULQ7tuoiH
         vs/m0HX+t2y9FeGr/sqGIFgCZ11zx/kgOZu4vt6Ss6mtGxgd7mBUPUjebMlk+cmseR9L
         DdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788833033; x=1789437833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Db3wlFQ7tWb65H2cUA6T2ug5PcDOcaldDbKEP2DhiPU=;
        b=BHOomtrOYBprYlT3L3K2fPo3zw6vIR320ri2SnR87So7488QTLjlX3AT923VSpz4EM
         glzL2JMvrFHHrEE3Q+fRsemxalpAbMRLGz7oJ/e1Zli3fdwEAiQfF+tXQG0NQFqTR6f5
         1ZyJehgIsVy7fw92+dBxv+WbUD+WETUfSZfl4vVC4IHGw522GBcVvrU90TRZGLNmav3G
         xGnqD8NoJ+llE+noWJOmxrXwrmW89+RvmseaKkXoS1YbTrF5z9gdBmu2q0xymflLD+jQ
         7Ny2KHit3Zv2eOLU9wi2IkkjS0M+auDlTdqRXo6BR3psiYgsWLni5xoHZsYKuTQPkP0z
         paRw==
X-Forwarded-Encrypted: i=1; AKwUvBxJJF9k0SlL7AaYRrKkwHeiD1X6gw4CzaqedaD+ARjy+mMb0Nr7lPkxGi+DsHr1Ls8nEe1GRXeSnvlhig==@lists.infradead.org
X-Gm-Message-State: AFuF++nSnIkVTRcW/ok7SjvsXyNavz34f7cqH/tNzrpQzIq/4Zs8wxu/
	+IYAllSdefdrtWic/bKsZVUsoj1KlpWJW18XCyTGSYJwN1afgX3Fi+c4i7qQKdUVB44=
X-Gm-Gg: AYBFou2j4oRe4lO4WuPbcVdb5J/erWRxe5flP1+kJZ5qLnnCx8gKPw6Exf22yB0bNd4
	9b/uEm0WQdBdht/LCXp5nuQkXU45HW8SjzXFQ930gzIrOm6cAE9HVPJQLqyj88HxHQH0dgwnAD/
	GcnTUwVHxghIDtBlzWmM2IUb1vNToiQMLGc8ikw32Hh7S2VBQL1i8g3/67GQvDDLG7ohxY/i/Vo
	xbkYA1msoh2wHRxQgdGxi+lavYSBrRJn4t42Fm6B9bDwuNVSZwsltsF6Oe6oB45N36GjpDjm8qR
	NKr9E80UVTeZlNpQDEcC2rmx1QJ3nmiQXbFO5n/vciwMNskqda0IBLqL6Fr0ib2rRkdB3zmMALl
	qkvPM81AzAedkJwidP3zBrrEFnsnbl9DnfgybHnVEPaVPvBMuWr3xZW8wNcCnLXvYeVy+XCOB+o
	9gru7yAwge77sMtkydhqmtiqOgnvx5qwyLY3rBimIVD3hRevbVzgsJW62Qzfn9TBJ/knW7GNbv
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr34307454a91.4.1788833033541;
        Mon, 07 Sep 2026 19:03:53 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm893671c88.7.2026.09.07.19.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:03:53 -0700 (PDT)
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
Subject: [PATCH v9 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Mon,  7 Sep 2026 19:03:45 -0700
Message-ID: <20260908020347.1836653-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260908020347.1836653-1-zong.li@sifive.com>
References: <20260908020347.1836653-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_190354_551886_B61A0CF7 
X-CRM114-Status: GOOD (  13.83  )
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
