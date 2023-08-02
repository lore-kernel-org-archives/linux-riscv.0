Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77224C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hm5/I63Ctg4GWFOHm6z/fIugiOkYXtGdPZrus4BFSr8=; b=BDIN+czoIuiVFL
	Px/7ROzOhMDEc2zvTb4eBIAsrfI5wBuctdfYf2d2WYc4nqCsEf5zQyPCPdZTaCU7DIbJCdpvZXTl9
	logI0Dq0SKel6q6rJSXj9q9OKL8myfBfx6EDIUGIchbbPXklDi2YmpTf9LJS6Ifi5wV3yB0S637WI
	WTE7zyrbnPPbxvZAFpuX45ltMjuqjg0Ya0HpChWjeoqkU5Too9mD/RC+5tKfIDMcNw8/eehWUSYXw
	nsCVWUVTND2yG2XcE/JsCRT5tC2M5Fdl78dKqp/8Pr7yhMdkcSSF2YA39VUVD7Ewc4XbAIg6NXeXO
	uRitlnclVyPfZu0ZT02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDLe-0059jx-1K;
	Wed, 02 Aug 2023 15:01:14 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDLb-0059he-2K
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 15:01:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bbf8cb61aeso29201015ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690988470; x=1691593270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKnkNq9mHXbpDqEgJF2mGpUUpQc6aLvqIlFOdqDcBBw=;
        b=cPNW5uKbbO57D4rsKk1kcASZLXLSTInnQ/7hwa+23F859w8h1FA2JvSgyBYhIpdrz1
         vYPwzAEicH8mdGSTfbMY/ZnxChf/bt1j9v5tSqS1fwOVwV5eeIeDX8SjcBn3TuLRwtOl
         ZhDW6hzVr8pjqd/OI4VsiBYp3M2Bivv07pyK2CxXmDOBE0ybJ7PJ90CTZBJPjMcMl54A
         QYRpDuR6WLtYoFKCRJLos56B9wrCf0/xz2vFcKd7RAbf3If6dVd9W32sgkomiMdfqeNA
         qevf0RO9IRX/r9ggk9x9l6QnaBgEVRkLdi/UJXotopxnJUBDmqsDPo8rSqbNY+W2360Y
         cF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988470; x=1691593270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKnkNq9mHXbpDqEgJF2mGpUUpQc6aLvqIlFOdqDcBBw=;
        b=dqFISsjO8zotips0IeZpe5E1E5IHzRCPztqgZzvyCAXjPXW/i36Lnhbt6FKjGqTNPD
         v22zxqYsCK9TIRcGP3M8l8iW3x9EBw39CmwNln/zfNLPXzIv2yl+9A1O/GgG9YTzDrA0
         WNnaahEz8tkOPZFMLizAgKKg2Sivm/UTXeHD3G8CT1WxqgI2q32Mq5mHKpM4QdBw6kvu
         M8eXlqK1VDzLQFzOBYfX/m2hHcVk/ReSQtI9+p9S0EjQKk5lw5He9WERCfLhbx9n8bwd
         vvnjQVQbZ6YQwWiAU9uau0yqq4e+xUp27+P8oy5Yk9WK/HsAagNClF0O0u2cLEslkEU5
         QqDg==
X-Gm-Message-State: ABy/qLbtduq+uhLjSx7xtD8XpHJClqdL94WLqyFqE8xBzrM6IcrzjQq5
	/5snDM0n0s4m9AjDAsLyZhredg==
X-Google-Smtp-Source: APBJJlEJravBKwN/7shsEYuXL01uLpmauUOzN4CqF8LhW3ObOtY0jZNiAr7N2OIh60lGxz2X1USnlw==
X-Received: by 2002:a17:902:c20d:b0:1bb:9bc8:d22d with SMTP id 13-20020a170902c20d00b001bb9bc8d22dmr14427707pll.16.1690988470174;
        Wed, 02 Aug 2023 08:01:10 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001bb99e188fcsm12503963plo.194.2023.08.02.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:01:09 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 06/15] irqchip/riscv-intc: Add support for RISC-V AIA
Date: Wed,  2 Aug 2023 20:30:09 +0530
Message-Id: <20230802150018.327079-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802150018.327079-1-apatel@ventanamicro.com>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080111_770094_AAD34854 
X-CRM114-Status: GOOD (  14.39  )
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

The RISC-V advanced interrupt architecture (AIA) extends the per-HART
local interrupts in following ways:
1. Minimum 64 local interrupts for both RV32 and RV64
2. Ability to process multiple pending local interrupts in same
   interrupt handler
3. Priority configuration for each local interrupts
4. Special CSRs to configure/access the per-HART MSI controller

We add support for #1 and #2 described above in the RISC-V intc driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 34 ++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 4e2704bc25fb..1a0fc87152c5 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/smp.h>
+#include <asm/hwcap.h>
 
 static struct irq_domain *intc_domain;
 
@@ -30,6 +31,15 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 	generic_handle_domain_irq(intc_domain, cause);
 }
 
+static asmlinkage void riscv_intc_aia_irq(struct pt_regs *regs)
+{
+	unsigned long topi;
+
+	while ((topi = csr_read(CSR_TOPI)))
+		generic_handle_domain_irq(intc_domain,
+					  topi >> TOPI_IID_SHIFT);
+}
+
 /*
  * On RISC-V systems local interrupts are masked or unmasked by writing
  * the SIE (Supervisor Interrupt Enable) CSR.  As CSRs can only be written
@@ -39,12 +49,18 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 
 static void riscv_intc_irq_mask(struct irq_data *d)
 {
-	csr_clear(CSR_IE, BIT(d->hwirq));
+	if (IS_ENABLED(CONFIG_32BIT) && d->hwirq >= BITS_PER_LONG)
+		csr_clear(CSR_IEH, BIT(d->hwirq - BITS_PER_LONG));
+	else
+		csr_clear(CSR_IE, BIT(d->hwirq));
 }
 
 static void riscv_intc_irq_unmask(struct irq_data *d)
 {
-	csr_set(CSR_IE, BIT(d->hwirq));
+	if (IS_ENABLED(CONFIG_32BIT) && d->hwirq >= BITS_PER_LONG)
+		csr_set(CSR_IEH, BIT(d->hwirq - BITS_PER_LONG));
+	else
+		csr_set(CSR_IE, BIT(d->hwirq));
 }
 
 static void riscv_intc_irq_eoi(struct irq_data *d)
@@ -115,16 +131,20 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 
 static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 {
-	int rc;
+	int rc, nr_irqs = riscv_isa_extension_available(NULL, SxAIA) ?
+			  64 : BITS_PER_LONG;
 
-	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
+	intc_domain = irq_domain_create_linear(fn, nr_irqs,
 					       &riscv_intc_domain_ops, NULL);
 	if (!intc_domain) {
 		pr_err("unable to add IRQ domain\n");
 		return -ENXIO;
 	}
 
-	rc = set_handle_irq(&riscv_intc_irq);
+	if (riscv_isa_extension_available(NULL, SxAIA))
+		rc = set_handle_irq(&riscv_intc_aia_irq);
+	else
+		rc = set_handle_irq(&riscv_intc_irq);
 	if (rc) {
 		pr_err("failed to set irq handler\n");
 		return rc;
@@ -132,7 +152,9 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 
 	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
 
-	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+	pr_info("%d local interrupts mapped%s\n",
+		nr_irqs, riscv_isa_extension_available(NULL, SxAIA) ?
+			 " using AIA" : "");
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
