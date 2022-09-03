Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CD3ECAAD4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BFDDstGYImz2BT3lMWhJeUX4lPrsOiq2zbsiBwzUz2c=; b=4MR6UOSgAsFPSq
	jUYlud0aF9bRxByasqzkkFUZxaO7rLeF0xWHwGzy1ATvbjJhHEjGXvTBO15z5i/hrvRMxhi+PK49u
	a+0qt1TALx4kwLsfUHqRxTRZ0enR3bVqnlIUPhKEEFg7V15KFotz9EePswfBnZ1A15BB6tR3AYK8d
	c+itbykAsvoId+YAr+YenzEDVja5oY/iOw/DeAc3JryQVMHfW/L9DCGFVLR3FR9Mwx5ULlsCEM+DH
	acQ1fW2/NqKRoQAiNddd4G4CQZAf9j6KhE/7sCof/I9YNIsYMokLCpX9KdDvA9H4dDOVLY3QzLYrj
	KdC8O6fC0q5pWwF1E4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUWA5-00DjjW-3S; Sat, 03 Sep 2022 16:38:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUWA2-00DjhD-M2
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 16:38:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3BD7B80AFF;
	Sat,  3 Sep 2022 16:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2258C433D6;
	Sat,  3 Sep 2022 16:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662223099;
	bh=nhcHi1pAXvIK/aBrMWnrTnqIPWHvUnNgnjUh9wJ8cJo=;
	h=From:To:Cc:Subject:Date:From;
	b=s1J9Gka30TmWDOqBBdOBbNBWtSV06/OLcATRNq7s9VfJuQQ+qVoGcXLa+r1SNziSY
	 jGs3snAugGWGRulbNwtE+KZAUxMJBBuTwQRPTRgTNGayVjJE5g5x9MduxStuNQ3nPU
	 CdK4pM1THSTlod/s0RlDXTnu0kNAsG9H+ODCIF8MGYQ12kud7T7R85lybjZoJkjhHf
	 3QvhFFwOlNDCC52OU6/rSvY+f4fcGy4P/nWHuS0pvo0ktJkUEuxGYbydRi9LfqlgOz
	 GMbhIP+fKIkda/V/+IYhA+rS7Y8afMzVEtz7Hj6B5tuoHaABrp5AHG741uUsGnwgmQ
	 kcSDUCcq/iUIg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 0/3] riscv: Add GENERIC_ENTRY & IRQ_STACKS support
Date: Sat,  3 Sep 2022 12:38:05 -0400
Message-Id: <20220903163808.1954131-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_093822_889889_542AF88D 
X-CRM114-Status: GOOD (  11.28  )
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

The patches convert riscv to use the generic entry infrastructure from
kernel/entry/*. Add independent irq stacks (IRQ_STACKS) for percpu to
prevent kernel stack overflows. Add the HAVE_SOFTIRQ_ON_OWN_STACK
feature for the IRQ_STACKS config.

Guo Ren (3):
  riscv: convert to generic entry
  riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
  riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK

 arch/riscv/Kconfig                    |  10 +
 arch/riscv/include/asm/csr.h          |   1 -
 arch/riscv/include/asm/entry-common.h |   8 +
 arch/riscv/include/asm/irq.h          |   2 +
 arch/riscv/include/asm/ptrace.h       |  10 +-
 arch/riscv/include/asm/stacktrace.h   |   5 +
 arch/riscv/include/asm/syscall.h      |   5 +
 arch/riscv/include/asm/thread_info.h  |  15 +-
 arch/riscv/include/asm/vmap_stack.h   |  28 +++
 arch/riscv/kernel/entry.S             | 255 +++++---------------------
 arch/riscv/kernel/irq.c               |  74 ++++++++
 arch/riscv/kernel/ptrace.c            |  40 ----
 arch/riscv/kernel/signal.c            |  20 +-
 arch/riscv/kernel/sys_riscv.c         |  26 +++
 arch/riscv/kernel/traps.c             |  11 ++
 arch/riscv/mm/fault.c                 |  12 +-
 16 files changed, 241 insertions(+), 281 deletions(-)
 create mode 100644 arch/riscv/include/asm/entry-common.h
 create mode 100644 arch/riscv/include/asm/vmap_stack.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
