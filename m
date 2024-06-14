Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C10C27C77
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 14:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfpiQuwDp+S3HlPLrzgB9RjIEgzSEjhEjAYq4CqCHb4=; b=yefLQibuywaq5H
	AzBt/qF+9ua92Vs4Ety0TJqF7c/AldUS3A4E1ZRPuTb+j+ngHD7/EKlQgVI+c/fQq5Ofjd9q7qGvQ
	4CKdo6HeTTzQbyeAiunSD+wi91ww3i2nyK/ApRxrq3F+z7xkkUTSZNR5J0doq+ONNyXdAo/tcVuFx
	cQqGwwIBUCjsHlMILhqGD1dfTv09Rdb5YXrsvQhBY8cB0qdmEmBIKaraxU35e4vW7Hq1+OeDVPB85
	A5ijvvCWT0yanNL/rynj+X5R5oKh6ooDzPbA62XchoqoNAKvaQNafloulnQYgsgAClmrgGVMj2cvl
	Rms41LGmoMNW9Dg6aEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7p0-0000000302H-27Gh;
	Fri, 14 Jun 2024 14:22:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7ov-00000002zye-3L2w
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 14:22:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f44b441b08so17984985ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718374945; x=1718979745; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E4t/LszTGtZ4bHNAAc59INUfcR6I2TK1LJsq3cDy7I4=;
        b=VSvjngO3f4aPGI3i2VQqt+Q/Qln5/N/LX0k4X/v5N1Yty/trAno3+dWSl5FYbPls2O
         MEs8nSDq9M8OYtMw3Z33CZSjxFluDMwjjaY9YmbWDjOMOhE/fKlzabeBdG46I/Zgwio9
         9qcTqFOyiIMDWdBp5tDhRl+gc1WXMma7cB5Lp7zzg1hADnTxtDOozoflKyRFwuc4feoE
         nNT3jvzinQ7mWCXLqzuprwJQu3KIldMPchi2EhGtGb/8tsdur+ktl1pd1BDv9ach0tTA
         6+GV2/dLj4gD+YfN5lPD/irSztql+kr1tzvkF2bW4TgB0jHwHKKT6w+h/W58B0qZ8biA
         dIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374945; x=1718979745;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4t/LszTGtZ4bHNAAc59INUfcR6I2TK1LJsq3cDy7I4=;
        b=Hpmb6tHQBtBwXaHWo7brsrf83biEUv2UOqtQK3B6tTbQ+akcen7rDcVeEBXtne1lIy
         bheC7i386+8E9TRPh76rwr6R843M4P4IisR3Wb0YaeAM/cmkK6n0eiAkLnBYHPl+6n/l
         QXnoxJIkFWdPYYbwsry2dJVCrIQgCeUae31L8R/YUa9XDaCgUdkcdz7xKLR3uDYpllJs
         wlc6FHN6zv5ttWwWdJ/X+e8es/YYdM9oCV/8jXB6xSIZ+KXyjYduAc3D39xXeBI4N6Jn
         cJjXUrxLesKIT3dDckYPXpu3il7GQmLudccByFgQKk4J9KWb89I8yhU7GZewJ4AabpN6
         QzfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHvyDLz5w8iZ0ZjWdnujp24AlQkLWKRuvJO4XGmErNRVmLfYQ+32RuBA4rNdzhROgrwwo0bt1jrHzY6HqSn6cFJylQh0SGQIGSzV+kLNEa
X-Gm-Message-State: AOJu0YzowyeauyVcRFgkI+uftUpwcNtw5rgzXb4aMvFeZWswvHhrvCBf
	QdvriB96C5fXMnZ9oX9SG8BbfUE4n+LUS1iSODQkwdGSnlVCip9bPlDVOwQHynE=
X-Google-Smtp-Source: AGHT+IEUOmCzKpXiteK6r7fTuiEwyVLmZFa6bNiW2D8099v/kAcWiUtRw3i/QaJjtdfif4s5IWfWAw==
X-Received: by 2002:a17:902:f78b:b0:1f8:70d7:d7ee with SMTP id d9443c01a7336-1f870d7dc6bmr4584665ad.46.1718374945100;
        Fri, 14 Jun 2024 07:22:25 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e559d9sm32522005ad.35.2024.06.14.07.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:22:24 -0700 (PDT)
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
Subject: [RFC PATCH v2 06/10] iommu/riscv: support nested iommu for getting iommu hardware information
Date: Fri, 14 Jun 2024 22:21:52 +0800
Message-Id: <20240614142156.29420-7-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240614142156.29420-1-zong.li@sifive.com>
References: <20240614142156.29420-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_072226_012395_CDF2993F 
X-CRM114-Status: GOOD (  12.86  )
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
 drivers/iommu/riscv/iommu.c  | 20 ++++++++++++++++++++
 include/uapi/linux/iommufd.h | 18 ++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 45309bd096e5..2130106e421f 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -19,6 +19,7 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <uapi/linux/iommufd.h>
 
 #include "../iommu-pages.h"
 #include "iommu-bits.h"
@@ -1567,6 +1568,24 @@ static struct iommu_domain riscv_iommu_identity_domain = {
 	}
 };
 
+static void *riscv_iommu_hw_info(struct device *dev, u32 *length, u32 *type)
+{
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	struct iommu_hw_info_riscv_iommu *info;
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
@@ -1644,6 +1663,7 @@ static void riscv_iommu_release_device(struct device *dev)
 static const struct iommu_ops riscv_iommu_ops = {
 	.pgsize_bitmap = SZ_4K,
 	.of_xlate = riscv_iommu_of_xlate,
+	.hw_info = riscv_iommu_hw_info,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index 1dfeaa2e649e..736f4408b5e0 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -475,15 +475,33 @@ struct iommu_hw_info_vtd {
 	__aligned_u64 ecap_reg;
 };
 
+/**
+ * struct iommu_hw_info_riscv_iommu - RISCV IOMMU hardware information
+ *
+ * @capability: Value of RISC-V IOMMU capability register defined in
+ *              RISC-V IOMMU spec section 5.3 IOMMU capabilities
+ * @fctl: Value of RISC-V IOMMU feature control register defined in
+ *              RISC-V IOMMU spec section 5.4 Features-control register
+ *
+ * Don't advertise ATS support to the guest because driver doesn't support it.
+ */
+struct iommu_hw_info_riscv_iommu {
+	__aligned_u64 capability;
+	__u32 fctl;
+	__u32 __reserved;
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
