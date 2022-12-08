Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E107BC4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 02:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3Xd+zXPe73/b0PKTcyAVkUQRL7WY8YAXJ5MVv0fExc=; b=XpD9ZT2SYfhNOe
	jMqJm4fC2CgdH13vU7qiwq0yyQ6WkiYfCEWbrIxy7DBT5wsnoe1H8eKAjohvGVuWhT7sRRVD8sOhN
	BVxzIHkS2rQh34PxIWgh4J2sV8+4nSu0RxxLmSpp/8uKShtku5Dwaud7EsCbvSGQCLGTa/vIIw4jO
	p1P6OYhe+588J2WN/e8cCSseOasxGVBSb5e4DYkw08gfmvHxzhJ+FvuJvposgvrYzVQrPr3kP/v7E
	kjQAHdgLxo7TzDrwvRtPUFGYKnbUD0v7PFOqnOxzg3EStsTVPjAVwSIhb3DrYrDFz7dw8VVBFWOTi
	FwDt/+lL/35Ztg8eudtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p377e-000cDJ-QY; Thu, 08 Dec 2022 02:58:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p377c-000cBd-SA
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 02:58:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7487761D12;
	Thu,  8 Dec 2022 02:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F3DC433D6;
	Thu,  8 Dec 2022 02:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670468332;
	bh=fcNRUbmbqoevqmCMcSREDYQEKvN34Jrs3zIaqY83b2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtpQyaZrIX7BpMrkVOUXb/dLH5wHwvILNQj0ZNeWEX0WewbK+GV5442bXm4HSlPVp
	 j+O8Y1A8H+fZoo33jkGT2r00z28ARK2VLMsoxFG0y/yzotwqtNDkb+DCvParqVcdlk
	 IbNcT7yi/xMmgX53+iM28lxkHBJC+BQAWQNdE51zozEG1Dqp2Mj7h+gQkYgMC0OWWD
	 m6+OqvYmeryTZGst96He3ibVPNOe65KfsEpmV10hABtqDFYMIY0KuAqNFbwy/srBC9
	 CM5by982YMKshTMtpVvAOCYZi2mVVj8S6oJuOhRQP1zhJDlLkBcaa9UgjoLKDy0sfS
	 7TKOsxhAbiXHA==
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
	ben@decadent.org.uk,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH -next V10 02/10] riscv: ptrace: Remove duplicate operation
Date: Wed,  7 Dec 2022 21:58:08 -0500
Message-Id: <20221208025816.138712-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221208025816.138712-1-guoren@kernel.org>
References: <20221208025816.138712-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_185852_992288_C0FBAC9D 
X-CRM114-Status: UNSURE (   8.34  )
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
kernel/ptrace.c and include/linux/thread_info.h

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
