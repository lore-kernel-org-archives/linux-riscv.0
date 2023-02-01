Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3E2C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 04:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=48axG6DG9wCTzAeG+qzrQMzwe0T05H7BqiJHiuB12oA=; b=Yt7/K+PU47YY01
	h6NfP3F/F8uFewVCMMAPIatlypZ/RH1Kpble8M7twMWVBjH1qPBOUfZXeNdNlVRBAIr0JuutSJ59U
	bM3xknbP3nQhnYJue5SASta+LTeEoR0xaxub/y3jkiSBn5DQSBOqJOu0CdOhVyPhweOLS0eNYN7/c
	vCmm1tSbvPjZJ+8rZaibckq6NDPvVBvt1+D7p1KEa6rC3XKun5ESSL25kUIYKrZArh1S5ZzCxXlOC
	uksa6J9sdcIiU169P0vpvE9ecNrsVx6Z0QgtthXjWTmSYHRNwRHqFTZRkaVykANHndwxIr6XMsElj
	72D9St8sFTdXYA7IgFYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN4O3-00ACFU-Hd; Wed, 01 Feb 2023 04:06:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN4O1-00ACF3-52
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 04:06:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 28306B81F76;
	Wed,  1 Feb 2023 04:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BE2C433EF;
	Wed,  1 Feb 2023 04:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675224372;
	bh=9lL8tq6WYJ4419UUBwmrU3ts13QvrafA4MrEPG10cP4=;
	h=From:To:Cc:Subject:Date:From;
	b=kLnLLOLemgxLnF5LHv9xce36WDQuVTpnidJmtZQ41pRBql66gcNNcl2IdhnXmlZCw
	 xr3jpQ5/wbqCmKsd6TUt9lQuj/0tkRhFLxQmuW4p22epyJg7WsNW+FMD1NDc3Mv26e
	 yGBM6RwGeqGjtoigjpMLOV17+kgiJagFqbdevwEjkjQOajVS/mMLZll7vYCJ85PRpB
	 fbROS3ed7WPQrYMCH+rXYZxxUsnCWN/TZRfX6M+Jwe8wzS8gSkq0yCzBeIb9u1O7fI
	 92jyus9XyIoUU7b7pK0jp9qgeevvAeisJnObKGTEON5yNSNy9uOl/8HlK0tU1qx1hw
	 FSum8unn/d4/A==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	liaochang1@huawei.com,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2] riscv: kprobe: Fixup kernel panic when probing an illegal position
Date: Tue, 31 Jan 2023 23:06:04 -0500
Message-Id: <20230201040604.3390509-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_200617_512975_D207A0FF 
X-CRM114-Status: GOOD (  12.58  )
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

The kernel would panic when probed for an illegal position. eg:

(CONFIG_RISCV_ISA_C=n)

echo 'p:hello kernel_clone+0x16 a0=%a0' >> kprobe_events
echo 1 > events/kprobes/hello/enable
cat trace

Kernel panic - not syncing: stack-protector: Kernel stack
is corrupted in: __do_sys_newfstatat+0xb8/0xb8
CPU: 0 PID: 111 Comm: sh Not tainted
6.2.0-rc1-00027-g2d398fe49a4d #490
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffff80007268>] dump_backtrace+0x38/0x48
[<ffffffff80c5e83c>] show_stack+0x50/0x68
[<ffffffff80c6da28>] dump_stack_lvl+0x60/0x84
[<ffffffff80c6da6c>] dump_stack+0x20/0x30
[<ffffffff80c5ecf4>] panic+0x160/0x374
[<ffffffff80c6db94>] generic_handle_arch_irq+0x0/0xa8
[<ffffffff802deeb0>] sys_newstat+0x0/0x30
[<ffffffff800158c0>] sys_clone+0x20/0x30
[<ffffffff800039e8>] ret_from_syscall+0x0/0x4
---[ end Kernel panic - not syncing: stack-protector:
Kernel stack is corrupted in: __do_sys_newfstatat+0xb8/0xb8 ]---

That is because the kprobe's ebreak instruction broke the kernel's
original code. The user should guarantee the correction of the probe
position, but it couldn't make the kernel panic.

This patch adds arch_check_kprobe in arch_prepare_kprobe to prevent an
illegal position (Such as the middle of an instruction).

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
Changelog
V2:
 - Fixup misaligned load (Thx Bjorn)
---
 arch/riscv/kernel/probes/kprobes.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index f21592d20306..41c7481afde3 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -48,6 +48,21 @@ static void __kprobes arch_simulate_insn(struct kprobe *p, struct pt_regs *regs)
 	post_kprobe_handler(p, kcb, regs);
 }
 
+static bool __kprobes arch_check_kprobe(struct kprobe *p)
+{
+	unsigned long tmp  = (unsigned long)p->addr - p->offset;
+	unsigned long addr = (unsigned long)p->addr;
+
+	while (tmp <= addr) {
+		if (tmp == addr)
+			return true;
+
+		tmp += GET_INSN_LENGTH(*(u16 *)tmp);
+	}
+
+	return false;
+}
+
 int __kprobes arch_prepare_kprobe(struct kprobe *p)
 {
 	unsigned long probe_addr = (unsigned long)p->addr;
@@ -55,6 +70,9 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 	if (probe_addr & 0x1)
 		return -EILSEQ;
 
+	if (!arch_check_kprobe(p))
+		return -EILSEQ;
+
 	/* copy instruction */
 	p->opcode = *p->addr;
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
