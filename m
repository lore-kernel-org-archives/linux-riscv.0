Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C245C5DF81
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 03:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqMOdJKuiv4ZdPYCEC4hVDgy3rHujGuTaRdVGrbXukg=; b=ipkqBBMNbekZBn
	firSB7eTvJ53uagFT4nwxxEEzUHBQ+gA3hR0XBgUj4h9d9HjBtgtvkeKBijvoGRvP/fE9gdmShEDU
	VKEKg4wtusWMc5fJQ3QY/hYnREuHOQIEK2x7yr/myAfYjufuVjVUsiFuM9yE5nWcrkVXqjKYNCwDO
	lgmp4B1k6rOUJkGXjVc2q9uAq2fVCe5XubtaGOoqp9ecxCagENJ4jCK1s/uEIjWzatIX+lYVebWZB
	v3b/XluxGXy3V4T7tkcvLEhsXOcmTtwQJN+Oab5B9MQ8QIrWEhi7xVtT5yMEpy9s4fzRXGYCD9kP2
	YSIYKPDMUn39pOH221Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFbk-0000000CTiS-0MUU;
	Fri, 21 Aug 2026 03:07:52 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFbf-0000000CTi0-45Yr
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 03:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=UVfhlH8RPl8mLxnbENeeolyHySePF2K72r
	TkixCg3Pc=; b=kb9meUsJVc1IjzC0CBRQusCcZ3lxp3uKb7yqwdzr8HX65YASmN
	x6oSKqxEk+4H8p0VoEGW+1QktArA5MpPCN4XizvDeAzWOSdPrQkeD8JUqYAZ4/gw
	n90wiwPyt/PAYTl9YrSExZ/wXKKhZ7WjevpYfQhzKg6sXXXxH8rDUBoPk=
Received: from ur-dp1000 (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCn1s33wIdq26AAAA--.186S2;
	Fri, 21 Aug 2026 11:07:35 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xb@ultrarisc.com
Subject: [PATCH v2] riscv: Add native this_cpu_cmpxchg() support
Date: Fri, 21 Aug 2026 11:07:20 +0800
Message-ID: <20260821030720.532575-1-xb@ultrarisc.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <8b8cbb4a-474d-1de4-eaf2-dd8b4e6ca8ec@kernel.org>
References: <8b8cbb4a-474d-1de4-eaf2-dd8b4e6ca8ec@kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: AQAAfwCn1s33wIdq26AAAA--.186S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF17GFW5Ww1DKF4kCrW3ZFb_yoWrCrWDpa
	98ur95KrZxZF1xt3y3tF1kWwnxX3ykGF4Ikw18uF15JF4DtrykJrnIyFykZFykuFZ2vFyx
	uF9YvFyjka1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoWlkDUUUU
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAGB2qGcfoAPQABsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_200748_641759_469CF3A7 
X-CRM114-Status: GOOD (  15.20  )
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

RISC-V falls back to the generic this_cpu_cmpxchg() implementation,
which serializes the operation by disabling local interrupts.
Consequently, HAVE_CMPXCHG_LOCAL is unset and users such as
percpu_counter cannot use their cmpxchg-based fast paths.

Implement the 4-byte this_cpu_cmpxchg() operation with cmpxchg_local(),
and provide the 8-byte operation on RV64. Pin execution while resolving
the current CPU pointer so the LR/SC loop operates on one per-CPU
instance, while allowing interrupt-context updates to race through the
atomic operation.

Provide this_cpu_cmpxchg128() on RV64 when the kernel and toolchain support
the Zacas extension, using cmpxchg128_local().

Changes in v2:
- Add the RV64 Zacas-gated this_cpu_cmpxchg128() implementation.
- Rebase and test against latest upstream.

Copy the old and new values to private temporaries before invoking
cmpxchg_local(). This avoids collisions between local variable names in
nested statement-expression macros.

The 1- and 2-byte operations continue to use the generic fallback.

Select HAVE_CMPXCHG_LOCAL and update the architecture feature matrix.

Tested on latest upstream commit 7f063b2f17ea with GCC 15.2:
RV32 and RV64 builds of arch/riscv/kernel/ and lib/percpu_counter.o
pass, and an RV64 compile probe emits amocas.q for
this_cpu_cmpxchg128().

Signed-off-by: Xie Bo <xb@ultrarisc.com>
---
 .../locking/cmpxchg-local/arch-support.txt    |  2 +-
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/include/asm/percpu.h               | 49 +++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.txt b/Documentation/features/locking/cmpxchg-local/arch-support.txt
index 2c3a4b91f..28d5fa8c3 100644
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
index bf2e81d25..1f655a9a6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -155,6 +155,7 @@ config RISCV
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_BUILDTIME_MCOUNT_SORT
+	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 000000000..ab048b9c9
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,49 @@
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
+
+#if defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
+#define _protect_cmpxchg128_local(pcp, o, n)			\
+({								\
+	typeof(pcp) *__ptr;						\
+	typeof(pcp) __pcpu_old = (o);					\
+	typeof(pcp) __pcpu_new = (n);					\
+	typeof(pcp) __ret;						\
+	preempt_disable_notrace();					\
+	__ptr = raw_cpu_ptr(&(pcp));					\
+	__ret = cmpxchg128_local(__ptr, __pcpu_old, __pcpu_new);	\
+	preempt_enable_notrace();					\
+	__ret;							\
+})
+
+#define this_cpu_cmpxchg128(pcp, o, n)	\
+	_protect_cmpxchg128_local(pcp, o, n)
+#endif
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
