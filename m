Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8F6C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 11:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckwKhs0udQjL+R3q1No2zKxRfERvLMMqABgSNxxIePo=; b=lNeFQ7K9nP3fGR
	gDtkOMxgyMijWQ4FKukhf/bWOxci2ilA+f/5W1b/HDgj1LauyYK8xdKkhexyJwDv4IRYPvLbkbyYR
	tiR4FSfoTxRqgh9xLn1INAVCkHUB2vnJEkzD6Evs9AcxLQ7GPq57H9MuwwPAUMtDveZN4pXPvCy5U
	p+YWB8JkSllBcPw4bwq+D8nzvVwjKuX3x42ZvDrTP1mk00/fZmzwEyi9WtGx0vACFCe6nZiLooczq
	FYZHrLV7SkcgS3rRcOF9j5eh1M27N9rS1+Q88KNclUgB9+rqGFFCpCGclbYjB1rHJyZrmO2IzNDj4
	d9Yt2GCGGBTTq7FK3TOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5Ta-007Fx5-37;
	Wed, 19 Jul 2023 11:36:14 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5TX-007FvU-3B
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 11:36:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-666ecf9a081so6759849b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 04:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689766570; x=1690371370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQiwHLQTp/8j8gItu3f4LCSePQxOFgN8ncFMh196Onk=;
        b=WAO50NkUFcJNAH38hHesi1r+AhVYkQ3T7HiabLtaPKGo+n8KaN9dQ1BPiWlPZaxre0
         ghmIUYzEflFP9s1yN4PmzDbFFZ3yLfhMG/c525rbrL0geQ7j3gmj9QA7MFxracRRnpBX
         swRP3S5w3ETO+2wgm4HsU9zgSReM4HzTxHPhVJueMsqDmzQB68lzUJSCRdWMCqMX8X/R
         ESSNoscvZvcfLh3V+F3fWiIh306v+SdhgYkHCByFQf48Ij43zRqR2DU8rKIfB4sm53sL
         qNGiTx+lgH0c4HPRODh5UqpGjqiqeOtcK8xM3/ADfyHamb9TmsVtx+JvUkIAHYKjWcK+
         FK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766570; x=1690371370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQiwHLQTp/8j8gItu3f4LCSePQxOFgN8ncFMh196Onk=;
        b=OKooXu9x76gLg0FKSIoPUvRpsuTPLZaEO4Q3Kdr9CRVBCQKYGLS8YY36+GLbRoPpQS
         24tHo2SRt9snCI8CddSFS0D7BwHe4JxfGo4WWC+DMFUxTLAuxs7Wf4XS98+B3fwBpJEY
         Wl6ZFiaP/O5zTpjzhpxK4FPcmJgJE0raMvLjGeVLywc2LZGmDu37okVSA5/RWb0HZ67I
         gxnmEcsWW74X+gn0mYzn99pQEw3kpiKkRk1X7Ow+z/+2xtS9h4Jiwvoy+vHp596Upxv7
         muo7ofoqK1Sg2J6FOtRIJta5KZDx6u8H9IQ/Y0oOaf8d6J6U/+rgDHsFgE24+V+8eiCi
         luoA==
X-Gm-Message-State: ABy/qLax0U/PT8//qvClLvEwH+uOG71/OGsjGMVhp4P6HstXNH8pjzGa
	zv0fKTG2wPG1YjVTXF6LYa8frQ==
X-Google-Smtp-Source: APBJJlFmLFGryKpfzKpUE3V98g17+lc5UaKu+zvNUvTPMAceFo6f/UbuUr/F/yrJsP0AJyC70N/57w==
X-Received: by 2002:a05:6a20:8e10:b0:132:87da:5b57 with SMTP id y16-20020a056a208e1000b0013287da5b57mr22614317pzj.59.1689766570147;
        Wed, 19 Jul 2023 04:36:10 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.130])
        by smtp.gmail.com with ESMTPSA id j10-20020aa783ca000000b00669c99d05fasm3050408pfn.150.2023.07.19.04.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 04:36:09 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 03/14] drivers: irqchip/riscv-intc: Mark all INTC nodes as initialized
Date: Wed, 19 Jul 2023 17:05:31 +0530
Message-Id: <20230719113542.2293295-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719113542.2293295-1-apatel@ventanamicro.com>
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_043612_026184_446006F0 
X-CRM114-Status: GOOD (  15.00  )
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
