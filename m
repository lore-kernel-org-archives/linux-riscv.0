Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDADEB8FB8
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=auiDVXy+rR57m2JW0agf1ldAIUZ1WjMF4PABK0QffRw=; b=VV428gQYpRm1ng
	YhFkbVwLcc/1JEBnpjPnM1qsf40VmCQ9Ek7kskHIqRb6A6qKqWA33/g2r6u2gi5Bf66wlUAbXyXbD
	L6AlsRyJmN5nWxwiJCOOiiy7bg7izySL+34KR2ENqBqRZEWvHm2rQaMwIyL5Md8wLJCkwpTM+9lX9
	j1NLqHvP18MDUpKshYa2deGYEpUb8GtU4sIELmCdh9cayl1iXiRlSw/Z3thme/c/Lq80m5kbG+Z20
	jjGPkW5coI1vqAGq21R7b1FbyHfEqSOI3lwkTp372CX3zrLU70+lr5f7HcKZLJhI1kovDQxFipaoL
	5rHjOfDysmwuhGDdkKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrjZ-009Ta0-2a;
	Wed, 06 Sep 2023 12:34:13 +0000
Received: from bg2.exmail.qq.com ([114.132.224.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrjW-009TV1-1J
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 12:34:12 +0000
X-QQ-mid: bizesmtp69t1694003607tudcir6g
Received: from wangjiexun-virtual-machine.loca ( [120.225.34.249])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 Sep 2023 20:33:25 +0800 (CST)
X-QQ-SSF: 01200000000000101000000A0000000
X-QQ-FEAT: rZJGTgY0+YN9fNMQKTSU9Qgqmi6m+PTsmzRVbNPtaV/A5xhJrUGcYwefmJlX2
	11PftMTdzH2cqBPrK2tlbOMGpQPvsx8ROqEMCA/K2OPtv6nPQVRePJtHMTGpp3PJhhqFPGb
	mikZCnSfIQyPN6JjodtSzMSxYb71LKA68AgC47JS3pH+QggfbwA/kb5qXHsFsv3qKloNs2s
	lHsWWZbIrfD9dIvnlNY3g4tkJqXGvREKwMEdd9pq0AyX4lZ/M2iIPo55/InKgZyQouQDwCQ
	AJikqyw/4mNUxwHlmQWJv0RwcRymPazYlLgJ2rjxgwaOtqaK+HeVtR1IL5uxTti4kk64G7L
	oWIQ8BC8T3eFKHZxH5DVYT7eO6zYALNU8SbEBu1VkT3wY3sgcrHXFzVYBlPGA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16057446587632364950
From: Jiexun Wang <wangjiexun@tinylab.org>
To: conor@kernel.org
Cc: guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	falcon@tinylab.org,
	jszhang@kernel.org,
	tglx@linutronix.de,
	Jiexun Wang <wangjiexun@tinylab.org>
Subject: [PATCH v2] RISC-V: Fix use of non existent CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
Date: Wed,  6 Sep 2023 20:32:16 +0800
Message-Id: <20230906123216.255932-1-wangjiexun@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_053410_794185_F0D3E4DC 
X-CRM114-Status: GOOD (  10.23  )
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
Signed-off-by: Jiexun Wang <wangjiexun@tinylab.org>
---
Changes in v2:
- changed to a more suitable subject line
- add a Fixes tag

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
