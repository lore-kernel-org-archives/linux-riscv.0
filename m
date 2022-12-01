Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611FFC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 13:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq9CQLlmXI+4l0G46np5Y/5P7WXp7fHZdJOL9qJxjtU=; b=af4rN/BZt7N2+i
	pj/cwU+NyrTXmaSvnCTvJZknHoH7y+CVh2Eb0n1/LtTo1Z9SqnASCJHKA2jydUWJ+d26rQt90owEY
	LgbEweqWT2krhp0irBw8A3YVb38Jaemd5lj8pBCKkzhMQhrlrZNIy5nc7SlD3WJO1B8XS7tQdAn6o
	ykiu1c6Oq5eB023YpE7GgFdkRjM5VtKal11xDoeLBs+4FDT/MIio9WTENdY4Fs3MARTjLeq4CyJCX
	SUltwtcsGGkQKRc8sv4h7Etoep+6J+ifUt7mwmRwo2Xj21w2LmVtlvZTlh5FT/pAeCAhVuobxu/CD
	xAWjx0ARiptyQsHUFccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jHo-007aEC-3T; Thu, 01 Dec 2022 13:07:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jCP-007SfH-J1
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 13:01:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id jn7so1551329plb.13
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 05:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBh16wlKK1pVBXMjv15TuW7j92X6+xaNPp74Ke5cwzg=;
        b=LK0BmkanOqFOZq1Co8XQye3afavPw4jKL+JQozoXHh/ziPTUOdRmLru+J5d5ffrcuT
         wltWSYEDVdM0loHvjrXqktcUYCoGB566FANnIiHhdbX1kjVJ/bHCUUl9HuyKWzxFOOY6
         Us/FvUSWsP/LBCrziBYyz/BBMha05zyadpOzWbzILKIDcop66dGJNvxdraxo1dYXBLfd
         tjcd6F7FYD4j+hDsdTXBtmXAdtJ28FHIftOqmZuC/Fwd7sS3mMPsGtPkK4ykFhlc2IeB
         b9HYDxtWX4eixqBZex6NvVhUM7XOVHbTuk5E4jwVmetUGHYcUupBXjoMtqvMNu1PXyb4
         gN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBh16wlKK1pVBXMjv15TuW7j92X6+xaNPp74Ke5cwzg=;
        b=d12Qefisk3jlMKRojXeUYmvyZ8Qco/i7+dfBG7OnXX42dCjGRZk1KXa/qHv0pNt5dm
         lIho1s9Bx3Yo+3aWo8Gdc1fbN3ewoC35DyVr7QqmK/HLU18vUjLkMX+BOVVxlSad1dkk
         3PwFNyCzfax5CF4AALjiwCWUUZbIYUbkREV4qKc3S7rrF+P9GwxzpL68aMRPAUyi1l25
         lHk4f1J/N5hjiHT2XTT2z+5J9AUVIjec0RUksPYBkHyrJCFMsJjM+Lv4gPymxhMa2nQ7
         DLdH4NKv1TYhEFIHBnjfVIozxrfhfdgOUA6Hxh5dYEzN+VOIS5/z8Icy8jT68uhy6hCv
         lL/Q==
X-Gm-Message-State: ANoB5pli4GzKOYDxyDKujC7rCLVFLpeTRmdFXD+EidpsY9OujEfiSc5x
	MU+akjABmk1ol0XBJ6ShMeRShTw2UH0nMQ==
X-Google-Smtp-Source: AA0mqf7wBks9PFeUDq8NnVKjelVTwSI3GQ4kEdyKi0/xJpNbcfm+5Le3/nUL+eAyppM87Rct1i5FWw==
X-Received: by 2002:a17:902:d58d:b0:187:2502:888f with SMTP id k13-20020a170902d58d00b001872502888fmr52757656plh.136.1669899714535;
        Thu, 01 Dec 2022 05:01:54 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.81.69])
        by smtp.gmail.com with ESMTPSA id l4-20020a17090a384400b00212c27abcaesm4855856pjf.17.2022.12.01.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:01:54 -0800 (PST)
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
Subject: [PATCH v14 2/8] irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
Date: Thu,  1 Dec 2022 18:31:29 +0530
Message-Id: <20221201130135.1115380-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201130135.1115380-1-apatel@ventanamicro.com>
References: <20221201130135.1115380-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_050157_651894_CAAA742D 
X-CRM114-Status: GOOD (  11.23  )
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
