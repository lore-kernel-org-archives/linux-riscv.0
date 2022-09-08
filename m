Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB98AECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk9CMgGG3uoKF5XXw1QN56Li+fkqrYGc32kw0Ahc84I=; b=HRzcer7G5jRI+Q
	4ZrIS5K3GuIVHhWXRzFcwlXShODTDVg9N7WUoFpfnaUOb7rNqDXXzLpiUTLS3HCQeJIbHxEJzIqP7
	OPIjxYrRhMWyqPW+Lwx65u8N2S2pDaHRdJTxZCfWMe3Zs01fX7HJavE3N/LhQjAjE9bvFwRvYqYFj
	7goMKELlQt5yWUasQyVYC6leIiR5HVNWKULlYgXAqs92CW0dDu94CXlAWdgq7pDlKZRP2MD+zD3QK
	evACXzadpFxQXiMWU4YClS1Npz12f+HpDLh9+venGsEwenSZqqyKPvwF2SSQ7OK0ib+2Qxad2AMbY
	gVXYbAqIEfY0IwMMJlzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7Ee-00EfJO-Iz; Thu, 08 Sep 2022 02:25:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7Eb-00EfGy-M7
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 02:25:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4753461B41;
	Thu,  8 Sep 2022 02:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8290C43470;
	Thu,  8 Sep 2022 02:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662603939;
	bh=thj4lp5B0J2/kj7Zi1BMTTtT9fAnJMteMKwuLQ0ArOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+OwQrFHV741dq/wnKQO5siVbdtwGveAXdqI5KGHCuzkACFYNjhzfOFm1ZW2iR32E
	 68eLvrwOauiVv2bTscSNYudonOOIKpNMHCixpV9bwUs7PCKfdXu6w88wcd2NFNz5Vz
	 IT7swzOan01VAOcfVlRyCyrAsA+vhQ4KxYOIYZJ4X5NS7eJpOkSZMM3FrkgpIP4w7t
	 /Rx6dsphmTmmSR90DZRMBYKo6ltWGtyr8MtC2fXPUxcVEpqvqrUZZ/mlM9FCpHZtXC
	 72P3jK8whkph33B+ZUkqrwPouuluHiv4iDXiW+EXW4oA/djggYrQfP4NXwWj2by9oO
	 o3qDVrB70Xc8Q==
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
	bigeasy@linutronix.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH V4 3/8] riscv: ptrace: Remove duplicate operation
Date: Wed,  7 Sep 2022 22:25:01 -0400
Message-Id: <20220908022506.1275799-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220908022506.1275799-1-guoren@kernel.org>
References: <20220908022506.1275799-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_192541_768457_9344036B 
X-CRM114-Status: UNSURE (   9.29  )
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
