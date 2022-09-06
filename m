Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32D9ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 03:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SbIROKnndE1V49JPkwM6IQVxFFhZCCMHFG4LP4S367g=; b=uxGLYJhjQhKo1z
	rkqVggtbirMm13QgbtFi4khRORpJMSR0kBUGT8pNfb6pBW2PdVTNj5NPuwO3QNW62+3589zFjbO10
	4pBhEuqyXmqpHWD3WeOQ2K36XZwm6A3WjEGz7WsSH5FBi3l4PZHMMTSfaEsSrsHcb2b2T1s2DSQK3
	rgwcZQ7iTo7CbdK273ZTe6zDBo2EOLLJ7fjpC+Oa9JkcN2VOe+wvlSdZzTzrh4vrSt3IMpmY2PTqz
	9DWKekpu9wHTU7JgcezzxuCzHEuQ7gd/bb67Ejho1GgeXYaFHLljcfkuMkNmgW0NYK9oPdfD6mp2N
	gaugDPe7QB8sLBK+zxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVPfe-003wdu-TA; Tue, 06 Sep 2022 03:54:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVPfb-003wCW-Vy
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 03:54:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CD672CE0A0C;
	Tue,  6 Sep 2022 03:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2C7C433C1;
	Tue,  6 Sep 2022 03:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662436475;
	bh=EQdZazAdpQa+R8r6QHYhsh3tG+kWaf7hmg/+UOoGj60=;
	h=From:To:Cc:Subject:Date:From;
	b=VInTuYLASiMmyDYMCPsmnfJ5cwbz1MIQZnEgeByMqQ+vnnPKM66mZsmfKzcTTsfZT
	 cVPBO/Ujglx/4sjXB8j2wN0LtkmLCw/Xpu1I1osURi5DI1RK86lNpPECrDiL1WfSpB
	 NRaAveRZiR0Fnj3hjxlP0PjHZ/YAhA976+7zd1lTYj3O70nmeT9kSlxeSsBIr21Yvk
	 c44kYb044dTUnE44P2UKROPeYTiDHqq0Ihch4J7MDQsYyVHujfSNlGe/Vw1rN8acE8
	 PQhV1+DN3SWgW/Yzsm9DLWuh7uDmHpE6mAYSxGn40On1YZ5mI5psCX27PRlS1xvloT
	 r6XptLtDHOURg==
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
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	bigeasy@linutronix.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 0/7] riscv: Add GENERIC_ENTRY, irq stack support
Date: Mon,  5 Sep 2022 23:54:16 -0400
Message-Id: <20220906035423.634617-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_205440_442401_DEDE1615 
X-CRM114-Status: GOOD (  12.15  )
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
feature for the IRQ_STACKS config. You can try it directly with [1].

[1] https://github.com/guoren83/linux/tree/generic_entry_v3

V3:
 - Fixup CONFIG_COMPAT=n compile error
 - Add THREAD_SIZE_ORDER config
 - Optimize elf_kexec.c warning fixup
 - Add static to irq_stack_ptr definition

V2:
 Link: https://lore.kernel.org/linux-riscv/20220904072637.8619-1-guoren@kernel.org/
 - Fixup compile error by include "riscv: ptrace: Remove duplicate
   operation"
 - Fixup compile warning
   Reported-by: kernel test robot <lkp@intel.com>
 - Add test repo link in cover letter

V1:
 Link: https://lore.kernel.org/linux-riscv/20220903163808.1954131-1-guoren@kernel.org/ 

Guo Ren (7):
  riscv: elf_kexec: Fixup compile warning
  riscv: compat_syscall_table: Fixup compile warning
  riscv: ptrace: Remove duplicate operation
  riscv: convert to generic entry
  riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
  riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
  riscv: Add config of thread stack size

 arch/riscv/Kconfig                    |  19 ++
 arch/riscv/include/asm/csr.h          |   1 -
 arch/riscv/include/asm/entry-common.h |   8 +
 arch/riscv/include/asm/irq.h          |   3 +
 arch/riscv/include/asm/ptrace.h       |  10 +-
 arch/riscv/include/asm/stacktrace.h   |   5 +
 arch/riscv/include/asm/syscall.h      |   6 +
 arch/riscv/include/asm/thread_info.h  |  19 +-
 arch/riscv/include/asm/vmap_stack.h   |  28 +++
 arch/riscv/kernel/Makefile            |   1 +
 arch/riscv/kernel/elf_kexec.c         |   2 +-
 arch/riscv/kernel/entry.S             | 255 +++++---------------------
 arch/riscv/kernel/irq.c               |  75 ++++++++
 arch/riscv/kernel/ptrace.c            |  41 -----
 arch/riscv/kernel/signal.c            |  21 +--
 arch/riscv/kernel/sys_riscv.c         |  27 +++
 arch/riscv/kernel/traps.c             |  11 ++
 arch/riscv/mm/fault.c                 |  12 +-
 18 files changed, 259 insertions(+), 285 deletions(-)
 create mode 100644 arch/riscv/include/asm/entry-common.h
 create mode 100644 arch/riscv/include/asm/vmap_stack.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
