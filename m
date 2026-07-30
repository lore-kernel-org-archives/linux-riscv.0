Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC3CC54FDF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4pXaQEaeg99GMuhFqHriS19oqAdPA5KmuaVSbvd1rG4=; b=yvBMHjZ8EfT1XU
	nxvEJ8QnJFahOhTIaNQa1zPnapfjEj1eXjmUfgdWEi7V+soX0d0KaSjirf7+r1Mj2ffpdezPkkj7M
	+AFzPEhgXkBdfTMfqJN2zLEv/kWnyLo2ixaSZyDK3gmt6qX/6Z/s+YrXiHt/r3NwcmSDzaOYQ3alk
	99A97x7S6ED9S7IV4w5WVffyKfKiPe7ee22pfnfQIl9dobj83bdfv5ImlI5mcHAw4NBCc4YZcVuoB
	Z/OblU08tOmACjLNECCFlgI/mD4MGTiiK/ZvYhaLNhOTg8NmkaSkKbwOQpmO4TPB1jsJLNpjTYG0o
	xkaQW0RRAWSWEmrJ+SIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNJf-0000000A2xG-2s5Q;
	Thu, 30 Jul 2026 09:44:39 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNJb-0000000A2w8-1cKM
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 09:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id; bh=LyD5PuOBdvlgYVGtkm/lxT3DCNBq3bGWNmErnmZXph8=; b=L
	IqC3AOXzQE7LPNg1l4iAjD9HngJZZsHGsBRneFerYmoqcL6c2JRT0waUyMUltgJP
	8zJFERFCC+CRmXwY2hOtR1W4RLlFwaQSp2cym8HJ3Sv6PhoxvJz/BtYx/t+6d5h8
	GdQIddIQ+YbTJzxoTdqjWujZOnbmqGqAFa/eSMdr8M=
Received: from localhost.localdomain (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEIDHWtqVMwVAA--.18021S2;
	Thu, 30 Jul 2026 17:44:42 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xie Bo <xb@ultrarisc.com>
Subject: [PATCH] riscv: Add native this_cpu_cmpxchg() support
Date: Thu, 30 Jul 2026 17:44:07 +0800
Message-Id: <20260730094407.16588-1-xb@ultrarisc.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAfwDXEEIDHWtqVMwVAA--.18021S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF1DCw13uFWkuryUXry5urg_yoW5KFy8pa
	909rn5trZxZFn7t3y3tFykXr15X3ykWr4xCr18uFy8JFsrJFyDXrnIyF1kZFykua92va40
	gF9Y9ryjkw1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQATB2pkMtIAAQAisY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_024436_030008_01FF73C9 
X-CRM114-Status: GOOD (  14.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V falls back to the generic this_cpu_cmpxchg() implementation,
which serializes the operation by disabling local interrupts.
Consequently, HAVE_CMPXCHG_LOCAL is unset and users such as
percpu_counter cannot use their cmpxchg-based fast paths.

Implement the 4-byte this_cpu_cmpxchg() operation with cmpxchg_local(),
and provide the 8-byte operation on RV64. Pin execution while resolving
the current CPU pointer so the LR/SC loop operates on one per-CPU
instance, while allowing interrupt-context updates to race through the
atomic operation.

Copy the old and new values to private temporaries before invoking
cmpxchg_local(). This avoids collisions between local variable names in
nested statement-expression macros.

The 1- and 2-byte operations continue to use the generic fallback.

Select HAVE_CMPXCHG_LOCAL and update the architecture feature matrix.

A percpu_counter_add() benchmark using the default batch value reduced
the median time per operation by 77.3% (10 runs of 5,000,000
operations).

In three 60-second stress-ng fork runs, median throughput increased by
4.6%. A 120-second combined fork and VM stress test completed without
rss-counter errors or validation failures.

Signed-off-by: Xie Bo <xb@ultrarisc.com>
---
 .../locking/cmpxchg-local/arch-support.txt    |  2 +-
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/include/asm/percpu.h               | 31 +++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.txt b/Documentation/features/locking/cmpxchg-local/arch-support.txt
index 2c3a4b9..28d5fa8 100644
--- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
+++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
@@ -20,7 +20,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: | TODO |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f7028ca..62e5794 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -153,6 +153,7 @@ config RISCV
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_BUILDTIME_MCOUNT_SORT
+	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 0000000..d389bb1
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_RISCV_PERCPU_H
+#define _ASM_RISCV_PERCPU_H
+
+#include <linux/preempt.h>
+
+#include <asm/cmpxchg.h>
+
+#define _protect_cmpxchg_local(pcp, o, n)				\
+({									\
+	typeof(pcp) *__ptr;						\
+	typeof(pcp) __pcpu_old = (o);					\
+	typeof(pcp) __pcpu_new = (n);					\
+	typeof(*raw_cpu_ptr(&(pcp))) __ret;				\
+	preempt_disable_notrace();					\
+	__ptr = raw_cpu_ptr(&(pcp));					\
+	__ret = cmpxchg_local(__ptr, __pcpu_old, __pcpu_new);		\
+	preempt_enable_notrace();					\
+	__ret;								\
+})
+
+#define this_cpu_cmpxchg_4(pcp, o, n)	_protect_cmpxchg_local(pcp, o, n)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_cmpxchg_8(pcp, o, n)	_protect_cmpxchg_local(pcp, o, n)
+#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
+#endif
+
+#include <asm-generic/percpu.h>
+
+#endif /* _ASM_RISCV_PERCPU_H */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
