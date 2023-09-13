Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E54EEEB593
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 05:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J/zp0appCuWeW5IKa+mD1118zmHLglXbsmvX+Pc85VY=; b=Kz3d+HmT5LbiqG
	WfPj8o0EylAxBb7L/AWDdlprqb8UJyaKB28MW5N/KAz2ZiWu91diOOckAwQcV/j6tDqHJ5S6hipbz
	lNHWRWHSboCddJ8295UgXKs+64Xl9dix0hW++QtVrYtSifbFgVNn5dEMS0rD7OftZf92GZsJmjSnn
	brqptV3zCsg9r51Nqa5xKxYZdMHPWwuMmKLwNyVqI/UfiJXLRmG87cUiviUKBX5N2nXpnrU0yuTcs
	xO8XV2n0mtI6RH6Ny//8bx40VMv7QZ5RnXIQljZ4PkM4bl7S47MiJjJQH/osxjVa0OQKSanUr9SMY
	VY6tiTMYBM3FYZmcKdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgISj-004frZ-0r;
	Wed, 13 Sep 2023 05:30:53 +0000
Received: from bg2.exmail.qq.com ([106.55.200.77])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgISf-004foy-37
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 05:30:52 +0000
X-QQ-mid: bizesmtp89t1694582995tg1po50m
Received: from wangjiexun-virtual-machine.loca ( [183.230.12.200])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 13 Sep 2023 13:29:53 +0800 (CST)
X-QQ-SSF: 01200000000000102000000A0000000
X-QQ-FEAT: ILHsT53NKPjfD7b8Zb6jchmbIcw0qlMMQyN/QLoYTr77IR2msFhRMvJYrb4ot
	9WPBXDgryN09kt/n3PrdGPV55+xlfk5oD+LMpFQJOHDXCjKJHvxq/wtLCTun5iMYkiRtMdH
	urMDa/pLTLzA81GK+Ja8MkTs22OlbcRN0eMJYDOo6iVSEI+3yj1T7CJFyfUOsrWYvkAn74k
	tWRU9rqSF+66wmn6pmwA6Y1sMx1klkuMRkgRAo+dQMSSZiR82uf/CLQwQcCOfhAOVFT1rAp
	q6+W5Os5CxkuM08q46YQqcrbWtHmAdMQt6fngc/h7EWAlLTbUlAcuX0oKsx+R3/pFaJthKc
	fAi71Qb3Qsmf8rsgtOMk3TpB9dDedBf4wjY5+aprjaiqUkjuHGwYmkM2720zQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10456565237369855809
From: Jiexun Wang <wangjiexun@tinylab.org>
To: samuel@sholland.org
Cc: conor@kernel.org,
	guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	falcon@tinylab.org,
	jszhang@kernel.org,
	tglx@linutronix.de,
	Jiexun Wang <wangjiexun@tinylab.org>
Subject: [PATCH v3] RISC-V: Fix wrong use of CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
Date: Wed, 13 Sep 2023 13:29:40 +0800
Message-Id: <20230913052940.374686-1-wangjiexun@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_223050_365872_999535BA 
X-CRM114-Status: GOOD (  12.01  )
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

Fixes: dd69d07a5a6c ("riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK")
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Jiexun Wang <wangjiexun@tinylab.org>
---
Changes in v3:
- changed to a more suitable subject line
- fix the #endif comment at the bottom of the function

Changes in v2:
- changed to a more suitable subject line
- add a Fixes tag

---
 arch/riscv/kernel/irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index a8efa053c4a5..9cc0a7669271 100644
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
@@ -92,7 +92,7 @@ void do_softirq_own_stack(void)
 #endif
 		__do_softirq();
 }
-#endif /* CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK */
+#endif /* CONFIG_SOFTIRQ_ON_OWN_STACK */
 
 #else
 static void init_irq_stacks(void) {}
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
