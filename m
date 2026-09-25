Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CBAC98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8rz+kE+lov2qqs9/TOYN6USByGgS9RlyTjhSl/U+Cc=; b=OpND1q8EPbOwy8
	8aHWlcSaCVdaOglVHaVujkB2XOoe22GymZUB2s04HQPMK5Dx8eCkqKJPnIYYRK+nR9PnUdFfmNrfM
	yhLoOBnJynIMG3ZEdWCaSQMRUgyXMP/WFPB5A9ynOwd1VoJr4ogCZrUjuv5YPmGfeVA+qgdKg/m6a
	0mUgNKfxzNFTneJo48fsFR6+VDln0DKoFT+G87Lm3SEVGqkvI9Gw+J9tP4O+m7syAU5w3lq7JGKHJ
	QhYLAyZQIUeqy6SI/6kKoYCLecrAjnpUpGTAPWDZuDSKXroQHrmc4Uhszs5MEe74laBN14pgcORy4
	FD9itFw0gOnnufl99jnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fs-0000000Djst-39Pc;
	Fri, 25 Sep 2026 15:17:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fp-0000000Djq1-32iW
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDHEDQ289412
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t1fCrnwj5QJ
	BWHsPw8FOuYqTuNXRMPlCtQWMjUzAOhM=; b=KcFLfWbnuA8QS9fwkAXrWsLhWHA
	8L11ss1tOZwqZoDQEkdlUaMj6ILXLvFhiMGGcfJcH6TCZ39qwC15MDV+IXpuKU0V
	AT6hPYLpK4ns1Bp/glA60FWSE734uatcUGc6OBmqb50icAAUGJGbn8BOc0f/EB87
	hGNkqDg5/mlblrpz0RKV09Y4PoUpwWkS6McAysrsqMt8ibuawQWSEfz/78Z/QOBE
	rMCNU4vQwu2wI9SyJt/YgP+huQOY38diVJpuOXDYIDkkhE0bORxHukeBeocmTOi0
	L4SRZAShrO9B9nvApSUvj5DyLvoN45VZ11ZX4bOyDv5VavXUFOXsbR3r6tQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881v4sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-785827e6073so229502137.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349436; x=1790954236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1fCrnwj5QJBWHsPw8FOuYqTuNXRMPlCtQWMjUzAOhM=;
        b=AzqQyX12iHwcrjb3wFBs4hwErVUW3dP/bqmbR/4EKktq5soF3zbNCbheZBYYlpKPYv
         kAltdYrcGvdx6rx3hGdSqFnmTStJgkEp7fHJquSC1w8SMkNufaE2DM3GZssI31YbL6Sm
         oVValX9bvleBzQjfgcQAJ4jR1NJA0kfHlL05m4s6CzziCTgURiQOi4Oiqj07Dcl5c74q
         TG72tq6blgi+hXunqFV3Bo7c5q40SOSH174Rj7+jrt1p8g11lWUY059/x3hIX5xoxlka
         FDsCNY7DpfatSWL3FrKIuebBah0o+rCnLDdxz9IyfPovxd6rPe96nfxJwjHLDWYo8nYk
         h6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349436; x=1790954236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t1fCrnwj5QJBWHsPw8FOuYqTuNXRMPlCtQWMjUzAOhM=;
        b=x8SBv+mLJrlyJk3ZPH5wvPrZ47cQm6rf5HNGc0TtUQo0ynowneQNp47CV0hNFI1dJd
         rIfaSDfiKRwAR9JK+QHu5qsCra7BN83XSob/+aB2sDGtdmq6U8/hroh5QM6VncHsOmJC
         iY5oaY2Tr0t+wiiJH5qTAYUhj8hNttbI4tuub+bBDtszJySa7XwpQlBKL/Ue23j0uTMa
         mdL2okp8M+Uybsss3aHLWTQBngH9E1EX3E2m61siNp4MsPk7XfmdSAhFMzdSypocT+lU
         WoUMRN2eu5TkB+ri/nKb6NatqdoVrRi2l5VSASAR0tvhZ3EkV4BVySq1XPeWykGHT3qM
         u7tQ==
X-Gm-Message-State: AFuF++m8Q8WwxozO/YDJgEO7yJTynIIwi/o3oH436721KsPRwVhLjpsE
	4PdzDuT1wMI73HR0aBFok/ihnvhFu/5XSrV7Y7YakMZoiK1Cym904XqbzKS47T6Xivuf5ZLjrug
	9XhwfC8QexK1G84rmmoYsjyT3s2/iX2o3gMd3MHjfCm7rAvWWQJbp8Cbs+42I2k//TgR1t0Xreg
	/ryh4=
X-Gm-Gg: AYBFou0+7RwQNk2a3ak33PEAaOs4TZpc7/xjr368sfwmM4EmwwXbDV2F4hK/aXWxo1Y
	yxtO9t2qmRn0y0K0nVpSZffdwwxCnj0DU6FMLcGzY77Dkn2OFCoCaCT+83jAcyPf9h4b1SeZ/2z
	64ET6Ejr8h6N1uTbAhkXcHQOc0HQYktk+T31V1arpb5DwIQEY74iXiWhXNLK9aPrb8AxbtM+ass
	AsFGzenlXS3n1Q/3gvtg+8QwjoJ2NArSrFwtHMdNAB8SUQY1CeYrrjiWYyeN8vxP2X2hepIxGET
	Uj12IIGiTOq3JpR3XXXavGaCX+Gq3gCwSAj54C/reNZtGSfasFlISwfjBSyOucCYMCAe8xM5EGH
	6eMJTvDb0jSYmrUGkGGKS99JUaxus46Qry94fvQ==
X-Received: by 2002:a05:6102:2910:b0:7b3:21da:d255 with SMTP id ada2fe7eead31-7b321dad719mr335046137.32.1790349435901;
        Fri, 25 Sep 2026 08:17:15 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:7b3:21da:d255 with SMTP id ada2fe7eead31-7b321dad719mr335034137.32.1790349435442;
        Fri, 25 Sep 2026 08:17:15 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de187asm153857745e9.7.2026.09.25.08.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:14 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 07/16] iommufd: Prepare software MSI installation for address lists
Date: Fri, 25 Sep 2026 17:16:50 +0200
Message-ID: <20260925151659.419512-8-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab6907c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=fyE6B5mSzfnmm1qxREQA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX72Cq0l+WqXh2
 cR2H7/rpajEwizHM5CX45PvPTJtqp5cOixtnyILk8d4bjSpzma/xY864qp31oEmxY/FcDPsC5y8
 IJpB+BOusGJlq6joh05HtT7yeXZwwHn8pa74MGu9sdgGkVpFZlUyR8L6EGyZvcK/wZnmPheFHpu
 dzfLoP9frzG6VkXHIK6YbT0DPBxFg+zSE/PDwfDffKWB3lNP1mbwPR9lT1Ne4cZw+sG62oKKm5Y
 k/z1Uo8PzdT8tOGDZ7qXUvvUxPyPM/LvgaVs1Ux8WbeiE31ONma9w7ExV6YXBguht9WoGfu/mz+
 Sut9QnxE2WVV+f9/xIhFzXeKtIZKmNJBZ5+uuwDQF5MWiOgreFCfsxxpFGKkG7mEOINzGy7mTVp
 GI70Hi8cEDEESEc7tS4IREJ+MwGM5VbBubleISHY+Z5Dnm6X+tOYFUkt+PIb6BGq6eUlzDx2lQ7
 WlMCo9IorLNEHODGG6g==
X-Proofpoint-ORIG-GUID: A1Rjmzch1nPEUHvLuUSwlm5aMslPU7Nr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX3FbqWlY7uKSA
 J9ncN5BNIoKhnEzYnoqes8cWSqSPpkeSglkJqTsi2MjBQ8PnfUsLqsGZKIEYroEU14CPR6IkvNH
 Eqn9NoxMLA/On/cTmfvlbuVDevX6VG4=
X-Proofpoint-GUID: A1Rjmzch1nPEUHvLuUSwlm5aMslPU7Nr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081717_884386_C35E5CA8 
X-CRM114-Status: GOOD (  24.61  )
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

Teach the software MSI path to install every mapping in an address list
before publishing newly allocated maps. Mark the complete list as
required by the group and roll back mappings installed by a failed
operation.

Keep iommufd_sw_msi() as a one-address wrapper so existing callers
retain their current behavior.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/iommufd/driver.c | 101 +++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 3aff04d9dd04..f4e812e43822 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -340,14 +340,14 @@ static int iommufd_sw_msi_install_one(struct iommufd_ctx *ictx,
 	return 0;
 }
 
-int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
-			   struct iommufd_hwpt_paging *hwpt_paging,
-			   struct iommufd_sw_msi_map *base_map)
+static int __iommufd_sw_msi_install_range(struct iommufd_ctx *ictx,
+					  struct iommufd_hwpt_paging *hwpt_paging,
+					  struct list_head *msi_maps,
+					  const struct iommufd_sw_msi_map *base_map,
+					  unsigned int nr_addrs)
 {
 	struct iommufd_sw_msi_map *msi_map;
-	struct list_head *msi_maps = &ictx->sw_msi_list;
 	unsigned long *newly_mapped;
-	unsigned int nr_addrs = base_map->range_size ? base_map->range_size / PAGE_SIZE : 1;
 	unsigned int nr_found = 0;
 	unsigned int index;
 	int rc = 0;
@@ -392,16 +392,36 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 	bitmap_free(newly_mapped);
 	return rc;
 }
+
+int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
+			   struct iommufd_hwpt_paging *hwpt_paging,
+			   struct iommufd_sw_msi_map *base_map)
+{
+	unsigned int nr_addrs = base_map->range_size ? base_map->range_size / PAGE_SIZE : 1;
+
+	return __iommufd_sw_msi_install_range(ictx, hwpt_paging, &ictx->sw_msi_list, base_map,
+					      nr_addrs);
+}
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi_install, "IOMMUFD_INTERNAL");
 
-/*
- * Called by the irq code if the platform translates the MSI address through the
- * IOMMU. msi_addr is the physical address of the MSI page. iommufd will
- * allocate a fd global iova for the physical page that is the same on all
- * domains and devices.
- */
-int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		   phys_addr_t msi_addr)
+static void iommufd_sw_msi_set_required(struct iommufd_group *igroup,
+					struct list_head *msi_maps,
+					const struct iommufd_sw_msi_map *base_map,
+					unsigned int nr_addrs)
+{
+	struct iommufd_sw_msi_map *msi_map;
+	unsigned int index;
+
+	list_for_each_entry(msi_map, msi_maps, sw_msi_item) {
+		if (!iommufd_sw_msi_range_index(msi_map, base_map, nr_addrs, &index))
+			continue;
+		__set_bit(msi_map->id, igroup->required_sw_msi.bitmap);
+	}
+}
+
+static int iommufd_sw_msi_list(struct iommu_domain *domain, struct msi_desc *desc,
+			       const phys_addr_t *phys_addrs, unsigned int nr_addrs,
+			       size_t granule)
 {
 	struct device *dev = msi_desc_to_dev(desc);
 	struct iommufd_hwpt_paging *hwpt_paging;
@@ -410,10 +430,19 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	struct iommufd_sw_msi_map *msi_map;
 	struct iommufd_ctx *ictx;
 	LIST_HEAD(new_msi_maps);
+	struct list_head *msi_maps;
 	unsigned long iova;
-	phys_addr_t phys_addr;
+	unsigned int i;
 	int rc;
 
+	if (granule != PAGE_SIZE)
+		return -EOPNOTSUPP;
+	if (!nr_addrs || nr_addrs > SIZE_MAX / PAGE_SIZE)
+		return -EINVAL;
+	for (i = 0; i < nr_addrs; i++)
+		if (!IS_ALIGNED(phys_addrs[i], PAGE_SIZE))
+			return -EINVAL;
+
 	/*
 	 * It is safe to call iommu_attach_handle_get() here because the iommu
 	 * core code invokes this under the group mutex which also prevents any
@@ -434,33 +463,33 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 
 	ictx = handle->idev->ictx;
 	guard(mutex)(&ictx->sw_msi_lock);
-	/*
-	 * The input msi_addr is the exact byte offset of the MSI doorbell, we
-	 * assume the caller has checked that it is contained with a MMIO region
-	 * that is secure to map at PAGE_SIZE.
-	 */
-	phys_addr = msi_addr & PAGE_MASK;
-	msi_map = iommufd_sw_msi_get_map(ictx, &phys_addr, 1, &handle->idev->igroup->sw_msi_range);
-	if (!msi_map)
-		msi_map = iommufd_sw_msi_alloc_map(ictx, &phys_addr, 1,
+	msi_map = iommufd_sw_msi_get_map(ictx, phys_addrs, nr_addrs,
+					 &handle->idev->igroup->sw_msi_range);
+	if (msi_map) {
+		msi_maps = &ictx->sw_msi_list;
+	} else {
+		msi_map = iommufd_sw_msi_alloc_map(ictx, phys_addrs, nr_addrs,
 						   &handle->idev->igroup->sw_msi_range,
 						   &new_msi_maps);
-	if (IS_ERR(msi_map))
-		return PTR_ERR(msi_map);
+		if (IS_ERR(msi_map))
+			return PTR_ERR(msi_map);
+		msi_maps = &new_msi_maps;
+	}
 
 	rc = iommufd_sw_msi_maps_ensure(&handle->idev->igroup->required_sw_msi,
-					msi_map->id);
+					msi_map->id + nr_addrs - 1);
 	if (rc)
 		goto err_free;
 
-	rc = iommufd_sw_msi_install(ictx, hwpt_paging, msi_map);
+	rc = __iommufd_sw_msi_install_range(ictx, hwpt_paging, msi_maps, msi_map, nr_addrs);
 	if (rc)
 		goto err_free;
-	__set_bit(msi_map->id, handle->idev->igroup->required_sw_msi.bitmap);
+
+	iommufd_sw_msi_set_required(handle->idev->igroup, msi_maps, msi_map, nr_addrs);
 
 	if (!list_empty(&new_msi_maps)) {
 		list_splice_tail_init(&new_msi_maps, &ictx->sw_msi_list);
-		ictx->sw_msi_id++;
+		ictx->sw_msi_id += nr_addrs;
 	}
 
 	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
@@ -475,6 +504,20 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	}
 	return rc;
 }
+
+/*
+ * Called by the irq code if the platform translates the MSI address through the
+ * IOMMU. msi_addr is the physical address of the MSI page. iommufd will
+ * allocate a fd global iova for the physical page that is the same on all
+ * domains and devices.
+ */
+int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
+		   phys_addr_t msi_addr)
+{
+	phys_addr_t phys_addr = msi_addr & PAGE_MASK;
+
+	return iommufd_sw_msi_list(domain, desc, &phys_addr, 1, PAGE_SIZE);
+}
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi, "IOMMUFD");
 #endif
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
