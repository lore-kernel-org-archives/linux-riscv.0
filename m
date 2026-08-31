Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2A9C624C6
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53PHMMTurxHIyzNCTbvvxy9dO9xl8zRKaTKLTj3K9Ls=; b=vMOZ9OGU1983ge
	tvkJ+5kPLN9iDlmirs1tH0I7eMnrKSDGEtAbCB+NAE0VVVhD0INS2jww7gA/EIksZQHqzQ4ED+ZTI
	c2BciWxffoTFRaikPzFB16alWKfCMWx/AQGzpwvNGhmwvxsDhGbhxpsGi4b5I1I2XJ4ydtnAU7fjP
	YKIqi+dBThk0heiydQ3WTmLTEzAgwPNUIJiF/TQX7yUSOGvgY6OLQANZwlT59SXsZ+5U6Y4rSNsTf
	FhiqRfAp5h3LV+NAWmnf41YfVE4V4Ak+PeV0VLA8olfViI8LAnCbZ7QLnggOOBzrcUcC3OW8GokMq
	zCbUzS7vgjGjIzX+uGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Uh-00000009kuZ-1pjC;
	Mon, 31 Aug 2026 15:00:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UV-00000009kdm-386s
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 15:00:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETSJX3703780
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zw80Tv2AUkE
	oZUkCffPmU+BFxb4TWxnn8dB/Ukvaur0=; b=CsK3lQJzlxavD7umb0ByOSCa0SR
	ldDgrKy2rSMpFNNJdpqohaKCBe/j1FFspmlqDr9c4SDN3yz9FnCU48t3svhGjq/7
	QQhz7VGRZwlVGMeWjUKaLKB32ec/aWSBLfJcsTpEklMosjQwacHtQDTjoA7eEmDv
	OrBqWqvh/kai5MStXsfsyPKnJd/1cdrrOmYwsUgq6VKF6P5WQYQ7rPg5vc1/RCCv
	A52w20So4+kub6OZ/qQR0tPrRPQuSlIrAWb/BFvw6w4GDv8r73hzv46fdgviI+WG
	nfhB+rpY7Gn7WeuJnXo+KJ9Hp3ZQsPQMo9U52Ufz3q9eAKDmus0OQ/Jy53Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasc9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390ca1a9abso522312585a.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 08:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188406; x=1788793206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zw80Tv2AUkEoZUkCffPmU+BFxb4TWxnn8dB/Ukvaur0=;
        b=VlAXSsmLTrK8no77AAVAUXMGnnKshydzOUFfTlIvwpN4h8thBtzdII3Sej+bULd6Wb
         hUp3rBPZgvkzGiQILYJNJPjD8fiRRDujBsipgs6XSTWodfspnyEav29+yNuzBTlnQul0
         Bep7GFSs8BU9dw5lAiFes4WzriLdlTeEXBoD1uQ4F1Q0RyVlQXRcKAAmDAEG/wiJ+FjQ
         fnC1DQNA+NNTHfnc63UxxxyHxGsSHBdKMA8aX7nWeLKyVWm2hf5U614npmVbPvfyQDND
         Uog+SLYAtqcXpWoUp/XP2IwuGbFK2QDbpl9XcPVd4fZlsZ5Z+h7eO73QtZYW+xwUAoi2
         wwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188406; x=1788793206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zw80Tv2AUkEoZUkCffPmU+BFxb4TWxnn8dB/Ukvaur0=;
        b=PmQQjf0oYySgBV6Tooj8uOcgbzDLNtTV0dW1S3hXG+vLLTVA388JfXx7lTOdV0KOEj
         EhMdD09Gisxifz8i3RBC5smfC5SqGnnHClq/NBl7PluhyRfal42KiqVQNce9AmXGCarp
         pTdR1cchAnxss4oQcSdh3kD70ZyV+xz6F2xENHdm5txrKqq8BYNr3sNJFYGbtg1eBRUt
         KabpqU6T+HkskgdFRf+lv07mco3TsHDnHI5ytcpdNKh2lFgvXw6BDDVL7w4M5LHXwzBN
         bu9+B50z6rEWTeSDLLMwewTMUrhixrjuxY92D9rRGuY8ppF/CjfTQOa8PR/1g+plSut0
         kOCw==
X-Gm-Message-State: AFuF++mjx0OJ6SF90kD8jABjvJw7XCTnufgtMSZELp5i9e8kJQJWGTtM
	mPSugzkJ9nmcFTc9pbGVm/c1iCAoW+ZrakhL7t0nL4WbfjGpBzbzf+cGU+92uiK5yPsmW2GMDiT
	GiWbKtELfdl+myitkS5AIXktOf6ZqmgnWyJYksnnF2e1wH6ikk3PgFwoexm7OilLILQZYO7VfTN
	1ydaU=
X-Gm-Gg: AR+sD11m8kDM59kJFC0xmaBOEn7oKet79zHh/zq2Ht7KqQjtzEN3YFpc04KWbYzWFD5
	qdvAT6EfthfVeJ9njMwCbPQx6Du0tDMvhF7Kg84DJo2ST3+G/VYiXe+8PC3/WZTFibYXcCawkUd
	Y05eYRr0GNI8ktT64Q5zP7G+4jzsv8GZz9ai/w44S64CMi8roSr1eZC36r9iXl59cYklWwLm6Dp
	LKX1NiJOdEfJss3/m8fAoxdopXTq8nUweF+twX28Bw1FI+dhDw5zVG7H1XblYnjSaUhFDRqRdPO
	gbeLGvo4ra5XPDLH6LWt6hoEzLrek3lgR0mO7iCTxOPiNXz032CTcLY7E+NXkiowAnRKpaZXTey
	x3GBHiM+ykoI1u6MuRK17Ej2f/FZdYiEiXnk=
X-Received: by 2002:a05:620a:7002:b0:936:e18d:763d with SMTP id af79cd13be357-939137af523mr2744026985a.8.1788188405984;
        Mon, 31 Aug 2026 08:00:05 -0700 (PDT)
X-Received: by 2002:a05:620a:7002:b0:936:e18d:763d with SMTP id af79cd13be357-939137af523mr2744010585a.8.1788188405326;
        Mon, 31 Aug 2026 08:00:05 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dcaf61sm272743545e9.4.2026.08.31.08.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:04 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 12/17] irqchip/riscv-imsic: Support IOMMU MSI address lists
Date: Mon, 31 Aug 2026 16:59:38 +0200
Message-ID: <20260831145943.313726-13-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX25Dgs4m2KpAz
 NQlhlxEC985B2U3Wbz8m4SY77a7ZpQ2ZDX08aTG4H/6TBk49aS/WhLVOZvcYxFQsg36Vp/opar/
 kbo10zbtGKyJgaEMYfJe9a5DfwvWwzY=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a9596f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jAyyop91dzRkNHH0oPsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX4TDQee/qLHYm
 w5vI5eGb3MIWIGfvoCbFpz/3gjlvSCg39kWOBhzOzph/K6VQdmyxbEIUmTeT+CYbJcRukGkHZ39
 baUONLwZ/ywP6YqpIqlF9hTbWnN9elpTjDqFYWmw7A0ZJNoJLhz40Uw1iep34/Bjy2WpSbTM9TL
 z8+YPbAFIVKl8V/l3CT6N3WnCFw9yCc+ryumsB3hAuaR56wpBp383i5sqn8EB0OrFNpTBqkEmZu
 Uz0VcLVg7f8IjD9zzDwRzJEOInfsHCLnCxl85vRhanOTGuTDr0G0CZZXjTjUoQtdnwJZDHzOI+X
 Wi2sNpgZFXl61CERKafFihnbVtdFohNUZZR5obznmqcl01CG2NGUm5eLI3hzabZHa2o9VPsYRu/
 PXqaeppBlOBlGygPL3KRn/b1mfuq6uor/nrtu79ewMtOZt7qAAoNirpMlQsyoBaXyXTJJIyZxMq
 UbsQiTjMpP/DVGMI4kg==
X-Proofpoint-ORIG-GUID: QBDv68ag2F6qjNC5GV8Y83QUodVIPKhl
X-Proofpoint-GUID: QBDv68ag2F6qjNC5GV8Y83QUodVIPKhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_080008_938011_BAAD848E 
X-CRM114-Status: GOOD (  19.98  )
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

When the S-mode IMSIC address list is available, prepare the complete
list while allocating an IRQ. This allows the IOMMU backend to map the
pages and cache the contiguous base IOVA in the MSI descriptor. Skip the
optional preparation when no list is available, allowing devices which
do not need IOMMU MSI translation to keep using physical MSI messages.

When the descriptor has an IOMMU MSI mapping, use the selected logical
CPU directly as the page index within the IOVA range. Use the same path
for initial composition and affinity updates. Messages remain physical
when no IOMMU MSI mapping is required.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/irqchip/Kconfig                    |  1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 25 +++++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 42f2278a702d..c7cda52b21eb 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -656,6 +656,7 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
+	select IRQ_MSI_IOMMU
 	select IRQ_MSI_LIB
 
 config RISCV_RPMI_SYSMSI
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..6e26a31f7503 100644
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
@@ -79,6 +82,11 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 	if (WARN_ON(!imsic_cpu_page_phys(vec->cpu, 0, &msi_addr)))
 		return;
 
+	if (desc->iommu_msi_shift) {
+		msi_addr = (desc->iommu_msi_iova << desc->iommu_msi_shift) +
+			   vec->cpu * IMSIC_MMIO_PAGE_SZ;
+	}
+
 	msg->address_hi = upper_32_bits(msi_addr);
 	msg->address_lo = lower_32_bits(msi_addr);
 	msg->data = vec->local_id;
@@ -86,7 +94,7 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 
 static void imsic_irq_compose_msg(struct irq_data *d, struct msi_msg *msg)
 {
-	imsic_irq_compose_vector_msg(irq_data_get_irq_chip_data(d), msg);
+	imsic_irq_compose_vector_msg(d, irq_data_get_irq_chip_data(d), msg);
 }
 
 #ifdef CONFIG_SMP
@@ -94,7 +102,7 @@ static void imsic_msi_update_msg(struct irq_data *d, struct imsic_vector *vec)
 {
 	struct msi_msg msg = { };
 
-	imsic_irq_compose_vector_msg(vec, &msg);
+	imsic_irq_compose_vector_msg(d, vec, &msg);
 	irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
 }
 
@@ -225,7 +233,9 @@ static struct irq_chip imsic_irq_base_chip = {
 static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				  unsigned int nr_irqs, void *args)
 {
+	msi_alloc_info_t *info = args;
 	struct imsic_vector *vec;
+	int ret;
 
 	/* Multi-MSI is not supported yet. */
 	if (nr_irqs > 1)
@@ -235,6 +245,15 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	if (!vec)
 		return -ENOSPC;
 
+	if (imsic->smode_msi_pa) {
+		ret = iommu_dma_prepare_msi_list(info->desc, imsic->smode_msi_pa,
+						 num_possible_cpus(), IMSIC_MMIO_PAGE_SZ);
+		if (ret) {
+			imsic_vector_free(vec);
+			return ret;
+		}
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
