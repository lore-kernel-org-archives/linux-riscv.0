Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EA5C624A4
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHlymWDwS11mqsnfTjrYZG6/nZFdkTW06LUQt2aGIQ0=; b=LhXGurjWUi7JhJ
	Q4ReVB/czNdr+QXWyOLzSvj6lMrcKtRHIVewZpf87++MxyVRIBMtScgYatxVJ8ge9gnPJtGBJn2mw
	+zUion4LBKdL591YKrGV/5aaScoF9gol9D+0gfJ02YJavfVIEUxPrQlY/kLCX/1xqg4N16oF078VW
	U1HanECrTGQznEFbCW7T2eb0zP60D4s46rzAgl6KqylgFqlFOo/9N9UhsdnEAvtZm8X25a7ZrETgK
	qhB1zmFT8GKcFYBVP/BTKyGevUFJBMA7azSSrlQgozpthcmBei+cNUOr0t+13W0+tLkBGDP4cOBxs
	7nusVI1YE0oTzZiDrwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UG-00000009kPA-0KSd;
	Mon, 31 Aug 2026 14:59:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UD-00000009kNs-0jCR
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 14:59:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETbSj4049745
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6RkO5qSbU6o
	yY3PEkq3YPDDTYFB2jarHRGHy9kSvaIA=; b=SGDMOb2aqN+2Z5l+7Mzo8nMO/F4
	qcsJvwkuxeP633TU7o9U5eMNVJRTk/uew1loJ1ER2De3nnARJ0vQI4KGSZA+5ysm
	o0CzMILXUmEzYke2kxVaGu0eULx5k/SVrLz8rDjaAEUSPCne0bm/vx0UXEV46/RS
	FraYkLHIzdpJwYD7WC4uQQX/iIL1jcwbX4IyPW5LSfpsEN4/m1XCJ9lLD3l3ZvOD
	AqvY7jNYyNCXB2X86vXh+6NGCnEds+zsM1uG/Qha8BGqMjLfPyyCHdoCd3BhDUk2
	GHzOTVq0CRp13/fr6y5KQDX15soB9cueYiNU1Nx41n3LKQKa8j6Km1pXOmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jghfwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so601184885a.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188387; x=1788793187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RkO5qSbU6oyY3PEkq3YPDDTYFB2jarHRGHy9kSvaIA=;
        b=A613NL9jK6xo/WplFcXTOROMnM42XLH8O16VTZ1lZZ3iVajs1j6cceg5+FZA7UH5JN
         PJLq1zxDjygCh49Lwz6LUAsEizTnjCOq9S5wikpd662dZRjI5nY1pLQPdOfvjU5a0J/0
         GlD/Y1+pWkAWOPTw6D9U6yyu12NirmcpRYvSQesXRqjaJESCM/+Wx0B4cpMzgp/aGouK
         QqiMYy5dkiNhi3U287JEpmiKepdCmfIlbFkaRYeO4GAb52/ryPmeRVtHrP65AiX+zJcg
         BgEBimAhy/ieCDfsIDEsnXYxuZEaNOG7uytb6XdH5Dhp5rmHEberRYaMVeHu5aBL1Ksr
         aFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188387; x=1788793187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RkO5qSbU6oyY3PEkq3YPDDTYFB2jarHRGHy9kSvaIA=;
        b=k5JdkkeSvsq53gQ+X442U+JsvdU9gX34cWwK5si3m0qXzcE3AEltVBOGpJdTJPYpxU
         5ubyKFG3wTy7QGMBfp9NAUPMw6BpObYiVn2+qpVhyMcyPsKQBXq7SW7w/obRia3dRgtm
         dpb9AFnNQbJr89Lt3FNXly8Pf47QxrDBkYp2R5ktwVDSImmNVut1aYDY37NJ8/Yavl4B
         9b0P+YijszK8bytujc4O/V7TQzLiDtnTVAnPlNx+/SGzN3qKGTAPSN8wILPMEH9fUXfl
         9NFc90SybO+yVj/Uujb5aEYEYRsPqN8UN7pbeNNt+Qt9FTzs+bQEDWLLFTHNU37Vu3qc
         lstQ==
X-Gm-Message-State: AFuF++lMxA2HWOredPJvnN1ErxKO24tFekQzSElyozlFAEi/qRklb9iB
	1qQ9CbjKjlFZ3pZ8RamQ0kF+TmVkC98EKtVtjDpJJyZS0cVgVujYc5eJAuDPuSgGiGmnwyYEwp2
	KyfmVVQMl2DMl/h4dXSjbeGuxg9hvXZ/xE6ezeQ6Y7n1gNL/hz8Gf7lth3JFxYxDPx7MNGosr6Z
	sQ4MM=
X-Gm-Gg: AR+sD12vBCdrdvLfKjSb64uF/ySkpsLVylyQ2QY/VY/yOE1N9M6+tsf5KBuxAHfJLde
	aNwXr/gNSwPVYhplyeHAkDM2MQO1GBhe7+e8NX4oCaPeq9YuHnFsZOiGHyxt+ekkiUOa9XFm0S8
	F87V0Id+eBeiPDQC61kgsMYkWjvdOooEXtVO3d4QoM2TFYinJo47MuitkbXvdOiS9Kpr9g1XjQX
	AlAOUTmzqKnISIRoGnL0p558DlHK5ODpmbDx0DzbEqh+X7bjN28SeeeDwLMLF9CJuw2BYvjtutR
	88Bm9znRTT65DGTWYeLvGSho/DtfnoUAOkZcURdv2uQUitncJ5fA25WzyHCBx1/O5tzAv9QAY4O
	3aaGw7OD9nMj4zAz6e590fZtHDhs6wJNp5r4=
X-Received: by 2002:a05:620a:1b9a:b0:939:cb6:997c with SMTP id af79cd13be357-93936cbe952mr224773285a.13.1788188387523;
        Mon, 31 Aug 2026 07:59:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:939:cb6:997c with SMTP id af79cd13be357-93936cbe952mr224765385a.13.1788188387028;
        Mon, 31 Aug 2026 07:59:47 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843ce8b015sm6235156f8f.13.2026.08.31.07.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:46 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 01/17] iommu/dma: Prepare MSI physical address lists
Date: Mon, 31 Aug 2026 16:59:27 +0200
Message-ID: <20260831145943.313726-2-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 9JNYSrhK380HIcRGTTkX90yawHLisgeZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX3exDvWgoEieF
 b+GK/NsUXshAubPBfkEra7A+Z0/bTLfnyDkwonVn2+7Ox0bLkqum1rIwGuo9DwInLWhu4kNq7aP
 BVCMoppHzuzHn540ylP3+RmeY4l7HfA=
X-Proofpoint-ORIG-GUID: 9JNYSrhK380HIcRGTTkX90yawHLisgeZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX5IIJFv296K2R
 oSsXRSHEcNd2UjuRUiC6MKCkzIzLsJY4vhlze79M9WnGtHXSgdVEJ3t5Dl3D3Y2BD/JeHL4OK0K
 N97EBwEeNcV0j5Y2xfVu+fsr33xrM4AK7MeIrBbALvTOlctUVkPi0yf/l1awNgcZRPZRj7tYQW+
 7Dvnjy6hKFdLcKLTFvao/g+ypfsPqmjogji9Baasmao8qJJM9zgkONCq0iSBUgASA5C2cG0Qi6V
 bzMywJbcczG35bo1j+PplAqp8UI3TMRxnZJvjltdVAQPmlXGDzDEjcAnoR0blEcgxe+uqrPnkQb
 LSd/t600DWlMls3zl4Rv6aStlY5rFvmYNFAKSJFmez1rO0VIUYnKgBxf28HK6jInEy6/zfweZEl
 C2iKSRf2tAjv7JYeVmarvg6Q9EzUWdz7AFmDIN6/f9MIUmS9wNzBQ0A5vi58N+itsElGLjAazU0
 iPKW7Dpw9FRmEjksjng==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a9596e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=kJPfLSheDWDr1nFXzE0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075949_338469_5F9E349A 
X-CRM114-Status: GOOD (  23.11  )
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

Software MSI mappings may cover an ordered list of physical addresses
which must be mapped into one contiguous IOVA range. Extend the internal
DMA-IOMMU mapping helpers to accept an address array, address count, and
required mapping granule.

Teach iommu_dma_get_msi_page() to map the list into one contiguous IOVA
allocation. Keep the existing per-page cache entries and mark the first
entry with the size of the allocation so an identical list can reuse the
mapping without changing the existing cache representation.

This prepares for the forthcoming iommu_dma_prepare_msi_list() API.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c | 116 +++++++++++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 9a07eb39336e..38a0c4e244d6 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -42,6 +42,7 @@ struct iommu_dma_msi_page {
 	struct list_head	list;
 	dma_addr_t		iova;
 	phys_addr_t		phys;
+	size_t			range_size; /* IOVA range size, or 0 if not the first map */
 };
 
 enum iommu_dma_queue_type {
@@ -481,7 +482,7 @@ static int cookie_init_hw_msi_region(struct iommu_dma_cookie *cookie,
 	num_pages = iova_align(iovad, end - start) >> iova_shift(iovad);
 
 	for (i = 0; i < num_pages; i++) {
-		msi_page = kmalloc_obj(*msi_page);
+		msi_page = kzalloc_obj(*msi_page);
 		if (!msi_page)
 			return -ENOMEM;
 
@@ -2196,15 +2197,42 @@ static struct list_head *cookie_msi_pages(const struct iommu_domain *domain)
 	}
 }
 
+static bool iommu_dma_msi_range_matches(struct list_head *msi_page_list,
+					const struct iommu_dma_msi_page *base_page,
+					const phys_addr_t *phys_addrs,
+					unsigned int nr_addrs, size_t granule)
+{
+	const struct iommu_dma_msi_page *msi_page;
+	unsigned int nr_found = 0;
+	dma_addr_t offset;
+
+	list_for_each_entry(msi_page, msi_page_list, list) {
+		if (msi_page->iova < base_page->iova)
+			continue;
+		offset = msi_page->iova - base_page->iova;
+		if (offset >= base_page->range_size)
+			continue;
+		if (!IS_ALIGNED((size_t)offset, granule) ||
+		    msi_page->phys != phys_addrs[(size_t)offset / granule])
+			return false;
+		nr_found++;
+	}
+
+	return nr_found == nr_addrs;
+}
+
 static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
-		phys_addr_t msi_addr, struct iommu_domain *domain)
+		const phys_addr_t *phys_addrs, unsigned int nr_addrs, size_t granule,
+		struct iommu_domain *domain)
 {
 	struct list_head *msi_page_list = cookie_msi_pages(domain);
-	struct iommu_dma_msi_page *msi_page;
-	dma_addr_t iova;
+	struct iommu_dma_msi_page *msi_page, *first_page = NULL;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
-	size_t size = cookie_msi_granule(domain);
 	static DEFINE_MUTEX(msi_prepare_lock);
+	LIST_HEAD(new_msi_pages);
+	dma_addr_t base_iova;
+	unsigned int i;
+	size_t size;
 
 	/*
 	 * Normally a device's default domain is only ever attached to that
@@ -2218,32 +2246,60 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	 */
 	guard(mutex)(&msi_prepare_lock);
 
-	msi_addr &= ~(phys_addr_t)(size - 1);
-	list_for_each_entry(msi_page, msi_page_list, list)
-		if (msi_page->phys == msi_addr)
+	if (!nr_addrs || nr_addrs > SIZE_MAX / granule)
+		return NULL;
+	size = nr_addrs * granule;
+
+	list_for_each_entry(msi_page, msi_page_list, list) {
+		if (msi_page->phys != phys_addrs[0])
+			continue;
+		if (nr_addrs == 1)
+			return msi_page;
+		if (msi_page->range_size == size &&
+		    iommu_dma_msi_range_matches(msi_page_list, msi_page, phys_addrs,
+						nr_addrs, granule))
 			return msi_page;
+	}
 
-	msi_page = kzalloc_obj(*msi_page);
-	if (!msi_page)
-		return NULL;
+	for (i = 0; i < nr_addrs; i++) {
+		msi_page = kzalloc_obj(*msi_page);
+		if (!msi_page)
+			goto out_free_pages;
+		list_add_tail(&msi_page->list, &new_msi_pages);
+	}
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
-	if (!iova)
-		goto out_free_page;
+	base_iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	if (!base_iova)
+		goto out_free_pages;
 
-	if (iommu_map(domain, iova, msi_addr, size, prot, GFP_KERNEL))
-		goto out_free_iova;
+	i = 0;
+	list_for_each_entry(msi_page, &new_msi_pages, list) {
+		msi_page->phys = phys_addrs[i];
+		msi_page->iova = base_iova + i * granule;
+		if (!i)
+			first_page = msi_page;
+		if (iommu_map(domain, msi_page->iova, msi_page->phys, granule, prot, GFP_KERNEL))
+			goto out_unmap;
+		i++;
+	}
 
-	INIT_LIST_HEAD(&msi_page->list);
-	msi_page->phys = msi_addr;
-	msi_page->iova = iova;
-	list_add(&msi_page->list, msi_page_list);
-	return msi_page;
+	first_page->range_size = size;
+	list_splice(&new_msi_pages, msi_page_list);
+	return first_page;
 
-out_free_iova:
-	iommu_dma_free_iova(domain, iova, size, NULL);
-out_free_page:
-	kfree(msi_page);
+out_unmap:
+	if (i) {
+		size_t unmap = iommu_unmap(domain, base_iova, i * granule);
+
+		WARN_ON_ONCE(unmap != i * granule);
+	}
+	iommu_dma_free_iova(domain, base_iova, size, NULL);
+out_free_pages:
+	while (!list_empty(&new_msi_pages)) {
+		msi_page = list_first_entry(&new_msi_pages, typeof(*msi_page), list);
+		list_del(&msi_page->list);
+		kfree(msi_page);
+	}
 	return NULL;
 }
 
@@ -2252,19 +2308,23 @@ int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 {
 	struct device *dev = msi_desc_to_dev(desc);
 	const struct iommu_dma_msi_page *msi_page;
+	phys_addr_t phys_addr;
+	size_t granule;
 
 	if (!has_msi_cookie(domain)) {
 		msi_desc_set_iommu_msi_iova(desc, 0, 0);
 		return 0;
 	}
 
+	granule = cookie_msi_granule(domain);
+	phys_addr = ALIGN_DOWN(msi_addr, granule);
+
 	iommu_group_mutex_assert(dev);
-	msi_page = iommu_dma_get_msi_page(dev, msi_addr, domain);
+	msi_page = iommu_dma_get_msi_page(dev, &phys_addr, 1, granule, domain);
 	if (!msi_page)
 		return -ENOMEM;
 
-	msi_desc_set_iommu_msi_iova(desc, msi_page->iova,
-				    ilog2(cookie_msi_granule(domain)));
+	msi_desc_set_iommu_msi_iova(desc, msi_page->iova, ilog2(granule));
 	return 0;
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
