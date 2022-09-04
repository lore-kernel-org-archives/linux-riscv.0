Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3C0C6FA82
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 07:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VGdaaxtXfWyIOv8/waDabyJH8egrB9ny2iE+HlafMBo=; b=ajval6pJNypPZu
	lrt2G8I8oo+2qVWrxRJ8FzzkN30i96AA5NkNIzpXX9e8d2oqIpMHD3urkO06cEoyuKekTkmsO+9e5
	hFhC05YDEOqtih795Osi1mRKtuvvip9w1zGhJamHJHH+KHpaE4tmJf8PMs3FctJ6vKPApHdm3wE0y
	h283YjYUt7TW6fROaQFp2EbSYaIyUVsEeZJKxUOMout7hek0g4DP4BTcYxfFagVwjDFyKhdMcBlsE
	mcaghRbYbYeOZkbSzg83vZ1HSJX5RV9rMgbJJ9ENdgJryZTSCX3b5uCR9J6PzVmJeSXAoUci7AZWb
	hfBLPmmB+zwc9nJfQ8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUk2L-00HOKj-FL; Sun, 04 Sep 2022 07:27:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUk2J-00HOK2-8Z
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 07:27:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 099FFB80D2D;
	Sun,  4 Sep 2022 07:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E68DC433D6;
	Sun,  4 Sep 2022 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662276432;
	bh=Ch23AYNtyFVoUZ3rSTNSj6dwqtU+Er2LgcLRrNLkFPA=;
	h=From:To:Cc:Subject:Date:From;
	b=qrbRku5mHXR59ThJPg6vRzifYd9nBFm/gjPCPVslkuW7mcC5E4SEuhAE06FS2A20y
	 8Rbaq9hblTYfQmzCHKTem8c/cHZu+SiMs8/Ir7+WG0cBMu/kvNOJIdqYFKjMp+/u+m
	 UyzOB5YfSdP46zf5ww/esW8HKA3qeaOvihlQss+z3Kzh8nMfyPBfHjoCTLFOShWFMQ
	 CTAcGBPiB65y89jEaIZINeWbchR/s893whkQCRj/iMkvc+DIDMFCZW2I/eexkYQWJ+
	 u2wMltVUGh+niStNVvgWxPK+1rVSBvIf1Y7R4szS0XXfvIZfKEWw7Pzs2xiCOE+C00
	 VsqaBxarLwb7A==
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
	paul.walmsley@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/6] riscv: Add GENERIC_ENTRY, IRQ_STACKS support
Date: Sun,  4 Sep 2022 03:26:31 -0400
Message-Id: <20220904072637.8619-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_002719_454697_F2A3F81B 
X-CRM114-Status: GOOD (  12.01  )
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

[1] https://github.com/guoren83/linux/tree/generic_entry_v2

Changes in V2:
 - Fixup compile error by include "riscv: ptrace: Remove duplicate
   operation"
   https://lore.kernel.org/linux-riscv/20220903162328.1952477-2-guoren@kernel.org/T/#u
 - Fixup compile warning
   Reported-by: kernel test robot <lkp@intel.com>
 - Add test repo link in cover letter

Guo Ren (6):
  riscv: ptrace: Remove duplicate operation
  riscv: convert to generic entry
  riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
  riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
  riscv: elf_kexec: Fixup compile warning
  riscv: compat_syscall_table: Fixup compile warning

 arch/riscv/Kconfig                    |  10 +
 arch/riscv/include/asm/csr.h          |   1 -
 arch/riscv/include/asm/entry-common.h |   8 +
 arch/riscv/include/asm/irq.h          |   3 +
 arch/riscv/include/asm/ptrace.h       |  10 +-
 arch/riscv/include/asm/stacktrace.h   |   5 +
 arch/riscv/include/asm/syscall.h      |   6 +
 arch/riscv/include/asm/thread_info.h  |  15 +-
 arch/riscv/include/asm/vmap_stack.h   |  28 +++
 arch/riscv/kernel/Makefile            |   1 +
 arch/riscv/kernel/elf_kexec.c         |   4 +
 arch/riscv/kernel/entry.S             | 255 +++++---------------------
 arch/riscv/kernel/irq.c               |  75 ++++++++
 arch/riscv/kernel/ptrace.c            |  41 -----
 arch/riscv/kernel/signal.c            |  21 +--
 arch/riscv/kernel/sys_riscv.c         |  26 +++
 arch/riscv/kernel/traps.c             |  11 ++
 arch/riscv/mm/fault.c                 |  12 +-
 18 files changed, 250 insertions(+), 282 deletions(-)
 create mode 100644 arch/riscv/include/asm/entry-common.h
 create mode 100644 arch/riscv/include/asm/vmap_stack.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
