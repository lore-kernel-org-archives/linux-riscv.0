Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326FEC3DA59
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=evZfyOFhXSqDAX+1v0Whg3UI503rv4/6RQQTnBmkgoc=; b=y6oeyJ2Csrk8P5
	2i7ppdKqEDbcIWpvXUZZINInWNncTDIdT49p7KbUsAQXnnB/6kH+P2pWrCYbGmnrOOMSMWOoJNXhp
	tGcoN47/DiSSRGgtoKsb6bWhoaS4Gna8b7l5l+NZSppwko8MOzzIUEpIl8nArhy0nJqk4cbbXQR4h
	o/oc3RF5qc5eRKIcn3jYRDMSfFBQ6d6rTapFk9TorouZNJ75RL1rPzIBpdIfBdPoQQO86eu72bwk9
	tpDhEbpxHhg0Rr88RYiX4AeSrLhYQMgSzhKUl19Nh/VTX6Qxl3Se1U9Sp5o1JXA3wixtoeqlSQS2b
	9i3SXjW4l5Sz8la3kQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrE-00000005QYg-1yi9;
	Sat, 20 Jul 2024 17:26:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrB-00000005QXl-1rN8
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 17:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6BCDECE09CD;
	Sat, 20 Jul 2024 17:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FB6C2BD10;
	Sat, 20 Jul 2024 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721496409;
	bh=F9nFEV1JgM51nYvYrMahJ9TSsZ4ZPpPIEacugupNX/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=O7pnNvgg2873Cdm1spRnosdWIHDzZAolV0j2w2rbjIRhpKTtoHycpJqG5/jjQmHam
	 L9MUVtaOabYFyLbo5vG3gABudZB5kaQS4Oq9hqwBKO3xxOpXPutTnFfZ1frf79oQSS
	 3nShmIO9dwIdDRF9B/Z/fcGEgkfFlIltHTuB0F5p0Vat6wyAUPyJclHNmi2XCs3jXW
	 WZZBUdD7EyjjjiO8v73+KeoeO1H7d06VUGJoVmgIvMgWb2cGUN8kkKlVQqyu5c+/8w
	 XlO+Llnq06zMmteuSJEsWbatvt1MQElwTKzh2djQGFSA1pVv1kbWx72d2Q10C5O84O
	 5WbNW9eVZE+zQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Clement Leger <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] riscv: convert bottom half of exception handling to C
Date: Sun, 21 Jul 2024 01:12:25 +0800
Message-ID: <20240720171232.1753-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_102653_682234_1BD0E6B7 
X-CRM114-Status: GOOD (  10.70  )
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

During the conversion, I found Anton fixed a performance issue[1]
and my patches will touch the same exception asm code, so this series
is applied against Anton's patch.

patch1 and patch2 are cleanup patches.
patch3~patch7 do the conversion and some cleanup/optimization
after conversion.

Mostly the assembly code is converted to C in a relatively
straightforward manner.

However, there are two modifications I need to mention:

1. the cause I.E the CSR_CAUSE value is passed to do_traps() via. 2nd
param, do_traps() doesn't get it from pt_regs because this way an extra
memory load is needed, the exception handling sits in hot code path,
every instruction matters.

2.To cope with SIFIVE_CIP_453 errata, it looks like we don't need
alternative mechanism any more after the asm->c conversion. Just
replace the excp_vect_table two entries.

Link: https://lore.kernel.org/linux-riscv/20240607061335.2197383-1-cyrilbur@tenstorrent.com/ [1]

since v1:
 - add two clean up patches
 - remove the two patches which fix imbalance in RAS, instead, explicitly
   mark this series is applied against one of them.
 - save cause in pt_regs prior to calling do_traps()
 - do more clean up and optimization after the asm->c conversion:
   staticalize and mark do_irq() as __always_inline.

Jisheng Zhang (7):
  riscv: traps: staticalize handle_break()
  riscv: traps: remove __visible annotation
  riscv: convert bottom half of exception handling to C
  riscv: errata: remove ALT_INSN_FAULT and ALT_PAGE_FAULT
  riscv: errata: sifive: remove NOMMU handling
  riscv: staticalize and remove asmlinkage from updated functions
  riscv: traps: mark do_irq() as __always_inline

 arch/riscv/errata/sifive/errata.c         | 25 +++++++---
 arch/riscv/errata/sifive/errata_cip_453.S |  4 --
 arch/riscv/include/asm/asm-prototypes.h   | 20 +-------
 arch/riscv/include/asm/entry-common.h     |  1 -
 arch/riscv/include/asm/errata_list.h      | 21 ++-------
 arch/riscv/kernel/entry.S                 | 57 +----------------------
 arch/riscv/kernel/kernel_mode_vector.c    |  2 +-
 arch/riscv/kernel/traps.c                 | 55 ++++++++++++++++++----
 8 files changed, 73 insertions(+), 112 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
