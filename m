Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CD6C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADxccGtAff44INbpchtvk0SyinHwk9gegANcnbuTgNY=; b=TDIue66q4XTDBF
	yBo19VKmcwidYnovLZrMtsWuvPPzQWdfV1IBNPQkwQ3GrdVlylR8kiHwwdkW7lfgWgB/fg3C+WdLg
	ldScJ27BvpCAr5eNH1S2b0+K0OxLivt6d+I5gUaxkloxwcUx77rDOr0/gbyF8sRPkXKbltN+0JPcB
	wQipszTh/ZUg2WQrFIT9/fuFXstPHX0iYEblfjRBNUbgTvYkNnteYh5OgnArSUpZyo9243832rWSz
	JmWL/nvy47Czf6JUD7smtPCTpGK5Fz0oXSie5QZZ6hWGKBZ9DHZ7L411Efb70I+Kl+vy4VybzYr1O
	2Xo9M8PbaFeDye2z6QhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZh-0000000Gf0i-2kiW;
	Fri, 24 Jul 2026 15:12:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZf-0000000Gez9-1lJN
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbZq13488490
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uJ2U10c08l7
	aGrL85yzaPlVtXbri90BVENteR8ldZ5k=; b=PKN8maRd1+bSa+vxXWN4mlVWyvb
	w1birrs7Yp0ohf5fepCW43kFCvfL8PrfIFJg/xGaoqUIv2vo4ZhETq5vkFgOyeR0
	SUDlScIfxtVDs/AdruQsY1EV0oPuL432bW9iPRvjPUbmBI54qHRA3KsCTJcWuwW6
	D0RSLkReewgwNHsz8B/SgKsgHk2Gjwoy35NAwAzWVQBJ9cj1+8bLo2NywT/h5GmK
	eLEU6WpBpbWYimzphhRDEesZzsfQetOt4hnnRkiFhyN++zAab8XJBi7FZP2VgzDA
	x5ZAkVmjxjA6YjcV/RSPvsFUilEJx5IvhGF43hMRBPy8GBkETGvFJ07HAtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0cb6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d30035dso6574541cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905950; x=1785510750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJ2U10c08l7aGrL85yzaPlVtXbri90BVENteR8ldZ5k=;
        b=XJVuk5wNTc7m5doUxNQEOynbppjhtEZdGS2Z7yAf4LCYM41q+5C/jVm5OoM9xq5JAN
         AA8siLIVKL8sq/HfpUbVmOMvPUyHT+KrbmeI3Q3Ak4F+NXvCk3/r/ZgWkGfMbFb7yn+t
         AA9WzXF4CcvIWgkVEzRUEq8gjlI4sykR5DeTehiBHrfhprUm0fAqkvOt+ATJDYoxVHU+
         le8qgwmxQyKHlPa2HbXGqHrek+nE3e42Do9xESqKxdKB3rFwkygOqzblKYQPRkn6+NaR
         hlbQWa97Jp2oHkUgn5YfSVpjsTQr24xI15E/Q4y6QSiYaFJvYTad8uJK/qXSsX0yy60j
         xitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905950; x=1785510750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJ2U10c08l7aGrL85yzaPlVtXbri90BVENteR8ldZ5k=;
        b=i9S1m4DSgJeOtauyRGELZhCkwQ5n12AHwe14fQ5t2LRi+V3zwOBI3e2N/uZRhe9wCv
         kpZPYCDLd734rSLBvEwFmPfGqUOKcYXZkQHhfc6mEboZMMzWDanvI7GUvdsmtBid8rek
         tm22RMXRWYEEIrlujnd8zav4GIw6qVo1K/DGea3u7AjNit7q5dVFDsnk0YsNjkEmfpc0
         O8tKCFCUwrEarvqBNyESezNsCwJBTuyd9lyjKYFZ0I0+0RKabI2TBMBrt2ykgzYQINao
         9Um9CDzDpAispDLhKnETx9uz0IZrtvcd9YD2aQLmnhzOmcesGtLZUnQt9NlWnQmwdn4X
         47Eg==
X-Gm-Message-State: AOJu0YyS5PPFECYtNvTcUKfGGAj7cChbmHyIReqZX5xTkXbA+5docuXp
	VSET+4Lz5CXBzHEeqw1W5DMdrK+y57CCjJjSo9v6y42ktRkKw89mXln2uCWlCpC5Kits9QuANtT
	0mzOlD1HbLZoOBD3HEg6QeCzdbrX9pFuGcEZ25ow2X5UzKm9ntZimOCW0PTuclTiLzuH+mWoKQD
	1iqtI=
X-Gm-Gg: AR+sD12EYwC+nogOEaDjUUGK405OV85WSK5BQUDyrjlVR+RL0hROHq0kihAkJigMzpl
	lfahZ2V2DqCtqy1vRuXqC4bzELbFQMi6zJbmIUYwj0Yogsxoe0FD89FHN7fECz5kedeOLdo9ggN
	ancauHCwDatxmtxYSCHaYupZJ8Nn1mJdzOwJTL+2tQ2XAqyzkYaAH9xB+PBLVoj3FY7OUPy6zTO
	0UcYGQzu8hRZYdzmOWbS2hu6MQI6Bt8GJzSKLEiP27RKs/wltxAtwNQbU+OKhDH9FYHANksfbIW
	zSic1ivhJ3Fa8dKyETafFMbVE8dSRg9f635q6s2mS99x1llLtHChQm7Wm/ZVZ+CTZ0D9KqxBI+v
	xSWrqXpLzYu14tMfqssAZrvKBu7rQnJITPbZo
X-Received: by 2002:ac8:5a4b:0:b0:527:69dd:5413 with SMTP id d75a77b69052e-5283dda9badmr76424531cf.5.1784905949730;
        Fri, 24 Jul 2026 08:12:29 -0700 (PDT)
X-Received: by 2002:ac8:5a4b:0:b0:527:69dd:5413 with SMTP id d75a77b69052e-5283dda9badmr76423711cf.5.1784905948908;
        Fri, 24 Jul 2026 08:12:28 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb50bd30fsm159683a12.5.2026.07.24.08.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:27 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 04/14] iommu/dma: Add iommu_dma_map_msi()
Date: Fri, 24 Jul 2026 17:12:08 +0200
Message-ID: <20260724151218.965929-5-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 3g-cuvfWliKITzsbx1nWF1vBQ7zFBdyq
X-Proofpoint-GUID: 3g-cuvfWliKITzsbx1nWF1vBQ7zFBdyq
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a6380de cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=vjeZBn8P1qzF27HCuS4A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfXxWtClXCSDg/F
 y4kja0n2KSKIHcld84KeRzSVf9rXHmcUAJxwUHSgkBE0ee0bwxMVtkIyASBWxSvryGW0Q/yhZcz
 OvpIT4qu/ta4aqHqAS0q12Qv7zTbuTZmx63t8R94pOYW325l7Vx1AgUkhQ29cz/z9DBOhG6DBP+
 dJjuL7zn3PsDGyIbI5d0h2+Nkw+uEMLPLo4uSJw56TSB0ErB5DHJ3mhgKb39aYfIXvJ3t8aFuZG
 16eGkGjODUTxiZnazn0PBTHIOOUh6ekQ1rcW2+IYJcZ27P8FFRC2f9DLkcOKbhXIHCuP9Y3otCH
 S2dlwmDlXhW6l0IhEUhXfpAFqLSOA1MoM+rbuYsEqgQzvbmlpZvmHaYP3UlrfWiIghmxpmUgtiE
 M//ZsrAtWX9U1WzrqB+m9PfKWTLVBg5qPJQor3bUM16eFSPyl/usJ9V1jFbel7SdNyL3eSHfLoz
 pSen6tn/Dni/V0o6Xkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX5XXSr4LHrOhM
 I7n6vtJKaYLMYA2GarbqwF5XWSKZJtlbb07UPzHfSx1o/nhBjj38Cnmi2nUhvrKHSUw+NgGSCXu
 KABQPAKePzp9cMvNwlOrrjLPAKcUCLw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081231_476177_0894B4E7 
X-CRM114-Status: GOOD (  25.48  )
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
 drivers/iommu/iommu.c | 86 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/iommu.h | 22 +++++++++++
 2 files changed, 104 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e8f13dcebbde..b980c11dcfe8 100644
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
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d20aa6f6863a..c36540b75072 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1561,8 +1561,22 @@ static inline void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 
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
@@ -1571,6 +1585,14 @@ static inline int iommu_dma_prepare_msi(struct msi_desc *desc,
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
 #if IS_ENABLED(CONFIG_LOCKDEP) && IS_ENABLED(CONFIG_IOMMU_API)
 void iommu_group_mutex_assert(struct device *dev);
 #else
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
