Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86559C5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewzJdF9+QBkhmulTe0oLxRo8hira3DhBX2J3HY8qFQ4=; b=377xlvAH2f6/b3
	jwK6RS6qAuPSt3SdKxJl0HKTBNghwOvpPEvgt7kG7C9fana3/zSNMIwcX2Eg2r0vW5mDazGE9xqYn
	jgg1pCGMwzd7JXoglT33X0totf6Urtos2zOr6NpXzUIyh5BE5eVbAgF/k3sOjFZiceFoHtcL3XYjD
	YFB85j3EgGlBgl1jq1N1khbdt0Zh0m2hgSBNCnoJ+DUGJfkF1gqdBI1EurqwKzh1l7dMkz8X6POiU
	/kNyO6CeH6YFM+o1mVJ0AkogbdT9frd4bmshjElXU4JMBLFEX0u8o3+HyyLrKGOgTY7dfZEA9jf4X
	EG+zIoV8LsQo5aDbVTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWe-0000000CDlR-2FSJ;
	Thu, 20 Aug 2026 21:42:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWa-0000000CDgx-1ja8
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7Ztv4012740
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PqI0T7aNqdu
	73yqm0QgvvFNxKg2cPPoGg0lQ1xGoiRI=; b=JvBqKBBpB5lJ6gDftkR4DjhYHyu
	itnXLW8xtDQlmyLU1lOl+r6iz3vGH8QPXzGbwGJKwVyc9I+ebuXFv7evmY9vdjkB
	twtSZOhCL0SYf8lzItaW1ndP9miz2GJku0Lk+ZxoabaiC+19nB0dvrUG/9csEaIi
	DguWL9Ie7lGrFzqS1h1xO82s7eww1tscueKU3Eu551bC3w3gu81jXAz/JRiZWvAM
	ezDjQWP8XqOozlpGH44eXpO139hfym96kG2pSGx17zsIaGnvkk54W8oL961fhZ92
	09vWQDRz4/HJTIHq5Ef+RiAL29WZMh3Sqq8mkM/rDDD934KxK9NkwEpLXvg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29kedc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494527488so49609585a.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262131; x=1787866931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqI0T7aNqdu73yqm0QgvvFNxKg2cPPoGg0lQ1xGoiRI=;
        b=bPPwMkkbdzCCSy3y7mMG2vyZ38H8+3f4CgUhP4kFPdONBZkiag5MJz1Iau5bQ44Ush
         cl2d4prLfyryd0tRCSDr0qC6jlo4bnUWjULVeZpDLMcTWc33dxaqT6vsfG0k1tgYJY/V
         V6N3HeUkLXU5r07qjR/ASqjUnZAzXMh5AZJG3KwLC+2Fak3ry+lADAzVeDwz81U7L76f
         SX3iYcmfilASvsutN86v4n3RCPNDA1kkifBZAKgD2H20fxXdb/C8txgQlHkgEp4cCk4f
         gmm9r7Kat8P8pvlyhaFn7Fp+Gz7t5zym7Nx4QLUv8D63R8/zdpdSC8YOhS3z601f0J6J
         825A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262131; x=1787866931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PqI0T7aNqdu73yqm0QgvvFNxKg2cPPoGg0lQ1xGoiRI=;
        b=l+lnN2bx2bpr96p10vIiZ9FB9DO5cTtDGRLY1Oaer3C07OZQ1R0D1Gslz2WEFN5usc
         Zrsz9O/Vfad6+PLqD1vV2knGnjXw5hCgoMPguVakE/ctkbk9jB3LH3LM2CsCZTD9EmWU
         gXiqr5v4BhNPxuZsPemU2UQeKrrDzHlsiS4NopVo44Hj2l6DpYUr7k4awG59pz/PXCGa
         NItwwHQ53C+NtJq5UTOI4Ar9n8gM2KJq22X/ieHBKJsTU4g1I278jkMuSt6dWj8D6QhJ
         bVLMNofPNRNjuTMIxsFT0Dpy2DFEKqogj2Vs0oeY/KwC0BTtvXIAdx4jGJXGstcZf3gX
         e+RQ==
X-Gm-Message-State: AOJu0Yy7T/9SFOta5lFGq/qVgmp25ttDpGZsKXWoRynLWmQ93mJ1W8FN
	ezEQYCEZJC+GD1vkjh6IsnFe7AMM3uBdRdwi8MfK+4hsJtqsis6l9JPhZ+ImPHFd7OcTZAF5QCt
	hyUtLkp5w91xA1c7ly/18foFqviZlVitNwKkeQAkmflHzNZchU6FoGoGkmiSc/FxiLnGJYwvvYe
	4pXO0=
X-Gm-Gg: AR+sD10QifIHAJhcjrctC/UB+QSA84j7VIvLxYjffy28eXtBWGSi4Vu3vha+4Y/Paf+
	4h0uyMqs4/UdqeDzKLjnT9sg5/8wQE8NkDR55VmOMNR4amKXRo5Wv0A9QLGCsiW63AgqqOdFV0R
	xhtBBy6uKyXHn0Ua68ozyBcx6fKzhJDRLSDN+8gFpwCpNd5MrTXufC3Udbk8FEBPbuDwyVGP+I9
	2NKenxgb7GudFhDRHiPpzugyQFXl7XkaiNEOdC1raiOSDLmJIzBWW2Z2+wG6Rqt6KyIlk+jxIOu
	u3Sf0NARn+bzIckAKSJpyH21Zd9U+m13Bg8JvbED44L4S7lYNmQzF1cPR44loNg72kmBjvFIlvO
	r5BUExGq8
X-Received: by 2002:a05:620a:2556:b0:936:901b:2187 with SMTP id af79cd13be357-9373945cd97mr143203585a.12.1787262131050;
        Thu, 20 Aug 2026 14:42:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2556:b0:936:901b:2187 with SMTP id af79cd13be357-9373945cd97mr143195485a.12.1787262130315;
        Thu, 20 Aug 2026 14:42:10 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b8038sm13693642f8f.20.2026.08.20.14.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:09 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 09/21] iommu/riscv: Refresh platform MSI domain before IR setup
Date: Thu, 20 Aug 2026 23:41:38 +0200
Message-ID: <20260820214150.545737-10-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 64nZYNlMsAWYZ77MUMMfhoYTbS2WQ_kl
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a8774b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lUV-CE40vsJ_jsYSlhAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX3Wk/qJ6u7fxU
 W1nfDJfk4KpnPUl8vc3SCdhJA2s26MsBBSmSFj4d6Q/prtrAkckiFivBF9rUP2M/BDdSH59z2in
 LNzR8kSYA2eHlC5ArNxbine1OGzpq+2rX3fDDJyeRsNmdfxVX0TCwB3h4fcgHFlz3JSMCK3eDGd
 ZRix+IKnAez6Zr/PVweDKdLjCUxh+Oktu7wHOhEKWbBZI6MHaA75893bJuUEJRf9g1DpuKZ+vVS
 Ax3o3akr7+IpUm047VsxMm1OSaZFF0ggQlPO6hvTnYZIr/GvH77SF+tGUnF36t/od2uTcRFRosT
 USfx1bkEFuhU6M0yajfZLG78zCLBPNSnhYQkwFnNz+IltYmG/X+4KeUs+NfBGHmjI0qckAwVk2e
 WoPp5ZrD1yZjXw9V7tPSdtgu7FijVHmaRsHthl3xg5SRWFulhEWUAYDDsyz5HmmMWPAuPc91qEf
 pEN4cWF9jqwADDY6shg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXxQpq/HI9h/Iq
 v5t/G7JpwevbMb2JI/zB1f65Nph93kt/fJCZO5egAntGERBfacw3h/mjl0n/diT9fjyBSHI+S26
 +V50DKvdO9v1Ap+RT2E6IWbAonxVlMs=
X-Proofpoint-GUID: 64nZYNlMsAWYZ77MUMMfhoYTbS2WQ_kl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144212_461127_E4BC5F83 
X-CRM114-Status: GOOD (  19.17  )
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

Platform devices receive their MSI domain when they are created. On
RISC-V, the IMSIC is itself a platform device, so consumer devices may
be created before the IMSIC driver registers its MSI domain. fw_devlink
delays consumer driver probing but does not refresh dev->msi.domain,
leaving it NULL when the IOMMU probe_device callback runs.

Refresh the OF or ACPI platform MSI domain before creating the
per-device interrupt-remapping domain. Leave PCI devices alone because
PCI establishes their MSI domain during device setup.

This mirrors the workaround currently used by other RISC-V platform MSI
consumers. A proposed driver-core change would perform the refresh from
platform_dma_configure(), but until that is merged the local refresh
avoids silently skipping interrupt-remapping setup.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 0aab0efeb70e..3e08249015cd 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -4,8 +4,11 @@
  *
  * Copyright (c) 2026 Qualcomm Technologies, Inc.
  */
+#include <linux/acpi.h>
 #include <linux/cleanup.h>
 #include <linux/msi.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 
 #include "iommu.h"
@@ -53,14 +56,35 @@ static const struct msi_parent_ops riscv_iommu_ir_msi_parent_ops = {
 	.init_dev_msi_info	= msi_parent_init_dev_msi_info,
 };
 
+static void riscv_iommu_ir_refresh_msi_domain(struct device *dev)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct irq_domain *irqdomain;
+
+	if (dev_get_msi_domain(dev) || !dev_is_platform(dev))
+		return;
+
+	if (is_of_node(fwnode)) {
+		of_msi_configure(dev, to_of_node(fwnode));
+	} else if (is_acpi_device_node(fwnode)) {
+		fwnode = imsic_acpi_get_fwnode(dev);
+		irqdomain = irq_find_matching_fwnode(fwnode, DOMAIN_BUS_PLATFORM_MSI);
+		if (irqdomain)
+			dev_set_msi_domain(dev, irqdomain);
+	}
+}
+
 struct irq_domain *riscv_iommu_ir_irq_domain_create(struct device *dev,
 						    struct riscv_iommu_info *info)
 {
-	struct irq_domain *irqparent = dev_get_msi_domain(dev);
+	struct irq_domain *irqparent;
 	char *fwname __free(kfree) = NULL;
 	struct irq_domain *irqdomain;
 	struct fwnode_handle *fn;
 
+	riscv_iommu_ir_refresh_msi_domain(dev);
+	irqparent = dev_get_msi_domain(dev);
+
 	if (!irqparent)
 		return NULL;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
