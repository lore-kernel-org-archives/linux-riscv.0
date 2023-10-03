Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96885E75421
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fnl9wrWI3e+ntrCRN4Z3wB7Q4g3WORfF+QXsWNQb6Ig=; b=cwYmY4/AanMFQD
	9ECH3uNnmC6vgCsViHDyqTvcOfJhp5BkEmz5361TBuEMTwsK2d4mJ+/ZXMEmLWBytbce1MmrJdEqb
	wqqye3D34HrFqr4I9Jv48uEstTh33Frg/sRD0fdfIsv3j4TuVL4ANxksbqm2GqOp2bRfUbDJW+2YY
	gQzCuFu98vgk1XhVP3FPqVIQhm7LM7QJK3HCX67DMgHVym8wZu3s7gN2bz5zQvLdMzMpgNX9ITAJm
	J4movFIdNPQNrCeLQ/v7E01RaWlD4ZigcEsIv5uBwRNGYv83jEFKB1GPHw4C6zbfO3v90uGWqjMYQ
	8ZGlqk+fD8kFGFUn6TPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXHF-00Dny2-2h;
	Tue, 03 Oct 2023 04:44:57 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXHC-00Dnvl-1b
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:44:56 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5890aa0573aso247698a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696308293; x=1696913093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOj9ECaB96rIjjnLWcT6tpDdCA0D2GI5mFoVxJymrv0=;
        b=nXVe7F2aMupx6s/VU9dsv3SYaF2BcE6P9adI8r/J/i3kRJDHu5ryaT+HmoBxG7a7YZ
         AsGuyruWpjPhj21QA12LQWaR0/AO13fAlctnl93KAiY1duN+Oo7l5x1ACZ0Ojh+HB3ut
         D6HTfx3dIzp1q52vVa0n5jVlyRuPL8EgKzeHH04H3/iDaBctBgaaDn07E2k56W/6Hf7/
         RKgtjuLwyMn8SNW3hcvdT6LYr99oE28ybmlGMTJQzfx91WmszujhcKEZf+xfMnvHegrv
         P+qjc87buMklBtz5ZPRmEAVY2v8/pyFaMtNdw7yC3/ymo+hcqdjp4erH+GAwWC5O/KLP
         09mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308293; x=1696913093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOj9ECaB96rIjjnLWcT6tpDdCA0D2GI5mFoVxJymrv0=;
        b=IENL9az+ucvgsD9ku4JV1oxnpqmTWq+C9NQ9U7nDcNHzyOzfn7QmVA5dawuNFG51PM
         9smKDabOH7h7c2ApSThX3vxgqouXPenLQTzCBZLTwhIkND14r9rMBI9TnSWEtj10M9En
         5bHLoDIibRO4o38pklVsZijKnj3iMFX6e2G0BwRKYa4cGU9EfXr7Bk4ukT3ZwAFKaP7u
         AkUMyI+ZxLUu4pIs9AcVnxQttBCzCoWSsTYcKFFaQaLS7cvXc0MWu5v70Z7/MbAuSu+c
         IRhsTrT1Vo4Sx0F7JDxYL8o8AGmQT9MFFc4o1rGsd0KMLvFS18PPn8OKTQ0VmiDz0xnL
         IrJg==
X-Gm-Message-State: AOJu0YybqF4Ewec8yM/iOzxjIHu+20moIZ4Q4CHPxhx9JTFPCq/bMxV4
	jbowrmNiPb4Ic3nrcLQIgWwkQw==
X-Google-Smtp-Source: AGHT+IErIGwew/5bRYW1/++ahAiYLbcPWxK+l3oardRgJZqLBMo54T3jsTCtBmg9kGmFkIXSEs5qEg==
X-Received: by 2002:a05:6a21:81a0:b0:15d:ae4a:9a72 with SMTP id pd32-20020a056a2181a000b0015dae4a9a72mr11250884pzb.61.1696308293211;
        Mon, 02 Oct 2023 21:44:53 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id h9-20020aa786c9000000b0068e49cb1692sm346421pfo.1.2023.10.02.21.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:44:52 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v10 04/15] irqchip/sifive-plic: Fix syscore registration for multi-socket systems
Date: Tue,  3 Oct 2023 10:13:52 +0530
Message-Id: <20231003044403.1974628-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003044403.1974628-1-apatel@ventanamicro.com>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_214454_534560_A386EE42 
X-CRM114-Status: GOOD (  11.42  )
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
