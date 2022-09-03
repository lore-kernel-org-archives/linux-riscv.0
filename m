Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E106BC38145
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09+RJOLysAgNDAjSFrjTZQjxHfLUiiel7jxXdN2lU5I=; b=Qg/1O8mKHlIfOL
	lY1lt7lYoYWC8SaDHUQlO2wb+WYP7dc44HisRvOMePA1ukNaVqOlwnPst5uMWmOPJWRv/KjEwYAoP
	Nh8wHLnevmbZZsUzcjVXDhyDX2oKlOSqNptqt00UgKIGQt7C/2a11NT99/zn6/zcGTBicJdQVehoV
	tBnyEdiv9UhqhzXX2bUKy2K1bBsRrHwufxZ9XkA4rIiJJqeW6Oj+G7VRmIKpyQs6+aXJi0U5A3mwb
	D2d/CwaQWdPSFbu6yWluH9Ul0R3V/rp8dxcL0X5t1A40hBtjqh71zvSRwdeEUogi4yyxJ4Ebcd3Ea
	Ia+Ce+QWl976wJtp5j8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVm6-00DP4s-Ts; Sat, 03 Sep 2022 16:13:38 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVm4-00DP1E-54
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 16:13:37 +0000
Received: by mail-pj1-x1031.google.com with SMTP id l5so4639242pjy.5
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 09:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7gL51KGK8h2gYdKsAsi/esrqwK4Ga0hyaEGMAaUXEgw=;
        b=BEOI9F3wsSw246ziNkDpwao42FUp+S3CnxRzu9XoN2nYZeSWgn6MZsTQFAf408gsSi
         OLgBWXxMbhHfA2R593+yr1oMYoOm6mMYr8FFYclLc0QCesF37UANs1I3ZiAnw8DkRkm0
         MVs39Sp6bLB+Ny/kqkAE4q5YVHsIz3/7zWaSfmrPGa9et1+1BJrb7H8mUhf5rsbez8Bn
         4H53yuqQooWI7/LdzAxjvSq2AFuZGGfZTJusbltcSxPjdJJcMoGivQXYP+RJ6p1X8G/v
         eV3B1rsFgOam3InpBciC1Z1j+eRlb2wR1ajb5PWTXZUQaYxdUwFmYgZyQDavLsFVEo13
         LG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7gL51KGK8h2gYdKsAsi/esrqwK4Ga0hyaEGMAaUXEgw=;
        b=5ZRDsLzaDuyzZZvP0n2ykvB1TbBD/mCGlvFpxxBtaK9MoUQGiAH7O+QXVSs78il0RX
         k2X6XXNNhAFE92gLNlVKdGW0pt7sFu4tLwPdAwa82gfWhfl/DuMKZIhByRNqfKpiKwfR
         4nnIkq/Vq77eWksocLLsvaxA/sqwFrPSCnHh9o4/jWB157DYP0cSYHZOIP9poT7Mmfvc
         y4Udpfe0t72kNxv1R4htKRWB24SYbsog5XNC2uCYT5vkpC5prch+ZGIsXLqiTXEuKtOF
         Rvf6kXhquQTRodVqSoSG3ie0jQVMyv8CvYPNB3N3WYJ5YO9AyxWO7uuHqYUFHxf1FVlv
         2XWQ==
X-Gm-Message-State: ACgBeo1obl3vHUvWIUOKtKNT8y6eiVTnmXjvY6s6jpNBkyPv+XBo1dXN
	nKy3qdjyC++3eNx7MA8jHNvo0A==
X-Google-Smtp-Source: AA6agR7L07fPfgPFO6Obodu0eVF85DdaY2L6iPr7A2YFmEFA5ALImhs4DB8P9AyYhg5tWuzDUeB/3w==
X-Received: by 2002:a17:90b:1812:b0:1fd:d509:93e5 with SMTP id lw18-20020a17090b181200b001fdd50993e5mr10910560pjb.25.1662221613905;
        Sat, 03 Sep 2022 09:13:33 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.86.115])
        by smtp.gmail.com with ESMTPSA id 4-20020a620504000000b00537b1aa9191sm4166738pff.178.2022.09.03.09.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 09:13:33 -0700 (PDT)
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
Subject: [PATCH v9 2/7] irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
Date: Sat,  3 Sep 2022 21:43:04 +0530
Message-Id: <20220903161309.32848-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220903161309.32848-1-apatel@ventanamicro.com>
References: <20220903161309.32848-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_091336_223383_7F6DEE76 
X-CRM114-Status: GOOD (  11.82  )
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
