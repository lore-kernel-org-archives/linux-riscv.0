Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EEFC43334
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 07:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NoMfgGHLWOX/iTq3Atc6Y9zFPJUmTROYOLuTSqkm36k=; b=IRFcTTevaTTtTs
	7XhcMUe4569wN7qqNMREqgGRgrpd/aUqjGlcpAN2/GvxAKc7ENSCxwIElY2aWjZMWdEg8wPuohpOl
	hnlzcshhAd/NiyURFYWB1u17hiJ8DyuHFgedARbkNnexATUIPIquvxwUCt/yaA7/L1X60Bh3HiSXm
	N/W8Vc3fO5NJCt9Fz2UnulNWfYLXRTYELKsIobigQB7ZnD3BayCYl8+qL9c7U3qQwvVaM6vM9pB8E
	kWflffd0/QLwOzK5lQgY/4qsR/vFYuFq30eAmXZHjBRohWYBbzruN4cSxXIC9t04F047c9tT5YXD7
	6AzwEprev/dykPAGW5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oARoP-00B3zK-DJ; Sun, 10 Jul 2022 07:57:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oARoL-00B3rU-5K
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 07:57:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2C256103E;
	Sun, 10 Jul 2022 07:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3D2C3411E;
	Sun, 10 Jul 2022 07:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657439813;
	bh=fmIkwSXGZkIfKEg46MRMfxJbhAewxR1hq5/Ow7J8oDE=;
	h=From:To:Cc:Subject:Date:From;
	b=vQmUL6yP428aszVEcgI6/VqsqPMJAjeYQowPwmhTPdFrquQ5bVrFGPWfJk4s+14NU
	 NYA29/WYIwWlyPTg4gKTcbBqf4jgmfTPFpDk/nJasHcf6MDzWG5pR69IOdBpPFaACf
	 FuXNurS1ragF/NT7yoG0A5J5oMjeDm+nQBYQ2qPnSdPd3Vj4xJjGGunU7LU0AoXjmW
	 MeJkbFjaHSV9Cozd+6bK8VDka4YI7+6aBH6CX1VT0hidhXbgsmN9c7ZnYGd7iL2Kh/
	 BcmX9zZhZC/Pde+q5iCi4hHHh+C1rjKCA4uU7Txd7wHUErdOi9aW1FzLxCSkhRTfkS
	 508TpI1eFgNQg==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 0/4] Proof of concept for rv32 svpbmt support
Date: Sun, 10 Jul 2022 03:56:40 -0400
Message-Id: <20220710075644.738455-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_005701_296030_206AFF25 
X-CRM114-Status: GOOD (  11.54  )
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

Make rv32 support svpbmt & napot by reducing the PPN witdth (sv32p34 ->
sv32p31).

RISC-V 32bit also requires svpbmt in cost-down chip embedded scenarios,
and their RAM is limited (No more than 1GB). It is worth mentioning that
rv32-Linux currently only supports 1GB of DRAM, and there is no plan for
high-memory. So, there seems to be no obstacle to shrinking the physical
address space of the rv32 from 16GB to 2GB. We recommend that ISA
consider sv32p31 as the recommended configuration for the software
ecosystem instead of sv32p34. Then we could merge rv64 & rv32 into one
PTE format:

| XLEN-1 | XLEN-2 XLEN-3 | XLEN-4 10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
  N        MT[2]           RSV & PFN   reserved for SW   D   A   G   U   X   W   R   V

We've finished the Linux Proof of concept of the proposal, which contains
three parts:
 - Qemu rv32 svpbmt & napot support & hw/virt memory layout of 1GB IO
   range [1]
 - Linux rv32 sv32p31 & svpbmt support
 - Opensbi needs to compile with FW_TEXT_START=0x40000000

[1] https://github.com/guoren83/qemu/tree/rv32svpbmt

Changes in V2:
 - Fixup ALT_SVPBMT_SHIFT definition
 - Optimize commit log

Guo Ren (4):
  riscv: Optimize satp_mode data type
  riscv: Cleanup ERRATA_THEAD_PBMT for rv32 svpbmt compile
  riscv: pgtable: Move svpbmt into the common pgtable-bits.h
  riscv: Change rv32p34 to rv32p31 for svpbmt

 arch/riscv/Kconfig                    |  2 +-
 arch/riscv/include/asm/errata_list.h  | 17 ++++++++-
 arch/riscv/include/asm/pgtable-32.h   | 20 +---------
 arch/riscv/include/asm/pgtable-64.h   | 55 ---------------------------
 arch/riscv/include/asm/pgtable-bits.h | 53 ++++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h      |  7 +++-
 arch/riscv/include/asm/sparsemem.h    |  2 +-
 arch/riscv/mm/init.c                  |  4 +-
 8 files changed, 80 insertions(+), 80 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
