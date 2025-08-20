Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F97CCA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:To:Mime-Version:Subject:
	Message-Id:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=roPzyoX/+oiCCIKC8TAes+mBilkaTpJe3nJuQW4ctFQ=; b=GMh7T4c+1MJQvs
	VpHxbvMUEZrqYSobLUycd2KGYlHUUMriZBLi9fqY88xojCF77RhmYPqMjdYNFM5CRoiFRJy9PCohk
	mNVFvZD33McDQk9Cv3KpsMgk3skIFv2q7lr3FlMn509L+Wn5pTGzj67mpUYz5Rop22Vjx6VlCqAFs
	tRtCbuJNs3MyyxujNxr/h215CThw9/bnGRWW95Nzkw47sXdXcUbcRzgd+2fQCRqtGrYTdCIIVX8w2
	cR8q+2yhz6HUX+tp8QSQzO6E3zrdgLUtm48WAOEBrXJ6slmaJVkYQJA0qnVcmNzNA62LRbk+P2b12
	l9fUjiETz1IpUeKutUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodOR-0000000CcTw-1gjo;
	Wed, 20 Aug 2025 07:37:59 +0000
Received: from sg-3-13.ptr.tlmpb.com ([101.45.255.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodA7-0000000Cb7Y-0K5T
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 07:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1755674578;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=kZxmK5a1KAqXLehUVFYamep8ylDTy8+Ik5zqiesTQDU=;
 b=IgYdjih8GFgXd6SQ7J2LREnUtlpk4CyEinPz89A6jfxoWT7MLKIPG5kLzwpvrZKgIWjkXZ
 XNr0/Cb4kMsDAP0Und0ltZhp36ebGxNWEiir+IMvZEFMbBEVLYiubafr7/5q6dM4e3sTH0
 EsTdik+gW3KTIQR9t2alMhzkTTudM8YybE52d0P0XCJ5dJaGLKrYa/gIBXDt45Tu19RcTT
 iOVISBM75NAR/PHSeJJ4ab0h7/ehCdA6EydL6My+SYGd0GjDIwQJw5xtkPTeMiwInJIrX0
 Ms/ogbfZTd07l67plJsZGscyYYAWgVkLlGr5SWolMyhTq91SCGSrPcUkkVGoww==
Cc: <markus.elfring@web.de>, <joro@8bytes.org>, <will@kernel.org>, 
	<robin.murphy@arm.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <iommu@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<huangxianliang@lanxincomputing.com>
Message-Id: <20250820072248.312-1-huangxianliang@lanxincomputing.com>
Subject: [PATCH v4] iommu/riscv: prevent NULL deref in iova_to_phys
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
To: <tjeznach@rivosinc.com>
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Wed, 20 Aug 2025 15:22:55 +0800
From: "XianLiang Huang" <huangxianliang@lanxincomputing.com>
Date: Wed, 20 Aug 2025 15:22:48 +0800
X-Lms-Return-Path: <lba+268a577d0+54257f+lists.infradead.org+huangxianliang@lanxincomputing.com>
X-Original-From: XianLiang Huang <huangxianliang@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_002311_511388_D3936E25 
X-CRM114-Status: UNSURE (   7.48  )
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

The riscv_iommu_pte_fetch() function returns either NULL for
unmapped/never-mapped iova, or a valid leaf pte pointer that requires no
further validation.

riscv_iommu_iova_to_phys() failed to handle NULL returns. Prevent null pointer
dereference in riscv_iommu_iova_to_phys(), and remove the pte validation.

Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: XianLiang Huang <huangxianliang@lanxincomputing.com>
---
Changes
v4:
- Change the summary as Markus recommends

v3:
- Remove redundant pte validation in riscv_iommu_iova_to_phys
- Improve subject line to emphasize prevention

v2:
- Refine problem description
- Add "Fixes" tag
---
 drivers/iommu/riscv/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 2d0d31ba2886..0eae2f4bdc5e 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1283,7 +1283,7 @@ static phys_addr_t riscv_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 	unsigned long *ptr;
 
 	ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
-	if (_io_pte_none(*ptr) || !_io_pte_present(*ptr))
+	if (!ptr)
 		return 0;
 
 	return pfn_to_phys(__page_val_to_pfn(*ptr)) | (iova & (pte_size - 1));
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
