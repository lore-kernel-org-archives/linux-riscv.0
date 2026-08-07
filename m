Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C581EC5AC80
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3v8GAS3wNKjcoOtTPJ5DqwmKUTu1nkyVdDTz6+sEynw=; b=2PmeO4+2Z+KfDA
	5mj4y2eIIbX0aRFizf9IsBtL6VZGXCiZeLKy8Y5PmuIZecGL+9dt06PfHKw4HD2ZQXnK3p5lMb3MT
	CIC7PL1wi3qoagWe7JposJX361PTQQ/jDNCeaFUeWwNhH9p0+6g6/xkWJwpB1aXkIO8HeRYQIeA81
	+JG43V3L/VS7BwX34HTrTxrP9f0wJOLlZCEzfWUa8MA56iRw3wwUSPgLvFhCUzDQg+/0aZZR0710f
	iLYOFhU/CKvkDdIA+tZV32I08JzwD2GfpjJl1okPhG2utcCRYlJzeHcBiOjQW4b/n7Fjvq+s6HxSB
	l7gYSiqAdWjNkbwoRbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8L-00000008ZDV-3w5E;
	Fri, 07 Aug 2026 18:17:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8J-00000008ZBW-0o5D
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GbWLR1474814
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YhX2nHzAOkI
	yGYt/XhkJLiFU6XfxZrwAHaxRl8HBkc8=; b=hiz0b8bkvnQctuy4Al3BkBz2Ofv
	Us9htKtvCbxmF/6OyfcFJWHSk00jVKZolgBn4dW1MUspXiU++G6eBtJBFJpzwJ+5
	6YtT39cd2eN4+slIqN0icqaYUxvDLLjhJqJHIh84gODU6iLpmygh2ZJecJlbCNHN
	L7kmTrPw8FkJTk5Hs7pfCQfXR5aXLlQogSTsizUcvn5V29/tB0kt1VRMGi1UXIdn
	/RTZfHPlNjTykKz8o5XA0Dp/0ZIaPthHFpo5H95qyGwSGd8P80VL3AAtoqVcCJSw
	nn4P95+y1eqfGB9fqB4xUP5sO7FPxjfjDyFl7MrC6KoDPE0UofWy+JdKU4Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwk228f6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso39207371cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126645; x=1786731445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhX2nHzAOkIyGYt/XhkJLiFU6XfxZrwAHaxRl8HBkc8=;
        b=cUn1jY/lnt9olgdZ3W5/M1HFPx+AV/nrwioj5S60SYi6pLFECfbTTseiOJ59uqii9X
         l5EtNuFslH7xT6EKAJte/LGL7c1HnsAHFRP/xk2vaQrT5x5zilKy7iadwvkZNe0yF7VZ
         DqahScmj6Dm2WbEvILjmJSa0A2Hg2VflJzud9KqZP/eLdhk+BVnlI7aAd42HKU5Yvyrv
         Jez+RfyHIenzOJOaGHHARVUZPZWhkQ5qwAor9976YC+6BQwacwC+qmDX/cfL8ZKm2Dfu
         B08d9egGC/mh6oii67nxj6iXRLtNx14HL1iRt1eMf9unhTYQYK2t22JXW5aZZo5P54DM
         +8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126645; x=1786731445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YhX2nHzAOkIyGYt/XhkJLiFU6XfxZrwAHaxRl8HBkc8=;
        b=cbez4JZd7qoztPAoaqEVUVUDYwOO0vkVpZQLf+iYKIydHJjaA19efDCx8Yng+uNii3
         V9hsOqxNHftVEuQKJlNb0MuIGt20VOQxsvihCFNCV6wD6/gaNektpmQXcCBFUPuj4hfE
         rHr/4xGdNNkEMdnW+quL42al+KWUHKf1Q5Tuz0m73cuDIdmggZQuhqyD6Ik5wA724Hb/
         Wm47V6Wh5Pm4+ppoZ8GqSXUGI0zchNctIJ6Lj/x4g4g/ZESXaVIk81zFU5BqAZeFcFjm
         nI2kYmKYGlwE+wBPr1RppicX0++EcoogqSE2jf6GTAmxkB3rBaOTqd0Zo+ozEP+WAjkO
         vZ/Q==
X-Gm-Message-State: AOJu0YyWseRfAYjYHZ3ZjrjU88/o67yxH3OKwfMFKSWEbWrNjH4MbFn0
	sWA2VYocX0BX0R6l1Dv8acbHlO5H4qk+Tm9qo8VnYakXbI6izC2/MvF7P5vGITO7XoiKAn33llB
	5roR2eadYNFMghxqk5dUi0anO0vx8Sba2mmokHvQbQ90y/0jaV1wv3+72vtW5ajOyF+snQ0azDA
	v8ZhE=
X-Gm-Gg: AR+sD13TAiBqSf5vnPdvJ5ffv8w1ZQ2QivW33kp7TyJk8w+97UIE9CT33NOT1Ql8cku
	NVsnTk7QWrw1jUnqwRKVAhN4Cw2nvOzKuJiQDhCjR1iWewvgATMZDjDvMqcseWpuI3ohkyv2qb2
	E16vxSZ+BPEsjf13deKD6jSpP8YhZDBt+qHhw/vMYTKtv0BfXzY/oRWWLO7+vTihrRB3w8eYtG6
	iTOZAE6QceY8ixWa2C4LLU+X9+N/4LZ3M26mHffF4k7CbLn7v3CxSncI3K8td5BSYNfiUIicHWk
	1GPqrjhQYJhxrLaIQ1k8rXRrmFtWOrPCb3WKtu3vSgE0/bxr8TcuGOM1hG6iL7UnKvDWvXKS6EF
	vZpPIIVP73oc3bpBCzi1912uEqhNhzeRbJIvot1g=
X-Received: by 2002:a05:622a:1f8b:b0:51c:2135:b00a with SMTP id d75a77b69052e-52ce621ad2cmr288738721cf.40.1786126645069;
        Fri, 07 Aug 2026 11:17:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8b:b0:51c:2135:b00a with SMTP id d75a77b69052e-52ce621ad2cmr288737691cf.40.1786126644455;
        Fri, 07 Aug 2026 11:17:24 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a2b1f1sm82039066b.12.2026.08.07.11.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:23 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 04/19] iommu/dma: Add iommu_dma_map_msi()
Date: Fri,  7 Aug 2026 20:16:58 +0200
Message-ID: <20260807181713.228535-5-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 6g_UtxEvHwzdh8dDCapDIzVRG78Q4Gxl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX/mRYF5vb1/HN
 MqzGkQOk3ILuSVTCdhArwmsRKpBZkSC7wEv/KHLj3ss1jVQ5eA2Bujv/xP/3t20I3OobQkuLrIo
 1XDNxgs5fIe22VAc6mNuSCgFN8IiQKbPAnOCb79KPpnTrfMyuR6FcF8RUrp+BBkMg6jJ9EJhEj+
 HFm+YY5WPyiIYW6PckLshZbNUT5khUpY3bofxe7NNnqxotZQz3aqzci+I8LWRPUX6fDQfLsl7kf
 mnd3ghMnh2T7BCUnENRduOLlfFiojUd+vET3caiZoikrOsnyy6fwIZMHx/ZzyZkdp3DH/5z6z49
 +NENj4nZfgmr6/p/Iga4fHw756nPJHO+J08hE7RfEJ+00qrhZ3ZtHVrn7abg7hqQnzhBnswNTT+
 1OJQjDe6pGSE3VD1IJyhiDnd2EPn1Sa2sPGexSvuFkxFIIrMkwl+R4TmBFQ2hUbCUAlqBxxjbGU
 OiPawaJDrYZmcSokssw==
X-Authority-Analysis: v=2.4 cv=bcBbluPB c=1 sm=1 tr=0 ts=6a762135 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nir-2xX3lSHJcyBuNR8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 6g_UtxEvHwzdh8dDCapDIzVRG78Q4Gxl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX1PmllUIFihep
 fwTJfXWT2hC6bGLQeOTSYtwR+ax5y/8JT2uT2mwxEhVJOqpvAlLzyQZJua2HIFXEUoRXLV68kSQ
 xkSLO1X4kl0XQrnVEfC6eprsAbkEOlo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111727_373643_C27C8957 
X-CRM114-Status: GOOD (  29.11  )
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

Add iommu_dma_map_msi() to map an MSI doorbell and return the IOVA
and granule shift to callers that need their own PA->IOVA lookup,
dispatching to the DMA-IOMMU or iommufd cookie implementation as
appropriate.

Callers may pass a required mapping size so MSI doorbells that must
not share a larger IOMMU leaf, such as RISC-V IMSIC files, can fail
before a mapping is installed.

iommu_dma_map_msi() requires the caller to hold @dev's iommu group
mutex, but struct iommu_group is private to drivers/iommu/iommu.c, so
a caller outside the core (e.g. an interrupt-remapping driver building
a table of mappings ahead of any MSI descriptor existing) has no way
to take it. Add iommu_group_mutex_lock()/iommu_group_mutex_unlock() to
bridge that gap, next to the existing iommu_group_mutex_assert().

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c      |  22 +------
 drivers/iommu/dma-iommu.h      |   8 ---
 drivers/iommu/iommu-priv.h     |   8 ---
 drivers/iommu/iommu.c          | 104 ++++++++++++++++++++++++++++-----
 drivers/iommu/iommufd/driver.c |  31 ++--------
 include/linux/iommu.h          |  31 ++++++++++
 6 files changed, 127 insertions(+), 77 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 56a5072b4dde..bcd3eb94bee5 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2235,9 +2235,9 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 }
 
 /*
- * Descriptor-free counterpart to iommu_dma_sw_msi(). Maps an MSI physical
- * page into the domain and returns the IOVA and mapping granule. Used for
- * pre-mapping MSI targets before any MSI descriptor has been set.
+ * Maps an MSI physical page into the domain and returns the IOVA and
+ * mapping granule. Used for pre-mapping MSI targets before any MSI
+ * descriptor has been set.
  *
  * The caller must pass a device attached to @domain and hold @dev's IOMMU
  * group mutex. If @required_size is non-zero then it must exactly match the
@@ -2271,22 +2271,6 @@ int iommu_dma_sw_map_msi(struct iommu_domain *domain,
 	return 0;
 }
 
-int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		     phys_addr_t msi_addr)
-{
-	struct device *dev = msi_desc_to_dev(desc);
-	dma_addr_t msi_iova;
-	unsigned int msi_shift;
-	int ret;
-
-	ret = iommu_dma_sw_map_msi(domain, dev, msi_addr, 0, &msi_iova, &msi_shift);
-	if (ret)
-		return ret;
-
-	msi_desc_set_iommu_msi_iova(desc, msi_iova, msi_shift);
-	return 0;
-}
-
 static int iommu_dma_init(void)
 {
 	if (is_kdump_kernel())
diff --git a/drivers/iommu/dma-iommu.h b/drivers/iommu/dma-iommu.h
index 3e1adeafdcac..7d707157aebb 100644
--- a/drivers/iommu/dma-iommu.h
+++ b/drivers/iommu/dma-iommu.h
@@ -23,8 +23,6 @@ int iommu_dma_sw_map_msi(struct iommu_domain *domain,
 			 struct device *dev, phys_addr_t msi_addr,
 			 size_t required_size, dma_addr_t *msi_iova,
 			 unsigned int *msi_shift);
-int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		     phys_addr_t msi_addr);
 
 extern bool iommu_dma_forcedac;
 
@@ -65,11 +63,5 @@ static inline int iommu_dma_sw_map_msi(struct iommu_domain *domain,
 	return -ENODEV;
 }
 
-static inline int iommu_dma_sw_msi(struct iommu_domain *domain,
-				   struct msi_desc *desc, phys_addr_t msi_addr)
-{
-	return -ENODEV;
-}
-
 #endif	/* CONFIG_IOMMU_DMA */
 #endif	/* __DMA_IOMMU_H */
diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
index f60373cd2f70..109aca07470b 100644
--- a/drivers/iommu/iommu-priv.h
+++ b/drivers/iommu/iommu-priv.h
@@ -53,18 +53,10 @@ int iommu_replace_group_handle(struct iommu_group *group,
 			       struct iommu_attach_handle *handle);
 
 #if IS_ENABLED(CONFIG_IOMMUFD_DRIVER_CORE) && IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
-int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		   phys_addr_t msi_addr);
 int iommufd_sw_map_msi(struct iommu_domain *domain, struct device *dev,
 		       phys_addr_t msi_addr, size_t required_size,
 		       dma_addr_t *msi_iova, unsigned int *msi_shift);
 #else /* !CONFIG_IOMMUFD_DRIVER_CORE || !CONFIG_IRQ_MSI_IOMMU */
-static inline int iommufd_sw_msi(struct iommu_domain *domain,
-				 struct msi_desc *desc, phys_addr_t msi_addr)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline int iommufd_sw_map_msi(struct iommu_domain *domain,
 				     struct device *dev, phys_addr_t msi_addr,
 				     size_t required_size, dma_addr_t *msi_iova,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e8f13dcebbde..15adaf55666f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1364,15 +1364,46 @@ void iommu_group_remove_device(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(iommu_group_remove_device);
 
-#if IS_ENABLED(CONFIG_LOCKDEP) && IS_ENABLED(CONFIG_IOMMU_API)
+#if IS_ENABLED(CONFIG_IOMMU_API)
+/*
+ * iommu_group_mutex_lock(), iommu_group_mutex_unlock(), and
+ * iommu_group_mutex_assert() must be called after device group param is
+ * set.
+ */
+
+/**
+ * iommu_group_mutex_lock - Lock the iommu group mutex for a device
+ * @dev: the device whose group mutex should be locked
+ *
+ * Callers that need to invoke a function documented as requiring the
+ * device's iommu group mutex (e.g. iommu_dma_map_msi()) from outside
+ * drivers/iommu/ use this instead of reaching into struct iommu_group,
+ * which is private to the core. Must be paired with
+ * iommu_group_mutex_unlock().
+ */
+void iommu_group_mutex_lock(struct device *dev)
+{
+	mutex_lock(&dev->iommu_group->mutex);
+}
+EXPORT_SYMBOL_GPL(iommu_group_mutex_lock);
+
+/**
+ * iommu_group_mutex_unlock - Unlock the iommu group mutex for a device
+ * @dev: the device whose group mutex should be unlocked
+ */
+void iommu_group_mutex_unlock(struct device *dev)
+{
+	mutex_unlock(&dev->iommu_group->mutex);
+}
+EXPORT_SYMBOL_GPL(iommu_group_mutex_unlock);
+
+#if IS_ENABLED(CONFIG_LOCKDEP)
 /**
  * iommu_group_mutex_assert - Check device group mutex lock
  * @dev: the device that has group param set
  *
  * This function is called by an iommu driver to check whether it holds
  * group mutex lock for the given device or not.
- *
- * Note that this function must be called after device group param is set.
  */
 void iommu_group_mutex_assert(struct device *dev)
 {
@@ -1381,7 +1412,8 @@ void iommu_group_mutex_assert(struct device *dev)
 	lockdep_assert_held(&group->mutex);
 }
 EXPORT_SYMBOL_GPL(iommu_group_mutex_assert);
-#endif
+#endif /* CONFIG_LOCKDEP */
+#endif /* CONFIG_IOMMU_API */
 
 static struct device *iommu_group_first_dev(struct iommu_group *group)
 {
@@ -4223,6 +4255,52 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 EXPORT_SYMBOL_GPL(pci_dev_reset_iommu_done);
 
 #if IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
+/**
+ * iommu_dma_map_msi() - Map an MSI page in an IOMMU domain
+ * @domain: IOMMU domain to map into
+ * @dev: Device used to allocate the IOVA
+ * @msi_addr: MSI target address to be mapped
+ * @required_size: Required mapping size, or 0 to accept any size
+ * @msi_iova: IOVA for @msi_addr, or 0 for passthrough
+ * @msi_shift: Mapping granule shift, or 0 for passthrough
+ *
+ * The caller must hold @dev's iommu group mutex, e.g. via
+ * iommu_group_mutex_lock()/iommu_group_mutex_unlock(). This function does
+ * not take the mutex itself because callers building a table of mappings
+ * (e.g. one IOVA per possible CPU's IMSIC page) call it in a loop; locking
+ * inside would mean re-acquiring the mutex on every iteration and would not
+ * stop the domain from changing between iterations, leaving the table
+ * inconsistent. The caller locks once around the whole loop instead.
+ *
+ * Return: 0 on success or negative error code if the mapping failed.
+ */
+int iommu_dma_map_msi(struct iommu_domain *domain,
+		      struct device *dev, phys_addr_t msi_addr,
+		      size_t required_size, dma_addr_t *msi_iova,
+		      unsigned int *msi_shift)
+{
+	*msi_iova = 0;
+	*msi_shift = 0;
+
+	if (!domain)
+		return -EINVAL;
+
+	if (domain->type == IOMMU_DOMAIN_IDENTITY)
+		return 0;
+
+	switch (domain->cookie_type) {
+	case IOMMU_COOKIE_DMA_MSI:
+	case IOMMU_COOKIE_DMA_IOVA:
+		return iommu_dma_sw_map_msi(domain, dev, msi_addr,
+					    required_size, msi_iova, msi_shift);
+	case IOMMU_COOKIE_IOMMUFD:
+		return iommufd_sw_map_msi(domain, dev, msi_addr,
+					  required_size, msi_iova, msi_shift);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 /**
  * iommu_dma_prepare_msi() - Map the MSI page in the IOMMU domain
  * @desc: MSI descriptor, will store the MSI page
@@ -4238,6 +4316,8 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 {
 	struct device *dev = msi_desc_to_dev(desc);
 	struct iommu_group *group = dev->iommu_group;
+	dma_addr_t msi_iova;
+	unsigned int msi_shift;
 	int ret = 0;
 
 	if (!group)
@@ -4246,18 +4326,10 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 	mutex_lock(&group->mutex);
 	/* An IDENTITY domain must pass through */
 	if (group->domain && group->domain->type != IOMMU_DOMAIN_IDENTITY) {
-		switch (group->domain->cookie_type) {
-		case IOMMU_COOKIE_DMA_MSI:
-		case IOMMU_COOKIE_DMA_IOVA:
-			ret = iommu_dma_sw_msi(group->domain, desc, msi_addr);
-			break;
-		case IOMMU_COOKIE_IOMMUFD:
-			ret = iommufd_sw_msi(group->domain, desc, msi_addr);
-			break;
-		default:
-			ret = -EOPNOTSUPP;
-			break;
-		}
+		ret = iommu_dma_map_msi(group->domain, dev, msi_addr, 0,
+					&msi_iova, &msi_shift);
+		if (!ret)
+			msi_desc_set_iommu_msi_iova(desc, msi_iova, msi_shift);
 	}
 	mutex_unlock(&group->mutex);
 	return ret;
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 69b3dbcbee3b..b39796bc7251 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -249,11 +249,11 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi_install, "IOMMUFD_INTERNAL");
 
 /*
- * Descriptor-free counterpart to iommufd_sw_msi(). Maps an MSI physical page
- * into the domain and returns the IOVA. Used for pre-mapping MSI targets before
- * any MSI descriptor has been set (e.g. IMSIC doorbell pages). The IOVA is
- * global to the iommufd file descriptor: every domain and device using the
- * same MSI parameters gets the same IOVA.
+ * Maps an MSI physical page into the domain and returns the IOVA. Used for
+ * pre-mapping MSI targets before any MSI descriptor has been set (e.g.
+ * IMSIC doorbell pages). The IOVA is global to the iommufd file
+ * descriptor: every domain and device using the same MSI parameters gets
+ * the same IOVA.
  *
  * msi_addr is the exact byte offset of the MSI doorbell; the caller must have
  * verified it is contained within an MMIO region safe to map at PAGE_SIZE. If
@@ -321,27 +321,6 @@ int iommufd_sw_map_msi(struct iommu_domain *domain, struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_map_msi, "IOMMUFD");
-
-/*
- * Called by the irq layer when the platform translates MSI addresses through
- * the IOMMU. Wraps iommufd_sw_map_msi() and stores the result in the descriptor.
- */
-int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		   phys_addr_t msi_addr)
-{
-	dma_addr_t msi_iova;
-	unsigned int msi_shift;
-	int rc;
-
-	rc = iommufd_sw_map_msi(domain, msi_desc_to_dev(desc), msi_addr,
-				0, &msi_iova, &msi_shift);
-	if (rc)
-		return rc;
-
-	msi_desc_set_iommu_msi_iova(desc, msi_iova, msi_shift);
-	return 0;
-}
-EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi, "IOMMUFD");
 #endif
 
 MODULE_DESCRIPTION("iommufd code shared with builtin modules");
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d20aa6f6863a..1745ef1525da 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -8,6 +8,7 @@
 #define __LINUX_IOMMU_H
 
 #include <linux/scatterlist.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/types.h>
 #include <linux/errno.h>
@@ -1561,8 +1562,22 @@ static inline void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 
 #ifdef CONFIG_IRQ_MSI_IOMMU
 #ifdef CONFIG_IOMMU_API
+int iommu_dma_map_msi(struct iommu_domain *domain,
+		      struct device *dev, phys_addr_t msi_addr,
+		      size_t required_size, dma_addr_t *msi_iova,
+		      unsigned int *msi_shift);
 int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr);
 #else
+static inline int iommu_dma_map_msi(struct iommu_domain *domain,
+				    struct device *dev, phys_addr_t msi_addr,
+				    size_t required_size, dma_addr_t *msi_iova,
+				    unsigned int *msi_shift)
+{
+	*msi_iova = 0;
+	*msi_shift = 0;
+	return 0;
+}
+
 static inline int iommu_dma_prepare_msi(struct msi_desc *desc,
 					phys_addr_t msi_addr)
 {
@@ -1571,6 +1586,22 @@ static inline int iommu_dma_prepare_msi(struct msi_desc *desc,
 #endif /* CONFIG_IOMMU_API */
 #endif /* CONFIG_IRQ_MSI_IOMMU */
 
+#if IS_ENABLED(CONFIG_IOMMU_API)
+void iommu_group_mutex_lock(struct device *dev);
+void iommu_group_mutex_unlock(struct device *dev);
+#else
+static inline void iommu_group_mutex_lock(struct device *dev) { }
+static inline void iommu_group_mutex_unlock(struct device *dev) { }
+#endif
+
+/*
+ * scoped_guard(iommu_group, dev) { ... } locks dev's iommu group mutex for
+ * the scope of the block. See iommu_group_mutex_lock().
+ */
+DEFINE_LOCK_GUARD_1(iommu_group, struct device,
+		    iommu_group_mutex_lock(_T->lock),
+		    iommu_group_mutex_unlock(_T->lock))
+
 #if IS_ENABLED(CONFIG_LOCKDEP) && IS_ENABLED(CONFIG_IOMMU_API)
 void iommu_group_mutex_assert(struct device *dev);
 #else
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
