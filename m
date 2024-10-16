Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9901D206A0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 07:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIOmcPVkHvLU47sU7+AqfdCZwLR+FC58znGPP2c2OiI=; b=enGj9uz+YHYdWG
	VjBV45e28PcTKTOq4WKwXdxo5c3797fWtDvxTLGHAn/WFdfj8bY4bMpXnHiMYbuJ1efG9N7ZDFI6c
	P8d1KwPJQ3+5/ZIYl9mqmh8EBbIrqD4QspTTbmmeiZrQ8lCyH0pjCDM4TtE51nBpoo4jQZVwKC6Yu
	SbzSU1HC1dJ0h8lkMtrrTg+cI1pqRCNd3+PQffXLgKy7CnASiBoQNdvwVKyu2GOkNREe/WgrbPP1/
	dhzGx1eCMZIL7g6hck0Q0q1ko2dTw+4cmcdBLt891kUWEGoSM1K7FZBcAj7gQLlVqyjlGQUsRKPnw
	+Rm/BmTUO6yC2iqBQcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y1c-0000000AlTz-40Vq;
	Wed, 16 Oct 2024 07:00:52 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xtb-0000000AjqB-0hOA
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 06:52:36 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ea12e0dc7aso4011525a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 23:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729061554; x=1729666354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4qXMlGpKFmKsrTG7a5LCbQMsXJowMadHB0xL9z/+TE=;
        b=FKFYOwuohiS1h9S3V3F07CXktpvGW4Z1cWFlbIqiP3BWprrCIYUJORxZhCxm0yrwia
         LLxOwUoJEW90kFpaOOdnoYG5eMOnEs4q1s32UcTuX/jY3S2BOnB7gdHAfiCpsjWOvufP
         32Onk7Dn6B4hdUmPO53Mvv3ZW8bCYmEWfGdyiow52pCNgW89D8N+tKbYW1hbCklhhhmN
         2tzrny/9kVTuWO0TfIi4eYzAB2UZ41Wegzh7dNhXcWwpJDyGirjuVVfk7mGJfGiZ8BvJ
         YvDFwmdPeA82lky9iagF2TpPx3RHwTYrsNaEGmuefCrx9AidVnWAAcFyoICH9+A8w+oS
         cx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729061554; x=1729666354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4qXMlGpKFmKsrTG7a5LCbQMsXJowMadHB0xL9z/+TE=;
        b=L5vFCCtOMbi0ZbE/Sa9YnotLInTH+IO7lnQZ07nHqBZnXraXa0JMVheOqAxpklTjVR
         ZGHFJadtz5rKwNBkcoCoqpvMt8BGqU3mDxRVITzWXcrRtuR1jP5ighkZmKUx1yYZlF+G
         cItsyZOi9qrBNnMjyXl1nBC4VOS0hOMUz2ZFxuwiJtGXPgC9hSWv1FostVBmyjq5jXRr
         OQGKupCewUgeXMWHd7OBvsbFTPfiPLA4qM6xcBOv8V2jFEgfVxL7sOj7TiZPMcDCrWEg
         +sneUnGIQwwmK0andBvASx1W9zUS+lz+Vajiu92W1n403ssfo3Rhg6oKCRm0c14OU9ee
         +npA==
X-Forwarded-Encrypted: i=1; AJvYcCWHyoJ7lRFQYW6gj5wqiMHS+gzvjIrS39591+NLh5E1DgeV74/hNMg/jezsKbh/QdsHTmRodsXisqIb7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+LkcNIuA5pp0JlJoiApJ7bfpj7dcfSzW3nakJCYrR3C/Zbkrx
	ojOhWotYurUgRG9iyXr+P2KwOUIK7JcxjuWeJrzKY3C7KEm5SimwtSOBfcOE2+E=
X-Google-Smtp-Source: AGHT+IEd3jNYTkKRaM58YopA7EHkB163xeeSgYuRuYoGHjtlDsyU6B1dsT/WH1axodH/Titr0Y0Jsg==
X-Received: by 2002:a05:6a21:9d83:b0:1d2:eb9d:9972 with SMTP id adf61e73a8af0-1d8c9587e1bmr20287472637.20.1729061554057;
        Tue, 15 Oct 2024 23:52:34 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77370a83sm2410762b3a.5.2024.10.15.23.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 23:52:33 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v10 4/7] iommu/riscv: Enable IOMMU registration and device probe.
Date: Tue, 15 Oct 2024 23:52:16 -0700
Message-Id: <ba79c8eb9c7f1cd9a8961a1b048e3991ee9a2b05.1729059707.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729059707.git.tjeznach@rivosinc.com>
References: <cover.1729059707.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_235235_349444_0774BEB5 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Advertise IOMMU device and its core API.
Only minimal implementation for single identity domain type, without
per-group domain protection.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 drivers/iommu/riscv/iommu.c | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 223314f7ed0a..c54088bf138f 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/kernel.h>
+#include <linux/pci.h>
 
 #include "iommu-bits.h"
 #include "iommu.h"
@@ -36,6 +37,60 @@ static void riscv_iommu_disable(struct riscv_iommu_device *iommu)
 	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_PQCSR, 0);
 }
 
+static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
+					      struct device *dev)
+{
+	/* Global pass-through already enabled, do nothing for now. */
+	return 0;
+}
+
+static struct iommu_domain riscv_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &(const struct iommu_domain_ops) {
+		.attach_dev = riscv_iommu_attach_identity_domain,
+	}
+};
+
+static int riscv_iommu_device_domain_type(struct device *dev)
+{
+	return IOMMU_DOMAIN_IDENTITY;
+}
+
+static struct iommu_group *riscv_iommu_device_group(struct device *dev)
+{
+	if (dev_is_pci(dev))
+		return pci_device_group(dev);
+	return generic_device_group(dev);
+}
+
+static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
+{
+	return iommu_fwspec_add_ids(dev, args->args, 1);
+}
+
+static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct riscv_iommu_device *iommu;
+
+	if (!fwspec || !fwspec->iommu_fwnode->dev || !fwspec->num_ids)
+		return ERR_PTR(-ENODEV);
+
+	iommu = dev_get_drvdata(fwspec->iommu_fwnode->dev);
+	if (!iommu)
+		return ERR_PTR(-ENODEV);
+
+	return &iommu->iommu;
+}
+
+static const struct iommu_ops riscv_iommu_ops = {
+	.of_xlate = riscv_iommu_of_xlate,
+	.identity_domain = &riscv_iommu_identity_domain,
+	.def_domain_type = riscv_iommu_device_domain_type,
+	.device_group = riscv_iommu_device_group,
+	.probe_device = riscv_iommu_probe_device,
+};
+
 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 {
 	u64 ddtp;
@@ -74,6 +129,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 
 void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 {
+	iommu_device_unregister(&iommu->iommu);
 	iommu_device_sysfs_remove(&iommu->iommu);
 }
 
@@ -99,5 +155,15 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		return dev_err_probe(iommu->dev, rc,
 				     "cannot register sysfs interface\n");
 
+	rc = iommu_device_register(&iommu->iommu, &riscv_iommu_ops, iommu->dev);
+	if (rc) {
+		dev_err_probe(iommu->dev, rc, "cannot register iommu interface\n");
+		goto err_remove_sysfs;
+	}
+
 	return 0;
+
+err_remove_sysfs:
+	iommu_device_sysfs_remove(&iommu->iommu);
+	return rc;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
