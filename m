Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74128C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq9CQLlmXI+4l0G46np5Y/5P7WXp7fHZdJOL9qJxjtU=; b=EJOclRSjletxvP
	qQMUKSZ+lxjYic3Q5y2aL4tYxRhcVXR/ZuL2f6pmaSw1EpLek02gd56Ia8brAhHrtJEipp70Q2NNs
	L6btjsnxECNPILiin5fsUYsaB8Dj2lgICY0NdQuSsY9wAXp5g7EY+Ab8OkzCXhGgqW+/QvFbxrVeN
	EaKH5MC07P+dnDOy3iahB8Z3b5MhrBdvHHsbA95F3qx2hIU3zUUH4x8U1KOrW5R7b3I0Vrxo8Zl3V
	Qmylgog1OqohQLnZSf1R5z/oEYIxFtgGz9vOQo7K5ZYf8WxwrlZUAUTqdxpxBw8lYrDQuS+s2ZboB
	xeoPqBemk/qLj/FmHu0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Y4-009Dsa-Uc; Tue, 29 Nov 2022 14:25:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Xq-009Dkv-Ne
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:25:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id w23so13533713ply.12
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBh16wlKK1pVBXMjv15TuW7j92X6+xaNPp74Ke5cwzg=;
        b=MCBPj1/g120Iv1kMjeuMVMrddfHIEvaxRkOp/ainQWEfZaR+H8Me+9I6DCNqlm+T0U
         xJNT5M0QZZ8806GKqxPZeqtWvYNQIFtnHI+bYxXGwoz69DA/ftjhtga+RJhJj0sC0jxw
         OSbcf/jRQfVJhCA1mW2yPiEPdzSanu2CHsMLpm95kyas7FCvqxsZWDMJEwlecjovJ6wZ
         IeOIT6ug2PteDDDHCzEuMxVuiy5F/0FCdnTZN12aSxiWELz9hYRwIn7Gt2oNCijWu1U+
         1AOqbsplUFy6XRes+Xvcacp2+J+5vIgLrhWUzaVghN2aRLGD7oVDDWgZVVugZRtsVTYv
         p7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBh16wlKK1pVBXMjv15TuW7j92X6+xaNPp74Ke5cwzg=;
        b=4y/3wt1FsWVTRD8sjgsVNz8GnQbMhdW2fWd3exJLQ6aebLHcOgg9RJUUFFWuHDzUPQ
         4bOe1RLMW7ZxuMnRJ3j9Wazb8fy3GZL44JXwxd10+VGRRcaEm+aFms9CbpEXRxp6PSBK
         r2F2XEBiyOgzd7jkNfCRotarbSI8aPAAp1bX38b7GqC0W3x6RfrathGldi2KXjB2MAbm
         JQ22H4Pc0pzZz+lQp+Ew4i4gJrEPGVwyE+Xg9inYKNsKcPQgl5qyjZhKbPNsVT5WfU8e
         vyVMHVd/U1li46+O3ThUys5T1GIQrxcPu8k5BD6PTK8s4ZbBjebSIIkAL0ccfUGBCyxu
         9NXA==
X-Gm-Message-State: ANoB5pnNSGNzzY+xp71PW1gdJrIEo4UDB+jkbsVRQxxLd+1tUU94GCC0
	RIBy+eo7lTzUfCZ4mv3M1ZMTMA==
X-Google-Smtp-Source: AA0mqf7Zs4NNRjRlp2Pqboqc1Lm1mhDRLOAyP10co5P7bSMxQUPRIiN0s46dBZLX9R12MDZEweS/uQ==
X-Received: by 2002:a17:902:ef4c:b0:189:8b14:55bd with SMTP id e12-20020a170902ef4c00b001898b1455bdmr10500197plx.25.1669731906522;
        Tue, 29 Nov 2022 06:25:06 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.98])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b00176a2d23d1asm11039076plh.56.2022.11.29.06.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:25:06 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v13 2/7] irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
Date: Tue, 29 Nov 2022 19:54:44 +0530
Message-Id: <20221129142449.886518-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129142449.886518-1-apatel@ventanamicro.com>
References: <20221129142449.886518-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_062510_860296_2AF8C66F 
X-CRM114-Status: GOOD (  11.61  )
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

Various RISC-V drivers (such as SBI IPI, SBI Timer, SBI PMU, and
KVM RISC-V) don't have associated DT node but these drivers need
standard per-CPU (local) interrupts defined by the RISC-V privileged
specification.

We add riscv_get_intc_hwnode() in arch/riscv which allows RISC-V
drivers not having DT node to discover INTC hwnode which in-turn
helps these drivers to map per-CPU (local) interrupts provided
by the INTC driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/irq.h     |  4 ++++
 arch/riscv/kernel/irq.c          | 18 ++++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c |  7 +++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index e4c435509983..43b9ebfbd943 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -12,6 +12,10 @@
 
 #include <asm-generic/irq.h>
 
+void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
+
+struct fwnode_handle *riscv_get_intc_hwnode(void);
+
 extern void __init init_IRQ(void);
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 7207fa08d78f..96d3171f0ca1 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -7,9 +7,27 @@
 
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
 #include <linux/seq_file.h>
 #include <asm/smp.h>
 
+static struct fwnode_handle *(*__get_intc_node)(void);
+
+void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void))
+{
+	__get_intc_node = fn;
+}
+
+struct fwnode_handle *riscv_get_intc_hwnode(void)
+{
+	if (__get_intc_node)
+		return __get_intc_node();
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(riscv_get_intc_hwnode);
+
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	show_ipi_stats(p, prec);
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 499e5f81b3fe..9066467e99e4 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -92,6 +92,11 @@ static const struct irq_domain_ops riscv_intc_domain_ops = {
 	.xlate	= irq_domain_xlate_onecell,
 };
 
+static struct fwnode_handle *riscv_intc_hwnode(void)
+{
+	return intc_domain->fwnode;
+}
+
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
@@ -126,6 +131,8 @@ static int __init riscv_intc_init(struct device_node *node,
 		return rc;
 	}
 
+	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
+
 	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_STARTING,
 			  "irqchip/riscv/intc:starting",
 			  riscv_intc_cpu_starting,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
