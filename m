Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06FCD735FE
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1hc0gvA5a6aHf6btquOCHigK2g8e3bq57pDys2NHv+c=; b=A+jdZIwuaAIupA
	N/c4oI9usQwPu1b2Ev/LDRoOlz6PkXljzzyN+yOhCASkqpEkwDaPSs+e6TbM67P0T65+pXJ24s5Mn
	7MH3o31mFzCttJdFmDaIide3sTZMMLQmNhZsU1G3si+L9rG6cNUijR9xSckzRIzZUq8/I1vEoYpoO
	l66+oQxZ4B3SrvwDuHGMVBNPVy2x8XcMha0RbFECq2LfbOaRn29tG6qyO/ifpUjWd/eJAiSYZD6ZL
	EQBZVgjgN88HDskUPhPh6b6jdDsyO0E1oJTp4j0vcq3YgWluPLCYacJ8mIH932JErkRHrpjmTw9Os
	RFrh0ZET9NjQwa0ScoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHM3J-00000001zG7-2AuZ;
	Sat, 30 Nov 2024 11:54:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHM3H-00000001zF5-02bz
	for linux-riscv@lists.infradead.org;
	Sat, 30 Nov 2024 11:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09426A40249;
	Sat, 30 Nov 2024 11:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C98C4CECC;
	Sat, 30 Nov 2024 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732967656;
	bh=DUK3tB+AsdQ619RwRCY0z9yPj3gLKSNj2ywokjFKFGg=;
	h=From:To:Cc:Subject:Date:From;
	b=pI37edeaELxlsnV9vpSpEkhYJ9N/yuXQ9+f3mNysBpNNBcgQc+mzHr5xYeKJHZMV6
	 sgmVhQ6EMAboBVBR8zYja6q13zJiQDSP3c5urEsfmg8Lr6d09giWDhDwOIcH87jb+U
	 jcxgMSm5ul7YmwP2OjjnewSgb7J7zBRX6t/+bM3uAvGZZfWCQNVkOMX+jv6YtcwOK0
	 Sp1bNZCf0MOYgJoKBLildmzhOB6LQKIibSlu8Hq6hsOnuYKFPZuawSU0ssGefHTP0m
	 kavGuHtecVwSOaHt7sKSo4hhVVBHH3eafS8E4rcCs0rcOLoWrbZsnXu6Xmq46YeV8I
	 TB1WkpLwPjNDw==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	conor@kernel.org,
	leobras@redhat.com,
	peterz@infradead.org,
	parri.andrea@gmail.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	arnd@arndb.de,
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: Fixup boot failure when CONFIG_RT_MUTEXES=y
Date: Sat, 30 Nov 2024 06:53:55 -0500
Message-Id: <20241130115355.3316160-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_035419_178950_09EF2575 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When CONFIG_RT_MUTEXES=y, mutex_lock->rt_mutex_try_acquire would
change from rt_mutex_cmpxchg_acquire to rt_mutex_slowtrylock():
	raw_spin_lock_irqsave(&lock->wait_lock, flags);
	ret = __rt_mutex_slowtrylock(lock);
	raw_spin_unlock_irqrestore(&lock->wait_lock, flags);

Because queued_spin_#ops to ticket_#ops is changed one by one by
jump_label, raw_spin_lock/unlock would cause a deadlock during the
changing.

That means in arch/riscv/kernel/jump_label.c:
1.
arch_jump_label_transform_queue() ->
mutex_lock(&text_mutex); +-> raw_spin_lock  -> queued_spin_lock
			 |-> raw_spin_unlock -> queued_spin_unlock
patch_insn_write -> change the raw_spin_lock to ticket_lock
mutex_unlock(&text_mutex);
...

2. /* Dirty the lock value */
arch_jump_label_transform_queue() ->
mutex_lock(&text_mutex); +-> raw_spin_lock -> *ticket_lock*
                         |-> raw_spin_unlock -> *queued_spin_unlock*
			  /* BUG: ticket_lock with queued_spin_unlock */
patch_insn_write  ->  change the raw_spin_unlock to ticket_unlock
mutex_unlock(&text_mutex);
...

3. /* Dead lock */
arch_jump_label_transform_queue() ->
mutex_lock(&text_mutex); +-> raw_spin_lock -> ticket_lock /* deadlock! */
                         |-> raw_spin_unlock -> ticket_unlock
patch_insn_write -> change other raw_spin_#op -> ticket_#op
mutex_unlock(&text_mutex);

So, the solution is to disable mutex usage of
arch_jump_label_transform_queue() during early_boot_irqs_disabled, just
like we have done for stop_machine.

Reported-by: Conor Dooley <conor@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Fixes: ab83647fadae ("riscv: Add qspinlock support")
Link: https://lore.kernel.org/linux-riscv/CAJF2gTQwYTGinBmCSgVUoPv0_q4EPt_+WiyfUA1HViAKgUzxAg@mail.gmail.com/T/#mf488e6347817fca03bb93a7d34df33d8615b3775
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/jump_label.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index 6eee6f736f68..654ed159c830 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -36,9 +36,15 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 		insn = RISCV_INSN_NOP;
 	}
 
-	mutex_lock(&text_mutex);
-	patch_insn_write(addr, &insn, sizeof(insn));
-	mutex_unlock(&text_mutex);
+	if (early_boot_irqs_disabled) {
+		riscv_patch_in_stop_machine = 1;
+		patch_insn_write(addr, &insn, sizeof(insn));
+		riscv_patch_in_stop_machine = 0;
+	} else {
+		mutex_lock(&text_mutex);
+		patch_insn_write(addr, &insn, sizeof(insn));
+		mutex_unlock(&text_mutex);
+	}
 
 	return true;
 }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
