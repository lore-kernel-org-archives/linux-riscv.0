Return-Path: <SRS0=lGgd=WN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7612DC3A59B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 07:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 457EA2086C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 07:50:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXvIHXer"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 457EA2086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9LOhoqN/FZNHWy00Pyn8CSBiEEl3j9LL13bFAnHGmw=; b=jXvIHXerYD/bhH
	TZSOYnJ2ZMsQmlJUqcn1qSoCw4cs5nnCUa73FLVDFK7K3JtnCfDyrQ0Pfeh/yjXQD0+yrPPN80ngV
	VkaHYrnV6NmS/9jRJM+l/p+mZwkjNsb32b7g5sRq0kGabi9IJKxvZb521mp0uJ4ewCGEHeMkdnauD
	ceSfbJPEJ71eiVDP70QgJAsDd7fSJASnL3nw5TxkMecB8tjMeuK5qO77yWeOO7QIawYVhDZnWLW6G
	NefBDhdp0d4WFC9XkDVWrb7FpB+eIEZknZr252KOkizF0f6lqMK+Yhb9GWoymyXIjQTHwNZjusK4V
	fSB1xOvTQoeQJ6KjE83Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hytTb-0007ZF-S1; Sat, 17 Aug 2019 07:50:16 +0000
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytRw-0004oo-JJ; Sat, 17 Aug 2019 07:48:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 08/26] m68k: simplify ioremap_nocache
Date: Sat, 17 Aug 2019 09:32:35 +0200
Message-Id: <20190817073253.27819-9-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Just define ioremap_nocache to ioremap instead of duplicating the
inline.  Also defined ioremap_uc in terms of ioremap instead of
the using a double indirection.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/include/asm/kmap.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/kmap.h b/arch/m68k/include/asm/kmap.h
index 03d904fe6087..421b6c9c769d 100644
--- a/arch/m68k/include/asm/kmap.h
+++ b/arch/m68k/include/asm/kmap.h
@@ -28,14 +28,8 @@ static inline void __iomem *ioremap(unsigned long physaddr, unsigned long size)
 	return __ioremap(physaddr, size, IOMAP_NOCACHE_SER);
 }
 
-#define ioremap_nocache ioremap_nocache
-static inline void __iomem *ioremap_nocache(unsigned long physaddr,
-					    unsigned long size)
-{
-	return __ioremap(physaddr, size, IOMAP_NOCACHE_SER);
-}
-
-#define ioremap_uc ioremap_nocache
+#define ioremap_nocache ioremap
+#define ioremap_uc ioremap
 #define ioremap_wt ioremap_wt
 static inline void __iomem *ioremap_wt(unsigned long physaddr,
 				       unsigned long size)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
