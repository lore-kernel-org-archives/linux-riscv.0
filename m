Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA06C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zW+zBwNABVFt1ui6ej/zVP2FonPC7CPxCA4EqDQ7ZVw=; b=t9mKB83yjlqyJm
	A8ZMQyUbBuB5vi9NxiHMpUB+v0N91viGUL70sYdSGG2e+yVeb71+ifhEIAZmx6fEFdzGb4pfL6/js
	Uq2D6HvVd51Z21NUCCkuWaKEsHK/VXmyugneySxljscOHOJlCKLtaSVKWGZILqm/Q8vTNDDNdqY18
	+R/4Rq/16EwJL72fS4h450ZgZbc110obbenundXo+9SZ3xBEphUTh8I+DmVjbAweSjCBwEw5jDAjJ
	TTgTz17CtFbPnVQ9cvGbDdDuk/wXseuPvM+UKHz+3HihUcpxo0gKEFLQzkTiAqcsr7cwHL/BPxv34
	pdEAhPiTXPh1B9BuRUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdQF-00D2Ff-0U;
	Thu, 18 May 2023 13:11:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdQC-00D2EV-2I
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:11:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A62864F4E;
	Thu, 18 May 2023 13:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25509C433D2;
	Thu, 18 May 2023 13:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415515;
	bh=H3qRrc+Swbkb9xjGRDiBZp2YLKEOjr9L7yAe3XbxQAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PF1LX07AYPEcI1S34Swg/YAvpiv/8q+1WM0ePfVK4OiIFzXg9ryk5cdpN0hr51Y2p
	 ji+YyEyhIpKdPWIJ1YqPhMNdE3hwVfa7gWZSTEifU5EK/QQo6amzN+jKuZRzBhYvSt
	 OclNJkPp9AuOtK3MmSe1Dm1QBrZWW/7H/TL7xJOhKh6HvtqOUx+gDIy1I83AZpCUSF
	 gRtVcmz/smsNoZdXJ/GvB591xYetaY0ca5qgLImxoJ+pay7S3KHQlcnFGwnDgHbOWi
	 tCcQNQIEGCF4BC5FlLlCwFHEh37zARMkRlbPbpQYmKlvwz11rN3xqVOm0pmUAZtNIB
	 jKlCjJMI5Bv3Q==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 06/22] irqchip: riscv: s64ilp32: Use __riscv_xlen instead of CONFIG_32BIT
Date: Thu, 18 May 2023 09:09:57 -0400
Message-Id: <20230518131013.3366406-7-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061156_783578_B27DC383 
X-CRM114-Status: GOOD (  12.83  )
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

When s64ilp32 enabled, CONFIG_32BIT=y but __riscv_xlen=64. So we
must use __riscv_xlen to detect real machine XLEN for CSR access.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 drivers/irqchip/irq-riscv-intc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 499e5f81b3fe..18f3c837e488 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -21,7 +21,7 @@ static struct irq_domain *intc_domain;
 
 static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 {
-	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
+	xlen_t cause = regs->cause & ~CAUSE_IRQ_FLAG;
 
 	if (unlikely(cause >= BITS_PER_LONG))
 		panic("unexpected interrupt cause");
@@ -113,7 +113,7 @@ static int __init riscv_intc_init(struct device_node *node,
 	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
 		return 0;
 
-	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
+	intc_domain = irq_domain_add_linear(node, __riscv_xlen,
 					    &riscv_intc_domain_ops, NULL);
 	if (!intc_domain) {
 		pr_err("unable to add IRQ domain\n");
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
