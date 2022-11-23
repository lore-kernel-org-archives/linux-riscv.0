Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BAFC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=54ZCirhwxovjPr55Wy9uRUN19ziI+gpUtJnVpXPbKSA=; b=nSw5vaZKxBuV20
	Ng7AF60Ofk/XFxsNdl7Ij3MuNfKByvfGrD0YCWClVn6MXTAkK1QzB4Ex54Tg3RaDoSRVpFTfJTm09
	S90ZqRWNI4P20oF4svTrL9T3c8jS8YqtggqLKUGfoPOd0gN0D9qq1lj5YwCKkCQ/0q+/11AZBA8iv
	eINkPPsoxxCzzfE/TAuIxj2GpfKm2Vx1jZokXztJMZkon1TyEUo599/RjE+wjZ3raOkxHzTmKfoZC
	9Vd2JGstg9BnzMWG+GjuR1DoAzwyTEav0ohYu9c1IxhPOSCLnJUho1kBk2019AWhb3TexKPcbvfNZ
	b1ttxLkl+FIlAUCHEGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrrB-000WxV-Cp; Wed, 23 Nov 2022 15:40:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrr3-000WpV-NR
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 15:40:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0059261DB5;
	Wed, 23 Nov 2022 15:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1D1C4347C;
	Wed, 23 Nov 2022 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669218004;
	bh=HxcuD2UbWsx5DYi4tBcZiIRhQNFgPWwQufJ/o/enGok=;
	h=From:To:Cc:Subject:Date:From;
	b=ePFKEAd38TsRrBrBQqvPK9w+TGFxwJG3MCRaqDl1Pz2JBC38SefHsoz+6Ps5YMBF0
	 Um4iBfSvZC9lJBodeVuxv80CpO4RveMFqkW9If6t3x6+Q06P/EFk1SIIDdGozkdGcL
	 H49O5wX2OlMumcWweuM5S+mgRKAQG5VpwilAdvk5FLf1lz3bPlTQrAPOZJWitckJQM
	 cPxfInscoeFR45edoPzwKpr3wullyRq0XaJEvMlleX1urnlL3hfKevlBTJcn86OZ0A
	 16Ea4GWmAMBzKVjP5bhy4jdlDjtTRfFcsHBUu/DFna69pKKAYIdOYIJL4nYmL0MCa3
	 NzzAP+aHOb4nQ==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	jolsa@redhat.com,
	bp@suse.de,
	jpoimboe@kernel.org,
	suagrfillet@gmail.com,
	andy.chiu@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 0/5] riscv: ftrace: Fixup ftrace detour code & Optimization
Date: Wed, 23 Nov 2022 10:39:45 -0500
Message-Id: <20221123153950.2911981-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_074005_904791_ACC890A4 
X-CRM114-Status: GOOD (  11.59  )
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

The previous ftrace detour implementation fc76b8b8011 ("riscv: Using
PATCHABLE_FUNCTION_ENTRY instead of MCOUNT") contain three problems.

 - The most horrible bug is preemption panic which found by Andy [1].
   Let's disable preemption for ftrace first, and Andy could continue
   the ftrace preemption work.
 - The "-fpatchable-function-entry= CFLAG" wasted code size !RISCV_ISA_C.
 - The ftrace detour implementation wasted code size. 

The first three patches solve the above problems, and the last two
patches is from [2]:

In RISC-V architecture, when we enable the ftrace_graph tracer on some
functions, the function tracings on other functions will suffer extra
graph tracing work. In essence, graph_ops isn't limited by its func_hash
due to the global ftrace_graph_[regs]_call label. That should be
corrected.

What inspires me is the commit 0c0593b45c9b ("x86/ftrace: Make function
graph use ftrace directly") that uses graph_ops::func function to
install return_hooker and makes the function called against its
func_hash.

This series of patches makes function graph use ftrace directly for
riscv.

If FTRACE_WITH_REGS isn't defined, ftrace_caller keeps ftrace_graph_call
so that it can be replaced with the calling of prepare_ftrace_return by
the enable/disable helper.

As for defining FTRACE_WITH_REGS, ftrace_caller is adjusted to save the
necessary regs against the pt_regs layout, so it can reasonably call the
graph_ops::func function - ftrace_graph_func. And ftrace_graph_[regs]_call
and its enable/disable helper aren't needed.

Test log:

The tests generated by CONFIG_FTRACE_STARTUP_TEST have passed in the
local
qemu-system-riscv64 virt machine. The following is the log during
startup.

```
Nov 15 03:07:13 stage4 kernel: Testing tracer function: PASSED
Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace: PASSED
Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace ops #1: 
Nov 15 03:07:13 stage4 kernel: (1 0 1 0 0)  
Nov 15 03:07:13 stage4 kernel: (1 1 2 0 0)  
Nov 15 03:07:13 stage4 kernel: (2 1 3 0 365) 
Nov 15 03:07:13 stage4 kernel: (2 2 4 0 399) 
Nov 15 03:07:13 stage4 kernel: (3 2 4 0 146071) 
Nov 15 03:07:13 stage4 kernel: (3 3 5 0 146105) PASSED
Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace ops #2: 
Nov 15 03:07:13 stage4 kernel: (1 0 1 589 0)  
Nov 15 03:07:13 stage4 kernel: (1 1 2 635 0)  
Nov 15 03:07:13 stage4 kernel: (2 1 3 1 2)  
Nov 15 03:07:13 stage4 kernel: (2 2 4 125 126) 
Nov 15 03:07:13 stage4 kernel: (3 2 4 146001 146078) 
Nov 15 03:07:13 stage4 kernel: (3 3 5 146035 146112) PASSED
Nov 15 03:07:13 stage4 kernel: Testing ftrace recursion: PASSED
Nov 15 03:07:13 stage4 kernel: Testing ftrace recursion safe: PASSED
Nov 15 03:07:13 stage4 kernel: Testing ftrace regs: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer nop: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer irqsoff: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup:
Nov 15 03:07:13 stage4 kernel: sched: DL replenish lagged too much
Nov 15 03:07:13 stage4 kernel: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup_rt: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup_dl: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer function_graph: PASSED

[1]: https://lpc.events/event/16/contributions/1171/
[2]: https://lore.kernel.org/lkml/20221120084230.910152-1-suagrfillet@gmail.com/ 

Changes in V3
 - Include [2] for maintenance. [Song Shuai]

Changes in V2:
https://lore.kernel.org/linux-riscv/20220921034910.3142465-1-guoren@kernel.org/
 - Add Signed-off for preemption fixup.

Changes in V1:
https://lore.kernel.org/linux-riscv/20220916103817.9490-1-guoren@kernel.org/

Andy Chiu (1):
  riscv: ftrace: Fixup panic by disabling preemption

Guo Ren (2):
  riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
  riscv: ftrace: Reduce the detour code size to half

Song Shuai (2):
  riscv: ftrace: Add ftrace_graph_func
  riscv: ftrace: Make ftrace_caller call ftrace_graph_func

 arch/riscv/Kconfig              |   2 +-
 arch/riscv/Makefile             |   6 +-
 arch/riscv/include/asm/ftrace.h |  63 +++++++++---
 arch/riscv/kernel/ftrace.c      |  91 ++++++----------
 arch/riscv/kernel/mcount-dyn.S  | 177 +++++++++++++++++++++-----------
 5 files changed, 202 insertions(+), 137 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
