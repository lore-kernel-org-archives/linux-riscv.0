Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664F9C624A4
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1S+42EpnV4+A72+vO7iHODDoOsO2PgYxyzj3BwVXTp4=; b=nWv1q3p5jswW7u
	DCBFPMr/NT/vR8NNBi9sl+ywtmcGjBLnmlo7hZj0gBmiYoh4+T5LSlQ48oZEBKzeXM6rz+xXrdnz0
	mJi0AoAPFq2AQzPiaQCpZgSbNz9I/QcNfNT+zcxlhHuQPpKNAnxtn8lwIjIvvLok93aGmXObi4/YC
	V4nQujgSVI5bzbmu32+onQIIIfeWfFiOuiOKlTykbLk3mq/TQ//2fP236gfY7HzeJHGkkhRIxKi8J
	s85o9Bf20m2LrCBQTviOWgCVZRa8LEe+ZAteClCiQ33sb/QAGjlVlKAyDCxB/3O8opu2Dtp1ZpUnk
	bIIIBaRFOsZbjbXEWbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Ud-00000009kpX-3gqq;
	Mon, 31 Aug 2026 15:00:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13US-00000009kYt-0qzo
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 15:00:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETQnK3703685
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=erJdfcvgU79
	8yKk0LLoInQNv2dnmFtm4EhSECQcyWlU=; b=Cyfmv5fSow5IUqamY5U95g/c2F8
	JMEWTvooENBKckR0xkuMuycoqLXuhI8oG7f1beDM/WUHpP8fngxw2hHb5TtONZ2S
	i1GNf4RSZcSrV0h59A9k6lSkzE/BH7r1AfoguySj6+tihPhBhzUsifmPH5iGv08F
	v1btixD+edIpLO9nclfapIOQnZIQALEx34W30GUEJ0Mswm+AqNR0HJcbY1n6QlYi
	ZlL4AmFXBDRZ+sGQqrGdif6rgSxexAAu8mJsmI1udBZ4HZH2yZCMfKPe7FflDhmN
	q3OYW1liQU4y4IB4odTOX1D4YEQrORcfQpjGFsOS5pjmKQrp1bucPLnhcIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasc8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so615628785a.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188402; x=1788793202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erJdfcvgU798yKk0LLoInQNv2dnmFtm4EhSECQcyWlU=;
        b=YRuCQfvlcuKRu9lG6Zqw/d1Akw2xNsKDnllKaSXtsshIHabaOaZGxHTl6FKa8blRtS
         F7HMe3jexinLwCngoHhHq19A8pbreDIi+RYUeitN/IiSVwGw8zpCF6wcijy/UXDoQr0t
         oFIIkJKh8FeAn7gYeB70KavB3xwwVk1UhMBP9wFcm7kiddsLXpvndQ+FPn/0sDT/o95R
         pgGM781NFr5/+WcL25IyYm1/+GxEta3SjtbQpVT0EUyd01dW25OtrLqN8e+uWBrv4OOy
         6DqxgPGkl3Zb8DcPErdyB3/rJfyVRHIiLeGxuUGEF6wdQNFRLXjkL6nR7Jm45Jc802QK
         VvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188402; x=1788793202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erJdfcvgU798yKk0LLoInQNv2dnmFtm4EhSECQcyWlU=;
        b=pV+Vk8zoIeZSRE9xXBiO5UC0HilqSkuytDq5gY1SdmjYkvmqqaDPlLmRdwKU45eSRv
         Pl077sHkKsK9HK1wHJ3BN2UWEq/Jn8czfAhyObKjQykS7G1R9BXxSuQGP28kVpnOwQFR
         zbFbVZKIQI1BDzewDLIIn40VgrpOnmqV947oW4vnuGL74pFC0njOdUpisa2c+D9isL47
         pk4JMG2184PJ9PvmTLlTvgQVxvKXmpKJHE5L8T3Fww5bqZu5SuKO89NJiMdLYhCAtyGs
         F9Yb3pbc0HyMeCIdlJbThHAXaCtmkIfRbOI1v1/GP7oc3POCCyYfrZV+W6tAkDkSHZkQ
         DvMA==
X-Gm-Message-State: AFuF++m6xJJPJn+lhame7+P6o9S4l9tt4eVoZ26u6F2ph7kUihnwHtbc
	fu0BBpc1vE+nfO5cQk8vYtH5lGb393lZlIR2CqqEGfzuZXwDp7GHM1qPy5hy5FQwQVatFe3XLbA
	oxeEC+WpW5IwimhjQDVa9tuWiM3MAqq2IyGGXp9/WjldY/FN0mltW1Z1zV1nNmU0Q1qtqo6IFT9
	skpA4=
X-Gm-Gg: AR+sD11PFjDxp0dU6YJrlu9YjvKFDnZYG7mK96Xi1nxceOvz9wrlG630sIBEBtnIVLs
	IRONSXAZAA45N17S0DcyRPrlL3s4FwJAxdbh8WB5IfCmgqc8iMg9tY93k85aAvVlqmDpUNrSJH8
	qn8fzHSSg8PK/YADIzWLWpt0tkDCtJnPImv53NU6YSU/XXCZxhZrsX6L5zY9vpnq5gc5aiJ1d1Y
	aYd4t4KAG/8utfmlcBaDwJNa6leRzBnOOFJVgbmc2MTMV8fisJIrXNtND+1iAaNDvydFbdV/By2
	TTpMDd9v/dr2lAYZP3PzaBuXDyQ+Kj+CRNhaxBkGj69TcspAbuBfT/Eea7U5QmH7orUD/h8qqqf
	d0flwVGEoQzQHYdcnaqzawNr585rm8oFtzZQ=
X-Received: by 2002:a05:620a:1a11:b0:936:9525:e952 with SMTP id af79cd13be357-939481360bfmr214549585a.41.1788188402210;
        Mon, 31 Aug 2026 08:00:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a11:b0:936:9525:e952 with SMTP id af79cd13be357-939481360bfmr214540385a.41.1788188401647;
        Mon, 31 Aug 2026 08:00:01 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2e9d9fcsm219790525e9.1.2026.08.31.08.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:00 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 10/17] iommu/riscv: Reserve an MSI IOVA window for iommufd
Date: Mon, 31 Aug 2026 16:59:36 +0200
Message-ID: <20260831145943.313726-11-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX19YpBK9MNSYy
 2m8Dxh5HPfNpK0RgBkDq5xiEQ4laP55dSDKAUWlKy4WAMRYk5n+kMjxPxxc9dXxjoJwL6y23obw
 bxyjx1jdPqOqD4YITz8OeNz0NQLbK+w=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a9596f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BnA8ekc9z0NdPsKvynsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXxGyzogdwRtjA
 j2zjUjOqUMmKJMOEG7Qn3u76dIO0iV+CgPbRV5wp6++qFGh2ZIAHbZlUtUm7KV9bk06xEznWEQE
 TnXxpwkXQT8RUzXSwLa90AiUcS055kjqtWP+UOPKpMxgAQNdkYl699saF+j1fE9YZP5mDnz3AGz
 bQbjEugx5pyy9R5qOrsX9UvAB7L6ATwDKyc/7bfQwCR6b/GW1cl8fBqlgVNZUedCsHKBB1Pn9Dr
 u5HOnxkDWCWXtPMQLLxb0gs8LbU3w7ZYq6CIoPx1y3fO/n4Ya6ZETX5WhogAdMhGT1RGAtxDaQx
 yJmvRuVR5jWyYfLiNPBj3hTHoUlki2D+yH7ykiNieNnWGm5jX7e6nRd/+GlkZiRX1esX/xQMpbZ
 +P4g2TUd7QS4VIlMn35ThoQNMsFkOanu/rWQ6NSgBeuErrHmIl7fGNEZ1xwqJuuHLNS/bc5IkZi
 B4Z4TYEn4snJ9Snxphw==
X-Proofpoint-ORIG-GUID: aZ_mC72NFdnPz8OtKfB1lOIJsn7D8UHD
X-Proofpoint-GUID: aZ_mC72NFdnPz8OtKfB1lOIJsn7D8UHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_080004_749643_9FC5FA87 
X-CRM114-Status: GOOD (  18.51  )
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

iommufd requires an IOMMU_RESV_SW_MSI region to allocate stable IOVAs
for MSI targets. Advertise such a region when the device uses an IMSIC
MSI hierarchy so interrupt remapping can map IMSIC pages instead of
falling back to physical addresses.

Reserve one page per possible CPU, sufficient for each supervisor IMSIC
page. Place the window at 128 MiB, matching the established ARM SMMU MSI
IOVA convention rather than introducing an architecture-specific choice.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c             | 20 ++++++++++++++++++++
 drivers/iommu/riscv/iommu.h             |  4 ++++
 drivers/irqchip/irq-riscv-imsic-state.c | 22 ++++++++++++++++++++++
 include/linux/irqchip/riscv-imsic.h     |  6 ++++++
 4 files changed, 52 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index e5818ce44515..7c4a250d61ca 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -20,10 +20,12 @@
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/generic_pt/iommu.h>
 
+#include "../dma-iommu.h"
 #include "../iommu-pages.h"
 #include "iommu-bits.h"
 #include "iommu.h"
@@ -1492,6 +1494,23 @@ static void riscv_iommu_release_device(struct device *dev)
 	kfree_rcu_mightsleep(info);
 }
 
+static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *head)
+{
+	struct iommu_resv_region *region;
+
+	if (imsic_dev_has_imsic_msi_parent(dev)) {
+		/* Each hart has one S-mode IMSIC page, a.k.a MSI target page */
+		region = iommu_alloc_resv_region(RISCV_IOMMU_MSI_IOVA_BASE,
+						 (size_t)num_possible_cpus() * PAGE_SIZE,
+						 IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO,
+						 IOMMU_RESV_SW_MSI, GFP_KERNEL);
+		if (region)
+			list_add_tail(&region->list, head);
+	}
+
+	iommu_dma_get_resv_regions(dev, head);
+}
+
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
 	.capable = riscv_iommu_capable,
@@ -1502,6 +1521,7 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
 	.release_device	= riscv_iommu_release_device,
+	.get_resv_regions = riscv_iommu_get_resv_regions,
 };
 
 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..078ed0ea65bc 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -14,9 +14,13 @@
 #include <linux/iommu.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
+#include <linux/sizes.h>
 
 #include "iommu-bits.h"
 
+/* IOVA base for the SW MSI reservation; same convention as ARM SMMU. */
+#define RISCV_IOMMU_MSI_IOVA_BASE	SZ_128M
+
 struct riscv_iommu_device;
 
 struct riscv_iommu_queue {
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b8d1bbbf42f7..df38a7670a89 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -64,6 +64,28 @@ const struct imsic_global_config *imsic_get_global_config(void)
 }
 EXPORT_SYMBOL_GPL(imsic_get_global_config);
 
+/**
+ * imsic_dev_has_imsic_msi_parent - Check for an IMSIC MSI parent
+ * @dev: Device to check
+ *
+ * Return: true if @dev's MSI domain or any parent domain is the IMSIC base
+ * domain.
+ */
+bool imsic_dev_has_imsic_msi_parent(struct device *dev)
+{
+	struct irq_domain *domain;
+
+	if (!imsic || !imsic->base_domain)
+		return false;
+
+	for (domain = dev_get_msi_domain(dev); domain; domain = domain->parent)
+		if (domain == imsic->base_domain)
+			return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(imsic_dev_has_imsic_msi_parent);
+
 static bool __imsic_eix_read_clear(unsigned long id, bool pend)
 {
 	unsigned long isel, imask;
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 61af3a5bea09..662cb0442424 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -81,6 +81,7 @@ struct imsic_global_config {
 #ifdef CONFIG_RISCV_IMSIC
 
 const struct imsic_global_config *imsic_get_global_config(void);
+bool imsic_dev_has_imsic_msi_parent(struct device *dev);
 
 #else
 
@@ -89,6 +90,11 @@ static inline const struct imsic_global_config *imsic_get_global_config(void)
 	return NULL;
 }
 
+static inline bool imsic_dev_has_imsic_msi_parent(struct device *dev)
+{
+	return false;
+}
+
 #endif
 
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_RISCV_IMSIC)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
