Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FDCCDB470
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 20:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JSs8goDNne9rNxww1V7oH1Zcoa4mNf4y+iEkR+FGWhY=; b=XEWUZM8Q3I7wtG
	IpodszlzgdXhCA8H2H+AFUZVXd0i6zb+lfQ0tNgo91dDxVkYM4EJPCouGkkqJ8vcsb/nbzYlGkNat
	a4gYETGC5+JT0+dG3Pa6KNBN9y6mPytt/jLhwMwyTcQDcSV2v5RzxHDPDzDW5dfyYF9bG8PRvP7Dl
	VCqnWs5/qTP7AB29WxMWTzNvjo/G5hFUrgS1mR3hXwJIijt30+/MctGTXvxCDbA0T+kivfcp3xLdL
	7faPYMfXYKHapQy+NW00Li9hmzsaNvEXU/xkeIGBhSd0TF/0PNDfjWEY9jkd2+ldcVzX2o1wNiMI1
	Q7fQvSJg3XnPVpkVjZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7wS-00000006rQA-4AHs;
	Tue, 23 Jun 2026 20:41:57 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7wQ-00000006rPc-0L6o
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 20:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=lv+vJNREaOn5aOwVpMHt0ri4HzzK+1NBESAp8W9uIc0=; b=hbLsGJ1Uai+53IxWB2xlba58YQ
	egjXjBPOFpsDBpCTUsEm9AVsydad5+xV06z7fa32GagL6xa9fNN0/0ZTJa9ccBYpVUsx75krbUQgH
	DVi6uGeKWYXr5HjFju5g/ZOoohs+5funzP0Cb3BsV627wJzVsgipR7LqdbPEzXnhh4N8rTQQIUcA7
	HymHlvizR9M/ltcgNaBKVTKek96HxnI5oyTrgy9tfDnUZhobVeQ7y2trf8S7wac6v2bG1PhOLcP3y
	5pO41rZA5kW50M+rBpBArnizxdjAHOGmLErAv+yFUnb92qB+eaq9dVJ1wKLi7JuHEnYNjYS48YyZZ
	DJ6dnkKg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wc7wD-00000004gJ2-3vII;
	Tue, 23 Jun 2026 22:41:41 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jim Shu <jim.shu@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Joel Stanley <joel@jms.id.au>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH] arch/riscv: vdso: remove CFI landing pad from rt_sigreturn
Date: Tue, 23 Jun 2026 22:40:57 +0200
Message-ID: <20260623204058.498120-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_134154_180887_9837973B 
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

When CONFIG_RISCV_USER_CFI is enabled, the CFI version of the vDSO, has
a CFI landing pad instruction at the start of __vdso_rt_sigreturn. This
breaks libgcc's unwinding code which matches on the first two
instructions. Other unwinders that rely on similar instruction matching
may also be affected.

Since __vdso_rt_sigreturn is reached as part of signal-return handling
rather than via an indirect call/jump from userspace, it does not need a
CFI landing pad. Remove it and restore the instruction sequence expected
by existing unwinding code.

This matches what was done on arm64 in commit 9a964285572b ("arm64:
vdso: Don't prefix sigreturn trampoline with a BTI C instruction") for a
similar issue.

Fixes: 37f57bd3faea ("arch/riscv: compile vdso with landing pad and shadow stack note")
Co-authored-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/kernel/vdso/rt_sigreturn.S | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/rt_sigreturn.S b/arch/riscv/kernel/vdso/rt_sigreturn.S
index e82987dc37394..f6b053d3bb798 100644
--- a/arch/riscv/kernel/vdso/rt_sigreturn.S
+++ b/arch/riscv/kernel/vdso/rt_sigreturn.S
@@ -7,11 +7,18 @@
 #include <asm/unistd.h>
 #include <asm/assembler.h>
 
+/* WARNING: Do NOT add a CFI landing pad at the start of this function.
+ * Unwinders such as libgcc identify the sigreturn trampoline by matching the
+ * instruction sequence. Adding a landing pad here would break unwinding from
+ * signal handlers.
+ *
+ * This trampoline is used only for signal return and not via an indirect
+ * call/jump from userspace, so adding CFI landing pad is unnecessary.
+ */
 	.text
 SYM_FUNC_START(__vdso_rt_sigreturn)
 	.cfi_startproc
 	.cfi_signal_frame
-	vdso_lpad
 	li a7, __NR_rt_sigreturn
 	ecall
 	.cfi_endproc
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
