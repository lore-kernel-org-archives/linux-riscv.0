Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DFC27C6E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xagbEbe69pHCwo8NtHT+wYDRPTURJ3wu6sJmwxvkty4=; b=mRQzmhyECv1eIV
	SwWbuIEEUurXSZJRDkp6G6v65XpS2T3HvgmZ2EqWz7FhdyLKiDWkUUU972oZgQld1hTLFf1vKKyRX
	RDzdKTHv9aLKYeE1MJL5rSB6vsIUFgn7BEYL2FTxjLnd5rrJz72YId8FjOF4QCIeQdGmlu+V0DaQF
	WPRwNwg2FPPYsly4eyp6rtrO5E3G0/S7L1GtVcI843nrR97M+05JKpH7vno48QMvQDxsxWqWUw4sI
	TEBpDXYb7PY1FlyUsjuec3WTu7Mko9mvDnbK2sJaOOi5HTfRq3zo+PWOjRP6qAMWmubCTzD/l0gP7
	Ag72A7h/ZetX1g1vi8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXl-00000007xCz-2zn2;
	Sun, 16 Jun 2024 17:19:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXi-00000007xBd-0tYW
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:19:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24A7160E06;
	Sun, 16 Jun 2024 17:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA39C2BBFC;
	Sun, 16 Jun 2024 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718558387;
	bh=UYoijwXTiDxnM0ft4XaNfqY/HwhmegABAhD0M3CJA4o=;
	h=From:To:Cc:Subject:Date:From;
	b=bpyj3l836yaIF7YuMjTlKCDrRY4jfD37pFIo52sY+o+sig+QVCZ3RepeJ36N+UyXD
	 qTaVuIOHiPl6wpUR6NB6Bk5l05I6EzQqNEGri5hmSbkyEBd8WFPeIXlLW0n31BfhC6
	 ghYTZHUEnUOaUNHrsuruzSpuUdd45G0b5wDUvyDe9HH5sgcrSO/ndl8DBEqlvY3zON
	 kFRgENJx7/KUg7zoz+nG1Xd4OT+oMwCoG7BlTi3gFtez7T73eKWcNe522s1MkrrvXL
	 FKSAR1NNB9R01lbllkyPkvCZ75PGAypsOqLkdQFJL8sdF/bpzUu2JHmYPxfQuPwkhG
	 S0mUMx7NnYDgA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] riscv: convert bottom half of exception handling to C
Date: Mon, 17 Jun 2024 01:05:47 +0800
Message-ID: <20240616170553.2832-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_101950_315490_BB2309F9 
X-CRM114-Status: GOOD (  11.21  )
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

For readability, maintainability and future scalability, convert the
bottom half of the exception handling to C.

During the conversion, I found Anton fixed a performance issue
and my patches will touch the same exception asm code, so I include
Anton's patch for completeness. I also cooked a similar patch to avoid
corrupting the RAS in ret_from_fork() per the inspiration.

Mostly the assembly code is converted to C in a relatively
straightforward manner.

However, there are two modifications I need to mention:

1. the CSR_CAUSE reg reading and saving is moved to the C code
because we need the cause to dispatch the exception handling,
if we keep the cause reading and saving, we either pass it to
do_traps() via. 2nd param or get it from pt_regs which an extra
memory load is needed, I don't like any of the two solutions becase
the exception handling sits in hot code path, every instruction
matters.

2.To cope with SIFIVE_CIP_453 errata, it looks like we don't need
alternative mechanism any more after the asm->c convertion. Just
replace the excp_vect_table two entries.



Anton Blanchard (1):
  riscv: Improve exception and system call latency

Jisheng Zhang (5):
  riscv: avoid corrupting the RAS
  riscv: convert bottom half of exception handling to C
  riscv: errata: remove ALT_INSN_FAULT and ALT_PAGE_FAULT
  riscv: errata: sifive: remove NOMMU handling
  riscv: remove asmlinkage from updated functions

 arch/riscv/errata/sifive/errata.c         | 25 +++++++---
 arch/riscv/errata/sifive/errata_cip_453.S |  4 --
 arch/riscv/include/asm/asm-prototypes.h   |  7 +--
 arch/riscv/include/asm/errata_list.h      | 21 ++------
 arch/riscv/kernel/entry.S                 | 61 ++---------------------
 arch/riscv/kernel/stacktrace.c            |  4 +-
 arch/riscv/kernel/traps.c                 | 57 ++++++++++++++++++---
 7 files changed, 81 insertions(+), 98 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
