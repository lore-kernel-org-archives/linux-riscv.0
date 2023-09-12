Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D57EE3F09
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckwKhs0udQjL+R3q1No2zKxRfERvLMMqABgSNxxIePo=; b=Z3+ZQyv+g8afM0
	627NOeZ+s21DrybkwFbtFOLhJF34K17lsDIbSF7qw6U2cBy0AArZKXveoWSsKcjRe8qiFf7Z0pgQa
	+Yyp+aaNPfaZW0pssotUkjVr0muxdd4A12PKk2wtgxSPpH2Z/KUBEB5yJzv9+1ySVLL9aR0V5nj0j
	lKcKrUjbI2Zue/blfNHUUf/BnsOGluUMgEpNtLM5zURgVaK9EUbYkXH1ioiUvW7i/ePv3AjCC6/3i
	orSXoIDpffh93BaR3Yb24MIS2CbOPN+09eptDvJoROnRAfHavMR0ss4LzXwKiL9Abzl1DJUO3QkCu
	xyEDrqcLAv+XVIuisxKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7XD-003vjd-2Y;
	Tue, 12 Sep 2023 17:50:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7XA-003vi1-2b
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 17:50:46 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bf7423ef3eso44418355ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694541043; x=1695145843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQiwHLQTp/8j8gItu3f4LCSePQxOFgN8ncFMh196Onk=;
        b=ULQlOrXPJfGdZrIpBBoq+LJhM5ddUzRFOqX3apirX0hWqVRhbLGTFDf8wvtaYSnfoT
         zeWwrlnz2Dd5Yo+PtGg9mtB2116d7FZ0GHF8TIKZh/i3fqRS6YcL41HcA2qNJ8iPEZO6
         pmcQ2rgchxc1BpwG94TTtdJE351ITfdy+6gy7yOWHjEf4Xr1w7Ywd5bEJIFsSCdja9GF
         BrqUSg8q0AGNDYBvPXqEF19AFNt1tLBl62qwwUWm8UqN8XwXomrdnmJ0LxEDhXu/twSM
         2VO4Y40wQArIT0xztXxKlvuDe4bOilFGxPRO8QTZ3gLgyM3w4LDddyiIOAqwE2LDovPw
         Te6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694541043; x=1695145843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQiwHLQTp/8j8gItu3f4LCSePQxOFgN8ncFMh196Onk=;
        b=uktaJsbhqG8CJb562MfoT+Lo8U6uGoGFXnLytmPIML6jpTUo4Yv6Xe90oWd2LkTs4M
         rUCsHhArEDUTdTaEJ1Y4ltSDJSid+jQAhRgVab6h1OEp4hiQtAEpFijBWeCzLZdJ2eGY
         YSMlGDQm1dlKfscZi3i/nOfwvX4XMHM36mMR+nmEqWP6VPZ9DMRstTpjCOuUyOfj51mZ
         bKq0fKvCEguKvhkChxTb86vjK2/G30A7LR17HKeOubRlM6ikJjreGRIm7ZWutO7k6ja3
         4/VOhIH/O2fjoOrfgC/DPSKR1QcbibIiAlH4wt9Mf5mongapR2M0kVLOIy2RMLmxLAtB
         +XFA==
X-Gm-Message-State: AOJu0YzFxozAwhlmsciUOIYYQSTGnXIKdwjCwbX82PKScaTar8bsoaZX
	5+bMNJNNmjTrNCGCFNwZBK5Mjg==
X-Google-Smtp-Source: AGHT+IGb3Y0IGf+T/3c1zAtUXuZiYqxRawUrDacpbGMGlr3qOkr3BMzkiZMB6y6Jfvn0dMIc0zFAPw==
X-Received: by 2002:a17:902:e812:b0:1c3:39f8:3e71 with SMTP id u18-20020a170902e81200b001c339f83e71mr544767plg.18.1694541042718;
        Tue, 12 Sep 2023 10:50:42 -0700 (PDT)
Received: from localhost.localdomain ([171.76.81.83])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902a40c00b001b891259eddsm8691440plq.197.2023.09.12.10.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:50:42 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 04/16] drivers: irqchip/riscv-intc: Mark all INTC nodes as initialized
Date: Tue, 12 Sep 2023 23:19:16 +0530
Message-Id: <20230912174928.528414-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912174928.528414-1-apatel@ventanamicro.com>
References: <20230912174928.528414-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105044_846137_D2F962CD 
X-CRM114-Status: GOOD (  15.42  )
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

The RISC-V INTC local interrupts are per-HART (or per-CPU) so
we create INTC IRQ domain only for the INTC node belonging to
the boot HART. This means only the boot HART INTC node will be
marked as initialized and other INTC nodes won't be marked which
results downstream interrupt controllers (such as IMSIC and APLIC
direct-mode) not being probed due to missing device suppliers.

To address this issue, we mark all INTC node for which we don't
create IRQ domain as initialized.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 65f4a2afb381..4e2704bc25fb 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -155,8 +155,16 @@ static int __init riscv_intc_init(struct device_node *node,
 	 * for each INTC DT node. We only need to do INTC initialization
 	 * for the INTC DT node belonging to boot CPU (or boot HART).
 	 */
-	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
+	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id()) {
+		/*
+		 * The INTC nodes of each CPU are suppliers for downstream
+		 * interrupt controllers (such as IMSIC and APLIC direct-mode)
+		 * so we should mark an INTC node as initialized if we are
+		 * not creating IRQ domain for it.
+		 */
+		fwnode_dev_initialized(of_fwnode_handle(node), true);
 		return 0;
+	}
 
 	return riscv_intc_init_common(of_node_to_fwnode(node));
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
