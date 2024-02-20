Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A99C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 06:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYPASAH6CUtoadrUUgs/vifzxzP1e3APVGu0P/dz/EY=; b=DLvEev86JiRUqX
	n9kUbaXc/mzbppoI1c4Xs7zZwlP3QG1L1a/YRHee5xdTior2n5hWpas4J4todO5YSVdnpQFWGicQi
	yl51XOkvnjyjl8Lgun7ZgJ49flC2ulQi6CSvL6/FnoT9KlyMYT5aUPX9KLtourRvCn6Gfwp2+LanC
	nxNs3fmrssYZhPmjfFoXT+iIMABH+zPgUBYynsH4gEKn3oDedoqyPXk5C0oBmrD8JFVNHNqnlUkHy
	nlBbojDK82YVleRPo5eMQRIwIaE6AS5ZMEQk3MbHm/C53emFjZp9hz5tpilbeeQaapcsDCASTTmcX
	ugXTYgbiABcWwtGhTSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJIc-0000000DHlu-1Csb;
	Tue, 20 Feb 2024 06:08:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJIT-0000000DHfH-0Y0b
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 06:08:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1dba6b9b060so24192775ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 22:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708409284; x=1709014084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RNpF/CWjVyq2jAidq9g4JrMuQdRaRtl2xGmvH6ydPA=;
        b=ilA5poR5AiFnPzbQNReXjasgEUALkzBEDY0Ep/GcOF621YSVB4r9I+oktN6iPa8k7K
         Yxj0Ib04BjPGaMOF03eKoTCc7QVXh80O92G5TIcdKulfUS0nmCN4zPvcwb5vv5NlPWMc
         NmNuffcSiLpGTWW9eLey82la3zfYQ0vu7HM8s4VWkXk3pfScrqSJW39ooBfMdgBu1Ea1
         NQr62IfyNbaw6VBjDzs0nWNfgdtmNDWABceb/gceEtidAq6y3Bav4NnI21XHb+OTrHC7
         2gWb15kMjx9jr/c02b9M1pwnhJTy1Hzq61MtMZTRQLKxQVBOa9JSZjjD12P/tZHyTAba
         AZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708409284; x=1709014084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RNpF/CWjVyq2jAidq9g4JrMuQdRaRtl2xGmvH6ydPA=;
        b=lGY8f6j38v3DloMqVtSgU2i/83R6HHxbqdHxU9j3eHmrSPBOKIybIvEpiipRF0SLrB
         lyzZblabTg2aKT27/ByOYUQyfeZExILLgqYK69FJzJ9igau3ryfwxSw6aVvFEcuORwm+
         OfV2p1+NTcF3NQnbAMrN/qb+fwrftXfzZ56uLenoqY/tJepHvLPEwNTgiZAJko5H+ALR
         8tFfypxiMY4mZpg4uB5e7bIeT6Pfdqkt4qzD+bbs6b17SgwaI0RwXxZkkJ6ZDOreRNNV
         3NXZyXhrDoPPXnlTMHWlOa11kp8sWRosIKHlE8fZ0dQrwLmprjOChQTAygKPEN12X4iB
         YrUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsrgJ8ehYoJ92hLgJlEsg+cmXi2zepcehGxSfsxl6dbCsNaXz1kyiVJICGfhX1DNlGrumGpmwiPcSkKWKenxpULMIP2W7C1j6JjvSr4D3+
X-Gm-Message-State: AOJu0Yzu+iXK2p9ZWQsGko8LakuGQE45mqg9aerUi6/WiyS68Ve9IJzo
	td710IClp5LFVyq2fvx1cAqMI7cZLataEU5/0HjppdxemI7qfoPJVTWBkQYT4do=
X-Google-Smtp-Source: AGHT+IHE347dDU9aO1yM5GxfMUmUFQla/Fhk4fIeEilyp6hgetGifJxkk866esqcxA3POxZZ3TvgEQ==
X-Received: by 2002:a17:902:e545:b0:1db:ecf1:3b83 with SMTP id n5-20020a170902e54500b001dbecf13b83mr7080645plf.23.1708409284467;
        Mon, 19 Feb 2024 22:08:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.86])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090276c600b001db4c89aea5sm5368114plt.158.2024.02.19.22.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 22:08:04 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v13 03/13] irqchip/riscv-intc: Add support for RISC-V AIA
Date: Tue, 20 Feb 2024 11:37:08 +0530
Message-Id: <20240220060718.823229-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220060718.823229-1-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_220805_330049_E49557C9 
X-CRM114-Status: GOOD (  14.51  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
index e8d01b14ccdd..bab536bbaf2c 100644
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
