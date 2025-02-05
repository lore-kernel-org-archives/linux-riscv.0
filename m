Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C65EC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYkGQtD89YXF5oo41GUIndlRaba6DKliLoofi/hRVSc=; b=cNrfGMKOr4b7Yv
	EK1SQRK9hm77L+MgotNyc9JLF1CLc2xhv3y0CUYvAGIqz7G2j6oY8OsMVBOM8fJicsLC7D5I8Rfah
	+0Edr90Xwe6cg3YBOdp35xV4JdoAoAhvg+IoNLYC8HkGlMmqNOYlHy3tIgnVjhlFUCejWWOM0kABl
	tPAtWMJl6IgZws+o0ViYRDPZ5pig32NlzNGTHUk/mJMdzGdFa/v6dkizLephMfl3Z9J7n2GIL7CcA
	mnB9gvoVGspA6W5rWDbKv4emBKc8j0s1UTfd0OcTF5r67yZbqL0jh/t0eXRO7X53srN+0Y/IK08y1
	oZr3bvBIsWlx5ae6iGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfi1y-00000003vn0-0SXw;
	Wed, 05 Feb 2025 16:13:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpm-00000003t3Q-3mPg
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:01:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21f2cfd821eso3964235ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 08:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771262; x=1739376062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=KUOzjZ3pk/WuctByCJugIn0Yo+ZvLAGlAGpb0MQbW1f35ZXcrM8r4makroiw079ZCl
         w75qsY1JhDbdhNo47FAkkiHMbPtOs0NuI1DL51DuEr/ytE0zrbKtqW/p2hmtwTSaWK+k
         Bg5BTQPSr+ijxnILjs/cu8ltkfFvPwz7Wtkcum/hTeqXClx2oJxw8z9+vnsoFzhNuLg5
         881Fxs4g9gk3lQ69mJXQ+gl7HdsQRqKmRNZXDyOJQlMjX2BcUT+94/q8XSGGZHhuRFWJ
         x6GNrBJQB6GQoE/bv8wm03P1wD4mxeK6TQiEcLPJ+K+Nl3LyEABCGE8Qj+m+3in+bu5y
         eJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771262; x=1739376062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=H9hZ4UBGxCkLR8CVqCMefdCffPbdmdPyE53wShpINctv8UFVMKXvkq78Qt3gyMUVJf
         1dCXDnJ6Qu5mgEA91CZ8U5Ls1UUtuaFtrYNZFMulXLlogwDv37o/WcetmW7pQt2L3iQT
         hk1ibcKmo2uPOE8n39KVgu+uyJxXi5jX6gM1y1pnd0dSBh5W0kMILatsAp3VwcOYuOdv
         YaDgi6boC1Xi6EJ5YdMU/qApghuN17mDoJPgnYtYOtmRX0wWWEiwF2kU4AEFhw4vSxAe
         aj/OmA64tmaickK3s46nw8gPZrEnHhBd/B16rfqEjkiRVB/U5cO8Y19GRQXXeWTKJ/9U
         zFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOTSy0RTkWerfNx/V+JNmqBHK6Eydddz0ealz5/r7CsiyHhb8HBM1GjvVQgeYAzSi6e95Pq7HbD8cemA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYqxSVNtYgpTJhDsmnB7TK3dVjTEv0dF0Z2QuZ073BLvnDRd6b
	lL1djPD/rtQhuDRdtbDtedtDYdvDDK+vo0z8FOo6jMGdzRuQQ4JSCMhneW/H+po=
X-Gm-Gg: ASbGncuyA+ykUo6CWUW5K3HNpXMjRIwhwDNIIZklnoXNFjYeKgUVbyLlTLKPjKTmoOm
	Y3nbS3rJ3McAgKBdWvC0knfAJQGYAdnwO1BtafcnYrbVC/GMC/3D/GhuF6H23dEQvkY0fjKeJKy
	jiIV1vnqnoRS/K6EB5rw+MIrD9YfNRsPN13cFjxDO30iJneQf0FS+9AmzyG/bvfQWgdO6c+KECH
	Awbh24aCihxE1Uvm+RrEHjqKmOVUfmoDYW1rXJiW9X0xU4ihcWiQYnABD+vk924lyQpAzYlj2Y6
	0AQoBIFfQvJLAUAxQacXWWMZJ2Dx6oai+UYfmMQi5M9s+GaljVWtONM=
X-Google-Smtp-Source: AGHT+IGA6bIArcQBSZQINkR2ug10cWLWOtAjnqU2/HK+jfs8kC57mwS6eJ+lRGDZ5WGk1pjMRxBEnA==
X-Received: by 2002:a17:902:ced1:b0:215:65f3:27f2 with SMTP id d9443c01a7336-21f17e2719dmr55903235ad.8.1738771262008;
        Wed, 05 Feb 2025 08:01:02 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:58 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 09/11] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Wed,  5 Feb 2025 21:29:45 +0530
Message-ID: <20250205155948.81385-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080102_941030_B3C3DF05 
X-CRM114-Status: GOOD (  14.39  )
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
