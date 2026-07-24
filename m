Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D16C53200
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DB3Ub5QR+oqKhtmC1qoC66TahyjBQlklfsQHud4kOog=; b=06LLP8TTwp9tQP
	qHj6Ben0l2IIXM3F/zETJeGwxNt7rFwxn8A0VeKDWjymFck9qm/ho0+p5HXFZWBJc/YxiK5tIMEmK
	5AeTnwXDbvP/LiTa+7W4E8lXarndq/dq4tyhEEWfSnZUzZbTZ+TshnTyDCkJUYF+YNyEwwrVL2G3I
	yGvQKEgxwCAZGHoqMoyqbyxAUUbAy6ZvlOCs3yeFwN0GGvK9NklrIT/ajYkEMhh6Kw4OMIBV9dVQG
	ugvtF2KtfV9MwzeajW749byEWburdTGzA92npsP/eMsMqmGd31gM+9+uZ7VV4yd9Naonmgm1cMCmH
	pGS9UedWOx9X1L9Bi0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZe-0000000GexS-0DTp;
	Fri, 24 Jul 2026 15:12:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZa-0000000Gew1-41Dk
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODb8D03344396
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8mou5jvBrPN
	eVlfrTJOWH/Ft8cQ0Na/otKYhZJRU3yw=; b=VDqmctcG1YLVI2xKoOaHWL9UV4t
	Qej/HcfCBVQJfpdK3rUpwunlKDlsIJxTYP4a8e3mBjqvD3xCmIKnJHDcv+jaA6yb
	gA1e5yXAA9Gyb/VDzNSF/J3qMdDoDISRclJBInk8sd+OMPQn06rsJWq4Kwh5vlB/
	pllnZ9nMGzereMxmpe8T029uEl5rEcuURLK6L7zAxygvLGkuYJkLIPmLevdvvO4B
	qHcRyrYgFDRRgSC4Z85x7sKBc2224paYMGWi9jYfKDI4b3+OiD1MGDN9FhlAYqOj
	l68muHCwOzh7YbABFBbk9RnElKuD/sLAq7pDkz4/rZCgyPfyuRrtWcjIzmg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0jgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e6f602cso8746261cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905945; x=1785510745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mou5jvBrPNeVlfrTJOWH/Ft8cQ0Na/otKYhZJRU3yw=;
        b=D/51FDvKPtw0d3szT+SF9QcTiO/xQePDxFlqfbyV18u5sMxe6SjvK5IQ08JOqcZURQ
         ejQrvzCFv2ex/2+c6+ViQzaooGWEtrp2JcpmwpWKN0ji5WNkNhrY6D7Phes6O3fkQfDQ
         1zXml7PaDRu7RebWHKW4G8IP+ISF1cH8Gd0Yy/yvHG8Bpw8x5CYkJjOH7/ZXeuEzJhzo
         Me62MAxMs2x/csv+b2y9UbmnHSOVZT66trLxeP+qOabeH64oF0USxlvLQIpcLcTVH01V
         odTQCtqxi6gCh4ZzrHezoFU88XGKiZDB9bE6nZH3WSUe2HoLqoyoKoiV2CP1OLjWbHAt
         UVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905945; x=1785510745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8mou5jvBrPNeVlfrTJOWH/Ft8cQ0Na/otKYhZJRU3yw=;
        b=qo1WEkMzHNUP+sSziV4zQSXB8WYRpvfaoAXNsv3JiVHXVVeHZAhc2pAsWgAOEjmMxi
         2VSMvDOWWzVi+lDJ0eGDBDQs/rG+IyNjv8yySgdI/PQHlpLWIM2Hw34VK/6LtJoSFBy5
         VmbzNKUu3hFuTmyp8RlZg7nwaNaCrLbUA/aTYpz8RPWt0V1ZdnmkcdT7TyaxaYOTAuQE
         1KHLTQOdV3LYIZCXPOpCMR74VugzWD6xTHkFl17FzuBq64VoPy4Kznw1SMoxHhzQPWVI
         0bwjT2p9Q/lSeeSPZRbFiOpNSoU+B5ULZIFOXMQ4StCmmYJFGW4swHP08K1u2f5PdXoC
         DhWw==
X-Gm-Message-State: AOJu0YzN2qYFd4V/yRvVr8Qdfm7Rj0ipi4mSavR+qwfH/+NPoEJXDNNO
	A733XUp7uq8mHh7OyWnMAuURSkknM/fE/PBu8I2vmAetG2YqVV1NWXOmngHeEC4b3Ad3IkFDaGI
	QOce03j62OKKQZDxK6MYDFFE43f5ZYJ9wAA1YiR5dUvZzFDXvzEhVNXSJz2NuqWkHCzT7XHoLWR
	GB+Uc=
X-Gm-Gg: AR+sD13vAPELXcDKxTc92yNzeAVGMGbZunKDRRPxTG7fH//vzy5La95NCOd8ozLT4Qb
	qKPLkEfCVpLuYgDjgBgLUgNiGN3FNlkvx94AZo/t1wqsSd/kmjToMN/hzzozw6MjFLUtdcJHbmg
	HP6QgWvikpPYl2j25pe/7Str7/5bnBZsSkPxpsoTpV68aRmAq4V0C1W0eOG/ud+bKz+C6PU4yr2
	IaUlYNAZif337EQCqs5z1SKHJqs3thXIMCSWCc0VRLXgyu8zXesAiuhWKTsawSsSVSX/RVg79Qx
	+I9Wt1hGr0JhnveLlC22J8/BPQJc2qe84LXjv2IyqztTNDMMqeNAkp5dAHaJOMHIMbWWoCUwvf6
	zP0683ysH3xa70ozo3MEWzhm4puRJj/hnU3iQ
X-Received: by 2002:a05:622a:1a8e:b0:51c:1641:e73a with SMTP id d75a77b69052e-5283df4fe59mr78778491cf.44.1784905945316;
        Fri, 24 Jul 2026 08:12:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8e:b0:51c:1641:e73a with SMTP id d75a77b69052e-5283df4fe59mr78777941cf.44.1784905944771;
        Fri, 24 Jul 2026 08:12:24 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c98c5sm150836a12.11.2026.07.24.08.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:23 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 02/14] iommufd: Add iommufd_sw_map_msi()
Date: Fri, 24 Jul 2026 17:12:06 +0200
Message-ID: <20260724151218.965929-3-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfXycS52rUZbnez
 xLziNTZ19R75Vxua8G3shKyaFwJrjMcwM6pBxjFDOxxc9cvY8Hzod3cWbj3SR3aVmZKcFnHIU0C
 ZoTvopBwvhLG7HFZ4MJaV2/l0kHhEwg=
X-Proofpoint-GUID: 5Z9_-k-FV_JiJJ3ADsmyviL7RwFJc3oj
X-Proofpoint-ORIG-GUID: 5Z9_-k-FV_JiJJ3ADsmyviL7RwFJc3oj
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a6380da cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5IMjXt7tboKol454yg4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX4q0XYQzt2yVZ
 xqzsE62Cfqtn4LR3PrDGm3po7J8YuBkmS0QvG0nlgffHfYuYFbNO2k7EE659HVhg+G5Bvftya9H
 DhucJVEUWhDxE/T49hvoMYYSWxw5JSfAw7R9FTsAkm8vIhBlLv4Q08WVElcW76UKGhUE2GfB8t7
 WBXzZ/JArR+hgDG1UEh16aQRlfV/TemaardS3ussoosmWpiReKndwYpjMD/kiXmhrmGScXvP8ri
 TPnPmG2b/HykbMQ5tcygyqHpFVp3/ABBW8Xy/uzzRQV5MX0dGXuSJjsPHuz9/yyZ+hGhwA4a4Oy
 hsDSxyAK7Tnnb+ti/kiVQQcwAb6MAR+W5aJcAnO3G1SY1OCWccPRUWuZudj3WjusNc40qY1SSs6
 AW7rniQ6FPRn2QZTdq+znL80aGUheUIqfjGYZHQbXeYqR/RGdKpn3vBz9VkBHMniju1E0kuaYOw
 49H+LdRYngHhUzM9Ygg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081227_064558_5D09B0B1 
X-CRM114-Status: GOOD (  23.16  )
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
 drivers/iommu/iommufd/driver.c | 59 +++++++++++++++++++++++++---------
 2 files changed, 55 insertions(+), 15 deletions(-)

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
index 3cd617dfc351..9aad5c69d4ac 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -249,15 +249,22 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
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
+ * required_size is non-zero it must equal PAGE_SIZE.
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
@@ -266,6 +273,12 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
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
@@ -286,13 +299,7 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 
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
@@ -308,7 +315,29 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
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
