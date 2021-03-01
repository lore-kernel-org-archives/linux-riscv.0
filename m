Return-Path: <SRS0=HRg9=H7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DA6C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 14:29:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4F8364DF5
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 14:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4F8364DF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VHiaSK0nMyxZngrX/e3Q5GIaVAGcazHJ48d0JHnLdO4=; b=unB4V2gLx6D94/zAH0IN7+Wv75
	bWsfJRUF+KkHB31n9D8IyEynUxMReUrsMStWjPfnOMxOdmPAb3+i9jEx6scQQWC6m4EM33kLst3ms
	cE6P33gIcjR2rD7RPeh8CO/Hj+8AVaSdr9cJMragnQ3OFqcr5XBTfwJf4gzZNvlmUd4U1dXmGWfj3
	gEmMMTWBumU9qMDE6mjh8S3sKUzwUQQ94ntT9vGHUpUxePTwVbDykKxbx8UmTLWctrmtWJ6DrER0f
	mO7i9AhrI/hEMsJjPc45GHJhi3UqHhi67xkcfv9ZXddwYHk0+QmoqyDt2/QiYZboMQVdtTxQ0PjNi
	vjQPZ2ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGjYD-0000Rf-Mi; Mon, 01 Mar 2021 14:29:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGjYA-0000QN-TW
 for linux-riscv@lists.infradead.org; Mon, 01 Mar 2021 14:29:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E189E64DF1;
 Mon,  1 Mar 2021 14:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614608970;
 bh=En1eyk16wHgUtzj4bgZ6Lkm3+BcNkeqwMyBsqff5YVU=;
 h=From:To:Cc:Subject:Date:From;
 b=OXGPx7au4zoBbOrwHe2jnofxmBHdN4aamSiTgzpqK4KIuDZo88YLBPceJgG7j1C1K
 /6RannAhzjdydeHtqvbqEK66DqPXuPSFcZLf+PcqELnIJ5+I//1W19FPfl1NVl/YQj
 kXWcMY/BuWyA9SSPhfRl5ICU/DCUw8XKePBvmNs+BrHkxgjDKst6NGYbq3rjorl0Lh
 7d7hex16pmBcCijQXdqjgEsoFPGz7CyoSWcMMlKGTKC6gjRXDdGA8p1AQyoaGRr4Y+
 FsczAFUGC17IJzc9oMqSDS8HXVGP+Xf6IghdM0ytNT7ajoc0gGB9TfkvULFbIxAffr
 A4c0uzbWpqavA==
From: guoren@kernel.org
To: guoren@kernel.org
Subject: [PATCH 1/4] irqchip: riscv: Using CPUHP_AP_ONLINE_DYN
Date: Mon,  1 Mar 2021 14:28:19 +0000
Message-Id: <1614608902-85038-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_092931_058239_BDDE5676 
X-CRM114-Status: GOOD (  11.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Remove RISC-V irqchip custom definitions in hotplug.h:
 - CPUHP_AP_IRQ_RISCV_STARTING
 - CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING

For coding convention.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>
Tested-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Link: https://lore.kernel.org/lkml/CAHk-=wjM+kCsKqNdb=c0hKsv=J7-3Q1zmM15vp6_=8S5XfGMtA@mail.gmail.com/
---
 drivers/irqchip/irq-riscv-intc.c  | 2 +-
 drivers/irqchip/irq-sifive-plic.c | 2 +-
 include/linux/cpuhotplug.h        | 2 --
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 8017f6d..2c37f3a 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -125,7 +125,7 @@ static int __init riscv_intc_init(struct device_node *node,
 		return rc;
 	}
 
-	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_STARTING,
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 			  "irqchip/riscv/intc:starting",
 			  riscv_intc_cpu_starting,
 			  riscv_intc_cpu_dying);
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 6f432d2..f499f1b 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -375,7 +375,7 @@ static int __init plic_init(struct device_node *node,
 	 */
 	handler = this_cpu_ptr(&plic_handlers);
 	if (handler->present && !plic_cpuhp_setup_done) {
-		cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
+		cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				  "irqchip/sifive/plic:starting",
 				  plic_starting_cpu, plic_dying_cpu);
 		plic_cpuhp_setup_done = true;
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index f14adb8..14f49fd 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -103,8 +103,6 @@ enum cpuhp_state {
 	CPUHP_AP_IRQ_ARMADA_XP_STARTING,
 	CPUHP_AP_IRQ_BCM2836_STARTING,
 	CPUHP_AP_IRQ_MIPS_GIC_STARTING,
-	CPUHP_AP_IRQ_RISCV_STARTING,
-	CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 	CPUHP_AP_ARM_MVEBU_COHERENCY,
 	CPUHP_AP_MICROCODE_LOADER,
 	CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING,
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
