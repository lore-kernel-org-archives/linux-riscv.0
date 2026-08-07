Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A63C2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5nZKBZX8K+Golbwj4h/N9MujilbpY3v79AuOOeKWMI=; b=cdSoIOYKLOb9Nz
	mn/yLCSHr2W8gS94Be+CJ1FPEaHoJBlfS5zDRLLJStPitzJJfIJwavdyStWKaMWViXmFJUcvQFliS
	ix5iLuCXyQGFa49bXTTbbsN5VpMX8bMxJq5ZiXWW1nlF2PZs96R3cdqcWjyMzCTMBWTn0p9LwbFRp
	szieh4e8+8FXHKU/XBV9ShP+j8Hl4p3wEEwYgbYwBUiNosyCCiHGjjjkrWODCmNWk2CU04dG/rLod
	ey0r58xoViOPEn8Z0En5E0s/SjZSqk67eBhbtB1H8gvB7lqRo6Xu0D11TmsqpgI/Kfra1fNE4Oe3h
	RkxmNJ42jEMGArPVa2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8I-00000008ZBc-2jyT;
	Fri, 07 Aug 2026 18:17:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8G-00000008ZA2-2xph
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GbSdm1825592
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KeYmM5yv2MK
	4UCiDBc1w2bwCqxx0z614RMMGa5CBgiI=; b=GyH/4JugRUtBo93g9QQZKnGW1pd
	WT7ukbymRVd4+4vjjM4yWbJ1jRE/fl8zd0wwxk3pyIe0tr9lp0bwnY2O8sxyO+xK
	Mxz0cz+NmCHlsZnr0A203T1oaQ6JgbJGgewry3QkbL7XFRGe8yQ7I1Qh29ACycs1
	szINdcy+vlUpcqKKd38aFGNjDyUzyzV51o3CcRdnSrmzxuhc16z0SIOFNEB6UyQr
	8KWyB+UoIQkxPjd7iyhmH/JXCHVREcBavrjdARnswPr91nzOtA3dSB2O/uwZMSvt
	x7UNixOBoDivfUQqo1vKf7vb9f8E9+scrTMLcw1y0bVGJDB+WB0DZLb8HtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwk21geyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52cd0374265so60720831cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126643; x=1786731443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeYmM5yv2MK4UCiDBc1w2bwCqxx0z614RMMGa5CBgiI=;
        b=H2zFwAvTcVOepQ76YzIIYd+tijOhAQVhWeQxaeCrHjY0suUO+sQl7UR9bhjmOywgVU
         u+YKlhvDO+0zj4BjtEm8qYJhWy1dZQt3p50I8bjeNcX/WBHV8sR/TyduF7X8nRPcm2bm
         cWIUOGJsrDtPVs0g3DGaFyRFmxMIBgaeptRa4IrjyVR9wWPshIRIKfbhaVxHcdf2vBqi
         zd4eDluoBhp39ixEG8h2NQIm41v/1HMsD0VCehuw9hFGRakD3qxN2K7YXrzGiWjUnLzx
         80O+lZ7I/nfd1OWXAnor9JbfmRtBO3BL/gwwCaV9uAK9pMVS5IuE+lUSUtmy/NM2bxMc
         nljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126643; x=1786731443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KeYmM5yv2MK4UCiDBc1w2bwCqxx0z614RMMGa5CBgiI=;
        b=FidMhH7RhL95v/r/WCaGWlzK5bOp9iA+XwdyUBEl10lyXEbNDbimnhB+nEVwrRfDoQ
         jynGvRXuugL8PoNf6kf84CpBHlD0AMwo4xYbcBl1xST2HM1u/167pEEn46SwNfLcGC+P
         AP3/5HQVwjwPStGfZUonCPMjVUvtGI1vgxkRjX37CB9x3NiEnEHz9IZmk69MZfJYc5/a
         0esdcT4lP2GuJkUcqvyFvscIOpscMkXBnKjIc+/ARZ350q7bsjOKrGDZIShvIoqWoXRz
         0Tyt+g8zMSl10rBzrCyCMq1IyGFzEL3+UvwuEGVC7JJJQq+TYNaDLBNDqXKdCgYussDo
         8Ptg==
X-Gm-Message-State: AOJu0YxlsmGxj0RI0YV9P4XErtsq/jvUbbVIbGhmm48uL41ew96TvEJ2
	DMR9GGvvDcU64yCnoIBNrjOzZ/wlEGitZZeuMTyBUABWeh0k6v2TDqX92s1eJYpgnJ1rh2MROgy
	ec+SozlMVPX9avA94bxj3rtbv7/moEeWuPriUtHcNVkBfpgpOXBuf3QrH61LSAFBFQfdkZGEM5T
	07ZT4=
X-Gm-Gg: AR+sD10jdJnqIXV4vqPNUOxbZWoNLeM59ZylOihSaA9Mis5gvyyAJYlRZg0+1JNQKrU
	1T2FkFtw2yA8xxMdX5DgkUb81VCVIJj6JFqUirx4IeI0TlWQL69h3tWmCOYzWZ/aDedGO0gY97e
	+qsuQxODgvC+vK0LyFvwly/gqcemwbWsmrO1B1vgibg1goUb3i6DaGfYRk3NiHr4Bpsjac4wQDk
	oRBo3XJCsQTuYPVUC/8kDH6arLEaXZ7Y/pjVVyLzWqpXL/4FWZttPuljqPCSEBvDxy3/wWUGJ8h
	qhYXmFh5mbbIT3t74HYnwGlS6ROeoBYBLB4ub7pIYDg3r/ot34nRgasOSnAq2l+sMEKS5l8Oi79
	AyApNk9lAuMlJ/pi2X7NLKuuWIxMR72fhvJ2nzDE=
X-Received: by 2002:a05:622a:58c4:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d20a50c50mr36798521cf.33.1786126642917;
        Fri, 07 Aug 2026 11:17:22 -0700 (PDT)
X-Received: by 2002:a05:622a:58c4:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d20a50c50mr36797611cf.33.1786126642443;
        Fri, 07 Aug 2026 11:17:22 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080ab446bsm79425666b.27.2026.08.07.11.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:21 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 03/19] iommu/dma: Add iommu_dma_sw_map_msi()
Date: Fri,  7 Aug 2026 20:16:57 +0200
Message-ID: <20260807181713.228535-4-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: HCdz1XSrQ7f5xLMFIFJHzcmcsI-QBs_I
X-Proofpoint-GUID: HCdz1XSrQ7f5xLMFIFJHzcmcsI-QBs_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX010Q9ylysE0C
 kIhCihpuBTab2jt7Ccg0uPSjiPsX1LKU1fnUdvHE8fe/kMEC7yS+pwjtWYE4sdqMtH58s9CcHXy
 +rTWNLSSCP5WCN0fSULqPfUFkhdiC6f9uGWfTdRPvNb2UzghGzW0mMu+AXSMKCeb+fDXeDF3yLe
 c6sYSMv0c/C94g336b/ERXK2Pb5RSQyALVVbj3c/GkZ4s1YFnA/crxoEGjj3x3T1HTOfa1Sq629
 0Ux6BXoK7nmSIoAoFm/McUW966vGz3qy70EOffyb+6x8V90k+gM/oIPYL2AGySZ2V27MvZcXkxi
 0LjNpZFdRZ7OtaiXHbR0ZFQToa3D63elTNhFCr44SfuxYCtc8CiBzzHwTBG+5INDAOYABpXrI4+
 BYyUMLMmVg249p1MN3lc0qWR/P4i6lSm+Cj/A2EP9IXDhHnlmwF3/QL8chBM8J3GlT8jkNhmGXD
 p1QmLS10Mjnj7WIDF7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX2wy6kYBbNdb+
 Kz6WAXbDeCZuSDRtYTKuUb7LTZrQZ9uyLuYVhBFBtTAeLAS2pF2S4P9a6AE3FZe/hd71UJUxACx
 n+14kdyDiO+y+IPnf48/pW5d8YLblts=
X-Authority-Analysis: v=2.4 cv=YJevDxGx c=1 sm=1 tr=0 ts=6a762133 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=B9hF7e9JpKM1iJhnVVUA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111724_862972_CB12C0D9 
X-CRM114-Status: GOOD (  18.88  )
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

Add a descriptor-free counterpart to iommu_dma_sw_msi(). The existing
function is tied to a struct msi_desc and stores the result in the
descriptor. This variant returns the IOVA directly so callers can
pre-map MSI targets before any descriptor has been allocated.

Callers may pass a required mapping size so MSI doorbells that must
not share a larger IOMMU leaf, such as RISC-V IMSIC files, can fail
before a mapping is installed.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c | 48 ++++++++++++++++++++++++++++++++-------
 drivers/iommu/dma-iommu.h | 12 ++++++++++
 2 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 9abaec0703ef..56a5072b4dde 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2234,24 +2234,56 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	return NULL;
 }
 
-int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		     phys_addr_t msi_addr)
+/*
+ * Descriptor-free counterpart to iommu_dma_sw_msi(). Maps an MSI physical
+ * page into the domain and returns the IOVA and mapping granule. Used for
+ * pre-mapping MSI targets before any MSI descriptor has been set.
+ *
+ * The caller must pass a device attached to @domain and hold @dev's IOMMU
+ * group mutex. If @required_size is non-zero then it must exactly match the
+ * domain's MSI mapping granule. @msi_iova and @msi_shift must be non-NULL.
+ */
+int iommu_dma_sw_map_msi(struct iommu_domain *domain,
+			 struct device *dev, phys_addr_t msi_addr,
+			 size_t required_size, dma_addr_t *msi_iova,
+			 unsigned int *msi_shift)
 {
-	struct device *dev = msi_desc_to_dev(desc);
 	const struct iommu_dma_msi_page *msi_page;
+	size_t size;
 
-	if (!has_msi_cookie(domain)) {
-		msi_desc_set_iommu_msi_iova(desc, 0, 0);
+	*msi_iova = 0;
+	*msi_shift = 0;
+
+	if (!has_msi_cookie(domain))
 		return 0;
-	}
+
+	size = cookie_msi_granule(domain);
+	if (required_size && size != required_size)
+		return -EOPNOTSUPP;
 
 	iommu_group_mutex_assert(dev);
 	msi_page = iommu_dma_get_msi_page(dev, msi_addr, domain);
 	if (!msi_page)
 		return -ENOMEM;
 
-	msi_desc_set_iommu_msi_iova(desc, msi_page->iova,
-				    ilog2(cookie_msi_granule(domain)));
+	*msi_iova = msi_page->iova;
+	*msi_shift = ilog2(size);
+	return 0;
+}
+
+int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
+		     phys_addr_t msi_addr)
+{
+	struct device *dev = msi_desc_to_dev(desc);
+	dma_addr_t msi_iova;
+	unsigned int msi_shift;
+	int ret;
+
+	ret = iommu_dma_sw_map_msi(domain, dev, msi_addr, 0, &msi_iova, &msi_shift);
+	if (ret)
+		return ret;
+
+	msi_desc_set_iommu_msi_iova(desc, msi_iova, msi_shift);
 	return 0;
 }
 
diff --git a/drivers/iommu/dma-iommu.h b/drivers/iommu/dma-iommu.h
index 040d00252563..3e1adeafdcac 100644
--- a/drivers/iommu/dma-iommu.h
+++ b/drivers/iommu/dma-iommu.h
@@ -19,6 +19,10 @@ int iommu_dma_init_fq(struct iommu_domain *domain);
 
 void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
 
+int iommu_dma_sw_map_msi(struct iommu_domain *domain,
+			 struct device *dev, phys_addr_t msi_addr,
+			 size_t required_size, dma_addr_t *msi_iova,
+			 unsigned int *msi_shift);
 int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 		     phys_addr_t msi_addr);
 
@@ -53,6 +57,14 @@ static inline void iommu_dma_get_resv_regions(struct device *dev, struct list_he
 {
 }
 
+static inline int iommu_dma_sw_map_msi(struct iommu_domain *domain,
+				       struct device *dev, phys_addr_t msi_addr,
+				       size_t required_size, dma_addr_t *msi_iova,
+				       unsigned int *msi_shift)
+{
+	return -ENODEV;
+}
+
 static inline int iommu_dma_sw_msi(struct iommu_domain *domain,
 				   struct msi_desc *desc, phys_addr_t msi_addr)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
