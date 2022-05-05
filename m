Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C73C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 03:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uA+PxR58QxXEehG0hLJFZ4vMpKaFY29Pclyvk+3nqMg=; b=47PcLW1Dy9XGxB
	VY1B/CmcPp6hLPW1kuLE8EIRb6s5kXLkY90Shbzpjw5NJaRbO+woHwjF9PoGF2Dj/iuryw3uCt036
	fi6QvsT8ZdHq+sLRPONGLiDMjFrMYA15DsE0V3Mnmhwxql/GkFHCCWnTX19G5zzjTlPkiWqzXzdkQ
	tp9xsKcMMeiMXtDMg1W16AjoFwVwQWQqxmdpQYLG3S+0LXI+NfDmZMOPIOyI+Bkms62ozJIuoEs1V
	YzHNdZdmNTtXNn2Zzsx2GN3Ttw+MkGCrIp0ey6EA9nzggy+7LyZF5beMNYW8d5YShAXO6rG3OK3Ac
	pcxNs937mViumu3a+sVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmSap-00DqrJ-AP; Thu, 05 May 2022 03:55:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmSam-00Dqp4-Kp
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 03:55:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2416EB82B7A;
 Thu,  5 May 2022 03:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCF2C385AF;
 Thu,  5 May 2022 03:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651722949;
 bh=zEP2zr6mxUqpeaQg8TqMs57O91k1mSJfPjusddLpquU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TC1QLMp6xzwEn1E1GLMCM6MfsYmcR9ekeHf+HNLGQZ8XkpIMiWDTeZJ5XmM5DZHI2
 DyxDQe9ygFC3mJnzK4fGggD7gxnj3sOy7uMCVLwYAZOWSB8p09j2wyJ93I7A9lIm0n
 tgw2E7ddKxSThSjeAL+uQbRbBf644VDJsWfMXVBVnvPJH9iXcXwWpMsq9Bx5OKwKFV
 olxIXDt230yGcS2NblTwSBPgtaf28x6DZHAdEsgoTZlSOTuT4JqqOYRv5h4iZhBMhA
 y+gUCqk01aOqfQWl87zRxAiW0ehpn4At00ihakDvu8uk1VLnYEoBjaepYre60Olmj0
 IO2HMctw1E3sA==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 2/5] riscv: atomic: Optimize dec_if_positive functions
Date: Thu,  5 May 2022 11:55:23 +0800
Message-Id: <20220505035526.2974382-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505035526.2974382-1-guoren@kernel.org>
References: <20220505035526.2974382-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_205552_990728_ACB3075F 
X-CRM114-Status: UNSURE (   9.79  )
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

Current implementation wastes another register to pass the
argument, but we only need addi to calculate the result. Optimize
the code with minimize the usage of registers.

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
index ac9bdf4fc404..f3c6a6eac02a 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -310,47 +310,47 @@ ATOMIC_OPS()
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
 		"	sc.w.rl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
 		"	fence    rw, rw\n"
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
 		"	sc.d.rl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
 		"	fence    rw, rw\n"
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
