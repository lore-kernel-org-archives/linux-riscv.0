Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2ADE63FF5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 18:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bg7wJZ9ipE4PKQxAkcJcWC9kqbO5nevTBn1kSX/qT9s=; b=Pm4sXIxswrJu91
	bhZz9EXONqt1pMcdJDdk6OSg9Bc+NENoxcl2k12+TIa9YW3s1wraPMliqnKrsgnALGhIkVEaXM7Ja
	odUYdoKLmyQPEsgbAQx1kMkUCjxzuAVFWu71UMJ7il2urjQ1+GSLIKRdPoupGGlMjixdz4zX4PEJp
	awUYTvpCtVcq4MK21KzatmANCKA9lW7iAudOxB/6QibHnIiWd3SIOUUO6BsfCFDgqpkP2LllH4cPl
	kQ65BNPn5lH2AFMqC8jut8o/6fKLuCibFzIM4d5FLpDVK/A+xbMlGjYf9jdhvF9pnbpRWpODmRKCB
	2lFovhtf7qjV+Az5dHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w969d-00000003gHX-2j84;
	Sat, 04 Apr 2026 18:55:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w969b-00000003gHB-14qi
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 18:55:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso976445e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2026 11:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775328929; x=1775933729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vuojKUDIjsIoi1AVAujgC/QVlgeGpJowX7gCMqW5wRI=;
        b=jmAuAVw9z55dUFZRBmBrTmDGOisbo6mv2CkSWr6UJXZlLKXjYdG5vAxwuhUrywUU1Z
         +Glnb1VPJMyajtubI6sYjq4ck91b74/C0kvK1dXMHAH3jUyS+Rq033CbOqMZ0t+x3RUb
         rgoeiA9Kd8qGyJo+kDL3kiUOnHgeLMxGFVyQRrnfk06DNAm5rwWSwAfdvaP2w/yRnKGL
         ds76pI3pXgEb/INIF4u7Oo6DIOinDTJqQPvjT3x7SbvCZcvQCbXENleZ7BRJL/Yzx4U1
         2t40cAymeuL3Soim2J7MHkB4DY4vcTSvTK4rYRpjcHhnEwrTXFAAfo6xbX0ngBrUGgn5
         SDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775328929; x=1775933729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuojKUDIjsIoi1AVAujgC/QVlgeGpJowX7gCMqW5wRI=;
        b=D90LlRS91nsZDiHXyD8HbU78lud2qVBsERzSxGV3Fdsc+8l7vQa4Lc/S13Or5E7s6b
         j88drKibOKVXqWsVxwNvRNAdT6/h63xAll4sI+QjOtYl+K9YNXqywgwvWj4T2a82jrgE
         w0WZuZ0vHpiJPuyf6rzDM8ISPkqOw5/bygZ/ZAdYHuJDEMFQ8mg50odzdhdbFEFEd/BN
         eE/Tf4Q10XpuRWVopRKughrl/w3RMGZrvv5RqkwyHYzWaSmuPgZOR4AeYdkGBUf7Iyhy
         rpxUEy2FU7EWqop380Xws8nWRbjFbApkjeacp/G7hNJTTckSym62/22DsYrWpp4G5FQe
         ef6g==
X-Forwarded-Encrypted: i=1; AJvYcCUaEMgrlM/cKr3DkZL24xhTGC3DDDOifpeCU36MlcWUEBZ8rVPEOXR0ShzlMFP3cNHpwOahvf75rHEx7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuITxL6NTrec+SWUkmjWADTY3qoWJioqIEqfoYhtvD7cxDq5Nc
	5jjBcz3vEAPYeHwwRyEv959ZkqMZJN2KDfw1XYsaVRWgGKtg11eyuIGq
X-Gm-Gg: AeBDietyeEExXZvs1e9nex+Q/3wmfFdP7Bf/mPDgu+lodvbzR+qRl4ZfQRsySu/jNDy
	kosGIbtlaKdRjShwS9jPQwp12y1HkN/+V5DGpLXIdpT6kpBzOm2jZTVhsCsvacy8aR4zAKUCNu3
	/GGxh5E4upz7IEJ9aGt5dxOIItfRzPcpPlpbb7KnrBeXpIHqWDpIt4/FGXxq1huwT5NG57T7mgW
	N0ZEHN+RgAiuvUgWB1xU15e3a8vUI348nqefIzogHdT03kX0dcxE3BnlhWTqsSLVoDIJCsdAJ7K
	sEMIAKQioGknZGphi7owjrA5W8LoizXzV571NUuwNEo2pyfBnV8Y0kmOU+jCgNS9tKJd66nshob
	pVmbmX1jut0G2G704pFXq2+YJo4X7K4ueZqEMKSLhzlVeooKym3Wl0ujnS/cqKf4mjGPx9NXW/0
	95j7e0Qt1LldHqmZej0PfjoCcrfTpnIbk2lLPyIY9LcjbhXOEFTzY2iAS/h9rC
X-Received: by 2002:a05:600c:630a:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-488997eed8bmr112205745e9.24.1775328928602;
        Sat, 04 Apr 2026 11:55:28 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:2817:10ce:a533:4101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a65635fsm231622955e9.6.2026.04.04.11.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 11:55:28 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: panic if IRQ handler stacks cannot be allocated
Date: Sat,  4 Apr 2026 20:55:20 +0200
Message-ID: <20260404185522.21767-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_115531_310767_C7ACE9E1 
X-CRM114-Status: GOOD (  11.25  )
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
or scs_alloc return NULL, call panic() in this case.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- call panic() in place instead of return -ENOMEM
---
 arch/riscv/kernel/irq.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index b6af20bc300f..017d42e778be 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -75,28 +75,34 @@ DECLARE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
 DEFINE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
 #endif
 
-static void init_irq_scs(void)
+static void __init init_irq_scs(void)
 {
 	int cpu;
+	void *s;
 
 	if (!scs_is_enabled())
 		return;
 
-	for_each_possible_cpu(cpu)
-		per_cpu(irq_shadow_call_stack_ptr, cpu) =
-			scs_alloc(cpu_to_node(cpu));
+	for_each_possible_cpu(cpu) {
+		s = scs_alloc(cpu_to_node(cpu));
+		if (!s)
+			panic("Failed to allocate IRQ shadow call stack resources\n");
+		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
+	}
 }
 
 DEFINE_PER_CPU(ulong *, irq_stack_ptr);
 
 #ifdef CONFIG_VMAP_STACK
-static void init_irq_stacks(void)
+static void __init init_irq_stacks(void)
 {
 	int cpu;
 	ulong *p;
 
 	for_each_possible_cpu(cpu) {
 		p = arch_alloc_vmap_stack(IRQ_STACK_SIZE, cpu_to_node(cpu));
+		if (!p)
+			panic("Failed to allocate IRQ stack resources\n");
 		per_cpu(irq_stack_ptr, cpu) = p;
 	}
 }
@@ -104,7 +110,7 @@ static void init_irq_stacks(void)
 /* irq stack only needs to be 16 byte aligned - not IRQ_STACK_SIZE aligned. */
 DEFINE_PER_CPU_ALIGNED(ulong [IRQ_STACK_SIZE/sizeof(ulong)], irq_stack);
 
-static void init_irq_stacks(void)
+static void __init init_irq_stacks(void)
 {
 	int cpu;
 
@@ -129,8 +135,8 @@ void do_softirq_own_stack(void)
 #endif /* CONFIG_SOFTIRQ_ON_OWN_STACK */
 
 #else
-static void init_irq_scs(void) {}
-static void init_irq_stacks(void) {}
+static void __init init_irq_scs(void) {}
+static void __init init_irq_stacks(void) {}
 #endif /* CONFIG_IRQ_STACKS */
 
 int arch_show_interrupts(struct seq_file *p, int prec)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
