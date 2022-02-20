Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14A5C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Feb 2022 05:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zzst5zm1bgWyHywRPzq9t7b8IsgyNFeSsPWiO4AO/SU=; b=4wcMmGPNOp/pr/
	9JQLqixOd+4qUBn/alnd2KlGKuyVTzjM4nmF7fvSwDibI/2aboh4Z0NGqiJlAv+ecIpnETockihw5
	mjDTGk9jlGT1mPBWttNhbpFgz51MX+gqm4koAvuVBvEzOWdTjQW4I64LAluxYQa0pKsSV93qYxaSQ
	BSHo73ezTg9uj8G781dcHMLYUMet6AgYN/O0ppee2WUecRgYHjy0G0m6ptF72u03Z3FS9T2c/hR5Y
	tiAzSBpPUEDjV6OkhOuauN1G4sNaU5/C9oqMpSbmtepu9jSkp3y4go+IaDoBX6W/Fhe3r9F0D1xMG
	Wr5i3ZbRQmfypU4MnKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLeU4-000byX-BQ; Sun, 20 Feb 2022 05:10:08 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLeU1-000bxi-Ip
 for linux-riscv@lists.infradead.org; Sun, 20 Feb 2022 05:10:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so12254295pjm.2
 for <linux-riscv@lists.infradead.org>; Sat, 19 Feb 2022 21:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWgup5+s0NpBdPrI8o/lvYeDK7LCK1AyJL6/Cnvbp+I=;
 b=l1nnOk+uSVryT9WPWfV5mA4fmGwv/bvudzwwVf6f/zyOIwxGrONbb7hJ+jT+dGSKS8
 wn2ir1HXwyKaD+iGQCJ3d5a0BovwIWOk+rkG5MZZ+dO+bHE7Anh9fyXWPMI1OsJHOpxW
 jEiZaFm/8xiLQFaguByff7tgndBncn5I/otEb948t/rlQdDBjXj+swBdQqWvKzxIU19w
 rvG6RLnFYKTdnOSxcJ3eST/31JEuvZXebQVd+CebqMBd4HfO1jHjAzLCT3lzrw4eWiSQ
 V+H+R9sJwkttDISJ7FQ3oSx46TTGhawhDjduixox5cuasNlq2m1eD/S7kmeh6BUs08Za
 4JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWgup5+s0NpBdPrI8o/lvYeDK7LCK1AyJL6/Cnvbp+I=;
 b=ZpyURmV23ueLZ+mh8Mrwzv+YoP26xUZHXqsePDniTKZy0vcVTL+NnB/DMech3Lvr5Q
 8kKZbCYgEnjKMjLzzu1Q72tTPa/ORIKal9OJDb+V1z9oWdISLdhG2RyJ/2h9OYzHKdBE
 5vceRIcDjr7eqV6C5kXKiMTSvWxB/4B+BPPS0qSR7FdIOdQKIfPwXp7HlhsTN2UOKkbZ
 h1sUILyG2NyykmGxmKS8OYr/QdLT2ixdXjQ+aHr+leApi/QTUvWesAfX+MvP6E2rJLu3
 1YqT3zX7v8ZpjgvCB7xBN2AGy8SLKEatXV+GQsvQgUpvUTlAm3hzRKTBFMSCHOJFhVKA
 aiqw==
X-Gm-Message-State: AOAM531MDcAF5+4LgMTYCTUrD8IlenmmqxWIRPdmojNvFo3ZPrPYFMLm
 JfEt+P1vofyHnI5G3vxePqdifA==
X-Google-Smtp-Source: ABdhPJwz3KXYF+aZ05CTM/caMxMstp5Q8pihJPiS1ThnZ4dObwL/F15gnHlX/qVX8xpg/RIpeC2qHQ==
X-Received: by 2002:a17:90a:5302:b0:1b9:ba0a:27e5 with SMTP id
 x2-20020a17090a530200b001b9ba0a27e5mr19589604pjh.91.1645333803853; 
 Sat, 19 Feb 2022 21:10:03 -0800 (PST)
Received: from localhost.localdomain ([122.162.118.38])
 by smtp.gmail.com with ESMTPSA id 84sm7602730pfx.181.2022.02.19.21.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 21:10:03 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 2/6] irqchip/riscv-intc: Allow drivers to directly discover
 INTC hwnode
Date: Sun, 20 Feb 2022 10:38:50 +0530
Message-Id: <20220220050854.743420-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220220050854.743420-1-apatel@ventanamicro.com>
References: <20220220050854.743420-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_211005_649349_035A7825 
X-CRM114-Status: GOOD (  12.95  )
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
 arch/riscv/kernel/irq.c          | 19 +++++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c |  7 +++++++
 3 files changed, 30 insertions(+)

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
index 7207fa08d78f..ead92432df8c 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -7,9 +7,28 @@
 
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
+EXPORT_SYMBOL_GPL(riscv_set_intc_hwnode_fn);
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
index b65bd8878d4f..fa24ecd01d39 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -92,6 +92,11 @@ static const struct irq_domain_ops riscv_intc_domain_ops = {
 	.xlate	= irq_domain_xlate_onecell,
 };
 
+static struct fwnode_handle *riscv_intc_hwnode(void)
+{
+	return (intc_domain) ? intc_domain->fwnode : NULL;
+}
+
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
@@ -119,6 +124,8 @@ static int __init riscv_intc_init(struct device_node *node,
 		return -ENXIO;
 	}
 
+	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
+
 	rc = set_handle_irq(&riscv_intc_irq);
 	if (rc) {
 		pr_err("failed to set irq handler\n");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
