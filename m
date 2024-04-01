Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC877CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 21:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVMDuC3qsMulw7T3VdpoHlxbDqowKDnHxyg8E5yQPyM=; b=DneDaU91MA0Sg+
	rnyfehPTtMcXXl305Jj7gR8UtPeRFw/DMsvl4/bEcSgSLOySwYdSG5tL0jvyoYWnVOZh+XOZi68ve
	4d3ENazo/VTT398xD0U77y9f5GUdwBenC5z2UnaSqNgSjU/uURjSSaYaQ8oKL3NC2VEoutgFCvIpR
	mDbZp/DpnnI6b2l+z8BM+RJTDr6+N7sQ2x0H+uEQMCp50ecoTdIYa0UHMEySglJ7bymIXEXLCLSTX
	bWgnibfEm0oYBgLIQIuP1qeKJuAez1Nh/9k5E2o08XX/WpF+0w8vgUfVSMycZibsfiCmths92BGn0
	F87dygEbsU1rVM+x2iqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrPNo-00000008ujB-2S98;
	Mon, 01 Apr 2024 21:40:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrPNk-00000008uh2-1p1E
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 21:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D83EC60E74;
	Mon,  1 Apr 2024 21:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC9DC41674;
	Mon,  1 Apr 2024 21:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712007595;
	bh=cHdjMWF2pKpjp1cSSio1TIEvF/d3v3dy9dZ8dApGZaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRjGv/+gDSEbG4K6K0NV7MmU0QufJtVBYBfxeKyOQa0h0evV+yct5bBRhoMQSPCMP
	 XDRZmN2Q2pb7o9OYst/ZZnhP3K5xDW7pk44v4JOxwr4VbVkbO5sBbK541XzK7IWXMk
	 pXBVXdoF4cxiWsNPVZwjs4XFjDhVLYvN1G/Gc5NVJrK/HRrlrxizsJ33IyuBJBraTt
	 jOv64zBDQ/UT9nD2WhwhbL4C5Nz0/bvECe1F1YsTvCotZG8uG6rZQo0/ghkTS7kgdr
	 6fHuxnq+I1XegKXRmh+QS/do3AO8kEqEYwmIvblcphWI1Hu4Tcnvt3vJyEL+HwUjQs
	 ZF6d+P70ZxP2Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CD0D4CE16EF; Mon,  1 Apr 2024 14:39:54 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC cmpxchg 8/8] riscv: Emulate one-byte and two-byte cmpxchg
Date: Mon,  1 Apr 2024 14:39:50 -0700
Message-Id: <20240401213950.3910531-8-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <31c82dcc-e203-48a9-aadd-f2fcd57d94c1@paulmck-laptop>
References: <31c82dcc-e203-48a9-aadd-f2fcd57d94c1@paulmck-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_143956_577699_9FDC077D 
X-CRM114-Status: GOOD (  10.69  )
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

Use the new cmpxchg_emu_u8() and cmpxchg_emu_u16() to emulate one-byte
and two-byte cmpxchg() on riscv.

[ paulmck: Apply kernel test robot feedback. ]

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: <linux-riscv@lists.infradead.org>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/cmpxchg.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56b..4eaf40d0a52ec 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -44,6 +44,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_DATA
 	select ARCH_KEEP_MEMBLOCK if ACPI
+	select ARCH_NEED_CMPXCHG_1_2_EMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2fee65cc84432..a5b377481785c 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 
 #include <asm/fence.h>
+#include <linux/cmpxchg-emu.h>
 
 #define __xchg_relaxed(ptr, new, size)					\
 ({									\
@@ -170,6 +171,12 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		break;							\
+	case 2:								\
+		break;							\
+		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
@@ -214,6 +221,12 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		break;							\
+	case 2:								\
+		break;							\
+		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
@@ -260,6 +273,12 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		break;							\
+	case 2:								\
+		break;							\
+		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
 	case 4:								\
 		__asm__ __volatile__ (					\
 			RISCV_RELEASE_BARRIER				\
@@ -306,6 +325,12 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		break;							\
+	case 2:								\
+		break;							\
+		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
