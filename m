Return-Path: <SRS0=e4j4=YK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EB9ECE597
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2019 17:37:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9538E20820
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2019 17:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DBPbAlfT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9538E20820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Kbilm14DEbvrwMhsQWM2J6qSaVFSfIQm4yJb9V4jhI=; b=DBPbAlfTCeohfU
	xFuHmjzK3EEbELSm0caKSNQKm1LjdFY+fn+oEDapqKZyjtVoPz3nso5J7LMiMF++FjOOoUzwnQQWZ
	6KYcDwnZuzqLh9odlcsf5VtXh8aoiTD5MIHvCStNSdbI9qg/+sWLsyreL87+au8z75Hi95Xsi9VKd
	EZI3DDauIBBRyh7GdXwTs3WBNjv1W76mylcW+nST87U+WsgG9Br4rciTl9P3SXimgQ+Ng8+/jMU3j
	XFhNZ+QBtC3jLIKDR3NkHLFCDhNsaA2s1kPEUSNZJUZNPW00Ef9e27g4OprfgciqvXguFAx+29yB0
	8Llclr964hLeGeO+LRMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL9if-0007Gv-3z; Thu, 17 Oct 2019 17:37:49 +0000
Received: from [2001:4bb8:18c:d7b:c70:4a89:bc61:3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL9ie-0007FU-3C; Thu, 17 Oct 2019 17:37:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 01/15] riscv: cleanup <asm/bug.h>
Date: Thu, 17 Oct 2019 19:37:29 +0200
Message-Id: <20191017173743.5430-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017173743.5430-1-hch@lst.de>
References: <20191017173743.5430-1-hch@lst.de>
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Remove various not required ifdefs and externs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/bug.h | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 07ceee8b1747..75604fec1b1b 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -12,7 +12,6 @@
 
 #include <asm/asm.h>
 
-#ifdef CONFIG_GENERIC_BUG
 #define __INSN_LENGTH_MASK  _UL(0x3)
 #define __INSN_LENGTH_32    _UL(0x3)
 #define __COMPRESSED_INSN_MASK	_UL(0xffff)
@@ -20,7 +19,6 @@
 #define __BUG_INSN_32	_UL(0x00100073) /* ebreak */
 #define __BUG_INSN_16	_UL(0x9002) /* c.ebreak */
 
-#ifndef __ASSEMBLY__
 typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
@@ -43,6 +41,7 @@ typedef u32 bug_insn_t;
 	RISCV_SHORT " %2"
 #endif
 
+#ifdef CONFIG_GENERIC_BUG
 #define __BUG_FLAGS(flags)					\
 do {								\
 	__asm__ __volatile__ (					\
@@ -58,14 +57,10 @@ do {								\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
-
-#endif /* !__ASSEMBLY__ */
 #else /* CONFIG_GENERIC_BUG */
-#ifndef __ASSEMBLY__
 #define __BUG_FLAGS(flags) do {					\
 	__asm__ __volatile__ ("ebreak\n");			\
 } while (0)
-#endif /* !__ASSEMBLY__ */
 #endif /* CONFIG_GENERIC_BUG */
 
 #define BUG() do {						\
@@ -79,15 +74,10 @@ do {								\
 
 #include <asm-generic/bug.h>
 
-#ifndef __ASSEMBLY__
-
 struct pt_regs;
 struct task_struct;
 
-extern void die(struct pt_regs *regs, const char *str);
-extern void do_trap(struct pt_regs *regs, int signo, int code,
-	unsigned long addr);
-
-#endif /* !__ASSEMBLY__ */
+void die(struct pt_regs *regs, const char *str);
+void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr);
 
 #endif /* _ASM_RISCV_BUG_H */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
