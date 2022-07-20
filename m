Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9539CCA480
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZN31uzHV/IIKZu1sHAZo8B19fqQhJfPEDxtjs6pcwM=; b=yiHb7yyg/EQFiJ
	wOND/Fad0LEyx50PcGGvdJWUUkYon87/8069/295SVrCVxx368AFGCSDrdazPIaeRbcBrngYBgNwH
	3zwXZ7XNXjBeBJCP/abtpEu641OS0XO3801u7pQni3REKYYjRhs1vQzGC/DPNQsO6UwGuMk8mblBp
	QdQSJv3cfZ3/kDveUNQGJciqmbv+Y/28XFse0x149Hv9kM7zx1bSQnS+hclq9BZjxZcft1Vws0OPV
	yc3yh29DekN5/36qyvi/j/R49jD9HopiwUGdo8Gfbwzv+qVG4lb5kGev5ZoxJ/+Z/qclkBLoixWWd
	pCVB4x3YD6g/BpegpKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBYx-007WMC-TK; Wed, 20 Jul 2022 15:24:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBYu-007WJX-Sq
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 15:24:34 +0000
Received: by mail-pl1-x62a.google.com with SMTP id r24so4135198plg.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cvifg+dUrg5blYQC2/27Ocl/6bFW1eBGFrtfNgNQvp0=;
        b=ez44H26Z6ZXJtrViq/7KPDdv00nd3MOz2imTcq2j027qHbmsHQY33sDneoEf6uhFkH
         kiKyLvHU07Org/O0t7+p4hwtmYSo5PCX6KPjCR+A3QOAeRN3b1nfU06O7YYT2CDUoC/m
         w/xstYLc7e8Mdnz3mXcnWTGkQwW7F5BhSPh4EjF7LExFk0aeFB0WAYbH12XL/idL8gDF
         jgRLnX6Ys5PH6l1986t20AokALQxGgpEY05CK3vcqdluLr/lpYLGzxDEiNQctK7FykdC
         daZWDziyXmRRfDA3iqtMa83ezWaInskwUazk0hgiED0iNOIinqquzbwHvQg2dwD8IGu0
         11Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cvifg+dUrg5blYQC2/27Ocl/6bFW1eBGFrtfNgNQvp0=;
        b=vnbS6kiTNI1FkRfo/B8b4LIiX+ssBrSoH1FG21XqOBt6mC5qjJyrxthBvt4ujeYahU
         guzszPOVMz0gXnl6HBxa2BRxDvjfnoJ5A11oiSKiBVwp7Qw6i8c3bzG0P0WEfaGMgUkH
         0Zq5NqoXcE29vTO8EmuiMx9/ieHSpeqOsZu8/Zp4FrEenQQHT6iKs9kPqAuUcvd6Xg/V
         Mfzoak3iQnBqD37/zY1R76CDIqNbHU/gKphVYuuCNYDMl1wj+Q85aZRf4pt3q11cUVYF
         ijYL7VIWmeCr8VEEy56GjtTmSvfevbnnlIzh6j6HS+APof0B31T/axKlrZAV9irLCFi8
         R2ZQ==
X-Gm-Message-State: AJIora+LZaKLPOpCcOi1XSLu0oUPqMCWmgUBYKruM0RutjvdtJvOuh/z
	OjV3GyKnFcF0lxqoINeFDuoTLA==
X-Google-Smtp-Source: AGRyM1vdCbVKkmWmhfw3ZH5I/KMoqKxgidTF5YXBZVSY6fymNTEIjWsdjjoEeA+yMZ0oQdkKctyK7Q==
X-Received: by 2002:a17:90b:390a:b0:1f0:6a1a:9654 with SMTP id ob10-20020a17090b390a00b001f06a1a9654mr6030490pjb.90.1658330670804;
        Wed, 20 Jul 2022 08:24:30 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.179.42.230])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709026f0f00b0016cf8f0bdd5sm6013031plk.108.2022.07.20.08.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:24:30 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 2/7] irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
Date: Wed, 20 Jul 2022 20:53:43 +0530
Message-Id: <20220720152348.2889109-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220720152348.2889109-1-apatel@ventanamicro.com>
References: <20220720152348.2889109-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_082432_953352_8FD38024 
X-CRM114-Status: GOOD (  11.95  )
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
index b65bd8878d4f..084793a57af8 100644
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
@@ -125,6 +130,8 @@ static int __init riscv_intc_init(struct device_node *node,
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
