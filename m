Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E3FC3ABC9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMoOd/2tsgqd1AY5lxfd+WIqxavY7rwiiPUfJlIlb88=; b=VlY9zxbIlGoFmV
	l9UJIig+Lzn+I+pAw6LcyMRq1O2vOLaXFXi82pIEGHbQfosMG5eVLs+QKOKll1fqXciy5r0D0VBob
	Dt4QcE7TXSA0GLW0coJ/+PqRMNNKNPwb9ov3uNvSQ7YvJozNZ4Ca0hFRhX8MfIua8kdMdwD5WbcHi
	Zd6BFDCBdW5sSO3sYVMU/7zt46X20vSLhFnBsskP3RodB2tf4WYzb/Oa/rojQCpvu+t1tl7pas3TT
	7HHZV1A7esCeI5vofeWDqZTXEGYqtQHI7O2ovh4WxR058cfwYV3ylfAuU8xEE+7P+9hQd7W6zo1Ww
	ldETM8jn86z0IOWex/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXza-00000000bt4-0Ehj;
	Thu, 15 May 2025 12:47:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXzY-00000000bra-0Lhe
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 12:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6416FA4B93E;
	Thu, 15 May 2025 12:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBECAC4CEEB;
	Thu, 15 May 2025 12:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747313235;
	bh=molGG3aPYi74hz9WVuXlbE1iJFE0MWmpVUKVIij8Ws4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HexE5EejAosqid8JNqxH9pMJdNWnmOwh5C25ih8nPZirXfRTH5rFM+vh2twGdKLdL
	 aDgn+QSpoPhRyZ3LaqK6Tj8HsarJT4LqlVL+Oq0WjZliiZT9BPsAsEfILBYKepZcIL
	 09XZndnuz/sB8iaazKI/kGQ2avI6mjZY1hxWaXYTLYc4XNrbXJEL6mqcVF52vZFjKR
	 sPFrqFqYyd1+Mjzr7KXVUb3hnX3tbDoLW4wreJaqvsFQh1W/WlbX4/Zqy9h+ZXLwDB
	 5mIOJ7SDVdKWEKzUF4jPk+Wk1aTbuPU/VW5co2u75mTDNhwAP0mKnHYp3V/rdlUrbs
	 nbbM4NX7VNCeA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 11/15] bugs/riscv: Pass in 'cond_str' to __BUG_FLAGS()
Date: Thu, 15 May 2025 14:46:40 +0200
Message-ID: <20250515124644.2958810-12-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515124644.2958810-1-mingo@kernel.org>
References: <20250515124644.2958810-1-mingo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_054716_186973_55368CB7 
X-CRM114-Status: GOOD (  11.74  )
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

Pass in the condition string from __WARN_FLAGS() to __BUG_FLAGS(),
but don't use it yet.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/riscv/include/asm/bug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index b22ee4d2c882..feaf456d465b 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -50,7 +50,7 @@ typedef u32 bug_insn_t;
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_FLAGS(flags)					\
+#define __BUG_FLAGS(cond_str, flags)				\
 do {								\
 	__asm__ __volatile__ (					\
 		"1:\n\t"					\
@@ -66,17 +66,17 @@ do {								\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
 #else /* CONFIG_GENERIC_BUG */
-#define __BUG_FLAGS(flags) do {					\
+#define __BUG_FLAGS(cond_str, flags) do {			\
 	__asm__ __volatile__ ("ebreak\n");			\
 } while (0)
 #endif /* CONFIG_GENERIC_BUG */
 
 #define BUG() do {						\
-	__BUG_FLAGS(0);						\
+	__BUG_FLAGS("", 0);					\
 	unreachable();						\
 } while (0)
 
-#define __WARN_FLAGS(cond_str, flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
+#define __WARN_FLAGS(cond_str, flags) __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags))
 
 #define HAVE_ARCH_BUG
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
