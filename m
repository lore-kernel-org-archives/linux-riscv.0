Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99610CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=faNPE6e+MxIIInq/W6+M0f7kWrT7MhoIpfM1gFSOOkQ=; b=CfE0iYhUxpvBn6
	olq/P2u2yuneRNJ4IDhww4A9wuZief6Yv05T2MolDzKd6ZCEZ/w6oyDZuQA9GPuxZQnvaAna8mAIV
	/uEExNLmMcJi3OMcd7vybYfEQavc+qf0G+AIfsz/3XjSo7/Wz6FlqLLeETG/wOJoVfftlZBaDUxpf
	HQHJjUQefVjdQUq7WpqJ1pUsfuEshETjxWolESu0b7T+/+jfCo77pJQoxJr4nu0Y8Pj1s5gVo6tZ3
	wTfE5NaH0fONc0uXzPXHwngEve0CgScYtwzgfSnwTbmYbr0DFljrmrHiNcKWE/nKJBcU+fdxe6XtJ
	hWuSilmCmHv8MHfsU2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHXO-0000000DNHo-3ilR;
	Wed, 10 Sep 2025 09:54:50 +0000
Received: from out28-93.mail.aliyun.com ([115.124.28.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHXK-0000000DNCt-3cpP
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 09:54:49 +0000
Received: from LAPTOP-2KT3QRS7.localdomain(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.ebuVOdW_1757498072 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 10 Sep 2025 17:54:38 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: linux-riscv@lists.infradead.org
Cc: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Yaxing Guo <guoyaxing@bosc.ac.cn>
Subject: [PATCH v1] riscv: iommu: Fix irq failure due to idx mismatch in icvec
Date: Wed, 10 Sep 2025 17:54:30 +0800
Message-Id: <20250910095430.93868-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_025447_069247_5A501228 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

In icvec, the idx of civ, fiv, pmiv and piv are 0, 1, 2, 3
(According to spec 5.27). And usually, the interrupt-names
property in dts riscv-iommu node also follows this (In qemu
virt machine follows this) which will cause hardware irq
number errors (Especially when using qemu virt machine to
start Linux).

By the way, should use interfaces such as platform_get_irq_byname
to implement it further?

Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
---
 drivers/iommu/riscv/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 52d5e3d76019..00f11368bf24 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1583,8 +1583,8 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 		return -EINVAL;
 
 	iommu->icvec = FIELD_PREP(RISCV_IOMMU_ICVEC_FIV, 1 % iommu->irqs_count) |
-		       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 2 % iommu->irqs_count) |
-		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3 % iommu->irqs_count);
+		       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 3 % iommu->irqs_count) |
+		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 2 % iommu->irqs_count);
 	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_ICVEC, iommu->icvec);
 	iommu->icvec = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_ICVEC);
 	if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
