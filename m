Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE63C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 10:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cgVW7rTQsKCEDNvOxermtmBG3MzXTOXJqlMiS0yWDQ=; b=cBRFBbPEG03Exk
	Nonk5B52qhXKUcIW3nCQY5/q6l4ZJMndR6ouj8jtnlw/zgbBOA6COVYZtD3/pTh9WjJ8c9augbmkE
	ftieyAH8xic7zF3LYHv2Ml+w7Y+uu4is99aYSZcNlUkAXkLl8eaKTh7QwR25XtkTk5xdesauAbo6o
	7K5jlM0/JQ5XPkbT8cuDRpUltNDFcpu00+izixpikQMoTx1/pogEgnDqHwYlbtOF8jK+lqfTXGMGW
	8ZTscvu5q8Y3I+fRkhu0Rxo0bu9rYtgywXgqeu65c0DeHPJJ3pORXVC0exhDdQLt6Tn/2uibITLiI
	FC4XKGIXOdVdvsh8MfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD1HO-006Ipp-3Q; Sun, 17 Jul 2022 10:13:38 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD1HJ-006Imt-52
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 10:13:34 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0VJXih1g_1658052806;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJXih1g_1658052806)
          by smtp.aliyun-inc.com;
          Sun, 17 Jul 2022 18:13:27 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	heiko@sntech.de,
	guoren@kernel.org,
	mick@ics.forth.gr,
	alexandre.ghiti@canonical.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	crash-utility@redhat.com,
	huanyi.xj@alibaba-inc.com,
	heinrich.schuchardt@canonical.com,
	k-hagio-ab@nec.com,
	hschauhan@nulltrace.org,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH 1/5] RISC-V: Fixup fast call of crash_kexec()
Date: Sun, 17 Jul 2022 18:13:19 +0800
Message-Id: <20220717101323.370245-2-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220717101323.370245-1-xianting.tian@linux.alibaba.com>
References: <20220717101323.370245-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_031333_415412_7F19F3B6 
X-CRM114-Status: UNSURE (   6.92  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

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

Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 arch/riscv/kernel/traps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index b40426509244..39d0f8bba4b4 100644
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
