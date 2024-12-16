Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9242CE77180
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 03:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BxI2NpQXGnUWXV9cnhOeL5sKC2Aju5SI/5yYup1Uv9s=; b=MUDgiYZiu3ljWp
	BB7n2+9Fnd3xcL9Gdxoq5mUw9ZLcKdiRko2CtRF5bpg4WJPKzm7IGwW9TvpuW/uI2uNbBHHbEbYOO
	eQV1HMdTZka6rbji2zM2IWd8bZD528l7SFvCddLoin7NRcVJpOVcOOcHWdA6Qr+RTzQzMlZTv3BO/
	Ihy1IV2zD47Oe08t0hyS+x+pecFs2sOXdBhvtl6iY6qb3xwSq5SK+k2ys2mCV8XowMQZVFLGuwQYA
	hDFE09IBAOkXKrB74Fy4kcnw3H0wKiPDG2AkJ2Wb9nKWjjfQN7BvLEnzFXHILmShj4/5/QFcR1zMY
	JUb7AfkZojJCLOIXWxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1km-00000008vc8-42gt;
	Mon, 16 Dec 2024 03:26:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1hO-00000008vA5-0n2H
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 03:23:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DE3D5C59D8;
	Mon, 16 Dec 2024 03:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48104C4CED0;
	Mon, 16 Dec 2024 03:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734319389;
	bh=V4jM3CVSCQm1TaO1otXw7852w/swq8OZFbl3RxkIYK4=;
	h=From:To:Cc:Subject:Date:From;
	b=kjuVY9PGhDTtrEHi/eH9u8pArsgTdG3NHgqlKH9cBtPvf+LGHxw0mZ/wK/sHWxQPe
	 H/bZk4C+cC1a4BWJyFCpHnhMz1UM2ybo9yn4gjGYKCQ9phC+s875/LSrqSpGSXBK4n
	 jBa/ZZzVOwJoGT5ohcQNioboygexWAg2IfcPSt/rOn8xcUWSJtRZk+fcZG9lq7qBsn
	 vbVngoME1TjByjp6y9CxwGSd9ZOuiguO7DkSRllgLyk2ysrGVdODtjcsoJ+gDPJ4NL
	 oknWLJRF9DZMt+r7ne2xAcBaeh2uDzGFguujf80RXHPaXA6A6GGSu1gNS5ZhzuIdKx
	 0fsS87gW9evnw==
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
Subject: [PATCH] riscv: Implement smp_cond_load8/16() with Zawrs
Date: Sun, 15 Dec 2024 22:22:53 -0500
Message-Id: <20241216032253.685728-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_192310_324570_D0338D2E 
X-CRM114-Status: UNSURE (   8.13  )
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
---
 arch/riscv/include/asm/cmpxchg.h | 38 +++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 4cadc56220fe..2bd42a11ff8f 100644
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
+		__mask = 0xf << __s;
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
 	case 4:
 		asm volatile(
 		"	lr.w	%0, %1\n"
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
