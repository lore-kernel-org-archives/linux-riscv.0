Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D338C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 15 May 2022 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bnEf0aKGJ0w87yU+HyQ89LKx+kJCPsdkLsb7DKc/E8U=; b=O85FuTHNWGdEsK
	LKwjEO3Q0dSNaEktedKaunq19RPOGwIsEV136LAYUf+yI/zClvWppPP9cGUg2GMi2N0gvLliCIF2i
	oYVP5zEhUqRCns/yJ8g0pSF9PYnIsZwlueWce8X52PcUOnnRBGnn/Me9wkiR7F+y+/UH/r6smN5Sb
	BT2vmZeU03+Xl2LYDD+Sa476Bgdv5CZ3uPVvKBFhsSfCtrYaw0k4E3A+wp2vPA5E9kv6TSZEJntfU
	gHOSVX54XyO28ORYvZUvWZ+8J0bAzDeZ6bsQND4ovj+NJtQdPUS0A4Ib5/HGOBYAa1mLPZ/2Mu9rZ
	ykA79sAlEvbPTgOgmTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqE4r-00440L-1U; Sun, 15 May 2022 13:14:29 +0000
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqE4n-0043xj-8H
 for linux-riscv@lists.infradead.org; Sun, 15 May 2022 13:14:27 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VDAcGqu_1652620449; 
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0VDAcGqu_1652620449) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 15 May 2022 21:14:09 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: paul.walmsley@sifive.com, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 wangkefeng.wang@huawei.com, vitaly.wool@konsulko.com,
 rmk+kernel@armlinux.org.uk, ebiederm@xmission.com, tongtiangen@huawei.co
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, mick@ics.forth.gr,
 Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH] RISC-V: Add fast call path of crash_kexec()
Date: Sun, 15 May 2022 21:14:07 +0800
Message-Id: <20220515131407.946832-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_061425_524838_689B2A1B 
X-CRM114-Status: UNSURE (   8.76  )
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
	#0  0xffffffe00063a4e0 in test_thread (data=<optimized out>) at drivers/virtio/virtio_mmio.c:806
	806             *(int *)p = 0xdead;
	(gdb)
	(gdb) bt
	#0  0xffffffe00063a4e0 in test_thread (data=<optimized out>) at drivers/virtio/virtio_mmio.c:806
	#1  0x0000000000000000 in ?? ()

Test code to produce NULL address dereference,
	+extern int panic_on_oops;
	+static struct task_struct *k;
	+static int test_thread(void *data) {
	+
	+       void *p = NULL;
	+
	+       while (!panic_on_oops)
	+               msleep(2000);
	+
	+       *(int *)p = 0xdead;
	+
	+       return 0;
	+}
	+
	 static int __init virtio_mmio_init(void)
	 {
	+       k = kthread_run(test_thread, NULL, "test_thread");
	+       if (IS_ERR(k))
	+               pr_err("Couldn't create test kthread\n");
	+
	        return platform_driver_register(&virtio_mmio_driver);
	 }

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 arch/riscv/kernel/traps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index fe92e119e6a3..e666ebfa2a64 100644
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
