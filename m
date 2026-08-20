Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606F2C5DF8E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2wcDFF2YujkwDMrpgZBVTDBTayhR3qMmRkDlJfiwqE=; b=wxCZvrs57x2M6F
	RuGtBTg8OyETBTrDgVGctU/LWVhmTNPkg5E7RppuBK0m2z3+qJ1hjCDv8jfUhOOFytcdFF8eEb3Q5
	Fn9SA2VdLpe1420HCR8IrGq4LwBDmt3yQzxsqBcrVGhTQ+O+8X+7qMUycHu03BfL1ByFzc3vn88zE
	goKlZ1YoRGnP6Xhovx072UqOHnTEzpEtHBTGFREkEILgLVUeQpia7gQ9ST51zoU8L0arzn0B8qHwf
	vnKUVvYLoN+cP0Jy+SF8UPqN4xGXzh4Id3CquJet7Syq22y1RK1FCpgILUAyhRjuhfQLkFzH8wJ8S
	8Ho3gVUuYyFUCvy4H1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWi-0000000CDrc-3GlS;
	Thu, 20 Aug 2026 21:42:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWe-0000000CDlU-2zNG
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7R7U1298366
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v+W5Am3bcCm
	JTpwvkJ3womLHwYPQWXVtn7goz0M95P8=; b=inZUlJJ/PibQYY8ge3i2QBPul4d
	pGlngLpBBEXRRFE9tl//RSQ/xIOAMXp4PzUF6IJjvLv1Mp3ALosH0aoMtdma/bsQ
	Pz3r+ETrNHhAf4wLsW61Q0auN6+zfW1pkpFRQ25A3Ux3ueutkMZRZ2NIBuoIpsv/
	yQ56oeeHtV8pWjsv5swn52Es7AwUVpj9mAsur3M4ZhksN332rA5RNTQDnW3Hv98B
	mAvE3yzqVvMq+htpfWvAOWTjGukeuG4ITROTPghSUDyXIzVduZk97jAJvGe9Wq+1
	qpsUHMH/VdVX7mAlq7IZiZoTO9oMDr3PZcNHP3jotgINs7KSRGBgyE4uCbQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn8btby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-907a1e04111so3655406d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262135; x=1787866935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+W5Am3bcCmJTpwvkJ3womLHwYPQWXVtn7goz0M95P8=;
        b=Reh9+BmwPZRjUAvpYg4ep8ziX9zlxTQZ4nEuPiJPMSTaH+yO2VwIRh8rGrw3WxaYB+
         XNfORE5d1YN/rLrPQFKLlJhRs9YtaHh/7QzaQoDd/9ggrwOY4dh5bCxSZx2UnphMT01E
         Inljs/glokan4z1qdK1P8F8k4SfJERH25iz0lui4HVXam4bM9jFZtb8ASDmwth0n4juq
         4PX0Rp2S7db4oGGzroBfswZKMDzpgJ58MM1y7WxxsXMsi0QN+PkVEqoPQInMLKgsSgnr
         AAEgjjv4RZ5IOLikFJR/YtcdMR8wZW5R4mBoN0V/FA346JAGngUIgL4LxUT/YfjMXX2w
         i31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262135; x=1787866935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+W5Am3bcCmJTpwvkJ3womLHwYPQWXVtn7goz0M95P8=;
        b=sIGkmU8YDU31MI4yUBh+8eSzuq/cFLZbstaSTsfJsIjbY3AjMVy7JV3uDbDZ2mhMp6
         S7dbKyjuq60jFsoyZBFOmYSzup3unL+4L54Epse3D0RoLtVVv6RjQc+aIF+FQ9BMqlIP
         QYhasAQZ6r5h4ftxjHpIyKEw4433YuGcu9Tn8NzXJDX8nF664r7bIkglktwbwD01peip
         YVzWrOnTo2E/aolMBl4fiAj5A8lawcxXssfd8M+sizHqOCxCV3yqYDeUMvMml07ihv6S
         7FMP4zxBtzoFK9iKJPpQxaA6Eir+CrLt2VNRU1sL09RHhTrtOYSqp9xmtK9RLJbnLKiD
         KGRw==
X-Gm-Message-State: AOJu0YzQf41JQBWxoiuXyEaUSN30fl6ulrjEU7QjCR6vtkFqsJyQSiVq
	rTbpYLE+RC9sCWhbRtYzFkdGT1W7pjmRFOlpWcHQV24xRvXNGhvmoPUfHH8+cyovrvOaK6v4E01
	5XKQNpUUYXEc5pFUuJq+QOpj5mATbd3FlyiBM50+5PGYONVzI6lJtfOmmuuNQTEqu88fZuIFgNM
	Frnkg=
X-Gm-Gg: AR+sD12IuRbirEHmaOQZUR2VZxsWsGaejDpmYyFXueZ9/jATOzlveNSX4r2QGMXEPtT
	Ky9i82anceLlHY4iXtkRYDgqX0KdWBAR75v0/UYI8mrc4U0chRpLxoKZ/k2gqk86+V9yrP4IQq4
	A7jEH/WIrlSlAL6JBfZjhvHL9Y48Dug+pSxXRh5WAuCI59Je5X8d2VIL5d4mR80XxPCEqGXkYM5
	wGyBGa4p/ASZ8VAVfTJqCSC+QTDXrshTfkKFiU/xfGZnKffb3xHjTlhJf5agrpUS40CJZ50GNR6
	RFk0Sfv/6lVaChtKOUAIGvjeVJMbOaN6GIQdSwLfR+UJORT+ThGFT904gk43MU+9vmRUbFlxKx/
	QXSNdmy2A
X-Received: by 2002:a05:622a:349:b0:52b:71dd:c930 with SMTP id d75a77b69052e-52df5a3b63emr13938671cf.38.1787262135266;
        Thu, 20 Aug 2026 14:42:15 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:52b:71dd:c930 with SMTP id d75a77b69052e-52df5a3b63emr13938181cf.38.1787262134877;
        Thu, 20 Aug 2026 14:42:14 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9b79b8bsm425815e9.4.2026.08.20.14.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:13 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 11/21] iommu/riscv: Reserve an MSI IOVA window for iommufd
Date: Thu, 20 Aug 2026 23:41:40 +0200
Message-ID: <20260820214150.545737-12-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX0EMQ244NZcbN
 Vei2RrsZnhh5FXJUZ1Rt57EEnds4cuHhD4mWx+MujcZYtu3stQxTWxdjgP0iO40OYE88S7ZqHap
 uCmWKBuuh5sziLklxXO/PkUn6g88lovXaTE2i5tyPxI0NH1S01uEr6OOb8/kCl4dUUGAQWSyeJo
 a1O/lY+j2mtjEXTr/RME+P++woKPmOQGgnY1aABsJBkpAHVyZmwEn5bewHD20acQ3CulLIS/1g4
 tlhDVTTi+UGbrKNPWs382F54iK3zs25bhcPQO2oF9zjnSh4Y7R2Lo/vwKwrm9vcZW0/+fk2uu1G
 kKaPOZkOGLZzzpyPha57cd5HXnyxwd0Ro4Erf4n+vNOrwClfei0l452tZeeurDT3IL4aGo/KyiO
 Z0IGam1JT5Z9p20N038QeKIH/WdmLMKU6yv76zTJeAtU+vFKuDc4rCDZ6S97a/Cvu78ZTjtU2Jy
 wYNccta0+XA/DPisMjg==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a8774b8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=DeYf1S9hlmi_p6CgitoA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXz2rwkup/qv0R
 LgITPuCfdT44AVbWpzcU1yEZN187CQ9i9awWxXHsF/TLm+eproLGCCSNu/akO4T5wUryLJxcbVt
 fpl7ELF/7MM1ie6ykP3epye8VclX0Jw=
X-Proofpoint-ORIG-GUID: zAYxt65E-aZ9o4qQg32fkCM4Gon9IBvc
X-Proofpoint-GUID: zAYxt65E-aZ9o4qQg32fkCM4Gon9IBvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144216_772053_458FD5DC 
X-CRM114-Status: GOOD (  16.33  )
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

iommufd requires an IOMMU_RESV_SW_MSI region to allocate stable IOVAs
for MSI targets. Advertise such a region when the device uses an IMSIC
MSI hierarchy so interrupt remapping can map IMSIC pages instead of
falling back to physical addresses.

Reserve one page per possible CPU, sufficient for each supervisor IMSIC
page. Place the window at 128 MiB, matching the established ARM SMMU MSI
IOVA convention rather than introducing an architecture-specific choice.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 16 ++++++++++++++++
 drivers/iommu/riscv/iommu.c    |  8 ++++++++
 drivers/iommu/riscv/iommu.h    |  5 +++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 3e08249015cd..de5e22ecbd63 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -140,3 +140,19 @@ int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struc
 void riscv_iommu_ir_free_paging_domain(struct iommu_domain *iommu_domain)
 {
 }
+
+void riscv_iommu_ir_get_resv_regions(struct device *dev, struct list_head *head)
+{
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct iommu_resv_region *region;
+
+	if (!info || !info->irqdomain)
+		return;
+
+	region = iommu_alloc_resv_region(RISCV_IOMMU_MSI_IOVA_BASE,
+					 (size_t)num_possible_cpus() * PAGE_SIZE,
+					 IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO,
+					 IOMMU_RESV_SW_MSI, GFP_KERNEL);
+	if (region)
+		list_add_tail(&region->list, head);
+}
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 4e14c8412abc..049ca1852d7b 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/pci.h>
 
+#include "../dma-iommu.h"
 #include "../iommu-pages.h"
 #include "iommu-bits.h"
 #include "iommu.h"
@@ -1497,6 +1498,12 @@ static void riscv_iommu_release_device(struct device *dev)
 	kfree_rcu_mightsleep(info);
 }
 
+static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *head)
+{
+	riscv_iommu_ir_get_resv_regions(dev, head);
+	iommu_dma_get_resv_regions(dev, head);
+}
+
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
 	.identity_domain = &riscv_iommu_identity_domain,
@@ -1506,6 +1513,7 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
 	.release_device	= riscv_iommu_release_device,
+	.get_resv_regions = riscv_iommu_get_resv_regions,
 };
 
 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index ded18aec8010..16b3c9c4cf8c 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -16,10 +16,14 @@
 #include <linux/iopoll.h>
 #include <linux/irqdomain.h>
 #include <linux/rcupdate.h>
+#include <linux/sizes.h>
 #include <linux/generic_pt/iommu.h>
 
 #include "iommu-bits.h"
 
+/* IOVA base for the SW MSI reservation; same convention as ARM SMMU. */
+#define RISCV_IOMMU_MSI_IOVA_BASE	SZ_128M
+
 /* This struct contains protection domain specific IOMMU driver data. */
 struct riscv_iommu_domain {
 	union {
@@ -93,6 +97,7 @@ void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_inf
 int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struct device *dev,
 					struct iommu_domain *old);
 void riscv_iommu_ir_free_paging_domain(struct iommu_domain *iommu_domain);
+void riscv_iommu_ir_get_resv_regions(struct device *dev, struct list_head *head);
 
 #define riscv_iommu_readl(iommu, addr) \
 	readl_relaxed((iommu)->reg + (addr))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
