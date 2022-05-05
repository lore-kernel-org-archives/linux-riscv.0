Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CA7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 03:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVLzXR2cmluch7BrNPA5ElXT4n/k3AZ6crL5LEXdIVM=; b=IuhZUnocH8GiOs
	udkvcKGlVKYB6lZk5xNY4MgpJiBHm4Qo9pRUqIRAnLsxtX/Nzjnq03ImGsaeSs/6uYTce+ViGdR7z
	9+cWqyxsevXQWCS5Am2htK+tSA13qU0WHsE5mQJ+7UcborcIWcbl7TV6e5QhYFLA3c3YY7dJzQjxf
	kfyYj73AxB+wnOXjd8Bp9SO1V+/S4k34jX8ZJHXuyoIqO4jFt9i48eWQIfQmLCEmFXbes0/oxs4pB
	AhpK7Hr1IuFsCfGwIoniggKPpKtQt1WqT3iQ0HRvSGUEPPerm6sK3Ky4IfTiUH2dIhaFk0byQMKoh
	xDQLlrSg+xApa3oJO8vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmSaz-00DqzT-P4; Thu, 05 May 2022 03:56:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmSav-00DqwN-Pm
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 03:56:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58C5761A8E;
 Thu,  5 May 2022 03:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B7BC385C0;
 Thu,  5 May 2022 03:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651722960;
 bh=8XLEMSuEe89wrb20sD10ke+Ufm9VTkGQ/8AZQEqbL1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SAOvY8AOQbg9Fkt4GKHWZwvjDVyZth4XTpkBlu7cdANQnyoPfHGm6lKzfSPxdZFbd
 OfFvnz4UvYVkFe3qMLHVNzU/QldmY9Ofhrg54ObsCi/ENdC44elYAVuPvYsUPA3DVU
 5qwr5qO+SjE1A4tVF9k/G6TX0zFT22l3CUxCFulcTWFSDf00JsHrcIrd5raTsss9SJ
 CCb+bNTe+5YrOSJYsdIi7Nf6EhOV6eKGnkU4MzZG8gDaMnCtX1GmMB2vqRvQ3i/IXp
 iHmmJZQb6/VyV3mgeG0K6bDyBFhMZUYeDvXqUbQDBwWZO/s/jyM8CxxBMSgd3/vjSJ
 EQGYxHmGS4xfQ==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 5/5] riscv: atomic: Optimize LRSC-pairs atomic ops with
 .aqrl annotation
Date: Thu,  5 May 2022 11:55:26 +0800
Message-Id: <20220505035526.2974382-6-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505035526.2974382-1-guoren@kernel.org>
References: <20220505035526.2974382-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_205601_994256_D2C4DCD0 
X-CRM114-Status: GOOD (  12.57  )
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

The current implementation is the same with 8e86f0b409a4
("arm64: atomics: fix use of acquire + release for full barrier
semantics"). RISC-V could combine acquire and release into the SC
instructions and it could reduce a fence instruction to gain better
performance. Here is related descriptio from RISC-V ISA 10.2
Load-Reserved/Store-Conditional Instructions:

 - .aq:   The LR/SC sequence can be given acquire semantics by
          setting the aq bit on the LR instruction.
 - .rl:   The LR/SC sequence can be given release semantics by
          setting the rl bit on the SC instruction.
 - .aqrl: Setting the aq bit on the LR instruction, and setting
          both the aq and the rl bit on the SC instruction makes
          the LR/SC sequence sequentially consistent, meaning that
          it cannot be reordered with earlier or later memory
          operations from the same hart.

 Software should not set the rl bit on an LR instruction unless
 the aq bit is also set, nor should software set the aq bit on an
 SC instruction unless the rl bit is also set. LR.rl and SC.aq
 instructions are not guaranteed to provide any stronger ordering
 than those with both bits clear, but may result in lower
 performance.

The only difference is when sc.w/d.aqrl failed, it would cause .aq
effect than before. But it's okay for sematic because overlap
address LR couldn't beyond relating SC.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Dan Lustig <dlustig@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/include/asm/atomic.h  | 24 ++++++++----------------
 arch/riscv/include/asm/cmpxchg.h |  6 ++----
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 34f757dfc8f2..aef8aa9ac4f4 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -269,9 +269,8 @@ static __always_inline int arch_atomic_fetch_add_unless(atomic_t *v, int a, int
 		"0:	lr.w     %[p],  %[c]\n"
 		"	beq      %[p],  %[u], 1f\n"
 		"	add      %[rc], %[p], %[a]\n"
-		"	sc.w.rl  %[rc], %[rc], %[c]\n"
+		"	sc.w.aqrl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		: [a]"r" (a), [u]"r" (u)
@@ -290,9 +289,8 @@ static __always_inline s64 arch_atomic64_fetch_add_unless(atomic64_t *v, s64 a,
 		"0:	lr.d     %[p],  %[c]\n"
 		"	beq      %[p],  %[u], 1f\n"
 		"	add      %[rc], %[p], %[a]\n"
-		"	sc.d.rl  %[rc], %[rc], %[c]\n"
+		"	sc.d.aqrl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		: [a]"r" (a), [u]"r" (u)
@@ -382,9 +380,8 @@ static __always_inline bool arch_atomic_inc_unless_negative(atomic_t *v)
 		"0:	lr.w      %[p],  %[c]\n"
 		"	bltz      %[p],  1f\n"
 		"	addi      %[rc], %[p], 1\n"
-		"	sc.w.rl   %[rc], %[rc], %[c]\n"
+		"	sc.w.aqrl %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -402,9 +399,8 @@ static __always_inline bool arch_atomic_dec_unless_positive(atomic_t *v)
 		"0:	lr.w      %[p],  %[c]\n"
 		"	bgtz      %[p],  1f\n"
 		"	addi      %[rc], %[p], -1\n"
-		"	sc.w.rl   %[rc], %[rc], %[c]\n"
+		"	sc.w.aqrl %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -422,9 +418,8 @@ static __always_inline int arch_atomic_dec_if_positive(atomic_t *v)
 		"0:	lr.w     %[p],  %[c]\n"
 		"	addi     %[rc], %[p], -1\n"
 		"	bltz     %[rc], 1f\n"
-		"	sc.w.rl  %[rc], %[rc], %[c]\n"
+		"	sc.w.aqrl %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -444,9 +439,8 @@ static __always_inline bool arch_atomic64_inc_unless_negative(atomic64_t *v)
 		"0:	lr.d      %[p],  %[c]\n"
 		"	bltz      %[p],  1f\n"
 		"	addi      %[rc], %[p], 1\n"
-		"	sc.d.rl   %[rc], %[rc], %[c]\n"
+		"	sc.d.aqrl %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -465,9 +459,8 @@ static __always_inline bool arch_atomic64_dec_unless_positive(atomic64_t *v)
 		"0:	lr.d      %[p],  %[c]\n"
 		"	bgtz      %[p],  1f\n"
 		"	addi      %[rc], %[p], -1\n"
-		"	sc.d.rl   %[rc], %[rc], %[c]\n"
+		"	sc.d.aqrl %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -486,9 +479,8 @@ static __always_inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
 		"0:	lr.d     %[p],  %[c]\n"
 		"	addi      %[rc], %[p], -1\n"
 		"	bltz     %[rc], 1f\n"
-		"	sc.d.rl  %[rc], %[rc], %[c]\n"
+		"	sc.d.aqrl %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
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
