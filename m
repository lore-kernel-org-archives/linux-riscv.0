Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF6EC55184
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:From:Cc:To:Mime-Version:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nqEOao1fVXUaO3cAb8yb9+ZYaV2nQ0aDG9UCX/uLkkw=; b=jTMEm5FxsQtWcb
	+xoYjfzNYSpxK1NNw8fRB9SjTuXOH8Z4d3IBKf6nP3grmUaeDkK2IlUbe7LkiuHLh365odyxwsNbn
	5462w1ZwFR34xyynkuQ4383tJopXnfGNVu3omEHatWgXPXxYVkC2NHsHl+HE/Lyl+OwOy9GXto4Qa
	ovDS4P8+msCdkc1ShkW5o+Ml4PjVsNZFOJqAm3G31F1qZChTqtWwyadIBc39r4mhbDEswSgkaYOb+
	jWMh1P2+lXFwRlmxhNpiBit6iyws42RSJ2vLHM8byLb9XcBxoSfCC0Bmk70INqXogO6TQmByMKxeg
	YAJCuASDWPWcv2az8Veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8st-0000000194X-1i6k;
	Tue, 04 Aug 2026 06:44:19 +0000
Received: from va-1-114.ptr.blmpb.com ([209.127.230.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8sq-0000000193w-2RTq
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 06:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1785825843; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=WIsLlus2jsqnby9mK4MdBDvjpnF7QpuhWuL6ZpAFUso=;
 b=AoH2goO1jyLpzUYKB+6wtce1xh2JYhJXVsbOCl2ECrVliu+7RjSZtzm100aiMwy8q7syFl
 V1M7RJMNrDTeurV2cN0Zp4vjDcJvu4XqCeLPcJfuzG5C5Si0WFex4gfsUQXbzowT3HI1hY
 VXJGR2AhKcWYeG64bF+8ZPDoVP5Ftao7/NX2GROzqMGoxc8C/pv9I/LUx52dRmpPyPw6Un
 3uGG09hTfi+gOBI0FtDrxUMSSU+V9V3tnrLGXBoQYaBsYFN62p1VGS5dTkxjApkHYdh/72
 G78jP9shK6RbSj3W9U8YXvBAEWITMrni8KRhhXY6aA51d957Ya9tcBKWSAvu/w==
Date: Tue,  4 Aug 2026 14:43:41 +0800
X-Lms-Return-Path: <lba+26a718a31+05c022+lists.infradead.org+qirui.001@bytedance.com>
Subject: [PATCH] riscv: kprobes: Prevent probes in breakpoint handlers
Mime-Version: 1.0
X-Original-From: Rui Qi <qirui.001@bytedance.com>
To: <linux-riscv@lists.infradead.org>
X-Mailer: git-send-email 2.20.1
Cc: "Rui Qi" <qirui.001@bytedance.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Thomas Gleixner" <tglx@kernel.org>, "Zong Li" <zong.li@sifive.com>, 
	"Conor Dooley" <conor.dooley@microchip.com>, 
	"Nam Cao" <namcao@linutronix.de>, 
	"Lukas Gerlach" <lukas.gerlach@cispa.de>, 
	"Deepak Gupta" <debug@rivosinc.com>, 
	"Ryan Roberts" <ryan.roberts@arm.com>, <linux-kernel@vger.kernel.org>
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <20260804064343.1865283-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_234416_698513_7B116EE0 
X-CRM114-Status: UNSURE (   6.10  )
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
---
 arch/riscv/kernel/traps.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 2f57fd48ec28..5eb5785874dd 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -270,6 +270,8 @@ static bool probe_single_step_handler(struct pt_regs *regs)
 	return user ? uprobe_single_step_handler(regs) : kprobe_single_step_handler(regs);
 }
 
+NOKPROBE_SYMBOL(probe_single_step_handler);
+
 static bool probe_breakpoint_handler(struct pt_regs *regs)
 {
 	bool user = user_mode(regs);
@@ -277,6 +279,8 @@ static bool probe_breakpoint_handler(struct pt_regs *regs)
 	return user ? uprobe_breakpoint_handler(regs) : kprobe_breakpoint_handler(regs);
 }
 
+NOKPROBE_SYMBOL(probe_breakpoint_handler);
+
 void handle_break(struct pt_regs *regs)
 {
 	if (probe_single_step_handler(regs))
@@ -301,6 +305,8 @@ void handle_break(struct pt_regs *regs)
 		die(regs, "Kernel BUG");
 }
 
+NOKPROBE_SYMBOL(handle_break);
+
 asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
