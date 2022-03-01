Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF49C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 04:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Th/JiiZKdMvqqbuaNsRiME486BusReib+ZBvZUjx3g=; b=XZq1hNtchAuMbS
	+OIpTfjgLrsfcH7v8v5+5BMGDbJSMbpI6SC+gB49JGciBe2hDs+ON1eNK7tngPSz5fp6fP4x8axMs
	AWDbIvBlIb22GGToe5h0jHhRG/wavt1YDcxQn/vElNVrLvR7SjP0pOnRnfndxRPIMLC86nOpmC1N7
	rpLR36/I/oKvVXuADyQj9SxeO4oVKcuzC4ohq9XPeHUhjxmmEYpodmebuL3Mb0Hdk4UObk2Z/4Mg7
	EfIHBWlbbZeqEEPsR6LBZdoburlD7O2x64waqOX4//qd25lyCqHEuGu7BDYSd+BkhbAHa+cMvjM3C
	cUDl3479ggF/OSxm9GdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOu7e-00Et4E-NN; Tue, 01 Mar 2022 04:28:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOu7b-00Et2w-B8
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 04:28:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id i8so1394564wrr.8
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 20:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPOgTx9pa9Jl4kAK/bdibs/Vyw7ywaqt4uScFzAp1mk=;
 b=gICFhfXwhzyyNd8ShrN+bR6Dsqj0G3mNRAF7sZYOqYvRpt1pKzUu2i3kkHbs8EpcOi
 302J3CGLqIXfo7y6Y0X3w3TDZo3G47e3xUwdCJ4Uwt7rRpvF0Lbv3xgaBnXQ4W052WYr
 8RmP6cqbsgFKqr4uex3kaWuS8vR2aIqIvRdwviUu5OvbI8opqcdmxciqmdPZZY35vj3M
 9oqB927UAnmrmmNk96cvwrV0UXS9aBFOMU5Ksx8Ah1QkbzxIkAxbST7HfdwFvYJkTDDq
 KBg2TLDvzAy+mJ7covd9cwKzIFBu6LISZtDrRqWHrfMs1R+IRcwdvWa/TW2xu1ZVccwY
 T9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPOgTx9pa9Jl4kAK/bdibs/Vyw7ywaqt4uScFzAp1mk=;
 b=eFi1PnoYYcs0M+nYHCOt9T0GdsRgPkwFJGQuqniMpWBXFo31/cAyBxmrKMPKRXdgnT
 ffEES8XzyiFTPrRXRKZ7EGlaC7WfLxCgivQCy3Opbuh0m0ynUTLSw8c/FYU51ZUejF9P
 lS3bCabBnj2Ytb55HyoJxZaQx2bfnEFPdWcaCmIlYQbD/XRGcSJBdtRBw6ekGUc0InPP
 Ch4pCnchp3MEnHdV35wSH0zB4GemhnQ+gkBJ5WOU2J16J5Ck8l/YZTZ4dTtK5PfVMyTD
 KG1rZny+lG3tBTwiBRsZNzEswDPI9SCC6T9vOulchLuvuBLfdQtd+UL6p3XdadGNOx1S
 BlnQ==
X-Gm-Message-State: AOAM531VLro4H4Z8qroQL9Fd9hoFzewYeQNAGM5UWqTx650Z51UucEgA
 LYnlxZ8NKgLeu6yoKmXjn0H3qA==
X-Google-Smtp-Source: ABdhPJwikeYsvr36/wo02SUnizlvf5YsP2mjv2VqHzKmNLWhmjMbi7FTYI122m8IP+Ghb1FvKXyNPw==
X-Received: by 2002:a05:6000:1cb:b0:1ed:c295:3e3b with SMTP id
 t11-20020a05600001cb00b001edc2953e3bmr18605303wrx.111.1646108901887; 
 Mon, 28 Feb 2022 20:28:21 -0800 (PST)
Received: from localhost.localdomain ([122.179.35.69])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm1209107wmz.43.2022.02.28.20.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 20:28:21 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 2/6] irqchip/riscv-intc: Allow drivers to directly discover
 INTC hwnode
Date: Tue,  1 Mar 2022 09:57:18 +0530
Message-Id: <20220301042722.401113-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301042722.401113-1-apatel@ventanamicro.com>
References: <20220301042722.401113-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_202823_412078_3A3B7051 
X-CRM114-Status: GOOD (  12.39  )
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
