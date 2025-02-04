Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861DBC0218F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67ohOJeSZG/NXXzIwwN/ASpmTvB2nxIFnVcsIVrxbE8=; b=FJBvht8CdDbbpk
	Pflq++buWrxK5nHXL/cgY54HNaxvAJT30SJk0PpCpmxyNPQwdB7up//6gzEpAULAEql1yPJcd5j/G
	mv9TZ3w7cLfX0NMQKeeUMtQTbZ+IT296C8hZOVv6EhrvhyDMn6oaRc5YRD1zUCK4NdBj2wpTUoZKC
	o2D8n+aPfDaugUP0mPR+3nCySdtAb8kbGrbr6OEg13Ru0EcXhCm3DNzQqcZkWwXiEmoHsZGkv67PV
	bk+S6AuclHkkZoEr3ajGITLxVyAJaUL4+P8E7DHmxrZAhrnDokgBj0il+5CX2wNZDK58jsL80hqTv
	K2ddBkGJG0OHQgp6bF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDxp-0000000HUjC-2xX7;
	Tue, 04 Feb 2025 08:07:21 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDmZ-0000000HSyT-1ULK
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 07:55:45 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b6e9db19c8so477630385a.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 23:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655742; x=1739260542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2spJ1HnVniz9PCwrjRYFNbVUb3mNe4Ef/XoJaqLNwpE=;
        b=HXJfyv5xapJ+Ikt5B/RWtR/uLRKbjWPUmLN1P5EEPF3bmE5zZq2wgaOPC6P6yn7zgf
         Sz5fxQPiGGh5av6dzh8sBJSqbpg2+hLxJVkGnAHRo3oxyIcXBg4/j/4HCnIAdmnlPYHs
         N05HyiJGtSRt+HW54/99web4Lo1HEnaV/INy4eh1H+S0sonxJYZ60vtIWhbtTLq0HE/2
         aARhpwTsKp5QVVhQckF1SMGpjy+qBrZSr3qIu37Np1DAX7JWfnPHKOy9eCO+PWDnESKT
         EPHalTl8xM2FXkhzBfEjo/wHBOdgk+RXJuKIZq/WSC89Y+OIV3R24CVme52u8YEE4O9L
         ltPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655742; x=1739260542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2spJ1HnVniz9PCwrjRYFNbVUb3mNe4Ef/XoJaqLNwpE=;
        b=uJPvt/cpnu7c5zugEVewbvyATCy6CYIK61zYsnW/PUcOKMYDa6EFb5MlI9Q8aYMFOV
         OZBrQgJMThT3NQpUFODWl2f9XMDpgTwvUOhLPYkxXjrqvf0fefTPFwhvbJCBBEMgeg+w
         buhW6pnp3Pp2vqSR6B6i6gupTv2ksJbtW9svm6WcMOjN0J+4lRdVRIWvue60zEi8Qf8F
         witaChQJNYApPlukzS6hPIzUiftcm+rYEgS7SxeADqmqlpdIP7yQwClXfxEz8k/+/cCY
         Pp4W5umOuxkog+9j4t2K7y0wAdmduS22koyscjzvElbSyuDCm0ydlB3FsDHX1xee63l+
         Yrng==
X-Forwarded-Encrypted: i=1; AJvYcCXwpwqx6FMvOUBYBrkdsfsuDqCX164DWdfeArvp1wfbxVg9ni9x38BPCTgjsQbaVTy6eRXyVprpaW0F1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJna+qugHzP1whpXBOsHF4v7OVnRXaLfydhMgVODuwqgic/88S
	wbimcT3yQktliSp55OvuBxCA9ZNWp4snhfQ80GCPYOTyDBqxvRPD3C66U/SdM5mckcGxRMZnY8y
	fq4I=
X-Gm-Gg: ASbGncto3oc+CJssZ//LzRcvwKn1LU74UO4wcIc8WyEmHhdgZVHDctPd8TRTBe7qImP
	5oAJcdgajF+GS9kYi9pxBzrCJHTHcwvY/dMPt0jgHURiYMRbypVq5LeD/8E/vSRDAjaGreDvmw0
	euIakql6hEGMBTrfWH6lhlvLYAQHu7Y/yBMhOj4ILHxweyAFReC11d7Awwy5SrJroou7yXiWg10
	x1u2dk2rTS2MAYSOxvxv0/g/BClnjFRCSznuuUzrmI5aEcq04qlhFMi/rHPS5LMhhSq5q6kBBwg
	/Kwk8n09hTRSmNVhxblECaExds2ixmeovh1iIv1lqTePpl3yNtmwe0Q=
X-Google-Smtp-Source: AGHT+IH3PInyMoZqyc0SRTAjhuFIMbhus6lgn+l4uL8MxLHlStsGNic2bJF7E2l/TEt5N03Sy8JF7A==
X-Received: by 2002:a05:620a:4382:b0:7b1:56f0:e09f with SMTP id af79cd13be357-7bffcda14b6mr4536316585a.54.1738655742363;
        Mon, 03 Feb 2025 23:55:42 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:41 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 08/10] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Tue,  4 Feb 2025 13:24:03 +0530
Message-ID: <20250204075405.824721-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235543_391066_656A0C20 
X-CRM114-Status: GOOD (  13.85  )
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

Implement irq_force_complete_move() for IMSIC driver so that in-flight
vector movements on a CPU can be cleaned-up when the CPU goes down.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 32 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 17 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 2fab20d2ce3e..fae47b8ccf73 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -156,6 +156,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 
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
@@ -164,6 +195,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_unmask		= imsic_irq_unmask,
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= imsic_irq_set_affinity,
+	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 649012cc47a8..54773c27c411 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -332,6 +332,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
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
