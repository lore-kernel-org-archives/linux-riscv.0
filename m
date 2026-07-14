Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD121C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 08:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZPDGuNvsTSaI3U6i9+Ga6lOXxKZn4QP+/FMpBofpC0=; b=z01kgxcPlN30uu
	dfEhDFOZMgrfFAE5OakBp1Zy9m6ZlDCZ/klLzpRDh3krYS85RhcPr2zHUDfC9wDp1AZNv3BxtJ06j
	AAs0YxnILsxG46CK1h4fsMtjcxI3MSCIMwEqrjO1v6ArO6oO3yV+n+KhO9M55/Sbu+iE6eOeEavVA
	xogTpIbHWSmUIYWqVTiw4pwrXBaiQx2Yh4sd3gAVzJK4P5QUsE3GMrX49GYGfAS9AEmaEcX80aU1d
	o62g0hdvCtwZ+15/X75+OHgmfdFdLV6WuW7ucKuCI7NQQ23KCiWzeH2Bp5RZV7y5nl6wWiNQEQXPy
	NqjuSg9589TaFucMDJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYd0-0000000BKBI-1VZ2;
	Tue, 14 Jul 2026 08:36:34 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYcx-0000000BKA5-3aJP
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 08:36:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38101f85591so526975a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 01:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784018191; x=1784622991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wk16cXvhCfpgFzGrnK8+fTVVUodSt/9s9ecoWwXHbTE=;
        b=WpuNti73VaLNgoTZFls4p2ApDqnOOEaOI6iIIpO8ssXfU/CSoUCwQQ3YeMEkC2r5LB
         R8gGWoKc/f10w2rY6MIl0NQKNBm/+yP8WASZrzTCTs/5EoHERpwg0LAKfkn/AEk/pyrf
         zVfYpgoIZjVmbHr8g/M9ztoHrpwbGCgYjVlHtXEMD8uVovxLY1GxfArT1nB4Xwc6VYlQ
         63Pj1bSRe+qH3u9zCdo/THCRhU8c0JVr92c3SkECAwPZht2yaCp7zokxazp/HsjbqIcg
         /l0TnQSTkOAkfZStdIsngSxE5nGv7T6fjY8HxiIjMrxqPe3/JSTc74muaadZRMnCu2XP
         7ZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018191; x=1784622991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wk16cXvhCfpgFzGrnK8+fTVVUodSt/9s9ecoWwXHbTE=;
        b=JVIfkIwcBz/Bu0pQIsFtrLWMxGWwNA7UVi4oinKDSur+pnQEQNnSKSHojlqDXYTJnU
         Sj+YmwvdWRPGIrFSY9PkO5EzmFXuIzw745eyNdkTjl8YPRWT6viL/mcS2P4unUqsw/5V
         qS1euUMYwTqJRfcI/HerrX9uXFX7AEcgAp44Cytepb//k9FSz/2nZOattg/7fK5OZ43i
         gi4g+Ort4NHwXbFm6ZuW6UnUe19EP4PmwabWGHrBSsniY2clK/X49aKWJKVMdXpPjV/X
         +3GgUZf/j/9AyutX4jPvrno//Yz2eCqq2hOGIOhZzaUXO2scJ9sJQ9+Cv11putnAHOeg
         cUng==
X-Forwarded-Encrypted: i=1; AHgh+Rqa/8zs32uH8IKcmtV69vmUupqo9xXMWqXTZWfHqNH1aS5c2q6fY86lmiR6GHCoVEP1h7cixzH5/fgKmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJLyRS4q3n8EkM7JoV70qkowEtz5kNWjY8IFoBJXuJQXIJNF7k
	UVadak9YNs6E7oIwr9rDycmXw4i7qup1zhHREX1vw53FThmvKKK5t/gVBC+hA6hY1TA=
X-Gm-Gg: AfdE7cn86piTzhhsaXp8f89awnTeN0xz8UY7GmgG7IxVpMxnollfYtkkViTAtbEyEez
	aLXgMP9gOCwcca+TVKwDCPkbFgvWdB8Rs50WwDaKBSVghiegynZ3HW62sL3YiojzKFHDxFCTLMO
	tnx4nu4ZgrN72UszWu/CVRSeys7EGrQSu7m0CJ22draMPjOufUKHnXZrYQcCGOQK0sFeinaQjlO
	KXn0yrQ5B9JjGnAaTBh54vxfxwO4TN3a9O+Fe9QbGvafKHlXh3PiRWBm/ayT/sbjxYG9z2stuAG
	AjQxMsVdZp6Yc2XXMwZ8c67RT1/RFXTWVF8RDbaunYUnfChYDWoZMxcGEz9Rruv5hpbn3CbbEVp
	dC9SlRAD3XGSHHtphtIt7JsBYqxBrRjUtwVbJGiYC9uvyudU/G9JN6yWnVnzqyYHDMQystp6dgO
	vJELQYG+kaHMX1nbpP6pTYQxeT
X-Received: by 2002:a05:6a21:511:b0:3b3:3852:6663 with SMTP id adf61e73a8af0-3c0f0ae8f4amr19643932637.24.1784018191116;
        Tue, 14 Jul 2026 01:36:31 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm55932938eec.8.2026.07.14.01.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:36:30 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tjeznach@rivosinc.com,
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
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Tue, 14 Jul 2026 01:36:22 -0700
Message-ID: <20260714083625.1083606-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260714083625.1083606-1-zong.li@sifive.com>
References: <20260714083625.1083606-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_013631_913649_BA0AD252 
X-CRM114-Status: GOOD (  13.23  )
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

Use the physical address of the device directory table as the
unique ID for auxiliary device in each IOMMU instance

Reviewed-by: Guo Ren <guoren@kernel.org>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/Kconfig |  1 +
 drivers/iommu/riscv/iommu.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

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
index cec3ddd7ab10..186c22c3ea6c 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -14,6 +14,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_rimt.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
 #include <linux/init.h>
@@ -565,6 +566,21 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/*
+ * IOMMU Hardware performance monitor
+ */
+static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
+{
+	struct auxiliary_device *auxdev;
+
+	auxdev = __devm_auxiliary_device_create(iommu->dev, KBUILD_MODNAME,
+						"pmu", iommu, iommu->ddt_phys);
+	if (!auxdev)
+		return -ENODEV;
+
+	return 0;
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1613,6 +1629,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
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
