Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98543C04FFE
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zm5De7sBQY/Uk6SWHxqdrd/wGQmKWdKgPLiD2Y/Jx20=; b=2+NQqfCIqZ9z91
	9E0skSazRoKN6pkTq+Hhh3UPCqShJfZetbbdavsPJ9ooUT8l1kkq3f1jnWDPRgqOLoyQ8vuBrqnx6
	lLMRkuvrXjrDuAYpkBT8UzEKYY75LK9MQsYXUl3za7LUy8ljx1TpmdOk4/hBThZeqD6LYx0rkWYPM
	ZE7qfNENNkVIK2WSGN/u97juKVGSimvxUKwAfz2nlvbCR/RAP7HvxEyX1dLknD7eKn55idmPdmECr
	DMwc5U7+jUl74ezcGZAByWvkUTDqmgRQXtvvropJJ4DbRbV9CJVpOYpdl85VWza4iAtyeibXHSAFv
	1KLiz9+1KCq+iA6fNsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVq4-00000003Ewr-35DO;
	Thu, 18 Apr 2024 17:46:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUgn-000000031Vg-37sN
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 16:32:48 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ed054f282aso976610b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 09:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713457959; x=1714062759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClrhxH/v7i3t8bwZbyxYzN1k2YxvVKno6GgPljZAZHM=;
        b=xenG+q85iq43FAxeI3PjdKw5B/EW5iSRubSMq0NURQ2Hj5o5PxP1MI43JNdt6slKrH
         6mOpkUyB1zxEFtxCMSmYRKfv305J48S2Kfvi+klbS1gh59lMu3OPzG8FQjMEv/QfsR/9
         YFkWgYMSgfldwxyvTVeWtIS5K8II1s7CFfIbSh3W24cjGpixZoKvgMGndnSclgJUeR9D
         NjIa69+N7waUR+K88/ir/CkWD8imX+hwEkIj7lqEJL/K1YzdEfziqxroFZ6y8Q/dgVUu
         o0njjUKBZTaAh8RIe5BpEpiaYhGNJZIJfrWBASzFx4ygMT5YJhehsKhQg+HhimBQ4ldY
         nvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713457959; x=1714062759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClrhxH/v7i3t8bwZbyxYzN1k2YxvVKno6GgPljZAZHM=;
        b=n/L+D0U93ewmXrvZ1V+/XOxghWB/cytRXw+sRZLv+/poc1vjuEeQfqhfsZ2irwhXtI
         8gUPQFKIb3Ai064gjNOLw8viZvt3Cz69Bd8mZgyeYY0WsUvO41APXqBsrBboO0C6/m/M
         CEeVndrCoPfCyUyXuQE/g2OakaCLUuLayAUc1uVAAZv9BdQ8YaBYlEbaSE5sKVrG5H2y
         O9chE137EkxaDqoaeVwHCHaNtUxVCfFGPWbZXaGpXYGPyNqXiGbBUz0x0QiWbBQ29FCw
         wnIDtoVcPWiH8YM4pQGSN0PBXRFz5uVw/k0SOqSwykQ8id3qzdpmA6LHQf7sqMGyc6m4
         rfsA==
X-Forwarded-Encrypted: i=1; AJvYcCWzt9qhu5kGymeNyb3lnfuKKpqQ4/j8dGOn/CgOd1nmPWPx73c3G1V2QcivJdlIJrqbVK7lEVYztYVOIQag5hWeZ5PAUmOi5nW/ReAge2wa
X-Gm-Message-State: AOJu0Ywr7lb5zca3Lz25Z0/7Eqg4k+kSdgYbYscoPYcRPc6f3tpqJ1AV
	JQdY70WfQlnaOSjbnC1/ZrLtL3ZR+JeG3TVEXraOqw3MylzqEtAxauEWjlb4nT4=
X-Google-Smtp-Source: AGHT+IERN6e0yVXm7jt86/mFHrIhsHHA2BKFeOAgx+SKZn+2UN/ngzedc29EmyEbV1Y4ZmH/DB5nrw==
X-Received: by 2002:a05:6a00:4d09:b0:6f0:bb90:26b9 with SMTP id gr9-20020a056a004d0900b006f0bb9026b9mr142485pfb.5.1713457959459;
        Thu, 18 Apr 2024 09:32:39 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b19-20020a056a000a9300b006eae3aac040sm1674755pfl.31.2024.04.18.09.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 09:32:38 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2 4/7] iommu/riscv: Enable IOMMU registration and device probe.
Date: Thu, 18 Apr 2024 09:32:22 -0700
Message-Id: <c681ad581ddf644a288cac44ed4f7fdfd1acae0a.1713456598.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713456597.git.tjeznach@rivosinc.com>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_093245_923177_54BC6A4A 
X-CRM114-Status: GOOD (  14.08  )
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
 drivers/iommu/riscv/iommu.c | 69 +++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index af68c89200a9..d38317cb2493 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -18,6 +18,7 @@
 #include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 
 #include "iommu-bits.h"
 #include "iommu.h"
@@ -30,6 +31,67 @@ MODULE_LICENSE("GPL");
 /* Timeouts in [us] */
 #define RISCV_IOMMU_DDTP_TIMEOUT	50000
 
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
+static void riscv_iommu_probe_finalize(struct device *dev)
+{
+	iommu_setup_dma_ops(dev, 0, U64_MAX);
+}
+
+static const struct iommu_ops riscv_iommu_ops = {
+	.owner = THIS_MODULE,
+	.of_xlate = riscv_iommu_of_xlate,
+	.identity_domain = &riscv_iommu_identity_domain,
+	.def_domain_type = riscv_iommu_device_domain_type,
+	.device_group = riscv_iommu_device_group,
+	.probe_device = riscv_iommu_probe_device,
+	.probe_finalize = riscv_iommu_probe_finalize,
+};
+
 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 {
 	u64 ddtp;
@@ -60,6 +122,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 
 void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 {
+	iommu_device_unregister(&iommu->iommu);
 	iommu_device_sysfs_remove(&iommu->iommu);
 }
 
@@ -82,8 +145,14 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	if (WARN(rc, "cannot register sysfs interface\n"))
 		goto err_sysfs;
 
+	rc = iommu_device_register(&iommu->iommu, &riscv_iommu_ops, iommu->dev);
+	if (WARN(rc, "cannot register iommu interface\n"))
+		goto err_iommu;
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
