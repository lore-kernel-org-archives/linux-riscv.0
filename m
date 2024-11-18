Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D13D43FF5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 09:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dEGrtMO55ywwlcjR6K2rrawgKf5OFbrp5A1ryFWLn4g=; b=RgRMUtj1ngKD4f
	taqleoAkLI/6dUE8S88SZ8fP8xyCOaH22MUJ/whzoq/p0e2S16Qrr0W+yz6K/Oi/9eNzVwNvfhkIb
	btn8lPBZhzTyfuddJbjJZsDzz2u6EqlLbYgWhmsHMUiedKSDTv6mmDH53z0IMEYZeWGJ4URoGAj9E
	8utsnBLl9FyR/9aXFwONS2xYDkA6uaHCa3eG90RbLOhxev5UU0eBqkYNPjQ9c2dPaZ/nN4cVY3KkW
	DBzS2ncdncxNWo7sHxzDI8WtDjGjVzPw7JvQ4sTn2eydC2PeY3b//zZKrvNZ/6yc5+Dd3EIKjhuTk
	jCtr5wOo5UNQXtkc8sFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxpO-00000008scc-1ULG;
	Mon, 18 Nov 2024 09:13:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxpM-00000008scC-2PjR
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 09:13:49 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731921224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HI6ICxNO251mFq7pISkNdCLNFU5x6e6AXXpGTS7HZc0=;
	b=RKPTA0abGvFnwDXfRW/uUJWtjKOZ+xjrs2u+OgXgAdzNwucwCLQ0fXvjhHZUL/gvGqhPOg
	g5Ot6j2uTspH8X9rNQnjHM3ZlrYxmPFhTOQp0X+yCqgRevHcgpynx4dbdsMhgPxqd6TUv5
	sJxqooT3Z6rHWuJUOacIFn2y+RMkKjzC417zrWWKu6V93WmONC5FuSdKOYWAck16BMs+cg
	1SulMIrrp0zKXXns//wfu/gZ9gxDK/eBzNl1Ev39KYMHcAKyUVYaSAmq+Zs1PHz6x7RDbe
	CPnotlwa+4niu3t60XQOCXR/S9nfYJHklmOVwWP8RhAVcl78iUOiKsGFXP1bDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731921224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HI6ICxNO251mFq7pISkNdCLNFU5x6e6AXXpGTS7HZc0=;
	b=uxCf6/VUuoVknnRagY75tS1zS4IW8eP4kWbJo6q+ctC4rYf085yIrDVYhPQxhX9k9Ox3tG
	CjbuQjXKPL4hlwAg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Nam Cao <namcao@linutronix.de>,
	Andreas Schwab <schwab@suse.de>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] riscv: Fix sleeping in invalid context in die()
Date: Mon, 18 Nov 2024 10:13:33 +0100
Message-Id: <20241118091333.1185288-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_011348_755283_38A7B328 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

die() can be called in exception handler, and therefore cannot sleep.
However, die() takes spinlock_t which can sleep with PREEMPT_RT enabled.
That causes the following warning:

BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 285, name: mutex
preempt_count: 110001, expected: 0
RCU nest depth: 0, expected: 0
CPU: 0 UID: 0 PID: 285 Comm: mutex Not tainted 6.12.0-rc7-00022-ge19049cf7d56-dirty #234
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
    dump_backtrace+0x1c/0x24
    show_stack+0x2c/0x38
    dump_stack_lvl+0x5a/0x72
    dump_stack+0x14/0x1c
    __might_resched+0x130/0x13a
    rt_spin_lock+0x2a/0x5c
    die+0x24/0x112
    do_trap_insn_illegal+0xa0/0xea
    _new_vmalloc_restore_context_a0+0xcc/0xd8
Oops - illegal instruction [#1]

Switch to use raw_spinlock_t, which does not sleep even with PREEMPT_RT
enabled.

Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
stable backport is probably not needed for versions earlier than 6.12
because PREEMPT_RT is not enabled. But it doesn't hurt..
---
 arch/riscv/kernel/traps.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 51ebfd23e007..8ff8e8b36524 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -35,7 +35,7 @@
 
 int show_unhandled_signals = 1;
 
-static DEFINE_SPINLOCK(die_lock);
+static DEFINE_RAW_SPINLOCK(die_lock);
 
 static int copy_code(struct pt_regs *regs, u16 *val, const u16 *insns)
 {
@@ -81,7 +81,7 @@ void die(struct pt_regs *regs, const char *str)
 
 	oops_enter();
 
-	spin_lock_irqsave(&die_lock, flags);
+	raw_spin_lock_irqsave(&die_lock, flags);
 	console_verbose();
 	bust_spinlocks(1);
 
@@ -100,7 +100,7 @@ void die(struct pt_regs *regs, const char *str)
 
 	bust_spinlocks(0);
 	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
-	spin_unlock_irqrestore(&die_lock, flags);
+	raw_spin_unlock_irqrestore(&die_lock, flags);
 	oops_exit();
 
 	if (in_interrupt())
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
