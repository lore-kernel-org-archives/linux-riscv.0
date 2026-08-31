Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E590C624A4
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkYlQ6mTsvwfmTgSo1r0cyun5Wab/puUxsI1ehe4CaQ=; b=3zwLfMQoEExrL7
	ZcrGt7oTHlh6678yxpC5U113YljamJDXFd/T5kZzSs8o01F7JznOqh+9WpKOcTRKHAdHFTOqWRDbz
	uahbHjUoFcejUcXu7ItY08iNeOkl4cuIGAPBaMGiKq31uXnJNNwf+e2oBRXOz4F4ihi3UN6ioDPDO
	xjbCid5/f8RoDh4ARhQrIyOAam0+2FU/ZYqWkmKmF4ekSNnil+9cG3WEG8w5jD1o6WeJbVNoazT46
	nk9UKlnA8wytX2VX1K2qWqkyLJ3dxOxdGtyHwzSsbzZZYjNwQKZzHKFgrb7JQF4bNkoOifY37YIzj
	qd3H/zxMSeiKsdsx2e+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UP-00000009kVe-0f2Q;
	Mon, 31 Aug 2026 15:00:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UL-00000009kSI-2l8u
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 14:59:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETndE3969836
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JGkZKildlqj
	JzugtZJx0sJt2KViTlqK+7HFbST5CtPA=; b=g+DM60uHpxeekSrflg4yvKHlEGa
	ZWi7Q4MlQE/a18400XJqMQEt0pByHjfxLDlZFQg1gyVuGsniSVM522acNP81EU71
	FKhFD7EzGDze1G7hGx6f+OCSg+f52ehzY9gIxZWFE8rhAGd/+2POPnVZjTkSVVEe
	0dWUGAqh2OKvHFRSTfr5Ct/3q0MsJt3XsJyFMKqzA3Ihpcglnk9SX9uel4trmJhn
	aoaawgoRNOjpcF6LHJH5WR0L0NZK6TCvjeDH9uVV3vgyo7E39cxb6JBfqX5r2C9y
	BcJ1PddrwVrRL/OVW6NASTt0Kz0NOg6FxC63mdm/qVNxZJC4RWCUx/EjRag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h91gwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so325259585a.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188396; x=1788793196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGkZKildlqjJzugtZJx0sJt2KViTlqK+7HFbST5CtPA=;
        b=BN2AGIE3aW2y8c0dNciJkKCnkkVVr2KCCni9XUVuc4EYvK1bpwPOiLxWrbyyPyWf3E
         DN/ugHoaPTkKW54UhJk9tKVwRIRFijdpGaDULxiREKuQpKzrXQFWUM56xssSIkVwplqe
         qrmN6EO6azFWUhTcFDclhndFO7S61Uc7ST+cClu1IUxZjjHoCufhS07gCwh4FYchDyYt
         K8ibIOaTNL6nV3WAn8Bh4CxYyk6N5XZdVXcQt51riXpE0HuUeO1vnngZl0XS6xJmavSj
         AyweXwU8F50rjsdLzDarfU02zilPKi7+APWo1XCqwAkgK7Ip2fmcOBwWBlpuNv7GFDoZ
         j/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188396; x=1788793196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGkZKildlqjJzugtZJx0sJt2KViTlqK+7HFbST5CtPA=;
        b=YgWppVHgisWl3556L9FdLKOA4EBXauf7li6fX4J18XqfXX9LpDCllbQ2tDV1YxNrgc
         Q7eWIqyDJ/k8WJQrOkFt50SUCqe5lpEIPwAI3y5FGilj1QrMp3FwSizkurpm5ewDgYi6
         753yULbebO5y037gdnf6s2Sm8/SYxUBr14K/LJEFo9Ip9Dn3Lg7ugnTJpywDSvx9ijpm
         6nSx2m6iAaLOlyOuq5lu0gsBAUxu5B0phWx5b6L1Q7GsESn4ad74wkny1Z6LBjj5PSOG
         J/609ZEe7yJCWgeZkCvFl7qEsMRMqMwAUM1Jo4Yr2gjz7IBl2K9eXN8SIULAOSmu4P2E
         Aiig==
X-Gm-Message-State: AFuF++mUr6P92tw1G9vLTXqGA1DU4HDcN8f42yv5UcU1rIbhzz7AyV+q
	cWKBK+euWlVErrIgQZqftwa8I1aUL0uRSNJoR5WAsFBlRSDNnpNMbcG1xTUnnUuQhJpoyKJ7Hkn
	SnVzaPeFZjxM7EMXZmgQIb9luplmAmVC/Uez1xSlZte9auLpFspqs/lrbPoM1hkvewYU3EczB+h
	hu9/E=
X-Gm-Gg: AR+sD13+ajyae2mOc9fxTdPLd15jhdXbOa7ucF+r4sKXodFnVBBMFESDj1M91HVeg5N
	+tged8oLkhDbDVQQJBj0m8jy3iXVC0uZkYt7tLfPovUK6Bs6ckBdM0Ups7woSJte9WpFbGsRelt
	Z9nPPBqixMWywEcM7TD+fFjk5dVaJx0m7kJhd6QzUwRHk4yysJklq3EmcM/sYJpoQRBfXv08CM0
	a4XIK2gy508wYduNTP1Wm1yJ13qgtalfGi7wimz5GXMysfudgaHNiSTkw24kSEh58Yc0hWRJgh0
	it1wqfsEfVQQ8U6B1kwD7NTGY7DI4sLInu471u7YszDiwcKDJH4LpOQ/HYriRvV4j4S4bqvMYZ4
	5z6lpGLNP6gwy94vj2yrfwtkDuEe2ocyD/gM=
X-Received: by 2002:a05:620a:44cb:b0:939:15e:1a5 with SMTP id af79cd13be357-9391391a8a4mr3008741385a.35.1788188395801;
        Mon, 31 Aug 2026 07:59:55 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:939:15e:1a5 with SMTP id af79cd13be357-9391391a8a4mr3008732885a.35.1788188395227;
        Mon, 31 Aug 2026 07:59:55 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843dcc00a6sm5323372f8f.33.2026.08.31.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:54 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 06/17] iommufd: Install software MSI map ranges atomically
Date: Mon, 31 Aug 2026 16:59:32 +0200
Message-ID: <20260831145943.313726-7-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a9596ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0NqqyPg6VgUUedX_kk0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: hGy6V9ertSIDK1KZVo4GnsuIN7TLuUeR
X-Proofpoint-GUID: hGy6V9ertSIDK1KZVo4GnsuIN7TLuUeR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX0fyI9u7z/H2S
 O2BpOE2v3puIbqaNwwtxjK3/6KTZXReMQgzinSe/GEjKffrjCBeORG50qLubzo2SpfpTjeOZ6za
 Tlf6s9oq9rDiqJSm77DHZbepV5x0NqM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXzIJ6LOtKmrJd
 91KN+OfCt0k3HCZhNcfKeGEgGvG4c8KO1KdNAjG1OGsUj6hrR4q4wBvV0Qa4WzrwwZOshnhjr/M
 Kqk2c/NJKXYP1X7xW/XJc5flCpMWUabKiyr/l7udF7pIQbi/ozcMhyL7zj1uQZZFCiXc95ONGDZ
 HWmP6jf2+EVoDhuJ3crcovuufdN7tvAt1tdIsVW7CyLKmbwSBPwhiAj5x278hst8TNGD4iNV/WV
 V+2EQbmKj4fK7Ws/v/t1hP1vcNWgsi/VoZPqx9zhnT61/UJku0FTAU0QQHd4KJbkjcRNSq46uzy
 xC3vzOznNMGMZUMxsLuFXQk3qYiCf71WbAMamj8V7E27KqSIiaJJqDlOdibIfvrNyalZu4OAbp7
 N1UktcCpXGDquHZc9qfDlSw6nSrxInqu+KUyZ6EodHOwePvjSdDrnZ2qzIoen045cDsmi/FxbVy
 7/8gQtaqbdNoKvLRKIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075957_815339_DF3392AE 
X-CRM114-Status: GOOD (  17.89  )
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

Add a range installation helper which installs every map in a contiguous
software MSI range and rolls back only mappings added by the failed
operation. Use the helper when replaying range mappings into a new
paging domain.

This prepares iommufd to publish and install physical address lists
without exposing partially installed ranges.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/driver.c | 76 ++++++++++++++++++++++++++++++----
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 6a0527f4b058..a43a25078f87 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -178,6 +178,17 @@ int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 EXPORT_SYMBOL_NS_GPL(iommufd_viommu_report_event, "IOMMUFD");
 
 #ifdef CONFIG_IRQ_MSI_IOMMU
+static bool iommufd_sw_msi_range_index(const struct iommufd_sw_msi_map *map,
+				       const struct iommufd_sw_msi_map *base_map,
+				       unsigned int nr_addrs, unsigned int *index)
+{
+	if (map->sw_msi_start != base_map->sw_msi_start || map->pgoff < base_map->pgoff)
+		return false;
+
+	*index = map->pgoff - base_map->pgoff;
+	return *index < nr_addrs;
+}
+
 /*
  * Get an iommufd_sw_msi_map for the msi physical addresses requested by the irq
  * layer. The mapping to IOVA is global to the iommufd file descriptor, every
@@ -207,11 +218,7 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, const phys_addr_t *phys_addrs,
 		list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
 			unsigned int index;
 
-			if (cur->sw_msi_start != sw_msi_range->start ||
-			    cur->pgoff < msi_map->pgoff)
-				continue;
-			index = cur->pgoff - msi_map->pgoff;
-			if (index >= nr_addrs)
+			if (!iommufd_sw_msi_range_index(cur, msi_map, nr_addrs, &index))
 				continue;
 			if (cur->msi_addr != phys_addrs[index])
 				break;
@@ -306,9 +313,9 @@ iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, const phys_addr_t *phys_addrs
 	return ERR_PTR(-ENOMEM);
 }
 
-int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
-			   struct iommufd_hwpt_paging *hwpt_paging,
-			   struct iommufd_sw_msi_map *msi_map)
+static int iommufd_sw_msi_install_one(struct iommufd_ctx *ictx,
+				      struct iommufd_hwpt_paging *hwpt_paging,
+				      struct iommufd_sw_msi_map *msi_map)
 {
 	unsigned long iova;
 	int rc;
@@ -332,6 +339,59 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 	__set_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
 	return 0;
 }
+
+int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
+			   struct iommufd_hwpt_paging *hwpt_paging,
+			   struct iommufd_sw_msi_map *base_map)
+{
+	struct iommufd_sw_msi_map *msi_map;
+	struct list_head *msi_maps = &ictx->sw_msi_list;
+	unsigned long *newly_mapped;
+	unsigned int nr_addrs = base_map->range_size ? base_map->range_size / PAGE_SIZE : 1;
+	unsigned int nr_found = 0;
+	unsigned int index;
+	int rc = 0;
+
+	newly_mapped = bitmap_zalloc(nr_addrs, GFP_KERNEL_ACCOUNT);
+	if (!newly_mapped)
+		return -ENOMEM;
+
+	list_for_each_entry(msi_map, msi_maps, sw_msi_item) {
+		if (!iommufd_sw_msi_range_index(msi_map, base_map, nr_addrs, &index))
+			continue;
+		if (iommufd_sw_msi_maps_test_bit(&hwpt_paging->present_sw_msi, msi_map->id)) {
+			nr_found++;
+			continue;
+		}
+		rc = iommufd_sw_msi_install_one(ictx, hwpt_paging, msi_map);
+		if (rc)
+			goto err_unmap;
+		__set_bit(index, newly_mapped);
+		nr_found++;
+	}
+	if (nr_found != nr_addrs) {
+		rc = -EINVAL;
+		goto err_unmap;
+	}
+
+	bitmap_free(newly_mapped);
+	return 0;
+
+err_unmap:
+	list_for_each_entry(msi_map, msi_maps, sw_msi_item) {
+		unsigned long iova;
+
+		if (!iommufd_sw_msi_range_index(msi_map, base_map, nr_addrs, &index) ||
+		    !test_bit(index, newly_mapped))
+			continue;
+
+		iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
+		WARN_ON_ONCE(iommu_unmap(hwpt_paging->common.domain, iova, PAGE_SIZE) != PAGE_SIZE);
+		__clear_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
+	}
+	bitmap_free(newly_mapped);
+	return rc;
+}
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi_install, "IOMMUFD_INTERNAL");
 
 /*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
