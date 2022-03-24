Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055B7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Th/JiiZKdMvqqbuaNsRiME486BusReib+ZBvZUjx3g=; b=rtIp1yzJkOwR0u
	PnG+d6MC5MfYYMCAv60h1Gc6OTGJD6vjwai+QWXVwoo+i4hIdun4itMuhFnuXLBC6KO54W2DLhwwd
	ycIzo0u/1EHBgpwyBxgvNBqWT9/uY+ZSMLm+xXO2E7P4ansuzfyDGEWm7yNb6RTuKhT9CxIJw0iyz
	wPb2o6MRP9TLrS50pC3ecNTSjR67TvVxme2JPTRKZzREAmduEfXs191KxdWHWaYpFMtjL97P9uGB9
	c1Ya7qZT0X+KLaatal0cbkSx2VtDUML2mhr/+nwv/lxwVdjTiD2Z9Fk0oM+CUwVe3VQ68KA8K2xnf
	gmqkVEwIO42m6Y4EdYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXPAG-00H0Kg-7A; Thu, 24 Mar 2022 15:14:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXPAD-00H0Iy-0c
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 15:14:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id q11so4983585pln.11
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 08:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPOgTx9pa9Jl4kAK/bdibs/Vyw7ywaqt4uScFzAp1mk=;
 b=STp/XXRRkFIU5c4zI/KDr+9ry7nbMtmsBoEr7TqfTzSb7/6qlURH0G3TIbHm6LuR0Y
 ve7A0+VJVoeAwkoWIlGScWevPBFngLsSTEGqrq3MsyVR6kd96TAGsJwc0MMRAWkuwC+5
 35JkXCCy7oQ9n+ffV8HZRALHoXrH3PT8k02JRfTonyskqvlgGlW9agotogBNZGHgqynN
 So53QAn8owicai+NLNa9qKhP+mXWjkzv5rxODZ2BH9+VLHlCh6IT+cijtxq7AU3q//J/
 rkv2QMU8vCEy7WtDYmeNLtjZVRuJmdj3AnkbENd4kNDCfAWYdn0MPfW6ctLmoa1l5aov
 eD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPOgTx9pa9Jl4kAK/bdibs/Vyw7ywaqt4uScFzAp1mk=;
 b=m/krADRh8bOq5VOx4abe2NVHoBJLaP2qgd3nm66j+otAxUxW5zizNCehdaJxHC35hi
 gJYEMj2VMqnchx8OV1/RvsKzabopdUbZAiuSaYrsTrMoRtRDpJdhoBx44/dWIwJyybS9
 ZGFjNOCPTYkSl1e3hJU8yqAi2YLQ5UQV9tfRtgqUCsrg9joHQ4xJtvizRu+QEsvKFAtQ
 tJG0BxVjz8tbrDOZPyyWIkwXFshp6xexk5EO6SIJQdD91T/tgnm2qMrp0HQwoQC+u9rZ
 6HwBzdAr71CLFM10QztGO46Ru67mWUafiFwOYBOAC0WBfxrEsn5j09MSptuhAy9juFRb
 HGCQ==
X-Gm-Message-State: AOAM530xh9f7bQj9pYQhJ++FhnQFk2AvqfJ+NyId5fU7/wQ2FytUnwCj
 6deyDQJARXeWX6l0ixrsvr1xEw==
X-Google-Smtp-Source: ABdhPJy8ctIQlABQdLdWr2DWrmR2gd+lzfl2Z/8l0Zj7rif1pb5ai1PtZV0/klXbzkuxZy1XKmlv4Q==
X-Received: by 2002:a17:902:f785:b0:14d:d2b6:b7c with SMTP id
 q5-20020a170902f78500b0014dd2b60b7cmr6298525pln.68.1648134852130; 
 Thu, 24 Mar 2022 08:14:12 -0700 (PDT)
Received: from localhost.localdomain ([122.171.187.87])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm4166065pfc.41.2022.03.24.08.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 08:14:11 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 2/7] irqchip/riscv-intc: Allow drivers to directly discover
 INTC hwnode
Date: Thu, 24 Mar 2022 20:42:53 +0530
Message-Id: <20220324151258.943896-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324151258.943896-1-apatel@ventanamicro.com>
References: <20220324151258.943896-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_081413_093729_A6B174A8 
X-CRM114-Status: GOOD (  12.12  )
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
