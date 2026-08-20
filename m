Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B1DC5DF8E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ry/udN1r/6tcvLM4QH9dA31nzbVqQvDC0AInjW/eU8w=; b=tyh8hJosc4tDIj
	CEtyeO69qNXa73PmESuK3zglMJcLCEBpyJVin6k7Xt/WFatC/qZ0GG5h3edyEjFhezFSN3UKvEaZ6
	9Xqhj8y0/YQJ+WHG+HOXfNx0zWPm2SmPbZ/dnBVfuXpV7chKyuDW79TPHcSiNTPzjBnj+HaKvIkYE
	Eg2u5D3LmJTxzIkvB3TP/USYnYB8RPD83icr1V5xBcuzJrD4Vfvdf4EWDPcpbtUbWc+2hgpfkKrdS
	QMj60cTKAiYL37us9RS7TUywCtgOzo37aBfcGTy+IspY6QcL4Gv4ywSYmNa+qAiNwpUL1co6OOSxH
	kWEkAJJC+2moTCaZPsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWO-0000000CDZi-1Yxe;
	Thu, 20 Aug 2026 21:42:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWL-0000000CDYu-1nem
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:41:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK8Wx53943265
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ULD8UiC7UtV
	MR72OBgPjKW1Cvtm/Xs0kpr5dd9Tku68=; b=d5TDpidIHPHF3TYCLZeTHsdjKBc
	xjpvCnmRgV+ObcV6vcNs1GSDsLB8cU89SEyes5O2rs1BxTPG4QqRaqgIvzYNWHBA
	wkntASaM2d6BDBjZbrftfhB4naKD2FDXV1mulI4rkuivtxbOQbtqN0fdz1XFeEjH
	rSRaqdQ+fOLInGcJuhp6/tZ1BTk1rbsZ/9uq5rP/M5V33uBYFAdikzfDVXno8zDJ
	kuyFx8RmjO0Q7mItXRyz6BRIvbUpRtN8NB+BtH4stVtbTdPHFshMU+vAbCq7059v
	lggF8z0empP4czP5dtKCsSIPnEF8FG0ZzPyQ0/j4AFQW8OGYsG2Zl2aTm+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7uu8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:41:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso5664561cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262116; x=1787866916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULD8UiC7UtVMR72OBgPjKW1Cvtm/Xs0kpr5dd9Tku68=;
        b=kHSnzzi8r+EKnM12rUw7CX7IV6tkTtz2DopX6QpqgSj+T/8LGRyFgGEgw8O8qcxCsz
         PUf3RYm/qThEh/DRvZeJ2K3NHDVOwebwUg1NEh6/nTEQm4nVDwT6ZzKbinkRLvM0tN7S
         lktM9zzwGJ3cKLu0yKKP//R2IWHK74YuIlsrPHwFaDP1eLzL8Qi6UyO5brRw9L44+Ww0
         VnKcri2cRxN9JhJrXVOQ7cBONrKo2SM+wRYOnSqe0FwItS0FcMhR7u4xT5Azz/ccnr0k
         SXwfADYobHt4y84DGIoP9Gst6guxN81sgcgYjqhomiYbJP0ujv2/HSFllc03SZ91jTaC
         DA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262116; x=1787866916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULD8UiC7UtVMR72OBgPjKW1Cvtm/Xs0kpr5dd9Tku68=;
        b=FtNXS8I+ZBLUcMPjIkucYo5T1NB2KfJ3bcfHHzsGFbfqB193vfgo7U4hp7NW1V2C49
         tWWx4uP1K7Urp0Biz/SM/rdy1vNJUneZJG8JXMve8wXH6iJK81l7mCT+il/n4/KnR+ns
         Vok++QF1Sg9zpiNYZee/UdS9d7r701juYc1yW2Ujl2FWQZScwHlkkiFCzeOY+EUgjsOM
         OLTxcIhrh/GIrM+k7MHomnGique3JlE+58INPA/eNAhjTRq0F7ykgRqCtEtk7NWqqZbF
         MVXNPje4Ye0d016OTQGfQiCrLiijnpmkUJBu7mxxsybBcDHZUtQ22DHUM+NeE5+S7/1i
         uyGg==
X-Gm-Message-State: AOJu0Yzjp8js1TD4hYj7SSESAjKSvkVF+tLnqimVECz25WmiZC9287Bq
	w/Dm9FADK8qcR/cOw1THSUa7CQZAv7vgvDil0Gi8RZnJzhbRo0fjdSP+skyDpKCzyx0OGHktSjY
	WeJKqskuW/8tcfkgcy47gq5BiIN4IHJ/kUth86n+7OR9HuDlE/wYwM+bdcgtfrDWTpr7hGrVZjs
	BAzgQ=
X-Gm-Gg: AR+sD12kJmrKVg8VUcpDiy9kvZV+KI3EaNM14slHkTh6AvPbhpQbLG1FFGykuLZBam7
	js4FrHCB1G6gymDif2iq02Zh8v5ytrgeD0oKKzn0/Y9/rBsEUFcG1ECZMyfh1XpSQfqaV+dz8qO
	f2ucXfW5BjOhoTyCAXG2RsB7N1zSoYNOKA1iEVPBxcm3UqrTQgMHWLUHLV/PENzYLkKCyH/nDFl
	C18BfkOtaWNSBnshNqL4XZ0wfNfQgQ/zf53IA+GuS53kDjeVQYImRn+ZUDYyWtAtG2iW1dTEvhB
	AVhMvsEPFlXuE8IKuvyxNT2iQxRyBJBk+C9uVeoNp8JAjpQ9HULbJ7aKgxVsHLHNpIrDFlmCoXh
	G2lv8JqHG
X-Received: by 2002:a05:622a:164f:b0:52d:3352:f7ac with SMTP id d75a77b69052e-52df5a15479mr14185681cf.28.1787262115937;
        Thu, 20 Aug 2026 14:41:55 -0700 (PDT)
X-Received: by 2002:a05:622a:164f:b0:52d:3352:f7ac with SMTP id d75a77b69052e-52df5a15479mr14185171cf.28.1787262115417;
        Thu, 20 Aug 2026 14:41:55 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm16373207f8f.35.2026.08.20.14.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:41:54 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 01/21] iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
Date: Thu, 20 Aug 2026 23:41:30 +0200
Message-ID: <20260820214150.545737-2-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXxW5t7R/+C3q7
 Xitj62ZmymusRKJzQxFJN5QQlJ968kiRfzwIAnN9XvHZO1/JfgpOPyhhXhbEd77htu1ekxVgo0m
 msTE1coSzwBcFQCvWaOyiuoo/BobvNVsUJ/6w2DdSKCZEfDC/ks7m0c22pUYSOoBQ6kFYc5AVvJ
 RW5/dzLmBjWHUPfnFMf+0sNzktEYbMhuTKBKI8g29iypT24tG9mKVbuqJcdxD0wm+FfiJM0SKc5
 vbArN6rXvlR/0c/xrb5XJfSHk9rtoufFJ+YIvHLWvfqq5R5wjl9HBLEQWXNogLvM3/1ylQl/j18
 H0kBcmrvl7NrU0CdG/sNqEbR/dFRaAiosyX+/1IV75LOHRzSxa1gGS8VUHEgnKSz24BfO6hT++1
 HcFR9tzrTSXHT+25nl7dKX6fHyKmV5EEzI0h7oUcf0ULycFuHF9sXcBtn3ljPapHLUYaxuSQLWg
 IbxrkrNKW8J6OYKMdjw==
X-Proofpoint-ORIG-GUID: cmh76RdpRZzb9YlBuiIZYqAuRl75uSp7
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a8774a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8L5tTrZ4L9qXjquGIIcA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX4ol8yDI6hl5U
 3cLZPUU5adiwvoeXu7D4aA9dsuSma+E/f5sjaVtUtrVabEnc6FICreSMWUxKQNnqlDoB0uWjteF
 SxHrmeWy6arbTplK0WYLgo0vRSbiFHw=
X-Proofpoint-GUID: cmh76RdpRZzb9YlBuiIZYqAuRl75uSp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144157_478057_4C8EF91C 
X-CRM114-Status: GOOD (  19.94  )
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

struct iommufd_sw_msi_maps uses a fixed 64-bit bitmap, limiting each
group and hardware page table to 64 software MSI mappings. RISC-V
interrupt remapping needs a mapping for every possible CPU, so this
limit is insufficient.

Make the bitmap grow on demand and treat IDs beyond its current size
as absent. Cap it at 16K entries to bound allocation size while leaving
ample room for expected software MSI users.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/device.c          |  3 +-
 drivers/iommu/iommufd/driver.c          | 38 +++++++++++++++--------
 drivers/iommu/iommufd/hw_pagetable.c    |  1 +
 drivers/iommu/iommufd/iommufd_private.h | 41 +++++++++++++++++++++++--
 4 files changed, 67 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index d488c23fd353..868f1e591208 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -34,6 +34,7 @@ static void iommufd_group_release(struct kref *kref)
 		   NULL, GFP_KERNEL);
 	iommu_group_put(igroup->group);
 	mutex_destroy(&igroup->lock);
+	kfree(igroup->required_sw_msi.bitmap);
 	kfree(igroup);
 }
 
@@ -384,7 +385,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 		int rc;
 
 		if (cur->sw_msi_start != igroup->sw_msi_start ||
-		    !test_bit(cur->id, igroup->required_sw_msi.bitmap))
+		    !iommufd_sw_msi_maps_test_bit(&igroup->required_sw_msi, cur->id))
 			continue;
 
 		rc = iommufd_sw_msi_install(ictx, hwpt_paging, cur);
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 3b8067976eac..9b9316ae4266 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -196,13 +196,15 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
 		if (cur->sw_msi_start != sw_msi_start)
 			continue;
+		if (cur->pgoff == UINT_MAX)
+			return ERR_PTR(-EOVERFLOW);
 		max_pgoff = max(max_pgoff, cur->pgoff + 1);
 		if (cur->msi_addr == msi_addr)
 			return cur;
 	}
 
-	if (ictx->sw_msi_id >=
-	    BITS_PER_BYTE * sizeof_field(struct iommufd_sw_msi_maps, bitmap))
+	if (ictx->sw_msi_id > IOMMUFD_SW_MSI_MAX_ID ||
+	    max_pgoff > (ULONG_MAX - sw_msi_start) / PAGE_SIZE)
 		return ERR_PTR(-EOVERFLOW);
 
 	cur = kzalloc_obj(*cur);
@@ -222,21 +224,26 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 			   struct iommufd_sw_msi_map *msi_map)
 {
 	unsigned long iova;
+	int rc;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
+	if (iommufd_sw_msi_maps_test_bit(&hwpt_paging->present_sw_msi,
+					 msi_map->id))
+		return 0;
+
 	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
-	if (!test_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap)) {
-		int rc;
-
-		rc = iommu_map(hwpt_paging->common.domain, iova,
-			       msi_map->msi_addr, PAGE_SIZE,
-			       IOMMU_WRITE | IOMMU_READ | IOMMU_MMIO,
-			       GFP_KERNEL_ACCOUNT);
-		if (rc)
-			return rc;
-		__set_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
-	}
+	rc = iommufd_sw_msi_maps_ensure(&hwpt_paging->present_sw_msi, msi_map->id);
+	if (rc)
+		return rc;
+
+	rc = iommu_map(hwpt_paging->common.domain, iova,
+		       msi_map->msi_addr, PAGE_SIZE,
+		       IOMMU_WRITE | IOMMU_READ | IOMMU_MMIO,
+		       GFP_KERNEL_ACCOUNT);
+	if (rc)
+		return rc;
+	__set_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi_install, "IOMMUFD_INTERNAL");
@@ -290,6 +297,11 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
+	rc = iommufd_sw_msi_maps_ensure(&handle->idev->igroup->required_sw_msi,
+					msi_map->id);
+	if (rc)
+		return rc;
+
 	rc = iommufd_sw_msi_install(ictx, hwpt_paging, msi_map);
 	if (rc)
 		return rc;
diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
index 623cc608ca0c..54873de43eb0 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -32,6 +32,7 @@ void iommufd_hwpt_paging_destroy(struct iommufd_object *obj)
 	}
 
 	__iommufd_hwpt_destroy(&hwpt_paging->common);
+	kfree(hwpt_paging->present_sw_msi.bitmap);
 	refcount_dec(&hwpt_paging->ioas->obj.users);
 }
 
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 43fbc5bed8de..9ca5f9f92cdf 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -9,6 +9,7 @@
 #include <linux/iova_bitmap.h>
 #include <linux/maple_tree.h>
 #include <linux/rwsem.h>
+#include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/xarray.h>
 #include <uapi/linux/iommufd.h>
@@ -29,11 +30,47 @@ struct iommufd_sw_msi_map {
 	unsigned int id;
 };
 
-/* Bitmap of struct iommufd_sw_msi_map::id */
+/* Bitmap of struct iommufd_sw_msi_map::id; starts empty, grows on demand. */
 struct iommufd_sw_msi_maps {
-	DECLARE_BITMAP(bitmap, 64);
+	unsigned long *bitmap;
+	unsigned int nbits;
 };
 
+/* Large enough for foreseeable SW MSI users while bounding bitmap growth. */
+#define IOMMUFD_SW_MSI_MAX_ID	(16U * 1024 - 1)
+
+/* Grow bitmap to accommodate id. Must be called under ictx->sw_msi_lock. */
+static inline int iommufd_sw_msi_maps_ensure(struct iommufd_sw_msi_maps *maps,
+					     unsigned int id)
+{
+	unsigned long *new_bitmap;
+	unsigned int new_nbits;
+
+	if (id < maps->nbits)
+		return 0;
+	if (id > IOMMUFD_SW_MSI_MAX_ID)
+		return -EOVERFLOW;
+
+	new_nbits = max(ALIGN(id + 1, BITS_PER_LONG), 64U);
+	new_bitmap = krealloc(maps->bitmap,
+			      BITS_TO_LONGS(new_nbits) * sizeof(unsigned long),
+			      GFP_KERNEL_ACCOUNT);
+	if (!new_bitmap)
+		return -ENOMEM;
+	bitmap_clear(new_bitmap, maps->nbits, new_nbits - maps->nbits);
+	maps->bitmap = new_bitmap;
+	maps->nbits = new_nbits;
+	return 0;
+}
+
+static inline bool iommufd_sw_msi_maps_test_bit(const struct iommufd_sw_msi_maps *maps,
+						unsigned int id)
+{
+	if (id >= maps->nbits)
+		return false;
+	return test_bit(id, maps->bitmap);
+}
+
 #ifdef CONFIG_IRQ_MSI_IOMMU
 int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 			   struct iommufd_hwpt_paging *hwpt_paging,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
