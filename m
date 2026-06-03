Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBC3CD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:From:Subject:To:
	In-Reply-To:Message-Id:Date:References:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J/59D/XTJbB82vETpSEcBlFaBBvfCAUcc0k3gYLJqOA=; b=gaW3iCaCJWonYG1q4QXLgs5qVq
	UnhZHBHWGj3fOsiC75ai3jYBurLgxnCstWN2ZurTP0/55OTFj+NDf61p/Z9QIN/Cb7rY0LLdA43AT
	bQYRILCqvfI3mcR8DKgXZnvNZ3SeDHHy0fSge4T2TeGHkjDPfwdKjrS2/iP4uzrxicNPZcD1PkMQY
	fm9Du8S7TL3ZjticHNB9WOSQmwKwSwUZ7WiCH2iPv7V4rOWUXOzyj8zIeeWKU66K7/F4ornRH5TKG
	XC0uIzjY7QRiboapqQoiVDfGtyMDHY1lbW5MVzWF4JkP426wCAR5Oexf8zhO/S7Ycee1xZX8L0dJH
	yg7ia6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkAa-0000000EzMO-2hZJ;
	Wed, 03 Jun 2026 11:54:00 +0000
Received: from va-1-111.ptr.blmpb.com ([209.127.230.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkAY-0000000EzLa-0cfS
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 11:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780487633; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=joVqT0sbeZstg7foR7ZySXhhdOS5ZDwWEcSwH6D6Mjs=;
 b=JWTvIoSwatvWvvJ0Gv5673oKRWhi97sv3z8syThRWq+pH8V+HdHrn6IRsn0v+Vmfc0VPI4
 mcT0slUGTsTQUWYdHQh8Nhwpa9KqJug62hHVwPtNp9XXLi+s/O0M10tRF7jwHUiWE+FjNU
 qXRTaxFVsNcye+kFuc9mWMLTV1SYwntkHFgLwsPbVTbpBrAuNPMOIZlVWo5pjTpgcsMbha
 xJUKGp3VDd5ZiqW1ykZKk/zsrOGOsGnVVejm2vQB+lFBha6KxXTWkKc5cKRGlUqY9QgWCq
 n1Cz2TrZKWKRlI8H3dfY/cJJzdij0KxLt8e92AuKNjlgyd3CEvfuihDqEYJkww==
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
References: <20260603115329.791603-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Date: Wed,  3 Jun 2026 19:53:28 +0800
Message-Id: <20260603115329.791603-2-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a2015cf+d0b927+lists.infradead.org+qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260603115329.791603-1-qirui.001@bytedance.com>
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Subject: [PATCH v1 1/2] riscv: stacktrace: Remove bogus -0x4 offset in non-FP walk_stackframe
From: "Rui Qi" <qirui.001@bytedance.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_045358_265729_4D23A24C 
X-CRM114-Status: GOOD (  10.81  )
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

In the non-frame-pointer version of walk_stackframe, each value read
from the stack is treated as a potential return address and has 0x4
subtracted before being used as the program counter. This was intended
to convert the return address (the instruction after a call) back to
the call site, but it is incorrect:

1. RISC-V has variable-length instructions due to the RVC (compressed
   instruction) extension. A call instruction can be either 4 bytes
   (regular) or 2 bytes (compressed, e.g. c.jal). Subtracting a fixed
   0x4 assumes all call instructions are 4 bytes, which is wrong for
   compressed instructions.

2. Stack traces conventionally report return addresses, not call sites.
   Other architectures (ARM64, x86, ARM) do not subtract instruction
   size from return addresses in their stack unwinding code.

3. The frame-pointer version of walk_stackframe already dropped the
   -0x4 offset. Commit b785ec129bd9 ("riscv/ftrace: Add
   HAVE_FUNCTION_GRAPH_RET_ADDR_PTR support") replaced "pc =
   frame->ra - 0x4" with ftrace_graph_ret_addr(), and the commit
   message explicitly noted that "the original calculation, pc =
   frame->ra - 4, is buggy when the instruction at the return address
   happened to be a compressed inst." The non-FP version was simply
   overlooked.

Remove the bogus -0x4 offset to match the FP version and the
conventions used by other architectures.

Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/kernel/stacktrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 2692d3a06afa..c7555447149b 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -129,7 +129,7 @@ void notrace walk_stackframe(struct task_struct *task,
 	while (!kstack_end(ksp)) {
 		if (__kernel_text_address(pc) && unlikely(!fn(arg, pc)))
 			break;
-		pc = READ_ONCE_NOCHECK(*ksp++) - 0x4;
+		pc = READ_ONCE_NOCHECK(*ksp++);
 	}
 }
 
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
