Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52384C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 14:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbwPYqUm3O+0ltm4QLinPtqGg2FQd7uEffgeXJ7M0Jc=; b=jxLuGYSKt4bUAr
	XT3K/3i07BQiZdR8YHbICQLtPjexK3AdIvfZseyeHaaxCSWisUaXMN7H9uvuuAx4QMNVWFAfXTmAD
	bT38OzBz6fDwRcTZULOzjBnfPwQAshKBBao6OWiF2jAh+oJpDyrE+yreNmRLxj2lOU+/XIJt99FWN
	a9D/E6uYcuFRB5ScZhinsI5xzWWlLlVC20A0dwxWT2QpjkB8RuWismtx3pWtYN64K9sDHTJUsqWmB
	sL7kF9/EaY7+O7jHy0rW1ax70SfSjqWMm5Gb5B5MPNu5SYQLUEz7HmMQo14npANJ8RPou7Xz188vK
	MBd/GnLy504vWTf1isnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhBZY-009RLe-QM; Wed, 20 Apr 2022 14:44:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhBZV-009RIs-00
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 14:44:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73F84617B5;
 Wed, 20 Apr 2022 14:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5450C385AC;
 Wed, 20 Apr 2022 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650465883;
 bh=sAulfPUiEvDbBqRnfY9vU25oXxTZrbt8To4Bji3mwyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tPXOZu0vrdrkEajEXD7J4RwxL7f29AjfbOT4IBcggA0PvPHAGfMQ2HUqG/l9bNmaU
 lYhzbIMGzYCYZyrUAfSa2jsWQ3pKmKBZoU2c86KVsBFv1bxaiQMfUMllfUDNQl+xsG
 O4qH0JQR1ho6ORYR7LbnQVTkRQPGCwSSgiTjotL1aKCdlkZ4gYR+rH8gKX8Y/wN8mP
 t81UsuPTKux+lMBZU/4NP9QYgY2wdmSUY8OAPZ6Z6lEjYaMKBNCnLMcvGiC/ROX0nk
 uYkJmZVIDlsyrhaTn6YY/bkOt3Ou5lrsgNlrct74cxs8knSuRN7/2vtmiCHxHPrxaS
 jnyGB6S4/X81g==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 3/5] riscv: atomic: Optimize memory barrier semantics of
 LRSC-pairs
Date: Wed, 20 Apr 2022 22:44:15 +0800
Message-Id: <20220420144417.2453958-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420144417.2453958-1-guoren@kernel.org>
References: <20220420144417.2453958-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_074445_162115_93260BBE 
X-CRM114-Status: GOOD (  12.84  )
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

The current implementation is the same with 8e86f0b409a4 ("arm64:
atomics: fix use of acquire + release for full barrier semantics").
RISC-V could combine acquire and release into the AMO instructions
and it could reduce the cost of instruction in performance. Here
is RISC-V ISA 10.2 Load-Reserved/Store-Conditional Instructions:

 - .aq:   The LR/SC sequence can be given acquire semantics by
          setting the aq bit on the LR instruction.
 - .rl:   The LR/SC sequence can be given release semantics by
          setting the rl bit on the SC instruction.
 - .aqrl: Setting the aq bit on the LR instruction, and setting
          both the aq and the rl bit on the SC instruction makes the
          LR/SC sequence sequentially consistent, meaning that it
          cannot be reordered with earlier or later memory operations
          from the same hart.

Software should not set the rl bit on an LR instruction unless the
aq bit is also set, nor should software set the aq bit on an SC
instruction unless the rl bit is also set. LR.rl and SC.aq
instructions are not guaranteed to provide any stronger ordering than
those with both bits clear, but may result in lower performance.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Dan Lustig <dlustig@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/include/asm/atomic.h  | 6 ++----
 arch/riscv/include/asm/cmpxchg.h | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 20ce8b83bc18..4aaf5b01e7c6 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -382,9 +382,8 @@ static __always_inline int arch_atomic_sub_if_positive(atomic_t *v, int offset)
 		"0:	lr.w     %[p],  %[c]\n"
 		"	sub      %[rc], %[p], %[o]\n"
 		"	bltz     %[rc], 1f\n"
-		"	sc.w.rl  %[rc], %[rc], %[c]\n"
+		"	sc.w.aqrl %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		: [o]"r" (offset)
@@ -404,9 +403,8 @@ static __always_inline s64 arch_atomic64_sub_if_positive(atomic64_t *v, s64 offs
 		"0:	lr.d     %[p],  %[c]\n"
 		"	sub      %[rc], %[p], %[o]\n"
 		"	bltz     %[rc], 1f\n"
-		"	sc.d.rl  %[rc], %[rc], %[c]\n"
+		"	sc.d.aqrl %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		: [o]"r" (offset)
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 1af8db92250b..9269fceb86e0 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -307,9 +307,8 @@
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
 			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w.rl %1, %z4, %2\n"			\
+			"	sc.w.aqrl %1, %z4, %2\n"		\
 			"	bnez %1, 0b\n"				\
-			"	fence rw, rw\n"				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
 			: "rJ" ((long)__old), "rJ" (__new)		\
@@ -319,9 +318,8 @@
 		__asm__ __volatile__ (					\
 			"0:	lr.d %0, %2\n"				\
 			"	bne %0, %z3, 1f\n"			\
-			"	sc.d.rl %1, %z4, %2\n"			\
+			"	sc.d.aqrl %1, %z4, %2\n"		\
 			"	bnez %1, 0b\n"				\
-			"	fence rw, rw\n"				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
 			: "rJ" (__old), "rJ" (__new)			\
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
