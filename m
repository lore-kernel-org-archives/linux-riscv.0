Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DCAC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zP+hMqSn/nXFC9hEdYZQym45ETx/dZGqFBzroyluNE=; b=DGUaH1VS/P7F2Y
	ZbHn9tn2EH+/hzbdw5ZwU6TDvnhAvA+9Ssy0Ax/xhEk8yEhl/4ArWd/WFJBWzF8LwK/EUcfbzMRBA
	X3lkSE+I0bi/X8pCWa7sO+deplAP/gy7aoGiWVRbckIRj5pdDwf3CL744gNpsU6+HC+Eh0MdsASOn
	Awg6j46ddFU/rGLK1yl3DJ6/vCf3hxcIN+D0DMPQIRDbwu3ObXf6YZQ3jv0n7WnVAN6iCuH0Q/orv
	sIbQu6S0AagwYqBJmhDKdlbVIYzFQhDMcUECtm/F3uAIiDlPPMqCtsMQm3DmjA+Kz4OldiWKx7bSr
	AfyGInn9ECW8aGcbQJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdSG-00D39L-0c;
	Thu, 18 May 2023 13:14:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdSD-00D37w-3A
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:14:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 848A264F5E;
	Thu, 18 May 2023 13:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AA5C433A8;
	Thu, 18 May 2023 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415640;
	bh=1Q2OacXMgaOE1GaE82tcNP9mKmi++bzDbv1pyxwUhQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E58RuOsyjDm0MSwqlPq2VfQw6WjfUgQVPzQemHtJ/mDL9a2shJvWKDryIjGnpK05X
	 keC8NjhdHnpy5I71eEfiJMFTPpQ9k5iHl3josQCI8r9MZd8+adNza+aDLARO/5KGe9
	 dfE1rnK/7jCAE14U89IFb5B2/CfJWk2VmHkFbSFBjUh2RrwjpzbTp6U2XVScSw7FU2
	 6kroejxVAfIp7cjFoeQUkSdcjdkCbm3o09VBhCychkxxAxmdcZEIVz+GbgrEWHJyZi
	 lMVRCRRErqxFb1hO5UmUj+ne/WYlU1JkFaxd1vrwKijk1neFq97kvrWVhX0neSaJ7D
	 PBW6h3qYogesg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 17/22] riscv: s64ilp32: Implement cmpxchg_double
Date: Thu, 18 May 2023 09:10:08 -0400
Message-Id: <20230518131013.3366406-18-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061402_106965_A1F89A87 
X-CRM114-Status: GOOD (  13.79  )
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

The s64ilp32 has the ability to exclusively load and store (ld/sd)
a pair of words from an address. Then the SLUB can take advantage
of a cmpxchg_double implementation to avoid taking some locks.

This patch provides an implementation of cmpxchg_double for 64-bit
pairs, and activates the logic required for the SLUB to use these
functions (HAVE_ALIGNED_STRUCT_PAGE and HAVE_CMPXCHG_DOUBLE).

Similar commit: 5284e1b4bc8a ("arm64: xchg: Implement
cmpxchg_double")

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig               |  2 ++
 arch/riscv/include/asm/cmpxchg.h | 53 ++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e0c3dee68510..51853f883fc5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -78,6 +78,7 @@ config RISCV
 	select GENERIC_TIME_VSYSCALL if MMU
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
+	select HAVE_ALIGNED_STRUCT_PAGE if SLUB && ARCH_RV64ILP32
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT && !XIP_KERNEL
@@ -96,6 +97,7 @@ config RISCV
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CMPXCHG_DOUBLE if ARCH_RV64ILP32
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 12debce235e5..808730d151e7 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_CMPXCHG_H
 
 #include <linux/bug.h>
+#include <linux/mmdebug.h>
 
 #include <asm/barrier.h>
 #include <asm/fence.h>
@@ -360,4 +361,56 @@
 	arch_cmpxchg_relaxed((ptr), (o), (n));				\
 })
 
+#ifdef CONFIG_ARCH_RV64ILP32
+#define system_has_cmpxchg_double()	1
+
+#define __cmpxchg_double_check(ptr1, ptr2)				\
+({									\
+	if (sizeof(*(ptr1)) != 4)					\
+		BUILD_BUG();						\
+	if (sizeof(*(ptr2)) != 4)					\
+		BUILD_BUG();						\
+	VM_BUG_ON((ulong *)(ptr2) - (ulong *)(ptr1) != 1);		\
+	VM_BUG_ON(((ulong)ptr1 & 0x7) != 0);				\
+})
+
+#define __cmpxchg_double(old1, old2, new1, new2, ptr)			\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	register unsigned int __ret;					\
+	u64 __old;							\
+	u64 __new;							\
+	u64 __tmp;							\
+	switch (sizeof(*(ptr))) {					\
+	case 4:								\
+		__old = ((u64)old2 << 32) | (u64)old1;			\
+		__new = ((u64)new2 << 32) | (u64)new1;			\
+		__asm__ __volatile__ (					\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__tmp), "=&r" (__ret), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		__ret = (__old == __tmp);				\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+	__ret;								\
+})
+
+#define arch_cmpxchg_double(ptr1, ptr2, o1, o2, n1, n2)			\
+({									\
+	int __ret;							\
+	__cmpxchg_double_check(ptr1, ptr2);				\
+	__ret = __cmpxchg_double((ulong)(o1), (ulong)(o2),		\
+				 (ulong)(n1), (ulong)(n2),		\
+				  ptr1);				\
+	__ret;								\
+})
+#endif
+
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
