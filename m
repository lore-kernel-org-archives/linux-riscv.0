Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA991C25B48
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 17:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fnl9wrWI3e+ntrCRN4Z3wB7Q4g3WORfF+QXsWNQb6Ig=; b=S4tB/bf6E38+V3
	iS6ZXAANheV/moobJIS0jC+5tN79sdgB6v/iLKIYh9ncwlFQuVmJanhJ4BQPI1gTpHm7eKa+GhLEh
	miHdW/FpeGyy4hz0ULBZ+XGsxWSlIX03BP7JtAB2G2+Uwsc2/OfeYztPKJaRCowqY6Q+mzx2dCqTR
	4rnDypF0siquwbmAwU2bPxREGg01LdQiHtCWXCgpv75CAo8i1TzR37jdf3wBjAR+jajYP/GLGYZWS
	7HuDQFKb91Fb93Rdaj4KM3TFi8RI/ECoDrpo+YDQ39WNG5iSP1WDbv2WlIOKqiaimNhKv5VgkHBxU
	W/14hjS5MAjD7VXq8VSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyj9-007wBd-1S;
	Mon, 23 Oct 2023 17:28:31 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyj6-007w9L-1K
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 17:28:29 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so3434194b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 10:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698082105; x=1698686905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOj9ECaB96rIjjnLWcT6tpDdCA0D2GI5mFoVxJymrv0=;
        b=MS6s6m3F8IuB6olUVELnAA47R54WXRAy0uPSNDX8b3Np3u6T58wZ9CYggJCQZVZuga
         ybKr4EOf/mRinv7v9vXaJxwBpmZN5uMxuOQgsQwZgosLHh+iol+Kv3blzcRTuciv9L2V
         jLV0gI/RCmxnKg6Olrro+kh80dnroyY1imqyL0OSeoS941bb9rrcpFOWNM7HgsgEa6DW
         //kI0IjsSvg3YHhXsQUbcpMf3lCvASXcQ7FZWQkWe6uUIUVQ+iQe8DMstBMDWLM99/8B
         BH5xkOUvy3sO9s8XtlLXDtEXVPhvvtcLf/T/IwaTjLbWdJRJgxHWAtNUJGo1hkr06M0l
         uIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698082105; x=1698686905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOj9ECaB96rIjjnLWcT6tpDdCA0D2GI5mFoVxJymrv0=;
        b=muQfooQEI+e7/qwXiCr6XHJyPVi3g3abvHAAy0fM6IfAZCaVgpR1LPRMk8hAG6ymYC
         iG0TwiWYvnFeaL8GTeVUq34nqsqhq2eQQdpG2KXXNmeNO5yNTe4Dlqkju6m3VaMtP97O
         IyhVHOJoqGCYgjZ8b+NOhNNZtmcKsVANvxLlen5quY3dNg+po4Uc1lRQLkv7+3LxEVHf
         lsTZsxfJf26YJbw3eHLWUDLdNn0SbbRIV9xpScJVl83s8vsXk5jvv0yfQJXw9lXGBf0i
         KJpjie2i/kjLUyBlQ7HXZWh1JX7gOgNJZmi2KiOJTpjuPeY5OeDgh6E/EjNm+msC8m64
         7CCQ==
X-Gm-Message-State: AOJu0YxhspDJAjefICTuw5kqCbjsoq+W0py0G+e0+NqlBJJTW6AqEDCi
	W9WRpdy+FDEMlIoWRk9ndUbqhg==
X-Google-Smtp-Source: AGHT+IEnHahVw3qnJm1+n/UjAUiTilQ3VeBFGYVhtzAuitdx99t+7TC49sKKyAJtXJ+4NIsGQtReyw==
X-Received: by 2002:a05:6a21:3d83:b0:17b:cfed:52ac with SMTP id bj3-20020a056a213d8300b0017bcfed52acmr225463pzc.49.1698082105149;
        Mon, 23 Oct 2023 10:28:25 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.9])
        by smtp.gmail.com with ESMTPSA id g5-20020aa79f05000000b006be055ab117sm6473194pfr.92.2023.10.23.10.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 10:28:24 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v11 03/14] irqchip/sifive-plic: Fix syscore registration for multi-socket systems
Date: Mon, 23 Oct 2023 22:57:49 +0530
Message-Id: <20231023172800.315343-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023172800.315343-1-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_102828_447951_0F17248D 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On multi-socket systems, we will have a separate PLIC in each socket
so we should register syscore operation only once for multi-socket
systems.

Fixes: e80f0b6a2cf3 ("irqchip/irq-sifive-plic: Add syscore callbacks for hibernation")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index e1484905b7bd..5b7bc4fd9517 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -532,17 +532,18 @@ static int __init __plic_init(struct device_node *node,
 	}
 
 	/*
-	 * We can have multiple PLIC instances so setup cpuhp state only
-	 * when context handler for current/boot CPU is present.
+	 * We can have multiple PLIC instances so setup cpuhp state
+	 * and register syscore operations only when context handler
+	 * for current/boot CPU is present.
 	 */
 	handler = this_cpu_ptr(&plic_handlers);
 	if (handler->present && !plic_cpuhp_setup_done) {
 		cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 				  "irqchip/sifive/plic:starting",
 				  plic_starting_cpu, plic_dying_cpu);
+		register_syscore_ops(&plic_irq_syscore_ops);
 		plic_cpuhp_setup_done = true;
 	}
-	register_syscore_ops(&plic_irq_syscore_ops);
 
 	pr_info("%pOFP: mapped %d interrupts with %d handlers for"
 		" %d contexts.\n", node, nr_irqs, nr_handlers, nr_contexts);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
