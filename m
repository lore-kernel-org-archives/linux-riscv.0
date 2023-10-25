Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B36C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fnl9wrWI3e+ntrCRN4Z3wB7Q4g3WORfF+QXsWNQb6Ig=; b=4UgQVv9c5dJspe
	U04tpGloBcEqn6h3OkxTpM4dl+g0Go5tXSQ1c64sOuvqSLOouIa1zHnSQuaRwl/05g0YB0GKZ2+xd
	13QwNz93sLsOK4W+LRbVOTTBf0mtkapRekCR4sYeQXS7B5FsPybd1ds6rAhu8I/ryXt0JD/8UiAp2
	tzvW8kiWasnf33YSo40j+wlXd4c3t84aqnX7Nw/PUbT1lnrFbamvcwYDy5ertrHg7iZZ1+hSmPOrn
	VwbSSmN8v7Td4ox89I6mG9ehYh5Cymxw4Sfu146jByF8851vxJPSruFT5OMzrjFgCV8P5+lqbCHT3
	zzKmzkU11126/b/C5HVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvesW-00CWBH-19;
	Wed, 25 Oct 2023 14:29:00 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvesT-00CW9o-00
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 14:28:58 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ba172c5f3dso4924628b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 07:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698244134; x=1698848934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOj9ECaB96rIjjnLWcT6tpDdCA0D2GI5mFoVxJymrv0=;
        b=netSNEF6CAwRwg1UA7LkkQOXM0fV0BAq3LOgD0mCBUTQU3SfGz40Fm+/tgZ6tQNdNC
         X6wUi7zpEn+bYXoFVKDJkVa5inFzSkiYCPKZI6r4KLsz42+2EEi6H/tEM5lzL9aTgoi9
         uBVXDqWrbWxlYe7Apfh5rLDqAbo/yWK/iDpdw6SlYH0uj6q3YeWZkzk+9IG6LY5VdcrW
         nRKm1PGJ1Snv7SCRNc5yc2jQlNToUeLVKlt3V94zU9mJBrmdoxdwxpIh8o8C3YVNMafl
         PXMJJ4ZSg3ZtLOkUaSI6M7nHhEkePfVTwUsbGnL9T77aFAlA86vy0vKWHy+kHJnyaqEP
         70GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698244134; x=1698848934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOj9ECaB96rIjjnLWcT6tpDdCA0D2GI5mFoVxJymrv0=;
        b=L7vuczDvRoq2MxQtkMjpy7pDDtG/agXBW6BVGD+89qYb/mb/Qu2SDttXUHBTUNCv4q
         9CpsME77Ya8ayjePavVnbZRxDI+9njX+ydf2J15RCfb/YNRG9D2i/6yXEJMqvcMFuWe+
         XFZsGRt7fbLILHy80Njraq0QtoeSaeXmJLLmyctmqs2TQEC2E/z/DWH7Kq1fFY5c1tXS
         VIR4EQnkWlZsvdVkQud23YzvBTdry1k9YFcHAYjKjjZ5jFjzKT2LkTZAf1KSiuPDkr+x
         NR+LjMvDnQKbaQMCrh7jrDZbSZDZQMCX8o9KE8RnAsdEUEWmiQuxbYKK9zLbSO9T5Fh+
         8+9w==
X-Gm-Message-State: AOJu0YxqvmEfgaTCaPlHz5nIDyKuPfECfAhU+VOQmdN3daOxnv7weO2c
	2Kq82FIF0jc5l393NlJ0PIUrj77MPxcaV6Y1HTc=
X-Google-Smtp-Source: AGHT+IGHCSEg7Io7oj+lSNy3jedLTxF0ufcFdVxgxPqyNpxvjQpIXsr2HA/g8AyNGEr3ud2qdGJrTw==
X-Received: by 2002:a05:6a00:990:b0:690:c887:8cd8 with SMTP id u16-20020a056a00099000b00690c8878cd8mr14948358pfg.32.1698244133835;
        Wed, 25 Oct 2023 07:28:53 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id g2-20020aa796a2000000b0068ff6d21563sm9817411pfk.148.2023.10.25.07.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:28:53 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 3/3] irqchip/sifive-plic: Fix syscore registration for multi-socket systems
Date: Wed, 25 Oct 2023 19:58:20 +0530
Message-Id: <20231025142820.390238-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025142820.390238-1-apatel@ventanamicro.com>
References: <20231025142820.390238-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_072857_033687_DABD552B 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
