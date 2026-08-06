Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BB5C55ABA
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 04:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:From:Date:Cc:Mime-Version:
	Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jv2gK8sIOwpqv2KDE9t+UGZRHGywm/HFd38PCOZHXzE=; b=P/MuTALa1M7rIn
	4QrMHRhYDLgS1CvJYstNee6QDazN6nbcse5nc9eOme3BMPvPSx9dYecxGiazjjNBV2Es65nszIGyt
	j1M2MlhMUY/6KvSpMGQT7pdD6ePbGMxdDHPwZuJoU1Qk9/bZuGF0fNVcZhnC5fPwcRYSJnN99htut
	oFei3PcgtMoeISnThBlUDziOAhgnWPTlQBOlh/3/FLACmgwwJWu42B0PMhBWjR1lELtVW256MuLpt
	vvu3ocMEZKKRpg+a2SiEh+D5W55PTj5oeNOWMwJsmyhETzaKVaDhs6qS7lVHfEZQ+19uzOLC/cjkd
	n/8+1ckgbr4Bu8lWQENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrpsT-00000004uvs-18h8;
	Thu, 06 Aug 2026 04:38:45 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrpsP-00000004uvT-3a30
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 04:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1785991108; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=0NvufHV1DuUnAobHZ+tPyaPHH4Nw9Y/cqmIEp6HhDP8=;
 b=WmUAxrzLMEaLhLtqaFVkkDFLd7NHkl6um58UZt7A4pzabEI9EyRHyKSzYB+PHYdgvg3qyu
 ZRnX7clRUUwBdNAdsAR8ed2y1qAn8RMLytCRt6DbwHLB7ulGDKyIpsJgbJPjnYlK4EYwoj
 F7VxdHRAod4JG8oY+iqr8tfkxf8xkh8K8ma07jiIgXcxwP15jNI0hOBJ5vm5mEyRM/q7sK
 MP9foYm1xKM6UYScJ+c5I31/FMdVezimem9844sU4DfVY6TxrABoNFvD/UtId/GkiJY0UM
 Gq1MZwwq0j0Qw+WenAFnB1T+8kPv+FPkusGoka2msyLPxbZ4AKs/eohUtUeLUA==
X-Mailer: git-send-email 2.20.1
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Subject: [PATCH v2] riscv: kprobes: Prevent probes in breakpoint handlers
Mime-Version: 1.0
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a740fc2+9b716a+lists.infradead.org+qirui.001@bytedance.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, "Nam Cao" <namcao@linutronix.de>, 
	"Thomas Gleixner" <tglx@kernel.org>, "Zong Li" <zong.li@sifive.com>, 
	"Ryan Roberts" <ryan.roberts@arm.com>, 
	"Deepak Gupta" <debug@rivosinc.com>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Date: Thu,  6 Aug 2026 12:38:07 +0800
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <20260806043807.2583001-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_213841_972105_828A5CA8 
X-CRM114-Status: UNSURE (   6.55  )
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

The ftrace selftest multiple_kprobes.tc registers kprobe events on
the first 256 text symbols from /proc/kallsyms. If handle_break() is
selected as a probe target on RISC-V, the breakpoint exception path
can trap again before it reaches the kprobe breakpoint handler. That
recursively enters do_trap_break() and can make the system
unresponsive.

Mark handle_break() and its local probe dispatch helpers as nokprobe
symbols so they are added to the kprobe blacklist, matching other
low-level breakpoint exception paths.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
Changes in v2:
- Drop the blank line before NOKPROBE_SYMBOL() to match the local style.
- Add Nam's Reviewed-by tag.

 arch/riscv/kernel/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 2f57fd48ec28..f8292adda099 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -269,6 +269,7 @@ static bool probe_single_step_handler(struct pt_regs *regs)
 
 	return user ? uprobe_single_step_handler(regs) : kprobe_single_step_handler(regs);
 }
+NOKPROBE_SYMBOL(probe_single_step_handler);
 
 static bool probe_breakpoint_handler(struct pt_regs *regs)
 {
@@ -276,6 +277,7 @@ static bool probe_breakpoint_handler(struct pt_regs *regs)
 
 	return user ? uprobe_breakpoint_handler(regs) : kprobe_breakpoint_handler(regs);
 }
+NOKPROBE_SYMBOL(probe_breakpoint_handler);
 
 void handle_break(struct pt_regs *regs)
 {
@@ -300,6 +302,7 @@ void handle_break(struct pt_regs *regs)
 	else
 		die(regs, "Kernel BUG");
 }
+NOKPROBE_SYMBOL(handle_break);
 
 asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 {
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
