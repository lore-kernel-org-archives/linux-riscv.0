Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2C6C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ve+bwgCjXjqy8xWdqYfrdwPWwbwKoetMlj00vtPQH88=; b=bdlzTMju/G6hNM
	0x+aCSzI4wOIvcZIqmIogMRVc3WN6IvhNoywi1qkBgaxmcvSSr7Z4ROO8jbanUo3LzanfEcfh+lw9
	44PiSlWd1PZFMiwqDMEz/QTim0FOkFSs/ylepplO8fNuLC43KRmweRhl3aN0dAdOyH2oRl6dML5NW
	EJXHxdBdUtqKGURqYUlwlTlhokjipTO0hXgiWga5YKcBEi4MCC4hkeNRabfiBM/siGLK1KiE6claX
	nYfL0orsrkB6PRzwpItsJYuDYsiyxMmrXYehw+dbgtCvl3F00GSNyP/gOKLrC+ZiSA6dYZthVmuX3
	Y1XN+12dqDKRgrArwGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdSy-00D3TZ-2E;
	Thu, 18 May 2023 13:14:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdSw-00D3SA-1O
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:14:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F117564F3A;
	Thu, 18 May 2023 13:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFA6C433D2;
	Thu, 18 May 2023 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415685;
	bh=Se41gQju7esb4eo2kifFLRU4bWbFiAHi/+vBMhWFQy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MH7FFdjhv5/hwrAsCy6lfMY4l1Pv83IQ3w11GbxsYD7Ik2s+QS8pDGhZ6tyd1KEsU
	 Xz3FO+/ymMs95ohrSpWHUn5SoUBC0hv0Ej83cPs/kmPU8agDD15hAISzoxm/ffXp1V
	 YtuRbt1TUwzUk559iBRqmIcU/wY+KE9jBmTfAGtMndWJkwkk6ezO3f5D5tOpxWX/Jz
	 P4YM2DZn0pWXFKnp9QoA7XZFX4UMltBJgdhSQS+ROAXz4qwryh9z2lwmEqbyuTORNB
	 Peuj6Bg8E/egQtYpwH90ipyySQSrTPJfYH/PsolmL2DeIRbeQA/K+AATERyx9p+/97
	 u687mEIT/evLQ==
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
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 21/22] riscv: s64ilp32: Correct the rv64ilp32 stackframe layout
Date: Thu, 18 May 2023 09:10:12 -0400
Message-Id: <20230518131013.3366406-22-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061446_552682_DD566C1A 
X-CRM114-Status: GOOD (  10.41  )
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

The callee saved fp & ra are xlen size, not long size. This patch
corrects the layout for the struct stackframe.

echo c > /proc/sysrq-trigger

Before the patch:

sysrq: Trigger a crash
Kernel panic - not syncing: sysrq triggered crash
CPU: 0 PID: 102 Comm: sh Not tainted 6.3.0-rc1-00084-g9e2ba938797e-dirty #2
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
---[ end Kernel panic - not syncing: sysrq triggered crash ]---

After the patch:

sysrq: Trigger a crash
Kernel panic - not syncing: sysrq triggered crash
CPU: 0 PID: 102 Comm: sh Not tainted 6.3.0-rc1-00084-g9e2ba938797e-dirty #1
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<c00050c8>] dump_backtrace+0x1e/0x26
[<c086dcae>] show_stack+0x2e/0x3c
[<c0878e00>] dump_stack_lvl+0x40/0x5a
[<c0878e30>] dump_stack+0x16/0x1e
[<c086df7c>] panic+0x10c/0x2a8
[<c04f4c1e>] sysrq_reset_seq_param_set+0x0/0x76
[<c04f52cc>] __handle_sysrq+0x9c/0x19c
[<c04f5946>] write_sysrq_trigger+0x64/0x78
[<c020c7f6>] proc_reg_write+0x4a/0xa2
[<c01acf0a>] vfs_write+0xac/0x308
[<c01ad2b8>] ksys_write+0x62/0xda
[<c01ad33e>] sys_write+0xe/0x16
[<c0879860>] do_trap_ecall_u+0xd8/0xda
[<c00037de>] ret_from_exception+0x0/0x66
---[ end Kernel panic - not syncing: sysrq triggered crash ]---

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/stacktrace.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index f7e8ef2418b9..cea8aafbecca 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -8,7 +8,13 @@
 
 struct stackframe {
 	unsigned long fp;
+#ifdef CONFIG_ARCH_RV64ILP32
+	unsigned long pad1;
+#endif
 	unsigned long ra;
+#ifdef CONFIG_ARCH_RV64ILP32
+	unsigned long pad2;
+#endif
 };
 
 extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
