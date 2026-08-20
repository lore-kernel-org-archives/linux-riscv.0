Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361AEC5DF8C
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaaj06q51l9RsdEJUghV6EUlW1+Pxq3yOo38xBDumfM=; b=LYOJYecclj0yM5
	zhvNVy1gY6ru+LHBI6pqGqB7g+hPW5K+MxBOdHHUE9cPLN5kZ2a7Q3FBWhwgSU8CReeGyZLb0Oqi0
	b1z10XZI8ZYjiAthnJRiP8NmLjxZvkyv4IxhaHxvSPD9oBBVJy5fgBhFWCr5kvAuz470ZNjiHCQbW
	9s8YJat8ErNzAFzU/t/vNKSB+GmpNpGk1DIgLgo7uNbupe/B9LEHWpZnLYXYTyyXH0t3i/YJt7ESe
	b+ApsZnq3u6vARcmE/1/c1+E0gNHYfoIPdx+51WjaMZH4vxZvVdMChZJ5Id88xJIX01pTMft2UKzn
	bgZTr7LNyL5BScXZBiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWR-0000000CDaV-27u6;
	Thu, 20 Aug 2026 21:42:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWN-0000000CDZJ-0QFx
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7XQj250308
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gu+JFGkyqPx
	/Q45IWTCbHOfkGmMO1gxqkNte7ZP70m0=; b=b2nvc7w/FnZzkiDM2hLfy1bSh0g
	j35Ze/etDBeZozYR10+jRRbwRyKESSUY0hTTgF7Q4IAxmwlcpfE+r5Ga1yVMeUC1
	X6+c6mjfZZDaxyUnb962DNPn2CqnKU+UwuyFFaLwCJhqETMyR450urlkC+472Zqc
	5ryBOQwZrUze4wrCDupHrOJlPPR7eS85wbjNCVFtqGC3XWOmpY12/44OxB7Iu+jb
	urEE+CFjMyv1m9sItfvHKhWEAag9bFXS8OQL7MXNwcNZXM+/R3H3xAs3AsZvPnJg
	EZ5aRezNc6vcMNfHU6gK07CCi08UK1amNJZdGHqnFbiQMuB2WfkSwVdnO8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w49bqp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:41:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so38468885a.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262117; x=1787866917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gu+JFGkyqPx/Q45IWTCbHOfkGmMO1gxqkNte7ZP70m0=;
        b=Pjj+FMX2Fd43buTAPTYFgXZZ90M5TqSxpOJCa6BzxU3KtlQKLMVIfCJHxJaOaLrWtt
         sc6cMwGaeILeLp8SDWehqzuW4q8Zz/6cV30+9lWC/x1T1EoloosPvXiS076WMVflukzR
         rwFkWJ/9HOIi6rUUYYtV24kDki7ufgYPtf18z2rvbH5CsgAfhFirkXI1a3UK16BHdb7J
         Q2IpluAsdjk/BMkkY+AIPLFMfC8zBxg15FoLIyWII1jugWhXPDAMz6c9ljE/08LLsvB7
         bSA23T8SMRcoN9k9jbpJLvBnczdUtezDE5BMM6XjFEGJ7bEtaOj0qrPeCi8p0hAYbFjw
         JpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262117; x=1787866917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gu+JFGkyqPx/Q45IWTCbHOfkGmMO1gxqkNte7ZP70m0=;
        b=eipAUMFH8uqU8BhiG+AuqJVcQtAQu2+7o6wpwIQlu2a8opOtjK3uWRQBzDn12eXWug
         IS5a17I6/v9lZ6jPZyWoapKLqfKlR4fq7bkdQ8NklqMPhMzVpOqmUTGDLnuYJnxDAQdf
         zGZDeyxA8aXQzC5bhs53DpQi0X0yNS0oTNSri5XNZJ/xHVR8wMqFIkyEy+D0pQ9yJxx9
         Z3UhRumg7lHx7WnjzuBdvZwO+qklaetStyo+p1UiojU0bPYSHYALKQ4/eD61PKoqGv1J
         RsRkcX5aSFO2WJOtIpmwRQdDydv2zTHRtYP9uF2w+C+Ma+dxbBes6sloVtV18+yFG/jP
         IilA==
X-Gm-Message-State: AOJu0Yz+S3EiSSH35zXz91WQssGYUKRZh27y2n8xKoC4Gtoeg/AmY4m5
	3QWoiCkTe4BC8ZQOYykg1eXTbKUlty5e693r0qUuXs4yABqiNd+NcNOEKOhmkcNBP2s0O0jUxD+
	IGELFnQPRVD5lUasgmE42AgdRmEBsDKTNBZOarDxcSxq89rtNCzRay3FT4g/Cc56nLuifvxVZFD
	jY/4o=
X-Gm-Gg: AR+sD10mM4O+eAhcEvBDnrzZUzHbcYex4UO+TbIjfRfIHvwItu5xlkqAmh7gnO0KmuE
	dw3pQZVbiSpvG4bPw2i6vLqWL6Labs0Rxy4Oiwzh7hOF/teRtQx/IXTypP1Fd0LwzEh4QUrm3Nw
	qF+OJjwbfv7R7lVopViII1VaFxge9DFsnbTXFxzBh8h0IGyMdUI/d01CrC5c1zR72QoZUScTx0a
	4ju23BgEop2NJ4yQwHPcuepAowccND0TlamEYtIe7tvDHoANOG1TG44GhZ9pqQLlnGStH04yoq+
	Oghym6HgltaAiStusUEvJJgQFFmu9nBVQV5ejCSRGxB7thbxQaxmNx0m3Q29uVRAfiz1Tc+cNyr
	RT70+h0yl
X-Received: by 2002:a05:620a:222c:b0:937:2ec9:c98 with SMTP id af79cd13be357-9373942667bmr103110385a.5.1787262117404;
        Thu, 20 Aug 2026 14:41:57 -0700 (PDT)
X-Received: by 2002:a05:620a:222c:b0:937:2ec9:c98 with SMTP id af79cd13be357-9373942667bmr103108385a.5.1787262116964;
        Thu, 20 Aug 2026 14:41:56 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b91173c4sm5335855e9.2.2026.08.20.14.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:41:56 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Date: Thu, 20 Aug 2026 23:41:31 +0200
Message-ID: <20260820214150.545737-3-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX3vYpHbOVuOUA
 QwGKXrdJV9z09Ef+Z4szF4lS09tMky3WTtIUfNSzlJ6/u6l7+lOkTPQrNQoa5cKc6WgxRXlZuG4
 2PjyV5NI5e2mKYpDc5nQmCilnIqgmAs=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a8774a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5IMjXt7tboKol454yg4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: J8AVvIDtr2eXhY8q8zgWTWEEUSlMEj0L
X-Proofpoint-GUID: J8AVvIDtr2eXhY8q8zgWTWEEUSlMEj0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXygtuWR3luPxH
 JvaxGzd+b/6FmqbdHZaGifCRk81rrLXxvl1vkiKXgaU6xP98V+R+W4CwxotL6wFKutXrXvAJWO9
 3VV9V0q61meVbhgNBHIZt284OpbkS/P+XFdemHwMtC6dflJpETCoZmTG3PPl8haBGd4uB6klJUp
 M+ImcyDCugoe/dqZBZMCnj+2+SlY8+myHtVYuKkTplbNkM7qrEYHd/WhaRp+jM94YGCLKQmbOuO
 wHNYIlfjSTr0V5OyVDkd9hwOl7sVh/anBS3pq6UYvgoPBnxmN5l3I85KnO9GN0TT1CtBFRakkDl
 fVtGUe92FwqwboIAFHMbrEEGgn0vuzHiPNILj0+rWzMB2SvspCoVNWW2VKmznHl3m8FggRYLpe1
 u4JaQTKr+fJLPMpOf1swKAxH4VtwDCrcFJYR6YUFemO+rPmeefV9KwOcUNdVm2B12ElS/88KPV8
 bEYFUL98Lm9qFguTYuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144159_146325_A8C90B47 
X-CRM114-Status: GOOD (  23.69  )
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

Add a descriptor-free counterpart to iommufd_sw_msi(). The existing
function is tied to a struct msi_desc and stores the result in the
descriptor. This variant returns the IOVA directly so callers can
pre-map MSI targets before any descriptor has been allocated.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommu-priv.h     | 11 +++++++
 drivers/iommu/iommufd/driver.c | 60 +++++++++++++++++++++++++---------
 2 files changed, 56 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
index aaffad5854fc..f60373cd2f70 100644
--- a/drivers/iommu/iommu-priv.h
+++ b/drivers/iommu/iommu-priv.h
@@ -55,12 +55,23 @@ int iommu_replace_group_handle(struct iommu_group *group,
 #if IS_ENABLED(CONFIG_IOMMUFD_DRIVER_CORE) && IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
 int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 		   phys_addr_t msi_addr);
+int iommufd_sw_map_msi(struct iommu_domain *domain, struct device *dev,
+		       phys_addr_t msi_addr, size_t required_size,
+		       dma_addr_t *msi_iova, unsigned int *msi_shift);
 #else /* !CONFIG_IOMMUFD_DRIVER_CORE || !CONFIG_IRQ_MSI_IOMMU */
 static inline int iommufd_sw_msi(struct iommu_domain *domain,
 				 struct msi_desc *desc, phys_addr_t msi_addr)
 {
 	return -EOPNOTSUPP;
 }
+
+static inline int iommufd_sw_map_msi(struct iommu_domain *domain,
+				     struct device *dev, phys_addr_t msi_addr,
+				     size_t required_size, dma_addr_t *msi_iova,
+				     unsigned int *msi_shift)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* CONFIG_IOMMUFD_DRIVER_CORE && CONFIG_IRQ_MSI_IOMMU */
 
 int iommu_replace_device_pasid(struct iommu_domain *domain,
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 9b9316ae4266..69b3dbcbee3b 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -249,15 +249,23 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi_install, "IOMMUFD_INTERNAL");
 
 /*
- * Called by the irq code if the platform translates the MSI address through the
- * IOMMU. msi_addr is the physical address of the MSI page. iommufd will
- * allocate a fd global iova for the physical page that is the same on all
- * domains and devices.
+ * Descriptor-free counterpart to iommufd_sw_msi(). Maps an MSI physical page
+ * into the domain and returns the IOVA. Used for pre-mapping MSI targets before
+ * any MSI descriptor has been set (e.g. IMSIC doorbell pages). The IOVA is
+ * global to the iommufd file descriptor: every domain and device using the
+ * same MSI parameters gets the same IOVA.
+ *
+ * msi_addr is the exact byte offset of the MSI doorbell; the caller must have
+ * verified it is contained within an MMIO region safe to map at PAGE_SIZE. If
+ * required_size is non-zero it must equal PAGE_SIZE. @msi_iova and @msi_shift
+ * must be non-NULL.
+ *
+ * The caller must hold @dev's iommu group mutex.
  */
-int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		   phys_addr_t msi_addr)
+int iommufd_sw_map_msi(struct iommu_domain *domain, struct device *dev,
+		       phys_addr_t msi_addr, size_t required_size,
+		       dma_addr_t *msi_iova, unsigned int *msi_shift)
 {
-	struct device *dev = msi_desc_to_dev(desc);
 	struct iommufd_hwpt_paging *hwpt_paging;
 	struct iommu_attach_handle *raw_handle;
 	struct iommufd_attach_handle *handle;
@@ -266,6 +274,12 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	unsigned long iova;
 	int rc;
 
+	*msi_iova = 0;
+	*msi_shift = 0;
+
+	if (required_size && required_size != PAGE_SIZE)
+		return -EOPNOTSUPP;
+
 	/*
 	 * It is safe to call iommu_attach_handle_get() here because the iommu
 	 * core code invokes this under the group mutex which also prevents any
@@ -286,13 +300,7 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 
 	ictx = handle->idev->ictx;
 	guard(mutex)(&ictx->sw_msi_lock);
-	/*
-	 * The input msi_addr is the exact byte offset of the MSI doorbell, we
-	 * assume the caller has checked that it is contained with a MMIO region
-	 * that is secure to map at PAGE_SIZE.
-	 */
-	msi_map = iommufd_sw_msi_get_map(handle->idev->ictx,
-					 msi_addr & PAGE_MASK,
+	msi_map = iommufd_sw_msi_get_map(ictx, msi_addr & PAGE_MASK,
 					 handle->idev->igroup->sw_msi_start);
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
@@ -308,7 +316,29 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	__set_bit(msi_map->id, handle->idev->igroup->required_sw_msi.bitmap);
 
 	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
-	msi_desc_set_iommu_msi_iova(desc, iova, PAGE_SHIFT);
+	*msi_iova = iova;
+	*msi_shift = PAGE_SHIFT;
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_sw_map_msi, "IOMMUFD");
+
+/*
+ * Called by the irq layer when the platform translates MSI addresses through
+ * the IOMMU. Wraps iommufd_sw_map_msi() and stores the result in the descriptor.
+ */
+int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
+		   phys_addr_t msi_addr)
+{
+	dma_addr_t msi_iova;
+	unsigned int msi_shift;
+	int rc;
+
+	rc = iommufd_sw_map_msi(domain, msi_desc_to_dev(desc), msi_addr,
+				0, &msi_iova, &msi_shift);
+	if (rc)
+		return rc;
+
+	msi_desc_set_iommu_msi_iova(desc, msi_iova, msi_shift);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi, "IOMMUFD");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
