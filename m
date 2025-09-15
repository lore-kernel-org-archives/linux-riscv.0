Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64A6CAC587
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 02:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ps9nRVFQWPZ/2LIl1FbdlFJ5u8fn1aVGX9Rj+9WkQAo=; b=Vp+Vw5vhvROTmi
	MpABpXq6Sk6KJsCraLtENGmiwfsf6q52MyK9KRgPrNqkchGzMCRbZ0i3r+07jaVkbQp1hV+0gWA4D
	f1a/dEbY5JQYImV5MTxE+z7lteB4mgTjdtb7+DWIVmTW05BbOL6jUGwidVIbHodUQ22zfQD0qJghW
	ycjB9JuokTXcjV3E44A01TlZ59rGQgNXy6PTrxR59BUzntdeAJhx5Y68/v83UobiehMSUg1lm24CY
	D2FTOMzN2AthuovZyBrHEzT/gMpnjzBM8zHBUL+T7phVqX9PIffgzZTyVjV/t21S8lRdbX3a1ECn5
	BucXucR5qEnxSDu85A6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxz9w-00000002aZi-0b9Z;
	Mon, 15 Sep 2025 02:41:40 +0000
Received: from out28-145.mail.aliyun.com ([115.124.28.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxz9s-00000002aZE-1cQr
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 02:41:38 +0000
Received: from LAPTOP-2KT3QRS7.localdomain(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.ef5REmy_1757904086 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 15 Sep 2025 10:41:30 +0800
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
	zong.li@sifive.com,
	baolu.lu@linux.intel.com,
	Yaxing Guo <guoyaxing@bosc.ac.cn>
Subject: [PATCH v2] iommu/riscv: Fix irq failure due to idx mismatch in icvec
Date: Mon, 15 Sep 2025 10:40:42 +0800
Message-Id: <20250915024042.4558-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_194136_566201_26011D9C 
X-CRM114-Status: UNSURE (   7.25  )
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

Fixes: 856c0cfe5c5f ("iommu/riscv: Command and fault queue support")
Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
---
Changes in v2:
  - Move the "FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 2 % iommu->irqs_count)"
    above of "FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 3 % iommu->irqs_count)"
  - Add the Fixes tag.

 drivers/iommu/riscv/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 0eae2f4bdc5e..103c2fcd4837 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1584,8 +1584,8 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 		return -EINVAL;
 
 	iommu->icvec = FIELD_PREP(RISCV_IOMMU_ICVEC_FIV, 1 % iommu->irqs_count) |
-		       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 2 % iommu->irqs_count) |
-		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3 % iommu->irqs_count);
+		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 2 % iommu->irqs_count) |
+		       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 3 % iommu->irqs_count);
 	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_ICVEC, iommu->icvec);
 	iommu->icvec = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_ICVEC);
 	if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
