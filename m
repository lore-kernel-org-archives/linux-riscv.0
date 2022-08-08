Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18130C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/02XdVjf3FSMbevLW1fab+W+HxL6rfeavkljlAjKhCE=; b=iBABB9dTMY8i6d
	TgcOL3OIqFxUq+0H4bJNh2ROQ/2Yxs63qXLceR0FDVVZzLTcHqn1cj/ewhz2BurmtZHK93/v87Ion
	mwoFDvKgW4ncbhVgFmBylPaYg0UW4gGs9QAbAAiSUe+K14R9pLLi+F0vbnU5hFPDAspYfxx4JjmU1
	YjkjpfxVST2/OulgiH3ilUDavn8XSlK7d4oyr1hI4KLcCxddhWPct2O4tzN7ziNa6CcdpFw9TVlSw
	Hja6hbnmvsGoXGP0Fgpl0ZixCfKBznZrKOM3FKtWfPJaDTNxCWHE9UK5323J7sYz9XNUWK5PdfL8V
	rDyO2+Y5FdaraHQ0u8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwyh-00C2pR-CR; Mon, 08 Aug 2022 07:15:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwya-00C2hm-IJ
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:15:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C0C7560D58;
	Mon,  8 Aug 2022 07:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30D6C433C1;
	Mon,  8 Aug 2022 07:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659942899;
	bh=0ljJZLZfZy/Y0fH0ZoxhVUSYpr68jfPS8jFPFMXkooo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BpkrCBuSQNiyNibYspq9tJpW5U1Dz5aRnh30uX7shFTy2rLwBCQjRUTeU3KGH1pe8
	 Phzo8x8XEjfTl+bKPXd4ZVsu1b/SO8x6eV/FSilKmyT51PcZCNPdnfPoqxgx7dsvOG
	 hpbWB6GYvzCfrSlKDpENLSFoIwVXBA6n+AQhtpAC3CEJFTki4/vHDH+8ulNrlIgQTo
	 jV5Qq8edHxd/T+n++LqazyDcqMxH66+Sfr5AIGFSTWzRYIblueb+C9iRNQeUoocDOZ
	 IFwlLB1HsS5O5eQZzu0DcdV3NOUv3cfUrC2vyNVbsMfl+iq3EQh9yqQIujgpANJSgt
	 Iu6tT0IzS2Drg==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org,
	arnd@arndb.de,
	peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	shorne@gmail.com,
	conor.dooley@microchip.com
Cc: linux-csky@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Subject: [PATCH V9 14/15] openrisc: Move from ticket-lock to qspinlock
Date: Mon,  8 Aug 2022 03:13:17 -0400
Message-Id: <20220808071318.3335746-15-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808071318.3335746-1-guoren@kernel.org>
References: <20220808071318.3335746-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_001500_742918_8A889742 
X-CRM114-Status: GOOD (  12.49  )
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

Openrisc only has "l.lwa/l.swa" for all atomic operations. That means
its ll/sc pair should be a strong atomic forward progress guarantee, or
all atomic operations may cause live lock. The ticket-lock needs
atomic_fetch_add well defined forward progress guarantees under
contention, and qspinlock needs xchg16 forward progress guarantees. The
atomic_fetch_add (l.lwa + add + l.swa) & xchg16 (l.lwa + and + or +
l.swa) have similar implementations, so they has the same forward
progress guarantees.

The qspinlock is smaller and faster than ticket-lock when all is in
fast-path. No reason keep openrisc in ticket-lock not qspinlock. Here is
the comparison between qspinlock and ticket-lock in fast-path code
sizes (bytes):

TYPE			: TICKET | QUEUED
arch_spin_lock		: 128    | 96
arch_spin_unlock	: 56     | 44
arch_spin_trylock	: 108    | 80
arch_spin_is_locked	: 36     | 36
arch_spin_is_contended	: 36     | 36
arch_spin_value_unlocked: 28     | 28

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
---
 arch/openrisc/Kconfig               |  1 +
 arch/openrisc/include/asm/Kbuild    |  2 ++
 arch/openrisc/include/asm/cmpxchg.h | 25 +++++++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index c7f282f60f64..1652a6aac882 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -10,6 +10,7 @@ config OPENRISC
 	select ARCH_HAS_DMA_SET_UNCACHED
 	select ARCH_HAS_DMA_CLEAR_UNCACHED
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_USE_QUEUED_SPINLOCKS
 	select COMMON_CLK
 	select OF
 	select OF_EARLY_FLATTREE
diff --git a/arch/openrisc/include/asm/Kbuild b/arch/openrisc/include/asm/Kbuild
index c8c99b554ca4..ad147fec50b4 100644
--- a/arch/openrisc/include/asm/Kbuild
+++ b/arch/openrisc/include/asm/Kbuild
@@ -2,6 +2,8 @@
 generic-y += extable.h
 generic-y += kvm_para.h
 generic-y += parport.h
+generic-y += mcs_spinlock.h
+generic-y += qspinlock.h
 generic-y += spinlock_types.h
 generic-y += spinlock.h
 generic-y += qrwlock_types.h
diff --git a/arch/openrisc/include/asm/cmpxchg.h b/arch/openrisc/include/asm/cmpxchg.h
index df83b33b5882..2d650b07a0f4 100644
--- a/arch/openrisc/include/asm/cmpxchg.h
+++ b/arch/openrisc/include/asm/cmpxchg.h
@@ -65,6 +65,27 @@ static inline u32 cmpxchg32(volatile void *ptr, u32 old, u32 new)
 })
 
 /* xchg */
+static inline u32 xchg16(volatile void *ptr, u32 val)
+{
+	u32 ret, tmp;
+	u32 shif = ((ulong)ptr & 2) ? 16 : 0;
+	u32 mask = 0xffff << shif;
+	u32 *__ptr = (u32 *)((ulong)ptr & ~2);
+
+	__asm__ __volatile__(
+		"1:	l.lwa %0, 0(%2)		\n"
+		"	l.and %1, %0, %3	\n"
+		"	l.or  %1, %1, %4	\n"
+		"	l.swa 0(%2), %1		\n"
+		"	l.bnf 1b		\n"
+		"	 l.nop			\n"
+		: "=&r" (ret), "=&r" (tmp)
+		: "r"(__ptr), "r" (~mask), "r" (val << shif)
+		: "cc", "memory");
+
+	return (ret & mask) >> shif;
+}
+
 static inline u32 xchg32(volatile void *ptr, u32 val)
 {
 	__asm__ __volatile__(
@@ -85,6 +106,10 @@ static inline u32 xchg32(volatile void *ptr, u32 val)
 	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
+	case 2:								\
+		__ret = (__typeof__(*(ptr)))				\
+			xchg16(__ptr, (u32)__new);			\
+		break;							\
 	case 4:								\
 		__ret = (__typeof__(*(ptr)))				\
 			xchg32(__ptr, (u32)__new);			\
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
