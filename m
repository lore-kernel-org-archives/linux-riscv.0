Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542CEC001DF
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 00:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzNW+scM5bi2472hGaPukpAYi4dwIYn0OmwG1JzJF6o=; b=bInBscfPDhHGSk
	8A/aqfshY6K856qyPumMwF8pnyCrnPwXHyhkOF1Z3NEzQAE/XN0KEOropwc96FBrV35HFhLLrWKVO
	zEqItDsB1XmR7CUSj78W2PYKTBEZ4/7BmQpo9YIyVwLfS+f8AZF9HVHrhJBNKVQwvG1cUvxrGSXKN
	tpwM0Zpim2oaub3S3sc6AGYiovUMOclNiOBZPHYqekJXmEHkzi/SxPVVSHyZtixj2ONMVMWNLiTwX
	E5QA8WZAm4ymYJ/5zfNEUuxPDJ8xHojDg7r0sC6IIFLpRlGjWdTzJmmGGxGLAu2O/yXW0naBNap1S
	LlvzNj95xs8VI1IprlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKpQ1-009j4N-0F;
	Sun, 16 Jul 2023 00:15:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKpPx-009j3T-26
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 00:15:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B98260C52;
	Sun, 16 Jul 2023 00:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505A3C433C8;
	Sun, 16 Jul 2023 00:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689466516;
	bh=0yILc+bANh026I06UBWabz1Zup8MksYUpsntgobli2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ADnjw515pP16FV2I8lpnFC4dPNwxJnjxawWW2RJhS0BtI5ZRTMZllmD7yXzN4VKzp
	 qtKiRpQ2iS/p2Td7bOzS+gDfGXZp2tNIPbkBfQpQoVgqlmsBMmH7ivEymtyQxhjo3N
	 h/au2xs9HvGh2XUujZUC1hpYljDrdAYDm+e+OBigu+JgYbifOXbY5ozwg33xq2miOH
	 hB1d2XJATM6/TW/eVtDcOO4x9IqTpzs75bsGlf0dJrMY3/g2/m5PxTCCygre0wLexf
	 1xMstyE4xarLBYldCA2GduHG22sby3niDx9Z4qWThaO3FrhbCnm4IbnXtY0mP2ghJQ
	 w6A1WCUepkXEQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	falcon@tinylab.org,
	bjorn@kernel.org,
	conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 1/2] riscv: stack: Fixup independent irq stack for CONFIG_FRAME_POINTER=n
Date: Sat, 15 Jul 2023 20:15:05 -0400
Message-Id: <20230716001506.3506041-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230716001506.3506041-1-guoren@kernel.org>
References: <20230716001506.3506041-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_171517_746443_FD5AAA47 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The independent irq stack uses s0 to save & restore sp, but s0 would be
corrupted when CONFIG_FRAME_POINTER=n. So add s0 in the clobber list to
fix the problem.

Fixes: 163e76cc6ef4 ("riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK")
Cc: stable@vger.kernel.org
Reported-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f910dfccbf5d..927347a19847 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -372,6 +372,9 @@ asmlinkage void noinstr do_irq(struct pt_regs *regs)
 		: [sp] "r" (sp), [regs] "r" (regs)
 		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
 		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
+#ifndef CONFIG_FRAME_POINTER
+		  "s0",
+#endif
 		  "memory");
 	} else
 #endif
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
