Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8D4C5DF8F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzI9qsPN1eNK4ObtSGL0yr49sGQM/QCOY+LfivucNVA=; b=l7mDa+S9ViU0LP
	oDX6/kvjN2ojst+Cgk3MHU+qv8jA6fSqwl+9g9aRJgtjic5VRNQyXFzuPwARMJktfIwrdeMqNXM+L
	SYzGtmkSlFb+mXgRMstJvr2PHQBIG6foNzWTd/XECM07/rYQArhuDTARZ/DS56mzSrTEy5EGARAPC
	Q2IS8dYuuqFMH67eInkfx9rZgQtEm/LhVuEvnrpHGkFpHXHr9QDOb3+3nspbrlonShJyloX0/nIG6
	NZ7gLsLjI03N53pj+O9sYzOgY0k+eKRTgSpYUMksJFhXxsMm/4mrONA3Coc70cImQzr+Aoj0ITyUG
	ArKURUCsvd/1VdBkjj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWU-0000000CDcN-2etg;
	Thu, 20 Aug 2026 21:42:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWP-0000000CDZo-0wBj
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7RHm1298358
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+m1BHDhHK9T
	Y2fxWAkv5d/udjXarPp2DOE+7KtvToDU=; b=bndIb7HQYHDGpUUyyq6mwwz72Iv
	6cu2le0Sl7jvB7UpNryAj3+yX5zOjE2C9CdA4tjAcPhFpg+UulXaLI8x9G3ue7Wu
	lUwf5y8uxtvs6iIquyS9+9ik557SfXj5sX9e8ynTwjxgx00xlQfJil1mDF3hpenr
	Swnd4zNBAj1gY7jX/T9qV51e6Tet6uH/2zmXQGAmT4uTig3fVdwAFPvh0xByv7+i
	hA+Ue2kQ3sF0xUVsmsB76GwMZJpuh1A2ib8o2kCSLvlbYljQBr1WBhIWiApiVa8b
	Qi6CKYogIfsBUnfJoXRGVPr8MVEWbCO/LIPeXzDduzBz7zi0iRiEiuEp5jA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn8btb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so30194285a.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262119; x=1787866919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+m1BHDhHK9TY2fxWAkv5d/udjXarPp2DOE+7KtvToDU=;
        b=VBuhrjhcKfNwumX+BbRaMaPU21bvvDDbNk9GYuA52ygHZlIRo15a3hoCcPh//58tzX
         1rFZ4HW3OZWQOV1omH1o38KG5Yzl1hknhIoBTJla2AvtIxm2WiYE/sCpsFXaH+eTXFMt
         oPD1P/ADPVYlDuQT3qGEwtX/6/xVEKQGBNTDlx65LcfG+XePHSbNKfnjsB9HKA6Pf6JY
         KIWPS6uSB6D3zWgArLPdJzCBLFh8w+hnzatVF/xGsUUcBHw/quMNKbIMvL5ZGtCcMKoH
         Rjwrq/AedB5o18qg4lAV56RBQHN11Tb4XB51L3EgswfstcWjGmUXK/nTtUKJuJ0oCY95
         E2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262119; x=1787866919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+m1BHDhHK9TY2fxWAkv5d/udjXarPp2DOE+7KtvToDU=;
        b=IwHxigWvNzaR1MW3vLTAd0IvOzTbTS1hV4dtPYSLHcCZMuXX+9yEy0Uqy90pKQJSbE
         FZp0rJlu42eFUCv1tXSs6F9upMZsBiy+1Z3Cl78THGj9BKcygTkwXO2eluZz3xIqrKw0
         1Jo5PF6WPX3EbxxKUynTu99jgLHNVJi90IrBoTPR0wk8JQCah1pj7wLwqiqFzspvUotK
         s8wwkpv6JQ+N9UeQuTuiHU5PZU0pU24z48wu7qC7jSYDXx7ms+p/sueOo0uMq4HQdZtu
         tmvtIHdnDM+sEli/wueY3jW28FoYBRhg2ZqMa8sFxWc/0Sqn3hL9wH+2uD9KZRbgpXa3
         /YJQ==
X-Gm-Message-State: AOJu0Yy1sIqCVBUN/SiFgZOF04KKuqxbmIxyq2ZbYkxZa4pDhukkEchs
	ezh4Y6Wsh32pdDBQ+Ma9igDH3m7frVdG/zoNsgUp/Si5hERrMt/lSWhWtBP10zIUHFQscRP+8ZZ
	VwVrVsjPVS/X6KODpAtYrlgr0NwLufegoL15PmEfZCMNx3X/C1fwWYEGdDTEm267HZzkb2vMopf
	guwP4=
X-Gm-Gg: AR+sD13L6GxW1vqPiLCz33IXwDExa+S6gLlVuaKI6+9gt7RKAxeYxCdiZpEyJ8xUiLi
	6NdsCvRgPIhs0sceUWqeCEQ1DaL0Y3LzMbbjc3T+vxInCCkxq1BcML3cQ4h0deTDRgcFJnVNLa5
	+4yJCVHi/IBLvZuL2UOOP9gi9ifgR2FZ1xGdhJyYD3iX8Sv4j20KNkyRgtkWq2BqyRyNB6ISi24
	ZKtsYsvI4w2x0icE08omQqZGvb0/nHmAvc2YGEez+/fWssR3sGoXoshYq4wfG4r9IeJWsZSVmCk
	n9zfy4zuIOEIZmUxQOSIp9UmjT6XDvBUH2TqOuMH8bjNJbbcLJwukLJyd1fFHNdxCq+mAnd0SQI
	XH1SZy7zu
X-Received: by 2002:a05:620a:63c8:b0:937:17f9:da2 with SMTP id af79cd13be357-937283b5de9mr979111585a.6.1787262119606;
        Thu, 20 Aug 2026 14:41:59 -0700 (PDT)
X-Received: by 2002:a05:620a:63c8:b0:937:17f9:da2 with SMTP id af79cd13be357-937283b5de9mr979108785a.6.1787262119202;
        Thu, 20 Aug 2026 14:41:59 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm13092981f8f.26.2026.08.20.14.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:41:57 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 03/21] iommu/dma: Add iommu_dma_sw_map_msi()
Date: Thu, 20 Aug 2026 23:41:32 +0200
Message-ID: <20260820214150.545737-4-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX3WrawaMQtVt5
 e8KiL41Ik5ZTX2yXCz46CDTZRKEzvuP4N+/tsQUydmy7p4Oe15JVp2WgSLpsP7F4TCTM+ZL31+J
 ghpo90Uj/ZSWAztHQS6WtOyISI8lbnUT6XSueA4G6knXQrDLGEp84Us1s3dASInL1ekJmJVd9ta
 xG76QVU9aG1l3Iz9z+Rts9Hyum/Ne1Osy1D+G7NQuIj3Zz0j6BxH/+sZ7WQrhlz/jQVIZAIHai7
 Q9vSSF323VGXvgMAEMoST5b5CKFn7m1J+CfF8jXLwFHdXlnwkPy0c4scWLeWn9kOpDhhiAefFhC
 M0dXbk+W/TR/oLttG/QD+WMeRRkibcMeyVkkAn7RBPCSnXSrrJ7pJ+GYU+ZB1U/ZpI9b1EXQsyP
 jfUCrN//wmjWTh7S2S0jRm8w+hrtsMYJYjmuaCxOpguVCJAyiz/1pwQDvt1vROzfeevU4gXGdYx
 AtZf3pK2awQfQ/NYXBw==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a8774a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=B9hF7e9JpKM1iJhnVVUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXwoRTb77W+Nza
 iYPJVBzYRyVAWtFYqRWPxGDi6mlaOObGGbzbsDY1/r4lt/0IZrlmVnFCti0iLApjIv3w4UW7iP6
 aEmHkpGtvFyEIRYGrgafNa00kPV19Jw=
X-Proofpoint-ORIG-GUID: 8pUPGfL1iL4i2GcBxw1tl1mnNOXBb3KI
X-Proofpoint-GUID: 8pUPGfL1iL4i2GcBxw1tl1mnNOXBb3KI
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
X-CRM114-CacheID: sfid-20260820_144202_803103_CCB63860 
X-CRM114-Status: GOOD (  19.17  )
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
index 9a07eb39336e..3ce9f4878d92 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2247,24 +2247,56 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
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
