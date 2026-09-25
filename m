Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B150C9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJkOEXW6D0UJzOWQaqo8iR1fsy4l46J39xxtuWo7a04=; b=slVFz/pzTXLJ+7
	dpDPaidG7bhhV2WxvWhHkyAtVpxAD4cSfyuTqnZQOLbIcwHXPM5aTYbZUIYwhPxOI50T4o7esvkuL
	OoYAL/y0Mza/pw5JunVw8fQqxRxpEkGzkrXe794NDs++iTssDU9N9BPup/05sHXbg4Jz66nKIFC0Y
	UmKB+Thb4daBe1+4nXf2uJBmM53oNPzRlIKru3IOxsO4R7N/EvIEfMH7LoQ4Uyq6duDN8WZnoFWyy
	+zEEcFsMi8pvKi6Jt1fZrd+pSyLpEvhzFUSg5QaB2pu59Lv7RegjVRD2ndQLe/bnqZU/8HMb/N9ex
	PbilphYAENXo+aAG/Mjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7g0-0000000Dk2T-3Hnq;
	Fri, 25 Sep 2026 15:17:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fx-0000000Djxu-3G5T
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDi0lc3532113
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uT2Prej1vk3
	zX/S7OPlnxWtUB4o0ge4FHSI3+fpimn0=; b=RsFJCofP6D7YELjwGy6lL6vLqOr
	6OBWBvtxish1i0NL63QEjXLIGylTuxJ+dc3gKsZlgENKFQI5AMtQ9ecDBRTcSmsn
	U+txaH85MicWmrbbZwElQWD7qD+u7SQC3YrOrpcEdNSLKgCpohDnl8gzRFv9ddHa
	1ZuT8PIj/3T15h8jIbqJofjo2CLmJV5rDUO7jyriGf6xsc0WRNoWKUfsz/yQiBLJ
	ds2DZYtPgrc4kGO8Bbe1sgqZYf+orTGB+KqKr3MD3Q5r4pLRQNHJJZOp6OmGfyTb
	+ZdyYyanVOctpilJLKOyP5gUwYEL6abQD4neXLC9NM4grS0HcsIRkXTW82g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kbs4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:25 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9857717bd19so100258241.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349444; x=1790954244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uT2Prej1vk3zX/S7OPlnxWtUB4o0ge4FHSI3+fpimn0=;
        b=HcXP+MeZLC4cgNTBqspBJxcLgp5Xd7W4MN01G0B+sSnJkRTcyN2BIWy0faQeoTnFKi
         TtXaKF1QuQ1Ut5KarvknOlFinEdOm5skf2NMXD6joSj/4aDiuB5ICl8YVaGWICj7wceS
         gVlV2myEScIJVJi6fxFA923maltVWVy/h6WXoFQWjfWh4d4ig0Wx5CNKXsAhbBrOGr1s
         MJZWGSlipkVfG16AOP+LBUgHahgLDNgFqpfc6xlOcf8CaXK3mjO0q7rl542MaJbOUx/A
         ORH6kf996y2jtAO10Vb3/XLzYpsHLd1+RXE7NtJQk52cMNqpuAcU+cu/3kPSBYcctf/2
         OFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349444; x=1790954244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uT2Prej1vk3zX/S7OPlnxWtUB4o0ge4FHSI3+fpimn0=;
        b=K6yVRMQbNxNMB+DG+61xoQde+9Yo0GmXdriZBVcQtFdDR9Ecs6vc7ZbaXQ3nuMjMfF
         8wBdr4qTpCRObyHZVvgW2ei3Ilt7zYGQV0lItXl/av1C49mHm5V2xTIowqpokve3WsQK
         gPhvRn9xCD3AR8Z3/D86GXMReDRPYInby9SbxjBvQUDNVeiHlTh2yR4du2ZljTB+7Hrt
         H0tJHsNEbUxedlKFbDcWLtciWWFIAabuYG4dy47zG08RIih7dNUxacrmHnSt2xNuw5Mc
         mZAKS7qZSVsFCn4wxd9NyjAvklkRks58vu2P8CY0y+jcpu5VE4P9ocDTE5S/Q0PoGPIY
         1M5w==
X-Gm-Message-State: AFuF++lAiime+ifUjRC9YCwe41n4bJ5MQ2amIMuiHkKRsAl1QobPIr1D
	ia7BMY1r38dRNqhyKFUgla7BquWk7KQd5U3NEfu/ShatloOB5ti06NEKdRWV2PrFd85Fvo+Vtft
	azbbil8gG5Wo83lL/eM1kDbWvgyQUTBL+UOlEaVd95kyVa3WqJ4SsLpW6vXdx+PcYAsMDiOaroS
	gBzm8=
X-Gm-Gg: AYBFou3M1FApiMQxw0m3reuOv9vGiEfvcNVQ5VsVF9ljh606q/MLx6XGNGNYuUMgtnN
	X2/rPLZ4j+C9ggBCh0iufrQGa7K7q+uQ+pTjUJWFKxFfYpah3CCd0APel7sSS9I48f9sv6ezS/b
	8gImNnlCBBpRLTMQ0yGIGY+SC2x79I823VFxWsnM5CPt8XGKvE8j9aivb96NxCes4YpuWJE//0X
	fyByRYziE07U8mAFENfxxErRiWSci1uUuqWHPdToEajy7egVlkI0iuVGyyilKgrkoptemQ2gx1W
	rIZZxBxphk5MKkEqVJIsrnSNniKwNcC+VHdwUxjQ735EuxdbGhe6xyHVIK9+C0Uku+aGaHnpGQ2
	HLg906/KUJE+W/IJYlaot/nUfi6UhTja4Ks5s1A==
X-Received: by 2002:a05:6102:4b14:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7af1cba3036mr2420136137.11.1790349444067;
        Fri, 25 Sep 2026 08:17:24 -0700 (PDT)
X-Received: by 2002:a05:6102:4b14:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7af1cba3036mr2420112137.11.1790349443361;
        Fri, 25 Sep 2026 08:17:23 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm63738805e9.13.2026.09.25.08.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:22 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 11/16] irqchip/riscv-imsic: Support IOMMU MSI address lists
Date: Fri, 25 Sep 2026 17:16:54 +0200
Message-ID: <20260925151659.419512-12-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab69085 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=jAyyop91dzRkNHH0oPsA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: pu6j82FUyBlOwbkbaQfYolQkVHE5onwF
X-Proofpoint-ORIG-GUID: pu6j82FUyBlOwbkbaQfYolQkVHE5onwF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX+GlYhlncw6bl
 bQ3JdQVpFarCjrn6z/V4bV6HukwNzmfV2WRs8Pe7CSsJaJKuDLY8NrR7FH1Oug4yIYhFPpFY7H/
 WIII+EZD40cqI8QtWi7DScnrlRecQjQIFOlTO1ISOGbdlTw4Ss1w38kE7K0IGdqsbgoLMdZmyw1
 tDY/3MPQA/mXaiIjVRTiIyj1t+SePGNKx3QEXrEKJWwrlxva7tGy94jHbMkm1q16P8Mxon3FMAu
 cdPgy8MJjlvV1q7s47Qt1Xym3L4hoCrcBHV28UkCdSsl11n2Umdb+OAnRZYJ6FQ/jFGgl2+/83E
 5l3I+GpuFHGpDhSzrhxo/kzP8PHPiR9y9YkK2uXzhaaoVpjKTA36aAEMR8YNqOyfV9Gfk6/PH9j
 5aYUVlI69/yM5YXYMS8ChA/p97KUqYVuzUdFVFm/JOTT3HmmTrrym7u6duXVa7VR5vGm+h6k7ju
 ky9RwZy4GM/5Cf/1IGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXzRW19DE89HJB
 bqtOvi8wNhCnqvk95sAqE5vSZnz38yJY/OHeNWwObmhhf05RoKMNARrwnZxku0IfbvSLO7fi3UI
 st3W5jSutR7YgReIhxxbx2Ki29ei8no=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081725_869985_607E0546 
X-CRM114-Status: GOOD (  20.32  )
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

RISC-V IOMMU host interrupt remapping maps every possible host IMSIC
target into one contiguous IOVA range. MSI message composition therefore
needs each target's position within that range.

Prepare the complete IMSIC address list while allocating an IRQ. The
list is guaranteed to exist after IMSIC state initialization. The IOMMU
backend maps the pages and caches the contiguous base IOVA in the MSI
descriptor when translation is needed.

When the descriptor has an IOMMU MSI mapping, use the selected logical
CPU directly as the page index within the IOVA range. Use the same path
for initial composition and affinity updates. A zero iommu_msi_shift
means no MSI address translation is required, so keep physical messages.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/irqchip/Kconfig                    |  1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 24 +++++++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..a038e1121be3 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -651,6 +651,7 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
+	select IRQ_MSI_IOMMU
 	select IRQ_MSI_LIB
 
 config RISCV_RPMI_SYSMSI
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..ddb2bb570cdc 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -10,6 +10,7 @@
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iommu.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
@@ -69,8 +70,10 @@ static void imsic_irq_ack(struct irq_data *d)
 	irq_move_irq(d);
 }
 
-static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_msg *msg)
+static void imsic_irq_compose_vector_msg(struct irq_data *d, struct imsic_vector *vec,
+					 struct msi_msg *msg)
 {
+	struct msi_desc *desc = irq_data_get_msi_desc(d);
 	phys_addr_t msi_addr;
 
 	if (WARN_ON(!vec))
@@ -79,6 +82,12 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 	if (WARN_ON(!imsic_cpu_page_phys(vec->cpu, 0, &msi_addr)))
 		return;
 
+	/* A zero shift means no IOMMU MSI mapping is needed. */
+	if (desc->iommu_msi_shift) {
+		msi_addr = (desc->iommu_msi_iova << desc->iommu_msi_shift) +
+			   vec->cpu * IMSIC_MMIO_PAGE_SZ;
+	}
+
 	msg->address_hi = upper_32_bits(msi_addr);
 	msg->address_lo = lower_32_bits(msi_addr);
 	msg->data = vec->local_id;
@@ -86,7 +95,7 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 
 static void imsic_irq_compose_msg(struct irq_data *d, struct msi_msg *msg)
 {
-	imsic_irq_compose_vector_msg(irq_data_get_irq_chip_data(d), msg);
+	imsic_irq_compose_vector_msg(d, irq_data_get_irq_chip_data(d), msg);
 }
 
 #ifdef CONFIG_SMP
@@ -94,7 +103,7 @@ static void imsic_msi_update_msg(struct irq_data *d, struct imsic_vector *vec)
 {
 	struct msi_msg msg = { };
 
-	imsic_irq_compose_vector_msg(vec, &msg);
+	imsic_irq_compose_vector_msg(d, vec, &msg);
 	irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
 }
 
@@ -225,7 +234,9 @@ static struct irq_chip imsic_irq_base_chip = {
 static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				  unsigned int nr_irqs, void *args)
 {
+	msi_alloc_info_t *info = args;
 	struct imsic_vector *vec;
+	int ret;
 
 	/* Multi-MSI is not supported yet. */
 	if (nr_irqs > 1)
@@ -235,6 +246,13 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	if (!vec)
 		return -ENOSPC;
 
+	ret = iommu_dma_prepare_msi_list(info->desc, imsic->msi_pa_list,
+					 num_possible_cpus(), IMSIC_MMIO_PAGE_SZ);
+	if (ret) {
+		imsic_vector_free(vec);
+		return ret;
+	}
+
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
 			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
