Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5729FC54EE9
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk9CMgGG3uoKF5XXw1QN56Li+fkqrYGc32kw0Ahc84I=; b=h7gqJy5NzQDyWX
	YuFrHE0EZfWd0NisBr4/URgWy6w+xqwMCPII+a2h+5msgIo078Ed4yuq7snLzZgjhhzuOwhpx8G/9
	+Nmd80iKQ7ZcOYTC1yt9ZfH6YlcpvJJNjeEJq9C0XJFO5KBqebvQnmzAgJfuStvkaq8QfzhThVGct
	sOaNAH/BiEfhJzAZFdUd7euJ5XDKV48zhpg9XLtwS/CD/c4H6ZSLLHMl1V+Khw1zD9LbSVgXA9P9q
	tJWSdwtMCH4u1742atH403whvZyTldMPXJNdGaxBIiqvkMhxCdYKKobe1KbvXNRqX0MF8Sl15ikSN
	pGzhz/o46qBo5eGjAIdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwbc-000Fux-RN; Sun, 18 Sep 2022 15:53:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwba-000FsE-HF
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 15:53:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 246DE6159F;
	Sun, 18 Sep 2022 15:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E1EC433C1;
	Sun, 18 Sep 2022 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663516393;
	bh=thj4lp5B0J2/kj7Zi1BMTTtT9fAnJMteMKwuLQ0ArOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mp7BlbjzUw36r3YuqTbkzw+SOlYKh7mqfoXpknmIExjZDVsijot6rAtuC9evooQZj
	 /p13eAsGcsRWG92RwXySHI9j/eFXOsKuBmrVHVevci3nJA9crQ3OhApl97OPUuxZFr
	 l7vEyDT813DvqulOsSeCt+javi8dQW39+y3W01/nAhPgIge2Q8dPZFDVzDF7GDa2tM
	 m7bjdj+Ta1a+d0055JfhL+yFs4CJAvgOzQ3UvNqcO6/+5BWaFvCV3QxM1xiVmBj6fC
	 pfwEEpq3VQ1nGfrChnrnBAYTHqAfyOp9QsYPo1fFi5l9JN8bs0GjgbB+DGdUR/5efp
	 DgZ0IojzU/fqg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH V5 03/11] riscv: ptrace: Remove duplicate operation
Date: Sun, 18 Sep 2022 11:52:38 -0400
Message-Id: <20220918155246.1203293-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220918155246.1203293-1-guoren@kernel.org>
References: <20220918155246.1203293-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_085314_645470_18726EB9 
X-CRM114-Status: UNSURE (   9.05  )
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

The TIF_SYSCALL_TRACE is controlled by a common code, see
kernel/ptrace.c and include/linux/thread.h.

clear_task_syscall_work(child, SYSCALL_TRACE);

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/riscv/kernel/ptrace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 2ae8280ae475..44f4b1ca315d 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -212,7 +212,6 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
 
 void ptrace_disable(struct task_struct *child)
 {
-	clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
 }
 
 long arch_ptrace(struct task_struct *child, long request,
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
