Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACECC4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 06:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq9CQLlmXI+4l0G46np5Y/5P7WXp7fHZdJOL9qJxjtU=; b=l1ap3hc9MEWITQ
	v2tzgAmCwZ8NUDEFyh7smWwvvKoQKeK3DMuf2VumCrebxmBpdy1vay7Pzo6ENMTofMU58orDxh40f
	Ok24uZzuznT3YKfN5h6K39J5gGRsAGN0i/iX/+yXPGUpx5rNPjQPNDtINm9bGeNaD/i9gE2K8Nr8S
	WnM3TCMX44cutUXrgmv+PyHyMpo8V/acJcK6L7DdLi6RCfFp2clEoqGF3IHAqPjFv9pcZJKvN8Ns9
	tQuuiYQfMUN65zr86tzAYuwI34bNYgPDIMUihXC5zxECQ3ge+TfsZEivVp86UcIv8aRd8+7T42IuR
	eWT7v8ctLYhg/pNe9pgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1MIj-002djz-Or; Sat, 03 Dec 2022 06:47:05 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1MIf-002dhQ-Cd
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 06:47:02 +0000
Received: by mail-pg1-x531.google.com with SMTP id r18so6114191pgr.12
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 22:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBh16wlKK1pVBXMjv15TuW7j92X6+xaNPp74Ke5cwzg=;
        b=fSswA9uOyLO7+iG41F51EDzOcAdHwKmbN8WPzhf2TrDubxetJOnIE+FMiTQEKcXStr
         HZo1MOAVw6HcbafX4D0m6W2qCQ4csLwgX+6HDz5w23bWScbN8wJFv3UBIxQRcm3W8lX6
         1r+TEW4k9YZvQqiMYGSWO9kG3RsaPNh1gdb6Fiyy7UaHV+oIxAUuqQrNRG8d0GfNK1kw
         z5n88aC2Z3ODHPG+H26yyvpmkLMUIsmvp1oBjVx6a1YELv7HhsQYKPuaE0TtRmA+wXmp
         T6+jH6CanK8ZI95tJr9UHgGLGMqoOZYSShc9xUpFlbLtP/Hse7sX4hcJRXsJ/L6sDgfs
         F9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBh16wlKK1pVBXMjv15TuW7j92X6+xaNPp74Ke5cwzg=;
        b=kYFPNqh10ImaZN7+4mS8W07BaknNsNOlJDPW2pfIecHYB45y4+T5+t8xconYch3RBc
         bT9/Ng48/AzMpA88vegjeDMhU02YYPw7Vh3rUwn2SrZWb4QVLDkEEo3K4tu7q4sDpLqv
         SRuwmrBT6JQRbeF6XaQH7a59aMVHmtVRDOVMTFuY9QyYQFR9t1qJJYFyKpOu1J45exon
         iv+rZBBk7u03mG/81Y0dJHWhqvBvM9A2CeGA0NR4dlbcvl0drzlX1WXrIFvTh7/ndC5N
         Rjz2QCDRaGDWM+iP04pTWe1Di2xKsJAQi0W/gtsqP4ijSEu/OTzVPjg8CNyA8Jl2KTc6
         4Vxw==
X-Gm-Message-State: ANoB5pk1VTP+aS+vcwvIHp/lF1B5uJrTErEEDNjg/WKitKzogTbZ4UEx
	5Kd7AxMwdYfgO6yb0XqcwKYI10R0vtRqW0U0
X-Google-Smtp-Source: AA0mqf4JuUfa/FN+nkHGhjXoRMdXKAWQy9yE+w+cmRXO4BIESMhSjeV2N94BNt9zeUWexy+t2AQGAg==
X-Received: by 2002:a05:6a00:1c8f:b0:574:6880:e76f with SMTP id y15-20020a056a001c8f00b005746880e76fmr47038664pfw.35.1670050016056;
        Fri, 02 Dec 2022 22:46:56 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id t17-20020aa79471000000b00575c8242849sm6102091pfq.69.2022.12.02.22.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 22:46:55 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v15 2/9] irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
Date: Sat,  3 Dec 2022 12:16:22 +0530
Message-Id: <20221203064629.1601299-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221203064629.1601299-1-apatel@ventanamicro.com>
References: <20221203064629.1601299-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_224701_445076_6B50BA14 
X-CRM114-Status: GOOD (  11.33  )
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
