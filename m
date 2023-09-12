Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C05EE3F0D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 17:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUtS8eaqwH0AA0wLJFWMEDGbZEykg6PukU5JsNtNAa0=; b=G6O42OJ5vz/vBE
	agt2k6rCPfeu96F5NacrZL5vmXpvmNP3W8vQNsRr6ZUgMJa9fTQ+ccA3jvyLHzY0LK2u2cxsoZtfT
	oTebKvYDBcNaOiey/fnHCRN3jQg/+jPlEj3VFh4FBfG1OTOXKGiC4mxBy9nJvx0BhsFF7FNijH2qS
	iOjowp2Crf/wDZNS6Eb8xOLcm0amdcul23SYKDX2OLXD0CcWJCmn7x7VKBJ2gLWepbCcss3/hpSer
	cqh6dsEqyJ6bTCh5xifsac7DsBWmkWeDOfjqHOVJxJ6vWowmiZh4v6oNRLKSqYSu0wfoO4J3PFeCt
	gVLVnAZ5y8xafZq9l2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7XK-003voB-24;
	Tue, 12 Sep 2023 17:50:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7XI-003vlT-28
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 17:50:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso40628245ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694541049; x=1695145849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCVa9hJzP2APKbmQpyeCR0W7lcMtt7PzRbdh31HXulM=;
        b=ceiUGn1Ro5IERWEvnVlToIrsOgc1kPMYs+o1+WpL2akR74Sg95Zs6xNZpBj2wT7uaX
         Uh+kz7POcRs7fH/ekrKrlz+xbTlUENgnpkWSfavJLlPFvhVv9swcGQoBieefmu/tzhlg
         7fD27jat33bmrgYUEATUAV9J5ZQ2iVfjCdSTtMou0ufk/2KpTVXb5JbyyOqJ7FS4/ZiU
         k7I0m/JTWFaZGW8ZcSdJGdx45A+EzYVqePTHsAAUFXEi0tx/IiFD81D7BL0i1N60ziwA
         IvFLa/dTXQ9LzPmXsMakRHx2VufLlUpxyODksnu/zIOWI+fG06DP7vVkA66ycfiuhKBl
         7NEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694541049; x=1695145849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCVa9hJzP2APKbmQpyeCR0W7lcMtt7PzRbdh31HXulM=;
        b=wOAzaZUob7ISkU0Whrirk/SiulCHN1xgxXI4d+sGxyEEzLUZFpjhcdYa05g/gUK/BN
         G5JctsbTBZHAvcneDeyS8KLfKGn59xP5HajUxSAlrDZB0FMx5Xh/g+iuqbnahMQrurOq
         2oqMg5PnchyC58yKVqBAGEF4c1L63SHI5rAaVh47eYBtJwa9DfZwGjZimFSW2gX9bkTo
         iM44/CjCHg+Hw0T7pQIJDLon1xVnkzirE3avhqPEQeLK1HvdXlCPdCeh9kYQsx/xGHIN
         az3P7neN65DWbtWfdaZtWcEpC8fBbZHZjQHRzBwHA8+L5loDsNbxBqupjq9TU8iYYiHO
         YALw==
X-Gm-Message-State: AOJu0YyrcXV7fmSYBAkmRJv7HF6a1qfwNaSs49XL0aNRORje81PDHyAJ
	ULiSTisHGJAyRTtrbIvDvYsC0UKQDj4wY5kXGUk=
X-Google-Smtp-Source: AGHT+IFCPlDBNQl9A2NXvNyQAQsJVM9d+czenWRCIBPffU6YSIMvNmS34Ur0vjA0HgmnPj5+MBTNxA==
X-Received: by 2002:a17:902:ec89:b0:1c3:9632:f144 with SMTP id x9-20020a170902ec8900b001c39632f144mr578158plg.31.1694541048828;
        Tue, 12 Sep 2023 10:50:48 -0700 (PDT)
Received: from localhost.localdomain ([171.76.81.83])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902a40c00b001b891259eddsm8691440plq.197.2023.09.12.10.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:50:48 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 05/16] irqchip/sifive-plic: Fix syscore registration for multi-socket systems
Date: Tue, 12 Sep 2023 23:19:17 +0530
Message-Id: <20230912174928.528414-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912174928.528414-1-apatel@ventanamicro.com>
References: <20230912174928.528414-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105052_703070_D2B858F7 
X-CRM114-Status: GOOD (  12.20  )
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
