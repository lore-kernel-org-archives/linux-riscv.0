Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1B8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 06:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SOaY35qxIy8pBQxq8q6Bl8hV48WVlocD9gsx0cL45Hk=; b=N0bZVcMqFqm95/
	6fGv5014iGth7009nuU8d1LhbezJoZp0ovhyPyDbczNxAIc5jKyyMKEKmixnNmi6lhwAQ6L8SeTfr
	B91arqHzKg6k8eUEhFIellEHTMmeQIzvmN0C4jrwAMue0IiywzwaMhi9V41jj/17c+3FLan2GED+z
	Yotna1r4l+bhNEVdtsbPRMxK1ZLkogLCysughbWN7xvy+fnpEk7dI6b8Nj57mevvhaY32TiqX2PAr
	Ytuqz4eZwUSQ3jFhEtI51gVN/xZj3RwN7q6kWo+nmRjejeAt+Ss1jWSjfanBHrAiwbKxd4fCoiZ49
	PY39xeCmNxOUD7CSXZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy4zG-006luC-0F;
	Wed, 01 Nov 2023 06:45:58 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy4zA-006lte-12
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 06:45:56 +0000
X-QQ-mid: bizesmtp68t1698821091tvb7u4r1
Received: from localhost.localdomain ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 01 Nov 2023 14:44:48 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: 3M0okmaRx3gxeEyH4BlqDeuloEyl32NdDWDCAwDSyK64HTzX/3liUnbfNDiz+
	sZcpbjY9p5B/dZFk8H1lKOIoJPxcVegVfzk/66o6v+sV5lnjG+djsJVpkmIsWpTilez6PcS
	wG3rH0s0qeISm34gMMW7Go0eab9EqbwaAlsjo94pCL5VpmuSmwp2+iwsJ5sRc0YjK2EEyDN
	4R+SsAo1eIxe5XgTejVkfuUJ6+ZT1PHSIaZss+kefmd4Xf9X2WUwuwkgOX38HUg15MtAUpP
	PZf2IJt4k0wS46++jcBsUH9D7+VWfWyVlvdL17lk8A2jZTCExwkSVprmWwImL8NK2Ejo5ZT
	kmTeZiNuWGehdme6164H/Yg2vxnQE5o7szoeegp
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1492668164630438734
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	keescook@chromium.org,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	jszhang@kernel.org,
	conor.dooley@microchip.com,
	andy.chiu@sifive.com,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	coelacanthushex@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] riscv: Support RANDOMIZE_KSTACK_OFFSET
Date: Wed,  1 Nov 2023 14:44:23 +0800
Message-Id: <20231101064423.1906122-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_234552_695756_67BEBE20 
X-CRM114-Status: GOOD (  13.04  )
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

Inspired from arm64's implement -- commit 70918779aec9
("arm64: entry: Enable random_kstack_offset support")

Add support of kernel stack offset randomization while handling syscall,
the offset is defaultly limited by KSTACK_OFFSET_MAX() (i.e. 10 bits).

In order to avoid trigger stack canaries (due to __builtin_alloca) and
slowing down the entry path, use __no_stack_protector attribute to
disable stack protector for do_trap_ecall_u() at the function level.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
Testing with randomize_kstack_offset=y cmdline, lkdtm/stack-entropy.sh
showed appropriate stack offset instead of zero.
---
 arch/riscv/Kconfig        |  1 +
 arch/riscv/kernel/traps.c | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6d..0e843de33f0c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -100,6 +100,7 @@ config RISCV
 	select HAVE_ARCH_KGDB_QXFER_PKT
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
+	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 19807c4d3805..3f869b2d47c3 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -6,6 +6,7 @@
 #include <linux/cpu.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/randomize_kstack.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/signal.h>
@@ -296,9 +297,11 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 	}
 }
 
-asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
+asmlinkage __visible __trap_section  __no_stack_protector
+void do_trap_ecall_u(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
+
 		long syscall = regs->a7;
 
 		regs->epc += 4;
@@ -308,10 +311,23 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
 
 		syscall = syscall_enter_from_user_mode(regs, syscall);
 
+		add_random_kstack_offset();
+
 		if (syscall >= 0 && syscall < NR_syscalls)
 			syscall_handler(regs, syscall);
 		else if (syscall != -1)
 			regs->a0 = -ENOSYS;
+		/*
+		 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
+		 * so the maximum stack offset is 1k bytes (10 bits).
+		 *
+		 * The actual entropy will be further reduced by the compiler when
+		 * applying stack alignment constraints: 16-byte (i.e. 4-bit) aligned
+		 * for RV32I or RV64I.
+		 *
+		 * The resulting 6 bits of entropy is seen in SP[9:4].
+		 */
+		choose_random_kstack_offset(get_random_u16());
 
 		syscall_exit_to_user_mode(regs);
 	} else {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
