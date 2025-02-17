Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25BAC021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYkGQtD89YXF5oo41GUIndlRaba6DKliLoofi/hRVSc=; b=IEcmLEPatz872C
	tiBESJlUVcZEEaE/rcEt6i3b0BTz+ck6km5veLjYSuMW/SaWQ8xgwa2mNfHEy3NzRTKn6GP3AeM4l
	rqhsIIE4yNjeC4MWhVSBY2fcXj8kDILQWN1Q5YP7k1MdPPSAl855uhxSHaaApPb2Z+A6nouiWstqe
	c/l7uzssJgjJaCNnoZFQD9nXI8BMXUSwDCZx9JVl/dcXdhTtlLn/W0Bcmc41gp7hHbzhmoTaWyxEj
	Hf7ZR7pt/DvZViEQo+R9MP2MCm+XuTI/mdYUNeV6FHAk6IP5uMpvMJd/uBNga9ikH2r88N7Wfqm67
	6QYXfaTXOjtAjQYY+hqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx9t-00000003spk-39N9;
	Mon, 17 Feb 2025 09:11:21 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxq-00000003pmv-1hF6
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:58:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220d132f16dso58706855ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782733; x=1740387533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=gtO0KN7eq8H4tLr9+LoK5yaxy9E5EAMAzySVMTkPhmSHHwwtKfFRbvrIGImjRIHn5l
         Qem3eASal5/KlyiPG6ShU3ar7uQ8HVktRTy06qBUrNGhTOSX1tDcLuCAUUsgZlKiMBej
         Yx+mguJKqv5V4AxZsWFh0uOgcwu0zAvzDJ9nWqoYPSFVpAeOkIj9+gtvCEKsO5M0UhnD
         sPC4NdtTHdlh/4bbsOmpHPEFQLfz4epM/bCtjHMQBiTxXg1uMhY9ZjYLdofZOIR2N/Wz
         wq8JAwb2v7wfdOWOGO4NTgXRqevE7eivPkY+1eHJ3JL5eFVewvSvybKaaf5UwqSPGXNc
         DCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782733; x=1740387533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=HMzPXJtYZ+VsJthp7nbMWznl+an5t8kz8QJhsaiT5zTPjpkU7PeldxALJt0r88/J5z
         JKt1syv90Ac/E/eRqSX34aBYBpqBZwM1ctdt8zffyJWI5caLPA77YcKLg3YzYT0QkQZs
         cZ2nl1Jc7VyxAwA1jK1q3dTVFTGV1Ot7VlL9qBIPbxWREmkaNSz0bAZuOByROKXlbrmP
         8ByxIT4+hS0b5ZMOvYsg8hAVVl0lUrUBrBtOQjd5dM28z7dLbQ813YaRZMoXNz70Ci6z
         uXszy98znNOJntHrBNezkFNUe1mr6UJUjieUjXULFdeivH8GQYz30jwPClDrHpq5IqP7
         dSWw==
X-Forwarded-Encrypted: i=1; AJvYcCUGHA4hBNM+qKpTk0zLu0/3SJRy/rQSIIG43dQhFSif62GRSaGrmvgYnG533EnAsEXziPWMx5yJfNJU6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl7vsrKejVZYrHp6rDSN8ZL72ZpnK91qLaDAuLbu4qDgugkJST
	oRbrC1t+TbwO9iAXPunjBt+KD7XcFMd12KI4gRaXZaTb+SQw5/+KvOxiiMJJmBg=
X-Gm-Gg: ASbGnctbpTAFM6DWZSsnVewo2NJ1Dzozysz2uNc1TVZMPk48giLbDa2zyNiUarBkfjj
	9+HNpOkTv1uw6TtTM8k9kkjAcKAu7R6ipQ3zLnl30zc+6X2Y9lSrmHJM0DbJ2htcYL1m1uQkgqu
	wAWHxzofuE7kR64bnNzclF3me34yLQpI9qARLZCHSw5V9ixrzPvlHXWhhtuUkxkSKbBk+uTg4Fr
	+O6T+a6SIh3Uy1XujOW+ycfo9GvU+0+gOp/5S1WMwhRsoy287TO7oZN3AmlSck1TtbyI6UQX2ZA
	yiFR+a4QJlk3kKdYK1B0mmYgzipyt3sGQYkRYCGc+1+CVSsYyx1KDbM=
X-Google-Smtp-Source: AGHT+IFBSmav50eb95KMP+Wa+2zHfS16N6A6ml9KRa5tGTRfbaBtV9X2/4WT6iaEXHAuO8XqxuEKDQ==
X-Received: by 2002:a05:6a21:6d95:b0:1ee:5e7e:bcc2 with SMTP id adf61e73a8af0-1ee8cb176f4mr14239238637.23.1739782733442;
        Mon, 17 Feb 2025 00:58:53 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:52 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v6 08/10] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Mon, 17 Feb 2025 14:26:54 +0530
Message-ID: <20250217085657.789309-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005854_454431_AE917BCF 
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, Atish Patra <atishp@atishpatra.org>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, hpa@zytor.com, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Implement irq_force_complete_move() for IMSIC driver so that in-flight
vector movements on a CPU can be cleaned-up when the CPU goes down.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 32 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 17 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 9a5e7b4541f6..b9e3f9030bdf 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -129,6 +129,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 
 	return IRQ_SET_MASK_OK_DONE;
 }
+
+static void imsic_irq_force_complete_move(struct irq_data *d)
+{
+	struct imsic_vector *mvec, *vec = irq_data_get_irq_chip_data(d);
+	unsigned int cpu = smp_processor_id();
+
+	if (WARN_ON(!vec))
+		return;
+
+	/* Do nothing if there is no in-flight move */
+	mvec = imsic_vector_get_move(vec);
+	if (!mvec)
+		return;
+
+	/* Do nothing if the old IMSIC vector does not belong to current CPU */
+	if (mvec->cpu != cpu)
+		return;
+
+	/*
+	 * The best we can do is force cleanup the old IMSIC vector.
+	 *
+	 * The challenges over here are same as x86 vector domain so
+	 * refer to the comments in irq_force_complete_move() function
+	 * implemented at arch/x86/kernel/apic/vector.c.
+	 */
+
+	/* Force cleanup in-flight move */
+	pr_info("IRQ fixup: irq %d move in progress, old vector cpu %d local_id %d\n",
+		d->irq, mvec->cpu, mvec->local_id);
+	imsic_vector_force_move_cleanup(vec);
+}
 #endif
 
 static struct irq_chip imsic_irq_base_chip = {
@@ -137,6 +168,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_unmask		= imsic_irq_unmask,
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= imsic_irq_set_affinity,
+	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 96e994443fc7..5ec2b6bdffb2 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -311,6 +311,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
 	raw_spin_unlock(&lpriv->lock);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec)
+{
+	struct imsic_local_priv *lpriv;
+	struct imsic_vector *mvec;
+	unsigned long flags;
+
+	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
+	raw_spin_lock_irqsave(&lpriv->lock, flags);
+
+	mvec = READ_ONCE(vec->move_prev);
+	WRITE_ONCE(vec->move_prev, NULL);
+	if (mvec)
+		imsic_vector_free(mvec);
+
+	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
+}
+
 static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
 				     struct imsic_vector *vec, bool is_old_vec,
 				     bool new_enable, struct imsic_vector *move_vec)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index f02842b84ed5..19dea0c77738 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -91,6 +91,7 @@ static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *ve
 	return READ_ONCE(vec->move_prev);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec);
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
