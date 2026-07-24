Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D2EC531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwMGSmJzdl/lNohlEE17n3iC+sgJ7jaFvSblwUaK3VM=; b=Hj6nNL4ObvZc+c
	eeic6/qgJN7+yndv32Xn5vydBoOn1MjftRAMBnRJL2ZqPHVPfYQAQVy/EwXr3KDdn+KYzHDIhVnj5
	bvDsdf+hYtLR8TXQvYdbEBIYlltFBZ9j/se7SiGMNAnBM/uRh7Wu+1A06PjXb/h2bn/VrX5xiyFlw
	NdDW1k2LVTByaQbmFKq0Z6KRINx0r3DEiUDzjd5fMtD83zXHk8lbya/AGPBTQTNXkBTeuLnQPbRPe
	I9WMiNixJ9i1pKQEiRbyoGbihoeZGUtbT18gaynr2VTqIiaH/xDc2yQNMyiz/QKo0oc0jl249tT77
	UWgNZeBjtWhKjNWUUIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHa0-0000000GfNm-3Awu;
	Fri, 24 Jul 2026 15:12:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZv-0000000GfF7-1pRt
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbNwo3196412
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kd3ZmeKFVQf
	MB+J1dbJBOnqgJkp1xv19FPuz/kbKlx4=; b=fTH1Lz+7AXTedH2N/CCZhN5jmTw
	CqvLVCZqNhwI8Gw8lSxx2MWhSgBFzoXsNxI9QUnqfAOXzO3AyautnKpPLmB7lNCi
	WDXHXVqFwgCgdQwQtikw3iD6C5DieNI2LHtk4KVmb+IPTzg62pln+1br6YnKS5Zy
	cW3JO4MPqYL9LanzdsScS0s9FtPhjiT4B6rbs8VH0OHsN+FceXk1AR0xLkPP/o/T
	oZcYkqLbYnouMCBTzVpK2vYBVuoSNXJQAEMb/ORhm67TUO98ZBQ0xn3TOqKwN6dl
	s/fP7F33ECYFwCJIyNYzGcsg5qqQs5aRxrXzdbov6FV7JyRiUxl+bzfBnhg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p52brp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so5189361cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905965; x=1785510765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kd3ZmeKFVQfMB+J1dbJBOnqgJkp1xv19FPuz/kbKlx4=;
        b=Wb61ldPv3rCv3ljYqdIohQncDQtOJ+fq5jTrAto2vnwYWtmJnME2HQBefWd6Zo53vp
         VjY4TQVF1zDvPNnk8xMpFYWJSYPtdaOUuEg2oKyB9kIHAldHpdsFuBcD8ejbV+GXJeSR
         CXmc34aD6AhcrQvEWi1U2XIroC2rZNzKiJnQWYH61ZsDWmT64C6+0zFNtLJJ1WUwRpSD
         Al+S22Gl1/4hu+lyGvOLMP+vkAInrTvHWiYfhJbi/W8rVoEX9GewHJjw3Os7PjGp2kLo
         AvuCO9A/bgMeRB2H3CHniyYPwC9I3z4sn1dyus1a7cvYREU/oA6gI4QzzNoIFdmjic79
         cqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905965; x=1785510765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kd3ZmeKFVQfMB+J1dbJBOnqgJkp1xv19FPuz/kbKlx4=;
        b=Bw6ocd6JofokANU+xcLOMf+XMUGa3Zp+eh7NC1mu+mS9U+b2fDFz981dUbpx0nvn9Z
         eXFoI+qpO9aNFb5Teb3W//LElVK7iRewmaCag8dl8gBt95qfuKJS1uVsm5eyL8Cwa+Jc
         JYJgT0BfCG2F2lK5dLZAynUtN2NNp9JSF+CnJbQeF9uN4Q8NvS5qpGa/PxrrIayRDn7m
         YndJft6sAqxDff7IQd0vG5AX+i30PLV8BW4hGpvuSLV1eJ7ijeG2bf6dsq4JyOVaNCea
         vwSaf9aEpAtbQUqbxMm3CSe0mtjQod33aIm7EoY/7HMy2zC/DKtHfAuJuUwMYso8xK6C
         BQyw==
X-Gm-Message-State: AOJu0YxaJuhT6ZjO8LLtKGW8yus2rYlSEglqiTqiI6p7tyrAguRvsl8y
	MfwroRz8SU3OnwOVhg/DC+CxrV+5vVcnZL4PqR2oU/Xo37drEqZTjElTJBd2aZspujAXFp5SOfv
	N+TQo02I5UJNAzErndqwyY/vJKJvK/ojBb/WhauhN6q99Sz9yJG9gf98kFwsL4e6pLkIJUPzqYn
	4dVm0=
X-Gm-Gg: AR+sD10dnQU5RHFhPnTcKE8x7rMJZSiiA7HpmkrMl2bXlPb3pkXV6kVbiQpPgBP/MLb
	md7mUxaZqQfswgCP0Owk19tTPtGpOZDSmcXOF1NqnknmvZW4geA0wjBY+s8pEfd6YHAL6XxPX54
	FO0qHvYRGQmpxh/mL8L5/IlmxgWgSH6DrVq2AA7C+lppguJcn+qwzhXt4OcB2r2I6e0bIOw9prk
	Vnej9OBvqpswvoxaVeky6USJqBZ4Kx/J34EpWuQpIVfNjd1eCeUGZJPePcgoGFECCqjfTccQFwn
	igv6eXbYRaA1ynxTOAlPnEXu/xdo3Iwv306p1xFoEn1OS4lpcpKwOZYkTtiDoD/cjfcMvimAKIJ
	mkjsnsscF6GMpm1pugurtfBDhxo1CskV1YrR5
X-Received: by 2002:a05:622a:1353:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-5283decd098mr75364051cf.48.1784905965550;
        Fri, 24 Jul 2026 08:12:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-5283decd098mr75363521cf.48.1784905964963;
        Fri, 24 Jul 2026 08:12:44 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a7ad1esm362480066b.3.2026.07.24.08.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:43 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 11/14] iommu/riscv: Copy MSI IOVA table when replacing an iommufd domain
Date: Fri, 24 Jul 2026 17:12:15 +0200
Message-ID: <20260724151218.965929-12-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a6380ee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6pi3hbU58VXC-MSegPwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: OOH--e-oeGUrJYFqU2TKPdzEiXRNM4Mj
X-Proofpoint-ORIG-GUID: OOH--e-oeGUrJYFqU2TKPdzEiXRNM4Mj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX20VF7Z4OnFAr
 ArefxAcvauDoK0Q5rL6k0Vgmj83qXiMTnL8dz5AlVS3lTg8ZAK8oHFErbvCBjQZuWedmxUuFzHY
 RXuRDOBQhSnxW0WXdVvKxuxxUI34qIo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX0yCYnfsCPzDM
 VYPQd7hn3TPe6LrPliitvu+PiGcd8HSeCWSUBSam7rR/UbDP5jzCpSqx3irC0QBukGWP6snXTHZ
 UA1MQ3RgPXs+aX0VYWTCA7EzfS3LQKmh0j8wYOpsaKJUS+QhgcDEfym9yQv4w5/AOMN1DCYVRaw
 ibG1BNlh5MlsjwFqIGXAP/47pw/47GC94VBHFOt33WYo8aI9QU+5RrpJUYGELLVXIJD4oIIPyPY
 WIR7VQjFcElCNtYtGQJnDG+iF0LuQpIkVFJPqIiFhc8THxZfZCQpiVva3px9Pe1XUBt5xZG/2LJ
 zdoee2NKFIHpB/lrsHCoszTGGOFDJIv3C1x3n2kkq3fLMWG3GvLW88Se5DWf9JGovkpvlXPJTy4
 wVY/bo8Mh2sUPffmDlnmWeFMKU0fWJfA3VL/XAmNPEDDkdhlGEDLQltLliCsARsGvooE3uqXTua
 uGI4szlcaeKeK+EVOKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081247_681112_AC0D565A 
X-CRM114-Status: GOOD (  19.42  )
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

iommufd may replace one paging domain with another on a device while
leaving the device otherwise operational, e.g. when converting a
device's HWPT. If the old domain already had a populated MSI IOVA
table then the new domain must inherit that table rather than wait
to build its own, since the MSI IOVAs are only built on the next
irq_domain_alloc_irqs(), which does not happen on a domain
replacement.

Only copy from an old domain that is a genuine RISC-V paging domain;
iommu.c already has riscv_iommu_paging_domain_ops in scope to check
this, so do the check there and pass NULL down on a mismatch. This
keeps riscv_iommu_ir_attach_paging_domain() simple: a non-NULL old is
always safe to cast with iommu_domain_to_riscv().

Only iommufd cookie domains are copied from and to, since VFIO type1
and DMA API domains build their own tables from irq_domain_alloc_irqs()
before any device is attached, and are never replaced while a device is
live.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 29 +++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c    |  5 ++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 39ca4c89a2a3..bb1bc4c2bcec 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -216,6 +216,35 @@ void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_inf
 int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struct device *dev,
 					struct iommu_domain *old)
 {
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	struct riscv_iommu_domain *old_domain = old ? iommu_domain_to_riscv(old) : NULL;
+	dma_addr_t *msi_iova;
+
+	if (!old_domain)
+		return 0;
+
+	if (old_domain->domain.cookie_type != IOMMU_COOKIE_IOMMUFD ||
+	    iommu_domain->cookie_type != IOMMU_COOKIE_IOMMUFD)
+		return 0;
+
+	scoped_guard(mutex, &old_domain->mutex) {
+		if (!old_domain->msi_iova)
+			return 0;
+
+		msi_iova = kmemdup(old_domain->msi_iova,
+				   riscv_iommu_ir_msi_iova_count() * sizeof(*msi_iova),
+				   GFP_KERNEL);
+		if (!msi_iova)
+			return -ENOMEM;
+	}
+
+	guard(mutex)(&domain->mutex);
+
+	if (domain->msi_iova)
+		kfree(msi_iova);
+	else
+		domain->msi_iova = msi_iova;
+
 	return 0;
 }
 
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 5631af2c9ab1..d3b5d985887e 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1264,11 +1264,14 @@ static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_m
 	return false;
 }
 
+static const struct iommu_domain_ops riscv_iommu_paging_domain_ops;
+
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 					    struct device *dev,
 					    struct iommu_domain *old)
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	bool old_is_paging = old && old->ops == &riscv_iommu_paging_domain_ops;
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct pt_iommu_riscv_64_hw_info pt_info;
@@ -1288,7 +1291,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	if (riscv_iommu_bond_link(domain, dev))
 		return -ENOMEM;
 
-	ret = riscv_iommu_ir_attach_paging_domain(iommu_domain, dev, old);
+	ret = riscv_iommu_ir_attach_paging_domain(iommu_domain, dev, old_is_paging ? old : NULL);
 	if (ret) {
 		riscv_iommu_bond_unlink(domain, dev);
 		return ret;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
