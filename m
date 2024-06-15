Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C02C2BA16
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jun 2024 05:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIOmcPVkHvLU47sU7+AqfdCZwLR+FC58znGPP2c2OiI=; b=fsy2uJiaguW8Jq
	cnIB1yBYB173tcGewI9vWc/39w51qIY26OGgHvaJp1GlhQW6TR+Y1UNw6AKkOidtKWJa5AzDjURlX
	q/Afg0L0SJXZYKdge30zUuVgK7e8IzAVdaFnR/MYVDswiGHVB10lNz3IefZt11c9kUc3Bo0sYn199
	bVg3hnRtuEUSyoovColrWUUiKJb6XHY7PtC4ZplJfcLgPbuVnRdV/dirnY2st920/6avguNPKu34r
	k5uGHAR5NsXJvstVTmYibKcnc5y7ESITZszU5wn/UlUnUBOlGFHnLGJBlOUzp2aODkwjUEsbvaZN6
	r8CxctdFTn198vn5GNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sILxK-00000004iZF-2rdo;
	Sat, 15 Jun 2024 05:28:02 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sILxE-00000004iX3-3oer
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jun 2024 05:27:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7041ed475acso2267202b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 22:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718429276; x=1719034076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4qXMlGpKFmKsrTG7a5LCbQMsXJowMadHB0xL9z/+TE=;
        b=gJ5fmxb522LypToO6nJQbi6daZFCw8ozlv2Jv5jhhQPyMx6XHBh4OMiGusRPZW/Fkz
         DcnLPBUyQXvyVBuf73HoxL3OaxmR/pFKIyH0JZ/t2ZKpA6EVhp8a9FY2JMwZeGG0kxCe
         KMUhWHNxGtkTksH57lbW2KtnEVpxNnsSnd+Ni8U7SSyE7yPmNdp6rSR+s+AKyQFG2c9g
         AAtcs9uFEspIpzwAUQSY8gNGMG/qb22oeHhBInru+d2OFOQc9POFU7jRs9nbDn9Er8ZN
         HeqjT4DI/vyIQQGgEwalNkFg+PXaqSbYZ344nlNBzaD6+x2jpxs2s1ENf6EnYoRYoKOF
         UrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718429276; x=1719034076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4qXMlGpKFmKsrTG7a5LCbQMsXJowMadHB0xL9z/+TE=;
        b=AWbpQ8hermp9sDvJKlr4PeT3iAOL1WCU/6Y+oaKxxm0ZID6jnB4x4pfsMIs7/dwOHg
         waDDx7dfxcG6b89PjU3NZ3jkrDhPv1NuKwqfazsAt0lhvlxI8Jqkpf5NWXE76S/8ZEvq
         U/VvCYZHNJO4ABOKFIys48SnXJH7C5fqnpjKMvLdmFuZ9yvFcdrRbLS6J5J9MY4awgoO
         2utNSkxc5jmx8loDOnFB3iZMG6RYhptrXVlbc2cqOdNuwtFneHL0cLlE4ptRDxK/b2wy
         SSGHKFrdEur+8003I+dDvUIQ80R3z0ibTnDBNATAXdj3TgUDjKmQDumva0RHPBDC6WHF
         xk6A==
X-Forwarded-Encrypted: i=1; AJvYcCXoC77fVeFOHnvblZKXEIs9012GoALxbWA/XMn1JmnhbxBZqlHcfwsxXPp6TUSqCFoR8rGiJ4PHfGbBALWgyaYYs6in1s91vAxpqDlvyP69
X-Gm-Message-State: AOJu0YzTAOFoj7whWqKcCCcQK9aanlCiAGHggedlEvuQPrF4jxWUR0uN
	oRYTSfK/bLEMe/th7c/kzEvCgq0VWwUOxQEj7nistyBTGtL40cOUYUmpGz5NyIk=
X-Google-Smtp-Source: AGHT+IEKpMgRh5o3BPdhB1zSaaF7P6cYldcO4nlZCU/wDi4yPmPqCBmYu3hIUuni889NHwpJ7VajVw==
X-Received: by 2002:a05:6a00:4d17:b0:704:2f2b:a2a9 with SMTP id d2e1a72fcca58-705d721837amr4438399b3a.32.1718429275577;
        Fri, 14 Jun 2024 22:27:55 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b99bsm4081578b3a.143.2024.06.14.22.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 22:27:54 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v8 4/7] iommu/riscv: Enable IOMMU registration and device probe.
Date: Fri, 14 Jun 2024 22:27:34 -0700
Message-Id: <f2158ca381e04af699ab4c66dc7168269df1f95c.1718388909.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718388908.git.tjeznach@rivosinc.com>
References: <cover.1718388908.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_222757_056035_F77F72A9 
X-CRM114-Status: GOOD (  14.03  )
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
