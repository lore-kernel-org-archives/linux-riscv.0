Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A07C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 03:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xWA9rx0qDNaFzuzEH4PWDLnwXk9raArxl8rN/AOMB0=; b=aaUFGnoJoWebzf
	o0f8GWp7AasAArwv6ZCVYupiosbhpawe67d+HCrbgVtHHvnAWUE0hgF6Kzqvlx6/AsPvCWq15fgBM
	G/0kaPscN+Nti60VdwZfUfAIMAElUV29f2GOrYlHFp89G8fqDSTFZCF68ILM6WvkocPiS89T5Ur2w
	8XgaDNVVClA6kEa7dxjj7bNnENlA5lPBi0ctKvCkwy4vTstdIek0bPbWB45ftRiZgTDKL6bt7JRSr
	bj6LslU3nNqEbiA6o+wQ1YLZG0O9OPqzxmtTUFPjdlDPSGE8h9JmMRP6HkplcrK/fgfZjy0iqakrr
	FzkrSqGsInZ1BTDRtHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DzR-00CeKV-50; Wed, 30 Nov 2022 03:42:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DzN-00CeGW-Q2
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 03:42:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 66591B81886;
	Wed, 30 Nov 2022 03:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7425DC433D6;
	Wed, 30 Nov 2022 03:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669779743;
	bh=mE9q4aVwyfDFtea3FBefeBXuO1WtbOQ4Us26dpgF3tM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lL7motiItZ/xK87s6Yv4OxG3dfs0v1U+kZoy7+MSPCSJez04jhR0QAsrGqP6xCUtC
	 uw2qCZNpkJ/Gn8+MeMswHD0wZJjojczNwtHg/elDmQmCaq59uUrRwQmsq7TYPXsXjG
	 R72Zk2vYHXw8ego0CGwGnUn7KnltjY51UTWk7tBTREo+Hfk5eITF0EY2T9V6pfQoJQ
	 +gUv9eojokK1OW5gG1GI2bqOcdTZoiytV2SzG/R7PVvCiA8m7MCKGMWK37TQyus+p/
	 XhO3N6UrejxBpzExSwGfpu5CROdXSOLobrh6AgoFWmp3E95OpydrDy1xxF7XZHveF3
	 nNHNZFkmUvIwA==
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
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH -next V9 04/14] riscv: ptrace: Remove duplicate operation
Date: Tue, 29 Nov 2022 22:40:49 -0500
Message-Id: <20221130034059.826599-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221130034059.826599-1-guoren@kernel.org>
References: <20221130034059.826599-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_194226_045005_DB1453C8 
X-CRM114-Status: UNSURE (   9.38  )
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

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Tested-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
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
