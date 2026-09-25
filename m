Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83E8C98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3j4xhPkjWf5bdblhvo5zvnkBWuFQ8Dc110uELgwYidc=; b=e41QC8zntDqEM+
	tZHNCbw5i2z1kOs4wuvRTFFN3EdhK8v4v/4osZY0lTIMhiXz7+NECu1KEbdESO+2Df8gdKOQVSngB
	aqSLmxcLS+0erhNlvF85tKjfDDY9vgmNag14v235IsKo4bQOBCUfvVKdmwlTjJQmaY3b6F1VhdOEt
	m8hjfziBLm+M56tIXwTTUFwhQva1q+o4eZYJfJx5eKoigPPQw6OmVgdOtodPR2uQx71Djw3/nN0zE
	phOCPgP/GgXvyr4ApklbVx+rOCLb+K1tVD0OeeK1KS3O7S9HjdljapyyRWGYNUP3UOUhlsOmdP7D9
	Lgbs4MUjiAZGtYFyIPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fp-0000000DjqH-1wcN;
	Fri, 25 Sep 2026 15:17:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fl-0000000Djna-3b43
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4Brm609090
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1X0NVzHxbn4
	ywmQH+85Wj45+Tkg1X+lSCNdQaps1CnQ=; b=mZRITZ6HinHh8PGxb4S4TPBivG/
	Q9kg1OuqQsDA9Xx83GKYms8v2IOwsIrtH85NpvsShXZp2mVF4vHwkJu6fTJmgPTr
	8sBBh2kk6wOB7fpnaBIXhbpW7bYBGMXlNbgSEWR49vzsgWwzZHRci4SuHEhLizps
	quzhcq6ftjpgU73fxukulbvR8MkMu8RIF/NkMuP6XWZ/bLRQ54zXj09hJMArHx6v
	JgKTr9m4FonDT02VA+EYRgbJ0FCSNcz0yr0JuvpIy1iVczl1T/+OOVQz7VgNndh2
	M2Tff8tkv0aRjFm5yAD+VOZ59lwwtYQEabfNGGQnKzlj+HbXL00kH/gk0zQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvns16f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b34a3d1f9eso28054137.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349432; x=1790954232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1X0NVzHxbn4ywmQH+85Wj45+Tkg1X+lSCNdQaps1CnQ=;
        b=PiAganfE2rhivuEO9f5qXW1bn+V0oSmKti6YYwVP+39sVZiDi9FsAxudlWfIjbz9dx
         1Vg1vItritN88gEE16rzlR7upReWcXIcET1Gvl46CyK9nf4BLc5QzKfCG5inhtAKs/Q2
         PPBIq1dFZb+p9evZScgs7yv279GkZDJ3khHpQLjV6EKduBCBPieaeQniYwPpeQtZ1gKk
         Md8s9NDHVGLGwEbtUf6dYIJM0V+evbzKJNlbZJylFv6cs95/TaY/HqbLgTsXi+MRCiEO
         0i+7eiHhFIm5sW54OI3OCeLYDih3MbR9OzSGfFgJkTtLnnEFEiJtDo2iSlqS2CCBNxvY
         uf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349432; x=1790954232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1X0NVzHxbn4ywmQH+85Wj45+Tkg1X+lSCNdQaps1CnQ=;
        b=t+ydoneYXbyOieqn6J767BqDBc0mDysJBKsHI0vi8CMxV1ncnTPxPAufrOpum4Wh/b
         Wilzad8H9qWUvUJ/YN6D441A/ctxk4qN6sX4GX2uXB3C3BAHxEHUj9JMpufCLZNaHBKn
         k1QKTVf4A5FFmOeWSWbmGE6kwA+cT3IPuodSlZy2UDYmqO86Z7+VFVKQIZMYKrf6/sFN
         d5j5iu4UZ2btNCe/lEmWchIM6XiAX1NSqEyhVzeT/PiaF1dD1bxcEk2IwTtIypqQZ4Ei
         3Cm69xwpC9zHPwA9BH+cZGvsE2eHYPaU61wT4bfKge1Il4uZFtXWlHWk9PrTo5LQ416+
         9ffA==
X-Gm-Message-State: AFuF++kFKqxLBQF6grCLT0jT9yRDdAPoVj+xYjv3mn1m94EXq6Hes1oL
	SqK7FLbPMGfm+dK5lrHs6ea+b4/PXxh17sPEz0SG0fjl2S9EMhRjOQOblZUMDFFOdDNurptuXHL
	p5ZiACMLNIBGfAbttjdGDom3dO+Mm+PfP0fhb/zv5YCct+5qB/hl6JpKlnxNwC1BB7bZBodzP6j
	FvVT4=
X-Gm-Gg: AYBFou0lvno3+y+SKPktAU5CUgSX/efd6yXYD9ho5Or12xsaQruo5X2Tn5yi4zCL94G
	SKCwbQbBpj6SqrztdLkw4nrehc/5hLz8ZTLMOBwrGr0F7T5bdJTPrUafDm1XGs7eT6ejJZxuCP4
	1rDDt3ozUTSuM8E3HbKXOgoE+R4lgN8ZJG7rYyOy0B1pVy1IOmn6rxCtUTdqlNT5XGQyVTGPdTM
	USB7mxxZ9geNSN3fXAR125pEd4hK9Yl585+8hb60Vz8TYurb57kS8YlG7icOY9ydVizDi8tMxHY
	hGC8TM9TUtkrX4guUUT5dLaL/QcbYx4IGyPVoRw62XB3pGORBWqQAd5OjOxNLkZjHDentt5Hhwi
	gueod+/e11XwwvNInD6AcAGaVVL6lqZcF5p4ODQ==
X-Received: by 2002:a05:6102:160c:b0:7a2:4b76:55fe with SMTP id ada2fe7eead31-7af1eaeade3mr2347049137.21.1790349432025;
        Fri, 25 Sep 2026 08:17:12 -0700 (PDT)
X-Received: by 2002:a05:6102:160c:b0:7a2:4b76:55fe with SMTP id ada2fe7eead31-7af1eaeade3mr2347031137.21.1790349431452;
        Fri, 25 Sep 2026 08:17:11 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm8249719f8f.1.2026.09.25.08.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:10 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 05/16] iommufd: Prepare software MSI maps for address lists
Date: Fri, 25 Sep 2026 17:16:48 +0200
Message-ID: <20260925151659.419512-6-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 5MpJkBQ3Zlaz9m-l_iTLYHLn-Hr_QEmV
X-Proofpoint-GUID: 5MpJkBQ3Zlaz9m-l_iTLYHLn-Hr_QEmV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXw4mt7SDHIfTi
 p6yUjSZS4Y0iXhndqg7y5A2mgL+MuzYVS6+N2GBqyHZvus994O7/Pf8fOtb4n78tBDnTYNJP1bb
 SVRoqRUqf98MEKU73/g0b2ciBUjJaZA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX8tmq6FdrOHyd
 USIo6E/auuGZYwgiU0Ak2ypHW2naMJzjyvEtkslXa4B0cYjirhxQUpuGKk3dLoSS8hO392h6tx2
 9077FTRQ/1CGt9+1XeQP35nzW9OR4VlrKJdqSn/jgJRq7zM5cR6OI/K0g/UGdZBaRJY5RkhHbYu
 RaRGWJ5nCvNBByM+aKK4UZbjqKt93gctbhNUts29oaquV1yPqIh889VcXuKzPd1qD1QOgQNNZVB
 qvj+o3/FLyq2ARMWR2Rp8uu5GuOGQHmhtis3b6jdIBZpfLVgYjzFgz3k2sIcCeFg0AMa5VI7tlr
 /4TblpwFrZ8la3qeDBK+MRc0t/uZP0/PzEpDSyODe5LE3i9Bh2cJrdXHQ6ssL/DL1TOWOl0ER0S
 OGnJv1pBTc/jTBsFawcYFrnnWJIXNd5BvJBJ+M9ugt1z06C+dBMU6Xr/vlGrt93GCy+yM8ee6nK
 UxC/Uo6dFbdDqAekYgw==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab69078 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=noCGlsY9V4GqTmqY_BAA:9 a=-aSRE8QhW-JAV6biHavz:22
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
X-CRM114-CacheID: sfid-20260925_081714_018354_CBDAAE42 
X-CRM114-Status: GOOD (  25.71  )
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

Teach iommufd_sw_msi_get_map() to match an ordered physical address list
against an existing contiguous IOVA range. Mark the first map with the
range size so an identical list can reuse the allocation.

Teach iommufd_sw_msi_alloc_map() to reserve identifiers and offsets for
the complete list and build its maps on a temporary list. Keep the
existing scalar installation behavior and only publish newly allocated
maps after installation succeeds.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/iommufd/driver.c          | 161 ++++++++++++++++++------
 drivers/iommu/iommufd/iommufd_private.h |   1 +
 2 files changed, 123 insertions(+), 39 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index c2ef15c2ca51..8b8f132ef3c5 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -179,35 +179,91 @@ EXPORT_SYMBOL_NS_GPL(iommufd_viommu_report_event, "IOMMUFD");
 
 #ifdef CONFIG_IRQ_MSI_IOMMU
 /*
- * Get a iommufd_sw_msi_map for the msi physical address requested by the irq
+ * Get an iommufd_sw_msi_map for the msi physical addresses requested by the irq
  * layer. The mapping to IOVA is global to the iommufd file descriptor, every
  * domain that is attached to a device using the same MSI parameters will use
- * the same IOVA.
+ * the same contiguous IOVA range.
  */
 static struct iommufd_sw_msi_map *
-iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
-		       const struct iommufd_sw_msi_range *sw_msi_range)
+iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, const phys_addr_t *phys_addrs,
+		       unsigned int nr_addrs, const struct iommufd_sw_msi_range *sw_msi_range)
 {
-	struct iommufd_sw_msi_map *cur;
+	struct iommufd_sw_msi_map *cur, *msi_map;
+	unsigned int nr_found;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
-	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
-		if (cur->sw_msi_start != sw_msi_range->start ||
-		    cur->pgoff >= sw_msi_range->length / PAGE_SIZE)
+	list_for_each_entry(msi_map, &ictx->sw_msi_list, sw_msi_item) {
+		if (msi_map->sw_msi_start != sw_msi_range->start ||
+		    msi_map->msi_addr != phys_addrs[0])
+			continue;
+		if (msi_map->range_size != nr_addrs * PAGE_SIZE)
 			continue;
-		if (cur->msi_addr == msi_addr)
-			return cur;
+		if (msi_map->pgoff > sw_msi_range->length / PAGE_SIZE ||
+		    nr_addrs > sw_msi_range->length / PAGE_SIZE - msi_map->pgoff)
+			continue;
+
+		nr_found = 0;
+		list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
+			unsigned int index;
+
+			if (cur->sw_msi_start != sw_msi_range->start ||
+			    cur->pgoff < msi_map->pgoff)
+				continue;
+			index = cur->pgoff - msi_map->pgoff;
+			if (index >= nr_addrs)
+				continue;
+			if (cur->msi_addr != phys_addrs[index])
+				break;
+			nr_found++;
+		}
+		if (nr_found == nr_addrs)
+			return msi_map;
 	}
 	return NULL;
 }
 
+static int iommufd_sw_msi_check_alloc(struct iommufd_ctx *ictx,
+				      const struct iommufd_sw_msi_range *sw_msi_range,
+				      unsigned int first_pgoff, unsigned int nr_addrs,
+				      size_t *range_size)
+{
+	unsigned long max_iova_pgoff;
+	unsigned int last_pgoff;
+	unsigned int last_id;
+	size_t range_pages;
+
+	if (!nr_addrs)
+		return -EINVAL;
+	if (sw_msi_range->start > ULONG_MAX)
+		return -EOVERFLOW;
+
+	range_pages = sw_msi_range->length / PAGE_SIZE;
+	max_iova_pgoff = (ULONG_MAX - sw_msi_range->start) / PAGE_SIZE;
+
+	if (check_add_overflow(ictx->sw_msi_id, nr_addrs - 1, &last_id) ||
+	    last_id > IOMMUFD_SW_MSI_MAX_ID ||
+	    check_add_overflow(first_pgoff, nr_addrs - 1, &last_pgoff) ||
+	    last_pgoff > max_iova_pgoff ||
+	    check_mul_overflow((size_t)nr_addrs, PAGE_SIZE, range_size))
+		return -EOVERFLOW;
+
+	if (last_pgoff >= range_pages)
+		return -ENOSPC;
+
+	return 0;
+}
+
 static struct iommufd_sw_msi_map *
-iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
-			 const struct iommufd_sw_msi_range *sw_msi_range)
+iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, const phys_addr_t *phys_addrs,
+			 unsigned int nr_addrs, const struct iommufd_sw_msi_range *sw_msi_range,
+			 struct list_head *new_msi_maps)
 {
-	struct iommufd_sw_msi_map *cur;
-	unsigned int max_pgoff = 0;
+	struct iommufd_sw_msi_map *cur, *first_map = NULL;
+	unsigned int next_pgoff = 0;
+	unsigned int i;
+	size_t size;
+	int rc;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
@@ -216,25 +272,38 @@ iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 			continue;
 		if (cur->pgoff == UINT_MAX)
 			return ERR_PTR(-EOVERFLOW);
-		max_pgoff = max(max_pgoff, cur->pgoff + 1);
+		next_pgoff = max(next_pgoff, cur->pgoff + 1);
 	}
 
-	if (ictx->sw_msi_id > IOMMUFD_SW_MSI_MAX_ID ||
-	    max_pgoff > (ULONG_MAX - sw_msi_range->start) / PAGE_SIZE)
-		return ERR_PTR(-EOVERFLOW);
-	if (max_pgoff >= sw_msi_range->length / PAGE_SIZE)
-		return ERR_PTR(-ENOSPC);
-
-	cur = kzalloc_obj(*cur);
-	if (!cur)
-		return ERR_PTR(-ENOMEM);
-
-	cur->sw_msi_start = sw_msi_range->start;
-	cur->msi_addr = msi_addr;
-	cur->pgoff = max_pgoff;
-	cur->id = ictx->sw_msi_id++;
-	list_add_tail(&cur->sw_msi_item, &ictx->sw_msi_list);
-	return cur;
+	rc = iommufd_sw_msi_check_alloc(ictx, sw_msi_range, next_pgoff, nr_addrs, &size);
+	if (rc)
+		return ERR_PTR(rc);
+
+	for (i = 0; i < nr_addrs; i++) {
+		cur = kzalloc_obj(*cur);
+		if (!cur)
+			goto err_free;
+
+		cur->sw_msi_start = sw_msi_range->start;
+		cur->msi_addr = phys_addrs[i];
+		cur->pgoff = next_pgoff + i;
+		cur->id = ictx->sw_msi_id + i;
+		if (!i) {
+			cur->range_size = size;
+			first_map = cur;
+		}
+		list_add_tail(&cur->sw_msi_item, new_msi_maps);
+	}
+
+	return first_map;
+
+err_free:
+	while (!list_empty(new_msi_maps)) {
+		cur = list_first_entry(new_msi_maps, typeof(*cur), sw_msi_item);
+		list_del(&cur->sw_msi_item);
+		kfree(cur);
+	}
+	return ERR_PTR(-ENOMEM);
 }
 
 int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
@@ -280,7 +349,9 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	struct iommufd_attach_handle *handle;
 	struct iommufd_sw_msi_map *msi_map;
 	struct iommufd_ctx *ictx;
+	LIST_HEAD(new_msi_maps);
 	unsigned long iova;
+	phys_addr_t phys_addr;
 	int rc;
 
 	/*
@@ -308,29 +379,41 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	 * assume the caller has checked that it is contained with a MMIO region
 	 * that is secure to map at PAGE_SIZE.
 	 */
-	msi_map = iommufd_sw_msi_get_map(handle->idev->ictx,
-					 msi_addr & PAGE_MASK,
-					 &handle->idev->igroup->sw_msi_range);
+	phys_addr = msi_addr & PAGE_MASK;
+	msi_map = iommufd_sw_msi_get_map(ictx, &phys_addr, 1, &handle->idev->igroup->sw_msi_range);
 	if (!msi_map)
-		msi_map = iommufd_sw_msi_alloc_map(handle->idev->ictx,
-						   msi_addr & PAGE_MASK,
-						   &handle->idev->igroup->sw_msi_range);
+		msi_map = iommufd_sw_msi_alloc_map(ictx, &phys_addr, 1,
+						   &handle->idev->igroup->sw_msi_range,
+						   &new_msi_maps);
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
 	rc = iommufd_sw_msi_maps_ensure(&handle->idev->igroup->required_sw_msi,
 					msi_map->id);
 	if (rc)
-		return rc;
+		goto err_free;
 
 	rc = iommufd_sw_msi_install(ictx, hwpt_paging, msi_map);
 	if (rc)
-		return rc;
+		goto err_free;
 	__set_bit(msi_map->id, handle->idev->igroup->required_sw_msi.bitmap);
 
+	if (!list_empty(&new_msi_maps)) {
+		list_splice_tail_init(&new_msi_maps, &ictx->sw_msi_list);
+		ictx->sw_msi_id++;
+	}
+
 	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
 	msi_desc_set_iommu_msi_iova(desc, iova, PAGE_SHIFT);
 	return 0;
+
+err_free:
+	while (!list_empty(&new_msi_maps)) {
+		msi_map = list_first_entry(&new_msi_maps, typeof(*msi_map), sw_msi_item);
+		list_del(&msi_map->sw_msi_item);
+		kfree(msi_map);
+	}
+	return rc;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi, "IOMMUFD");
 #endif
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index af7df868dd4f..b54eba5c490b 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -33,6 +33,7 @@ struct iommufd_sw_msi_map {
 	phys_addr_t msi_addr;
 	unsigned int pgoff;
 	unsigned int id;
+	size_t range_size; /* IOVA range size, or 0 if not the first map */
 };
 
 /* Bitmap of struct iommufd_sw_msi_map::id; starts empty, grows on demand. */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
