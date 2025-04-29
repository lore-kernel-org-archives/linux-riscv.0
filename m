Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA400C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 16:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IZOluMrSvFDYylKJ7Lx49cAIGn2bo7Brbw4cqCnvtkI=; b=fVmvPHzFT7DaxK
	Xu8xZApD7ZtyPYgSAqD8SM4NZ80p10h+OfLgwl5HFjDUyqCxYId2/VZy0+w9Zex/rTgF04K5aA1ak
	tnGHrjLxGLmPOyDOBzFK9RHhev17Z2Uno7sZL5dr0k5pSpGDeBZwOnXNsyTAQjFfBbA0HGoEizBu/
	8XYa6y7OMhIzAtFV63Y1vYoKBwkzAII+kkRNC1CqQtEHAICRv5JCrKXAqNCUZIgqQ61tqr2k0iyBV
	jYlUxV/BlNQV0a/MSmAQJWkJx8FPh8mdMFjc8KldCseWN9SJNBqITxM4QtetdikIPQbDskg6D+jJ0
	MkrlK0G+Zn3Q86bwZX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ni2-0000000AEwv-2WAP;
	Tue, 29 Apr 2025 16:21:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nbL-0000000AE14-3OdX
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 16:14:33 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745943268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qfL69VYEddMdBXsaXEyqXWeD+E6YG/rOeJLtsomd1uc=;
	b=aJVgesEDYo+Wr3Ayn7ihOQ3s194qDIi4yeVcaO8nUIYjoOK+4qu1BRRB20IxXvF0t3M6zr
	p/MUKqyNPcwVSjXploZCfOzJ/PIOjJrmo2M1eNLOTEEW+im0LrMV6XChBlxz3qCHWBLqcN
	L8OWoRUoN/3T2O4n94bpW5oNnKXVzulzJeal+u+z5Kl0sOZZYHOgvPnIeoSiR7Y0iDjIDf
	sbQmcAcGDjCrjMiEYKinjBU9ZlD5jupKYGbG4b9Sw4Y5tBr3tDHYjF0lMd4R6MuQzUkZ2w
	qpcRVAT3WoozOvgrU3nMzzWNJXrT9GqyOvim1T1+tdfD43+zk1um7+gfWh6pxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745943268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qfL69VYEddMdBXsaXEyqXWeD+E6YG/rOeJLtsomd1uc=;
	b=Lec00RY2NYzaBrbxa4Kahhmevdr2Ln760zQu6wLFShDGlR0rXTDIplE3tOUEQEsZ1geURU
	FZo2MPZUa8oJQ7Dg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Cc: Kai Zhang <zhangkai@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH stable v6.6] riscv: kprobes: Fix wrong lengths passed to patch_text_nosync()
Date: Tue, 29 Apr 2025 18:14:18 +0200
Message-Id: <20250429161418.838564-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_091431_986894_04959B69 
X-CRM114-Status: UNSURE (   9.51  )
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

Unlike patch_text(), patch_text_nosync() takes the length in bytes, not
number of instructions. It is therefore wrong for arch_prepare_ss_slot() to
pass length=1 while patching one instruction.

This bug was introduced by commit b1756750a397 ("riscv: kprobes: Use
patch_text_nosync() for insn slots"). It has been fixed upstream by commit
51781ce8f448 ("riscv: Pass patch_text() the length in bytes"). However,
beside fixing this bug, this commit does many other things, making it
unsuitable for backporting.

Fix it by properly passing the lengths in bytes.

Fixes: b1756750a397 ("riscv: kprobes: Use patch_text_nosync() for insn slots")
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/kprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 4fbc70e823f0..dc431b965bc3 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -28,8 +28,8 @@ static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 
 	p->ainsn.api.restore = (unsigned long)p->addr + offset;
 
-	patch_text_nosync(p->ainsn.api.insn, &p->opcode, 1);
-	patch_text_nosync((void *)p->ainsn.api.insn + offset, &insn, 1);
+	patch_text_nosync(p->ainsn.api.insn, &p->opcode, offset);
+	patch_text_nosync((void *)p->ainsn.api.insn + offset, &insn, sizeof(insn));
 }
 
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
