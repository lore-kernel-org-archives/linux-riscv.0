Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0950EC8748
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utOLcTcJpOjO8rZQG+TusLMs95QEiTKgFq1RS4BZvC0=; b=QEc5QIAjvmZuyK
	2g2N1GrkD7JRovKCNkWEZxRyuwgDLpE2rBJmIs6XnT6/aYS3cidOApLNgqFWGFZgmfKmatp6pdvNX
	yRc0c2lLBIKA1LDBRF63eNz2mxjYw2OWrnbhzChpnEodRb3203hry+peRLBtHamRWo52F7kL5Vm1f
	2ZaPgjQmYUqR+CqbR+exN6Hgl9Vu05O2h3VtuE1PUF5tjdR84vyDUHQ4zi3krtx3u/b3VJ5zol3YN
	65KjicRlGoWpETqwdo145XwtjEr46W3mPQ7YcCmbevsHnXBu2gmWVKkMdDhXlDpK8Fdx0yUy2kjpm
	A7BlpWC9T5MAfgONH+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFq4-00GHfa-1U;
	Sun, 10 Sep 2023 08:30:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFq2-00GHdh-0S
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:30:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 46415B80AF4;
	Sun, 10 Sep 2023 08:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BD6C433C7;
	Sun, 10 Sep 2023 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694334633;
	bh=RIvCrY8aBdKMNBfBShTR8o+UM7FnOQ4QZsRxMNLpjdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KjCnXhMG6KClfl718naMf98+jPxX1V1N4S6PUpmhSsX9BjtbUPsH5h4JgW4UIvFl5
	 gJxh4UC7UMdy5IkSGSnGA5IYbGLCzbKvkQF+/mACEoVG9tFS95mZ8t/PSBeqmckfLT
	 5VLp7eBOhVtNCI5mLqSH1O/MY8PzUChOhu9Y792vLHaPgIMY2pJARxF50VH7M46PAt
	 1aEFPzbYLaJDVXFZCwqidYQ+quX4JjQ9QjO9QLknsAGmTnDweASiVmnIoNQjI9yf++
	 LXOLFwOKc8/XuL5qoy95gnzseByq1vbYUJ9Nj2dXCMj7Np+2SdZ1SBREM6Frqrg1iw
	 y8KMhHo2aCNtA==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	anup@brainfault.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	palmer@rivosinc.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	tglx@linutronix.de,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	rdunlap@infradead.org,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	keescook@chromium.org,
	greentime.hu@sifive.com,
	ajones@ventanamicro.com,
	jszhang@kernel.org,
	wefu@redhat.com,
	wuwei2016@iscas.ac.cn,
	leobras@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V11 04/17] locking/qspinlock: Improve xchg_tail for number of cpus >= 16k
Date: Sun, 10 Sep 2023 04:28:58 -0400
Message-Id: <20230910082911.3378782-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_013038_312677_604828F5 
X-CRM114-Status: GOOD (  10.94  )
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

The target of xchg_tail is to write the tail to the lock value, so
adding prefetchw could help the next cmpxchg step, which may
decrease the cmpxchg retry loops of xchg_tail. Some processors may
utilize this feature to give a forward guarantee, e.g., RISC-V
XuanTie processors would block the snoop channel & irq for several
cycles when prefetch.w instruction (from Zicbop extension) retired,
which guarantees the next cmpxchg succeeds.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 kernel/locking/qspinlock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
index d3f99060b60f..96b54e2ade86 100644
--- a/kernel/locking/qspinlock.c
+++ b/kernel/locking/qspinlock.c
@@ -223,7 +223,10 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
  */
 static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
 {
-	u32 old, new, val = atomic_read(&lock->val);
+	u32 old, new, val;
+
+	prefetchw(&lock->val);
+	val = atomic_read(&lock->val);
 
 	for (;;) {
 		new = (val & _Q_LOCKED_PENDING_MASK) | tail;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
