Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CA2C25B06
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRMrUaL07mRpQOyZc1w7ErgvbuJCPuAp8Fh21G2Elx0=; b=n4XqEtkGUg6wlw
	5eeTrXd0uflugTj81HwixHIWa9i2MHlHATI4VxI1FV3g1LOz+F6fyOAnPjgdZBebVMArQBNNSaLwI
	iE9X0bg2WUCwqiF6LRrqwrs2VzsGbJO4lx1QxgY8+nxJZ+YEeHr40mIlEC307HAxgMMA7fpWUk8hh
	jp+oizfVGPZ6Vj+LFzerQwsfyTXyGD3Yhut1kD8UHYoWeHEV4zsXOV1JUagPOUZEs4Hqkz7tqcseg
	C6BNDPWCj9tdPJUUom8h01EYHIIbU2CK/N2V0Gp6meLDZRQD94TcHFin0DYanOn+CnqSoRSwRlyWR
	SLXKA0t8Ph1B57+7pONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGU4-007vLz-Qc; Sun, 14 Aug 2022 16:29:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGTt-007vAZ-JW
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:28:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2668160F97;
	Sun, 14 Aug 2022 16:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE376C433D6;
	Sun, 14 Aug 2022 16:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494532;
	bh=IRbIsN0AupDAgZNVGkixlOAzpjRVaFRHazxcux/MI2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iT/+2JiG43Kh5DxcpEo586FKdv58a3AmkL2dgLXjS62rMaZgBJ45wPLAwAL1iAjEH
	 wTQKG8NFb4o6wDFYz8/zNRV+QZdZdkQ4V+FcrNIuiAQUbOSeL1x3q0zB3uB5Nf5vX5
	 OZV7sjSBVy2KlfbERGICZtjJYw4+TRgYaz8YuKIDfBYCo+cGqvdakbvAo6KyEWw6jE
	 hZPBN5yVu+11/l6YIwkqlor5BgoMINbxO8MSpKWSFSybM3X8IUQhwNkz2vBz2CN/ly
	 QoCbMDkxlAm5yjIDsWypxDBZbmnJZfCu07nCOIpkxSHmAiCAv4S1c6LwKkfSLJDfWV
	 bqwIDb1q3SCuA==
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
	heiko@sntech.de,
	ebiederm@xmission.com,
	akpm@linux-foundation.org,
	wangkefeng.wang@huawei.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 07/16] RISC-V: Add fast call path of crash_kexec()
Date: Sun, 14 Aug 2022 12:28:22 -0400
Message-Id: <20220814162833.2398478-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162833.2398478-1-sashal@kernel.org>
References: <20220814162833.2398478-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092853_852743_78B51B12 
X-CRM114-Status: GOOD (  10.12  )
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
index 473de3ae8bb7..ae462037910b 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -15,6 +15,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/irq.h>
+#include <linux/kexec.h>
 
 #include <asm/processor.h>
 #include <asm/ptrace.h>
@@ -43,6 +44,9 @@ void die(struct pt_regs *regs, const char *str)
 
 	ret = notify_die(DIE_OOPS, str, regs, 0, regs->scause, SIGSEGV);
 
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
