Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AE2C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1p3MMZ/XseTNkbaSTyQDIEAhmOKxqhPUEsLtTbAcbn0=; b=42Lttq29w8oxtU
	R1akwz+HByJ2jwpoN6OlOmD0ByV2+lDJMbSEIe9wMC05ePvDVZbJBy+j7+zzUZfWw1gaHyyRbciq2
	nJDtW2VN2MESzARHHNf6bAquLQgkXa4e8UnizzZ5QTPpWkrWsi6aT7s6bxsSwyBAQMZ63DSl6HJzo
	O3RjDcONIZFHZxAtjR3ybR1kxAwCISwVoE+uxdRGLW7QPQcZxUJgbUWfnW26toBPWwN+XEOvrRz5s
	133Tr5JqM05JfESYQ1h+o2m76O92YDLxA7/KaBD7hdgigf82tvdVxewJVz9mbZR59s++tNF39cC7x
	lK0Gb+a1gdTY7y6MpmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8e-00000008ZZQ-2coV;
	Fri, 07 Aug 2026 18:17:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8c-00000008ZTm-271B
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GbWLX1474814
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ACxCicvvxB0
	MpVhxvmmDcRleLgdrlgEwy/npKeaMKFw=; b=nJRbChcE2ebiNrz6hnEcTGiBpRd
	DMaDxnwuNfCAOBADQn6GC5QlO5mhnPXrhNSmkLQD3cwssHzVVlUonihO13Eqs/pb
	+rAtxi936cg1f4/hZvh1cP0tkaCSKh4B7UErAbJBDK66oqUGmN6LfWk2z8gJvrkg
	ZgX5lQhpqHOvt2D9gmMgUQakYkOqStvOTM+kk1BSLYjGk/lTQzkqk6s6isihfBtj
	G/h/fWCrQgGOHusgn4FxPBm5N5iDdwPMITYC1XQtGVAnk3FsV3PCLOZwtnIrOKa+
	4Y45gMLR3WLDnqLKDC/yzXT3f0t7s7RnKvdWxS8XWl9WrQRjrPgUgv6XHFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwk228f89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e538afe65so447644485a.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126665; x=1786731465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACxCicvvxB0MpVhxvmmDcRleLgdrlgEwy/npKeaMKFw=;
        b=fR1U90qKneqIHzADYa9D7yxtszDfEzYuswxSzo/anjiWOqymKazz9uzKglMBjoTxPq
         KDEsxz7OJW59XncKGRjyHi0xPXbLYjQ3Lj+knCDnm/hILXOzGo4+QpdhivTFSncvyg3K
         X6hyqnkHBm3L6JrFa6p8v7MnHAodY6lWuglP10e/cVwidZp+140I2z6FR/Gy4tShX8Jn
         Xjtg8NdzkxEjYWAskKFv98XpionHDHdK57nFgUJeYuoFjlu7I0joC2SBcTkQR5sN37dX
         KaIDgxUyEDVnDJM41bUNQJKGq436YLVXHPiOaRPpX9s3VmB4p79aJxKjgQQzVp4GhJq4
         tLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126665; x=1786731465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACxCicvvxB0MpVhxvmmDcRleLgdrlgEwy/npKeaMKFw=;
        b=s/CXpnbNs6QAy5UC2zpQ70AHrw6CUhZafvd3qkw/B63DU81FbEBnIhEflC03ldB37r
         1sRL5GHvnrCTulbs9TR554oqGOLTjEwb8PWLdgNrXl9NaOP0Se813CU2CLEbOXJUTAU0
         Rxgs/u1uklZhGg6tKeCKmV8AA43+CPcERFdrYzNPAW7EjMfhMQnwj2A7TFB/trkNXJpT
         UHAQiwLNnyytDTv609jgqjgX3p2dvi1R3x3DwAWzwopjv07Ewws1YQkE6cEzlbgxXaWm
         2KzxC5iJlAFhc+7IZR485ozVGHeRsGPGSQ6hFVrN0ifE6cQpOp3LaFpp6dNQtxTcL8zp
         koPA==
X-Gm-Message-State: AOJu0YxRBR8q5enbRhKESWKLPuj406110tm5gclNxPcMEdxt7V56UwIA
	v/1RXkzIN7+uo1ub/Mm00QeKrxpO+iaLm7/jUZ9pnUOXEC0/R/K3Q+4Ni9lcUIMMYtLDJwI48hb
	oUzfxiYWPZgePgD/fABaHg1AGrFe5HFwemcleddHYhgsJPNjZJqZd52ZVaOPrupWotYqgnr8f+G
	nTQ6U=
X-Gm-Gg: AR+sD13HfMqGGj7vePK+pqsyGGbo5wbVQYVNjyeLaqmEuy4mrZWX5Tu40Mu1CEuVB+2
	/JWm02SldrrQa/B+0yFfVCqQJL3D9HHdJEuweVMEZmyuY4Js+fMpZen5OBtSrxYy4Srb3njCCEx
	OIbGbPXj9rHsg+/LEB5qxRvBvgdOXuesPHw1imYnskTuyB8aWMfEqKjIXs5wFztxd0PGVAEHgJ8
	hWVtk0xrHizef7XU2tcLaOpB5exZZP8Zwg1HcJDFe5d91iCdwI+spapv3jg7n94hPGbE0cEIa4a
	S36F0AYxxe3YQbx692Fme0qXP3XK2LLW7WDx2jA0mqVxVAP536bPjDHe1YYDRnOe1ARdyymfSAr
	sHwv/VqhCid5YU+edzJmJHTvMvLgckTzejdYpPxI=
X-Received: by 2002:a05:622a:228d:b0:516:d699:a99b with SMTP id d75a77b69052e-52ce61f545cmr276788871cf.40.1786126664707;
        Fri, 07 Aug 2026 11:17:44 -0700 (PDT)
X-Received: by 2002:a05:622a:228d:b0:516:d699:a99b with SMTP id d75a77b69052e-52ce61f545cmr276788231cf.40.1786126664267;
        Fri, 07 Aug 2026 11:17:44 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1e7d7648dsm828651a12.30.2026.08.07.11.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:42 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 13/19] iommu/riscv: Implement irq_compose_msi_msg for IMSIC remapping
Date: Fri,  7 Aug 2026 20:17:07 +0200
Message-ID: <20260807181713.228535-14-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: ueeo18B2wm7VKBIk4spqZJwbnmqZsu28
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX4pHWUEicz5Ur
 1GOHf82XnZ5vDm5Hxg2EMlrly2k2U1A0wNwqlSz6GMk+Sn6VKEugeRNwRpO47oHFatd3npdkW+V
 eLX8FBooUY7/FZBEORiPpIto43OSz5h6upOWAyPVRs9AbhxlHY4bUzMzf4r3mYXdci9RyTZK/K2
 IzN14bXUY4NIiqNixghyv0z0cPjEOPwF7aNtDMbHPsIoBi4KkfemdI2Munur/eUhYxfQQyLGLIK
 5ojPrlHiSnBLdQtnVa1wAk7LQqldA8UUcjYllA4nu7aJZe2u4uhty+Y0XOYBIkEFfpv3JiRrgo/
 huTnlCC+CkchMhfKiDCjuvWvuUQIs6VIUj4fEc1MA1Aetqjs3DYQAJhaqHtTDVFByYNCqBvZKQd
 AqtU/2MWOfl8Ced+mD2vsxdSmvuWI59CqqSWx5MGVpkkrzGWTT+qBUS2hcvju4FsarMAlBereTD
 Ubaq1tWJ86hPdCfhjqQ==
X-Authority-Analysis: v=2.4 cv=bcBbluPB c=1 sm=1 tr=0 ts=6a762149 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wDfzXBFmrApTGnkBQMcA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ueeo18B2wm7VKBIk4spqZJwbnmqZsu28
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX7A6yxMBMyFbv
 LMkgJ8tv/U5Ekat8GR3SpmFHyADm/pVro3POetiqbfAnqeoojSsFpW7iODqFdGTZs/Y4kxiWZv4
 SC2lMqcfhxowFXNGRVEB1O3XvBboER8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111747_075028_88B8FB4E 
X-CRM114-Status: GOOD (  18.60  )
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

A NULL domain->msi_iova falls back to the raw IMSIC physical address,
same as when info->domain itself is NULL, since a live paging domain
should not normally reach compose without a populated table.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 49 +++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 7d9a1eaca92e..98be3e3fddad 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -91,17 +91,56 @@ static int riscv_iommu_ir_build_msi_iova(struct riscv_iommu_domain *domain, stru
 			return ret;
 	}
 
-	domain->msi_iova = no_free_ptr(msi_iova);
+	/* Pair with smp_load_acquire() in riscv_iommu_ir_compose_msi_msg() */
+	smp_store_release(&domain->msi_iova, no_free_ptr(msi_iova));
 
 	return 0;
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
+	/* Pair with smp_store_release() in riscv_iommu_ir_build_msi_iova() */
+	msi_iova = smp_load_acquire(&domain->msi_iova);
+	if (!msi_iova) {
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
@@ -267,10 +306,12 @@ int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struc
 		if (msi_iova) {
 			guard(mutex)(&domain->mutex);
 
-			if (domain->msi_iova)
+			if (domain->msi_iova) {
 				kfree(msi_iova);
-			else
-				domain->msi_iova = msi_iova;
+			} else {
+				/* Pair with smp_load_acquire() in riscv_iommu_ir_compose_msi_msg() */
+				smp_store_release(&domain->msi_iova, msi_iova);
+			}
 
 			return 0;
 		}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
