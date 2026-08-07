Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CB7C2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBShESNXnRd3WkAgaPdxOAfYyIKIJMSA9R9fhQBn1+0=; b=co3B3pynkAavPe
	w8cCZ6YcckgBYefWeyt+qokLmPVKok9SsdciUmhVujHX7jvABFhOBep5+kT1eAGgxu46epzKESTsq
	Wi3jagcEIJqmKJasjsgWmVKQAFJKaMPZz4oI3hSin10kqFK1SV7YfO/iPlLs7j2aEkTgQuph+Gnzc
	PZ16WY4W7YE9miJy/F2n8p2JL3W1Fiz6KR14akZ+P3FU40BHesLmswnoPYtQGku4/S3eEFk5Fcn5k
	Is3stdEXoC1qBU4oKdcWpzkx5U5ZNWr/RO+UuMqeLAMxhvxktrbgk5JbdZM5rIxN1BUh2pSUsBkSu
	LGps15s5WKeJ6o9CqfqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8U-00000008ZKy-3HPo;
	Fri, 07 Aug 2026 18:17:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8S-00000008ZGz-1odj
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOd1X1808535
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TgMmUWGbDaC
	ex8xfPE/JoPkiNGAlDlO6AUBWxsUjN0M=; b=F/PARV62TQBCDxYDY40B5DjDbjL
	1IjCGfCTNzOmJ9Y3b8uEnRLkg5Nm0AvwiUIWiebqaqfPvZbaTFbqvW5bOgRbTrH9
	lX7mqPw4kBQtxyrYB7R1YpLFNsxmRIvdX8d1kl3Ugt8Iu4ggsgaIniZ/zh2vBlXo
	ylOIHUZch5S0FHySHS3fkMlJ6zmk829RQGZhWCh7yF8YCKR067s8beDzQfuPXGLJ
	nfBfXF9XYYYrP+L4K9pGLycJ7p6BVLZ+LPFx0z0qpGULil79CEU1PbTBLoKueHXi
	sHS8PghFZI/Acfuq0YlK/rhNajxU//xLz8J6Z+APYlIfaUgalBgje36upRg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgewh72s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5276aa86d00so36525071cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126655; x=1786731455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgMmUWGbDaCex8xfPE/JoPkiNGAlDlO6AUBWxsUjN0M=;
        b=GDt71D8PsStWJuNvvuteuNzPeKsdxCU2BHRNRgendO0JNBoK0MXoBkOT1t4MZSaohI
         AEgb4gSiqRNyLA3qQcCKbCyCYYvhCer0/G1/iWKXFNRTZr607KBzG/GhniI+RZ4bpEMo
         iKcd/wi9JqQoKEtFg2xYlGm1iw6r8fvAq8qQ31zcBDHn1cEv2VK6dBEhhTAxcLphTJOR
         ncqvHZclsm0og3+aaAGw4c6se6wWTcAnzZVv/AYhLfM2QwkxSgwXB9ogYWyFY2J5mo1O
         +f5K0zvg2n7St4sxFOGozWadm2GFgkQLyTZ2i+WsJz2XXIV/MvXXIuOFuhGxC6HoTzOO
         5oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126655; x=1786731455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgMmUWGbDaCex8xfPE/JoPkiNGAlDlO6AUBWxsUjN0M=;
        b=SDbBdol4qknW4CwLMexshkU+j/XO37dtfPOYasKshk9+hL3lJECDTZgvGB7H5IpVYx
         dt+ve+8WwHsdKRf2cyG+Rh+LUEwnWANdo46u6OlACf7mMEQMj85OpF0BH00+z2P8FeiS
         6fpJUl729uqEEG49bU1KPRlEupMCvHdP1m/nTLiTIClt+d9ekIyftCb2rvDJK/vIOJiv
         41AvLLm87VZyTVtl2UufikjAz1CX5xdxeWTA1jHRxuW7LDOxxOFAOWO9bYnUWbYMluKS
         7kCgV4/HiTLOUhZY3ae9u5eMeSsqwAsPHc8s7SXiLTXc9lyFeXUcsPM36RQ6p9AwV1OX
         2oiw==
X-Gm-Message-State: AOJu0YxIzYLIJopPH38jVZvk9YUTp5lNr7KrGApBFdDLzSOIKqhymdSx
	Ktmuwg5bY38Nkx2aVvnflHH3GgQzEzcJAAewwp2th3LlyzZg68+Fob1jPObmWftBWmurv0sRtpi
	YOb7HgFHNjSVQLNacKeU1Pgz304U5TqHrIaxUkLlZ+XvSTonUch/s8ZZJkMazCxztRaPO01YHFl
	43iX0=
X-Gm-Gg: AR+sD11y5g8fAvAkbrZFSA612LmxhEhUzRwyf/32eFQkgw1vYipSw+lSAF0TtVM3eTE
	+4vUg10BxJ+gunUMu5lzSLaz5HurxDVx3HDLXkBn5T1cKoRn+z0wyCobTOxJMjKx9CPnpu7UlEI
	YJEwK9iXizF2H9+EsX/yaWOXoGsFu34Stbwt8ccoVZrzoKTO1ECPpc4b3vRnC7SRjk01PEprwws
	bbzXGj50nHszX39S/iog6s7MBxkhbIyWtDIQBBOq6Bed4Gxyg6r0Dcu9mvDfjk0WaVv+yRDZIEi
	ciPPYE80hisYchsnCRSQXnztXyT8QlaycF9rnlX2f1wBAUJoqfR2zJpQqimhm0emF5JWIXNypW4
	p/5MFiQeWGwzat3xUtEHmeEKuOsyLZ9I0QsoxNAk=
X-Received: by 2002:ac8:5905:0:b0:51b:efbb:fbf with SMTP id d75a77b69052e-52d209830b2mr33956541cf.18.1786126654806;
        Fri, 07 Aug 2026 11:17:34 -0700 (PDT)
X-Received: by 2002:ac8:5905:0:b0:51b:efbb:fbf with SMTP id d75a77b69052e-52d209830b2mr33955871cf.18.1786126654302;
        Fri, 07 Aug 2026 11:17:34 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a41sm83503666b.5.2026.08.07.11.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:33 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 09/19] iommu/riscv: Publish IOMMU_RESV_SW_MSI region for iommufd MSI remapping
Date: Fri,  7 Aug 2026 20:17:03 +0200
Message-ID: <20260807181713.228535-10-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfXyLMEHb+IOMIf
 ng/ThWQiEj+jcI4BmJ3OgtqHmzUFgeI9Q3Kb8D0bko//eUVc691Gvzmu5PAnoA3FwuXv/TwVcez
 SC23bbPG1QhQp+DRCU5Kl7x3UR4uCQU=
X-Authority-Analysis: v=2.4 cv=N5cZ0W9B c=1 sm=1 tr=0 ts=6a76213f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yKliekd0n2ghiC2AktsA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: R3_afsa-WtKcwt3OuwJJh5Df9BseJs8D
X-Proofpoint-ORIG-GUID: R3_afsa-WtKcwt3OuwJJh5Df9BseJs8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX5CranqtkQ8MN
 Qpt3W0E7KWvjj/fKmjlikVpUUvX7CtCf9y91Muu7gU3+g1r8gPKf+wbONYHYSHvPFMkWgtWHebH
 6Xyzg1u/wd0Oyg8NrI5e6ICkuHdgXaViU3t0wUYipKzp8lczBZfck8aqg2m22xyAThz5yM398m+
 M9f0REZJJneiCfhy8+aD7k86O7HS9pP/6RwEp6aqgl/COQPZXyNJOA84LCmaPe06jS1bPXErrpK
 wFJUUvEPvTlXl7O9ja6Kumk/L9a5kjO6ugKhs0mr9msy+TuLf2XbleLRMDFUxS5iTbYvZG/Z6pw
 hc2R0ycqOs6Cftib9AobanCy2BuWpM6Nsx3+ceW59qhnAiOMY3Sxfgrmn1cK69U1iRdAsDNzK9u
 MuJ2Xa4WN24hZR76MhVFDg57awp5MVp87GNaOXTI5CsTTT5QZzlTULFeFmCN/IP9/PrEcx7Z3+7
 NXf3TK4Isp9TJhI8JCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111736_614496_74FF2657 
X-CRM114-Status: GOOD (  17.18  )
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

iommufd's SW MSI path (iommufd_sw_map_msi) requires an IOMMU_RESV_SW_MSI
reservation region to know the IOVA base (sw_msi_start) for MSI page
mappings. Without it, sw_msi_start stays at PHYS_ADDR_MAX and
iommufd_sw_map_msi silently returns passthrough.

Add a get_resv_regions callback that, when IMSIC-based MSI is in use,
reserves an IOVA range of num_possible_cpus() pages starting at
RISCV_IOMMU_MSI_IOVA_BASE. This is large enough to hold one 4 KiB
IMSIC supervisor page per hart.

RISCV_IOMMU_MSI_IOVA_BASE is set to 128 MiB, matching the ARM SMMU
convention. That value is arbitrary for ARM too; its introducing commit
(f3ebee80b313) calls it an "arbitrary MSI IOVA window", so there is
nothing riscv-specific lost by reusing it here.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 16 ++++++++++++++++
 drivers/iommu/riscv/iommu.c    |  8 ++++++++
 drivers/iommu/riscv/iommu.h    |  5 +++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 5873addf2a1b..1e157faf7bbe 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -117,3 +117,19 @@ int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struc
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
index 27dfd60834ac..106cc8216942 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/pci.h>
 
+#include "../dma-iommu.h"
 #include "../iommu-pages.h"
 #include "iommu-bits.h"
 #include "iommu.h"
@@ -1493,6 +1494,12 @@ static void riscv_iommu_release_device(struct device *dev)
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
@@ -1502,6 +1509,7 @@ static const struct iommu_ops riscv_iommu_ops = {
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
