Return-Path: <SRS0=LZsr=65=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C071C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 May 2020 14:38:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3032075F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 May 2020 14:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MTtpkThA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3032075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvlDCJ52IZIXq0+H620wKd1v1G0M5nfx6BSZiQRK5ug=; b=MTtpkThAhj+lDM
	y0+KSW4z3MSq/FPGJiFWlC9982F6inQhywFLLSpHFxolQMB9vVQeNwrdqQ+yYBZJdu7/cbr0zgGx/
	3F8wOzaloe4UAOEdK4K1IXuZfMpcSNh9KocklAoORHpCaWZafwBRmluLR2425C9NE2YDDJDTbZQi7
	OKTjQdD8K/4tboAQSqQO7oBJJRwE3vdedjWnzstdSUWBYHavQ20jeavptrDIP6Sp/hXVoRdUEFLsJ
	SxHl0++RBFRDJ8Zn3wSexTFGgZO4KSA4qwpBM+gvqjQpxr/OjTzLmxxXCcDTHHJzjehA76cbRweE2
	Ooymf6GJnCLlfnKAzdnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZbTk-0005dk-OA; Fri, 15 May 2020 14:38:24 +0000
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSI-0003nx-7L; Fri, 15 May 2020 14:36:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 02/29] nds32: unexport flush_icache_page
Date: Fri, 15 May 2020 16:36:19 +0200
Message-Id: <20200515143646.3857579-3-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

flush_icache_page is only used by mm/memory.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/nds32/mm/cacheflush.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/nds32/mm/cacheflush.c b/arch/nds32/mm/cacheflush.c
index 254703653b6f5..8f168b33065fa 100644
--- a/arch/nds32/mm/cacheflush.c
+++ b/arch/nds32/mm/cacheflush.c
@@ -35,7 +35,6 @@ void flush_icache_page(struct vm_area_struct *vma, struct page *page)
 	kunmap_atomic((void *)kaddr);
 	local_irq_restore(flags);
 }
-EXPORT_SYMBOL(flush_icache_page);
 
 void flush_icache_user_range(struct vm_area_struct *vma, struct page *page,
 	                     unsigned long addr, int len)
-- 
2.26.2


