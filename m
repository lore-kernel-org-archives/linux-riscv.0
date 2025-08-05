Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FF7C87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:From:Mime-Version:Date:
	Subject:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RFsxyRCPV6edm857C4ELBLOJfhQLLq/y/ZkDyeLDxgs=; b=KrmIaOEiAs70qy
	wHvzyM4F+nRu1hREyDGsg6HbtFJuJET1yccG41CibHQ1bBRZHz+r6Lub9dvtLC6A7VHWXqgNGu/Wo
	xsOfxW2Q1Bc6g3e6hWvNHq3+X4IJUCu1fvDmPPJS92cWNPVG8t8Nk9nIEePwboBy3q5muhZ6nggUP
	wHt9lFZ3W80zMt7IWKUBe8q9ve6VPBiCM6DLrJ4y2zpuGVoUyvlSFiYAH5VUfclGJrHtug2UjnR/7
	CL9zRcobeGaj+uz0xwFp1JI3ewliAY3RhQPeUREjEXexUdR3RHRBB3xH0hiLLrMI5DqPJuCgJdxgv
	HkIoOGUY2Y6sIBv/Z2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujF3x-0000000CVZG-3vEw;
	Tue, 05 Aug 2025 10:38:33 +0000
Received: from sg-1-36.ptr.blmpb.com ([118.26.132.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEk8-0000000CT4D-3f4v
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 10:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1754389072;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=EWKh/6dZIglI4fJ1iIweOgozO4ucjLIZAOOQ2PsOGzc=;
 b=eOlhwhHoPO5IBQyQIFRLTkXvGQ8+90am7CYZ4hRhF4gb+JMOZiKFAXZd9bg8Yj0jWvm5xm
 dQh8TT2HIDJaAQhCDDM9O/NDajYGAaGelIOHr3dOEtvh65zx3NUROsivz/KWZZ3srKQIrc
 X9OitQ4KVBUbLzu+zQMGNQl58kv8mvwVPjToDam1oOxs1JS+Rje1VNuMWh9fVFT5tmq8tg
 8I4QPMTEiVe3kDelIb1V/Jyxaa6PaUz0q1aubsQ+ATOkQxaMhBYRskBenoPHJmBVgpdRYW
 6niNcqsoUT55E7wx9DBh7pJThYWYbUqMyaICA/PHQ/FOf6AvrBTVOMmtbUQshQ==
To: <tjeznach@rivosinc.com>
Cc: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>, 
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <iommu@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<huangxianliang@lanxincomputing.com>
Subject: [PATCH] iommu/riscv: check pte null pointer before use
Date: Tue,  5 Aug 2025 18:17:41 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
X-Lms-Return-Path: <lba+26891da4e+14045f+lists.infradead.org+huangxianliang@lanxincomputing.com>
From: "Huang XianLiang" <huangxianliang@lanxincomputing.com>
Message-Id: <20250805101741.30819-1-huangxianliang@lanxincomputing.com>
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Tue, 05 Aug 2025 18:17:49 +0800
X-Original-From: Huang XianLiang <huangxianliang@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_031805_744300_67DD330D 
X-CRM114-Status: GOOD (  10.38  )
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

The riscv_iommu_pte_fetch can return NULL when the provided iova is not
yet mapped, the caller should check if the returned pointer is NULL or
not, but riscv_iommu_iova_to_phys missed this, which will then lead to
a kernel panic.

This commit just check the pointer before using it to avoid the bug.
Now, when iova_to_phys is called with an unmapped iova, the kernel will
not crash here.

Signed-off-by: Huang XianLiang <huangxianliang@lanxincomputing.com>
---
 drivers/iommu/riscv/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 2d0d31ba2886..b0186faa0300 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1283,7 +1283,7 @@ static phys_addr_t riscv_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 	unsigned long *ptr;
 
 	ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
-	if (_io_pte_none(*ptr) || !_io_pte_present(*ptr))
+	if (!ptr || _io_pte_none(*ptr) || !_io_pte_present(*ptr))
 		return 0;
 
 	return pfn_to_phys(__page_val_to_pfn(*ptr)) | (iova & (pte_size - 1));
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
