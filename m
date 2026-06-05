Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC8CCD6E6B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Mime-Version:
	Message-Id:Date:Subject:From:Cc:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/59D/XTJbB82vETpSEcBlFaBBvfCAUcc0k3gYLJqOA=; b=TjN2LivOtdXcOn
	O1m3UTib1D9asQFQRzDXD3VZAqYdMOzmnX+XWOnujAN+dHMqa7Fm2ZxLNqjsEVwhbGlI6qh4pOC0M
	7Z8HlHytEOrK0fbuPenx4LmUKlmPeRgAhYW3LiJdlo2QwkU0wvslMPyFKFNk9Cpjkcpr8nx6AEREJ
	r0cnd8TERK+pc7XGLop43yFQaAz0+hCxQ2er9BweuiFJlyLS6J1xJweiyC+l8WXfUOss6s6g2RoAg
	nP8IYA3YnvICUSBijCDhX9R72t72v5jQgE4YihH/wb6A19ga2jyLS5JJUTbWIK89O5AVaDUqQrjJ+
	5CiYOfh0lzDgIxeOhWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPng-00000000Iip-1iJy;
	Fri, 05 Jun 2026 08:21:08 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPnd-00000000Ii9-1yow
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 08:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780647660; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=joVqT0sbeZstg7foR7ZySXhhdOS5ZDwWEcSwH6D6Mjs=;
 b=OmOHZw7bGeEhePfGfGJ0Q2BdkX0A83G8XQ5OZh5G36mHYp+wx+54qazVmY7oHWObacR9iq
 UKzGRa3bDyNUBnIWEJoQKem4iIrKKj5VMJHVdV14mXzGAV5ah14ZZJiW15BzK5HGP27UK5
 /hvsJDg8i+3sIk2zzcnBIXQZY9uLSyBB5hO7eYBxOfo9ekYcODUABWK/9/cj1tsVjRnDbm
 cPqLTbRLkVPhJ3iKfpurIVwU7N7FTane3sltpD8Z9rOtrC0iSWt2PpqpUjJG9t89fVQ7lY
 CtfKfNlF7xXSSJamr3vcA72kjDAu+tq13J+B8YO6WEz0c/uy00WV7yUVFT4olA==
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Rui Qi" <qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v2 1/2] riscv: stacktrace: Remove bogus -0x4 offset in non-FP walk_stackframe
Date: Fri,  5 Jun 2026 16:20:33 +0800
X-Mailer: git-send-email 2.20.1
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a2286ea+307c11+lists.infradead.org+qirui.001@bytedance.com>
Message-Id: <20260605082034.1426923-2-qirui.001@bytedance.com>
Mime-Version: 1.0
In-Reply-To: <20260605082034.1426923-1-qirui.001@bytedance.com>
References: <20260603115329.791603-1-qirui.001@bytedance.com> <20260605082034.1426923-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_012105_574518_CE2A1398 
X-CRM114-Status: GOOD (  10.47  )
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
