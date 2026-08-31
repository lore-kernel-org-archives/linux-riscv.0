Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35345C624A5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVYJehQ2w36UbnZ0J3EjBsA0EFVKkCn2dQ0g/VU99vA=; b=SgoUs2jNPLQ61q
	XkkazWDjMiT3LpjMqEjsuKtBH2R4FqxXVGjpPGbivMDRN/Ebv+B8l2h/rcdNeRfoOSnOp8K+0YI9F
	jKtepinbLy8kC3UP1riIuTkgx3HyoflE6ej4e02JSAkWzwIkqm9Vi+u9VLZmKeB7RiG6brfqcEGaU
	DIgtw7X10EQa1AZAGQy7NV1KpY/gHlNjJ1Z0KpP0FBIR6Flv3xr19vWdP5QQHJNNxcQesxDssk8HD
	XgcymbFkNVW6g87zPNNtIpnUXbpbUBsxNlwdpk/ji45//ERKLgEu8FTU0jOys/tFusfkmCUyT9Hnz
	uQC/XTrp/wDNFyNEY9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UI-00000009kQI-0q2c;
	Mon, 31 Aug 2026 14:59:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UF-00000009kOs-0ze3
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 14:59:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETQZI3703678
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4GHoWBlwh+Z
	DFPbKlbwwLkJp6XL3wIYVeEUFlrZWxZg=; b=WWKFtOR3UPCpEXNS/clvIkda4ms
	qH3YTzhPwYSzkDmsNy4hULkg6/anMEgbJeSZ5U4SnzkD71jbYGq6GrDFxYmXUd6y
	n6AH39e8p/HwrN9KJn7Pn91kFWEAaMbs2Z5X4jGfdNLUHPYaCIzC/+mKHwG5z9BN
	r+S0NCCoyZ/Dli083bJJz6L8GtcsddjiVdVw1RcwgQ2qA67i3dchTEB9vQ6Uz0GU
	hf3aVEgWMB4vnYcXuaiOBwtDeYrXWSlW/cMngcd1njtCGD4KFF/at2CgZPvi5dWH
	LUTFTP8I47c5h+poQ1hoO0YRRPL0qpuTbXaMi/H3q2HxWqQVY9HKRXj1eFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasc6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so612677285a.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188389; x=1788793189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GHoWBlwh+ZDFPbKlbwwLkJp6XL3wIYVeEUFlrZWxZg=;
        b=JeERJ9VFdwHvmspzblh0+IWAZr3FO1f+lF/PsuMN/vci38gH2ufmsBc60dVR5j08vs
         FwY5mBL9tqSnBRKBakk2phTNbASXV6zhNwJiE69qiDCYvRUnmyuHop/lhDdUXJCGnb75
         NiD7hDBnF46wNbu9jpyT8y3WHpWPq510TFjdHIuX9EMJia7xuJfIqsHaeQ6h3j0xH+h4
         K4KX3nCVB6bAc4jZ8YlOCejILL0oHRo67uJV8IMwYClnlwKmGwdSW7I3psxx+rvo7G6B
         HxfGCPXbgeeUKtQwcIi51A1o7DPaYMg0Lt903l6EXMt2u8jfqV7LuoNDdM+iPo8mE14x
         o3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188389; x=1788793189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4GHoWBlwh+ZDFPbKlbwwLkJp6XL3wIYVeEUFlrZWxZg=;
        b=gAaNNts44mvCPQRO01A3db9N9fj7NlVwHVNbKl8ZOnLWEpm1YTjdtKAhFpgM2IgvFl
         tniY2hBLSqNhAh0CSi/RNT7WQWbo4nONIpKmc0qW+c7NounPIapPPyf+6+A4C91VcurJ
         bCpYOMgAkyzjSUC8mx4SXgOUNtiJc1Ude2nZ+G20Yj3Wr+QlQR6P9QVWUv/B+5RxLvHx
         VCFo2g5Ns78GZcgUGCtLnvQnGRfkHEtODWlkCl8hIO8ih4/h90BOb1MG8AnOEQ+0id+2
         +zvpbeSPJd4S38Iq0u8lXpsIH4mk69oKTxFaHmXUKAw7uJG/E/outT/tbVN9baKTCBH4
         WQUw==
X-Gm-Message-State: AFuF++kSQnouwW41OUG0Mb1pZK5oMdGMwHhZKPtNVrRwCnVlrnjx38rq
	37UjvVkYHJFjviaMxksdLoR5funog+3X5tgu6vFTziM4jOXU50xeaiX5H4qQkR+i7QF8md3OAQL
	VHqm+21tcrLwcZRlUnVyBa78ossXgqd9frxTJC8Ryq01f2fAjlnc9en4WhiJjV31ARLgNrFMw1P
	GMMEk=
X-Gm-Gg: AR+sD10rG4fmvnxYDqa0/HMcS2gJ3Kpws8GAC367GoaSKfo24JLseW9olBx9whzS1pN
	OqLvExTIj44BviJsZ7t0jjJp78gMfxZCO1c4M/L9BevEvYPfjFpGjLk+QhBnUwA5rUkcJIhVhol
	IgeF14gdhw1HXo/LPOEkT6yIahlwAWzQfEzB35ZDzNokrQ6WJ7yoGmLh5ofFV6DVwvUSFvmcg4/
	vdIomi/C+hYW8pNB7OlOYyMXL7KwktqVsD3GwGFwG+yDHO3hPG3n6Qs9ny0jnf6drxVGvVwiw7/
	w53EYP0YhhnSrMzatYg5HKEhA/zDRGLio4iDnhDHR2Gp7BZOiqIuAwhGPI/NckjDA57N8NASd3x
	TkoN352qo07KWSMPFlgT6uktq3xSsIczRQCk=
X-Received: by 2002:a05:620a:8394:b0:92e:5cfd:154e with SMTP id af79cd13be357-93913801d90mr3156800285a.14.1788188389309;
        Mon, 31 Aug 2026 07:59:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8394:b0:92e:5cfd:154e with SMTP id af79cd13be357-93913801d90mr3156788985a.14.1788188388672;
        Mon, 31 Aug 2026 07:59:48 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20713sm22270269f8f.21.2026.08.31.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:47 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 02/17] iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
Date: Mon, 31 Aug 2026 16:59:28 +0200
Message-ID: <20260831145943.313726-3-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX2X64VKpbvMhe
 7lgf1PKBRi15PNBz2RumkTsT07K4s4aQ4kE5llzsvv7pHRwbqpj22mMluvXink/etSAsHhopXz8
 NqFzBDDCiDfLjwCuTrljUVY8nOVUNCk=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a9596e6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8L5tTrZ4L9qXjquGIIcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXwPIpiU788tBZ
 rAf7j2PVoRWI08fHxXLbJxsHlLjsQJHIlKVHUJSRvRRDlO5aTgxIld2Yl+56RxuDYv/6zKH/29d
 g1rOIxEoKLjAG3baWW11mMMpVEIqbncq6cSakLNFFCwL8j5AOC8QKkQGTGaWMFIvCKs9hMJaOJh
 UJBOpkMA7QVbgcF5zrEPfIio/L733bhMxEwS5fbzJYA0C/uO7ikXW23JRk5hfIiXnREKLDMS83R
 oxdY5VQBwzSrfzVVIBnnYKHrOR+OYS23EW1SVbrianIkSd6mHm5FWxJBV+eh+KGchcU3klo05t+
 gxDZHlNjmFDGYFvmK+rNvUCzs8NDH+K/8ns12L6t7m9SvWhf5f1JKsVne1vgJPSJKySHTICzi9u
 GAMMZbsVhwqqhmD8fOCL8p3jk1QKPUnXK/V2Y2xi0vO9TzlK156jojV4XdUHBqsbyfUEHZ5fhTf
 abD2E6g8xA/Mws8zcZQ==
X-Proofpoint-ORIG-GUID: lRYMh2apZFMl7BPMRpL2U9gz031UmWuY
X-Proofpoint-GUID: lRYMh2apZFMl7BPMRpL2U9gz031UmWuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075951_416614_66B7F968 
X-CRM114-Status: GOOD (  19.85  )
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
 drivers/iommu/iommufd/driver.c          | 37 ++++++++++++++--------
 drivers/iommu/iommufd/hw_pagetable.c    |  1 +
 drivers/iommu/iommufd/iommufd_private.h | 41 +++++++++++++++++++++++--
 4 files changed, 66 insertions(+), 16 deletions(-)

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
index 3b8067976eac..d0b05b1fda42 100644
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
