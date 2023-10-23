Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A60C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/a94+DSaU6nfMZiefWNu9CAuFzObDWFUeUAzI8lzroM=; b=3Y2klCN3Q8ynGX
	BH535Mpd0qJKrzo+ebgStVv46ixnxOXR79Sl7juj1WuHZKkNrgC4Zh+4+NtNH4QvFbTho6hA52laJ
	DOQ3jf2BBOb9huka6u2Yww27jVl5eDIjDLRtey7nVPoNiZl2M39MZRFJAvpZVoxw/lNdMCftZom17
	ZAYFVvTWxTN+PuWfREZxay/chf7iU8l2fEiJo2aVDKMkS6oFsXjx9aUTvFgJWebICeo14DUxz6MMm
	7t/lFAjga0ymt2Hj0WIHfUkUL3PgCxWy7busH1kVCZL51Gx+OWz7HA6g9gKbfXO8EOw0moVXNuRPr
	scFR07xaOGm4EkN8qbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqKN-006lJz-2f;
	Mon, 23 Oct 2023 08:30:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqKK-006lGD-2L
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:30:22 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-27d45f5658fso2379400a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049818; x=1698654618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zaYgIQbfD9rezIYpqI9laPzzTdWx+ZAuyZYYGD6lvk=;
        b=LdkLoUiHBqLxuy3x49n0+CdlkGBGaLjIKG7tGdywIEDuxNpDPzP5I5Ql1BVI9NnHH6
         WZFRlnP6jMCvdyoZUS6s5+IUyl5T0D5YbsTM/CQLlJqGbGI+rLKNmnRwFQ2pkNxVe5dZ
         xCWCu2OI+skAafKPF1CL8KdYqVZw1smjFG331r/XqetVCxBlhLOu27AhJ9+F2n3K21hn
         MipU9V0VV+yJqFI8ebdIY3uLYZaVTi+xl/qfk45eG02fAvF7QO4OjAv47vGf/kwmzW/N
         7iP1SBzyxmfyzYg0wFYpqpaL8k7R8LgcFy+s+TOjN9mvo3kcXtk71h0rpNGFzKlhrWXH
         Yx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049818; x=1698654618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zaYgIQbfD9rezIYpqI9laPzzTdWx+ZAuyZYYGD6lvk=;
        b=XHPZ9bcR00JWEVJqXlMf4HyTDlJzZffG6NaLCWrVacpNofU9A+2cKuPJSLHcHyqhQ4
         pcqQ5Ow61j/Bq3vLTREqvXYnz8UsaRkbkMy4QYNz3zYwwajlUIywgzEtWnCBgoUPziOk
         o6tG/C8L513aXX9iVOTA5HUtA3WbcD8yD20WRhKEChCw7ekt122uqccslyWqRyqg2Bn5
         jPDPcL+vosucRXzXQf33tm76GU76z/nWkmbvN896WAV3fg4hwpYiBdrd/tgKwFc8H6AQ
         Q0U8/EQ6U8opnCMRgbbYfSqHG1fAoIIAknE/xhwUJlhjvtzVzTXjEsEcqNvWbr3LVOzU
         sRyQ==
X-Gm-Message-State: AOJu0YwCpcFwOxY0zbXMfYo+gmDcHiRHLdG8SBq6vYkicDhAFpRr4RYl
	48oT4CGPvIBX4nqbahnyBNCl3g==
X-Google-Smtp-Source: AGHT+IFpt0TBJ9j577UmWU9zDZbpQtF3JzZZq4hl33QCJ42B75FqE8SvRamj8B8r3i2TgYxF2UyAzw==
X-Received: by 2002:a17:90b:3e85:b0:27d:1567:f51d with SMTP id rj5-20020a17090b3e8500b0027d1567f51dmr9084887pjb.47.1698049817843;
        Mon, 23 Oct 2023 01:30:17 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.30.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:30:17 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	maz@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	liyu.yukiteru@bytedance.com,
	sunjiadong.lff@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	chaiwen.cc@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 10/12] riscv: Enable NMIs during interrupt handling
Date: Mon, 23 Oct 2023 16:29:09 +0800
Message-Id: <20231023082911.23242-11-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013020_767217_AE4BEF69 
X-CRM114-Status: UNSURE (   9.98  )
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

Hardware automatically clearing SIE field of CSR_STATUS whenever
thread traps into kernel by interrupt, disabling all irqs including NMIs
during interrupt handling.

This commit re-enable NMIs during interrupt handling by setting the SIE
field in CSR_STATUS and restoring NMIs bits in CSR_IE. Normal interrupts
are still disabled during interrupt handling and NMIs are also disabled
during NMIs handling to avoid nesting.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Signed-off-by: Hangjing Li <lihangjing@bytedance.com>
Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
Reviewed-by: Yu Li <liyu.yukiteru@bytedance.com>
---
 arch/riscv/kernel/traps.c        | 44 +++++++++++++++++++++++---------
 drivers/irqchip/irq-riscv-intc.c |  2 ++
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 63d3c1417563..185743edfa09 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -356,20 +356,11 @@ asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
 }
 #endif
 
-static void noinstr handle_riscv_irq(struct pt_regs *regs)
+static void noinstr do_interrupt(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs;
 
-	irq_enter_rcu();
 	old_regs = set_irq_regs(regs);
-	handle_arch_irq(regs);
-	set_irq_regs(old_regs);
-	irq_exit_rcu();
-}
-
-asmlinkage void noinstr do_irq(struct pt_regs *regs)
-{
-	irqentry_state_t state = irqentry_enter(regs);
 #ifdef CONFIG_IRQ_STACKS
 	if (on_thread_stack()) {
 		ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id())
@@ -382,7 +373,9 @@ asmlinkage void noinstr do_irq(struct pt_regs *regs)
 		"addi	s0, sp, 2*"RISCV_SZPTR "\n"
 		"move	sp, %[sp]		\n"
 		"move	a0, %[regs]		\n"
-		"call	handle_riscv_irq	\n"
+		"la	t0, handle_arch_irq	\n"
+		REG_L"	t1, (t0)		\n"
+		"jalr	t1			\n"
 		"addi	sp, s0, -2*"RISCV_SZPTR"\n"
 		REG_L"  s0, (sp)		\n"
 		"addi	sp, sp, "RISCV_SZPTR   "\n"
@@ -398,11 +391,38 @@ asmlinkage void noinstr do_irq(struct pt_regs *regs)
 		  "memory");
 	} else
 #endif
-		handle_riscv_irq(regs);
+		handle_arch_irq(regs);
+	set_irq_regs(old_regs);
+}
+
+static __always_inline void __do_nmi(struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_nmi_enter(regs);
+
+	do_interrupt(regs);
+
+	irqentry_nmi_exit(regs, state);
+}
+
+static __always_inline void __do_irq(struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_enter(regs);
+
+	irq_enter_rcu();
+	do_interrupt(regs);
+	irq_exit_rcu();
 
 	irqentry_exit(regs, state);
 }
 
+asmlinkage void noinstr do_irq(struct pt_regs *regs)
+{
+	if (IS_ENABLED(CONFIG_RISCV_PSEUDO_NMI) && regs_irqs_disabled(regs))
+		__do_nmi(regs);
+	else
+		__do_irq(regs);
+}
+
 #ifdef CONFIG_GENERIC_BUG
 int is_valid_bugaddr(unsigned long pc)
 {
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index c672c0c64d5d..80ed8606e04d 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -34,7 +34,9 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 		generic_handle_domain_nmi(intc_domain, cause);
 		nmi_exit();
 	} else {
+		enable_nmis();
 		generic_handle_domain_irq(intc_domain, cause);
+		disable_nmis();
 	}
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
