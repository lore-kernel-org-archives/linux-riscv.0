Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BECCC531FA
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsCkgDIVZJTksmAKWTlo4Yvk++0u58xFgisLJIruW1w=; b=i5w905VXtv/CHt
	1Ut6RCgnv6qwohDhGRwpiMAFz0dAHbrOnw6T3LS0p0uRInQDrSnPzRJPtzJWPLUI8ISmQ42jcm/n/
	VzO14t5Z/IUG98505xl8N5U1WTkxVqhONhTESqFdrFcl7RD4oivLA1SUU0Mevyz839RdXj/HwL50J
	MZI3gr1B69oTj/RWC7spj8fYniUYrGhgvFbaEeDSfDCjmgR03/PheI+FvOLEDxEPHywdlFj+UnGmg
	jZDZLIrBsE3E0Sy1I352t9oR4+xdl92qR/k/VDnoFZj6yTOp4QA90paMYvNluWEfntAHgZoe9bO5U
	NY7n6E7273ZFIe+/iLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZd-0000000GexF-3XiN;
	Fri, 24 Jul 2026 15:12:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZZ-0000000Gev6-0JLb
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbVvD3308733
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I9ymIHqsyxx
	hhaBbMc+ImuwfKCQrL/f6dTJMEU/+0QI=; b=aEi66ybTT4gQcNl3Oh1l4ZbQZ+p
	DgBW4F7h2+QPUTtt7NYsLOycZOiW6LUsgczdW5qlOo/qMvwVIamGP3eSlYNwv7DH
	soEircOb2HBQM6ALLNoJA834Uxhq02RxzkCm3Ml0HPeybHrJsTrAGKVSYnpNRbqY
	6LZWB2cu4BXBeH01KgakefP/pH1F/MPjhDqn46+bIgwtS60UrahASDQJhoBKVZIA
	eZ+SKN10bGxFiEjrFTPE3rXbKS/KGhjWfYnPYjZpPhaZb4nMk0oILzjxlmXzKvJC
	jF0RAibKSahRCEFyFcLDRWiqiXGhYsMAgwVr55uWeiC7T+e34ms7nkqbhvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahujfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so8702871cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905943; x=1785510743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9ymIHqsyxxhhaBbMc+ImuwfKCQrL/f6dTJMEU/+0QI=;
        b=b95KBtotIHP02L+ZZBvCOmH1ClnC24Tof9b3cE8chIKPSFFbVI1eJ31+3gD4iKE4KY
         2OUcMs4UyTGB9oR8OWSCiV5/f9xD2RnDqt+/YfH6cW2hUjEWQPhxplCNxjz6KufjliCH
         q6ykqVexsumcdJaYVY+QHvZAOceQpWIIMwBZi3ijmSXaLZky2y85THs4YT52rp1cfutI
         JXwxrO16UiiPekwa76ndcwTKMQBtFHyuzX4bp9gQ9ubuZ7klUYZMbrgeNyhLCnAoBrFq
         Gv2s10FhoWrsdqqfYkvacjg7XxZ5SnRXbSINywQ+C6Zg8lOqVD0anRjp0owaMfSEAwnt
         RCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905943; x=1785510743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9ymIHqsyxxhhaBbMc+ImuwfKCQrL/f6dTJMEU/+0QI=;
        b=HFED8Z0mkRftcrwoT1X1ECobM0B8aM3rMBp4INxmGfTydkBecc/iaowSQ9Yn2p7RzN
         hAIy7fSBmiv3akTusbwBlJQNTq5fLFebUoh+//XdCIw7A2Z5yUQkyoTL/HIrzPJD/V+r
         h9tAKvY+NLEAwWYU3w1+QfL8LnhOVOZu+Ef2itYtjk8JxUar2Dc1S6X90BRGHpDJahqT
         cNxWegIbE4wJWd3r+ewd29g1G2Jf/OsjSnX0n1RXC58RYWS5h5/mqisdN3evI156bg9T
         P7VGbeeJK+V952LbhIhmX50/FEJxhqCXEx6y7iSqynlOnIck10dAv9ZsHMD1IMp27L8A
         XxDA==
X-Gm-Message-State: AOJu0Yypix00F7a5Md1v1q18GfOgGjzQ2QC3JcV5S/4kTdxUPU0Gs22A
	T5OJr/rWAnNdNqiuc/VYqllaLMiK2tKuyw34rm2OJbsT893pHayPLHQvWpUEInjhyPQCLSt5qVi
	gMmB36NCGxhb1GzMgPuzzE65mPJGPk4NmQASMq/kSeC5WAjZzmRVHJjbJlMpuUoGzJssiScSlfB
	tGAEc=
X-Gm-Gg: AR+sD11mnoJMAdxUJusBVVJTZ4Q1SOdIJ4SENjV5UeRttIxfORhfT2FXxzESojzUnap
	BLVlEi8503ENsW9bCKx8MzWCZV142l0cluYtJ9YtBYXq9FNwd/ZOGHFNYxMnIasxPFzJ/xmnVSB
	r7FffQBCIRK2Umd5cWZuzkzeH0FMhGTWdZAInIOD2P3ldm4owV3FKBR3oSzyiodixVUxffP1kmh
	H4vkQgpXDxGeaWG+RhdD3sCkejm5++ioFEaCyI4MrXKLgqP5k41Oy/EKhAcqApV9R7JreonPVLP
	X/C639fLk98b5eNwkMU0AS38VnfRKzSJeKcdaUkOOw4SpBzsZ+IrNtJCaE0CbP3GhTMFnpCsAOc
	c/9tKzqZbJ0tCQjaXYdNElVTbhEjCxpZCGRGc
X-Received: by 2002:ac8:5a02:0:b0:517:8011:3a4d with SMTP id d75a77b69052e-5283de1c0ffmr71497631cf.20.1784905943374;
        Fri, 24 Jul 2026 08:12:23 -0700 (PDT)
X-Received: by 2002:ac8:5a02:0:b0:517:8011:3a4d with SMTP id d75a77b69052e-5283de1c0ffmr71496931cf.20.1784905942571;
        Fri, 24 Jul 2026 08:12:22 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1d0a73520csm74444366b.1.2026.07.24.08.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:21 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 01/14] iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
Date: Fri, 24 Jul 2026 17:12:05 +0200
Message-ID: <20260724151218.965929-2-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX4yrqUddeTg0+
 SkWFrEvkJ7pwMSbJ/zTHUPtooXmenSsK70wCC/nNU5q95Jzas23Zh4mJSZCjx4J1VGCGRiPn9f5
 khb+Aot8OMc2OWY/U4A+sR9b6fk4urg=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a6380d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GdI9VHRvGUSwsDbnIz4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2LcNWIgwNfwq83slsEdwZYJgqVNUDNp3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfXzCaFstAIGoGi
 j8zU5AYa6mGxUPtmh3v2PE2hJcA8PWrspJxPxAW0NZ3BSNyK7Stb3EXlo7rEQrbda0B3pHXAxX+
 qmu708OIWm6D1tqCn3jMI72CMifWBq9mvWY9wzX0H4lLU5dOlrSHvPKO8DFHQOWzqWQ0erQzHil
 t9JlVug4ahPWE/NwLIKmDZWtIlC9pUMJruARd+c7CiT9vVHEEs+GGWpvlue4o9Li89cAcg42kG3
 fB5I/qQmOw/Dyr3q9FO1MnTORLb4+966wsLHJZ8b8ulcdiNnbGBkLHb+jZKdX4ld/NjnvIzcr+4
 fBAolKf6sCRi7XVJjcOwvYqWT0yJ9xyOPp0x7MTw0XFUUVNRLLxsOKXR0FQgITDWwI/KNE+DTNb
 qgFrkG7iClNWvSqMt2oePaaYe/j9iRdWbPAeoczIkr2uUU1wQcfkWp35S7tdCDW76wPGvUqriEK
 K4WQKgx/DsMuMbDYjQw==
X-Proofpoint-ORIG-GUID: 2LcNWIgwNfwq83slsEdwZYJgqVNUDNp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081225_231480_80BA0282 
X-CRM114-Status: GOOD (  18.73  )
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

struct iommufd_sw_msi_maps currently uses a fixed 64-bit bitmap,
capping the number of distinct SW MSI mappings a context or hwpt can
track. An upcoming caller needs one mapping per possible CPU.

Convert the fixed bitmap to a pointer plus size that grows on demand
via iommufd_sw_msi_maps_ensure(). Add iommufd_sw_msi_maps_test_bit()
alongside it: unlike the __set_bit() call sites, which always follow
their own successful iommufd_sw_msi_maps_ensure() call on the same id,
iommufd_group_setup_msi() tests an id from the fd-global sw_msi_list
against a specific group's required_sw_msi map, which may not have
been grown to cover that id yet.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/device.c          |  3 +-
 drivers/iommu/iommufd/driver.c          | 38 ++++++++++++++++---------
 drivers/iommu/iommufd/hw_pagetable.c    |  1 +
 drivers/iommu/iommufd/iommufd_private.h | 38 +++++++++++++++++++++++--
 4 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 170a7005f0bc..402251c7b887 100644
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
index 3b8067976eac..3cd617dfc351 100644
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
+	if (ictx->sw_msi_id == UINT_MAX ||
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
index 43fbc5bed8de..44d6dc94fb6b 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -29,11 +29,45 @@ struct iommufd_sw_msi_map {
 	unsigned int id;
 };
 
-/* Bitmap of struct iommufd_sw_msi_map::id */
+/* Bitmap of struct iommufd_sw_msi_map::id; starts empty, grows on demand. */
 struct iommufd_sw_msi_maps {
-	DECLARE_BITMAP(bitmap, 64);
+	unsigned long *bitmap;
+	unsigned int nbits;
 };
 
+/* Grow bitmap to accommodate id. Must be called under ictx->sw_msi_lock. */
+static inline int iommufd_sw_msi_maps_ensure(struct iommufd_sw_msi_maps *maps,
+					     unsigned int id)
+{
+	unsigned long *new_bitmap;
+	unsigned int new_nbits;
+
+	if (id < maps->nbits)
+		return 0;
+
+	new_nbits = ALIGN(max(maps->nbits ? maps->nbits * 2 : 64U, id + 1),
+			  BITS_PER_LONG);
+	if (new_nbits <= id)
+		return -EOVERFLOW;
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
