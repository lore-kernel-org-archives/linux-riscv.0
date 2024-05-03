Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C46DC10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 16:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avpQfhayA1uWbmc9NEUWiWwkaRTXcu8wuTfyoWYgtGA=; b=gDKy4RDsKVqLfL
	0yLztMA0FplR6DEQ/RtMR7ja/qpLUpj/EpllY8qpJko3tCxVJJ2yd+1dw374N34c3mLWJ6oW+fFwE
	zoK6QCnAfpD4UUE0HTwlMvr+XPJxIprPzsgTgXNEkdUUkesqHnauOnsfF2WS2r7sgjHcVHsROnplO
	g1836V7EMVPt1zlyw7k/orugEde6+1MT2zfliK3fdiC6RI+Njv313oY3BiLILTBjclOP1RkL89+UV
	GSI/n1U2f9qKQaQxT6atMTQkPYao16bdxFDkE0wyw1+QIVrrOPk0TpTlagJsAGSIH8v1LT8g4kfnn
	I6dAvyX8sDcE2ty3Uy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vWx-0000000HAZI-2z5V;
	Fri, 03 May 2024 16:13:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vWr-0000000HAUs-424y
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 16:12:59 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f3e3d789cdso6852600b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714752776; x=1715357576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OthrTqg6LXWJRDRi7J+vnyIlyTmVXygveqUsFn3DIAE=;
        b=DIiD8Kd/Yva+LYwKeoJH1rm+GgkNjMez3Ylur/8O97mpwpBGou7hsiuejZFp4F5NiU
         xUaO5NDUyiR+aWp8OL16Od3JPG66bNm3fhFHjyqmUZ4Jx8e9nuRmQUaRs62GR/UnVYeG
         niNNGNg+dvhpphPLma7rXieC1MeN5He5/p0QqywFqIgSZHn0xe+hrjJAaFNIsJ6TJB5R
         p2ZXaWFta61Qgv5GiOWOTadJrSKVxqFW8MRNEURhduXSkz3WuEmBbQTXxwhJhTVM0UZG
         wvp/5VZkxmSsV+iHZtCk38Bv8mhcPSdN8QoCGFRgg/zxLzrMZkrJnMlbbkUyePc35YgA
         BADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714752776; x=1715357576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OthrTqg6LXWJRDRi7J+vnyIlyTmVXygveqUsFn3DIAE=;
        b=h3YAzEXEUOpTXSewEwV9wY0w8io2zmwaj0AbX1i0DkzbvTWks2wX3DTGbcciRrYNT+
         JWEVY9gxwVTVYBSkbUcS+JMz4J/91Jl92O2jEi66WZKYx9/btYH6f6M5PEYl8LBYYmrK
         SLogKLoInb7zhf27o5BoykVpKzwC8UobUfFhPSO4GgAQw51veEewUaRLuNfPHcCig5zY
         b+rRM8F+Y6Hl/QFjiIclciBgj8zSlNWit0dNK6MzhJ4i/8GZZVI3/8myzQuDQNKcPnsp
         0/XEU1ZsEUpOW5ejE5U0QfYI4tgF8TFQhX8l6XMYRRX5t8shO7KhGCvgr2iXQHb/R+Ah
         WKcw==
X-Forwarded-Encrypted: i=1; AJvYcCWXa1wLEs74prQWkMa704KyPAvKjZdfqr5U1eEhE5wLaGVRNgidO5V4mFpFpRBom+A9OqrvjH2nfeq11Y1csiP3fuVj0dpDEYhkU9OMbv3f
X-Gm-Message-State: AOJu0YyggUTJpFRfxhFLtg6jV03hCT2gy6w6gt6BE5KVQnr/fH3U4EIJ
	AHReyAgffIfxnTI0472P6kebrX5wGIH28Tn5JOKVQExzeAomyEPX6xSDkPjPmvg=
X-Google-Smtp-Source: AGHT+IEe9+jERc+PZd1HuCQGuHlYnZgRnt8bq2rrZoOIlZj+FGWtKK0fIlJ9akZituuFwd+i4siSHg==
X-Received: by 2002:a17:902:d4c7:b0:1e5:4f5:7fa7 with SMTP id o7-20020a170902d4c700b001e504f57fa7mr4576771plg.21.1714752776311;
        Fri, 03 May 2024 09:12:56 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902ec8300b001e2086fddecsm3424746plg.139.2024.05.03.09.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 09:12:55 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v4 4/7] iommu/riscv: Enable IOMMU registration and device probe.
Date: Fri,  3 May 2024 09:12:37 -0700
Message-Id: <b28d4fe49c5fe4e3ece9de789cfd92cfa5b3c16c.1714752293.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714752293.git.tjeznach@rivosinc.com>
References: <cover.1714752293.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_091258_052096_0F463604 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Advertise IOMMU device and its core API.
Only minimal implementation for single identity domain type, without
per-group domain protection.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 drivers/iommu/riscv/iommu.c | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 3c5a6b49669d..1f889daffb0e 100644
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
