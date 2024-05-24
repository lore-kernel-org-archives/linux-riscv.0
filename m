Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D80C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5H/copW98WAWVLKlp0qkbA+oURcTXJT3drY8vtZTSmg=; b=TRaQuNOEgckWGe
	gUcv+eS1szwSGMVq1YgS2DDF4tppT7r/E5e12xYIgZ6a4OrOuYkrWdJODhBIn6cEQYNCQtCVytIAE
	X5cuhUibA4nTqDRbl073FA9jxEorEot+xgaJzZB28GQQgCzuCr27lvrxwPIQRAxNV9KMFNIqxvTNN
	1EDcgL8zP+5ok9B4K0Xxk25IYarjpEZ84AvHXu6Tq57zUaX+cnWKLdPVECOyRWgUDULbIKNJFMJ2v
	AstAB0VEDm1Gt1EfqN/wjC+ClmbTuEvYOhVPlDojc+bFKrmYGx+E8sMonpdKN1tV5icmdafxWCXUe
	swq2wihgwtedlAnIo5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAahE-00000009i9w-33wP;
	Fri, 24 May 2024 19:35:20 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAah6-00000009i3A-1FPw
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 19:35:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f8e98760fcso1102610b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 12:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716579308; x=1717184108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gxi9dSsEt2UtDDs3loOHfKu3ofWZQsX1GUiGzyjfiYM=;
        b=y+2Tw0pXsOqNVvRRdJKCCi9hhMEHP+mMIcK0BWgh5Al+WmFmVewRqkrnLm1y54AgTb
         pNTJXVPE9eOfkYXE1+0OgVV4wb2MY/3LbW+IF7qj0KA4ZKRxaDmu+w0ViNUCJKyXSJEf
         qcVGdECPX8Ipm6NdcmLMXuo71jumvFBNKqYD4BHsOYHoupReF/hdjzcd0ii7kCgkSEvi
         7u0zaapgzwRzMBWhybFSvs+EZPmmXHgGm5HRy+1OTaYndZojJmt7vfrJyIyyYQnDqP1F
         /FbZVr9TnnoKm1OtVGYqSoxOUnHVK03kaAr7cmaJMCHGvELq0RWEZt+xIUvf+Sr9dcym
         bUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716579308; x=1717184108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gxi9dSsEt2UtDDs3loOHfKu3ofWZQsX1GUiGzyjfiYM=;
        b=JWs4ylLvHCP/heeONK/oVrIpCqGvzjakS/nWttmFtj+8B84ocdvODcgyIBlH0mVLQO
         9zvJUTm8LYbbM6yzQwS9nL1OLy26BcvahDD4OdZ5cmnqSMPjUOWHSa2CECahZFOm74Hc
         oQMy+/8dHhx2uzRIQANi3vcpozNi2hWFpkLIaAdJ1X3p35HXTOrkdVlpAkj6jpM3Eu+K
         ZhTSMIKkAU7CskTfDDLlfafDzs7G2SHjRxuNgJCxEbR+BgH9voi2AorZFW9UV+VjJ/CI
         qA+Rt2lt+xRvYjDIcqA+Tbl9Yagj8p3A8XE6cVj6ebRGVjBmnaNOnOJS+jctcMTnech6
         s1Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUk8dCEo3jw73DxJr1yFeln1uS7l6YQnCgT08oRu9MakJgJsekSb/FMFj6UuoPL12Io7gWQWqEYMDLW3lSpcRWJWTzX5cmrIlMEgai8TbJq
X-Gm-Message-State: AOJu0YyoGTCnseB8kHjsQ6SW9fG/9PER1wSb47XgHKs3YIMGxecjeBhN
	pt8T6+0E6F3vhaDR1h9B5Uzc9DhLJ9zM2zfjcfVKI3//jv4jxQz2imURZni05KM=
X-Google-Smtp-Source: AGHT+IEKtH6lrV41abiEeh8RWadoLdBF/iUtxB4SdAAAJTxupc9rXQotcI4G9k/vIwOqmlUrKhX+fA==
X-Received: by 2002:a05:6a00:2a0f:b0:6f8:b1dc:d980 with SMTP id d2e1a72fcca58-6f8f3f9074fmr3718630b3a.31.1716579307705;
        Fri, 24 May 2024 12:35:07 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4d878esm1441684b3a.190.2024.05.24.12.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 12:35:07 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v6 4/7] iommu/riscv: Enable IOMMU registration and device probe.
Date: Fri, 24 May 2024 12:34:44 -0700
Message-Id: <0a2b572a22247cf3af3a790dc9277cb48ed37430.1716578450.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716578450.git.tjeznach@rivosinc.com>
References: <cover.1716578450.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_123512_386947_D605056B 
X-CRM114-Status: GOOD (  14.04  )
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
index 3c5a6b49669d..b8e0e4b62585 100644
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
@@ -71,6 +126,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 
 void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 {
+	iommu_device_unregister(&iommu->iommu);
 	iommu_device_sysfs_remove(&iommu->iommu);
 }
 
@@ -95,5 +151,15 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
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
