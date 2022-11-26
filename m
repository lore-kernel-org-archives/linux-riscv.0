Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994ECC4321E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq9CQLlmXI+4l0G46np5Y/5P7WXp7fHZdJOL9qJxjtU=; b=TEMniNy3qYKSI+
	zdHUp1Pl2dd2oQl2hGBYGdDZ+SfhcV2LL9kwMRLryjq0yssChuD4xCMoNGpSeiixGn5ezG2MeTKY+
	SXD2C+LhKmNtjW9S8Ugv83pQqwoJexTykQif8ac3m0Q7fRN7Fzo46kttOGpviHN5Qqg/5C5p5hjFC
	qCG5YtBqAGUZJKtDqJUgQRpfna6/qONVeZsccjYuvD1CBTX3ZXlZYx3Q+TTIebsce/RA82+5HQhbL
	4nA7i0/XtlJrDHgmlMYhsgT4F9r+9i+AzUTWuD2/QSHJa+HuWgYCPvDh2qz0hRcxs6ANYV8irC8Px
	PzBkkCuEUMr+aUL37FRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyz5B-007UWs-Lg; Sat, 26 Nov 2022 17:35:17 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyz59-007UTs-1L
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 17:35:16 +0000
Received: by mail-pg1-x52d.google.com with SMTP id q1so6354680pgl.11
        for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 09:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBh16wlKK1pVBXMjv15TuW7j92X6+xaNPp74Ke5cwzg=;
        b=D/fckmj/2HsJ6RwqvqrrS+iAUPA2iOvmjl0xgaGtORm2pcrb/bAV35TOaw6mj8VjoB
         cKlNZCIF+we3E5IQexqFggPb+AWjBrsWwVno+xbuZQxBwP9iDNaj3ZIBbEkO9G0Lk7n4
         qPusvzKsrBDk8KRnqWWnrbsRYooi71CYKD3c5npqbtdSKobUGLrvYuKXSgfILPbQ27EL
         sOQRDFiotAlo+IuJHz/oiELDA9OKllbGe16VenwAEMXbaJKNHepn48C0iMExvJyKekag
         wQQYPj1eiNF2e6ZzLohvFojSP6YWfD0GMqd69jvqV2tNFyNtRcKuGc26eBTCqN59SXLO
         ZtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBh16wlKK1pVBXMjv15TuW7j92X6+xaNPp74Ke5cwzg=;
        b=tm3aXOOt0lGYyH1oS2M2eAJdf5jhJjhsk2jqG2UTi9f0gV6BxwJjbLrHFvcW0LIhMl
         nX2B83t6pv0FCr5Yxa0JvztP4PFfPk0MDa5V0Vhsvb+GwdU96zWKHPyp4WLpEZDCTeo2
         NYbcsdUe2qRuDiYwzfUIlboufROvPqds4KUsZ3gJN/66aVl+0OHyay+x/UbLN/S5bRHq
         qkVz1mnphxtV1S3mT5emG2CcCVUYU/BYxOA153MAav7h2IrlWXcYZiLsAT04PEibHgj2
         +iT47cb5Gl/WDoAfgvQFDNjTAer6KUTbmKVGi3pYCSZcrppc+y+JTCKL4D2j60ZMn4a5
         SX3g==
X-Gm-Message-State: ANoB5plm5rYXgw2O8wrGNcTHTws6H3s6AfIagUwdteoqT42peZmrnzap
	c889whvY8ae1PkXjxm9l2wTtjg==
X-Google-Smtp-Source: AA0mqf4yVVWdO8ttRQbkozXcNyjSakA4WMwKTsjMs6F+YZ18Uvt7tJ9kKmOyWz3POzhCARB6kF4P8w==
X-Received: by 2002:a05:6a00:1892:b0:572:b324:bbe9 with SMTP id x18-20020a056a00189200b00572b324bbe9mr24889505pfh.57.1669484113810;
        Sat, 26 Nov 2022 09:35:13 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b0017f7c4e260fsm5639813pls.150.2022.11.26.09.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 09:35:13 -0800 (PST)
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
Subject: [PATCH v12 2/7] irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
Date: Sat, 26 Nov 2022 23:04:48 +0530
Message-Id: <20221126173453.306088-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126173453.306088-1-apatel@ventanamicro.com>
References: <20221126173453.306088-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_093515_101848_50E0AACF 
X-CRM114-Status: GOOD (  11.16  )
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
