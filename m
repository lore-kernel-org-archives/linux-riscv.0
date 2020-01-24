Return-Path: <SRS0=QlD5=3N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD88C35242
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2020 16:18:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 115732075D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2020 16:18:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mjh+NJND"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 115732075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HhTvoNAHvBAvabxOMsrQkvdpfs0pDdiQIiOzybyR/ls=; b=mjh+NJND5iZcG5YWMY5HkG6SnB
	PSQ5i6aSjCUYKn0Hjl+XT80pLgY/UcuCH73CBUuioyffM52xjVQFbxri6d976dCJt0aEsLu8eMTu9
	P75bwXc1ejVBRU+zTZSLKxTzv6qgCOECYAwURQDLdzSxAq5mL7jIgnA8p4TG6/F62zDEiT6saklQO
	cMlEHVvp9Qbk5OTAyYqjr3v3V5F9wF0S++8rIPlS7mm63jeYOrUry6EhBWgTWM/ZOPQaTXW40T9En
	PzUixGIpohSnGBhy1zi+I6fLwPnqxlpaKjiZp44WJFnE/CGGVNltOpqHTu48F/hNFKwEV+eZ9FEx8
	6XRKK7Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv1fB-0005jt-Te; Fri, 24 Jan 2020 16:18:29 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv1f9-0005io-7t
 for linux-riscv@lists.infradead.org; Fri, 24 Jan 2020 16:18:28 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R231e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04455; MF=guoren@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0ToSJxNn_1579882700; 
Received: from localhost(mailfrom:guoren@linux.alibaba.com
 fp:SMTPD_---0ToSJxNn_1579882700) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 25 Jan 2020 00:18:20 +0800
From: Guo Ren <guoren@linux.alibaba.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Use flush_icache_mm for flush_icache_user_range
Date: Sat, 25 Jan 2020 00:18:10 +0800
Message-Id: <20200124161810.24322-1-guoren@linux.alibaba.com>
X-Mailer: git-send-email 2.17.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_081827_460034_ECB70322 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The only call path is:

__access_remote_vm -> copy_to_user_page -> flush_icache_user_range

Seems it's ok to use flush_icache_mm instead of flush_icache_all and
it could reduce flush_icache_all called on other harts.

I think the patch is the fixup for the commit 08f051eda33b.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Andrew Waterman <andrew@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/include/asm/cacheflush.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index b69aecbb36d3..26589623fd57 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -85,7 +85,7 @@ static inline void flush_dcache_page(struct page *page)
  * so instead we just flush the whole thing.
  */
 #define flush_icache_range(start, end) flush_icache_all()
-#define flush_icache_user_range(vma, pg, addr, len) flush_icache_all()
+#define flush_icache_user_range(vma, pg, addr, len) flush_icache_mm(vma->vm_mm, 0)
 
 void dma_wbinv_range(unsigned long start, unsigned long end);
 void dma_wb_range(unsigned long start, unsigned long end);
-- 
2.17.0


