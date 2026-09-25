Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E67C98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOIoPCVqa4zKdvdeWB8vE/kdfTRBBxmkCrZHpdmd9Ss=; b=HoriDbI6BiI4jy
	Y+as7LWv62NVt4KQXPRLOb6ymJr0dGOrnNUAAEttumBc1MnMcuRZQSUpn59nfqLyWpHkp7YNL02Wi
	BqeLYedgrL/YEdl0z9f+A+U3kTcUfROL1+YEYXWjFmKI0Jpj9onaTw80zHhjvoDh+acw27iDPJPlq
	mLlI2Ip69dcdtt4zNHcJjFZdjQNiUJOmFuwmwxTXNv2HT3iY/vLKycckyvz3L8Ckzw96npvnJaDay
	vpF4mT7xmLWJAdXO29KMWTCT1SRbSza4LaGPT4tJ+zV9WCO+ycrJjtAqT6TY80ByErqoR/XfoZFdW
	Olq8z56K8RMNSN/SeLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fi-0000000DjmY-1m93;
	Fri, 25 Sep 2026 15:17:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fe-0000000DjlD-1SzD
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD3tlq289475
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hEPKavc8j9V
	N94Q3baQAu9FNMxrJyRmn7Q8gFTEEhzY=; b=dNMUMWhL9s2tbL/mWLkBj+9XARj
	HE+G1BO7uzXxS5tTiZqW2ouCNsR+6HxGjcDXfeSexVJIUOgEf7VmE6LLOUoncHka
	vVfzCq8s2diX4TIKA519jd9BMS6Gn9bPFn/ieiq05tMDYBHxAAti0h4J6XT0y2xC
	F3bJ7WU+2g9nOZ80MlnVA85seqJvYyHWE25sPaUp9VQUF/5bEZ2mdTP935j4Kmzg
	0euS4816jwBwes3EGkxEX9LKi1ubcnSPrGG/ChALgaMo0o6tT0mVopI9eDBwaz8A
	th7EQSgzln/+kOOb7s8JthYgupT0/1Iqn7R+aBZmf/LI8R1TcIVdFNz0kkw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881v4r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:05 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-985374f150aso113410241.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349425; x=1790954225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEPKavc8j9VN94Q3baQAu9FNMxrJyRmn7Q8gFTEEhzY=;
        b=OidzDc4E4PD/GyrK5b2sovtBXDRoVehFqs25UpCOpUbEkjRnXwBZ/SkLgzSjicJQCp
         Ye6uzOC8Qo3mwbV3EA5r1WeXkwEG6vLpXLLc1IcgkzKZXIOlx9XUY+HmQgbFb0GVdEIa
         wE1+YFyw4mOs3EVtAU4s2n6lt1E2sEAfIYNeL8Msy7vav6SgQWHciQNU+ZM8ronVa/QD
         S8WIrMiKu8A9Lr2Qk70PqoAtbIE0idjOJFaGUvTNLoopUICIzwxNGNBs1nLVDgCakV2T
         l6IZ/j3XV2YPOpBtjxrZFmx8gGRkUJ4+dXUMsI6DUV6I5G/aj+VrzYrSLXYxyT00iB+K
         6scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349425; x=1790954225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEPKavc8j9VN94Q3baQAu9FNMxrJyRmn7Q8gFTEEhzY=;
        b=pQRHWisCWk/TX8JsX4Tqeyc7iOia+86TTaKIltPLL5xXa1Rv273o5uQ7ibykaq1p9R
         KZCKlVCBRG95rKklepGbrr7713AETHQq4GpmDwxSVJlPwvdv46sBINkm2X1P2N8p88kr
         w7dWRXyNlJM4OdL5eVaC7obkYGb/BDfCwAgb0QPoXpiZRIRdNM7Qy5HyPHtxOblxM7IL
         awALTQK0vMH4gqeYyn6buUC7NoCB7FH9xVWkMj2TAwkK578WtUIwWBRX0E5Z6StA88iU
         8ux+99V4l/+x2JVQiHyvd6a25ZmmDrv/NNn2tWv1bpD/u3TSK5YKhDxpsu9rNANQv1HY
         euNg==
X-Gm-Message-State: AFuF++mENKzGdSNh6TAUno60RN+FLI3Eu5jkq4OZ6kvYAMAo6ZnUj9xm
	Bg1QeCRpUMS86CqVeLTkKm9UIOWz6Ao94ZUMgRN85qAvplNqFB1wpt4z23fl3QuG6Te4BWGqKRS
	hOllFERYchLA239qZkncXhLusar9BeQV9UhzrR6ILs7+D4Hdv6Eg4Pz0BdHpJvVIDR+GQNKEty4
	Bp20Q=
X-Gm-Gg: AYBFou2X5Xs6ayBA5/xhgqgVrT3cv1zCHD8vsss8FdZIcdNHnVLjFdbTYOYMOUacax4
	UhkRdIKgutI3d6bFowV+CCNPX3D4BLReelVEpFLZgnq43HItDADy/dpWL5/zTqe9qXW3M1HdReq
	Y9GaLV3xqUcHR72iGk0YgtuuV9Rwuyba3pVSwq4xjUf8W8oVkW1XN5fSnl/AaRHReM3Ik5dD6im
	zv4LaMApG2yYlPTzD7+oIYETVY7wKscePkzFkLdvfCjIYNgcSL/nYdCyOE34vgR/ovnUOYOK77R
	vo/zKfkcuQ37KelNswa5XI39bRqkkK8F9psEMsc54MGFoDjgA+trz0hwZRNfuTWJBp9hhlNglun
	KC6LvsDJ6oL6HzdRVJOP1e/gg990t2/8joKG+ZA==
X-Received: by 2002:a05:6102:61ce:10b0:7b0:3c13:9f09 with SMTP id ada2fe7eead31-7b03c13a338mr986717137.27.1790349424632;
        Fri, 25 Sep 2026 08:17:04 -0700 (PDT)
X-Received: by 2002:a05:6102:61ce:10b0:7b0:3c13:9f09 with SMTP id ada2fe7eead31-7b03c13a338mr986689137.27.1790349424108;
        Fri, 25 Sep 2026 08:17:04 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff21d6209sm30158645e9.4.2026.09.25.08.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:02 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 01/16] iommu/dma: Prepare MSI physical address lists
Date: Fri, 25 Sep 2026 17:16:44 +0200
Message-ID: <20260925151659.419512-2-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab69071 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=kJPfLSheDWDr1nFXzE0A:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXwR5e6+c9GNyn
 N774OHmYnFXnDPBBpdWVfWgZMpenMNCyfywMEKxTwWbaSUN057FhOrP2mNDDMwAS4vqNHUMpgFp
 IbdkxexZ12AXZrF0xDUREewiZGyV29m4suwmP6wDtqLLm5ChWKC3/GIu+WafOlgFgRN/C8UnugS
 1tK34yHmglW2MOw01zkecHCWoq/OKbaBpNK9v32GXfmQr0ibjYmQY99/waET/sVu7D4iCas3aPS
 BEFsP7K3pw6lh7Mm7Z5iprjlvqHmJTr+EVIGpVnnO7ewLJkETAQwweQoTgT03HRLiBLxtUx9wVd
 P66s76k/LTpyGejlLTcKECoW0SCipl0bNqJaKmsdoxAZGm1rxqBEYiQmE2HS+Q5n3PGBlq0oQYO
 K81ivE7xJs//yvmPIod1dd8lhxa/gCr7QO9UvVmvQtTrjQ1dEdP2Evl5ILDz3/jieeFEEI9jYpz
 gDm2oNA5aH3ogjP8vmA==
X-Proofpoint-ORIG-GUID: lAr27xz3jzsNm08XwLtUXHMqrgi0LGeP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXxmL5Y5NymiOn
 bc5QeXaeMbitSJWh6nYuCDZRfwuODTcSa3IVQTArFw+kYW495BEsClww08D6m1eZikW0COt+prC
 rC9Rt03faGLM8PrKdQX7Y+CYyI7yxUQ=
X-Proofpoint-GUID: lAr27xz3jzsNm08XwLtUXHMqrgi0LGeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081706_507673_B3A39610 
X-CRM114-Status: GOOD (  23.44  )
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
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/dma-iommu.c | 116 +++++++++++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 58c624513cd4..0b4eb47d1a95 100644
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
 
@@ -2191,15 +2192,42 @@ static struct list_head *cookie_msi_pages(const struct iommu_domain *domain)
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
@@ -2213,32 +2241,60 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
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
 
@@ -2247,19 +2303,23 @@ int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
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
