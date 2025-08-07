Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E33C87FCB
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 02:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Cc:Date:Subject
	:From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xtGVWbGXD4R2dLFNYNdfYB9jntzjXL1YP/HeaVhO5mA=; b=QcaAfgS1Dodute
	RQ7PHYc1i3ZCFoVfAA6OiMk2ofvRpF64e5OL6vwOf9ik48Uf4qRNNjhgjGTj6vT344Ocwz+JoyNb2
	ssP8yU5Wqt6qkwAhHlQ02IhxyK/jpQhF+DA9PksoK2LexzQaBFruLkFdPqUzVjOaoEjNyNYmCsfo0
	AvxM7HReJflQRs8TXlyy8TZsITKEFI5gCVFJPMk1MtE4W24G7byqKfqHzjeNhsZ/8W6cnFRVa6iOU
	K15AhiJhayp1L1ObyQxjfMW+whPTvXrBrEQDNsABW9Tu9wPORiBzpe/5fPvf0ZYeccrh6hc10ArTz
	F8deeEoeB6AijKZs7Nyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujqVP-0000000H8ks-1NCl;
	Thu, 07 Aug 2025 02:37:23 +0000
Received: from sg-3-11.ptr.tlmpb.com ([101.45.255.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujqVL-0000000H8kH-1fAg
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 02:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1754534227;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=tvpUwXpgi4bbfw65gWC7ncSTc2jcTFdcUIgVdaFTeCY=;
 b=QVOUtWvJyGPJ5k4E7xighwdtybqSJQioP8gY/XWRsVuSjrvt21VZ9kcwYKrQPpY7aSPacc
 OiT6eHf813urrPL8ddkclM2zIQY11+WloarM3UdVoaKFHmzNuUaBQxMnl6nsWpKVrJ6qbE
 RT0MbGZcilSeXzzJh55xIBWjUDbrizpEyRL0Vk3X1rRppjnCs5nFZzB12W50x6WEPZOfq/
 SLmTNdazFzFqV2z6ddjZugHWzaIjgtdC6NXjjLiLyKI1ZyRZ94fvu60rgbtJnC6svVm8eq
 BD4SAHpMH8AUnRZdFPg0sxp7O6XYVcJ6FIFBbdrHK7ls20AvazAl+crsBWogjw==
To: <tjeznach@rivosinc.com>
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Thu, 07 Aug 2025 10:37:04 +0800
From: "XianLiang Huang" <huangxianliang@lanxincomputing.com>
Subject: [PATCH v2] iommu/riscv: check pte null pointer before use
Date: Thu,  7 Aug 2025 10:35:57 +0800
X-Mailer: git-send-email 2.34.1
X-Original-From: XianLiang Huang <huangxianliang@lanxincomputing.com>
Cc: <markus.elfring@web.de>, <joro@8bytes.org>, <will@kernel.org>, 
	<robin.murphy@arm.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <iommu@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<huangxianliang@lanxincomputing.com>
Message-Id: <20250807023557.6482-1-huangxianliang@lanxincomputing.com>
X-Lms-Return-Path: <lba+268941151+2e3aef+lists.infradead.org+huangxianliang@lanxincomputing.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_193720_432443_54B0B54F 
X-CRM114-Status: UNSURE (   9.37  )
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

The riscv_iommu_pte_fetch can return NULL when the provided iova is not
yet mapped, the caller should check if the returned pointer is NULL or
not, but riscv_iommu_iova_to_phys missed this, which will then lead to
a kernel panic.

Check the pointer before using it to avoid the bug. Now, when
iova_to_phys is called with an unmapped iova, the kernel will not crash
here.

Changelog
---------
v2:
- Update change description
- Add "Fixes" tag

Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: XianLiang Huang <huangxianliang@lanxincomputing.com>
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
