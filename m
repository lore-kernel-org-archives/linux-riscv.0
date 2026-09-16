Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66CBC88E77
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Date:Message-Id:From:Cc:
	Mime-Version:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=q7h9pBNEggHGvxo4eIM3wIrxw9rytWm4k1zCq0MyZvI=; b=Ewc
	4ehzJhNVOty/4mM1RooXM050DJ4y70dSayX/gGuLeD6akvZ+fMW9y2HPcB1PKiu6DSNH5fyDnHFZr
	vySmkoyV3yRR59WGjJ/rVJkcogzTYnOQQipuFZsswBBhYhlaxCCiRarxaPAe3krRm9Uvzdw2suQU7
	mMwgFl9QlDO5x9dSKkpCIE74OGXDxTSfSqsEI5Dn5yrS41gEqxG3gcx+wXY8lYQIY70Lv1XNyzuRu
	aJuZV/rOPhBQ0orlYceyZw77gXIYeeu4dudWEytz8RribnjLxPeurkYyNkhHEpk6zMsTbN4BTRLaX
	QFFWtksTKdt+/lwvWY6pD8hoVyq2iOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nnb-000000094rb-3pEI;
	Wed, 16 Sep 2026 11:27:35 +0000
Received: from va-2-56.ptr.blmpb.com ([209.127.231.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nnY-000000094qy-3Idp
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 11:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1789558043;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=5oXZlKLbyfic0rzx6a7/Yewkbeu2GdtKNRT5PP9pZY8=;
 b=MEyxarDwrIfJi/4/gg2GaFdPsuap3xFVYmHUNCovj/ACzXTg1WV8bJHeppdHibbSLrqLGQ
 zSwb1ZYKs0PMPwAaZj8z7K7HU8HurWI373/Gw4svSIrYibP/u9wQNYvyhmCxQwGy0OJ0G2
 znA/8+daMIU82E8LRCE7rSIGSOXVFcvsb9geuXvPEW4bt1/+KTM/ZSd3C/j3gNDOROhk/8
 Re7oBl/mCiNTsh5jS7OXKlPUPbDPo9KB/Y/E1BhTv4i6RYTkJh0lVelHKXKIjxYH0XlKMc
 Icny+Ze+AuOQVzgLm5Ot5YL3Q0KwNxwXFS6GXn0SKgwo55YedGYU/WvONiVJXg==
To: <sunilvl@ventanamicro.com>
Mime-Version: 1.0
Received: from lanxin-ThinkBook-16-G5-IRH ([123.120.5.129]) by smtp.feishu.cn with ESMTP; Wed, 16 Sep 2026 19:27:20 +0800
X-Mailer: git-send-email 2.53.0
Cc: <rafael@kernel.org>, <lenb@kernel.org>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<linux-acpi@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, 
	<tjeznach@rivosinc.com>, <luxu.kernel@bytedance.com>, 
	<guoren@linux.alibaba.com>, <jgg@nvidia.com>, 
	<xiangwencheng@lanxincomputing.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Message-Id: <20260916112545.887461-1-xiangwencheng@lanxincomputing.com>
Date: Wed, 16 Sep 2026 19:25:45 +0800
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
Subject: [PATCH] riscv: iommu: ask for ACS to be enabled
X-Lms-Return-Path: <lba+26aaa7d19+7955ef+lists.infradead.org+xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_042732_928476_53AC7EDE 
X-CRM114-Status: UNSURE (   4.43  )
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

Make sure ACS will be enabled during PCI probe

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 drivers/acpi/riscv/rimt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
index e4538fa6c2c8..30d2d0211d5e 100644
--- a/drivers/acpi/riscv/rimt.c
+++ b/drivers/acpi/riscv/rimt.c
@@ -525,4 +525,5 @@ void __init riscv_acpi_rimt_init(void)
 
 		return;
 	}
+	pci_request_acs();
 }
-- 
2.53.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
