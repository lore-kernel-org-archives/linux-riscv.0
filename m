Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE1CC04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 15:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUtS8eaqwH0AA0wLJFWMEDGbZEykg6PukU5JsNtNAa0=; b=bFQHYlHY6NomNX
	Z84SUV9/Ym5oXX1DGmib5Daqt8vxDpeirZBwJCXdxr+Q3E4qARuoCzl3CF+Zv+XHb56am6NdcSeFx
	It4aQZJK1MKjKOMzz2dp2yV8vn+0nmAdiX5BYu3FYVQqkfOA/lKo7zT+KkEcgF79F54t8LsKx5/ci
	vcST3OuAw0jGnBnJ1rn8jxr8vbXQwL6QoAXx+cR4EnrS6bgbBRhFsfQco/l9hFKAJxbfFctdEOcTL
	11xXwjS4H+ykggWx/dgmkKYqqaDZwm0dOU6Ap8EadDMRIzsZz4l0WN5djWyGZZvTO2o0+L7FFau5v
	TZuTGsG41nTrygO3l4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDLV-0059eY-2P;
	Wed, 02 Aug 2023 15:01:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDLP-0059cb-2b
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 15:01:01 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2680a031283so4220663a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690988459; x=1691593259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCVa9hJzP2APKbmQpyeCR0W7lcMtt7PzRbdh31HXulM=;
        b=ZmG/EBVlm1FNTd6nKEXSRojtM28r94q1gev+cUpY5PKAKQNHAjlXzxyYrfPqjK/zGs
         Ic6gKNmPLgk12c53IlzJU23AR9znjJG7+Y9BcSWDpEGji1BQTePM+HGhIDNqmuOXnlHt
         VfdS/y9Tv2ryKoDVLRwjix4kBCSUG0Wp2CFgzjWCJRHLtcarxvD4aY1L+DvfROQI54BV
         z9wFpGp4VqFCwwauwYveoxT4BgMPDchgOpCXLDcV5xuemXqYsm8QkrINBLFq0KXTrpdI
         tn0t8YkAuSGhx5/Vb1votX92KL+GfrKBxSNyIv76Em/S/7SihaSCifZvJgLBGRowhEcl
         PT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988459; x=1691593259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCVa9hJzP2APKbmQpyeCR0W7lcMtt7PzRbdh31HXulM=;
        b=PhTCpk3jQeVUNYix3VpGUI6JR2vx4KKFxuZoglnDfrf6fw/oshsGgIiv+7JQSxXoxU
         tQvkBMa9DMl9m41h9bAX6+0e45cggODQorQ7zYUObkc8tGZ6Hno0isUSwTSj83Sgjo0z
         So17Uy/3HUz3KU1ALCt1Fyj9XtjmpZSgW3UozRjPlwr+4WtEfM1p5akhmuR0wI75m/fP
         bYW8EzmMNmMCGA9EdzF0uDgNESPpM8U01x7AdJgOBzNLTe9vI+Osn0OKQXaDSHGlUYNN
         ISjOZTUtqe1yXSRT4iJQ9j2cbvbSeg6hJF5vTrTrKdqHK/mOl9FmKPp2KozNyLl+0J9a
         jmLA==
X-Gm-Message-State: ABy/qLY5yPbSnionRcmAMLYSCRvyzmHuxyXqlerhua1jaA1IRI/2cJyN
	M6Gi/ZiFBzO0uBv7v/IY5iqfaw==
X-Google-Smtp-Source: APBJJlH8WmII5x8NpCWqAjBeVUllPxLp7iFaK0LpUj/2K69WW4pj6P6pxkO+/x2tXraADNeTJPZZ/A==
X-Received: by 2002:a17:90a:4f0a:b0:267:717f:2f91 with SMTP id p10-20020a17090a4f0a00b00267717f2f91mr13327287pjh.40.1690988458942;
        Wed, 02 Aug 2023 08:00:58 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001bb99e188fcsm12503963plo.194.2023.08.02.08.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:00:58 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 04/15] irqchip/sifive-plic: Fix syscore registration for multi-socket systems
Date: Wed,  2 Aug 2023 20:30:07 +0530
Message-Id: <20230802150018.327079-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802150018.327079-1-apatel@ventanamicro.com>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080059_844127_C2F1D7DA 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
index 56b0544b1f27..62ba27553cc3 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -533,17 +533,18 @@ static int __init __plic_init(struct device_node *node,
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
