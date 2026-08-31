Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E41DC624CF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkQv5QabSGcPXdMUGacmmLNLFHzBTrzkBeCILh9WIJg=; b=Un7hJNxr6q/LW3
	YVE0XG5YfDR8EdDI4lyvQKmAg5hQYhjs/bwfdXYjOTizYKJiOB3Hn3c0FGRvO2NNCeQfWoAfq8ooV
	+9la7z0fNFYOFendUwArWVrqICb0zf/srcvHn5p0sLQxcaVtpkQUlOHRhyO5x3Ryojr69toAAn/B/
	WWvPcF4kwKG2s1C+rU+c4gxRunihjZNetrlhsqS2dhnJUcfDtufuq6afR2yHnRMG3drSBXP4TDIfv
	3gf7EP/ZE4ZCkUuCpkEDyA9bggW+w7z9vd9eGYfnhfb8MzWTtyqnO22tljF5rN1L2hyFAy+JiGZBD
	oaT9ohf+9EcmORzOJySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UL-00000009kSf-37HO;
	Mon, 31 Aug 2026 14:59:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UI-00000009kQ5-15mE
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 14:59:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETaha3808063
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fxkNrhhqMRA
	B4rFIf0pTSCklWbzV8gUXV1JpOe0FY+8=; b=RvXpdNAE2cruLbkqkfxY2uJJ7qe
	8YgKY+ej+HnChSaYZRAlqoMtNyrKigQ2JuoIEybQz72C+3L1+riY3eFIF4JJe9lZ
	z8ToTP/Ke0KDD1zQVySqvTtk41KeWwR02kEHQ9NB4LYvVaDyqdT0XFe2Efg0bNuu
	GBoJQVor8XzJWT+wKfvdFTjzlXCWLXi/hZRAgG3lweitmRd6JYeym0wMbP6iKuP7
	NZSPP6VbwIqhqrUQIC8BZmo7TFQ02iCjuvkI7p0nIkkZpqHTGvU226R649R2ErIx
	bIJRIcu85oJ9JWPGFqCD2mSdB+vuMY/0ry+GTb4+0cW/4Hwu3MwU2IgM0qQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wbaj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so498927685a.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188392; x=1788793192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxkNrhhqMRAB4rFIf0pTSCklWbzV8gUXV1JpOe0FY+8=;
        b=RHk2ORv1AGedjnHj+O47926x9IZretxmMTus4oCIeyC34cfZTGtzqtUzO/S8rEli5E
         YnupEFTATejLSIrokbZkJMawywY5fK6wLgdDC822XpCDhYXgO5rJsul25OEpPzwgrICC
         M4M5IGiUVZdppqbr4UngfN+P22lLMrLIOLVLyG0ZlBKKQsQxwCgbSB6/Z6di/eA/2QRL
         dVtfixmlBNJ7BKbOMtAxO5wMChGsAejqMgGu8jf/qxAcJ1RFZpHQo+2ymqWlviYUQg3y
         mTW2euB2y2cQY+76pOulRfNT99KVtUi4il4ci0yA51AKk1ADAYuq5yGMsy7aBoOKSDrM
         dbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188392; x=1788793192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fxkNrhhqMRAB4rFIf0pTSCklWbzV8gUXV1JpOe0FY+8=;
        b=cfD/WWdZCvv60qWYhwOn6agprozgDxYUuuAZ9jtBqXcwqXdclQib1uH2+VyD779l/r
         aJ0vEFH65LEN+YrK4qHfTY/gkKeZZ+1alWz+eVNDkI/3172sN1qNQWRyVvmwUYtDMX0C
         MMh/BeG61pQnNbZHXi8xpL8kVnjUuLbTjOc7MAZOR45me3AFVHyl+M25cxoa0IoMdPFD
         M0qq6zLyHe7OFfgoWNAXDiRz/x9zLWLqKPoDct9xCj1xg03F0AefmqqJzwc/KP56WXGV
         kc5ZdlvvPOQjHZXELVe4goMs+TzNL1LnCEx5z3TjkMR5GsB0BQkayzoqitVbwVGjFwaR
         6hxA==
X-Gm-Message-State: AFuF++k3IzuVjqHMNsuvUi/tGOMWqBnj2fNO/Ff3S1bU8yfCsl8o+JvT
	OXRWPtqdh0VZyaK3GHmDzOqjuxvTdNRJzw94Y/7xND2OdO1dZP52KTvp+rpRUw50ev/tjUWBsD0
	c27lgfbcKHCU4iozhC/E1dlggeEKlQBd45/B6D4R3Wgklr6Ct4/6VLdP0JVJqauYKI4yoIphu2e
	J/RAE=
X-Gm-Gg: AR+sD10IdiPk5/GIV54mmCrKNJjnzx3YmSXvJFWHziJ+CAtV02ld3HDRoGs73dERlqM
	n1rIFcQvR5bwq3fccPC5zdDhWqfupK7R/QlnEi9SNyHw5hE5dYzxTWub7PFHyf/TWz1NdC8WphG
	yZOgxjARhosuBrNzUqo/oLwTJLwCN+zgkS2fAEY2R6nRODMUV8hWIhSWNxUOUHMwxhXjrzboL8s
	0D1WV8ZVFH7hSliPnj/Ec7NOD6oIhBpvrXmpZ5G059/wSQhQ+sdJifML0/lTC+eJIumNiJ1vo5+
	P91DwndsooLieD56Qor/0CwCp4NArF/Fzj0NsegVDW/DuK3sCDy7iyZmhLX8ccWz8U0IOZlaS30
	wVgIXtcYfIZYHghd/t2zug2tk0tu+q4VXk2k=
X-Received: by 2002:a05:620a:55ab:b0:936:afa0:3661 with SMTP id af79cd13be357-939138df41dmr2317226185a.36.1788188392442;
        Mon, 31 Aug 2026 07:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:55ab:b0:936:afa0:3661 with SMTP id af79cd13be357-939138df41dmr2317220285a.36.1788188391905;
        Mon, 31 Aug 2026 07:59:51 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm526216835e9.10.2026.08.31.07.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:51 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 04/17] iommufd: Bound software MSI mappings to the reserved range
Date: Mon, 31 Aug 2026 16:59:30 +0200
Message-ID: <20260831145943.313726-5-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9596e9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=f1RXMQGm8Qq6PoD2gk0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXyB8wxWT7eqhc
 3MyWW2z+zyAL/feezIx9R9RYmgp3qANNsBHTaaJ5hYBQ+O7BRu5/zDawiAkVdD+Wbno7k/d7Gev
 BqzwxCCG7+LXaBVTcy6H9erCatDtrus=
X-Proofpoint-ORIG-GUID: igVeuDpSqje3iULXQpDVL6dqAV6qZV-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX+AfdVwbPZjJd
 MVfapByxcz+cEeceLxVqrzJGZyubCfG+ND0w1eOIWYnuB/7qDzmO57zGQNU6B5mvMSbEFK9SNiS
 D5ncAjocMiSKkmlzCCX8hC/GRMmzB/xAobaVXxRZKuS/i579zrrmXAsp4solQSM7ANbC8HLzait
 OLc1KHPKhqePTtFrvXy2dlrNtpcGHU++Ci/zQmyktmhFiLXL5OBOVq1UC9hHifyr329P7YvIaDq
 kg0E+knHmCGlMh191MeTZ6fDlkhPY0NH301KD3Gv2fRFFvobk4HQ0E3yAvrfLWdtVEKuNtnp0Sc
 I5XqHyAArLPYT/Cx0DHCwSzRSyM3ROeCXlZTXzY9I6NDAOjRtBaqsPz6pTUchAh8lUAmdXabmdM
 Bzq2K5Q3autkGnpnD5ipRlBt3U4y6pf7P0U3y94wXQV2LHqWj/R9VSDMLHa9T2wNftpXX+KjdDr
 dlrrD+er6ZKasJjdhCg==
X-Proofpoint-GUID: igVeuDpSqje3iULXQpDVL6dqAV6qZV-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075955_672979_20E7E235 
X-CRM114-Status: GOOD (  22.80  )
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
---
 drivers/iommu/iommufd/device.c          | 17 +++++++++++------
 drivers/iommu/iommufd/driver.c          | 21 ++++++++++++---------
 drivers/iommu/iommufd/io_pagetable.c    |  9 +++++----
 drivers/iommu/iommufd/iommufd_private.h |  9 +++++++--
 4 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 868f1e591208..7b83810a1c90 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -97,7 +97,7 @@ static struct iommufd_group *iommufd_get_group(struct iommufd_ctx *ictx,
 	kref_init(&new_igroup->ref);
 	mutex_init(&new_igroup->lock);
 	xa_init(&new_igroup->pasid_attach);
-	new_igroup->sw_msi_start = PHYS_ADDR_MAX;
+	new_igroup->sw_msi_range.start = PHYS_ADDR_MAX;
 	/* group reference moves into new_igroup */
 	new_igroup->group = group;
 
@@ -374,7 +374,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 	struct iommufd_ctx *ictx = igroup->ictx;
 	struct iommufd_sw_msi_map *cur;
 
-	if (igroup->sw_msi_start == PHYS_ADDR_MAX)
+	if (igroup->sw_msi_range.start == PHYS_ADDR_MAX)
 		return 0;
 
 	/*
@@ -384,7 +384,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
 		int rc;
 
-		if (cur->sw_msi_start != igroup->sw_msi_start ||
+		if (cur->sw_msi_start != igroup->sw_msi_range.start ||
 		    !iommufd_sw_msi_maps_test_bit(&igroup->required_sw_msi, cur->id))
 			continue;
 
@@ -414,18 +414,23 @@ static int
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
index 3856989f5c4b..8bb47a81fed1 100644
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
index 24d4917105d9..8bf2554af334 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -1501,7 +1501,7 @@ void iopt_remove_access(struct io_pagetable *iopt,
 /* Narrow the valid_iova_itree to include reserved ranges from a device. */
 int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
 					struct device *dev,
-					phys_addr_t *sw_msi_start)
+					struct iommufd_sw_msi_range *sw_msi_range)
 {
 	struct iommu_resv_region *resv;
 	LIST_HEAD(resv_regions);
@@ -1520,10 +1520,11 @@ int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
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
index 9ca5f9f92cdf..4e2d32809695 100644
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
@@ -171,7 +176,7 @@ void iopt_table_remove_domain(struct io_pagetable *iopt,
 			      struct iommu_domain *domain);
 int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
 					struct device *dev,
-					phys_addr_t *sw_msi_start);
+					struct iommufd_sw_msi_range *sw_msi_range);
 int iopt_set_allow_iova(struct io_pagetable *iopt,
 			struct rb_root_cached *allowed_iova);
 int iopt_reserve_iova(struct io_pagetable *iopt, unsigned long start,
@@ -510,7 +515,7 @@ struct iommufd_group {
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
