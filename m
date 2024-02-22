Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40B7C48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDL6XbivE/38lAk8m6YfrCbGnnHhM90uQeaSVF9eBhI=; b=GGC3QJOVr0Toix
	o4brZKMVF8XmE2wWNuzBsJFz3XWJbQKtPb6J1M++rI69GvBMWAa4I0YZWPA+nNi+hnFsa/m5sN9qw
	6pEHrb+H1X8gXYh6U+jqDxmPW5/Hlm4VG+LNOzw+M6j/nFpZyhLDjdmvrFXQMIjPw0jeqLDQiBnQt
	wAglJU4jJUcVodKl9cVKMpU8LqyqAOpNK0k1mpuPNEFPqHHVSzgBaHRmTJj2DR25YK1ahFLPIgZHD
	+ylZ/4Q4E7HeqhP1u/ZcnS3rOUJxCI5XmErfnSySj80YTHtjid9mPTpLEByAYYxibXGqEjMPNVjaS
	W10NZKy0RwcO0FKc+xWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ap-00000004J71-13c6;
	Thu, 22 Feb 2024 09:42:15 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5Zq-00000004IJb-2ceV
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:41:16 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3c049ccb623so5087001b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594873; x=1709199673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFOwokt/Qs+I70jfKIbSgbLogS64uTxBCY4KGhVh6mo=;
        b=ArcypjQ+wa4Ai2PACOe/KLochhsT2x/S3JOYDsueVLGLeCJynie3Pl81Sdi01y3cX8
         9wjTwIvPXGXK/jErl1HOO8vYNCTfEtfIl7dlB2nz6daWcf1z24CYOHOsH6FzPPvr090u
         EBcWn8/O6NoAa1odZo7/XjxQuRf2gbLxvZf/NjGPwl+v2O1z5GRsOTkiYBpXkzaUO3H4
         ZjmqurFgyu5+OJ8TmvU/D/eE8oE4uE4eNijFXZYeUQLZwsXtyXeUIeJmjjNyWImh3Y1+
         4QQcpY/RbmjROM8YCwQ7hsqhjB9v0vPRgY26g0S/l7Yhgr1FK8w8+9YtUlaOvXX97/x6
         XkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594873; x=1709199673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFOwokt/Qs+I70jfKIbSgbLogS64uTxBCY4KGhVh6mo=;
        b=fm5G2oiiFf+FTPC8e7LBZ6jzuCm6WBk2uPRWMg5/Cc+c1lnLz2864eMsdmvnh3WhH3
         yXbsxNFZh0pU5WvLCBETDevmIcXOwwuAWf35cUPOsRBd6DbQ3X28shJwUCIGoZfAYKlB
         2XmzntePAPHnoEXq//lDLXzTS6OzoXpnTKF4+1aeKYXABDIKXt0GgBRn4i5Efc9pAFkg
         XaUJYVs1AmJ00KT6n2O/Oo36HgGf0/6pSd61T6AsqfJ1wZbun5CVROKnR+33MJybM93V
         jU+On9cnTc1c6toFCL1LY3DV8L0d/MRXrwYuwJIVJcjZfIHY2tBVM4TG9c4k6W7IQlkC
         6iQw==
X-Forwarded-Encrypted: i=1; AJvYcCXWkFWXObrIRQxcWo3uQyG8U3Hc4PJQhT7PFev+dpH5S6I0Gb/sPL2my9Biz4SomZA1AYen24NhvYz26ZbvNAao0o9RiGA76oPy7LL38V3V
X-Gm-Message-State: AOJu0Yz/RODw3AR/kep+hAGT3HoU0o6QMNmeQvOBmpNGjV74nVO9MnZ0
	DGo1QuomuDOW3jMZvY2VUremqPvhVKuFrn7w4FVXsN+9BAJNDkrL8+wT9qY8SO8=
X-Google-Smtp-Source: AGHT+IGSHWVbV1tcxeH3+z11dMA97PdpaF9ANlA0nsm0f5BLNAt/QDzUFxbA279Ntl5owUYgn9cD2g==
X-Received: by 2002:a05:6808:2e93:b0:3c1:3f84:7a95 with SMTP id gt19-20020a0568082e9300b003c13f847a95mr25335778oib.14.1708594873059;
        Thu, 22 Feb 2024 01:41:13 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:41:12 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 07/18] irqchip/sifive-plic: Improve locking safety by using irqsave/irqrestore
Date: Thu, 22 Feb 2024 15:09:55 +0530
Message-Id: <20240222094006.1030709-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014114_804970_C3E0160B 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Now that PLIC driver is probed as a regular platform driver, the lock
dependency validator complains about the safety of handler->enable_lock
usage:

[    0.956775]  Possible interrupt unsafe locking scenario:

[    0.956998]        CPU0                    CPU1
[    0.957247]        ----                    ----
[    0.957439]   lock(&handler->enable_lock);
[    0.957607]                                local_irq_disable();
[    0.957793]                                lock(&irq_desc_lock_class);
[    0.958021]                                lock(&handler->enable_lock);
[    0.958246]   <Interrupt>
[    0.958342]     lock(&irq_desc_lock_class);
[    0.958501]
                *** DEADLOCK ***

To address above, use raw_spin_lock_irqsave/unlock_irqrestore() instead
of raw_spin_lock/unlock().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index e6d23fde51ed..175d02f7fd64 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -103,9 +103,11 @@ static void __plic_toggle(void __iomem *enable_base, int hwirq, int enable)
 
 static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
 {
-	raw_spin_lock(&handler->enable_lock);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&handler->enable_lock, flags);
 	__plic_toggle(handler->enable_base, hwirq, enable);
-	raw_spin_unlock(&handler->enable_lock);
+	raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
 }
 
 static inline void plic_irq_toggle(const struct cpumask *mask,
@@ -236,6 +238,7 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
 static int plic_irq_suspend(void)
 {
 	unsigned int i, cpu;
+	unsigned long flags;
 	u32 __iomem *reg;
 	struct plic_priv *priv;
 
@@ -253,12 +256,12 @@ static int plic_irq_suspend(void)
 		if (!handler->present)
 			continue;
 
-		raw_spin_lock(&handler->enable_lock);
+		raw_spin_lock_irqsave(&handler->enable_lock, flags);
 		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
 			reg = handler->enable_base + i * sizeof(u32);
 			handler->enable_save[i] = readl(reg);
 		}
-		raw_spin_unlock(&handler->enable_lock);
+		raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
 	}
 
 	return 0;
@@ -267,6 +270,7 @@ static int plic_irq_suspend(void)
 static void plic_irq_resume(void)
 {
 	unsigned int i, index, cpu;
+	unsigned long flags;
 	u32 __iomem *reg;
 	struct plic_priv *priv;
 
@@ -284,12 +288,12 @@ static void plic_irq_resume(void)
 		if (!handler->present)
 			continue;
 
-		raw_spin_lock(&handler->enable_lock);
+		raw_spin_lock_irqsave(&handler->enable_lock, flags);
 		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
 			reg = handler->enable_base + i * sizeof(u32);
 			writel(handler->enable_save[i], reg);
 		}
-		raw_spin_unlock(&handler->enable_lock);
+		raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
 	}
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
