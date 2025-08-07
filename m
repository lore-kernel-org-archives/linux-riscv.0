Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553F7C87FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 03:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:Message-Id:From:Date:
	Mime-Version:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BQxZTHGWzNPzY125YINLN5cM3Owg1j3ZSiZxHNmGLPk=; b=RKY
	Hml6B02rH/nRts1d3t8g/FC6olcBsgNiKql5kXQ1pfIScVOfk936uugQXuSYlVHklzzDNdn7J3fz8
	NyBmwDv/M2fMjJJInhlKx9ZlK1sdGKAsgkFc9GHe3Xk5gr0Pc02QqCyBr1RFlEKKR1xKYsOuL5Rx5
	eD/JTW/iGeJRvud9aPqmLtwBp+WUdb6WKDnu3uellACXftmTBssIkzCW7uy4Gl0RYebOOJaAwFygv
	c0QfrcgrBYXktuSqpKvrPXcFhLCpWVqv9gFdBGhwsXiclshbwjj+witNmIbueUJE8Q9CLeHW6dT6L
	C0/ZX/CDALbSdhhCefoWgdnUgjD6voA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujrNS-0000000HDDo-3901;
	Thu, 07 Aug 2025 03:33:14 +0000
Received: from sg-1-21.ptr.blmpb.com ([118.26.132.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujrNP-0000000HDDH-2TXV
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 03:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1754537583;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=xiMJCuJpfu6nMJUxvjNUYm7BQ48UmD6tw9atHX3Jh5o=;
 b=xOr2sX/L49NQuZgliY/hmBvgx78stHE0DNsz0zQHrIgBKfnvxmFbI96XjvQqIWIZhpZfWp
 ihvtsiyXBFf+kR30lTSOocqiTrMNMZ7EWflIfNRiplRiHW++KWVn8bzKCecKAVqCcCo+sh
 uQJibh92yw9NSaL0F7JsY6Yc3C9ZY/FX/GQBz3ugLTufAPCJYuXakKNNSE8y1zyQdiN94Z
 nBuOt8vOpF+ovNOOCLNtGSEbNxE44DRfv6VPqS/l+ZE7cnN9jafJmKxI97YIe0mlgC/TFv
 QgQE7550pp9yvEm2Nprost4hgTYFPgYZZU+Or7BNQe8ssaEvg40S+tt7Hq+ZVg==
To: <tjeznach@rivosinc.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Thu, 07 Aug 2025 11:33:01 +0800
X-Lms-Return-Path: <lba+268941e6d+8affc6+lists.infradead.org+huangxianliang@lanxincomputing.com>
Date: Thu,  7 Aug 2025 11:32:52 +0800
From: "XianLiang Huang" <huangxianliang@lanxincomputing.com>
Message-Id: <20250807033252.1613-1-huangxianliang@lanxincomputing.com>
X-Original-From: XianLiang Huang <huangxianliang@lanxincomputing.com>
Cc: <markus.elfring@web.de>, <joro@8bytes.org>, <will@kernel.org>, 
	<robin.murphy@arm.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <iommu@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<huangxianliang@lanxincomputing.com>
Subject: [PATCH v2 RESEND] iommu/riscv: check pte null pointer before use
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_203311_821800_53E7F177 
X-CRM114-Status: UNSURE (   9.22  )
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

Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: XianLiang Huang <huangxianliang@lanxincomputing.com>
---
Changelog
v2:
- Update change description
- Add "Fixes" tag

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
