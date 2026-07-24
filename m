Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493B4C531FA
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kupyt8+rpu6snKkbs+28cK93OFHh3CGIV0yHvmjvMYM=; b=et/YHI5PfBtEV4
	niwzmVIuzGp2pbSsndQCIzQy2gEdQra46qOjdB3LUwzYZwksYB2QHZiCoouI8giBN58dih53wsu8K
	mUJ7ps9eFVTHJ+/OYLe6QmBgAxUJ2ztJ7UWMs9iMv4Ab/+m/6PvU+gmdjWCDth/DpZTPtKmzJLD1H
	ntsq2UV1PL9pLpLNqvdDd3/oOk1+v+duw5KGmMPEsPeTkyvehhY15bCSu6l38DfLaXkrVvE0GaFTG
	fgtxKtxl/7GWBv4bcD/vTtvEAZ89pr84bynetAyaIjHyr0thYle5QvX75jesOc3vsv25vsXQ9IvPY
	2YFZzf+KqUlJLN8LOTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZh-0000000Gf0V-0tw1;
	Fri, 24 Jul 2026 15:12:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZd-0000000Gewi-0SSU
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OEHTII3467891
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eAh9a7Wj9Iv
	1rj7/bqx43VqNRAg9bHo23nmovr6/atI=; b=M0/umBr4Lh9U0ZgCved7lsconRx
	3WeyhuIWA47ojp+HKdfbumBW2f/SQ2sq0D9PsVv3lamRRpVEcSjPMATTW1v0lywB
	s+rf+5H2WrR9TwK/lZHITu9NoSWMvwxwf/n51tmYsgsoXaUwkjiGaM35AxOR91sn
	/F2060KSn4y/JnIBnRB9gxYlNhfOfGWkRBY0mcvwnM5BeadXvdO8+AxlU/vK6Dtk
	OOC0BWykh0Xc8MtCGznphkCIwHYQE2pdFIKU8lk+qZZu6JvNqJH2VjDYkFQC6SKI
	43KL6clRZearYsSB8PRkbQpaPAskHpU2oSk1DHYg1gmQyyyKHBtlYqmskdQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm9pd0741-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-907b38aaad2so10520786d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905947; x=1785510747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAh9a7Wj9Iv1rj7/bqx43VqNRAg9bHo23nmovr6/atI=;
        b=SbJ0BhE/zqm5AUGCRN8ySVg8cpAcka3QDqmruiM2UAzji4/bO965NrxAwmUa87WNw1
         wgbNe7YfOUEubtDsU1MHvtDtP4OvHXH4W8NqMbpOU5P8MtDrqqLmVbr1zxk7GaKGszvF
         UjcCHaQ76oqqClWfEooCl2I4DJS05euqHNRBzhQjMtgrCXMgMjdxuPc5gMg5jc3lJGG+
         0WRyGYmvgro3lEDWII1PtV/rxaP8KKpN8DwSBDeyFUQa30Fwl9fzBp9Cm14In7UGKB8u
         Fwi339zYiLDl61/DfGrud4c+oECe/PYOv47p8tI5qe6JzVGCFobu7KpqiyhqJ4B9Fjw2
         jIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905947; x=1785510747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eAh9a7Wj9Iv1rj7/bqx43VqNRAg9bHo23nmovr6/atI=;
        b=nIYG5JmfGnj69NQ7XXBTTGtef0jmq9v5GnVWz8th5sCmZqMXKWZ/vDntVLrUUabAIp
         V14bkjUQxKntK+uwf9qJpxpNVmpezL3DF4R2JhUtlkvmo/8YY5j1HkNDdCBOW8B/aALX
         uBBbW4kiceDmORY1BU1DciSzdOKtSWUll9j9dTbLD8VpmxKP0XHX0OvZ4EHrAbfTMj1l
         q3KD0Gxn+uqEAwC30nZ/MfAgiy5qQCXZvLmVcTUszNEOtI/Di62v23Nhll1xn99a0zzw
         ZNp71sgVLxNRaXDRBdKHE8pAb+yNQngodnrZgeAE6QCg58NIVRTlLVsfmlhZopXhNVyQ
         XVAw==
X-Gm-Message-State: AOJu0Yx3ejAPNYnMBkbVr8hs1WamqKbduHhdwS7tZqQVHXyVBWbI4qDv
	tUDLmholAcbsItpb9fwPQufPC/BZ3xEMMFP8O1mxoJZ7UvDkkxfjuaqJo1/ieroZar9tN7x9HOB
	wP3KxCpSK3xgZJFsjs+CKuCjnVR4E+VN2Vvc1Na10NQO/3bXozgdrfcVzmiTWwr4HjZdSTO4kmd
	MxsFs=
X-Gm-Gg: AR+sD12NydYooxy/q+E+pkwIb0mvNe3M1dwaM0UYg9v1Kw5wAEeqbRpma6qXDxRHq3h
	Pd2kQiVLDhmJCweZay0yMWCvk2hTMN+qMvDkDbkrZMtUdVys8T3UyejwoH7PzGdrMGKYutyH5Uj
	wwxp998Vu2Qmv0+WPW6MPWQaFLeiFwT1aVnAOQGxFDAqiuDBSgcx6cY2yaTABheaG7LFvGEqPGo
	MSeInXeXt0WxYP0WHXKA2bqn9fyY3rUC/OMyOCkUvHv5n0ldmwK3jFOwnqkFJkZz6JVwuFhbn4H
	RUbzh09fJ99OVrvV1VsRDjTSilX9tcBHYwGvk8+wv/5khetPGlSRFZpbjM0OcWDzswYqGpaKa7x
	utqos5f8R1sSvdpjrmDq+WzzmfDxd+fNe2Hwc
X-Received: by 2002:ac8:7f41:0:b0:528:320b:305e with SMTP id d75a77b69052e-5283de316f9mr72395101cf.35.1784905947304;
        Fri, 24 Jul 2026 08:12:27 -0700 (PDT)
X-Received: by 2002:ac8:7f41:0:b0:528:320b:305e with SMTP id d75a77b69052e-5283de316f9mr72394751cf.35.1784905946785;
        Fri, 24 Jul 2026 08:12:26 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5958ea0sm88142a12.31.2026.07.24.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:25 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 03/14] iommu/dma: Add iommu_dma_sw_map_msi()
Date: Fri, 24 Jul 2026 17:12:07 +0200
Message-ID: <20260724151218.965929-4-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: zRZk-SfM9EQKJ2NuzNCFJvjmY2LgbNhk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX1F+KKNkRG4uH
 o3v1o2Pr94lRmDkVb81nLWLpZ4Ao0hzzY1bUOrCzjDZNTuGpjxiZlP7VyooE9njcZeN/L7hc3gI
 68vrZ/a2eh7GOu3vSXQArQh8pPjHjAdl5FsZwfR2iq3cVbPOfmkxvcJzWTzws4GAmSi9BBEd3U6
 pyAZtBIMe2/hP2L3yuU0TFVirwmhsQEozGm5duDL/OArFJZLL+0ONE74jBPTwb5sBsQmp877SPX
 Nt36NRcZLv0fajeBUsYt/0t9AMEQ3R3DQ/vj3tzjMYMupMiambmJEkWoet7pjNCnNyICfMdrCwj
 lWNrzNWEFFYeYjVCUja6XRWV1QG/iZcLTkzLs4d+2CMm2dYg2JRX8Ej3N5dX9uMDutoz+jSMZzk
 8uxDgXc6Hi1RFpR/P0zYW966mBgRf99d+cfSmyTvsGbGS3B6dCYV7MH++zCoUcOigexr4uDcSVX
 L7CVPWrWRfYVBbQ/0CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX4nJY/+erH7tA
 GeH9FatD5ZL4GTUd94piH4xNQZFLW7Z+9ZkFEgVAHx2WVWeLNPjr6jzoHzNVbynuAom+2ZWE/ZM
 dwA/EgMbArhIgtJHD5yL2MTatNxZ9aI=
X-Authority-Analysis: v=2.4 cv=DLW/JSNb c=1 sm=1 tr=0 ts=6a6380dc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=B9hF7e9JpKM1iJhnVVUA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: zRZk-SfM9EQKJ2NuzNCFJvjmY2LgbNhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081229_266853_0C39C51A 
X-CRM114-Status: GOOD (  16.95  )
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
 drivers/iommu/dma-iommu.c | 39 +++++++++++++++++++++++++++++++--------
 drivers/iommu/dma-iommu.h | 12 ++++++++++++
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 9abaec0703ef..c26b071d744a 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2234,24 +2234,47 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	return NULL;
 }
 
-int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		     phys_addr_t msi_addr)
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
