Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC865C9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0tpm3clnndCN1BfsK6UV8N3rwRFonlADF5RY1rqqvM=; b=Msm16Vvtcxmozz
	oldzMkJygQ/GxaLZ9545GjqVjemssAqiOfBqGtA6jqUATm4ECYu20DqvdM/fXKFW2PSberEZDwkuT
	3JlXIqFYwVJcYjjXj7dbX6H1s10JoMs18tidbit+uJe7Qk9rRb6tLRZrhV8kD3FcZPH3jl5hSTIln
	bDoAguC6pw0OwGdnU+uQbI2os4gXgBzSpk/yhyRv+yDUmHZwC5Q0sxSLP9o6tuz2RPUh6Hddzlk3w
	Nw79JhhHG1+wkxbtCYrnVyydLG+Ax8qnUwZSfI6sOwcRvfAmI3pHzKR4f3rH4WcB4nFu/JeL0MTM5
	Zd7W3yCvU2rep+TED6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7nL-0000000DmG6-1Z2w;
	Fri, 25 Sep 2026 15:25:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7nI-0000000DmEt-2OGA
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:25:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDHEEV289412
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=74iQNB8RUMX
	OEtUKhZVWnVdPbSa6Qnll3VofRt8K9nA=; b=jtB4Ff7hILDCdrFIrIiGa+IYf08
	sroVn2zma8vsUUe4ND6YKJDHHA3OK71vqB5blVOBaWdgT7pvvTT+0S0z1T9QHfVF
	06eZcYKc8ShCJEOS/1LCORUPez12OBfKFb82SzYnmBZBpq/AcGKUHVh7pQnLpzGg
	EUkAcvydKdRnsvawTxNjN5w0Fd9IXrqJoyIUckld7CAp3PSy2K1jFI7fNRYFBLLv
	gV9v8EtJJVhSaPSfd91W1iKvqQ+c39ochbHLhu4QTYU3xN1Sfuqjh9sm6aO9ZwvP
	RHRT16k5WeIai2mNMIg49I5gYLHlkvglGWuaUeNhTe/rlLhDc6QvPRWPHDA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881v5tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:24:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so708353eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349898; x=1790954698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74iQNB8RUMXOEtUKhZVWnVdPbSa6Qnll3VofRt8K9nA=;
        b=NNfMnNX6deSi1SJ3f9ITQ3ySpTRjYa5buAgQPZWEjX82mPLeE0sPeIvYjE+hCp3/IB
         +GlZlIBLecDKxe8l4IbpiWHRUeoTpGV0qBhdbQyo8KGxd/2fFJQpB1IMtCz5bJqATwem
         L+59XBcV4mxHNi24spRn1Ma//WvLOm6NEMzZ0AP7vFBpAX2yScG1Z8rK8Zd5G44yfHMb
         pmBBN+t4oW4ZrbgzVct63Wl0CNNn01i+FDaI3MLEWa3vFsVxT9JB0rlV6CwbsjL8B0Jx
         Htm5UvW8Ep0eLNwzT9kHkoaSgXBkkiO3md2lH6y5pB8uQqziN8iysMoVfdlEOjiiKaZq
         777A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349898; x=1790954698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74iQNB8RUMXOEtUKhZVWnVdPbSa6Qnll3VofRt8K9nA=;
        b=Ea6FgLKrRmJUaVGUlAnrXov/FUmGy8E6324rmCGVc+VbrcEtuWnD1P19PY1Vzvduy6
         ify4HPWwbLClwxo/g+oxMULWWCieOzjS1kC2qVv11MFgWiAImMg+Kb9irtQewkpnignP
         4XkGBbtSUZsMFYWEXvAgm8Wlu4sqQNHnZfhcp5BIa/5b8cT8TQHdoIE6cEbbGfJEHu/4
         AaUgL8YF2oTp172JLu7owwrYMdsDh065AxHo9pse7bQY03X1IPuNsT7Mr7K7PO+0d4/J
         rHUmzGgAhfj7khm3OBqzWUo378Kx8r1362NoMifY4i46/ModMIDb/1Z4w+kgZhhjo/B0
         9SJQ==
X-Gm-Message-State: AFuF++mRxk8QYtY+FLU5bkDja9vIPwThElPDEur9BvFTC2R6q8Km21XA
	wDBh502WZc3Q5XWSo1aLnGzYLPe0W1LKFjhudyw0ifP4lpOTjHb/WWIL5JR9Sa3M79M8nMGtfVA
	YJxeHSxsR4o9qXhui0As8SbRPrTTEC0wylA2uU9YQXfz7EvM2RdAOP9St4b3KMopF29sXtsBf5D
	0LCBE=
X-Gm-Gg: AYBFou3e4s76Jm2edDoC8e5JH4G7EPbaL3R3ZeUDSIAnyTTy5vEU+Z+YXlN++CrAgJa
	R9r/dHoasY/CXmSfrmS0FKJfcIiSmOxWJrZChR5+54ezxdsmScaynGjWFBkp2j0kf4pOZxhlgG1
	+3iRT+VILFVdy1XeiA9OKJwdQQBtWVYg/uVLpNaN+4cxbG6JkhBvig3GZN6QyvugVx75I9OUFce
	oHuLNYK/FKGsovBYyhaubO3s+nVH26/n/uytlnLk32ufHA5avAE4eHziRP8NrT7hUsNos5HJGy+
	/dQbFZLz1R3xgXCIFKewowEPrUF9mHtzZUySUP0D1oJH4HGeZbnVzlpjvHfKnSlskib1tva7zwr
	8kLpjW94lXigghA/nGu9KbIuHimoIHfdozeX9cA==
X-Received: by 2002:a05:6102:3954:b0:7af:7d6c:495b with SMTP id ada2fe7eead31-7af7d6c4e35mr1497497137.1.1790349426969;
        Fri, 25 Sep 2026 08:17:06 -0700 (PDT)
X-Received: by 2002:a05:6102:3954:b0:7af:7d6c:495b with SMTP id ada2fe7eead31-7af7d6c4e35mr1497479137.1.1790349425890;
        Fri, 25 Sep 2026 08:17:05 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm176766415e9.3.2026.09.25.08.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:05 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v6 02/16] iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
Date: Fri, 25 Sep 2026 17:16:45 +0200
Message-ID: <20260925151659.419512-3-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab6924b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=SRrdq9N9AAAA:8 a=8L5tTrZ4L9qXjquGIIcA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX8ifaL1Vig/NL
 NeSQQusJ1nJKhGuxP6no19y1ywSvofzEhZkS5ohpFrUeHuOY/O+Kg00bOUZ8fM5BOhmRbZleJ1a
 OdZ5qPMdIQyJ/y4C9YZShg9FZoI/yThZ2JBIrBdpSsaOQN+Y8m+AYVJTOm3l2JQijes2R8LorO3
 iTtoFjIanXu/hGrQxzi9Be/U497ZVCOueQC0Zx6U+8NsM/y+3gFmSWs1R8b+5DjwyVoRDq8FkRu
 Cgm50zFVtTDVWktFQZ0gL9F2hWUXM1Az4zxOJL0iu5TN9+UhdhNB1p00NYErf8Oc9VlOecWhevs
 B63MYMkdikzPbxyrhPlq3OGCJpds5cDiytthSFKi8H9cGwJOt2VXXi6lFbgl3zxY203K6VeKprz
 k+FFoFC3NEYNANCPVNUJ6d/wOH8BbsSxF9ROYFpcOUZjmprguFu2SUe3L3OCSuRdxqJWO0OTQxZ
 YvCN6uPp4Uww7qDUWhA==
X-Proofpoint-ORIG-GUID: zLptBt6rS15ph-uTF51RnZiw7UBN9ldU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfXzxRi8WGJ09aE
 o9Witvi3cz1RV0evL3WDM0xsG+w19VzbXsY4rAEhvJ8eBdToS2f2bXvGfj73NCLoB1OjP04yO3g
 hMXCALjXSKrPfQnteM9bwx0BMYmYYi4=
X-Proofpoint-GUID: zLptBt6rS15ph-uTF51RnZiw7UBN9ldU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_082500_727892_F15CA970 
X-CRM114-Status: GOOD (  19.46  )
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
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/iommufd/device.c          |  3 +-
 drivers/iommu/iommufd/driver.c          | 37 ++++++++++++++--------
 drivers/iommu/iommufd/hw_pagetable.c    |  1 +
 drivers/iommu/iommufd/iommufd_private.h | 41 +++++++++++++++++++++++--
 4 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index a664c70a6fe7..28e2c98ef953 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -49,6 +49,7 @@ static void iommufd_group_release(struct kref *kref)
 		iommu_group_put(igroup->group);
 	}
 	mutex_destroy(&igroup->lock);
+	kfree(igroup->required_sw_msi.bitmap);
 	kfree(igroup);
 }
 
@@ -450,7 +451,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 		int rc;
 
 		if (cur->sw_msi_start != igroup->sw_msi_start ||
-		    !test_bit(cur->id, igroup->required_sw_msi.bitmap))
+		    !iommufd_sw_msi_maps_test_bit(&igroup->required_sw_msi, cur->id))
 			continue;
 
 		rc = iommufd_sw_msi_install(ictx, hwpt_paging, cur);
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index e4d17a748178..ea705e416139 100644
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
@@ -222,21 +224,25 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 			   struct iommufd_sw_msi_map *msi_map)
 {
 	unsigned long iova;
+	int rc;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
+	if (iommufd_sw_msi_maps_test_bit(&hwpt_paging->present_sw_msi, msi_map->id))
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
@@ -290,6 +296,11 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
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
index ef6e119c2a75..81f41d437c4c 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -41,6 +41,7 @@ void iommufd_hwpt_paging_destroy(struct iommufd_object *obj)
 	}
 
 	__iommufd_hwpt_destroy(&hwpt_paging->common);
+	kfree(hwpt_paging->present_sw_msi.bitmap);
 	refcount_dec(&hwpt_paging->ioas->obj.users);
 }
 
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index eb2e85b27e42..774cbe28cbaf 100644
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
