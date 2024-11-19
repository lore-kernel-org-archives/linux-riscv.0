Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE80D44143
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 11:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I7wHGv/KpbIpQdYkJoyGnF0hwEnkyJDJS03FCu4Ar/s=; b=vdwItporxUjKQ3
	CvW/WW0vgwLe50hJUZxjMaH/HRiJiTgQEhx1iWsOKkMUrfqVHVRMOtKWsXbq6OSE1wcM2Gf7R3VvA
	xInX70jtsDg5XY34Fkx8NIa2qWrQC94+DETd/YaGRrTrt68eCiby09Ddzt2pB0ivXW2CSHmF/AoZL
	+kgx312EHTJwuPiXiOGvzCCd4gYFDOWU4Q9Yv/V36QSjF9NSf+8Mq56+Q3BZcOs0De0OP+KO+jyqW
	aXZhaSsgxGGlkHcZoC9IuQLHv5dEHAHeVSZdckOZOq/DBb/1f/oSGquP/PrdccpBi+lVICOpAIBfG
	E5sjKCwyVPVZqp+DM80g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDM9T-0000000CBD8-3K69;
	Tue, 19 Nov 2024 11:12:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDM9R-0000000CBC6-0yH4
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 11:12:10 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732014724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AnSoKCnQrjrmzqa2C++pRQDGWZYwmEGb3klOeM1ODno=;
	b=JPqpOQWDN5FAAIkObFQ79DDrfI8arMwdauXPgIuDle4pPYOugOv7fjHc9QGglhicCjsGPu
	XJ8j25eHWH5k0IrUP5IzQHZfZVgFgxtka4sW4icbnpcIoNdDJ7ozmtWhJBjEEPMq0BwlFl
	gD3VsjhSZtGW6KN+2zRp0axSnbAQFJupGqeIFzZ5jW5rR+Vwoyc0MvsYQBmO6/pdG4jZuz
	JfcUh3jY5vTwUnAfMzAAypk1op5cN5zr0SuTF2pIh0zaqvdiSL1d3GT826fJ6tG8Nsng8E
	7zuMBQjLRDv34YoYNKr7ZW+mMPoRDgcKh4DPYHEVHND66Os5gc9fcm0WBTgsrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732014724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AnSoKCnQrjrmzqa2C++pRQDGWZYwmEGb3klOeM1ODno=;
	b=P/h+PV0+Vj1KVJvq625yvh4OJfnE2mUnoxtSv70YLtIIg/RSzdMfzIRdzlK6kBxRSBD5m3
	HVAUppB4cdc98XCA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: John Ogness <john.ogness@linutronix.de>,
	Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH] riscv: kprobes: Fix incorrect address calculation
Date: Tue, 19 Nov 2024 12:10:56 +0100
Message-Id: <20241119111056.2554419-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_031209_421050_D9344D59 
X-CRM114-Status: UNSURE (   9.62  )
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

p->ainsn.api.insn is a pointer to u32, therefore arithmetic operations are
multiplied by four. This is clearly undesirable for this case.

Cast it to (void *) first before any calculation.

Below is a sample before/after. The dumped memory is two kprobe slots, the
first slot has

  - c.addiw a0, 0x1c (0x7125)
  - ebreak           (0x00100073)

and the second slot has:

  - c.addiw a0, -4   (0x7135)
  - ebreak           (0x00100073)

Before this patch:

(gdb) x/16xh 0xff20000000135000
0xff20000000135000:	0x7125	0x0000	0x0000	0x0000	0x7135	0x0010	0x0000	0x0000
0xff20000000135010:	0x0073	0x0010	0x0000	0x0000	0x0000	0x0000	0x0000	0x0000

After this patch:

(gdb) x/16xh 0xff20000000125000
0xff20000000125000:	0x7125	0x0073	0x0010	0x0000	0x7135	0x0073	0x0010	0x0000
0xff20000000125010:	0x0000	0x0000	0x0000	0x0000	0x0000	0x0000	0x0000	0x0000

Fixes: b1756750a397 ("riscv: kprobes: Use patch_text_nosync() for insn slots")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
 arch/riscv/kernel/probes/kprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 474a65213657..d2dacea1aedd 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -30,7 +30,7 @@ static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 	p->ainsn.api.restore = (unsigned long)p->addr + len;
 
 	patch_text_nosync(p->ainsn.api.insn, &p->opcode, len);
-	patch_text_nosync(p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(insn));
+	patch_text_nosync((void *)p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(insn));
 }
 
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
