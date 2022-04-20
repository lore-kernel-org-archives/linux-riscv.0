Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE477C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSLXyoTCcE2D+T7gE8dOFRqgfdwHLUWqH95kEijB9bM=; b=RCTL744jVPzhPl
	a+ta1ckutGpngBIwJAVbrjCNbgGNy7jAw5xwgSKR8mH5TzjcmW1zF/KZGInVQIn0K+QFNLjlvcZgv
	IbvbRnADftepP/6veFV8+oHzKg0CL8o5r3p5Udu63On/OmLkttoUwA/Oop1I9Bc99jWKmGx60/hnb
	LgxKkLsMIA2l8cs8G5wVumujk5udH1tI31/mFwTDhoERdPWnmGsB5qx7ljHnLRe8prcNwY47Nq5Zk
	XuyKRo7A8k0dUlxfUtJx7JFVjQY5k5J9UwhcoN+6544yerE+YdXyKWKQ6ZiznzDvXp12hoPxRTwkH
	rQQ7P+/frfdfNqBmNHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhBZf-009RQb-Ct; Wed, 20 Apr 2022 14:44:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhBZc-009RNU-5P
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 14:44:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0142CB81CCE;
 Wed, 20 Apr 2022 14:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC91C385A8;
 Wed, 20 Apr 2022 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650465887;
 bh=2lohV9FIb13AC3ra+UrYDKbvvuDZmMNdD6/UGs8XgO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CuAZfwf3MjkmBTu2TZaBtRNJtpESsgpXqIA6PhB+MQ74rrbUDF/QVusDi/4OWGE+h
 /2qSsYUrinpsKBtHxf63d6Zd160XftP642RxJW1c9LBT7+IA39E6t3pblSEW/J6itG
 9aWCdVU9DWZddtN+JaN1KDX1zP/eFFJQRTXlIrdCYf1hSgWDtZDv3Q8sEdu7UJgagc
 7GlMEd0j/MnDyAFlmw9KRaNHlkpVgiX1OyKmNkXCIMulrHgKGDhL43sfiC845Xjbqy
 PR+DGjaWYx8G7dOW17Mb/yxdtOodHXBinkojBktJL9v1GA88LeHUpgM/7DkMrTsf78
 rdAVlGxnb0M9A==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 4/5] riscv: atomic: Optimize dec_if_positive functions
Date: Wed, 20 Apr 2022 22:44:16 +0800
Message-Id: <20220420144417.2453958-5-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420144417.2453958-1-guoren@kernel.org>
References: <20220420144417.2453958-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_074452_523772_4989ECC7 
X-CRM114-Status: UNSURE (   9.38  )
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

The arch_atomic_sub_if_positive is unnecessary for current Linux,
and it causes another register allocation. Implementing the
dec_if_positive function directly is more efficient.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Dan Lustig <dlustig@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/include/asm/atomic.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 4aaf5b01e7c6..5589e1de2c80 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -374,45 +374,45 @@ ATOMIC_OPS()
 #undef ATOMIC_OPS
 #undef ATOMIC_OP
 
-static __always_inline int arch_atomic_sub_if_positive(atomic_t *v, int offset)
+static __always_inline int arch_atomic_dec_if_positive(atomic_t *v)
 {
        int prev, rc;
 
 	__asm__ __volatile__ (
 		"0:	lr.w     %[p],  %[c]\n"
-		"	sub      %[rc], %[p], %[o]\n"
+		"	addi     %[rc], %[p], -1\n"
 		"	bltz     %[rc], 1f\n"
 		"	sc.w.aqrl %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
-		: [o]"r" (offset)
+		:
 		: "memory");
-	return prev - offset;
+	return prev - 1;
 }
 
-#define arch_atomic_dec_if_positive(v)	arch_atomic_sub_if_positive(v, 1)
+#define arch_atomic_dec_if_positive arch_atomic_dec_if_positive
 
 #ifndef CONFIG_GENERIC_ATOMIC64
-static __always_inline s64 arch_atomic64_sub_if_positive(atomic64_t *v, s64 offset)
+static __always_inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
 {
        s64 prev;
        long rc;
 
 	__asm__ __volatile__ (
 		"0:	lr.d     %[p],  %[c]\n"
-		"	sub      %[rc], %[p], %[o]\n"
+		"	addi      %[rc], %[p], -1\n"
 		"	bltz     %[rc], 1f\n"
 		"	sc.d.aqrl %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
-		: [o]"r" (offset)
+		:
 		: "memory");
-	return prev - offset;
+	return prev - 1;
 }
 
-#define arch_atomic64_dec_if_positive(v)	arch_atomic64_sub_if_positive(v, 1)
+#define arch_atomic64_dec_if_positive	arch_atomic64_dec_if_positive
 #endif
 
 #endif /* _ASM_RISCV_ATOMIC_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
