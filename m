Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9FBC25B0E
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrhYc4n90JqfPRNJTXQycCYPDmHZD08E3uVK14gAfPA=; b=yNBl1xin8hUKvB
	C6MBUjtFe0dw0CAktcqlQMEPXBqv9p/6qpS9fi3KEuvY7LnkaN9ocBs+YKpB/otdSQSCF5rXZqwCD
	DFJSbge8wmUn5tLUwXyXMwip/HpAmUomipq8qyquMo/fQ+pFao+QMy1rVoRNl+AXBWp4hhIkCqiaN
	nvSLlbfCT7iDt0piVgTtMuATBOd5FmeLwv3xFtoi2Hzfm7FsU1P7KuYd2++Mm9+FxxZEfhZhFBXSM
	5Qa+2t5JoTbSQRmrkZ9wg/9D9bVf1LsZ38Fz8PAhpz+XRpK4BGEvjVh5+HRzYAZ1tzMpNFsMCrBPR
	xNIxBfnZF+5aQhisIOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGSH-007tuD-NJ; Sun, 14 Aug 2022 16:27:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGRv-007teA-Ub
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:27:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 76B3860EF8;
	Sun, 14 Aug 2022 16:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56450C433C1;
	Sun, 14 Aug 2022 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494410;
	bh=rjjCfkyDLgishq46C0BsFbiiIVJXO157qW9QTrr4C8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D5bA8akNIEwG2piRlj2O5QQU1wXIJ/J6hmOvvsr8eW2lX4sSrw1IP6Pd9t+Vr4eTR
	 B20JW9IgoFqrzAljUAjh2Lt8Pc8KjYGa4dPcUM6HD3w/xBwc1koeU5q54iXbNzdk86
	 JJS4AzvO3v4Q6JlE3dxgM7qkMZioYWCmwWu9+l+rhFTb//Fn13ed/LoIeOHcr1sJgp
	 VK9Jc7yEi0/S+gA1sW2XDVl1hnNo6VsxeCEqww3LIOGuutYJpMaK8UD3s+dJeGvJp5
	 mbyB99JfYu+rnEXrdXbIajruzdiiJk57XWL0ws20kPAoRuPY9LLdc5Q7VgGbeZ8/Qj
	 uSNDDFSVdaH6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xianting Tian <xianting.tian@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ebiederm@xmission.com,
	rmk+kernel@armlinux.org.uk,
	akpm@linux-foundation.org,
	wangkefeng.wang@huawei.com,
	heiko@sntech.de,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 13/28] RISC-V: Add fast call path of crash_kexec()
Date: Sun, 14 Aug 2022 12:25:53 -0400
Message-Id: <20220814162610.2397644-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162610.2397644-1-sashal@kernel.org>
References: <20220814162610.2397644-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092658_619856_D02D10EE 
X-CRM114-Status: GOOD (  10.51  )
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

From: Xianting Tian <xianting.tian@linux.alibaba.com>

[ Upstream commit 3f1901110a89b0e2e13adb2ac8d1a7102879ea98 ]

Currently, almost all archs (x86, arm64, mips...) support fast call
of crash_kexec() when "regs && kexec_should_crash()" is true. But
RISC-V not, it can only enter crash system via panic(). However panic()
doesn't pass the regs of the real accident scene to crash_kexec(),
it caused we can't get accurate backtrace via gdb,
	$ riscv64-linux-gnu-gdb vmlinux vmcore
	Reading symbols from vmlinux...
	[New LWP 95]
	#0  console_unlock () at kernel/printk/printk.c:2557
	2557                    if (do_cond_resched)
	(gdb) bt
	#0  console_unlock () at kernel/printk/printk.c:2557
	#1  0x0000000000000000 in ?? ()

With the patch we can get the accurate backtrace,
	$ riscv64-linux-gnu-gdb vmlinux vmcore
	Reading symbols from vmlinux...
	[New LWP 95]
	#0  0xffffffe00063a4e0 in test_thread (data=<optimized out>) at drivers/test_crash.c:81
	81             *(int *)p = 0xdead;
	(gdb)
	(gdb) bt
	#0  0xffffffe00064d5c0 in test_thread (data=<optimized out>) at drivers/test_crash.c:81
	#1  0x0000000000000000 in ?? ()

Test code to produce NULL address dereference in test_crash.c,
	void *p = NULL;
	*(int *)p = 0xdead;

Reviewed-by: Guo Ren <guoren@kernel.org>
Tested-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Link: https://lore.kernel.org/r/20220606082308.2883458-1-xianting.tian@linux.alibaba.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/traps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 0daaa3e4630d..b938ffe129d6 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/irq.h>
+#include <linux/kexec.h>
 
 #include <asm/asm-prototypes.h>
 #include <asm/bug.h>
@@ -44,6 +45,9 @@ void die(struct pt_regs *regs, const char *str)
 
 	ret = notify_die(DIE_OOPS, str, regs, 0, regs->cause, SIGSEGV);
 
+	if (regs && kexec_should_crash(current))
+		crash_kexec(regs);
+
 	bust_spinlocks(0);
 	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
 	spin_unlock_irq(&die_lock);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
