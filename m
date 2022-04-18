Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA35C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 10:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Th/JiiZKdMvqqbuaNsRiME486BusReib+ZBvZUjx3g=; b=yWT7bf35uDByZZ
	PBVmrPtCTCP6ThE369t/qlRKNd7nnbtX6iA9JZceNLPVWTo6yj7xOjrYRC8YirnCpXJeOXOzU4rmK
	zN3mRpd5RsXzyiWiN279VTH8EnzaxYS1QeKP5Pa+SYmB35rsClvR5cPAp0WzeYN0/Xi/iz36g2c48
	9Fp70ZhNXbEXYU7qEY4u0nVdllScTLkZwYwxYFJUJ+o6h8Xh4R/3AW52D2MMBgetwl2013yXGsGrV
	hXHI0mOLPayT9LbSuFSBKSaBXKy9NomPXHSTulgF4wdluDwfBBI4cLGpda1c5otJ71yhyLnVIS8vB
	FK7VaLlyW3ZoWRCw//HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngP14-00GNQs-Qx; Mon, 18 Apr 2022 10:53:58 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngP11-00GNPS-O7
 for linux-riscv@lists.infradead.org; Mon, 18 Apr 2022 10:53:57 +0000
Received: by mail-pg1-x529.google.com with SMTP id k14so18260563pga.0
 for <linux-riscv@lists.infradead.org>; Mon, 18 Apr 2022 03:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPOgTx9pa9Jl4kAK/bdibs/Vyw7ywaqt4uScFzAp1mk=;
 b=XdbYHNbKszoQHDpOsRevhS9azun0X0ln0c3yD3qvnSvlgl9hVQvV4CK+KicTkLkS68
 q9WQGtLEAtDlWwdUc55/h1pMGqCgBWn7L8/cHVtanzWm5Y06K1MhzHMqH1hkwKRe33qv
 /2yhTYdSz4f9yjpFRDpP2TYyLKWulNxBwHuePirXOiQdMF0QN/ggKtR9nzAmsIxaDbyd
 tjf1XTGJ3ff5NGBoex79YYK5Asi1w43ICmwMbfYUXmghgaRYAenrylFchNjlseDtsN3Y
 NoKeX1RonA238IIC3fCyZGkaiFBH6bJfp3o4ZAgW7/xH/5PrPjvdI0PZMQuHh1E0xwwl
 OSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPOgTx9pa9Jl4kAK/bdibs/Vyw7ywaqt4uScFzAp1mk=;
 b=eQJTqcFhuwpAXzMyzbgVxuyAjn0q3PGpbMwEQWXqtIE4fPBOF212ZfnZVfC57LBh93
 JHHORQCRl/GXyPgR0kfFeSj9qfToYhARKmmoq06++C5etuKRur+2RIyLBY+QGyuXu9mx
 wuRj0GTPj7sVEPBrub3slKHDdNAcBF+R1CA4s2ozouOdzt6BHYcyewU9W0ykJUIdKE1z
 WfoV+Qo29FPbQPwQRtE/uUA+i7BKJ4M+1ggogQMGPiCh1e3JG4C0dRJFgUzv8/TEebVp
 qn/Ow6s2ZePkXqiYIbANYlYGirHthlQOP2egGpSPj8OJmnf33SagtL6sKTMzh/BwqCxw
 CR+Q==
X-Gm-Message-State: AOAM532natWL2lvok1DmdRWR2OFZ6HwQ0DwVg2AL7kiGNaz/aArz305T
 4UWWnQ7n+h0v8AY6rcWtwI/ulLuokckRTw==
X-Google-Smtp-Source: ABdhPJwTsCSdB4EfMf4LGMF3YogsrK+jMFNEXT4Zp1iXaRS9ZGqtlUUpSl4jtHmmIOreJRB8BQlnTA==
X-Received: by 2002:a05:6a00:891:b0:4fe:1262:9b4e with SMTP id
 q17-20020a056a00089100b004fe12629b4emr11499956pfj.21.1650279232849; 
 Mon, 18 Apr 2022 03:53:52 -0700 (PDT)
Received: from localhost.localdomain ([122.172.241.223])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm12986278pfu.202.2022.04.18.03.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 03:53:52 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 2/7] irqchip/riscv-intc: Allow drivers to directly discover
 INTC hwnode
Date: Mon, 18 Apr 2022 16:23:00 +0530
Message-Id: <20220418105305.1196665-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418105305.1196665-1-apatel@ventanamicro.com>
References: <20220418105305.1196665-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_035355_822615_B447F8D4 
X-CRM114-Status: GOOD (  12.36  )
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
