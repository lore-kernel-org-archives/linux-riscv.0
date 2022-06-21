Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBCBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 14:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTSEm/Fh0GsJUMyXKX3Ef7bpVT7ARQpO3l0DlZo4uXY=; b=UPMc54bSyFHHTs
	MlCZM4jZhNYNeSC2049CM0hosp24qdlaD5zXjC/3xSAH3egfryERhwS2HDGn4KCw8Z8kdlzlbc8T+
	lbmY0fX6LSlCY4PbWdFsitiNSN54msNZnTeGZ9UJwunFpG2pinHwfwO2zUOceMDWBYhamkYV/Mp0l
	6ysweUNoBNyzKtY88rCvzfKD/Ys/xyrJB1wh6W/GcITdT/eYvJXgNlVWgTqa8PVTNNNgZ3eY+9Wdd
	JoiQWQ84uGPbAlKWxHH5rWvsExGwWu/usbmeJkTK5IgEQlg9+yUy5PjhcTwDlkYcPScj1pJ43bV/z
	q30EZur8wcfdyfs8K9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fCY-005yXK-5A; Tue, 21 Jun 2022 14:49:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fCU-005yVs-Lk
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 14:49:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 79CA3CE1A21;
	Tue, 21 Jun 2022 14:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41F7C341C6;
	Tue, 21 Jun 2022 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655822991;
	bh=EyNeRNlAcDveQFHhZSW52KHV2AvJzo7KCLMh5kztleU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=azjBuoUWoFfmCqiN+mAOEbU1HS1LJNHyNJLll2EsY1Gi8T+OF666Yab5NAkHdhfSn
	 yHOBYttnyBD9Cd6Cjr0+C79E99tHuDsNiPu6cOLCAKPejBv9D3zc9YCvYVLr//XRix
	 Hng1vfmOdOefuNiD6RzyZfHN2R400C6POuO/+1RUMstAsxmpaqewBK1e/9XAQqrYNi
	 wV74Xjasa5HOnAWwINf8hIylNgsw5PCzaRT5qRyhIWiO25LOPwsKKriB9I+hL2XhSU
	 8+eXCUHbPthKiKUyZNH7yQoTMoKGJalev4Ivm+hszMvy9ipk2Qy7aB1i7Yzxr5S9DB
	 fMNXmyKYDYUpA==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	arnd@arndb.de,
	peterz@infradead.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	Conor.Dooley@microchip.com,
	chenhuacai@loongson.cn,
	kernel@xen0n.name,
	r@hev.cc,
	shorne@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V6 2/2] riscv: Add qspinlock support
Date: Tue, 21 Jun 2022 10:49:20 -0400
Message-Id: <20220621144920.2945595-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621144920.2945595-1-guoren@kernel.org>
References: <20220621144920.2945595-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_074955_112142_90BE1CB2 
X-CRM114-Status: GOOD (  13.66  )
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
 arch/riscv/Kconfig               |  8 ++++++++
 arch/riscv/include/asm/Kbuild    |  2 ++
 arch/riscv/include/asm/cmpxchg.h | 17 +++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 32ffef9f6e5b..e1b57cb89189 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -333,6 +333,14 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
+config RISCV_USE_QUEUED_SPINLOCKS
+	bool "Using queued spinlock instead of ticket-lock"
+	depends on SMP && MMU
+	select ARCH_USE_QUEUED_SPINLOCKS
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
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
