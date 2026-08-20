Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8356C5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8bpO21VUiEVXUI4SrCJQES6KHm+mFsNaCkusDnvHI0=; b=DvaWFkkc8+O3qU
	Gif7Md6caPYlrWU3dIXDt+b5qYP7xnCMQ27bHn46b7cHtHvttWE1yXfAeiqy5iycmu3CtMh3QU/CR
	w1z3j0hUN8wDPOaKbAPjXADOyhqPHmVbAK2XPSFNXS8R8jl93qS2hHMXW/QPqWAA9anVgQ8J3eIJV
	BkwfD9FMa42iMkih78Ls60PdnGdEtn8/itgbCNGjXrkMui7KJW3f+JJ80x8cYuhoxxsF4DwWz8z2D
	I55ppN14Qg/xjOfuMqv+iTM3rYkcn1k4UNeCms/ThoUCIImEGS5VqRq/+JmWn+NW2GLZ9YTO8qQbZ
	2rjZHR7+e3JlnZk9fzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAX5-0000000CEHY-1BzA;
	Thu, 20 Aug 2026 21:42:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWx-0000000CE8F-1NrV
	for linux-riscv@bombadil.infradead.org;
	Thu, 20 Aug 2026 21:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l96Vk10BuNm2ABSC8yUkNdbBntXx71mGS/943tRJnsU=; b=JmRhpY03kqKcFbLEM0CCCm3E25
	mFAShSvKIq7GOwXbUiKQy/0Mu61TKcrBeNBcK9kedDg3iYxSEfgp6cYgSrbmcRAHQu/dlEdmx7uDr
	eyLAglLxYsvjdOsGFszhwZ6YTB5R1eEgvojAjFtQQU++IfLFMN+On6UXNJmexU3piodhNkJTuzP7/
	jf3GJ2e3x6SJGWS3hTMK+ck9VqKllzjja6ZHLAr6FtCeDQZRU+tVLARTMQhc+m1DOAIfAq2rpgfOG
	HQasyDexRYpKEB0/MwLYFSJFYkXpAJi5U6GqCjAGpeEKbo5xcsUhcOVRg2VZAImDcqupfnyF3mztU
	6ArUBKVQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxAWp-00000003MWO-1efq
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7Yt04012642
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l96Vk10BuNm
	2ABSC8yUkNdbBntXx71mGS/943tRJnsU=; b=VV/7LDgq0z+aQ+m4d8sPRE48Fns
	1psooAGT5co1Gfr3ogtiZf2RC73SE95+IR7NVUldbHbCOI3c0+foclE0xWettZ75
	4oP9NKQezLpUea+6eBS/q1q6XAsZ9j7QJnakdTeQSHJnqGx5Sr6y0EeV/7bKd+OI
	JQrFSex4+VyrJWkSMjVvVdTsww9Xd6Pe5Ib3IukVr8oVSDK18B2Fhxn9kc2n42AC
	bfnIWwbT8yI5GWE0WxUkwvpC6V8IiS6FivgHXBSjQAgJ87zn08P79tfAHhYDcj6Q
	YgBNSsoLARjhQzkqW+0+vKWt1W/xu0R7936GBzue44En2bRhI6+H+HeHnrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29kee5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d9cef8d15so5491301cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262140; x=1787866940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l96Vk10BuNm2ABSC8yUkNdbBntXx71mGS/943tRJnsU=;
        b=AT+h1Cf3pXe8t15Wh2AVxtOF5MX4epln7MKjQAadJX5Zjr9fuDEiXeUiRuqjqhx6Qo
         0cIU+J9WOku1DN6Sac8NfQrD2YPMqrbR8SeT/BL7Cw3xhvDHRnU1fMYFRarBXnLMdBhY
         1HA1RPZGgHPIsNcetmBLbgwqQ0wysVPgo6dA4qkvAs/TV6GMr8QkrAGOX4BFGlJstNop
         oofBdfu9TERDWc7h3pOQcWScAgFpObforJRXvJhd/SDPkx/oaf6dj+ibPzQOxJUk6ucw
         YWpHP5csQH6tZjIh0DMhjMTIf8GccpriOE4wXCj7UtG1k4CzvbMsZsHRNPtTe4x8IRZu
         7Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262140; x=1787866940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l96Vk10BuNm2ABSC8yUkNdbBntXx71mGS/943tRJnsU=;
        b=G1ACoFy7Dl3uWYAMwTPF8vYkrk1M9sb/4dTq/mB9GbOiqFXa+AG05e3oFsoEprXv0h
         n1OuVFBS/RjKHj0Se9cqlNXgEH+lDRPbosLMfVm4SHtIJpm7d9YF3ASIPbVIroZu96rJ
         UnJoYJbmsYxDlDw9oSslbY9oQl1/Efs4Y5g/l/mLHH8FqwcYo5LkC8Y7UpnjkLANjTKj
         ozIsTnd0YPJXPxyry/lUasei+gQN9lc41wbYYSQJNkEWWcFBnK5ga1+bu0x905tO7XOK
         HvEJobPbhmCcvV7ECbe7ZY+BOyeR3BTr8WK8QDwxg3xryqOAfws2P2yXA2fOs1uFRSMq
         srjw==
X-Gm-Message-State: AOJu0YyLvRmWfWSPMDgixrxfBi68O7s7OTfFJLurs9p8UhPsYm3H8VZt
	uJGB6BZJ6mX0a+xdFYgtX17vKSJ9ysu3RjhDoyz5tmvLO/zCq1RMRTh0kMZhQU4ETYu4g4nHG+a
	AS5Ko3q3iQ/gcgHPJTY/0sL2KkWhvHNZZnXV80u2HWnyA5L57xdoD1a5MfvLYVqoRhupQxoUbKc
	bsajc=
X-Gm-Gg: AR+sD13E0OwAEjAqQHlcrMvpWJ8Jcy9XTdNI9vkM7A+SL8j5zjBZ/NSPnNVI4dGYId8
	x4CzyVmWejAOgJuv6W4NG/em9jnEM/zYIqqNLb3Clc9tCEbQKnTj3EXKOWNaq89xuBXd8DDdNte
	OQVCkPQzzlwpqZjv9ZDGKN/jstC+J0jORgSbpC792NpgTqtS3pc0lSj/p278qgwwj8ga+c6SkcO
	uEqv3kUzS2/M74nt6k2FnwERWxOvzee9Hg+VPbTi0BrkBSrw3pvR0K+mXs6aM9CFKOFmumL7AXa
	1FRENOBgwKy7+BLKil4VZkFeOaNxGXpp7zPBPsKjh8JwUhBPxjOBABn25WpX8lsBmDxjTrODQGe
	iCIGKaL3I
X-Received: by 2002:a05:622a:111:b0:52d:6cf5:1c01 with SMTP id d75a77b69052e-52df5a73d25mr14681361cf.36.1787262140323;
        Thu, 20 Aug 2026 14:42:20 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:52d:6cf5:1c01 with SMTP id d75a77b69052e-52df5a73d25mr14680831cf.36.1787262139865;
        Thu, 20 Aug 2026 14:42:19 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90d6771sm6605765e9.1.2026.08.20.14.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:19 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 13/21] iommu/riscv: Preserve MSI IOVA state across domain replacement
Date: Thu, 20 Aug 2026 23:41:42 +0200
Message-ID: <20260820214150.545737-14-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: d5QGbYU65wZqSva5jrACVheN6MCI6S1Z
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a8774bd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QTl87LO99xnYkKpNp58A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX1yUs0wRM1dX8
 T1pdXQM38Qv0UaUqStihovgDz26QEqpJFxZD5Q1qmEN6CNJQ+3FyArvI2YZNos4LJUVjEcpn7O9
 PbamDwEX9tc3YKXwHr9az6riWhmr0qhgkR+/12o75FyXmjQKZrY/goIm5mbW1mCdK886DaNM7h2
 sT6viHib+2sJx/1oZ3+zrE2O4HYzDHyn0MinfIJfwa6om2Wfl6Nbo/orYCtFHIrii50vecXf2z3
 FHZEE433Cg7II8fDCpIUQzcKAU2jvj74xwpVQH8suppJHC55Bikn18QCRFCcFJlY954L+j9zMop
 OPK/4sWUrYCsfqDiipodo6kJMM+MUeAhPdWC8HVywkWClj0/va3NtTiKzCiqGIaI0YDwNIdQNPr
 P29EL3KpvLGlP13PrRN3FtBfawLvuZoAEKmT2lJ7Dvee9JCvDOqVQZay+WJ72OB/+67vuhJeRvp
 9qfgSfg6a2mX1nQLO3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXzYmNbT6XNVlw
 b5+VXsfvf8KUmuuzSfpmZhd7vgxmzZn2pvCILmrrAAeZqc5XQdjDtqrnZ/NT0JXrIlojD9UK6ZS
 +OfgGyeVPT6xYu0z/qUeh5Rf30pK5NM=
X-Proofpoint-GUID: d5QGbYU65wZqSva5jrACVheN6MCI6S1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_224228_091884_A6D08D31 
X-CRM114-Status: GOOD (  24.46  )
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

MSI IOVAs belong to a paging domain, but iommufd may replace a device's
domain while its interrupts remain allocated. Waiting for another IRQ
allocation to populate the new table would leave existing interrupts
without valid MSI IOVAs.

Track live IRQ allocations so the attach path knows when the incoming
domain needs an MSI IOVA table. Rebuild the table through
iommu_dma_map_msi(), allowing each backend to preserve its own IOVA
allocation rules.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 41 +++++++++++++++++++++++++++++++---
 drivers/iommu/riscv/iommu.h    |  2 ++
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 4dc104c6d4b1..5718f90affd6 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -128,19 +128,27 @@ static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
 	 * quiesced, including MSI teardown, before switching away from or freeing
 	 * the domain. iommu_dma_map_msi() requires the group mutex to be held;
 	 * take it around the domain lookup too so info->domain can't change
-	 * out from under the build.
+	 * out from under the build. Bump info->nr_irqs here too, before
+	 * irq_domain_alloc_irqs_parent() runs unlocked below, so a concurrent
+	 * riscv_iommu_ir_attach_paging_domain() can never observe a count that
+	 * is lower than the number of IRQs actually in flight for this device.
 	 */
 	scoped_guard(iommu_group, info->dev) {
 		struct riscv_iommu_domain *domain = rcu_dereference_protected(info->domain, true);
 
 		ret = domain ? riscv_iommu_ir_build_msi_iova(domain, info->dev) : 0;
+		if (!ret)
+			info->nr_irqs += nr_irqs;
 	}
 	if (ret)
 		return ret;
 
 	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
-	if (ret)
+	if (ret) {
+		guard(iommu_group)(info->dev);
+		info->nr_irqs -= nr_irqs;
 		return ret;
+	}
 
 	for (unsigned int i = 0; i < nr_irqs; i++) {
 		struct irq_data *data = irq_domain_get_irq_data(irqdomain, irq_base + i);
@@ -151,9 +159,25 @@ static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
 	return 0;
 }
 
+static void riscv_iommu_ir_irq_domain_free_irqs(struct irq_domain *irqdomain,
+						unsigned int irq_base, unsigned int nr_irqs)
+{
+	struct riscv_iommu_info *info = irqdomain->host_data;
+
+	irq_domain_free_irqs_parent(irqdomain, irq_base, nr_irqs);
+
+	/*
+	 * Decrement only after the parent free completes, so a concurrent
+	 * riscv_iommu_ir_attach_paging_domain() never observes a count lower
+	 * than the number of IRQs that are actually still live.
+	 */
+	scoped_guard(iommu_group, info->dev)
+		info->nr_irqs -= nr_irqs;
+}
+
 static const struct irq_domain_ops riscv_iommu_ir_irq_domain_ops = {
 	.alloc			= riscv_iommu_ir_irq_domain_alloc_irqs,
-	.free			= irq_domain_free_irqs_parent,
+	.free			= riscv_iommu_ir_irq_domain_free_irqs,
 };
 
 static const struct msi_parent_ops riscv_iommu_ir_msi_parent_ops = {
@@ -257,6 +281,17 @@ void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_inf
 int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struct device *dev,
 					struct iommu_domain *old)
 {
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+
+	/*
+	 * Build the table if this device has allocated MSIs, since those MSIs may
+	 * already be live and expecting riscv_iommu_ir_compose_msi_msg() to find
+	 * a populated table for whatever domain is now attached.
+	 */
+	if (info->nr_irqs)
+		return riscv_iommu_ir_build_msi_iova(domain, dev);
+
 	return 0;
 }
 
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 59779aa9d380..24006c1c1722 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -46,6 +46,8 @@ struct riscv_iommu_info {
 	struct riscv_iommu_domain __rcu *domain;
 	struct irq_domain *irqdomain;
 	struct device *dev;
+	/* Number of currently allocated IRQs; protected by the group mutex */
+	unsigned int nr_irqs;
 };
 
 struct riscv_iommu_device;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
