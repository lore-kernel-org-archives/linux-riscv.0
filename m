Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4607C54EE9
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 16:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk9CMgGG3uoKF5XXw1QN56Li+fkqrYGc32kw0Ahc84I=; b=JcAQZtijFhZZR9
	NPtCOuxB3FGo7Vlmlmyvqk4Byt/grfwqLTLPx88TJuoCxkjBDqIK0NVCjerxf/+9e5U5w0SV9vK/z
	VtvrcEnA5Dt5K+aGY3UN/4oMFWO0Hb+6WIkTMwdHKDQ8e8Cyb3F9Ec54XdhexosYgUOMbhc7jLYsl
	CN8i3QH+L5U7+G+/YlmKWotj6/KFsy60JzZtFzql6tWJLUKEQMGQjVymCDO8vRVK317Vg/3DdtcGU
	2qjSw9SZmpdFJ5JBCxXywNNLvGu+yv2vPD3OHobwSpCbjJmm6jjPbIJL4XsPAoHBsU8OI6un7NhcJ
	PoadOJNiefjTiSAjiytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVwB-00DXVg-8k; Sat, 03 Sep 2022 16:24:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVvy-00DXJ8-Oy; Sat, 03 Sep 2022 16:23:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 31E17B80B01;
	Sat,  3 Sep 2022 16:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD98C4347C;
	Sat,  3 Sep 2022 16:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662222227;
	bh=thj4lp5B0J2/kj7Zi1BMTTtT9fAnJMteMKwuLQ0ArOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L1+aqePh3YUl08I/8fm3yNxtjuAlMmF22bx5ehpr9WT67qVfD+H89UCSkcQb/aLVB
	 2NgCQIILKBmcne0lsXQ4IjY3kiwJxrtWEcVDUccBIwJj+xp2BBbv39/+Grkh4ufLkt
	 K91rg+/bdppmXjHBKL8/+fsOwTwEh6RA27omRUzQiTPDRz8Ke7YGMSqk5VWbmO8V0g
	 cuN032j9tv98WDWH8CRTakVr3d5ZHL/aAuIuVJy9h6CrYmFwF6TJSlC05IZMYI+l9p
	 sn7aIfOyaWt05CVB+QByWImFn4GjzoARn6PGsB37TcCAMXurxtZTf+xyhaxTSjNZpx
	 M7BmVLEk5oE7g==
From: guoren@kernel.org
To: oleg@redhat.com,
	vgupta@kernel.org,
	linux@armlinux.org.uk,
	monstr@monstr.eu,
	dinguyen@kernel.org,
	palmer@dabbelt.com,
	davem@davemloft.net,
	arnd@arndb.de,
	shorne@gmail.com,
	guoren@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	sparclinux@vger.kernel.org,
	openrisc@lists.librecores.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 1/3] riscv: ptrace: Remove duplicate operation
Date: Sat,  3 Sep 2022 12:23:25 -0400
Message-Id: <20220903162328.1952477-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220903162328.1952477-1-guoren@kernel.org>
References: <20220903162328.1952477-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_092350_989012_86DE35F2 
X-CRM114-Status: UNSURE (   8.99  )
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
