Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C7DC27C52
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 19:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIOmcPVkHvLU47sU7+AqfdCZwLR+FC58znGPP2c2OiI=; b=rbFeBL8yun5K9m
	rw8GFodCEzd4LI3FzM/sUweSd9HY/1HKMh0k3llI6jCdpDO0SiazhJEkzenlY1dPR//py1naDpYhv
	WzJbKwn3+GYDEUdWYDaq1rUi2hHBni4/HnsOEN7prgD0yaUG0qgtvpZhspOwpDBGE3xBEaVEM64w6
	/gI6YUm8MFaQkVL6HHOmsh6XIZmdaaw/TpXkPP3iMBQ6dQmrN7aOSROQ3eg0kQX72/BQsnpSScWr9
	cZmsyOSoaRsdcR7OWEFviL8FhCl9h8KdlcdPm+ob8PieSt0f9Lev7Z0d/BLPQkoJgZEuXBQs1Ief7
	fqtLa09ZlHOGxQQQ6xPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEwlu-00000007NHI-1tv2;
	Wed, 05 Jun 2024 19:58:10 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEwlp-00000007NCv-1rd3
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 19:58:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-702342c60dfso138501b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 12:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717617483; x=1718222283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4qXMlGpKFmKsrTG7a5LCbQMsXJowMadHB0xL9z/+TE=;
        b=LVEx+4qoK7fAa89eP9wAaLtQZX+vV6SiccnfmnY/BdtlOBvwPEmye0fSAiWzvexAb/
         JzojP3CabYGyddTkz7676PXOnrbFhG6vEPUVvbyos1zJkr672t/e1P69Pguo9GvWR69I
         ewM9rP+JVbTBHr+Mld0xdGDX3yZ8HFKu1X2lPxmJ5u0biSOWb7Hpa3Vvd7z6tqHKFJD1
         MMHT9w286+2Hc/8v3wRxvJoDa6WfW5aIQl6UsDGB+aO4VJP2uIboMnTCh4o3lKXMwE2w
         ut0wPcKDtUccQ93Jmd9a15vBLGMhTCfB7LNiPEFmd1KCrTfIR6BQmtcvtPiHCSojjx08
         wxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717617483; x=1718222283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4qXMlGpKFmKsrTG7a5LCbQMsXJowMadHB0xL9z/+TE=;
        b=iB19o/ckuQ7zxy3yrwXuO9qb3MUH4i/V/9+4HeAD/IcmRcZpOQ+agnbvulZl/wXYaP
         hyz179y+vAbeV/oe1lWMjaY+ToZU4YJGsRH84xNKuRkEBNx7slppKNcCcm5jkSYmPPz3
         zTFvvcSPVUra1Ug4IWMMIxrZipDAwnkw1SYQYZ6ct0jEtYy6MSssrNOLQ1m4MQzlmWlq
         eueRhyLqzxisvbVG8RkwNJD8VlfDRykVGM/kRKRGJ0IT6ejeNsgXdzj8JhowQKyB2uks
         8PXgyG8PwIZ5hWWhdKXGIa3qAtnQfQhl1MUo3Y7DNoUNNiijiYaU2bVfnVnCGJselAd7
         WMiA==
X-Forwarded-Encrypted: i=1; AJvYcCW49KfnCMqPfU65sxC308PxCE/jIn8NDOX7ZCl/ySZPZAZhzpc2IVLmAo9BxF6DA4RwGJl8DI1PcQfvTWLIMHjlSScGHTR8MT080H2fkTOV
X-Gm-Message-State: AOJu0YxiRnGlMFTZ3qHBwnAjys9+F6HGqzN6wxqus+dESwR2N30sqoeA
	MZW0FpkORZoTONku84bHVeKWdMRH5H4dSNIGJIzFQ63IUhDSqPmn3YJlkjLxTjk=
X-Google-Smtp-Source: AGHT+IGg4u8JkMWX4fHToDw+Mz7of2dj7MR6lYqtJPVLx71cMemV2dPE+GLuTwembihyzghs4rMJZg==
X-Received: by 2002:a05:6a21:819f:b0:1ac:f796:963c with SMTP id adf61e73a8af0-1b2b7177e4cmr3669852637.56.1717617483430;
        Wed, 05 Jun 2024 12:58:03 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70244900ee9sm8664209b3a.124.2024.06.05.12.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 12:58:02 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v7 4/7] iommu/riscv: Enable IOMMU registration and device probe.
Date: Wed,  5 Jun 2024 12:57:46 -0700
Message-Id: <530cd10360e180a3b8303319ac40a998312e02b0.1717612299.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717612298.git.tjeznach@rivosinc.com>
References: <cover.1717612298.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_125805_562450_DA9D040A 
X-CRM114-Status: GOOD (  14.18  )
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
