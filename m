Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E056810AB82D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 23:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OAlUwQPr4cK7OIn6c/V6hlL4nHlApAH/Zk87wTzvpAM=; b=kwVwRsjBd3QSHb
	LlQ4Lw+5PXI4F/PkvgTBUaGb6AG8zyUahAohU0ei4JhnxgzaUuQTtCrhY0CzbHc0p5kOk7Y+T0dbA
	79SkA8lvlVM20P8pXrgZirm8wTqbAIYPdJ9YSlvOvCTfvzV7Blb2o/DAvld5dvNhrEXMj4upxnzNK
	ItvgLVBSJvcL+k8zsD1BWOD3P9dDwHzxw7/a0Iw5DobIMCojbqImRGjywqBF8zeUYCVjN5CrfGI0Z
	yoQpU6BuI4cnrt4M2Qv1yKh4GQzxbxeF7XOr/AkmQkO7/fMbsSxDz21/3XN05LSH4Ba2T4qzOZUn9
	mYSg65OUVOYT0YeGsbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5u3D-00000006NqH-0oCE;
	Thu, 26 Mar 2026 23:23:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5u3B-00000006NpT-0R4Y
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 23:23:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso12362845e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774567419; x=1775172219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bYHQZKeiCiMBzOolGhgKFQToMa7hk6HZA/6z0UHTvk=;
        b=KIsicM/kGlz/WdMAZAJ3rWy5jUNZCAjm8vid2loZhZ0Dq3eKCT/gyN1xHCHBcOTpFi
         Jn6cyxcW/Zi809+NV7XL2vTg8BZKuuNd1oUbRmRINKgHsyRdPCLrISq5Au9uYXFnsS+i
         2FyMEI19Te/1VDs3PImvxzaTyL6DlPLj31VQfZ6Xt5nAf07fFk+B6L5YLE9E6taXzlbe
         erS5Yqqa/4ImSU2SrlR1X4lqa/j1+akWChGiaxK1SsEpw6hwMpIB81X4Zamx6mp6DTuD
         MwBKMmu8n21Y6BdfNiD4ZHtiETJybgarnsECZYcxjZ9dbBl8k+rVoUE5Jt2xd+Tlm14D
         G6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774567419; x=1775172219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bYHQZKeiCiMBzOolGhgKFQToMa7hk6HZA/6z0UHTvk=;
        b=rtl6m9vab1mSz3O29uQ73CoXtPch/IYA3DcPBtNxT7YOl0tKzuXMsHqsmamiixCkYf
         laNzRTRv/Ar72S47C7isSWjQsdHaVcDj7HaMwXFxdPQxk54CzPydjRqg/B0iTK5O8gFL
         EzZDriruXZp6UMgQLFykwcr1Z6/gNI/rp7dwfFzAJPyBKSe7QO/5uh+SZCDrAWlTOm//
         klgf31OkMde9/iiz41lcozrYDNfNUnYj33eB8fxs2s//3LAuZ24nJh5NAwzDnIY05GOp
         5bEQndP/q3Zu5BJ1Ogm3DhSKv06l0m4H/YYCs1rJFPuFAjRxam5L5tmRdWKPA5kJgS4N
         yByA==
X-Forwarded-Encrypted: i=1; AJvYcCWSbxfHpVp1UlHuA+RQWewBfTcVpwNKPZOFrz093wPlhdSRMqsyAXiwSzMdXER7ZpoOUH+OPFgeVxdE2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yydwe5hAvy/9BEIAhibGtGgoRWsk0Th1OPs1pmspzrimI8xc2a+
	6A8FZD42VVgnMnsJr6ynn+soKqMJkoRdeNra5sDIJ6L9tlxxPEuiNFJL
X-Gm-Gg: ATEYQzwH0Yi4KcmexFWdZDeJ675dF/xy49bPTJ0zlIWwHQMgS9Ptr7HlaUEi639Tl2U
	/wo5cNf1QvQLWKdvjPkPBoEeLz8fW17U2iRLtPcmD0WeuRgjC1PrlNcO4W2kcgNh7QuBHD62Ga7
	9CIsbD9HUsThf4LsEShHJ+p5lkBNI3SKIMeN8HVczUCg9azyJWeVm3QGP15TtStMOQmhwvUFxZL
	50g9FWptXE22I9m0bKsMcu5sDIfFPqPfhoJL1cVPo94Ye5UsCoIqr3WD3mbc7iv0XGmHAmCTFCB
	moDp9EGWi6KODAVVbHMxmg9CHl/LS3E6iFpWpsDckntcKwIs3R/+jz8+ImJpJ90N6KM08/Q+gZ+
	sTNHJ6DLEvjl3KQql2PG5BsJKKhEqFdUNZEFMLuCROH0movWB+QJo0z6IEGrum/jAB5dNl+p2zY
	Y8mWMFM2I8G+KmpMEd2bIwDInh/Sjc4hlcATh21s6yAZ65qnyRfva00lMT8kxf
X-Received: by 2002:a05:600c:4447:b0:487:219e:42d with SMTP id 5b1f17b1804b1-48727d6f90cmr7279675e9.11.1774567418763;
        Thu, 26 Mar 2026 16:23:38 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:8cd6:6329:c43d:2fcb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9acb9sm5956885e9.1.2026.03.26.16.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:23:38 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: panic from init_IRQ if IRQ handler stacks cannot be allocated
Date: Fri, 27 Mar 2026 00:23:33 +0100
Message-ID: <20260326232335.60353-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_162341_181449_25AE4417 
X-CRM114-Status: GOOD (  11.89  )
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

init_irq_stacks() and init_irq_scs() may fail when arch_alloc_vmap_stack
or scs_alloc return NULL. Return -ENOMEM from both and call panic() once
from init_IRQ(), covering per-CPU IRQ stacks and shadow IRQ stacks
consistently.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kernel/irq.c | 43 ++++++++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index b6af20bc300f..43392276f7f8 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2018 Christoph Hellwig
  */
 
+#include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
@@ -75,41 +76,53 @@ DECLARE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
 DEFINE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
 #endif
 
-static void init_irq_scs(void)
+static int __init init_irq_scs(void)
 {
 	int cpu;
+	void *s;
 
 	if (!scs_is_enabled())
-		return;
+		return 0;
 
-	for_each_possible_cpu(cpu)
-		per_cpu(irq_shadow_call_stack_ptr, cpu) =
-			scs_alloc(cpu_to_node(cpu));
+	for_each_possible_cpu(cpu) {
+		s = scs_alloc(cpu_to_node(cpu));
+		if (!s)
+			return -ENOMEM;
+		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
+	}
+
+	return 0;
 }
 
 DEFINE_PER_CPU(ulong *, irq_stack_ptr);
 
 #ifdef CONFIG_VMAP_STACK
-static void init_irq_stacks(void)
+static int __init init_irq_stacks(void)
 {
 	int cpu;
 	ulong *p;
 
 	for_each_possible_cpu(cpu) {
 		p = arch_alloc_vmap_stack(IRQ_STACK_SIZE, cpu_to_node(cpu));
+		if (!p)
+			return -ENOMEM;
 		per_cpu(irq_stack_ptr, cpu) = p;
 	}
+
+	return 0;
 }
 #else
 /* irq stack only needs to be 16 byte aligned - not IRQ_STACK_SIZE aligned. */
 DEFINE_PER_CPU_ALIGNED(ulong [IRQ_STACK_SIZE/sizeof(ulong)], irq_stack);
 
-static void init_irq_stacks(void)
+static int __init init_irq_stacks(void)
 {
 	int cpu;
 
 	for_each_possible_cpu(cpu)
 		per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
+
+	return 0;
 }
 #endif /* CONFIG_VMAP_STACK */
 
@@ -129,8 +142,15 @@ void do_softirq_own_stack(void)
 #endif /* CONFIG_SOFTIRQ_ON_OWN_STACK */
 
 #else
-static void init_irq_scs(void) {}
-static void init_irq_stacks(void) {}
+static int __init init_irq_scs(void)
+{
+	return 0;
+}
+
+static int __init init_irq_stacks(void)
+{
+	return 0;
+}
 #endif /* CONFIG_IRQ_STACKS */
 
 int arch_show_interrupts(struct seq_file *p, int prec)
@@ -141,8 +161,9 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 
 void __init init_IRQ(void)
 {
-	init_irq_scs();
-	init_irq_stacks();
+	if (init_irq_stacks() || init_irq_scs())
+		panic("Failed to allocate IRQ stack resources\n");
+
 	irqchip_init();
 	if (!handle_arch_irq)
 		panic("No interrupt controller found.");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
