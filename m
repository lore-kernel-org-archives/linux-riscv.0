Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52350C98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wof6ViL6LLOixd/3GRgApk8qJlD9ZkoEETCHSry0SQ8=; b=23IsKEzQ8nkiIP
	o/y13Q+B9BWJA9T5RilgQ6D7JMY6AY3AE7g+O3Ei7A0s5agq/X+DWAWf/Sg3s5sxOwD1PwSrunx5n
	LrOJjXMOyOgQj33srNJQXuNbSCRxgxVAph4IFg80hwFPM0b5WCMDV+cIMAHVwLTpF4MWCxssQySqF
	sLZzYI7T4U8q1ktLSCUup2BpluB5m7XWAjgzelNaHwchpgIT7UnZejdipKIVqdyUDBQXOBPPIZSvJ
	qiW5sqID/fCiFoWRZM4SlslmaQ6iey0xkcg9WqhXb0G65MjLDgg3jq5FNmQgtBLprwmskl4rU6fvv
	w7bRI8ZbQmkKAeXF5aQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fs-0000000Djso-2aX9;
	Fri, 25 Sep 2026 15:17:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fo-0000000Djpf-08NL
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA48k9609035
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GkUPFWh53t5
	B1pacQo9bQeDytgQRc2XAp9x9CQAXz9M=; b=CBTDVzkwbQvAmJVtPNFkvezmnAF
	cY0gxD0kp2Z2yKyr5/zpv+w3B99pFhxzDOSl76QAvgtLwiaDG+/V41OOSBmgf4ZI
	TekBJlY8Ul2m/k+hxOQt9XnturdAl6OJaLKDLwPjpjW9X1wHkP+EgsHg2Z3XI8Qo
	Td6knKbLuBwiFle5O3s2qqObgumkEt+LLqPeV/uZqHy6ttgvKNdhNCxwkyItC1dm
	kzdU6uop9nagF0hiBuSiek00bBOSMsasXFngjCLzPzeqWWdYCjCT0e36tjIEdVho
	KbdHTJ+RHZzGya6N82W9HSVgC662cOwc22BLmcj6NL18IJIldd56FbQvMLg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvns16w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7ac2663eba2so702732137.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349434; x=1790954234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkUPFWh53t5B1pacQo9bQeDytgQRc2XAp9x9CQAXz9M=;
        b=eDrmriZS8bdMzCwsDMXAzp0mDM/GZ10/nL9lW+Mw823T1m9Hd+/niZkWF4OHEEhZOI
         lb/RvM4ZVp9yfvCHPuco9O1Ff2vGpIk4XYKM4iC/sS2wm71DjmivKEEOwXP9bAS1+JyN
         YQzczy4o5WrqEQzZhXDGS7fJJIcRPqJLKZ1y2O6zITPp1c55zGx9hIOc2H9O9pZjRH9I
         CrfH/niudN2D3Xvhb8eRgUolai8T28q2YKeUYvnB2FqSVbLZ/sWiJfh2d2hkwfZnzS7t
         6i/EF2c0A5pH9FUmh8wFD2S6tCmIjskpm1rCq21Lc+CVUQ4UVrmPQT7AmJR6SKNPxsK4
         yBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349434; x=1790954234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GkUPFWh53t5B1pacQo9bQeDytgQRc2XAp9x9CQAXz9M=;
        b=sv7yl95JYVeLlkMa8TvHo0w7qTCnJdC2nHzYWX9C3lEK/vhjpnFilKLCiUFDUS/VvM
         PgnEv8BDPqC9boFqSKU/oxReqTBhD0wQwnZs3Y1++n40H8W0KoJ+0i7lSTowfYeySD9o
         HUUut/xR97xC8INBJjIYleQTZh4Bcfi2u7ExEJnGM0WCDVxsbrMnxoTEvMvgXlxbyMYX
         U+yH5fZ1/+f/lFUshqSw/sr/IrhKSOamFVSB2HKRe11Kr7ri1aIpb6hvDOpj/hGVUQCm
         mkmb2GiB9R6vWgq1jolIFb772W65OScqFBgLhTSJnJ/4PJHawuZEXBMg6De5N1+mF96j
         9LZg==
X-Gm-Message-State: AFuF++nUT1VvMsi53oNLxz6otY57ONwxnW0qbbj+ew4ul9lExEvhPzqz
	Yi7qu5bTChMvDZfAKvQZ6uxFdhOykP+xCfnbuLnnRJuq84C/CqHy3gLCYg3SA3srAgkhhNB75W8
	zkoj0bAmffduQiGbAASM95Ql/8ib6bxhMgiXkFYqH+ftO4r8K4pJFnj/tnR2qNzDjuz7xzkmphE
	QzlIs=
X-Gm-Gg: AYBFou3ZyJHa1pe6Dmahlp1mWUSRhmSF+GoMAvAQ5O6g3xf+ae2qqdaL6R4Z+kkzkhY
	KumcueSvzRRdiRHPd7Byfc+X62msVxmkVhc9Xyh3d89sl2+fuVird5DQ+PlVlxFi8u3q5dN+VEw
	zEIKfWMHgDu2NP4TFr8TVSrgFu5xj4glDcZisv4TOExQSOanbawK+z0nhSv1Z9q6Saf7oTAZ3zQ
	FFY6MNv+1ts81axYVRBmNzI/u9CO6dsSGpvVxIsCt+pHxcdWlURyeD4oBcCni7MeYImpWUWO9cF
	jQNrlq3vqQV+UIzVKca0Z79sNVDOeZfApf+BvYEaNVxf9RarY17L4ssfU0Q94r2yDDPATqhkUKJ
	3rB7a2DBLlljLkUSnfE/izUuwmfoVVBVXK+vAfdOBky4TVZ6v
X-Received: by 2002:a05:6102:160d:b0:7a1:f7e2:aae1 with SMTP id ada2fe7eead31-7af1e6f3633mr2841424137.19.1790349434291;
        Fri, 25 Sep 2026 08:17:14 -0700 (PDT)
X-Received: by 2002:a05:6102:160d:b0:7a1:f7e2:aae1 with SMTP id ada2fe7eead31-7af1e6f3633mr2841410137.19.1790349433786;
        Fri, 25 Sep 2026 08:17:13 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm176773155e9.3.2026.09.25.08.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:13 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 06/16] iommufd: Install software MSI map ranges atomically
Date: Fri, 25 Sep 2026 17:16:49 +0200
Message-ID: <20260925151659.419512-7-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 9mFclKI4ou96IrXiUmWIWTjyRliMuZdl
X-Proofpoint-GUID: 9mFclKI4ou96IrXiUmWIWTjyRliMuZdl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX+hQDYoH7MDoc
 VCcqtqFS0P16QB/mlZmhPNsYw2ZMhktfcNmOkuwnMW3teZltdI0YzYtwRRt6WAM3pzxQ/7YsGkN
 BPOqBgOO0VpaUE/kFEXvVEIT8pdh0hk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX8NWz6h1hl4nJ
 0XAKu1/HlniYI0PZIyvjeOc8tE7VHfNi+ZUDOmDzYb9FXpAO2F/n+7cQ2YFpvtxfAIcsCeRzCeL
 +NOe1cE2nRe3/u5y48vWBcE7U9wAbLpsMH8/7ANZgwVJbDJHQZeK4D2OtyxYqfsjZ1RE3X2mOyz
 WrYJCBRG9CY1zS5SxagE/CSmEomcQfbOtXB5T8Ci+vXirqJJeOmM42eCVTjp5prStYxUNmeqQ76
 QY9lRls4ZVVcoWa7Khk+DwzPZ1AkbHhv4GQ1eQT6Rl7TBr80BLWdsqcYIh8E3dWXUuI5fnqil5O
 I9u2nUzRiyt+bDuC82cQ13bryAJTYJiNld5s2W5rDdvOflXSBzzuryXa6og22Bf2iI0zbNX+b4o
 HUZ/KIRLwBUVKSwpvDy9qrQRqpStnawm3qNk4fDB+RuT54OsjYtVw4PsUEH8fTHJQ77yUfqWq+f
 1uYDZH429/acLKmgb7w==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab6907b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=0NqqyPg6VgUUedX_kk0A:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081716_202350_8D43CE5C 
X-CRM114-Status: GOOD (  18.47  )
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
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/iommufd/driver.c | 76 ++++++++++++++++++++++++++++++----
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 8b8f132ef3c5..3aff04d9dd04 100644
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
