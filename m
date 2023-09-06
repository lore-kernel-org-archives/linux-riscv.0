Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25037EB8FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 06:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wk9naDtvJztdD34NOdvt03GuvBrZzO72wNaduEruqmQ=; b=ymI0L7f3/l7Vlb
	ko9KMk1eU7yy4wPt1eFZPUGtngOWinM9vi12XYKmLzGl4MJGRGkYuyo4rrbqcbr9JXcQGX+mW5Q2l
	HJhTNA5/1SThoXJgknxw5TCDliuWg/qhwm1MK0hUyHnGXtMrl3EMZFcCEo6yOKy3yy6nc6NF7XxCX
	fR+rHEGJY39+uHw5/5fW7oyTsmu6g1Saqzcgn6Kl32mhOztw/UAvzP/YWzq2qxNLu069QVtae8fja
	11DW17gf63Y2rsh3C8e8EfHjlkDYusG0REsO1Q2hBoMlax6xuvjuaqwJFfjEPDBIR7zFrLG6I833E
	9E/1zvhTiiIygB7Db11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdlz7-007MIx-25;
	Wed, 06 Sep 2023 06:25:53 +0000
Received: from bg2.exmail.qq.com ([114.132.197.227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdlz3-007MGs-1N
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 06:25:51 +0000
X-QQ-mid: bizesmtp82t1693981505tg4mjarq
Received: from wangjiexun-virtual-machine.loca ( [120.225.34.249])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 Sep 2023 14:25:03 +0800 (CST)
X-QQ-SSF: 01200000000000101000000A0000000
X-QQ-FEAT: kwdSLf7XDNJgOHQ8eIbPYpAVe0AqMNXAXlKVgnNZPHXigolcePZXT1Nul/Nc+
	uAeqdDXhyU3cJR2TL2OG0opUUM1Y6nPo7S7e5SjlEeja7qvQZCKcdFF5yvU0TVpQuVfXWWv
	/aqAeqBrb9szvl1YBtTkng9OOXcx9XW7a7gAco/xpx08Q6iC7erqH3vnMhMYyZkoBiCE1Ai
	j3kFN7LdggMHn6rwciBkJjy1zjXNCAT+T6Z4gUN03nG/EJjFuEqzRfw9Uziwtqh4rlpWl9a
	b1BaG00KBr/zzCjETcvrTGlMopYiK0qae+lD4vrDMoZss02b7U51+2c0+wNZt23NF36X5ME
	EioLoYITInR8ZbH63Khe1ed+qFE/+Z56vN78rFsDJsVLKS7iP7WBQ0g36NV+lTF1cEKW0ra
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 862016668279199492
From: Jiexun Wang <wangjiexun@tinylab.org>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	falcon@tinylab.org,
	jszhang@kernel.org,
	tglx@linutronix.de,
	Jiexun Wang <wangjiexun@tinylab.org>
Subject: [PATCH] modify CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK in riscv irq.c file
Date: Wed,  6 Sep 2023 14:24:14 +0800
Message-Id: <20230906062414.254602-1-wangjiexun@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_232549_803213_2B5B5241 
X-CRM114-Status: UNSURE (   9.32  )
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

If configuration options SOFTIRQ_ON_OWN_STACK and PREEMPT_RT 
are enabled simultaneously under RISC-V architecture,
it will result in a compilation failure:

arch/riscv/kernel/irq.c:64:6: error: redefinition of 'do_softirq_own_stack'
   64 | void do_softirq_own_stack(void)
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ./arch/riscv/include/generated/asm/softirq_stack.h:1,
                 from arch/riscv/kernel/irq.c:15:
./include/asm-generic/softirq_stack.h:8:20: note: previous definition of 'do_softirq_own_stack' was here
    8 | static inline void do_softirq_own_stack(void)
      |                    ^~~~~~~~~~~~~~~~~~~~
      
After changing CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK to CONFIG_SOFTIRQ_ON_OWN_STACK,
compilation can be successful.

Signed-off-by: Jiexun Wang <wangjiexun@tinylab.org>
---
 arch/riscv/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index a8efa053c4a5..a86f272ae2c3 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -60,7 +60,7 @@ static void init_irq_stacks(void)
 }
 #endif /* CONFIG_VMAP_STACK */
 
-#ifdef CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
+#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
 void do_softirq_own_stack(void)
 {
 #ifdef CONFIG_IRQ_STACKS
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
