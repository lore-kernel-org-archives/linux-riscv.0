Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E72CCD1AB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/BDxunE1K/lN+NVpwqbj0cADFcfjpLUTPyang5eJSU=; b=y2bpBvLfObutPr
	fX1v9KtXPslFnCnX8PzV8Vg7TJnrK0Owpbt8DLrmXTaQN5Oi8dEPfHL+P2EvKMSvkJjLm0DsMxu21
	vTCpupucnhSJlb9az//yyPOfiOxvShUUHI98jBvEkyipUvnOoCZfg4RJdobXBXJBaS8pqXMbxmyWt
	3dtMvtpdViux6HjMpiobKyKtveh039JQobqRK7En31nORrD5CSmnA7FXfnlmBAHQxAEEKoE2tP7WQ
	c7rNyron8mNXLNRtYaMrRsT8fkPACo4WS4LgyUlrX5NP/aRBCu52jgqHMNzI7cISJcdHd9cCTSZTm
	egVxZ9fbGLT2GyLBwuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDIO-00000008jmP-3UFu;
	Fri, 24 Oct 2025 08:37:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDIL-00000008jjt-0vV0
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 08:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761295028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7g4pB/ckzo2nT8cxJ/9GjBhmxVVtiakBTxXeOu6fIr0=;
	b=OhjEwEe5fndsM9v4dHFniWcAhZStHG9PoWyHSEmoSODnwxVVWkyGYt/t9QIdrGOUq0Voem
	PFDcDVFzE/mrkAD+ktsMJrsZLFJ4Qq3w18xmxjj9dQZoOtrCM+gio9rYxcgnsp/vpUOglO
	2SHkaHqiNtL3NSdMnYxg04cpn0fylL8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-HHx1wQX-Psmo1C5hyRXw8Q-1; Fri, 24 Oct 2025 04:37:06 -0400
X-MC-Unique: HHx1wQX-Psmo1C5hyRXw8Q-1
X-Mimecast-MFC-AGG-ID: HHx1wQX-Psmo1C5hyRXw8Q_1761295025
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47114d373d5so13630455e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 01:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295025; x=1761899825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7g4pB/ckzo2nT8cxJ/9GjBhmxVVtiakBTxXeOu6fIr0=;
        b=py+uRs7AZSbdFE+fyvfYzli/KDH7+TLRInNL5mib3vrygKBJ0+ylowjuF/pjyCI/47
         MHmbSmMAry1Vi0fQn8nISJq+vckcpvrtF5WHjYULioCk1RVBgYqExwahWxa8U6xRWRH/
         aIcnzyhHW6VKHMwWsUWHQNcGuBOOrIqSmz9vCQuNmAjdp3ycNHPEHQoGLvPxPeEgAihI
         5NoBzf3DE8xFULJgG3HM9u3LC72yFXMZk5ARmtZEmD+eWY4HIaiEqFTgj6RPD3y7AXKb
         6jRTaLzhZUIRSQNhDrubSB1EG/YGma3/V6WkLOykWxRXG4ivRFaVqBAOxTGgbn58xZmY
         +7CA==
X-Forwarded-Encrypted: i=1; AJvYcCXCODZ0DSDns1OC4batful7U6Hx+lXh/WPEngNwFVOoEEULvB4BGAbUFI4uL8S9mzPXFf1YeBR3IabHYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2HOcQgMbjo+J+wH2fuERuXUHhv5hFK/fSF4EPMuHfiw/WOvVB
	lvXOaHvCFeW+Uv0NgXXaIGjFpSQz6Srusk6nANaLUB+ySxuq6tNZUOl6aiFu3uFkn/TerNu5paY
	q0uu14lK4+rWOjvXROQt/OSfD1FPYW+C0KguFzXcSQ89GBwX+aD2XqbzoY5SYfz0WaB/eVA==
X-Gm-Gg: ASbGncvxOqi2WQszuhGHa5beeGtdW9iOHMIHI2LPnz/8kcM1thdwSUn0E/MwAoo4DyG
	0JSR4Vl/iPRl/Y3006CfHnxMfsL1OPJfG6JvQZW96YQVtODAZgVH5YJTpRkqp80MT380kI7mJSC
	ydIzIDNW/n+gCYeOyv6teEC1HVFSHbBwPzJekvlbHM1GJYSovs/i6RYj6vWphl/2OboG9AWXzBw
	jDOa76UKFpcInt+UinyzE27EyThIa9VPxn96fCfUEWfv1QIAcabUfIi6oe5P30sS9qMVw6a2JL5
	obuoh+grecFTdZo5NDvYQpGCZ4kGvvOtRl3OcmH+Vidfhod7fD/Xxp4meG0+w+e4K+yXFpdOFZz
	ylk8rGAc8
X-Received: by 2002:a05:600c:540c:b0:46e:46c8:edac with SMTP id 5b1f17b1804b1-471178a6f9emr188687415e9.11.1761295025443;
        Fri, 24 Oct 2025 01:37:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiPue6isAM3o8JvoJrHWMiOPf245L3GHD9ByxXO2p2tubIKm8/8NW9BN4YedrYR2Oo1SzNPQ==
X-Received: by 2002:a05:600c:540c:b0:46e:46c8:edac with SMTP id 5b1f17b1804b1-471178a6f9emr188686995e9.11.1761295025004;
        Fri, 24 Oct 2025 01:37:05 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e77dasm8111636f8f.2.2025.10.24.01.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 01:37:04 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lucas Zampieri <lzampier@redhat.com>
Subject: [PATCH v6 3/4] irqchip/plic: enable optimization of interrupt enable state
Date: Fri, 24 Oct 2025 09:36:42 +0100
Message-ID: <20251024083647.475239-4-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024083647.475239-1-lzampier@redhat.com>
References: <20251024083647.475239-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7TMK_WsjAGXudXYevGSm8xNHHie1nA7Q7LxbuD4JEkE_1761295025
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013709_333682_5A69F123 
X-CRM114-Status: GOOD (  14.40  )
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

From: Charles Mirabile <cmirabil@redhat.com>

Optimize the PLIC driver by maintaining the interrupt enable state in
the handler's enable_save array during normal operation rather than only
during suspend/resume. This eliminates the need to read enable registers
during suspend and makes the enable state immediately available for
other optimizations.

Modify __plic_toggle() to take a handler pointer instead of enable_base,
allowing it to update both the hardware registers and the cached
enable_save state atomically within the existing enable_lock protection.

Remove the suspend-time enable register reading since enable_save now
always reflects the current state.

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/irqchip/irq-sifive-plic.c | 36 +++++++++++--------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cbd7697bc1481..d518a8b468742 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -94,15 +94,22 @@ static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
 static int plic_irq_set_type(struct irq_data *d, unsigned int type);
 
-static void __plic_toggle(void __iomem *enable_base, int hwirq, int enable)
+static void __plic_toggle(struct plic_handler *handler, int hwirq, int enable)
 {
-	u32 __iomem *reg = enable_base + (hwirq / 32) * sizeof(u32);
+	u32 __iomem *base = handler->enable_base;
 	u32 hwirq_mask = 1 << (hwirq % 32);
+	int group = hwirq / 32;
+	u32 value;
+
+	value = readl(base + group);
 
 	if (enable)
-		writel(readl(reg) | hwirq_mask, reg);
+		value |= hwirq_mask;
 	else
-		writel(readl(reg) & ~hwirq_mask, reg);
+		value &= ~hwirq_mask;
+
+	handler->enable_save[group] = value;
+	writel(value, base + group);
 }
 
 static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
@@ -110,7 +117,7 @@ static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&handler->enable_lock, flags);
-	__plic_toggle(handler->enable_base, hwirq, enable);
+	__plic_toggle(handler, hwirq, enable);
 	raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
 }
 
@@ -247,33 +254,16 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
 
 static int plic_irq_suspend(void)
 {
-	unsigned int i, cpu;
-	unsigned long flags;
-	u32 __iomem *reg;
 	struct plic_priv *priv;
 
 	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
 
 	/* irq ID 0 is reserved */
-	for (i = 1; i < priv->nr_irqs; i++) {
+	for (unsigned int i = 1; i < priv->nr_irqs; i++) {
 		__assign_bit(i, priv->prio_save,
 			     readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID));
 	}
 
-	for_each_present_cpu(cpu) {
-		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
-
-		if (!handler->present)
-			continue;
-
-		raw_spin_lock_irqsave(&handler->enable_lock, flags);
-		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
-			reg = handler->enable_base + i * sizeof(u32);
-			handler->enable_save[i] = readl(reg);
-		}
-		raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
-	}
-
 	return 0;
 }

--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
