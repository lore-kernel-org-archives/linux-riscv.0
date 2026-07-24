Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30ADC531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YIMKx4C2akCCSgERBXVIw8ewwZTcsjVVNubhjPNh5k=; b=j1cP9XA1aetZTI
	ckGRYnMXfB0P2ScssuGIBmVWKurBsk+4vh4vGJZwKfpMvqD4j8wMkQZFKpuHPTvlBXtxuW3n0UIwH
	FA/ZD09pQW4CtSnAOx5xI7+eEPokvpMy+CeURKe6gTy1w9f94EZnXUxC7XigzSBgMX9MbSZS2VbwP
	zmVBW7z7jTyRewGIU3t+397ec6YZe1or1VHZlywfozGdqzYBH2NOcT8AvRsUQzzNcDpqUpeGRFUCY
	ZhzD8ep1XGIoDBCvu9WvOimjR2UlbiTeA4X/JxtdywMwLAj8ZzVoUTHZ15OKv9qztQIVWgp6UIgY6
	ebYMzq8ji376NJQBKULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHa3-0000000GfSt-3h9y;
	Fri, 24 Jul 2026 15:12:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZx-0000000GfIP-1Rap
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbNwp3196412
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L0vVPoas2sj
	x1vMsJ+n0Wy1u4ubbi9EINDgHVQ2L70Y=; b=PGrX0EUGc3phd1eH9Exr0z6uk6d
	AEZO3y4qR7gbIV7akUKcT5N2UZOWdc1mx2kvL7KIisAAO9MrFAhFOaKEfePdVAmH
	IaNSLq9MdNUwrNF66ihWDH4+ZTowbEYK0cwfg8j+gR/7KC7cC+McSuNPV/T1cT5X
	CtWH9IfJ5MFCgOlBziMouSjnCS0m5kk1dleOK6E9pne9CTq4zWYnfRYsX5XMQ5TC
	s/WxNcygUxozS9660zslpoABdHIXFFhJXWIaefInVFkihQq0IMONTA3sB+2MW/Ne
	SPil/n31sjC5W+lLWIs/La5O8GqYWgqrlklUW0XkQ/duHJAuNqzqq8dWP0g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p52brw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90410c668adso9601806d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905968; x=1785510768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0vVPoas2sjx1vMsJ+n0Wy1u4ubbi9EINDgHVQ2L70Y=;
        b=JNJZX/+dNMTbOLF60S46fePeAqxFwujn55Dx69eJwphqRrtFr2MT/KhcI//PtmXMg3
         umxCX7b107BfDZWia22YAYgERf3/ckMN+z5E3BFRvywGpuF+7RT+kt91JRkXS3ULXiS4
         95soaUDFEvPRw9YHJIjjEN+d33lgCDbVAAJdFB4b64gC6QDNFiBkoNAOBsM+m2dfwCQh
         FPtybKMLcIzcPJTXiPoqtTPMzGl/g0A2fmhKvFtuedhwcGMbZ10jmbmSyEzTu7PY/Eu4
         vcoTFuKR7u29J2eVpt33kNO/tbzF5Z2NDpx60GiiYrqY5FS9rKfTsOIdaDV7WB+VZc5e
         2/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905968; x=1785510768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0vVPoas2sjx1vMsJ+n0Wy1u4ubbi9EINDgHVQ2L70Y=;
        b=ntGUB50wo+ifqTdaAHtsz8kX66WmTfSvyclIc/TW+ayVqFX6BTF0cfF9kMKpxyhkDj
         CxtTWEubS87LNI7ahcwbMXV/+kyfj4te94+yJB/4UkKc7X0uBAslWVVeCTiAXOGdSyjg
         tv8GKHLpA3KspEfOL+FFHue0jCAd/c1nGBDKpu49hyZdm1vxoQXRMDCTzGPDCj4t18YC
         z+C3bgmhvVd/esZrrBOdf34vea4hxMe8HRgB5fCtDT8OzL+A7fDbCHJHx+9ogKF+BT+1
         WQn8O/jPv/fFZiHisJ1FvswVDvWxTpT99fEcR67BWq0AGxYhQnEznPslSp/QlsrreNkJ
         kDow==
X-Gm-Message-State: AOJu0YwK5pJbGDvLXcRrHUVLMwJ6ky+M4A0qbBdv5KAhvWXlDd8HVb6I
	AaPSVTE077GScxmHfabcJv4mnoy4D+YZJhLzRRX6SlCfeYo0vXj53dpS1ccfqNQqwLWVPO5RTEe
	dNm20S7+ds11nGI0umvEaZjP14kUxBL1KcrckzibL0tJFRUA0CsSaw4ke5U3/P6Z9XMTyYUeYIG
	rxvRA=
X-Gm-Gg: AR+sD12+p2Xd/SLZbnNzaoDrLiMJFC7dZDSZ3f9q8u0FgfzrZjW0ExUfB++PIBsX7XF
	JTVDUxrgf/GhfEqZ0EhwL3CHU6On6Ql3UjSOhA17waGkrKp4j8WD52zyOt6G20zqgi6KTrs/0ZH
	IXUNpoyhZSFDD3B17xZuhhXD5BItUuew5pcTtC5RO9bjhN9m+uPSN5KAzWp01K+gLifdxYDLt8f
	8ZuWS2AT/7nCUJTNvsqfAHi/FDVRhTXWLElDvYuCnfqKl9iCf57rjI5PJ05DZ0hwbL/cPXuuelj
	FNl1HW795AIGJi7y+gEY7nsGcEWRCvK18T939WGSBcXYAy30iaorxbPnJzsZ+Fh9es7wKUgnUUi
	9pvd+v2DhSQI3kPt3Ec4d+EzKpdzmdDmxenVU
X-Received: by 2002:ac8:5cd0:0:b0:51b:fcbc:84c6 with SMTP id d75a77b69052e-5283df9a8ffmr76108821cf.71.1784905967788;
        Fri, 24 Jul 2026 08:12:47 -0700 (PDT)
X-Received: by 2002:ac8:5cd0:0:b0:51b:fcbc:84c6 with SMTP id d75a77b69052e-5283df9a8ffmr76108301cf.71.1784905967312;
        Fri, 24 Jul 2026 08:12:47 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32eb8036sm351216966b.45.2026.07.24.08.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:46 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 12/14] iommu/riscv: Implement irq_compose_msi_msg for IMSIC remapping
Date: Fri, 24 Jul 2026 17:12:16 +0200
Message-ID: <20260724151218.965929-13-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a6380f0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wDfzXBFmrApTGnkBQMcA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: VN7z-U5fJonbJ06vXLaOB8o9_L1s9_Lc
X-Proofpoint-ORIG-GUID: VN7z-U5fJonbJ06vXLaOB8o9_L1s9_Lc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX6H+MvA2UJhYP
 c0uZ/OKCn1wdEW/kHOGDo5Ys2AD43pgLmk6rnz7bGyZaW8bUCkLAxXtvnbu6+03211ANnQ0TZn2
 Q/qw471PjVo6jcid0snDM8WFpceFnW8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX9XtPFH2bizJA
 50IlWF4CfS3IsfvrUUBgTgIHk6jkNbyqJcGgJ2Q882w/sCUlLCLdsV+TJPaaEquvE3IrxF1R0S8
 nPAX3qvnfMlbApLrD+yXObNETzdAf4ssvSr5ma5O4O0WLIdvIu9A0ABmIGAiSk/ftExZXU4lFqs
 1KLpJ1bThyUTBPwTdIHvVGSo4kymqoG/kmjxy8I2dTOoL6UZFkDot1A7iMWH3W8zDGsd5RFJJL0
 Nfa5uxFX+yHhwmlvD/dyG4vlClGdQbvGlcKHBPGxU2fRtsf2QIG3oZ9qg2EwfIDbBcT6qFMunMg
 +RuUk2VCTd1+o0d2E1f/Q/SsUJyugeTc+tbLW71P3sjtZO3+xHHlJ7xVyZDx76cJ8xXoai3n+fQ
 mm16AGXfKARukTCLgsBErw3CDJG/Rr/IaxjFezv1DfVHf2E7Ti8zSM6ldtxXBsmlXsICibYgLK1
 WqMXxBFTN/yUuYibx8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081249_542989_6FF43585 
X-CRM114-Status: GOOD (  19.75  )
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

Wire up irq_compose_msi_msg() on the IOMMU-IR irq chip to look up the
pre-mapped IOVA for the target IMSIC page and rewrite the composed
message to use it, redirecting MSI writes through the IOMMU instead
of landing at the raw IMSIC physical address.

The lookup is O(1), since the "extract" function used to build the
table's index is also used here, which is necessary since the number
of IMSICs may eventually be in the hundreds and irq_compose_msi_msg()
may run in atomic context.

domain->msi_iova is read here without domain->mutex, since compose can
run in atomic context, and RCU only protects info->domain itself. Pair
smp_store_release()/smp_load_acquire() on domain->msi_iova to ensure
it's observably filled before publishing its pointer. That guarantees
a non-NULL domain->msi_iova observed here is safe to use.

The WARN_ON_ONCE(!msi_iova) is defensive: a live paging domain should
not reach compose without a populated table.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 50 +++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index bb1bc4c2bcec..eb2b7953055e 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -91,7 +91,9 @@ static int riscv_iommu_ir_build_msi_iova(struct riscv_iommu_domain *domain, stru
 			goto err_free;
 	}
 
-	domain->msi_iova = msi_iova;
+	/* Pair with the smp_load_acquire() in riscv_iommu_ir_compose_msi_msg() */
+	smp_store_release(&domain->msi_iova, msi_iova);
+
 	return 0;
 
 err_free:
@@ -99,12 +101,50 @@ static int riscv_iommu_ir_build_msi_iova(struct riscv_iommu_domain *domain, stru
 	return ret;
 }
 
+static void riscv_iommu_ir_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
+{
+	struct riscv_iommu_info *info = data->domain->host_data;
+	struct riscv_iommu_domain *domain;
+	dma_addr_t *msi_iova;
+	struct msi_desc *desc;
+	phys_addr_t pa;
+	size_t idx;
+
+	BUG_ON(irq_chip_compose_msi_msg(data->parent_data, msg));
+
+	desc = irq_data_get_msi_desc(data);
+	if (WARN_ON_ONCE(!desc))
+		return;
+
+	guard(rcu)();
+
+	domain = rcu_dereference(info->domain);
+	if (!domain) {
+		msi_desc_set_iommu_msi_iova(desc, 0, 0);
+		return;
+	}
+
+	/* Pair with the smp_store_release() in riscv_iommu_ir_build_msi_iova() */
+	msi_iova = smp_load_acquire(&domain->msi_iova);
+	if (WARN_ON_ONCE(!msi_iova)) {
+		msi_desc_set_iommu_msi_iova(desc, 0, 0);
+		return;
+	}
+
+	pa = ((u64)msg->address_hi << 32) | msg->address_lo;
+	idx = riscv_iommu_ir_msi_iova_idx(pa);
+
+	msi_desc_set_iommu_msi_iova(desc, msi_iova[idx], IMSIC_MMIO_PAGE_SHIFT);
+	msi_msg_set_addr(desc, msg, pa);
+}
+
 static struct irq_chip riscv_iommu_ir_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_ack		= irq_chip_ack_parent,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_compose_msi_msg	= riscv_iommu_ir_compose_msi_msg,
 };
 
 static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
@@ -240,10 +280,12 @@ int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struc
 
 	guard(mutex)(&domain->mutex);
 
-	if (domain->msi_iova)
+	if (domain->msi_iova) {
 		kfree(msi_iova);
-	else
-		domain->msi_iova = msi_iova;
+	} else {
+		/* Pair with the smp_load_acquire() in riscv_iommu_ir_compose_msi_msg() */
+		smp_store_release(&domain->msi_iova, msi_iova);
+	}
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
