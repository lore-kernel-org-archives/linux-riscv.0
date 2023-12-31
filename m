Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ED0C4706F
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Dec 2023 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L1sB5xioREXupg1sT5fLHvaJcI1WZHvZXFwHJvoZj84=; b=OmJRgPNHgNcQxJ
	5R9vRbmcVEop0fE5fYUBJQKSYp4oek02Te8wRDTRpdrJCZQXhmRtC7/Ws4AiEHEoi0I0L9iDfnhKa
	6ILd15/n5RJXswBeM5Q81VwRvB/j6kpultVpjaysE/Zi9838HdsdCuw8LV3E5gKyLi8XMb+1OJqUL
	pus74/qy2NDynEM5ROQf+hoii/8xV9yt7pf/NLz/ZTMpXNP/TJ3UfvYuA6ZAMNpxXwOvAEdEbLAvW
	C88etP29zcSSn+ff66ceatf0l53fXek4VZo/btGo3yJ16ONWsMfXqTFQnsyxLmcVpVqXUdVZd4TNo
	kosmgOebqN4tiZpinP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJrDI-004E7G-2F;
	Sun, 31 Dec 2023 08:30:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJrDF-004E64-1c
	for linux-riscv@lists.infradead.org;
	Sun, 31 Dec 2023 08:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B22260C98;
	Sun, 31 Dec 2023 08:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E492C433C9;
	Sun, 31 Dec 2023 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704011424;
	bh=pGyWv9VDcODy3haubtquFUnBMC/QK1gpzpez9PuUJg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l74aSVZnKCkxsU7iG5U39K6snGA5u0zORTgPF1sZDwcJ0bzyhtgB5uUiyzw0HVVsw
	 ek4vZ6ge7ZUHDNrjVflanVu296zbSASdogcEg8Tb6frJ30w/0BZHKH5UJQoV7dXJ97
	 GeKq2Ox/1nR8xHE2+sEscfLFV5ut83FCw7ogbacrRHQq/Sa6Yp0wMU31UFkt+TVHfO
	 u7t5+I8bIvXQjLwJOkgzlanYNs2WAr6AaUEXlmLudcTrbCGUW57Je2lm1kCJ8R/N/F
	 6bJ5FuvlLyeRYYASv8mvFG0yR+qcAblM9nRS23ll9s/RHLDqOvR9fgn3rkJwG5sq7P
	 uFhh6mMktlIiQ==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	panqinglin2020@iscas.ac.cn,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	leobras@redhat.com,
	peterz@infradead.org,
	keescook@chromium.org,
	wuwei2016@iscas.ac.cn,
	xiaoguang.xing@sophgo.com,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	uwu@icenowy.me,
	jszhang@kernel.org,
	wefu@redhat.com,
	atishp@atishpatra.org,
	ajones@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 3/3] riscv: xchg: Prefetch the destination word for sc.w
Date: Sun, 31 Dec 2023 03:29:53 -0500
Message-Id: <20231231082955.16516-4-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231231082955.16516-1-guoren@kernel.org>
References: <20231231082955.16516-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231231_003025_583876_11A12C01 
X-CRM114-Status: GOOD (  10.12  )
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

The cost of changing a cacheline from shared to exclusive state can be
significant, especially when this is triggered by an exclusive store,
since it may result in having to retry the transaction.

This patch makes use of prefetch.w to prefetch cachelines for write
prior to lr/sc loops when using the xchg_small atomic routine.

This patch is inspired by commit: 0ea366f5e1b6 ("arm64: atomics:
prefetch the destination word for write prior to stxr").

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 26cea2395aae..d7b9d7951f08 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -10,6 +10,7 @@
 
 #include <asm/barrier.h>
 #include <asm/fence.h>
+#include <asm/processor.h>
 
 #define __arch_xchg_masked(prepend, append, r, p, n)			\
 ({									\
@@ -23,6 +24,7 @@
 									\
 	__asm__ __volatile__ (						\
 	       prepend							\
+	       PREFETCHW_ASM(%5)					\
 	       "0:	lr.w %0, %2\n"					\
 	       "	and  %1, %0, %z4\n"				\
 	       "	or   %1, %1, %z3\n"				\
@@ -30,7 +32,7 @@
 	       "	bnez %1, 0b\n"					\
 	       append							\
 	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
-	       : "rJ" (__newx), "rJ" (~__mask)				\
+	       : "rJ" (__newx), "rJ" (~__mask), "rJ" (__ptr32b)		\
 	       : "memory");						\
 									\
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
