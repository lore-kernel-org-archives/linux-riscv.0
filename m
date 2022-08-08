Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BA4C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1cN+0Sz+0baAU9ELQS/f6EtFFex0v2ZaSuR46kP2eHE=; b=klKMo2mZWiqS/A
	EAA4TFufvWgeJdUnl94p7SdBnyth+e1t/8JkVGriuVxaW/NC2bOpqMY3kFMcDhH9AgYQT9mbOdb16
	xlBvkVXlVpV3R20LDAXNZ01+3gM27MOrGma9dIjzWkSbdqDNzHCbQeztUJhHLNkw7gcGcvpSVdslK
	MNKwXqpiPtQyb3+ZBIcUaqD/4yVCfgzcuqRQreQTghN99Z1gNzC0Od9qkAHZWH/7noB+G4FnXz6cW
	fIhSMVdQ9aCfLQi0qt6nh5Vn0WO5eEu4T3mDiaTA355Kz6Gpa0383HnZGKJAPtb3I7X4PLJ/G7PU4
	H/XKXux2vq4cwyGk3pJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwxO-00C1Zp-QR; Mon, 08 Aug 2022 07:13:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwxM-00C1WM-1S
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:13:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9573DB80DD7;
	Mon,  8 Aug 2022 07:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76568C433D6;
	Mon,  8 Aug 2022 07:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659942818;
	bh=mp7IlNGuC/mEeBlxm+TFmON4y1tQUocDWgcQyAy5k2Q=;
	h=From:To:Cc:Subject:Date:From;
	b=DiuuBcyVYaTX3T3cqhBu0StXLE+g8PiCN3zuRNn1XijfnR+rny0forVTFI/RVUMNr
	 c9m+LgHDqQv79MTlVHjFDyj0sAXPH6CGYLlXDvBq2WdxbitT5MZ/lWa//F9blFQArY
	 J+U6d/v/hOEWUG5W45hXqZ9W/2uRWVgxWmOP0Qpn5j/pGIACrMwQA9dl95da7Pp7bq
	 TRJQ//iMi5kVeBew0P39u2XyLYYisW6kzbAnX0fa6Fz5pk6Ih3hTw0CwIYbtS5v0uc
	 c0ucRlvJyGr3j6XlOGTxfkKVII+/yvungk2ze18j7j/jSNs6Nq10aedthG225TjTh+
	 qxXB7C3bJmUIw==
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
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V9 00/15] arch: Add qspinlock support and atomic cleanup
Date: Mon,  8 Aug 2022 03:13:03 -0400
Message-Id: <20220808071318.3335746-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_001344_412940_DFC3BD29 
X-CRM114-Status: GOOD (  12.71  )
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

In this series:
 - Cleanup generic ticket-lock code, (Using smp_mb__after_spinlock as RCsc)
 - Add qspinlock and combo-lock for riscv
 - Add qspinlock to openrisc
 - Use generic header in csky
 - Optimize cmpxchg & atomic code

Enable qspinlock and meet the requirements mentioned in a8ad07e5240c9
("asm-generic: qspinlock: Indicate the use of mixed-size atomics").

RISC-V LR/SC pairs could provide a strong/weak forward guarantee that
depends on micro-architecture. And RISC-V ISA spec has given out
several limitations to let hardware support strict forward guarantee
(RISC-V User ISA - 8.3 Eventual Success of Store-Conditional
Instructions).

eg:
Some riscv hardware such as BOOMv3 & XiangShan could provide strict &
strong forward guarantee (The cache line would be kept in an exclusive
state for Backoff cycles, and only this core's interrupt could break
the LR/SC pair).
Qemu riscv give a weak forward guarantee by wrong implementation
currently [1].

So we Add combo spinlock (ticket & queued) support for riscv. Thus different
kinds of memory model micro-arch processors could use the same Image

The first try of qspinlock for riscv was made in 2019.1 [2].

[1] https://github.com/qemu/qemu/blob/master/target/riscv/insn_trans/trans_rva.c.inc
[2] https://lore.kernel.org/linux-riscv/20190211043829.30096-1-michaeljclark@mac.com/#r

Guo Ren (15):
  asm-generic: ticket-lock: Remove unnecessary atomic_read
  asm-generic: ticket-lock: Use the same struct definitions with qspinlock
  asm-generic: ticket-lock: Move into ticket_spinlock.h
  asm-generic: ticket-lock: Keep ticket-lock the same semantic with qspinlock
  asm-generic: spinlock: Add queued spinlock support in common header
  riscv: atomic: Clean up unnecessary acquire and release definitions
  riscv: cmpxchg: Remove xchg32 and xchg64
  riscv: cmpxchg: Forbid arch_cmpxchg64 for 32-bit
  riscv: cmpxchg: Optimize cmpxchg64
  riscv: Enable ARCH_INLINE_READ*/WRITE*/SPIN*
  riscv: Add qspinlock support
  riscv: Add combo spinlock support
  openrisc: cmpxchg: Cleanup unnecessary codes
  openrisc: Move from ticket-lock to qspinlock
  csky: spinlock: Use the generic header files

 arch/csky/include/asm/Kbuild           |   2 +
 arch/csky/include/asm/spinlock.h       |  12 --
 arch/csky/include/asm/spinlock_types.h |   9 --
 arch/openrisc/Kconfig                  |   1 +
 arch/openrisc/include/asm/Kbuild       |   2 +
 arch/openrisc/include/asm/cmpxchg.h    | 192 ++++++++++---------------
 arch/riscv/Kconfig                     |  49 +++++++
 arch/riscv/include/asm/Kbuild          |   3 +-
 arch/riscv/include/asm/atomic.h        |  19 ---
 arch/riscv/include/asm/cmpxchg.h       | 177 +++++++----------------
 arch/riscv/include/asm/spinlock.h      |  77 ++++++++++
 arch/riscv/kernel/setup.c              |  22 +++
 include/asm-generic/spinlock.h         |  94 ++----------
 include/asm-generic/spinlock_types.h   |  12 +-
 include/asm-generic/ticket_spinlock.h  |  93 ++++++++++++
 15 files changed, 384 insertions(+), 380 deletions(-)
 delete mode 100644 arch/csky/include/asm/spinlock.h
 delete mode 100644 arch/csky/include/asm/spinlock_types.h
 create mode 100644 arch/riscv/include/asm/spinlock.h
 create mode 100644 include/asm-generic/ticket_spinlock.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
