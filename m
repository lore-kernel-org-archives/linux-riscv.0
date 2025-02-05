Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A07C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bYAIGjq/bJVX3/UULXI5NdxuQxLoTMLo50wUxnDDzc=; b=Z3LA8cQeB+h54b
	LRN/57rxXJHB9AdzcZO+dgP6ghWkDE9v+2Z+CQGi3Q4u9cUqX8oaJbYR/epv99pR3NXFOlU4dh6LS
	G2Gyh+tyscrq8SNt21kE/CTTMBUGHv/QGY/ecPF6vpDDmrc9ZT3bRng0ZnPbrx86DtjutLpDwQiXZ
	Vj61fmwcPWd48C6ufZ1wdl0pZ41JjENvt9lX+U8+pxDFhaPR78ZsS1ePLPAh/ljZaKGU4ZlwiU39X
	O1Km/3C/F5VnxNAeVgpQGMcCGbdwRzH3SWwPA2Z9JYgJAXsifB46b+sPrwGB1bLBFTvqr5CwRVOsj
	+y97NTFjPvJ9BVjZy56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhwa-00000003uYk-0s0I;
	Wed, 05 Feb 2025 16:08:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpJ-00000003svk-2lmO
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:34 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2166651f752so42720625ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 08:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771233; x=1739376033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MMc9mwT9NVQ5mz2h0GYOBXRUS44hVyd7ty+rMv4eE4=;
        b=ILo+grGQIs16tbSanD8v6mZwUHlllZhrcY6rySUQhlLj3NEJSezHps8pTuAeoK9+sL
         UIMNv+rHkXYW32pa+NVZTZMKFxYneMQyDKkHbO29nW+/4LW7QlHXKr/CGoIvNk+P77ly
         eERz6CbO/4pRXXWalRiw8CjEEpzXwWIXqFJkywdy16uzDf6bOzbEnzgvFRRK12QJSnAW
         YlxnOZQO4gQbqIQBZSQL+BhuT6+rGK/VcVcLxvbpHsEJ0Ke6aordW1+cya+o5+gspVnl
         ioAf2azMi+aRo6/9KgIeUbl7Qhm8beHCawR6UDhflwtWlNx+ul2xrb0J+DEr+O1bPE6Q
         H9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771233; x=1739376033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MMc9mwT9NVQ5mz2h0GYOBXRUS44hVyd7ty+rMv4eE4=;
        b=GS4DjwJh5UtfswGdhMGquebzGCQzCxRfp0lJr9UMxJJrTuv0ZsyS0FhOGFm3RtOfYd
         2wt3ldhtg6kusSRlpEYcx8NSqGOvtutyKANT+i1sR0L0gv2XPVeYgfF1i8RE0R9Q23D6
         BRrLbTShc5FPqLkgZUZOXOKnJEGM1Irqpa/T7TEkASj2tNDyl0Nd/OCHHXuYLPwKzv22
         lbSgqFebNjVF2oYnR4RLw4vAlmWiQrttMX4Hc1cCyjZZnPe9qBePDEre9+GTnvbDXUpv
         6IOnBr7HXpZ0TSpQyTJAckNsKU95rQr89p9w0tB3zarsIskFqs7Wmbut11Pc3we9jdOC
         C8gA==
X-Forwarded-Encrypted: i=1; AJvYcCW3n6+4pa7N9+LJoflb4u6+s+RkKC1JGJr4dmt97teRo+ZQVNfITlt2EHzkMKygzg5bzzJwONgGVmky/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzztSxu21KubbYEw82gDC+evmEOaw5AG8r+BduYpMPWTBow7fug
	pojdF+jJMsOZUqjYTcTcgovmJaPGP9LAYfDVeFZ8XA6cHXziKiu9G7JdTMBgYEY=
X-Gm-Gg: ASbGncuwWVgwK/eghkoiRBE3lwjLMvgKDF3H0jj1R6JH0ypzjjr+F7uBuaybIHYypue
	Sfrm30SjiYqPREOTF86QMhwPKs9YMSuZP7fTCgLF+UU4NnJ1d0pL9m76ma/pRkkr5BvGhhsv41O
	YuXx40zoFsCPXb4/xAld+FoT9wrbJzzx9K6YPA0FqhQDUZnKBEE0L/zQ/bYJvIOmHGrHnFlIEIk
	Z93L/1UaX1Td8eQVtcLQg6tqcf/rPxbBdnV8RL0jZkRKJto23PQMK1YQ+KtwgQEdS+JLerxeMDe
	v5rIEmBicoj6UQr/LG5/x2y5OW8fXPEWEVMZx3Gpf1/39hycNT24kBQ=
X-Google-Smtp-Source: AGHT+IFVUygBqhzTxplgfR5D4ALHtsI55bhay/IfP7Si4rFXdhEgGg1YfTQqUROzXYR+kUtbmKwJEQ==
X-Received: by 2002:a17:903:8c7:b0:21f:16b2:9339 with SMTP id d9443c01a7336-21f17e2a39amr53896345ad.27.1738771233066;
        Wed, 05 Feb 2025 08:00:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:32 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 05/11] genirq: Introduce irq_can_move_in_process_context()
Date: Wed,  5 Feb 2025 21:29:41 +0530
Message-ID: <20250205155948.81385-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080033_709885_B8A40F98 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The interrupt controller drivers which use GENERIC_PENDING_IRQ
can move interrupts in process context for downstrean devices
which support atomic MSI configuration.

Introduce irq_can_move_in_process_context() which allows interrupt
controller drivers to test whether a particular interrupt can be
moved process context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    |  2 ++
 kernel/irq/migration.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 1884fa4ec9b5..5b67a47da144 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -617,6 +617,7 @@ extern int irq_affinity_online_cpu(unsigned int cpu);
 #endif
 
 #if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+bool irq_can_move_in_process_context(struct irq_data *data);
 void __irq_move_irq(struct irq_data *data);
 static inline void irq_move_irq(struct irq_data *data)
 {
@@ -626,6 +627,7 @@ static inline void irq_move_irq(struct irq_data *data)
 void irq_move_masked_irq(struct irq_data *data);
 void irq_force_complete_move(struct irq_desc *desc);
 #else
+static inline bool irq_can_move_in_process_context(struct irq_data *data) { return true; }
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
 static inline void irq_force_complete_move(struct irq_desc *desc) { }
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index 2920024475a3..428e42d3bc91 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -126,3 +126,14 @@ void __irq_move_irq(struct irq_data *idata)
 	if (!masked)
 		idata->chip->irq_unmask(idata);
 }
+
+bool irq_can_move_in_process_context(struct irq_data *data)
+{
+	/*
+	 * Get top level irq_data when CONFIG_IRQ_DOMAIN_HIERARCHY is enabled,
+	 * and it should be optimized away when CONFIG_IRQ_DOMAIN_HIERARCHY is
+	 * disabled. So we avoid an "#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY" here.
+	 */
+	data = irq_desc_get_irq_data(irq_data_to_desc(data));
+	return irq_can_move_pcntxt(data);
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
