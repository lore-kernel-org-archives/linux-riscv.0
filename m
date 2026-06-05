Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FF0CD6E5D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:From:To:
	Message-Id:Date:Cc:References:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMnxKxEpFUE7wKzpUYqDXYdrjS/UgWVWKf763sttThI=; b=NL5/GnrAXsd7uA
	ELdlzvg4hJ54os/Vfoy2k/0H54GwCCPCbSQf0icQMdhE6Psh1mc8P7Y6Rhp+M4uAduRpmSHNOo/Rw
	//mXmsygdeFVk2ico6S37lmPK4unPKiKtogkEqd9DbTaoK8k1zTszVNm2P00+ZjVriPhiv2uUcurE
	oH2T7w+uQclKg+ZnO1GtDV61xUjruT8xvG2eV0lPik04HxiyBZPWzqVh3zw6lnETQe3bmgjLJAxoH
	DmWGgTlsOZD9iIGg28E6FyD46L3PFyahlx6t/wdqqzxwUOtGpSgmdmALHjmHJdk1JZ7yW8vTXcmhJ
	oIZEzyK9pkmSmtUWxkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPnY-00000000Ih8-1L5M;
	Fri, 05 Jun 2026 08:21:00 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPnV-00000000IgX-1BRA
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 08:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780647651; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=MYfkWTUstYcNpdvoLH3h1FlzPK6bZfHl0b50Ga0IhQs=;
 b=bPWhQ1nIGGEgik3W3NnZTC1kk0e1gyuCCQ5SqJ2tMk2Pn/aU9wFfwK/LzeV0puu27UyX9s
 sGiVMDOjY/CUjru0lxix+umRaMRtsEuHgBnDLiLH73XxD/CyWtH3oQV5AkReO3NSamJd2W
 yRuIF37eIKN/DhqnNWLZG+K9AwOOXMmrkirMnlqK2sqXDREFEwOLnG4PeyEwI5SysNZpaI
 H+8RVxj0zzhn2Vb7nTyKoYyzmLrkgLdwMv8LlVV5uYc9mmZqsLXgIAF0opJx2Zlg7nia1+
 sQRqI2UdBhcdv19cXxyHlnai19S/jo0XaPVVyoO6p4kg59Z9fbvNOMFZ4nTbhw==
Subject: [PATCH v2 0/2] riscv: stacktrace: Fix return address handling in non-FP unwinder
X-Original-From: Rui Qi <qirui.001@bytedance.com>
References: <20260603115329.791603-1-qirui.001@bytedance.com>
Cc: "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Rui Qi" <qirui.001@bytedance.com>
Date: Fri,  5 Jun 2026 16:20:32 +0800
Message-Id: <20260605082034.1426923-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a2286e1+fba3e7+lists.infradead.org+qirui.001@bytedance.com>
In-Reply-To: <20260603115329.791603-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_012057_395935_2E51CE6F 
X-CRM114-Status: GOOD (  17.64  )
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

This 2-patch series fixes how the non-frame-pointer version of
walk_stackframe handles return addresses, addressing both the
unwinder layer and the display layer.

Background
==========

In the original RISC-V stacktrace code (commit 5d8544e2d007), both
the FP and non-FP versions of walk_stackframe subtracted 0x4 from
return addresses read from the stack:

  FP version:      pc = frame->ra - 0x4;
  Non-FP version:  pc = (*ksp++) - 0x4;

The intent was to convert the return address (the instruction after
a call) back to the call site for better symbol resolution. However,
this is incorrect on RISC-V because the RVC (compressed instruction)
extension allows 2-byte instructions (e.g. c.jal). Subtracting a
fixed 0x4 assumes all call instructions are 4 bytes, which produces
a wrong address for compressed calls.

Commit b785ec129bd9 ("riscv/ftrace: Add HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
support") fixed the FP version by replacing "pc = frame->ra - 0x4"
with ftrace_graph_ret_addr(). The commit message explicitly noted:

  "the original calculation, pc = frame->ra - 4, is buggy when the
   instruction at the return address happened to be a compressed inst."

Later, commit 877425424d6c removed the fallback "#else" branch
entirely since HAVE_FUNCTION_GRAPH_RET_ADDR_PTR is always defined
for RISC-V. However, the non-FP version was simply overlooked and
still carries the bogus -0x4 offset.

Patch 1: Remove -0x4 from the unwinder
=======================================

Remove the -0x4 offset from the non-FP walk_stackframe so it reports
raw return addresses, consistent with the FP version and with other
architectures (ARM64, x86, ARM all report return addresses as-is).

Patch 2: Use %pB for return addresses and %pS for exact IPs
=============================================================

With the -0x4 removed, a pre-existing issue becomes more visible:
when a noreturn function (e.g. panic, do_exit) is the last call in
a function, the saved return address points to the start of the next
function, and kallsyms resolves it to the wrong symbol.

The kernel provides sprint_backtrace() (invoked via %pB) specifically
for this purpose: it subtracts 1 from the address before symbol
lookup, which is sufficient to fall back into the calling function's
range. x86 uses %pB in its printk_stack_address() for this reason.

However, %pB must only be used for return addresses. walk_stackframe
passes two kinds of addresses to its callback: exact instruction
pointers (instruction_pointer(regs) and epc from exception frames)
and return addresses (frame->ra, regs->ra, task->thread.ra). For
exact IPs, subtracting 1 can cause kallsyms to resolve to the
preceding function if the IP is at offset 0 of a function.

Add an 'is_ra' parameter to the walk_stackframe callback to indicate
whether the address is a return address.  Then use %pB for return
addresses and %pS for exact instruction pointers, matching the x86
approach which uses %pS for regs->ip via show_ip() and %pB for
stack return addresses via printk_stack_address().

Known limitation: the non-FP version of walk_stackframe() scans the
stack blindly and cannot distinguish pt_regs->epc values from return
addresses, so all stack-scanned values are treated as return addresses
(is_ra = true).  This means epc values from pt_regs encountered during
the scan may still use %pB incorrectly.  The FP version handles this
case correctly by detecting exception frames explicitly.

Changes since v1
================

- Patch 2: Split %pB usage to only apply to return addresses (is_ra =
  true), using %pS for exact instruction pointers (is_ra = false).
  This addresses the review feedback from Paul Walmsley and the
  Sashiko review noting that x86 uses %pS for exact IPs and %pB only
  for return addresses.

- Patch 2: Add 'is_ra' parameter to walk_stackframe callback, update
  the declaration in asm/stacktrace.h, and adapt all callers
  (print_trace_address, save_wchan, fill_callchain_walk wrapper for
  perf, stack_walk_wrapper for arch_stack_walk).

Design principle
================

The two patches follow a clear separation of concerns:

  - The unwinder reports raw return addresses (no offset adjustment)
  - The display layer handles symbol resolution adjustments (%pB for
    return addresses, %pS for exact IPs)

This matches the convention used by other architectures and ensures
consistent behavior between the FP and non-FP unwinders.

Jiakai Xu [1] and Wang Han [2] have separate patch series in flight
for other stacktrace issues; these patches are orthogonal to their
work.

  [1] https://lore.kernel.org/all/20260517143704.659416-1-xujiakai2025@iscas.ac.cn/
  [2] https://lore.kernel.org/all/20260528082310.1994388-1-wanghan@linux.alibaba.com/

Rui Qi (2):
  riscv: stacktrace: Remove bogus -0x4 offset in non-FP walk_stackframe
  riscv: stacktrace: Use %pB for return addresses and %pS for exact IPs

 arch/riscv/include/asm/stacktrace.h |  2 +-
 arch/riscv/kernel/perf_callchain.c  |  7 +++-
 arch/riscv/kernel/stacktrace.c      | 56 +++++++++++++++++++++++------
 3 files changed, 53 insertions(+), 12 deletions(-)

--
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
