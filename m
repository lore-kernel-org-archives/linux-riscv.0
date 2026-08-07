Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C61AC2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZPSmd8UcOarF30iovYwZi+BdYCl9V216GxgmfDpT0s=; b=woRtMC9yUKV7Ab
	IUj2KRjTRAEcPZ0z5aBOikIJCtX8n08pxzZMU2RubZS6QAbmc5OgOdMaVp9F5Vl2iwE1TIlSyi+kY
	av3+85WxeakFssTyW6TqAA06Vyyg8Q3vNG3W8eAvqd+aT89iLG6QfdmjLppGirYCmC+G8u2XLDfDm
	s1HvXO073XnF+zCg1FshC8tQGTXoeDs9uwCvPWxHMV79+KGz4QJWmaVp9wryXjVqgRBW5jO24Ao2a
	izZPVoc+1SeGDjm8RTE9VTGFaoxWhazyQsHRbTlOhjaMmaKhZvjL+qneHLCd7q7u2BmWC0dN9gWSM
	5HJh0JWxZn+3jhNDPpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8Y-00000008ZOJ-0GXn;
	Fri, 07 Aug 2026 18:17:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8W-00000008ZLn-0PEm
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOdDW1224947
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6/g900LeMuA
	9H91SWWyZJUr2BtZA/MVuA2CBGYpOYUk=; b=A/YJamefyWCCP/VUAE5x5QtbwKu
	5I72lFTZwcNVILZidWXJYo5m+T/UddpFyXBALhpFXo3WaLGYhLj2bRLcO4PCnZeN
	5Jalna6M+RS8xV0n2RUkJtUzHgf+fqkRQVisGCcsGjy/Njx11/BzOcmAA9GVIe55
	cUzwOnYseLMatAY9XgOwNM2AUyfMyaESaqYmAG5qTkh0w1LFfu3shPRv7KuHCmTC
	Jagfe2GIHFNNsW8igNru0Tc8eDNbPIlclYBwbE1Wce4qBOoZHsiqEs355lgnzRSl
	DX9ib2770l82OrLHKUkQ9oryr+ryJmK3to+5OtLqTcDfuGFaXontkBG0FLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgem97sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52cd0374265so60725081cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126658; x=1786731458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/g900LeMuA9H91SWWyZJUr2BtZA/MVuA2CBGYpOYUk=;
        b=RiwOO+clVdxC5Yn513IpSfoeVErZ10EMloKe30gT4atz1PpO8YYOtFp4zTqPaEqy6h
         8FnKmHMVykuAoNEB2T9mwnsCwSCR+smCPygosYWUZFjmckS8/H8qcWew5z3u/zZVgDJ3
         HFxi7NHs/TQVypwoKdphxR6bNFonz3Cwjv4MovQkxU0nPuKRcrUh6U6b7FRMgbKtJEKP
         Gw2QeXKJz8WtIU7A8rTJjNIPceYwIonuoPBr6ucSQb8sc6Tt8VYpTARy7/1/BpV8vZ9W
         v4s2amgPW1TO7gjKaJ8C6XrHWb76IG3GHkyH/69DhhrEV10b1ODtm2VHikAnTOkmJHPl
         iTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126658; x=1786731458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/g900LeMuA9H91SWWyZJUr2BtZA/MVuA2CBGYpOYUk=;
        b=bJVUL3WRL9aHRjpexmJbDpBW+8C5Avb9WN+ZL06DtrKc5jeLQ2I+1KFFxgbvIpVfU1
         AUKSzUOFIq1JwoY6jPUByBAYVJuIRi6OZjZTHb8HPCTNsoSFOnCXq0vJaAZiQNBaeHUI
         uvSSMxJA4W5IwsFglGunnOVKYje85vEEwMy68HKAl0ZBE2qhgAqn7JnkZDW20EGTobK6
         2nfU0ROnITylfJ+Ss6qec5WHTUImALP8UGRWd1HIIhQxnfHAuMq+1YgiXa28XaaAd+7F
         9A4Dw8GXHgeBYX7cJeWtNM+C/IuieSwgEKKTV9xZjW3OXwZQqKi99NbfUQMjlclWrYwk
         edAA==
X-Gm-Message-State: AOJu0YyLESHWJxzAub8L9zvVvvbw9noPdeYw5OmQnJVIkqFAAFkL3xPo
	5ozZhpNUlolbTOFgiegIz3nuhmDuv4NCSHLX0dImz+48wb2GFOwdLtBOxluYSGNvgmsE+l6eNjw
	Y5z6Etdanm6v0I6yIZ3LCwZCPDywDZsgHrw97KvaiE3iKDdcvJETYYhFynDYddeT0Yq8VMmMXdB
	w8j8w=
X-Gm-Gg: AR+sD12eLgUyQrPjhIwyhG8e96dj0HTyZl0jy6oyOD0y6ioBKnsAwSl57rAMZGLFEZN
	KTdjOtLt286sREa7QBWcBJWnXKk3Elb77z1CCmpPybkX2B25NfiweLQHUcxy91O63iDYLqYW6D3
	s11jOXpnt1oJKtXgk9Qvkfo2G9bMwgpCQdktXPukr2Q6evXH3/JodsohFPxyiZEqjRTqbS1+5IS
	a9fiHwmA2tf6M5mGPXBQVlvZ0Rfz1cFxXlB2JlLcch9A/pHJjO+eDMfz86ozsrcx4zyIRoSiiio
	uegUU0oJP1ldGQnlkOjncujXuTvRUju/6a7r/gEbb3Dn8beqEb1K6bPfbLDg0nzzrkLwmucUiwI
	4tvfd+LGf6k9hN1HyBX7Bu/JU
X-Received: by 2002:a05:622a:400d:b0:527:8651:7f7a with SMTP id d75a77b69052e-52d20a10f25mr38177111cf.26.1786126657983;
        Fri, 07 Aug 2026 11:17:37 -0700 (PDT)
X-Received: by 2002:a05:622a:400d:b0:527:8651:7f7a with SMTP id d75a77b69052e-52d20a10f25mr38176331cf.26.1786126657521;
        Fri, 07 Aug 2026 11:17:37 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90494sm80217466b.36.2026.08.07.11.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:36 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 11/19] iommu/riscv: Copy MSI IOVA table when replacing an iommufd domain
Date: Fri,  7 Aug 2026 20:17:05 +0200
Message-ID: <20260807181713.228535-12-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 43R6V57tO0aqTHwVXAG_jnK2WreHLSGX
X-Proofpoint-GUID: 43R6V57tO0aqTHwVXAG_jnK2WreHLSGX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX4s/BSlJAx5B5
 RO7o3qMpyGBmmY9pAAyKJM4Yf/T7Zhc210r0Qkq+O+0J9U7CdLpiR4xS6q+QtpnWsWEDgqMSyOW
 l3ZsgVCBKBiXWaAA7W314c5qByowIU0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX3waB7/IpIWoQ
 ILzOcBjOJ6bF5FhwGYupKaXTU0c3Nsemnf5wIBQhTIBH+ZNdGNbmfI6Hxjt73R0qPXmRsu8CDs8
 2lGU1plP8jgPi29q4RzxeDzAzdNIEuAALKLXn5mXhfR6o1u0Lh+DwQvhqJDdeyfAMOkJ6mt0lE3
 9HTLUrxPCR2F4m4GwFZu9QvpZbUhxPzQNdocd10zuebm0NkLS5I+tKGA5TJ9F6yCKFeqeYe8o//
 cqTkrEOy4FpUWR5us8ngOyk+2U7Dnp1UX5YdqLxnI/7YvxeQ5n0ugVbp6+enHO04ygxftbEJJO+
 qekkkFZQdOgajfP1LNIFrHqQeK+ld2EUQ47AeRW0vLUFOIpffe4snoXo9UzNm4L8CsPqEOBWRQa
 srzj+ouyhovODinBrpn0TrjmfAz0AI3q7lm9tK4Gk0EiHIcbe9cqaciIDCGA3xgWudPa7EbYtA1
 qHWAzn13W0dJQv/Z3ZQ==
X-Authority-Analysis: v=2.4 cv=X9Ni7mTe c=1 sm=1 tr=0 ts=6a762143 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=advkBHUnGrKv1w340x8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111740_253263_7B3619EB 
X-CRM114-Status: GOOD (  28.00  )
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
 drivers/iommu/riscv/iommu-ir.c | 78 ++++++++++++++++++++++++++++++++--
 drivers/iommu/riscv/iommu.h    |  2 +
 2 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 0dff74aa9b18..7d9a1eaca92e 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -118,18 +118,26 @@ static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
 	 * quiesced, including MSI teardown, before switching away from or freeing
 	 * the domain. iommu_dma_map_msi() requires the group mutex to be held;
 	 * take it around the domain lookup too so info->domain can't change
-	 * out from under the build.
+	 * out from under the build. Bump info->nr_msis here too, before
+	 * irq_domain_alloc_irqs_parent() runs unlocked below, so a concurrent
+	 * riscv_iommu_ir_attach_paging_domain() can never observe a count that
+	 * is lower than the number of MSIs actually in flight for this device.
 	 */
 	scoped_guard(iommu_group, info->dev) {
 		domain = rcu_dereference_protected(info->domain, true);
 		ret = domain ? riscv_iommu_ir_build_msi_iova(domain, info->dev) : 0;
+		if (!ret)
+			info->nr_msis += nr_irqs;
 	}
 	if (ret)
 		return ret;
 
 	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
-	if (ret)
+	if (ret) {
+		guard(iommu_group)(info->dev);
+		info->nr_msis -= nr_irqs;
 		return ret;
+	}
 
 	for (i = 0; i < nr_irqs; i++) {
 		data = irq_domain_get_irq_data(irqdomain, irq_base + i);
@@ -139,9 +147,25 @@ static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
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
+	 * than the number of MSIs that are actually still live.
+	 */
+	scoped_guard(iommu_group, info->dev)
+		info->nr_msis -= nr_irqs;
+}
+
 static const struct irq_domain_ops riscv_iommu_ir_irq_domain_ops = {
 	.alloc = riscv_iommu_ir_irq_domain_alloc_irqs,
-	.free = irq_domain_free_irqs_parent,
+	.free = riscv_iommu_ir_irq_domain_free_irqs,
 };
 
 static const struct msi_parent_ops riscv_iommu_ir_msi_parent_ops = {
@@ -213,6 +237,54 @@ void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_inf
 int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struct device *dev,
 					struct iommu_domain *old)
 {
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_domain *old_domain = NULL;
+	dma_addr_t *msi_iova = NULL;
+
+	if (old && (old->type & __IOMMU_DOMAIN_PAGING))
+		old_domain = iommu_domain_to_riscv(old);
+
+	/*
+	 * Copying is only correct between two IOMMUFD domains: their MSI IOVAs
+	 * come from the fd-wide SW_MSI reservation, so they match across
+	 * domain instances. Every other cookie type derives its MSI IOVAs from
+	 * domain-local allocator state.
+	 */
+	if (old_domain && old_domain->domain.cookie_type == IOMMU_COOKIE_IOMMUFD &&
+	    iommu_domain->cookie_type == IOMMU_COOKIE_IOMMUFD) {
+		scoped_guard(mutex, &old_domain->mutex) {
+			if (old_domain->msi_iova) {
+				msi_iova = kmemdup(old_domain->msi_iova,
+						   riscv_iommu_ir_msi_iova_count() *
+						   sizeof(*msi_iova),
+						   GFP_KERNEL);
+				if (!msi_iova)
+					return -ENOMEM;
+			}
+		}
+
+		if (msi_iova) {
+			guard(mutex)(&domain->mutex);
+
+			if (domain->msi_iova)
+				kfree(msi_iova);
+			else
+				domain->msi_iova = msi_iova;
+
+			return 0;
+		}
+	}
+
+	/*
+	 * No table to copy: build one from scratch if this device has ever
+	 * allocated MSIs, since those MSIs may already be live and expecting
+	 * riscv_iommu_ir_compose_msi_msg() to find a populated table for
+	 * whatever domain is now attached.
+	 */
+	if (info->nr_msis)
+		return riscv_iommu_ir_build_msi_iova(domain, dev);
+
 	return 0;
 }
 
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 8bd41dd63f0e..77328282a236 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -46,6 +46,8 @@ struct riscv_iommu_info {
 	struct riscv_iommu_domain __rcu *domain;
 	struct irq_domain *irqdomain;
 	struct device *dev;
+	/* Number of currently allocated MSIs; protected by the group mutex */
+	unsigned int nr_msis;
 };
 
 struct riscv_iommu_device;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
