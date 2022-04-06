Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E78C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tATJjCkvClENtmR4h7369LtNurvC4CQemobRPQ/4WKo=; b=3Qi5/iUcR+T4oi
	yw4SccdSLoETl5fnmyDlfuXGKxKakEB2FktYuqUOPOsaP14WmOkyo322Yb/PxYuZ3FR7YPdNnR8Tp
	ZvBwQTWsqaTFuFuD9GwsQy3sE1MH+znV3+G7IItYm+Idu/Y5bXLVobB3s4UuKJHLhfZvpwYhbSWCS
	BF98OleaTNlP0r+6bMzH32lLGILo5jHyiF7HxESBPMFOEntrWrpbNDdgyqgbz+BZ3zdJh8vYHuFVK
	yF+Albt7I644p6oqGOAs0qdouWVkRmsqt1yEasDi9Gr/VVy927MzDjhrqo9fiO+Q7C/5ERjSQwe7j
	NSkXM2ELocd6MTv334xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc4S2-005wL8-MZ; Wed, 06 Apr 2022 12:07:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc4Rx-005wJX-9w
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 12:07:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9ABB6192E;
 Wed,  6 Apr 2022 12:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E864FC385A1;
 Wed,  6 Apr 2022 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649246868;
 bh=iGoGpsovgQGm3f51J9VzIGQSvftAriIikJJODGcShQM=;
 h=From:To:Cc:Subject:Date:From;
 b=H3dYPeC9xFmaac+uA8gZ4+yYQRjdsWrb7yyDY27NluUTJp9CVXAjyWQ5lKhiUOpMI
 n833ozeQFlfHPewyjYMSRp8JZtimSk4qebyz1Kqk3Jrip+O1AJETjVjURgr4K1Z2N5
 ivEsSXT/GKb26kyYYfihsm8jFhd3tugNCtSZV5jEPL96R1E9C6ICJd9PGZjIArsABY
 GvdUuzw31o/1IJLQn/LHwj80t+B08Mjzgw4w7n25PrM6YM5jc2r/FAksTzkMArp+LI
 RXIdKzrFH3c4qLHf/+0GyJ2UL9kfSU/Ixg1iwrERC4+2bnfXLlmVTWFm3aa1XWnspr
 hnIHOxWC44p/g==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] riscv: cmpxchg: Cleanup unnecessary definition
Date: Wed,  6 Apr 2022 20:07:35 +0800
Message-Id: <20220406120735.661142-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_050749_422050_B95D0EC8 
X-CRM114-Status: UNSURE (   7.61  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The cmpxchg32 & cmpxchg32_local have been never used in linux, so
let's remove them from cmpxchg.h.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/include/asm/cmpxchg.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 36dc962f6343..12debce235e5 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -348,18 +348,6 @@
 #define arch_cmpxchg_local(ptr, o, n)					\
 	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
 
-#define cmpxchg32(ptr, o, n)						\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	arch_cmpxchg((ptr), (o), (n));					\
-})
-
-#define cmpxchg32_local(ptr, o, n)					\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	arch_cmpxchg_relaxed((ptr), (o), (n))				\
-})
-
 #define arch_cmpxchg64(ptr, o, n)					\
 ({									\
 	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
