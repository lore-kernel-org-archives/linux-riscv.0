Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDD3C43219
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 01:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk9CMgGG3uoKF5XXw1QN56Li+fkqrYGc32kw0Ahc84I=; b=vrH5SuKzWwQ2Na
	gn8W6fz+jY+iyv0/L/jILm0KzxeduHuLeiaJacOLALp43GtyhUGoW11iZAu5OGIngyTkyU+R2/3iw
	sS9TkKNj5JCTTKUi+2YUCExMq5e7xzjK2ml/o2/xz+uAKtK191EE8gX6ZSwIrGukbGkliVQ53i5cW
	JTmOso2UOdCqqL13RvmAP8mnS9FSbchO0s4unslzCvr50fKuiLfxWQyurg2wgCU6dmGYMxHUFHusE
	o7NXAzAFDtAZFNYv1woN/pCLkCTtk1LMqazc9P3Sir6MlLmSoqOXK/FG65NmbxJV846F5lmoYUyrB
	BNQqSEKttc/Pl0KaiiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenjo-00GrQM-4V; Sun, 02 Oct 2022 01:25:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenjl-00GrPR-Id
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 01:25:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06BF360DD7;
	Sun,  2 Oct 2022 01:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C75C433D7;
	Sun,  2 Oct 2022 01:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664673943;
	bh=thj4lp5B0J2/kj7Zi1BMTTtT9fAnJMteMKwuLQ0ArOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WUBoCUyhvdRDzQHAvvX7bbmPai+mllpQvReXbilknRVD+Vp5tDQirdG+H9jqqjYqx
	 W909SclMyLyWpOYfJWo1Gh2mjhtvWVcnSlKtaa67yLEZpskYRlE/cfJY9bCZES4AFm
	 xZFnjsF3cZdUsQfHmQKKGYR93JVB5T+Ai432iTbNNW1k4IFC8+t6akucDpq1wif+1R
	 scCtTeOoMHdadzFh0X2vd67Kk01yQyJuVcgHZUh4H+t0jhmfYv7vkISM40FyPzY3uk
	 MkmYA1rGydZmm2+LTKAmRW16HeoW+KQyJ5jLsatEsv+4GJufbqiV7F14BTu0MpJXo8
	 rqWlHbTv9/0hQ==
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
	chenzhongjin@huawei.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH V6 03/11] riscv: ptrace: Remove duplicate operation
Date: Sat,  1 Oct 2022 21:24:43 -0400
Message-Id: <20221002012451.2351127-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221002012451.2351127-1-guoren@kernel.org>
References: <20221002012451.2351127-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_182545_673561_E87C73CE 
X-CRM114-Status: UNSURE (   8.47  )
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
