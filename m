Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A672DEEB581
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaqaoYATuQTZPAhv08ZY7v1CUUhIGT/F4INtKKyZ58M=; b=uwYhOlb1cYDNlp
	B0CfqBft7sbvpoHXiFVwBMOSY/Fq+QafnG2+G1E+LwqdO//nZBwat5XFiMVPOuO8T45OKvgbpc0XD
	KG+nsgBYdwS7zc9v1CQA2LiLardKAvUrx0jYka4HHABoq/54SegmAUpyZoQqlaW+17KFSRsUiO4u2
	CTYHor1YwYcz2JBRpf4QFUiUNVPCii4Kdn8M0OaPiDJgvwiL8xAcF7nnzzn6PKdOlcbQlKwSWvxkk
	3knWE2P5EGf145osnRtnfP6aryhirHgxPlRTIWmv4oZS+y6X+s8vGg/8cXaqHTDXadboCY6ZjROpa
	BHMzbtsl3F/EpP9iO7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqC-00GHjH-2f;
	Sun, 10 Sep 2023 08:30:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFq9-00GHhk-2r
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:30:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65B2660C34;
	Sun, 10 Sep 2023 08:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53691C433CA;
	Sun, 10 Sep 2023 08:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694334644;
	bh=beXd/IVecz7TWfZ1o1vVfgkat9gjWh6TojSXwShn+Fs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lw8mWyH1Wj5Bp+aLA3Jt3V19kTg+0ySS5A03IqS68yHWCUwq+AgSThFxwuHwCXuvN
	 tzhiTtdDq2b+MvQ9ip6np9IQLnQmSxIupkB4VpLps+8LaO+cksqfyxqWC4a7hksP+1
	 ZaJ5eskfyJh1ledR/St6b5kIAXDXXS2bwNJ1YwlMprljDlaOstKACijaXwBFxe4BzN
	 nhlRa+aX2As7LN0ruPacVqwGDlEE5HGMbEJ/+BXZb7pPM79VAS6vPwlJ1vnEWEu+aF
	 0kH+Xa8q0icePxqjOSdXOXh8bbfBRL0kj0UaAMSIN2og10VuFNSrDNdzTGwwF9ZMps
	 TEwdp0UqEx5Gw==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	anup@brainfault.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	palmer@rivosinc.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	tglx@linutronix.de,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	rdunlap@infradead.org,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	keescook@chromium.org,
	greentime.hu@sifive.com,
	ajones@ventanamicro.com,
	jszhang@kernel.org,
	wefu@redhat.com,
	wuwei2016@iscas.ac.cn,
	leobras@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V11 06/17] riscv: qspinlock: Introduce combo spinlock
Date: Sun, 10 Sep 2023 04:29:00 -0400
Message-Id: <20230910082911.3378782-7-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_013046_005467_F5F99A2B 
X-CRM114-Status: GOOD (  14.21  )
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

Combo spinlock could support queued and ticket in one Linux Image and
select them during boot time via errata mechanism. Here is the func
size (Bytes) comparison table below:

TYPE			: COMBO | TICKET | QUEUED
arch_spin_lock		: 106	| 60     | 50
arch_spin_unlock	: 54    | 36     | 26
arch_spin_trylock	: 110   | 72     | 54
arch_spin_is_locked	: 48    | 34     | 20
arch_spin_is_contended	: 56    | 40     | 24
rch_spin_value_unlocked	: 48    | 34     | 24

One example of disassemble combo arch_spin_unlock:
   0xffffffff8000409c <+14>:    nop                # detour slot
   0xffffffff800040a0 <+18>:    fence   rw,w       # queued spinlock start
   0xffffffff800040a4 <+22>:    sb      zero,0(a4) # queued spinlock end
   0xffffffff800040a8 <+26>:    ld      s0,8(sp)
   0xffffffff800040aa <+28>:    addi    sp,sp,16
   0xffffffff800040ac <+30>:    ret
   0xffffffff800040ae <+32>:    lw      a5,0(a4)   # ticket spinlock start
   0xffffffff800040b0 <+34>:    sext.w  a5,a5
   0xffffffff800040b2 <+36>:    fence   rw,w
   0xffffffff800040b6 <+40>:    addiw   a5,a5,1
   0xffffffff800040b8 <+42>:    slli    a5,a5,0x30
   0xffffffff800040ba <+44>:    srli    a5,a5,0x30
   0xffffffff800040bc <+46>:    sh      a5,0(a4)   # ticket spinlock end
   0xffffffff800040c0 <+50>:    ld      s0,8(sp)
   0xffffffff800040c2 <+52>:    addi    sp,sp,16
   0xffffffff800040c4 <+54>:    ret

The qspinlock is smaller and faster than ticket-lock when all are in
fast-path, and combo spinlock could provide a compatible Linux Image
for different micro-arch design (weak/strict fwd guarantee LR/SC)
processors.

Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/Kconfig                |  9 +++-
 arch/riscv/include/asm/spinlock.h | 78 ++++++++++++++++++++++++++++++-
 arch/riscv/kernel/setup.c         | 14 ++++++
 3 files changed, 98 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7f39bfc75744..4bcff2860f48 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -473,7 +473,7 @@ config NODES_SHIFT
 
 choice
 	prompt "RISC-V spinlock type"
-	default RISCV_TICKET_SPINLOCKS
+	default RISCV_COMBO_SPINLOCKS
 
 config RISCV_TICKET_SPINLOCKS
 	bool "Using ticket spinlock"
@@ -485,6 +485,13 @@ config RISCV_QUEUED_SPINLOCKS
 	help
 	  Make sure your micro arch LL/SC has a strong forward progress guarantee.
 	  Otherwise, stay at ticket-lock.
+
+config RISCV_COMBO_SPINLOCKS
+	bool "Using combo spinlock"
+	depends on SMP && MMU
+	select ARCH_USE_QUEUED_SPINLOCKS
+	help
+	  Select queued spinlock or ticket-lock via errata.
 endchoice
 
 config RISCV_ALTERNATIVE
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index c644a92d4548..8ea0fee80652 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -7,11 +7,85 @@
 #define _Q_PENDING_LOOPS	(1 << 9)
 #endif
 
+#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
+#include <asm-generic/ticket_spinlock.h>
+
+#undef arch_spin_is_locked
+#undef arch_spin_is_contended
+#undef arch_spin_value_unlocked
+#undef arch_spin_lock
+#undef arch_spin_trylock
+#undef arch_spin_unlock
+
+#include <asm-generic/qspinlock.h>
+#include <linux/jump_label.h>
+
+#undef arch_spin_is_locked
+#undef arch_spin_is_contended
+#undef arch_spin_value_unlocked
+#undef arch_spin_lock
+#undef arch_spin_trylock
+#undef arch_spin_unlock
+
+DECLARE_STATIC_KEY_TRUE(combo_qspinlock_key);
+
+static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
+{
+	if (static_branch_likely(&combo_qspinlock_key))
+		queued_spin_lock(lock);
+	else
+		ticket_spin_lock(lock);
+}
+
+static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
+{
+	if (static_branch_likely(&combo_qspinlock_key))
+		return queued_spin_trylock(lock);
+	else
+		return ticket_spin_trylock(lock);
+}
+
+static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
+{
+	if (static_branch_likely(&combo_qspinlock_key))
+		queued_spin_unlock(lock);
+	else
+		ticket_spin_unlock(lock);
+}
+
+static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
+{
+	if (static_branch_likely(&combo_qspinlock_key))
+		return queued_spin_value_unlocked(lock);
+	else
+		return ticket_spin_value_unlocked(lock);
+}
+
+static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
+{
+	if (static_branch_likely(&combo_qspinlock_key))
+		return queued_spin_is_locked(lock);
+	else
+		return ticket_spin_is_locked(lock);
+}
+
+static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
+{
+	if (static_branch_likely(&combo_qspinlock_key))
+		return queued_spin_is_contended(lock);
+	else
+		return ticket_spin_is_contended(lock);
+}
+#else /* CONFIG_RISCV_COMBO_SPINLOCKS */
+
 #ifdef CONFIG_QUEUED_SPINLOCKS
 #include <asm/qspinlock.h>
-#include <asm/qrwlock.h>
 #else
-#include <asm-generic/spinlock.h>
+#include <asm-generic/ticket_spinlock.h>
 #endif
 
+#endif /* CONFIG_RISCV_COMBO_SPINLOCKS */
+
+#include <asm/qrwlock.h>
+
 #endif /* __ASM_RISCV_SPINLOCK_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 32c2e1eb71bd..a447cf360a18 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -269,6 +269,18 @@ static void __init parse_dtb(void)
 #endif
 }
 
+#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
+DEFINE_STATIC_KEY_TRUE(combo_qspinlock_key);
+EXPORT_SYMBOL(combo_qspinlock_key);
+#endif
+
+static void __init riscv_spinlock_init(void)
+{
+#ifdef CONFIG_RISCV_COMBO_SPINLOCKS
+	static_branch_disable(&combo_qspinlock_key);
+#endif
+}
+
 extern void __init init_rt_signal_env(void);
 
 void __init setup_arch(char **cmdline_p)
@@ -317,6 +329,8 @@ void __init setup_arch(char **cmdline_p)
 	    riscv_isa_extension_available(NULL, ZICBOM))
 		riscv_noncoherent_supported();
 	riscv_set_dma_cache_alignment();
+
+	riscv_spinlock_init();
 }
 
 static int __init topology_init(void)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
