Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9725BCA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 07:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Date:Cc:From:To:Message-Id:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q2drT3/w9KmAYuwO/sqzUL//scPaChUPLwO6JTv+4MM=; b=sWeDv3TQV4JinA
	VOI16yBObi/Nvn2/KAMGUCw8uJgiZwYFNz4qD6IafvsWa6xy4wGTbtqcp1SpIkP8vKmyIzmxc16Xl
	LrAUa3/va62Qcu1aMO82ZoC60TSpmJTf0UUzwH8s3DYmTwaHnT2PoNJXK3Doo4qgkUU66QlI60/UE
	ir1TrpdIeZUCzLAV14S/SvJF2NiTIsY4oGQdcEPyD/RvGj9SUox/ILCgsb9CCwBct1Vu1wNQikRmT
	9yTei46R3mqoUMk12DTTvBGATZgimYoK8gnc34pReHidjRu6AAEaHVUT0BhYvFX8Lv4rLZWnnahIv
	HAN8sHk3+uylHuxjxXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umokL-00000001j5s-2tSe;
	Fri, 15 Aug 2025 07:21:05 +0000
Received: from sg-3-20.ptr.tlmpb.com ([101.45.255.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umofT-00000001iIU-1gFJ
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 07:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1755242147;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=u3BbbksmnmXq0AbRcTT4ackl1TDUHe8HK6woHx/2uqg=;
 b=2iDbgEaCpPPcWXjSL4Pztxo8WwmrxppsUZQ6cT+rLjtehUCyfl809Q+svoxOdUDlVZRlE/
 j1sGBm/tKdkEGetddnDXLiETRACLmuAadYxK19lK4LESgSDHKS0ORMV3GXg1j5F3YWTi5k
 v55+vLqH6pHcRr481q+yN9JKhQoCfKzs7pCy2yF3U9aYTKL+iXX8i+BzleF6a9JNmVKr6I
 Ls2iB5/uQJ6l2CzldgCHd0aTBpvT+kW6hCY24OsXdt6Gq3Tqg10lumAbNDW5sEzlQeC5z+
 pOQ7yKQeHtmn6CxbuTcTkED9Z53DWdaFJvPc9wqsCpRY3Gz22nnDgPopp5lMsw==
X-Original-From: XianLiang Huang <huangxianliang@lanxincomputing.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
Message-Id: <20250815071244.13982-1-huangxianliang@lanxincomputing.com>
To: <tjeznach@rivosinc.com>
From: "XianLiang Huang" <huangxianliang@lanxincomputing.com>
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Fri, 15 Aug 2025 15:15:45 +0800
Cc: <markus.elfring@web.de>, <joro@8bytes.org>, <will@kernel.org>, 
	<robin.murphy@arm.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <iommu@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<huangxianliang@lanxincomputing.com>
Date: Fri, 15 Aug 2025 15:12:44 +0800
Subject: [PATCH v3] iommu/riscv: prevent NULL deref in iova_to_phys
X-Lms-Return-Path: <lba+2689edea1+5c77d9+lists.infradead.org+huangxianliang@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_001604_045229_3ECDA3CF 
X-CRM114-Status: UNSURE (   7.50  )
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

riscv_iommu_iova_to_phys() failed to handle NULL returns. Fix by adding NULL
check before dereferencing and returning 0 for invalid iova.

Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: XianLiang Huang <huangxianliang@lanxincomputing.com>
---
Changes
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
