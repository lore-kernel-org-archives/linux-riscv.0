Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E77FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 10:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NdIWfq63Nol+LMKW+g9ZH5Vl1iE88O6BESgjeU3osqQ=; b=gn0sgyZ9j8Xb3W
	qDVlG28mIfsUtVsZny2klWiAufNuzDPCoL1rWg2Zjbrwf4/L8xEykY4bxHLmVbfLP2pGXiin5TFLa
	7rWnJWqB2S3EYNu/k+ubCCuwho847NcSx0RDF16wAs7W8dt4IHFs9b9P09lO93Hx9rogGOAsFgpYM
	m0CMnxJVg5jGnVufRH/LdFU0eVwy7uEb3uTgbDd66SjaVAynQmEp4kk2O/PBOe/2csBsOMnzsSJcq
	kj65TR2BR/kxg4FjdIfoAFrKl4A+lCLkKe2GXPOE4W6ibbab94ziH0nlcViL+FPOW3oBp5GMAD01s
	SnNFWGZGlDRFihIPS3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fR3-00H4EV-Dv; Tue, 05 Jul 2022 10:05:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fR0-00H4Cv-HY
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 10:05:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 27777B8172A;
	Tue,  5 Jul 2022 10:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21985C341C7;
	Tue,  5 Jul 2022 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657015530;
	bh=NDJXSzU8bKi2zwy9PzpSIP4MJ13vlchjaLY8RsOnnyg=;
	h=From:To:Cc:Subject:Date:From;
	b=bq30MGSvZFvfoM0TWYUuHWthiGyz7XVI4+FH5OFwtYHM4w5qt9evEQTUepV0XiL4f
	 t6s33fp787mEYCNZ9LhHDo/qxRIgKLxuazszAPX7Xwgya8cJSnX/c7DB7BmtfoP5+h
	 LXtof0J1UokpF+5PRDtwyR7uk8ooBXyNIw709UxP8sGMkqfyKXimtbw9nk4jxrLnly
	 fh8/IPIz3sA1owdXrPEWqGMBYkOjO7iloh3GSfIvuBv1EJrjrAGyOPPYWEMjLj43Zj
	 MxP7ynuI69CWCwJjvfb91xvQBqPD7R3bIGFS+4X9iy5r4NYr3R1KtBmBpA2p4YMkBL
	 TlV086UarMhfQ==
From: guoren@kernel.org
To: palmer@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 0/4] Proof of concept for rv32 svpbmt support
Date: Tue,  5 Jul 2022 06:05:19 -0400
Message-Id: <20220705100523.1204595-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_030534_772113_D3E0ABB2 
X-CRM114-Status: GOOD (  11.46  )
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

Guo Ren (4):
  riscv: Optimize satp_mode data type
  riscv: Cleanup ERRATA_THEAD_PBMT for rv32 svpbmt compile
  riscv: pgtable: Move svpbmt into the common pgtable-bits.h
  riscv: Change rv32p34 to rv32p31 for svpbmt

 arch/riscv/Kconfig                    |  2 +-
 arch/riscv/include/asm/errata_list.h  | 11 +++++-
 arch/riscv/include/asm/pgtable-32.h   | 20 +---------
 arch/riscv/include/asm/pgtable-64.h   | 55 ---------------------------
 arch/riscv/include/asm/pgtable-bits.h | 53 ++++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h      |  7 +++-
 arch/riscv/mm/init.c                  |  4 +-
 7 files changed, 74 insertions(+), 78 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
