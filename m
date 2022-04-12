Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E160C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 03:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VCLxkBzKAv1En/JZxd/3LoAEeSjnSJmk6/wcUWQNWU=; b=08EPFGTDPo5kam
	4kHwl4p6ENWJZ9dTsHZeQp0FiIFy8tj7G5P2tNlr9rHtAOUbIDG4jkCnasWeF1ThKXoyV6jM2P7gI
	V1ofkLViD1dSgVaSeePisqam/9P7MGaKaIcaYSehgP/K33LNkzoQne4e+r1RB7+xRhmYbr0eSYp2F
	EJ8m8L1I5Pt8oJWcznIQ+KwGOjmPSJG+KYqC3QYv820h12GwGwLOfRBlJFcEaMN5Ik5kEihT3pFzc
	lY3HC+n6od/ocFJIsW+tb8eEq13jl7ypWXu3pdhArBmFAra7G19hlIjKDOoOkEApamqXQu9PJisH6
	8BsBb5EWN2xf3CMNZc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne7Xx-00BSgv-D9; Tue, 12 Apr 2022 03:50:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne7Xu-00BSeX-8s
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 03:50:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBF376174A;
 Tue, 12 Apr 2022 03:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6078C385AC;
 Tue, 12 Apr 2022 03:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649735425;
 bh=O2y3teAL9Rp1btL3NXWebprGsFA2ymLi02cTCI1njfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HgFIXpXyatOm2DaTaDUeoy8YS8nwMT4zsGyWUanxympfGxzA5PYMcFivgLiBKduNV
 4igcn0Ao59VrB7hYFUE5IV3dG4AwItsdQynQSoeG2ruRqmCCO58LOCYO7IspPFIQdq
 hNalsA3hzgd8FPUa9tsIEzzo3SCoFZ51MyJGB053SVIH1DqA5cDueGnYvPhXwBtING
 MBqEaGm9U8IWiiXJNNeXGsdsT053jQiAkZqUoAd4ObFISo+VCsXBTvSnHC7uT8Pu4F
 b81ICNG1Kd2Bef52wjyJIMuvmqDxX1FU7qKyLo3zwPSg1oNB43eHA2H3buN6dbpCAi
 sAj2KGP15xZ1A==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 3/3] riscv: atomic: Optimize memory barrier semantics of
 LRSC-pairs
Date: Tue, 12 Apr 2022 11:49:57 +0800
Message-Id: <20220412034957.1481088-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412034957.1481088-1-guoren@kernel.org>
References: <20220412034957.1481088-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_205026_452891_817CAB82 
X-CRM114-Status: GOOD (  11.93  )
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
are the reasons for optimization:
 - Reduce one extra fence instruction
 - The "LR/SC" instruction with "acquire and release" operation is
   less cost than ACQUIRE_BARRIER/RELEASE_BARRIER which used
   precedes-loads/subsequent-stores prohibit to protect only LR/SC
   self-instruction.
 - Putting acquire/release barrier into the loop shouldn't cost
   extra performance problems from the micro-arch design view.
   Because LR and SC are sequential in the loop by RVWMO rules.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 arch/riscv/include/asm/atomic.h  |  6 ++----
 arch/riscv/include/asm/cmpxchg.h | 18 ++++++------------
 2 files changed, 8 insertions(+), 16 deletions(-)

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
index 1af8db92250b..dfb51c98324d 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -215,9 +215,8 @@
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
 			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w %1, %z4, %2\n"			\
+			"	sc.w.aq %1, %z4, %2\n"			\
 			"	bnez %1, 0b\n"				\
-			RISCV_ACQUIRE_BARRIER				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
 			: "rJ" ((long)__old), "rJ" (__new)		\
@@ -227,9 +226,8 @@
 		__asm__ __volatile__ (					\
 			"0:	lr.d %0, %2\n"				\
 			"	bne %0, %z3, 1f\n"			\
-			"	sc.d %1, %z4, %2\n"			\
+			"	sc.d.aq %1, %z4, %2\n"			\
 			"	bnez %1, 0b\n"				\
-			RISCV_ACQUIRE_BARRIER				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
 			: "rJ" (__old), "rJ" (__new)			\
@@ -259,8 +257,7 @@
 	switch (size) {							\
 	case 4:								\
 		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"0:	lr.w %0, %2\n"				\
+			"0:	lr.w.rl %0, %2\n"			\
 			"	bne  %0, %z3, 1f\n"			\
 			"	sc.w %1, %z4, %2\n"			\
 			"	bnez %1, 0b\n"				\
@@ -271,8 +268,7 @@
 		break;							\
 	case 8:								\
 		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"0:	lr.d %0, %2\n"				\
+			"0:	lr.d.rl %0, %2\n"			\
 			"	bne %0, %z3, 1f\n"			\
 			"	sc.d %1, %z4, %2\n"			\
 			"	bnez %1, 0b\n"				\
@@ -307,9 +303,8 @@
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
@@ -319,9 +314,8 @@
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
