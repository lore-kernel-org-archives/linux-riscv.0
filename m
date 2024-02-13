Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1553EC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:CC:Subject
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dkznFA5Qw2EeDUvesY8h3uplK07wmQ+Vi3hLHmn/Ebs=; b=sAfcz3Xx3DrOZw
	U+fgt3GH4OEWhGC5a7JqJWIBpnY7YpuAgeOgriw1mUa0fbo/vx8Oh4UMyqw02meOjAsxBP3vIzfei
	p0D+IRJW4CnpBzfnAPtA5BqDZHNzoK0v8CLHFsR7GCD9GLCYyvGldjWKlOT6h7tKfLnG6G3zHzyme
	M0OzVxHf94M2Y9Wjgu5AIs1LR5UsETvHGoZbQIMQErBJVRrQJIJngXRZ3MAh4ewhGg4t9JPPatvBQ
	RXQn7amPwIHeV1AF5seWYnnDKWhRenh7DMVOnsA5P3wm6L85Nx7pQXhkka/1mT66K6HRQFOErbmUb
	o4rUBx4UtdTpXGqa8+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpaB-00000008jPw-0a6w;
	Tue, 13 Feb 2024 10:00:07 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpa4-00000008jLp-2SHX
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 10:00:06 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id B674D22002;
	Tue, 13 Feb 2024 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707818398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=1ZWzJ3oPo3Ib0Ua7vx9StT0Wv7lYZFu4fgLyeQS1pes=;
	b=aazcc5tevLdTt0WjT8FzXkfjI+oKNQaGJ5R6n524YasDA1Q0fQAL0btyFuZCUz9PMvRpLb
	1gH3VuTwB16qrJlDFyYNHn0LSdzFez9QmuCeeFPdUu+ekkA3mmwg5k6i6eZPVkKafowYh9
	TgJbzB/XWnhXdbLEui9LXX1eOQLDr5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707818398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=1ZWzJ3oPo3Ib0Ua7vx9StT0Wv7lYZFu4fgLyeQS1pes=;
	b=15BrQU++xcqWxIGQDgUi/HLbUrr9JpnjDLv1l873/VEJjdCBaFEeRBl8WVQz9dFB5Px6p3
	PNjYQj5UX82yQZCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707818398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=1ZWzJ3oPo3Ib0Ua7vx9StT0Wv7lYZFu4fgLyeQS1pes=;
	b=aazcc5tevLdTt0WjT8FzXkfjI+oKNQaGJ5R6n524YasDA1Q0fQAL0btyFuZCUz9PMvRpLb
	1gH3VuTwB16qrJlDFyYNHn0LSdzFez9QmuCeeFPdUu+ekkA3mmwg5k6i6eZPVkKafowYh9
	TgJbzB/XWnhXdbLEui9LXX1eOQLDr5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707818398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=1ZWzJ3oPo3Ib0Ua7vx9StT0Wv7lYZFu4fgLyeQS1pes=;
	b=15BrQU++xcqWxIGQDgUi/HLbUrr9JpnjDLv1l873/VEJjdCBaFEeRBl8WVQz9dFB5Px6p3
	PNjYQj5UX82yQZCw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id A038A4A03A6; Tue, 13 Feb 2024 10:59:58 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: use KERN_INFO in do_trap
CC: Palmer Dabbelt <palmer@dabbelt.com>, Yunhui Cui
 <cuiyunhui@bytedance.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org
X-Yow: What GOOD is a CARDBOARD suitcase ANYWAY?
Date: Tue, 13 Feb 2024 10:59:58 +0100
Message-ID: <mvmh6ic1y75.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.81 / 50.00];
	 TO_DN_SOME(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_SHORT(-0.17)[-0.842];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.54)[80.78%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_020000_808904_4B7419F7 
X-CRM114-Status: UNSURE (   8.29  )
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

Print the instruction dump with info instead of emergency level like the
rest of the output when printing the information for an unhandled signal.

Fixes: b8a03a634129 ("riscv: add userland instruction dump to RISC-V splats")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index a1b9be3c4332..142f5f5168fb 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -121,7 +121,7 @@ void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
 		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
 		pr_cont("\n");
 		__show_regs(regs);
-		dump_instr(KERN_EMERG, regs);
+		dump_instr(KERN_INFO, regs);
 	}
 
 	force_sig_fault(signo, code, (void __user *)addr);
-- 
2.43.1


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
