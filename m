Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3DECD6E6A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Mime-Version:Subject:Cc:
	Message-Id:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=eGLHrQPLrGvxjaLXu3Z74IrmuexlOJbbTz5l9ciIOxE=; b=ed1
	1jq1vE/Csuit/+b7Jacc3KjRf3Df3QJ0g6mVE8bRxSwtCnkwjfOpgGcHXjAQqcD6C5ryFuhsuzXPm
	rvgV18v8dMHodXCzits1I8ZOH3B5rq1/piS1k4jBjeURJ4DEOz060zc3EFcypRJo3GbqvMdJMhb01
	Bebzs5hmB+Lk0mzSL8x1AwrDbulouQAZfuROrQv94kujIjZ7Pe1/mbDYnc76elVdg4oJPzhgWkltm
	19bGHzJVH+MaBSF+YoMqV/9dIbVX2ivCSsCn8uWC0fSHlup8E+npb3qKwFMK7zlZJcvhXfNjh4tFd
	jWZ+gNJImhYMbjya1W6k9DqfLuwswLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkAT-0000000EzKb-2EGF;
	Wed, 03 Jun 2026 11:53:53 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkAQ-0000000EzJe-3175
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 11:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780487623; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=xGiu9TiOZp/oKM+WuZaW+ml4C/uM143RPoovoqYsIpU=;
 b=cZco4PE9rqcTz1avzxkdRAIiDvWSD2RTcx8A+3/z9mRjrdyP80To96ty+9TdAFjDFJUrja
 4YfZZednp+SQCvgiX/UBvJPN2kmvHc0VNhqP+hJWr1sQyh9pZHVbBD1huuNIgtTL1S/zHB
 nZLXIzkLHzHHmCSvyMj8bsfMMXjIMjlKbCDniOg6IZPecMibapaXe17J3pBV33JHu/vSs5
 3yDbFmLfuFILFM16weOtugEHZxA4lJPrv3a4zQqWEm3C7VDptdh0vifn0NvMAC9yLH3gv2
 Z36cEM1jKpGpUhdm3XGfHFe8u9pcOENdtV0/dQA8EqjSHKQdVd7zqSzzS1K92Q==
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <20260603115329.791603-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v1 0/2] riscv: stacktrace: Fix return address handling in non-FP unwinder
X-Lms-Return-Path: <lba+26a2015c5+194470+lists.infradead.org+qirui.001@bytedance.com>
Mime-Version: 1.0
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Date: Wed,  3 Jun 2026 19:53:27 +0800
X-Mailer: git-send-email 2.20.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_045350_833274_26BA520E 
X-CRM114-Status: GOOD (  16.60  )
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

Patch 2: Use %pB for backtrace display
========================================

With the -0x4 removed, a pre-existing issue becomes more visible:
when a noreturn function (e.g. panic, do_exit) is the last call in
a function, the saved return address points to the start of the next
function, and kallsyms resolves it to the wrong symbol.

This is not a new problem -- the FP version has the same issue since
it also does not subtract from return addresses. And it is not
specific to RISC-V; other architectures face it too.

The kernel provides sprint_backtrace() (invoked via %pB) specifically
for this purpose: it subtracts 1 from the address before symbol
lookup, which is sufficient to fall back into the calling function's
range. x86 uses %pB in its printk_stack_address() for this reason.

Replace print_ip_sym() (which uses %pS) with a direct printk using
%pB, matching the pattern used by x86.

Design principle
================

The two patches follow a clear separation of concerns:

  - The unwinder reports raw return addresses (no offset adjustment)
  - The display layer handles symbol resolution adjustments (%pB)

This matches the convention used by other architectures and ensures
consistent behavior between the FP and non-FP unwinders.

Jiakai Xu [1] and Wang Han [2] have separate patch series in flight
for other stacktrace issues; these patches are orthogonal to their
work.

  [1] https://lore.kernel.org/all/20260517143704.659416-1-xujiakai2025@iscas.ac.cn/
  [2] https://lore.kernel.org/all/20260528082310.1994388-1-wanghan@linux.alibaba.com/

Rui Qi (2):
  riscv: stacktrace: Remove bogus -0x4 offset in non-FP walk_stackframe
  riscv: stacktrace: Use %pB for backtrace display

 arch/riscv/kernel/stacktrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
