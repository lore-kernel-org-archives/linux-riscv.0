Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07E9C3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70CE6233A1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="giN0gHxN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70CE6233A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJP6eYq4nHvzWBCJoIlvkU2WBQ4uYy4g0icnmcJlpiI=; b=giN0gHxNzYyMcp
	Kl1q5aBmq9zUPDhGADQUhbTPxvHUF/ZYTEonMqY1O/N5kDpXt7dRFgVGqFFqehnU6pt2js6v4BZiW
	dD52zL3JB/xbsJ1Lf92teBJ1vCkqNa9P/kVszhRANOmHRXXSbJJU/k0adW6TGvqVZL1w1AoML/7TK
	YZCmaCqoyRqWzHesK5/9qWypW9pqAA9iab6VZC+UMCoa3O5HcqOhPHZkyImurXi0lTfh0Z9d/aS3D
	QpsdEaseJS2aCr0ksJLHuUcGtiKuSKvWr1YxElItU1mr1mYkcFG8uLbxiBL4EjB1K05gP2nRPRii3
	hFj6QD0hi5lIE3MsIbWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0h1D-0008Kz-W3; Thu, 22 Aug 2019 06:56:24 +0000
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0h1A-0008Hm-Nl; Thu, 22 Aug 2019 06:56:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 2/8] riscv: remove SYS_RISCV_FLUSH_ICACHE_LOCAL #define
Date: Thu, 22 Aug 2019 15:56:06 +0900
Message-Id: <20190822065612.28634-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822065612.28634-1-hch@lst.de>
References: <20190822065612.28634-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

It is much better to just check for the supporte flags directly rather than
hiding them behind a flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/cacheflush.h | 1 -
 arch/riscv/kernel/sys_riscv.c       | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 555b20b11dc3..c8f159740c38 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -103,6 +103,5 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
  * Bits in sys_riscv_flush_icache()'s flags argument.
  */
 #define SYS_RISCV_FLUSH_ICACHE_LOCAL 1UL
-#define SYS_RISCV_FLUSH_ICACHE_ALL   (SYS_RISCV_FLUSH_ICACHE_LOCAL)
 
 #endif /* _ASM_RISCV_CACHEFLUSH_H */
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 61f100acbd4c..5bad71078b61 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -58,7 +58,7 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
 		unsigned long, flags)
 {
 	/* Check the reserved flags. */
-	if (unlikely(flags & ~SYS_RISCV_FLUSH_ICACHE_ALL))
+	if (unlikely(flags & ~SYS_RISCV_FLUSH_ICACHE_LOCAL))
 		return -EINVAL;
 
 	flush_icache_mm(current->mm, flags & SYS_RISCV_FLUSH_ICACHE_LOCAL);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
