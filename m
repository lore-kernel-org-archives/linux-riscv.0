Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856B5C0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 13:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SO7PZ+tTti9TlQ6gPtiwMoRlI8Drzztb898Uq60GhKc=; b=zoblwdNcIafHXn
	tmLbhfuPhys30WY16GwaeMZj30s7TVBV/fd12dXh45o15vCVGJMCS/9DBb4bZ1TftwZB5/3QQi5Yu
	fWkK5PWDb0oF1nWvVueNNkXAcRe61wMwp1FkK4Rhswxv1FbefylvgSF8C/LbhvnQ8t8TkErFq6qeY
	Umd6/5UlnACMNiR7Epa/cab3Nq8UX9iF/7xjqW0fstkh/RFRZK+Gp/MoAjF7pCQHf4Ux3KYzFZ2VB
	CV6w+gQuImCR1j6osACVPxfiofZYYHFlP25wUGI4JCNfqe9vO1Aw9Pwbj+TAf/Sv0S9dlWRIqMhl2
	HktTu8Eep1O5HpffLn3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKfb7-008s6N-0Y;
	Sat, 15 Jul 2023 13:46:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKfb2-008s4h-2G
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 13:46:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26A3360B86;
	Sat, 15 Jul 2023 13:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60112C433CB;
	Sat, 15 Jul 2023 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689428763;
	bh=Z6IXikB2xTgV8aYzF3GbO/0brO1/H9AkrMucoZoD3Ik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t8RkxRTlJ15k4v+MjMu0jzuGCrNDCMTt5XSbdm+0/caeiQpPODQh7DnFoficDzxEX
	 X/BOiOQC+KFSDvSpqnhC6RnWmhRprvJVMsqWD2u4IRO2yhNOPxWBhzBukbQw70tM5+
	 p11YHT1ZOLA+mrJu067BFoqLna4RAuUj2n02POOBVY8T6chyW9SkITux56S4UhD/wL
	 Z9b5Hm2P/720IHBEe6Z6ODBtwSrM9nwiQ36InXVp445ngTUjx0SUF9y7Em+lJX5HDs
	 WQANHaIl4RXLqfvhMFqUnAHWA//pEQXr2RI+62ADB4WPl/DKYzMMoe6H3wq6fJtxa7
	 2QOqTbUNK9X4w==
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
Subject: [PATCH 1/2] riscv: stack: Fixup independent irq stack for CONFIG_FRAME_POINTER=n
Date: Sat, 15 Jul 2023 09:45:51 -0400
Message-Id: <20230715134552.3437933-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230715134552.3437933-1-guoren@kernel.org>
References: <20230715134552.3437933-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_064604_778544_8F463B20 
X-CRM114-Status: GOOD (  10.44  )
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
Reported-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f910dfccbf5d..f75d97de518a 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -371,7 +371,7 @@ asmlinkage void noinstr do_irq(struct pt_regs *regs)
 		:
 		: [sp] "r" (sp), [regs] "r" (regs)
 		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
+		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "s0",
 		  "memory");
 	} else
 #endif
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
