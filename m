Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEA1C369CB
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 03:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Date:Cc:Subject:From:To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LWaEj4KCGbEOrHnsB4KJqm9QqKtY06q9pTUFyVVkcsI=; b=4hcfnwU/RfOnMS
	2bNnxDXrj6Ag0nwJISnofLIOmGv8MoN4p2LWLIaB75S0xOAcpwzvdFXxFZpkl3qryZymnDmWKoDEQ
	2tfqVbma0YpMJ+QsdCqm95Y6vgQXekHauFpqUxHhibJlV1pFDpVdZVDnz1ewcN9nKpyXApQRFrc/g
	ERdKRAeOyGZbGcjNuTBdA9ZMp9JMOSgqz5/H6qNlXui3M8ftWm7Fjga4lgaHZ6nv1WDRRG9x3f56e
	oIINTGkUakoOsPCLE5Sx1o4x2/dR9lCneKvs76erOwMS9DPfc5WJ2j71svtnJ3e/AutubtV1Uphoz
	Dmi7ng5ZWV5P+qKHSGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bpz-00000008Cj8-3A5x;
	Tue, 29 Apr 2025 03:40:51 +0000
Received: from sg-1-21.ptr.blmpb.com ([118.26.132.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bpv-00000008CiM-1f7J
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 03:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1745898035;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=A6YL4g9UyBSUEiuqfxS3Pp0bfMg6wdBLYwsmpoZyRY8=;
 b=ytvg3pEGOjKSKgcWJRLAKzORKI0VHKJDmPiJiUs9qd/fza74ZndKaTty4N2cE8aOcBRNQS
 x7ha8KWyAid9XLVJ/fVp7fK1vaUu9yKcVr0BoUda+Cm9sCy0hMTYGNdheOFmh00rnZsOje
 aR5VeTVaiK2+lTOXBcUXtck52ZTFZV1vpJUshB7m5Ve48lTpvdRfKacf2RQBmmRonG3mFF
 VavSnxlXMZPAPTpw49d0Szm8C6Q1mI433n4h4AKqmAlucA77/HXe5Wsrk9CaCFEfl4HSLH
 ndbf7zWNodP/iuhwe2tLasLV/+9hFfgct86rl8laHVo5LJ+zczyDQKoY0rGjVA==
Message-Id: <20250429034007.578-1-xiangwencheng@lanxincomputing.com>
X-Lms-Return-Path: <lba+268104a31+2129f5+lists.infradead.org+xiangwencheng@lanxincomputing.com>
Received: from localhost.localdomain ([222.128.9.250]) by smtp.feishu.cn with ESMTP; Tue, 29 Apr 2025 11:40:32 +0800
To: <tjeznach@rivosinc.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Subject: [PATCH] iommu/riscv: fix use after free of riscv_iommu_domain
X-Mailer: git-send-email 2.46.2.windows.1
Cc: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>, 
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <iommu@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<xiangwencheng@lanxincomputing.com>
Date: Tue, 29 Apr 2025 11:40:07 +0800
Mime-Version: 1.0
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204048_603801_56B25C22 
X-CRM114-Status: GOOD (  11.48  )
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

The function vfio_group_detach_container begins by calling
vfio_iommu_type1_detach_group, which may subsequently calls
riscv_iommu_free_paging_domain to release the riscv_iommu_domain.
Then, iommu_group_release_dma_owner is triggered, which results in
the execution of riscv_iommu_attach_paging_domain and
riscv_iommu_bond_unlink(info->domain). However, the info->domain
had been freed beforehand but was not set to NULL, leading to errors.

This commit resolves the issue by setting info->domain to NULL within
riscv_iommu_bond_unlink, a function that is called by
riscv_iommu_attach_blocking_domain before the domain was freed.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 drivers/iommu/riscv/iommu.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index bb57092ca901..f9e127978ac7 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -880,6 +880,7 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_bond *bond, *found = NULL;
 	struct riscv_iommu_command cmd;
+	struct riscv_iommu_info *info;
 	int count = 0;
 
 	if (!domain)
@@ -894,8 +895,11 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 		else if (dev_to_iommu(bond->dev) == iommu)
 			count++;
 	}
-	if (found)
+	if (found) {
+		info = dev_iommu_priv_get(dev);
+		info->domain = NULL;
 		list_del_rcu(&found->list);
+	}
 	spin_unlock(&domain->lock);
 	kfree_rcu(found, rcu);
 
@@ -1293,8 +1297,16 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	const unsigned long pfn = virt_to_pfn(domain->pgd_root);
+	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_info *info;
 
 	WARN_ON(!list_empty(&domain->bonds));
+	spin_lock(&domain->lock);
+	list_for_each_entry(bond, &domain->bonds, list) {
+		info = dev_iommu_priv_get(bond->dev);
+		info->domain = NULL;
+	}
+	spin_unlock(&domain->lock);
 
 	if ((int)domain->pscid > 0)
 		ida_free(&riscv_iommu_pscids, domain->pscid);
-- 
2.46.2.windows.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
