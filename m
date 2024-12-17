Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E56E7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 01:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xTLWQuO/7KMsu3SeQtC6IeYs4adVwwQompk6P0KPtu8=; b=zvqfCu/63evUWt
	NLlgDJoZwq4QCDxQYbHABMv+1Ap1/T7dYoM6YerqeGu7pJKd6Zxq7YHX71GdPZdQ3o7BiKwBK5A8V
	ZxsQ5JOixx+aOTQfDKmYCgDXKBuE8mLOGydRoz6ktm1l74VV0LdZhcDqB+JOOqAR/c0LE19JV0sdP
	td91hacW4PLkP2MMItscN0GwTGOEaXn3ShtVzr2jQZ7zUuRmDLjZdHxBtdIZx3798ACTcgzK9IwrD
	1knCxDXky5BOdl3bgTGtfugFU8q8FML5+LkCt9mRmmHJNBodQ9xk0dt+PQ3kw8VkyWAnJeRJSDO75
	9N6yGWXo5b6UGng6g5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMZa-0000000Bt7i-0y3b;
	Tue, 17 Dec 2024 01:40:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMYY-0000000Bsy0-1dzc
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 01:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EF9A5C20F0;
	Tue, 17 Dec 2024 01:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F776C4CED7;
	Tue, 17 Dec 2024 01:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734399565;
	bh=owtD71z+IWbnShFjd+nn0WbTtuvKmXnIospnD/Ddb3k=;
	h=From:To:Cc:Subject:Date:From;
	b=lHE9vLU1SALL4Wjd473bayDvWzGcr8PYXDKRN9tSbtc/3FkzlJu395WJig3IQ1OQ9
	 2aixo5mXa2I7YwDQTtqP59SeC9FPB7GjotBwHLWR66v3Os+OqJe9+PxqySUwRNuaYY
	 dtuihK1hU62fAYs4edoj5uIY6y1JolnQr0JkRz9mKr04oKvpOEJzEhlVKuyZVNhICz
	 ShOlsR3ZGZQ/zCntcYQMlCdTRxewetFapCpV6AY70kbEkA/23RKagR58T5PjHI9VW7
	 fouLApl/6n++qdpQbcTRxR4mClnnKJ0VEJWPy7FH3ojejtC9EVCJSBrkHNmLoUFGTw
	 +mmSB/bcaxp4A==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	conor@kernel.org,
	leobras@redhat.com,
	alexghiti@rivosinc.com,
	christoph.muellner@vrull.eu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	ericchancf@google.com,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2] riscv: Implement smp_cond_load8/16() with Zawrs
Date: Mon, 16 Dec 2024 20:39:10 -0500
Message-Id: <20241217013910.1039923-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_173926_479490_478978F6 
X-CRM114-Status: UNSURE (   8.92  )
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

RISC-V code uses the queued spinlock implementation, which calls
the macros smp_cond_load_acquire for one byte. So, complement the
implementation of byte and halfword versions.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>
---
Changes in V2:
 - Fixup mask typo (0xf -> 0xff, 0xff -> 0xffff) by Andrew.
---
 arch/riscv/include/asm/cmpxchg.h | 38 +++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 4cadc56220fe..aa4410beb065 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -365,16 +365,48 @@ static __always_inline void __cmpwait(volatile void *ptr,
 {
 	unsigned long tmp;
 
+	u32 *__ptr32b;
+	ulong __s, __val, __mask;
+
 	asm goto(ALTERNATIVE("j %l[no_zawrs]", "nop",
 			     0, RISCV_ISA_EXT_ZAWRS, 1)
 		 : : : : no_zawrs);
 
 	switch (size) {
 	case 1:
-		fallthrough;
+		__ptr32b = (u32 *)((ulong)(ptr) & ~0x3);
+		__s = ((ulong)(ptr) & 0x3) * BITS_PER_BYTE;
+		__val = val << __s;
+		__mask = 0xff << __s;
+
+		asm volatile(
+		"	lr.w	%0, %1\n"
+		"	and	%0, %0, %3\n"
+		"	xor	%0, %0, %2\n"
+		"	bnez	%0, 1f\n"
+			ZAWRS_WRS_NTO "\n"
+		"1:"
+		: "=&r" (tmp), "+A" (*(__ptr32b))
+		: "r" (__val), "r" (__mask)
+		: "memory");
+		break;
 	case 2:
-		/* RISC-V doesn't have lr instructions on byte and half-word. */
-		goto no_zawrs;
+		__ptr32b = (u32 *)((ulong)(ptr) & ~0x3);
+		__s = ((ulong)(ptr) & 0x2) * BITS_PER_BYTE;
+		__val = val << __s;
+		__mask = 0xffff << __s;
+
+		asm volatile(
+		"	lr.w	%0, %1\n"
+		"	and	%0, %0, %3\n"
+		"	xor	%0, %0, %2\n"
+		"	bnez	%0, 1f\n"
+			ZAWRS_WRS_NTO "\n"
+		"1:"
+		: "=&r" (tmp), "+A" (*(__ptr32b))
+		: "r" (__val), "r" (__mask)
+		: "memory");
+		break;
 	case 4:
 		asm volatile(
 		"	lr.w	%0, %1\n"
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
