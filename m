Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B73EC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtPD/U7QY2g8pxSCO3wV+U2fheafO+8l0Qqv6I3xsAw=; b=YZtl/cWx3CO12Z
	dv/qhDoKhIlgF2Wyt1Virmce63p9gEbOYleucwfIrcSU4fObqr+XPTJHTdFDfMQU74KtqzlmW52tY
	4GY+plfKbP+zQS1c0dRRrO7VyPvqV6h6AI1cL7k15DPRX/NIrMMWitDkHnBm5roEjvK9/aeOeu071
	EfVDSOa+EXd3hTELxml0zKO6sbI6VUThqyUBeBnSqFpyFPlcGoP9kspAsNnFMOJuD4I8257biB62i
	hyTrLXoc+pOCFjNMI1eX7Tmzh6Z0l25KV43YkiDR4lN1dyTQ6qB1FZz895R/PkJB0z3ExR8N5/4f4
	55rxSqarEM2OZYhypJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Llv-0000000BU4c-23Ia;
	Tue, 07 May 2024 14:26:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Llp-0000000BU0a-3mQb
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:26:19 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6f44dd41a5cso3082004b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715091977; x=1715696777; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+b6a14h4JCjFlQP6t364i5UnYTPW3CwsNAJ2Ic+YBk=;
        b=bQ+G4VgdGkkivQoi1vC/JWfStF20/T/3nirxd4US21zfYZMkjI5qOsZhk5tIh3/igg
         +gE1FPCYCjsX9a+7DploWmlvqgpKpeb7OG9xNaIRDib36dTd+YwsPB31sq2ryioe7zEP
         01YqpTNMeTS7SDwulCFCroFVu5VlgSNJWU1nN+y5JN2G7u/ih9KGYn/TjW9bHff2/ZLB
         z4zNZ4FteS0FTien8gqqRgkvBPSWHmvlBQE3i7k3w2pIa9xUuYQf5z0O2VNJe1PR+FCO
         pR8UzHRUa4fvQNb9OwjWHeM+vaXJa8Hg4IMNympAtYQ/qkjLbXIJYWhpqR6qrpIqGFdW
         nnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091977; x=1715696777;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+b6a14h4JCjFlQP6t364i5UnYTPW3CwsNAJ2Ic+YBk=;
        b=fxv6rG5X2d2G7XiSW6DJHeiWoFBnidWxsYFx4k3Qh5rnOsMUUADhQivh49Mcu0sxhH
         GIlvP3XIAkugcdXXwecqvySjsOoMUDpNR9DRbJ1I8m80Zb0CX1dPCUZYrJXLsyoJFCP2
         TIGCPY9Xqa6asYJVyIerOAhbMIe9/P+gLcIZU0laO02lU0HPyKBRLNZbSDAiyL49d6kW
         GnWBdcow3ohXqYS8D+58v0dxFAe5HVQFRLRYVeueHEfUluOn6UnZMZlft/D2XzovPOam
         HOTjB21dyT1xf5XWvND6jrqgzxsm1L3Tv1b1KSAwM9FR8np9CdjE+b5TuUFtcSX3VXRx
         FqOA==
X-Forwarded-Encrypted: i=1; AJvYcCWlYWljJJeGDgUhZK2FOCZxZdB4kcNmgfIIoPulFAINaSvAjtZ4coawNndiEBWLtF5hOWMnRNRPHOir36R/XIWftGV/jfGBjn3kLS155J4b
X-Gm-Message-State: AOJu0YyP2tvbEPq9mAZFaerpVefxN2SrHegWlm+jc9KSf5sMETMvh/jr
	6k4jpHJ0Wczw3K9SQXuZlZ78u5YmyFClUJPKX48ro/ygwV1spw0tJKihPAm09xU=
X-Google-Smtp-Source: AGHT+IGGpKiuhFlm6XAxN2dekhHNztwFPkYH1wk0fi2F0H3c/gi7fQ/EHQEjzLAwbTOOSYiKwoJeKg==
X-Received: by 2002:a05:6a00:843:b0:6ea:86f2:24fb with SMTP id q3-20020a056a00084300b006ea86f224fbmr15303975pfk.25.1715091976310;
        Tue, 07 May 2024 07:26:16 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id i22-20020aa79096000000b006f44bcbe7e3sm7687554pfa.201.2024.05.07.07.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:26:16 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH RFC RESEND 4/6] iommu/riscv: support nested iommu for getting iommu hardware information
Date: Tue,  7 May 2024 22:25:58 +0800
Message-Id: <20240507142600.23844-5-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507142600.23844-1-zong.li@sifive.com>
References: <20240507142600.23844-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_072618_045085_C716B0AD 
X-CRM114-Status: GOOD (  12.84  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch implements .hw_info operation and the related data
structures for passing the IOMMU hardware capabilities for iommufd.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/iommu.c  | 23 +++++++++++++++++++++++
 include/uapi/linux/iommufd.h | 13 +++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d38e09b138b6..072251f6ad85 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -19,6 +19,7 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <uapi/linux/iommufd.h>
 
 #include "../iommu-pages.h"
 #include "iommu-bits.h"
@@ -1485,6 +1486,27 @@ static struct iommu_domain riscv_iommu_identity_domain = {
 	}
 };
 
+static void *riscv_iommu_hw_info(struct device *dev, u32 *length, u32 *type)
+{
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	struct iommu_hw_info_riscv_iommu *info;
+
+	if (!iommu)
+		return ERR_PTR(-ENODEV);
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	info->capability = iommu->caps;
+	info->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
+
+	*length = sizeof(*info);
+	*type = IOMMU_HW_INFO_TYPE_RISCV_IOMMU;
+
+	return info;
+}
+
 static int riscv_iommu_device_domain_type(struct device *dev)
 {
 	return 0;
@@ -1560,6 +1582,7 @@ static void riscv_iommu_release_device(struct device *dev)
 static const struct iommu_ops riscv_iommu_ops = {
 	.pgsize_bitmap = SZ_4K,
 	.of_xlate = riscv_iommu_of_xlate,
+	.hw_info = riscv_iommu_hw_info,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index 1dfeaa2e649e..ec9aafd7d373 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -475,15 +475,28 @@ struct iommu_hw_info_vtd {
 	__aligned_u64 ecap_reg;
 };
 
+/**
+ * struct iommu_hw_info_riscv_iommu - RISCV IOMMU hardware information
+ *
+ * @capability: Value of RISC-V IOMMU capability register
+ * @fctl: Value of RISC-V IOMMU feature control register
+ */
+struct iommu_hw_info_riscv_iommu {
+	__aligned_u64 capability;
+	__u32 fctl;
+};
+
 /**
  * enum iommu_hw_info_type - IOMMU Hardware Info Types
  * @IOMMU_HW_INFO_TYPE_NONE: Used by the drivers that do not report hardware
  *                           info
  * @IOMMU_HW_INFO_TYPE_INTEL_VTD: Intel VT-d iommu info type
+ * @IOMMU_HW_INFO_TYPE_RISCV_IOMMU: RISC-V iommu info type
  */
 enum iommu_hw_info_type {
 	IOMMU_HW_INFO_TYPE_NONE,
 	IOMMU_HW_INFO_TYPE_INTEL_VTD,
+	IOMMU_HW_INFO_TYPE_RISCV_IOMMU,
 };
 
 /**
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
