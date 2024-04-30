Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B575BC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 20:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsSKe8l2QQfxVMfA7NR/meJJOXso4J0jsRlCmV16ocs=; b=ga0OVwYAwnZdJ/
	lUJ1PpFgzX10XLL0DS4cTVOT3ARZfAwfLwPwZFC+O2H3tA7vYLog/eqmg32VP1y999ADQPoNBT535
	KGMXabsUXFTJPEv3gy0UE6/Vj4ytDODehFY8S0AdLCsXp6/pGO0Y+fpTSv7ao/81cMU5MmTrJSvty
	OyW/yyXlJqvluOg9Kkuehyu/iLgn42fk1OpSm8iB3lyY4ahngnUqLHbs+rFq4jXyX02SqP3O9mHdZ
	3AKbjhz5T0YrrAy01GIQpErWOfeSlUfS6/d0wJ/ARX4ziBYsl+ylagRu6rTVxL1qo5W6zRQQClQQJ
	cfuwULGRtcwxMBFNsXgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tgr-00000007n9d-38Pw;
	Tue, 30 Apr 2024 20:03:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tgc-00000007n2V-2fTH
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 20:02:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e40042c13eso42162015ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714507366; x=1715112166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KfkX2coDIYxHK7IeteKYtlpeAwqJsH66Gz3p82MjVU=;
        b=y6/0QKm9qQVnBVVBgn+oKewsPgGPYtCXcmsYftuU/RjoGnC1E8knWKNAH8Ru8aLzRw
         WxP3UMkbAqQdnP7vesSAjog+mOF8lW33OMpXfcoW7ap19mx7oCp4pZmp6ya5Ci8UvmOh
         YH3Xypzl0pdye9Cv8URtaACOayKqI25hB6F2bBw6vdX/QEBnnrE+qlLctncs5ErGI6ce
         NcQOMK3x5/o+LNGUyA9owfWfNvv3QrRn+5PaBmm0oCN7yjTIEyxPdeauxq15zC5dwBuo
         fhftxTGVGFDaxMvVepkkAKsKHRbF7uVic0qQvUgu1/1XxilFGHseM2UDLC04koOrpf8Y
         5Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714507366; x=1715112166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KfkX2coDIYxHK7IeteKYtlpeAwqJsH66Gz3p82MjVU=;
        b=koqVon7X5J9AvAJvg/EYUNdyhwnAhorWI6GxO+7bHULsfjcSemy4BZszOhNHuGm6jJ
         +TDbugd4Prqa9nc9tsDgsVl4wDzTWV9WKLy+kH5jP/8rDZTssPc1rIPtfpw5IKGTCVGP
         TlzxvDbAAmasx5dwnE1s9dj69BlddOPNvGadsxkWu0Drz4awUxFk3dC07EgxlbzAa4vF
         FJmbwKAffv8DCrB8ZkYrZRNzfrbdQGZawJOUeldC5Gh0ZV7MJdbknJD5zayMpbcl4Vvl
         yfrB0orY2JGqFB1yHz/hmZJoQFilRkwLSrD/13besaK7IrkUIdxwIBsnAtM5wQLJSjCI
         OJqg==
X-Forwarded-Encrypted: i=1; AJvYcCUbqGG79OIHcZTUjzTUwB/zhtTUA+6v8x5vg+fis8Yzj5/Q2Iz8dUCoV7PkSAkroFNoCRY52M7qyOVuFyjz6ifxJgYnX3r7ClYV5/h5346x
X-Gm-Message-State: AOJu0YzXDs81z6g1OP4n9SbEfACJoz5UJnYNA72Qpl0Pg27YG4t75XrL
	mRXica2efZ1YQLRY3YASn5FLosjW3X7y4LjQz5LKWW30krlLurYpmdl3Xdl2tL0=
X-Google-Smtp-Source: AGHT+IEowGVg3Eqknf3Al/Z4DshsuVQulgWG+lvIcIxZjDaV8J5h3onGGQksmulabRBZQqDlJV7n1A==
X-Received: by 2002:a17:903:58d:b0:1eb:3e13:ca0b with SMTP id jv13-20020a170903058d00b001eb3e13ca0bmr448656plb.37.1714507365982;
        Tue, 30 Apr 2024 13:02:45 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001e435fa2521sm22809820pll.249.2024.04.30.13.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 13:02:45 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 4/7] iommu/riscv: Enable IOMMU registration and device probe.
Date: Tue, 30 Apr 2024 13:01:54 -0700
Message-Id: <f9c9e5dcdc1457da4af70302e85c0a7be532f650.1714494653.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714494653.git.tjeznach@rivosinc.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_130246_712302_D49BD540 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Advertise IOMMU device and its core API.
Only minimal implementation for single identity domain type, without
per-group domain protection.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 drivers/iommu/riscv/iommu.c | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 07c2bcb08afd..17dc6431fd37 100644
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
 
+static int riscv_iommu_attach_identity_domain(struct iommu_domain *domain,
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
+	if (!fwspec->iommu_fwnode->dev || !fwspec->num_ids)
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
 
@@ -96,8 +152,16 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_sysfs;
 	}
 
+	rc = iommu_device_register(&iommu->iommu, &riscv_iommu_ops, iommu->dev);
+	if (rc) {
+		dev_err_probe(iommu->dev, rc, "cannot register iommu interface\n");
+		goto err_iommu;
+	}
+
 	return 0;
 
+err_iommu:
+	iommu_device_sysfs_remove(&iommu->iommu);
 err_sysfs:
 	return rc;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
