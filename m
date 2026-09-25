Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89414C98328
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wi5UbNtZwjE675vkgarPM8oP8ufnNFsXbmCDgtUppzA=; b=aNkuD8VxlBTUd1
	srheUmsKlFLKzJao2thy2n4U1rcbxTECHsuZ3REvD+y+GquIFMjTG+oS4Saxs4rFxWYG3xWsmWUcJ
	OYxYbFsO0PeabOJupCeWwGZTaHkBZ1z7RGWbeRCjqyX/RYpsrR9tgV3S/QD8zjqqFVeEHaK+Krmym
	iyYe+HtAMJrDE5VUcsO4s09B9X+Mhuax7jcB7H6Jbubs3+xiSgoJWoM8jZrhOBVVp6cbFQFaqy+qr
	a5KsCnXhww/pod/MCo6r2tF5ZNHuLWrEwZN84Y34K3Gt6s/rAJsv1ezqsAl3CJb6Kx+Gv566eumgK
	hSSc1evNBw4hH64+6R3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fx-0000000DjxW-1p4l;
	Fri, 25 Sep 2026 15:17:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fu-0000000DjuE-1IDa
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PCvNtv1055331
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PmN9t9ymHRy
	FP8JsM12YSqld9fh7hnA5QJjnse58yeI=; b=BpDScuyJtM1lrAVqbIJCth4xhvG
	JizM97Mz/bfWWayP8qsOsbW7ct7pqyadQpoRQOsWMvjaBZUQRsWlia6xIl8ZU1uy
	HguR7Yp5ND65cJ64Z+vk1IdVZ68JrH7bKpWbmFAc+HowkeAAP3o1Jj/ycSACQpJe
	p8yjRuf02181L/EohWq/4jM3ZZnjOmtam/zDtcrGI4QCs0qTEHYRPncSDjBzkVel
	ejj1kQLy80OQog9AKxcQmw7PO95en7Fnz8JN0t2kasBPOsDVygCbTNWt3Io6MC2M
	mnan8Wfg01UtlmauqExY7JL6C6DG7WhGOR/FK0Ci1Sx4nyYsn1xZI02G4Pw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7b0fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b34a3d1f9eso28105137.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349441; x=1790954241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmN9t9ymHRyFP8JsM12YSqld9fh7hnA5QJjnse58yeI=;
        b=iSoo9Hq6yP//Yjf52SK+TRErH8iDKGq48k9DI6Qn8qGmecc0QDTd8LxYFdUnJsa2yV
         flAP938nzaunxCyNJSs7nQ+Uls3vrRxaKlwD2uqXfENNtDhcox9QCuAMG/6588pIMmSV
         ElaCN3oyOMEDUedWEeS5UIz99DFhFMaKqGsHYRLvmuwNq/BA8domNvVVcWnyLfyrSLew
         DS2bQ439HIiAWZynB6SRrYL0XbiLVl3G6F94ZO+vYUF+5f0vbROnak5UQGnPLybqs0JK
         ccdlR/VFaSpxv13tEY3zTa6VJ/zYMZhJlvwgT9Qn3lDSs2OEzyG6GViiEVCucLUzsNtL
         piWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349441; x=1790954241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PmN9t9ymHRyFP8JsM12YSqld9fh7hnA5QJjnse58yeI=;
        b=zkbjscGVtkMpZMlk0wOtB6FMep9DZDdD4653fQmqUzjiAtuH3iw3tqimusz9+NgHlC
         dseqlj5lY9hMYQRXLvIPM89Jo8LgzjsIt5SyuVhiELgjYwor420zPDBOq5DbbERy+sXR
         Gbroq1Aquds8L6H97v/83QlSKxAabayYz45AkFuB9fKF0KibvCBFbBymhK9b/GsdVwEm
         Tx8UEZhgPPnvoKteQaUXKgQfEwwT7pJydrwPnk5auBazPs/3rx3u+to2DON5LmXYZoH+
         gfI5K671lqm2+F4EZdSdFmDCML/ta4rtFMd/Z7ZKXtouUAFveLvrQqAP29a4HISLUA6g
         du1Q==
X-Gm-Message-State: AFuF++kjsaSxL9RIyZQQ0Py7VQCrt96n4SL6lAwdHycKmd8N9waC+L6k
	8Q1VGMM60W253jZwTy0UT/Z7WfetlR2xT6FTHrtMfEpVfFqcKGDg8KF9jVo98eWecYpjLkXPidt
	2Ab3SepBEs5dW48F35uqxuEBGgK+xXdI/XmgkxkWPHWa9k+2UaZl1yRoe59tONe23iP4MI2gFyt
	0LVvs=
X-Gm-Gg: AYBFou3DAiaZfU38lh76m0qsbu5/4Cs7N55qvUkfZclxpzKQ8gr6PDwwhdBGy7vt5oe
	QGkKUGe4pjwJs7EXJNtc3aOZ7QhKBWFGhAZwnO3uj4eI1Qa2EOqRPUYlYUaT2Ty2tJ6bfCrXDlE
	14m6KIG82/MH5cUPC7ARKJ1Nu0erYR65obCbCZ3qgH+1hoWZ1NskO8YiQGdegZx/sUdmL/gflVS
	S0b/3zjRjgX4c+iNhySnO2krVZw2dAP/nrhOMx809oPFkh0KC/Bcvxp30vRjxkk+2gP+vr+RkBY
	vrDjUqZFqrcU4uoNa7ulYJf9Xz3AdwRNdrVfXQbv5cxZexLxums20LQrcyCCx2MUF5t6IoFsSGv
	ZGZqyoORUoMnBpdAobkNtuUEO1UQ1N1AOeCga3w==
X-Received: by 2002:a05:6102:508e:b0:7a3:833c:49a4 with SMTP id ada2fe7eead31-7af1eff6910mr2510070137.26.1790349440476;
        Fri, 25 Sep 2026 08:17:20 -0700 (PDT)
X-Received: by 2002:a05:6102:508e:b0:7a3:833c:49a4 with SMTP id ada2fe7eead31-7af1eff6910mr2510055137.26.1790349439971;
        Fri, 25 Sep 2026 08:17:19 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a4e9sm6689080f8f.11.2026.09.25.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:19 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 09/16] iommu/riscv: Reserve an MSI IOVA window for iommufd
Date: Fri, 25 Sep 2026 17:16:52 +0200
Message-ID: <20260925151659.419512-10-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: _lrSzA9BXR2YZXtroOJcguoH0a_3Mt6N
X-Proofpoint-ORIG-GUID: _lrSzA9BXR2YZXtroOJcguoH0a_3Mt6N
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab69081 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=hTxnoE90eIxTBplCLnYA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX3OZsCj5VTYWw
 BZ2I5Bnj/hXj2VxCf8CjT6A2sahqAa1oj+W66zn4hcMC6oh+ib0Qdu8puEdHaF7Zf0xtcQ6hD0h
 iGuDbAxu1/Kb+mX3PYAJZqlQ9eNrHm/GvbpSBWMPjuvlRgzQI2O2cVdA/BWO+lr4VPYv0zyJG3v
 HTEIzmzj8Gs2E1EY6B+IFY+l+v3tEc069REqYVjS7LxL+78xItAeoUD0SECk9tJZx+9a8453n1F
 zfE/tIpcZNQDh+d10ZTyhMNrsnWP2GSo6sAM+LrKSsUIEA1ohzgE37lpigX/Brg456NAT3HCcVX
 goavKfcQs5lfZs/XdKYt85SV2suxxsLp7kbZdrx5guZrn9OQP5FjMo82A3vnESYV5y2wLhTHqKj
 of/+WC7x6xh8iV0f7aUJmJG+W6bii1jmpI9DXrPl1BW04+MXX6Vx77+2XPp2apqJsES4ffmmkPN
 VRhEyk1/XYr9TvYdGvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXwO13IiRs9TTe
 QYcGILZlsYnqeiUIkp4nF3Wb3ZQ7Kv0aS1gl9B2PkmERxSQZT8mY60VD+n6+qFLrcS9ioKNwdK1
 fFTHI+XZs4/Xu8/lPACcxHtzvOJfSzw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081722_360302_4518940B 
X-CRM114-Status: GOOD (  19.82  )
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
page. Use a 16 MiB base instead of the 128 MiB convention used by ARM
SMMU. kvmtool places its guest IMSIC at 128 MiB, so with IRQ bypass the
domain-wide guest MSI address match can also capture host-delivered
MSI writes to the SW MSI window and misdeliver them to the guest.

16 MiB falls in a hole in the current kvmtool and QEMU virt memory maps,
away from their guest IMSIC windows and RAM. Keep the window below
4 GiB so devices with 32-bit MSI address registers can use it.

This only avoids known conflicts. A VMM can place a guest's IMSIC at
any valid address, including the chosen SW MSI range. As long as a
fixed SW MSI window is required, changing its base cannot solve this
in general or guarantee disjoint host and guest MSI address spaces.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c             | 20 ++++++++++++++++++++
 drivers/iommu/riscv/iommu.h             |  4 ++++
 drivers/irqchip/irq-riscv-imsic-state.c | 22 ++++++++++++++++++++++
 include/linux/irqchip/riscv-imsic.h     |  6 ++++++
 4 files changed, 52 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index fbdca69c436e..dcad99131670 100644
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
@@ -1514,6 +1516,23 @@ static void riscv_iommu_release_device(struct device *dev)
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
@@ -1524,6 +1543,7 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
 	.release_device	= riscv_iommu_release_device,
+	.get_resv_regions = riscv_iommu_get_resv_regions,
 };
 
 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 5676001548cc..6d5c70e9ac6d 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -15,9 +15,13 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
+#include <linux/sizes.h>
 
 #include "iommu-bits.h"
 
+/* IOVA base for the SW MSI reservation */
+#define RISCV_IOMMU_MSI_IOVA_BASE	SZ_16M
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
