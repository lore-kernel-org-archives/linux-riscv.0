Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D0EC98325
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oB9cRL5Sd3Mdi0S8epRdaTS3vBzAE8eFiMTnYx90Umg=; b=lDFNE8/roRloan
	ip8OB3I/6z3qrkkumAxUGPl7qsLaSFVDa8h/MpI3K3Fj0qFNytAwqbs3pKTcmsFhhmdo8qnMKjFnq
	xwd4lAH59wgzgxqgekYfDv+R3VG4Vp4LoezZO8YKIY46KOFzIgo3z3NavYcP76K+/HT0gaoOC/1cS
	iR3lF+aMG859GwXYce9dNBrxC2CPPG5QxBRK0ndgJkqkPSWbjO5anYwflRSUkSttFtgpzJsq3hyBB
	0mLLIezfGNXtq1a3vgS3+v4Nz2f9gpO++XUJx5+MCmax28kFpo4/OJXVkpaRWZW9Y+LzcEDL7cSwI
	nfgEZGnjykt5rzrLsRHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fo-0000000Djq0-2pTo;
	Fri, 25 Sep 2026 15:17:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fl-0000000DjnZ-1OEM
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD7jdL208631
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hvxVWxCc7aw
	cPlTR9VMTluUHGn7pX4BoP4Q1ruBu0pU=; b=NmxhIv0/XGyNBriub2ztNnafrhZ
	nobcuyR6cFM1nWq8zcPqTsMgvqV8JFfspMhSE6JKvaq8c9/TXqRW12Cm3VPeSwDU
	O7zVX1CL6Sfy2LlmzYPA0xvBZvwvusMyoeHlT14CLanUI9F7cOfDhC72jJA/eBz1
	+ggp0ql/G0Sqr8zABPWcDvnl2ilL58I/xrOeLXzLTq4xYioAWVzr7+rbyiksQ4kS
	TvQGVlK6RQaA1NBTvJQ+nmYFQAkP7/snlSjQxuFJ16gcHz0B4KrDWT0j4raSmBIg
	jBuPj3vrgLBRGprvJS5QziU4JWlbUoYv6GjLrmcYkEsJk8aILI7cY1IRfqw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898v3ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78faf713ab2so211351137.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349432; x=1790954232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvxVWxCc7awcPlTR9VMTluUHGn7pX4BoP4Q1ruBu0pU=;
        b=EuvaHhCzCaMzT9De3y1Yqulzvuc3iHaY8KBdyvoCKdj5OwSTKq4XGyArAy8kW8cmpq
         pOEuphYt++PFd4iasS8EI2Uc4rTPtCUCPeqlqoQlz/uBVPHRRY9NbGe+iBFbRsGwb3LF
         u8WMCgIP3Px14mAnQTw+FrQDAhMKB5hF5Jcr1zFIxyzETkl46Pmluz7B8ZFLx2WuECBb
         vCNQ70ffBedJPEVDE/b6YrEq379RkjlrxGfwPioB+Q/Is82DcdXbldQ74nuwOhQC0FN5
         vq+L9Uw/9pGMeTlwRRIOtDUTTUqt82ihxNjHyhgqWrzRbbIusLS54vy4RsZdJ0T8EyWE
         WbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349432; x=1790954232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvxVWxCc7awcPlTR9VMTluUHGn7pX4BoP4Q1ruBu0pU=;
        b=foEWXSguWKYdmEmAo2qOfzL6SkzyfAUz+zGbe0BDyg+mxKBQDX1KEmzKP7F/fXf+Dw
         zQrvn+aCkbaaU9/pJ/HBvRsUcPHgT4ACwEerdMJBGLX7syeHoSnj88/t1cPZPDqxntZW
         EvrW60rxT7khaKgOOD56nmvTCVdfdLHOO2LjDplCLbmKZ+HoatMhL1zlB3RLvFAMr3tB
         P6ooejJvSB8uYCAbgBBf2/556IFCM/VTnjImJppAoMlO9g+r5V4I73AHdG74RWm9t5G+
         52x4PKxJykYQjXfUgo6Ye2+pJtsgcgyOGuudNZ/OniMB9CZ0h+ZZifDx90mhTjbyE5XL
         lr0Q==
X-Gm-Message-State: AFuF++n1j9zNYTye0oVNC5221w/c7/addAsDrywVcoXmbPrd8lSwYqSx
	7bvCAtWn/O2E6ltCos01C4m4ZUJmArcOGBD0C1U7SoTNO1kcUPknU+sUc6IxVfWdpvHzwHNQEcY
	AqtNlHHmFs6QB+FyDm+OKCLkc4aQ0Da14w4nIBB/f4cAu3UeJeq6ggKQDtW2EbaZUh6VstxE/GC
	ab6bM=
X-Gm-Gg: AYBFou3yA2fF/qv7yIAvtgYad3oVlayBKkyeqyS57sUckRvQGLwy6LgIK+tTqyGQtWu
	1eFZn92XfUKlPqpgtH/d8IenTQlSAAnskrRJO6mEjPLJYhA9pxK9cg3Bd7yBHLk8a01/Sz2nO1I
	p9Zqzx3vBqIkj5uy9kHgW1/rW9+7ChsBhJ3DOBNzSv+rhthCzVO06sPDqPT3ogj4gK61/opiTwd
	/Ax2Ouf8Mk39bh18y1TT628/npUVFoJYJ4d9EF1hk5LFSJvrmz4kBEqDpSaSwXeE8BptdIjnWpp
	wkWsvEjpUkPAys1iyyrbJ1KhnQsQ0DUhVgmJpiFHHJgaMCJCZtY6Gi+GGWhN7SkufXX4EgpC3Qp
	R1/KTIDRYXValcuKO2Kiart98Yj2E7camPjU8VQ==
X-Received: by 2002:a05:6102:6448:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7af1e1e6986mr2152245137.36.1790349431717;
        Fri, 25 Sep 2026 08:17:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7af1e1e6986mr2152198137.36.1790349429718;
        Fri, 25 Sep 2026 08:17:09 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm8686711f8f.17.2026.09.25.08.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:09 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 04/16] iommufd: Bound software MSI mappings to the reserved range
Date: Fri, 25 Sep 2026 17:16:47 +0200
Message-ID: <20260925151659.419512-5-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXzPR5TxOsvFWv
 xBvDp0uC2Hr00KXbJWXtKjfPETqRhGA2PWZ16iiZLWvjVkCoSZ/kCaIXv9cry/QwPTMaX41tFRQ
 kUlIXTibNIaOuVGNFcQVYr9gJR9Ys0ON52d4sJy0PieV4L38RHfK5cQLPHkwPnrxm9up6REafGE
 rTLcxgWrWHuC2Z6s1mQ2qgVWOTB6C+/i7S+QLkuwanRDnvvBDsbpIqSC2+7qv3XMFbn33kXii3B
 j+fvuoD0w2KIpAMh24duTrti9mXfA4CoHqaYXHmkgYTCCuMHg6xQZ5X4RwbnxfrSa5nU/lDMfi0
 VuL64r3JVxL+5oG1cIip8HdZX5DXpUcf54pmikK1KymiIIl6tEcdYaGOnBD2q0T7JoiVVnHfOZY
 D2OjbZBG7rnJIgsoRrGss0UIiq51rEV/G6ID9IU7L2WEMpBeG+O37wlnuEKbKpINJHS4SmY9R6w
 pkV0WWeAqLnNjwwCEqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX/Q0bqX4U4xUT
 sMuGh9WtjX5vZQFKS4zS/PJLhZ53Nhi6pv9+PG1gOKEsO+uYUrIU8G6cwILcPT7EOkg6nlm+At3
 bV76N7q5gJqi38MvC9VphVLKhLKrTtw=
X-Proofpoint-GUID: AdRn0RuvfZnjgD5jjg2kvZkRUUwGgzP7
X-Proofpoint-ORIG-GUID: AdRn0RuvfZnjgD5jjg2kvZkRUUwGgzP7
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab69078 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=f1RXMQGm8Qq6PoD2gk0A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081713_382702_542A605A 
X-CRM114-Status: GOOD (  22.24  )
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

Track the start and length of the software MSI reserved region as one
range and pass it to the mapping lookup and allocation helpers.

Reject cached mappings outside the region and new mappings when no
complete page remains. This enforces the reserved region bounds and
prepares the helpers to allocate contiguous MSI address lists.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/iommufd/device.c          | 17 +++++++++++------
 drivers/iommu/iommufd/driver.c          | 21 ++++++++++++---------
 drivers/iommu/iommufd/io_pagetable.c    |  9 +++++----
 drivers/iommu/iommufd/iommufd_private.h |  9 +++++++--
 4 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 28e2c98ef953..2b12b25a74da 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -84,7 +84,7 @@ static struct iommufd_group *iommufd_alloc_group(struct iommufd_ctx *ictx,
 	kref_init(&new_igroup->ref);
 	mutex_init(&new_igroup->lock);
 	xa_init(&new_igroup->pasid_attach);
-	new_igroup->sw_msi_start = PHYS_ADDR_MAX;
+	new_igroup->sw_msi_range.start = PHYS_ADDR_MAX;
 	/* group reference moves into new_igroup */
 	new_igroup->group = group;
 
@@ -440,7 +440,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 	struct iommufd_ctx *ictx = igroup->ictx;
 	struct iommufd_sw_msi_map *cur;
 
-	if (igroup->sw_msi_start == PHYS_ADDR_MAX)
+	if (igroup->sw_msi_range.start == PHYS_ADDR_MAX)
 		return 0;
 
 	/*
@@ -450,7 +450,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
 		int rc;
 
-		if (cur->sw_msi_start != igroup->sw_msi_start ||
+		if (cur->sw_msi_start != igroup->sw_msi_range.start ||
 		    !iommufd_sw_msi_maps_test_bit(&igroup->required_sw_msi, cur->id))
 			continue;
 
@@ -480,18 +480,23 @@ static int
 iommufd_device_attach_reserved_iova(struct iommufd_device *idev,
 				    struct iommufd_hwpt_paging *hwpt_paging)
 {
+	struct iommufd_sw_msi_range sw_msi_range = {
+		.start = PHYS_ADDR_MAX,
+	};
 	struct iommufd_group *igroup = idev->igroup;
+	bool first_attach;
 	int rc;
 
 	lockdep_assert_held(&igroup->lock);
 
+	first_attach = iommufd_group_first_attach(igroup, IOMMU_NO_PASID);
 	rc = iopt_table_enforce_dev_resv_regions(&hwpt_paging->ioas->iopt,
-						 idev->dev,
-						 &igroup->sw_msi_start);
+						 idev->dev, &sw_msi_range);
 	if (rc)
 		return rc;
 
-	if (iommufd_group_first_attach(igroup, IOMMU_NO_PASID)) {
+	if (first_attach) {
+		igroup->sw_msi_range = sw_msi_range;
 		rc = iommufd_group_setup_msi(igroup, hwpt_paging);
 		if (rc) {
 			iopt_remove_reserved_iova(&hwpt_paging->ioas->iopt,
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 501f1e1f2797..c2ef15c2ca51 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -186,14 +186,15 @@ EXPORT_SYMBOL_NS_GPL(iommufd_viommu_report_event, "IOMMUFD");
  */
 static struct iommufd_sw_msi_map *
 iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
-		       phys_addr_t sw_msi_start)
+		       const struct iommufd_sw_msi_range *sw_msi_range)
 {
 	struct iommufd_sw_msi_map *cur;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
 	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
-		if (cur->sw_msi_start != sw_msi_start)
+		if (cur->sw_msi_start != sw_msi_range->start ||
+		    cur->pgoff >= sw_msi_range->length / PAGE_SIZE)
 			continue;
 		if (cur->msi_addr == msi_addr)
 			return cur;
@@ -203,7 +204,7 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 
 static struct iommufd_sw_msi_map *
 iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
-			 phys_addr_t sw_msi_start)
+			 const struct iommufd_sw_msi_range *sw_msi_range)
 {
 	struct iommufd_sw_msi_map *cur;
 	unsigned int max_pgoff = 0;
@@ -211,7 +212,7 @@ iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
 	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
-		if (cur->sw_msi_start != sw_msi_start)
+		if (cur->sw_msi_start != sw_msi_range->start)
 			continue;
 		if (cur->pgoff == UINT_MAX)
 			return ERR_PTR(-EOVERFLOW);
@@ -219,14 +220,16 @@ iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 	}
 
 	if (ictx->sw_msi_id > IOMMUFD_SW_MSI_MAX_ID ||
-	    max_pgoff > (ULONG_MAX - sw_msi_start) / PAGE_SIZE)
+	    max_pgoff > (ULONG_MAX - sw_msi_range->start) / PAGE_SIZE)
 		return ERR_PTR(-EOVERFLOW);
+	if (max_pgoff >= sw_msi_range->length / PAGE_SIZE)
+		return ERR_PTR(-ENOSPC);
 
 	cur = kzalloc_obj(*cur);
 	if (!cur)
 		return ERR_PTR(-ENOMEM);
 
-	cur->sw_msi_start = sw_msi_start;
+	cur->sw_msi_start = sw_msi_range->start;
 	cur->msi_addr = msi_addr;
 	cur->pgoff = max_pgoff;
 	cur->id = ictx->sw_msi_id++;
@@ -295,7 +298,7 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 
 	handle = to_iommufd_handle(raw_handle);
 	/* No IOMMU_RESV_SW_MSI means no change to the msi_msg */
-	if (handle->idev->igroup->sw_msi_start == PHYS_ADDR_MAX)
+	if (handle->idev->igroup->sw_msi_range.start == PHYS_ADDR_MAX)
 		return 0;
 
 	ictx = handle->idev->ictx;
@@ -307,11 +310,11 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	 */
 	msi_map = iommufd_sw_msi_get_map(handle->idev->ictx,
 					 msi_addr & PAGE_MASK,
-					 handle->idev->igroup->sw_msi_start);
+					 &handle->idev->igroup->sw_msi_range);
 	if (!msi_map)
 		msi_map = iommufd_sw_msi_alloc_map(handle->idev->ictx,
 						   msi_addr & PAGE_MASK,
-						   handle->idev->igroup->sw_msi_start);
+						   &handle->idev->igroup->sw_msi_range);
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
index 4e447ce74cf6..0336d8f0908f 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -1579,7 +1579,7 @@ void iopt_remove_access(struct io_pagetable *iopt,
 /* Narrow the valid_iova_itree to include reserved ranges from a device. */
 int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
 					struct device *dev,
-					phys_addr_t *sw_msi_start)
+					struct iommufd_sw_msi_range *sw_msi_range)
 {
 	struct iommu_resv_region *resv;
 	LIST_HEAD(resv_regions);
@@ -1598,10 +1598,11 @@ int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
 		if (resv->type == IOMMU_RESV_DIRECT_RELAXABLE)
 			continue;
 
-		if (sw_msi_start && resv->type == IOMMU_RESV_MSI)
+		if (sw_msi_range && resv->type == IOMMU_RESV_MSI)
 			num_hw_msi++;
-		if (sw_msi_start && resv->type == IOMMU_RESV_SW_MSI) {
-			*sw_msi_start = resv->start;
+		if (sw_msi_range && resv->type == IOMMU_RESV_SW_MSI) {
+			sw_msi_range->start = resv->start;
+			sw_msi_range->length = resv->length;
 			num_sw_msi++;
 		}
 
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 774cbe28cbaf..af7df868dd4f 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -22,6 +22,11 @@ struct iommu_option;
 struct iommufd_device;
 struct dma_buf_attachment;
 
+struct iommufd_sw_msi_range {
+	phys_addr_t start;
+	size_t length;
+};
+
 struct iommufd_sw_msi_map {
 	struct list_head sw_msi_item;
 	phys_addr_t sw_msi_start;
@@ -181,7 +186,7 @@ void iopt_table_remove_domain(struct io_pagetable *iopt,
 			      struct iommu_domain *domain);
 int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
 					struct device *dev,
-					phys_addr_t *sw_msi_start);
+					struct iommufd_sw_msi_range *sw_msi_range);
 int iopt_set_allow_iova(struct io_pagetable *iopt,
 			struct rb_root_cached *allowed_iova);
 int iopt_reserve_iova(struct io_pagetable *iopt, unsigned long start,
@@ -531,7 +536,7 @@ struct iommufd_group {
 	struct iommu_group *group;
 	struct xarray pasid_attach;
 	struct iommufd_sw_msi_maps required_sw_msi;
-	phys_addr_t sw_msi_start;
+	struct iommufd_sw_msi_range sw_msi_range;
 };
 
 /*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
