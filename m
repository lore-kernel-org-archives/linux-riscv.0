Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787CBC5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZbZMcvJxeWKvANh6Mxz0PD/Bvz4Pwb0n4+jilM+JoQ=; b=rgFCxVZwtSzACk
	NNkEVlO4CJCsdprTyftf9nYiJqFhJsLDkT9XSXUHgL8n6EJmzZHv59zR6L64BleOejYtoiaftnx0X
	ZoCO7eRzc8MJfYpBnPXIiMb144zs0tlNvBrTV7EfmTWKXpDmyKA2tdNnRwt7owwSZzJhCUDzF5Tq+
	gJJgRPjpQaKclMK+Auex4bEDlIZRhxG88NNfR3bMzvedyLq/fA+VO+921gMO2MCpgFdtdGpPMqHHU
	oid4s5K6EdZhUexsC8IoOAazouy0ufwQO4f5lOpoPEl5j2dgH8YhkiajabeRcEA055+JOiyzCMTdS
	EOAtgqd8HKVNj85kHC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAX3-0000000CEEL-07Sv;
	Thu, 20 Aug 2026 21:42:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWo-0000000CDxs-41Uh
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK89e1808872
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t2TR4f3LBEz
	godoIcvRa429BxbIsUho68JNVhjuQGpM=; b=Ti+c624NfkLdR8tGgILao5rXW9R
	nLxdp0hYBTBhxQpsbCJeoXIrjsf3p7NeVi2uAnB3JHwr6c9kFACkMLDWZpXg7zcB
	zMACLGkkLD2R+uF4K6flKIn33w/wPG6wmUN9yYS9Ip8ULUXCEAnDnC36KAWOtLCl
	HIpw5ifK4LmzMTXDPSlkCvbS+2pzaO7yyj3wvBDCcucII0zVwGuQC8QVTAv+ofO3
	IeVNWeLdhoBEvJL9m94XjjMsa6gnCFvOYe7FogMd/nRLG70jG13O5fT4kJCsz5iV
	Fh3jPjgOBQa9mK6ydwuRNVG39eHXrMaZ1+eKkTo+H7xNFhq2ZmAG1sAvVIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcbbv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so32468585a.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262145; x=1787866945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2TR4f3LBEzgodoIcvRa429BxbIsUho68JNVhjuQGpM=;
        b=MtRQtQnH1w4aqmeSzQSEHtOaGJep4niP0JMNbpIHP4HBadI2krUOduKG9drgtovVX7
         qH6JQ4IPxPsWJkOh++EGrTGv5YoltSRCive/q5Cty9BzHeeblnedtfaOnaKtHaATnfam
         lmAnSua9JTUa7PuRUxF74ECZvFl0NNcXW2mNGo5mU1w2MLKZkFbyB0DY2QSKJn+ooi1I
         BJjzcwqSfNM95AIgB2b2nzWMKlV8t1DMFXCK9hsVv8xK2JtDjbeiCdO9F/pz7RbcH3P8
         2EYo0Q8q3t3JEjohYrcPrkLHg6fnK6vXGOTpvxGxd8VWhKY5YpEJxSFjlo8qW2NvOr6m
         yz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262145; x=1787866945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2TR4f3LBEzgodoIcvRa429BxbIsUho68JNVhjuQGpM=;
        b=FD2nGg68hygrwrCU1sH4lJEcw7EhuzASPe5R9hqdoWjZQwHEPu8F5+JK4syR7SozTP
         3ub+5qGYUZ0UEHkopU9yPLJUjuII+AwC89o4Gou6vJjKPQzs+X6j/WB2CW/WncQFWliF
         SH1QkBZZqQ0vJO1IBcwQWm6ualLyIJaEJWDQrJy+q0vboOE7Bu5EaIFF1X93ABSXAtXj
         eNZeIRtetuKf11t7xeVVG7f0sF7yVE7LFDtIfC0O/OAGizOKCQnpius5WhWsiLVc8oKk
         O7bV5FbLUBppjMp1yxbPACDozlu8KRSZNlFblhF5Tjo5+g3fuLNUfwx9Vwr7fHXtlBDQ
         muIA==
X-Gm-Message-State: AOJu0Yxrkx+YH1miH9TcC3r72fWB7nrh3xC0WtMsZg2WlBHvvnoou7b/
	tWmhSKK0M6+IE7NV5p/NpG6OOy188RCjLuDbEcoYiq/zAxdrI0tZJ6iWQ0jvsWZ3mfCfhwd3Wa2
	zy8MIhwDuwnptgqeVv3JKwTWMzHAJCjhRv1BgrKy5tJ+d+volmnN66vzTNwMSfuda8/IpF76waC
	U9M7I=
X-Gm-Gg: AR+sD11ksG6S4W2E5En/r5aGPlHXPZlv2FDW845/7ICxxyjyqTQBbI3wpnc7F5Ydbmq
	rVKIyLYkVG2txD/30Hbqt8E+IcnxMQ/jFcXmeVi8PFmJawlDUE5ltB+XPFkaMflmBTceaU2c0Dx
	zz0ydAUAQYkS3fJptp0anp0C4sQOAbNOyQCpBKYTol4+nur485EuHwu3UBsBgri91i6T4FZdubA
	3WBncUKIudWojdNTWyA1jic3aS7PslUq+W45sQ9s2KE9GNVNSEefuCbwowr6N4b1yKeJZyI3oYt
	h21dRClUdBGolVCtWcBjmB4MYJQuQzDAyWmavchlTfpTnsLllDWYqAPfpOM3mRgEXNJAogMivzN
	3UpofY1IT
X-Received: by 2002:a05:620a:f81:b0:936:ef9d:2c74 with SMTP id af79cd13be357-93739553775mr98881785a.30.1787262145428;
        Thu, 20 Aug 2026 14:42:25 -0700 (PDT)
X-Received: by 2002:a05:620a:f81:b0:936:ef9d:2c74 with SMTP id af79cd13be357-93739553775mr98879085a.30.1787262145043;
        Thu, 20 Aug 2026 14:42:25 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b915cda6sm8426015e9.14.2026.08.20.14.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:23 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 15/21] iommu/riscv: Remap IMSIC targets during MSI composition
Date: Thu, 20 Aug 2026 23:41:44 +0200
Message-ID: <20260820214150.545737-16-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a8774c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=M3ErguzUVTgPgCfcrBsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _7p3udIdAvBwIYyqSYBc3jLd693DSN6I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX6m0B/LeM0awm
 SnUoUhj7UkX83otAYM9SDN0aqYupCYlUBhV8nTs/naJo7XooCWOUgT320l5sY3WwwhnmJnPCjWm
 ZKicr4gVJUAoOX3Z8fxJEgw55gdxvfAEJQp5uW/vha634RWzL+NXzs08gBgxwdOrOUMN60PrNCz
 hMGtJ/LNtt8teSNjNz3M1YCHkcKUL2OI/7BR2M38TX2qLtaEbizqESRLgsDiRhjx+aGcFuGznKh
 ZPs0JBgt+Wz2k3TOB2R4ah6GJbdAj+I4aYO/qbL635oUjK9Feddgy86wacKZnyNxQb7ZDP6FC46
 omC6hwIp2h/H4x6EAtMBVVF+jDvjVWQ5Fya1HZS3DOIflBcW4R08X3e2O0FZAcYdQwaoDb+4+xK
 Bw0I0UuK/DeSvR33j8/ieDXjsln7pf7wZ2vdERCNgHzGcdAutezuoyFZdinYm8XS3yjAJ2aRfpr
 Ok5PodnaEoTpe0xOcjA==
X-Proofpoint-GUID: _7p3udIdAvBwIYyqSYBc3jLd693DSN6I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXxgo7UeefTdaL
 kTgNP1RPz3iOF/0s9A1T85mdwxwqAZ6pcSulzmpUnEUFpTh76EBMkPVN0pe9ztrX9Hp1dtgo6xC
 uCoxUEdZgx8xKOu9OnYtuiWWbvnFr6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144227_019392_CEE4125F 
X-CRM114-Status: GOOD (  16.13  )
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

Translate composed IMSIC target addresses through the attached paging
domain's pre-mapped IOVA table. This keeps affinity updates on the
interrupt hierarchy while directing device MSI writes through the IOMMU.

MSI composition may run in atomic context, so publish each fully built
table with release ordering and consume it with acquire ordering under
RCU. This permits lockless lookup without exposing incomplete table
state.

When no translated table is available, retain the physical IMSIC target
for domains that do not use MSI address translation.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index f61b65f29888..dacaefa62859 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -99,7 +99,8 @@ static int riscv_iommu_ir_build_msi_iova(struct riscv_iommu_domain *domain, stru
 		}
 	}
 
-	domain->msi_iova = msi_iova;
+	/* Pair with smp_load_acquire() in riscv_iommu_ir_compose_msi_msg() */
+	smp_store_release(&domain->msi_iova, msi_iova);
 
 	return 0;
 
@@ -108,12 +109,50 @@ static int riscv_iommu_ir_build_msi_iova(struct riscv_iommu_domain *domain, stru
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
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
