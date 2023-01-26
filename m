Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD40C54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VHYbZofhPTcufBRlKp81KvGgCaBjkLrwKnaaOuXB5jQ=; b=wWheq8HEqs4rES
	nlIrkMYLOxruyTMhmeDRl63vmMZg8Ms2pMwhJsHjj0otiJQCSI9LEn6o+L9SEOsFwv0fWuOtGviu8
	ID/E6LBr3fMOng0e7cDi8KEwh1SJV7/AlOmBOHWe8Ti1gMvjCo8rJLv6/lcsFhA1nDTnBRvpKHBGH
	ZTYlCfNwooGa5wHXRqPp3bU/Jfhp2TLdBMmYaZZ3lcGwx+Qsws5RFMg21ckHXCL+7LaEREN84tNFE
	17VRiTgW+d1Ey8sKHrm7DeRVCQYMIqJ8fPoyR4eYv6MBCRYyVNbRADjXvPHgcMnc2sCZE0tyL6Gbs
	rEiaBzg/WNHDsmLNT0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL1wZ-00AuAg-Da; Thu, 26 Jan 2023 13:05:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL1wR-00Au8p-EV
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 13:05:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D9F7617BD;
	Thu, 26 Jan 2023 13:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9C4C433EF;
	Thu, 26 Jan 2023 13:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674738320;
	bh=tDQ+nCHdEwE/4jiYgtIlBrjarZhJE5C4ooQwzB7BIf4=;
	h=From:To:Cc:Subject:Date:From;
	b=CSHNJpitMu0/yXRFWW+6TrTMmKV5hUhWXvvXbrsL+cXA2qRwC1LAHlyfqY1szKbig
	 QUmwimRD7tEgZnDLzjUKDsb6AxckOuQ/VX2TYdm9xRmatcWxMbdaW09vIr25sAG/SE
	 Zj9/k6DdQDcc2X7dc/BgleeTZvC62doY0ENOomR74YAl3XmVk1BJ2drxdQJj93Lhq1
	 dvFkU8Nza2YUscbNKlvmksg+V14Z1A9QsgQFIznVOuaGLTDuJq2d8Q/3uW8KVoIbK7
	 pIuVGbKYbCiKadpG5yHqs4Pb/tGwJ764uDcNA7FWRQ8m9reP0eSHHWBehMt26Sjvzz
	 tCMUtyPuoda1w==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mhiramat@kernel.org,
	conor.dooley@microchip.com,
	penberg@kernel.org,
	mark.rutland@arm.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: kprobe: Fixup kernel panic when probing an illegal position
Date: Thu, 26 Jan 2023 08:05:09 -0500
Message-Id: <20230126130509.1418251-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_050523_610253_C6952EA7 
X-CRM114-Status: GOOD (  12.15  )
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
 arch/riscv/kernel/probes/kprobes.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index f21592d20306..475989f06d6d 100644
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
+		tmp += GET_INSN_LENGTH(*(kprobe_opcode_t *)tmp);
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
