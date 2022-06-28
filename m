Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E1DCCA485
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2SgenjTWlvhXa6pHt9FEL4B+4vg1gcJO2Umwr45Y3w=; b=ycWpDz1PiDRzXX
	3C3tYK9RlxSbViHNxeH12dplt31ErOpEy0lRcXet/O5EpTbTpnVCl+x01TE4mAhrUrdIrXLYUj7Zu
	VdnqlNd5wUqC6l1jbrI+mtL5tqNR8OoA2e+3n26JT7DxaQfSnLjG3V159fSXw0UmAmYBLpNKwhrZp
	P26z+eb+k16nobLiAPvDIgXKTEGFvW6W8fBwqvS5nPPxB3Yh/OdYSIw3oyJ389Y2vLitxQQFZuRAZ
	/8S4nrfkrVANMRzL6s5yRY5mUsElRI1iKbpsBEKFEdrohxBusiVvYG9HZslX5v8Ws5JGPz5bVUgwV
	kxnsBvJwgHPd3pi2FAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o66RU-005CSO-F6; Tue, 28 Jun 2022 08:19:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o66Pi-005BjT-QF
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 08:17:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 172216119B;
	Tue, 28 Jun 2022 08:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA11C341D2;
	Tue, 28 Jun 2022 08:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656404257;
	bh=JqFV7DDNcb2WtTvmttuWFUJZ9dF8mrvDgNDPOvXP7pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rZR/udrPjDgzmkasgazVKW71Q9L1U5Yjlg/JVDM6SdzaSlvUopcYpr9dc6xSEc31P
	 C+mks00E0l3UgLpbDgIPLOqcai4O+QxWFAQhWcTMiJP1t5fBVEwa3GWgtGhr9YRbPd
	 CRjt6CzzDbbB4bkTasOiEYyZWLNaneAphwHtNdfWOKlyR0sOvvNXOyyII5V6htUsQs
	 iKEq/BOVfrVj3oH7BfrqV0KM9XBNcte8NY4F5VaabAgy+SE9rhyOijzfCwgFHTRFnk
	 PWUUHOoFQsIY2lr2ZJVmVBp8bFroMD684CF9QeAIwOkizmECbLgbu4tne9RR52zoBR
	 t5f2o0RaYkDng==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	arnd@arndb.de,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH V7 5/5] riscv: Add qspinlock support
Date: Tue, 28 Jun 2022 04:17:07 -0400
Message-Id: <20220628081707.1997728-6-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628081707.1997728-1-guoren@kernel.org>
References: <20220628081707.1997728-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_011739_063952_C9E2E444 
X-CRM114-Status: GOOD (  14.38  )
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

Enable qspinlock by the requirements mentioned in a8ad07e5240c9
("asm-generic: qspinlock: Indicate the use of mixed-size atomics").

 - RISC-V atomic_*_release()/atomic_*_acquire() are implemented with
   own relaxed version plus acquire/release_fence for RCsc
   synchronization.

 - RISC-V LR/SC pairs could provide a strong/weak forward guarantee
   that depends on micro-architecture. And RISC-V ISA spec has given
   out several limitations to let hardware support strict forward
   guarantee (RISC-V User ISA - 8.3 Eventual Success of
   Store-Conditional Instructions). Some riscv cores such as BOOMv3
   & XiangShan could provide strict & strong forward guarantee (The
   cache line would be kept in an exclusive state for Backoff cycles,
   and only this core's interrupt could break the LR/SC pair).

 - RISC-V provides cheap atomic_fetch_or_acquire() with RCsc.

 - RISC-V only provides relaxed xchg16 to support qspinlock.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig               |  9 +++++++++
 arch/riscv/include/asm/Kbuild    |  2 ++
 arch/riscv/include/asm/cmpxchg.h | 17 +++++++++++++++++
 arch/riscv/kernel/setup.c        |  4 ++++
 4 files changed, 32 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 32ffef9f6e5b..47e12ab9c822 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -333,6 +333,15 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
+config RISCV_USE_QUEUED_SPINLOCKS
+	bool "Using queued spinlock instead of ticket-lock"
+	depends on SMP && MMU
+	select ARCH_USE_QUEUED_SPINLOCKS
+	default y
+	help
+	  Make sure your micro arch LL/SC has a strong forward progress guarantee.
+	  Otherwise, stay at ticket-lock.
+
 config RISCV_ALTERNATIVE
 	bool
 	depends on !XIP_KERNEL
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 504f8b7e72d4..2cce98c7b653 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -2,7 +2,9 @@
 generic-y += early_ioremap.h
 generic-y += flat.h
 generic-y += kvm_para.h
+generic-y += mcs_spinlock.h
 generic-y += parport.h
+generic-y += qspinlock.h
 generic-y += spinlock.h
 generic-y += spinlock_types.h
 generic-y += qrwlock.h
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 12debce235e5..492104d45a23 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -17,6 +17,23 @@
 	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
+	case 2: { 							\
+		u32 temp;						\
+		u32 shif = ((ulong)__ptr & 2) ? 16 : 0;			\
+		u32 mask = 0xffff << shif;				\
+		__ptr = (__typeof__(ptr))((ulong)__ptr & ~(ulong)2);	\
+		__asm__ __volatile__ (					\
+			"0:	lr.w %0, %2\n"				\
+			"	and  %1, %0, %z3\n"			\
+			"	or   %1, %1, %z4\n"			\
+			"	sc.w %1, %1, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			: "=&r" (__ret), "=&r" (temp), "+A" (*__ptr)	\
+			: "rJ" (~mask), "rJ" (__new << shif)		\
+			: "memory");					\
+		__ret = (__ret & mask) >> shif;				\
+		break;							\
+	}								\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"	amoswap.w %0, %2, %1\n"			\
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f0f36a4a0e9b..b9b234157a66 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -295,6 +295,10 @@ void __init setup_arch(char **cmdline_p)
 	setup_smp();
 #endif
 
+#if !defined(CONFIG_NUMA) && defined(CONFIG_QUEUED_SPINLOCKS)
+	static_branch_disable(&use_qspinlock_key);
+#endif
+
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
 }
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
