Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A99C0218F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2GEAc2lz6irBN0E+56JNTFzlyId7oZxwwvKPU5+m0k=; b=Nc1PwmY7pfZN50
	29hWp5eu1iyMNVxrKIDclO1S9a3Yd+OaDVFfDoh9BX760oDbBDrIxuqTw9rD4+zV9p569YPXm9Yc0
	g0mVLooHuj6fk7HAHAVW9f0JKBjJ/KaxcQy9i9NpPZm4KQBjD6TDRzM4hWhtzJgyqrFcAecql2T+1
	nBfUL7H+5JeI8dtOtkeaPK4EnTWaCRfc2y/poHCgKSPnXn0rg3a0aqRAApzIhpAEupxopScaeN89T
	YIIS7ad/d8w/tMwHTx0Zygk1JpKYvfLXMUfirTW8Sk5rrllF8xUnhmdPuZKRoCV2rFhA+Lucim8GQ
	XSnKL8Bs6SjZJwA2p7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDzA-0000000HUx6-053T;
	Tue, 04 Feb 2025 08:08:44 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDmj-0000000HT21-10nI
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 07:55:55 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7bcf32a6582so466921185a.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 23:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655752; x=1739260552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gEwcaDf3FiyZX0vTyT/9XCNNLKunHvBb/ApGbPO13I=;
        b=BAJ8CwJ/DVmyUhEdQNSQBTJZTBech1LS87zix86GEM+PzkX/mDXV9X80yhmciEsiJL
         BCocVTNDlHXlNftUoB2QYbctLVsMkxKlHGBK+XyaEW1CrCsHccPW0/Os2nkgOk8NULzp
         2xYCNo/h3k8IfS6PBGg/+KCdKunZltt4YNSKEoz7lrxne5XmUe8fk9VL+GMV4G66N8yT
         yjOwL1mqarTdCyuRR85UFus5iFeclUtcvjI6jr9trgoE3VOgmnQVxb4wEIlQzfwEWi+Z
         U8GSymW9Ucws40LbmiK0X9Z5wGu+DFvNnKCh8P/eEIT8oj2I1u17FEaSp9nJRzV32zOo
         OUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655752; x=1739260552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gEwcaDf3FiyZX0vTyT/9XCNNLKunHvBb/ApGbPO13I=;
        b=P0y9FBnEviInMqJ5THtlacSkvR/Fx0sKIwAbweq+uhfYEJu7eeXfyf0zC0te5CHWdB
         OU8Ueir3vZwc0okIESgmdNwPJN1gl8q0EgVgk/9087HPltB+rL8FjuwtNeNn1yL+R0Ef
         ZoptikLolG0H1sLKoOJ6lPVhYUgh1h9UVWZv4SZKjLSx4/cKqK/1jS2tq29ArVT7sqqa
         j7zze0ncwQ69GDGKcNNbepN4z3To/IIRZ9IrOV02hV7sUd0gtOVw/IU+7CFScQDUQQA9
         5YSJv9snmInaBwcEQN/yoGTo548TQJtlSiAufL7OdPPZckJrRE4rmWbleqUjLXxF5yqE
         GxCg==
X-Forwarded-Encrypted: i=1; AJvYcCU3LFLJEeKwG0PqGPHQfFoQxDifNTViadTHe/t4ocmKCk/CI6f9y6pANy/l/B2AMRREW2A94FhbXTBcZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvAUuuZrGqE/gk23GbryN+fpAdVLPlKSulocCZ94oekAg18l5P
	fY71ONcZBZeqzJvz0zuIvrJHvflj9HXyCDdNykLz8jW5BiDB6Lb9wIED6wGrQIs=
X-Gm-Gg: ASbGncvL55HYWQt0jSa7fyBWNPb9bw/FL2tXd0XFAp57uaUoTkiWWXmAO1q8ksqbYHd
	npmK8sO7F1kuuPzDr0GcUmECUjJ572qYghCogzyLl4oU00gAr6LbZaS3TUvEoio3NEPHHjyclfo
	58iPVRnOr7jL+a2XGWAGjhllgh4SivlR0sZm/S7YAB/scOmveQWuyU9EnpgLC1SflqF+4YIYHPn
	9PWXI4B6TLb+CSv8jW4JCzQuQFFWHivLt1BTCpeEmWISfUNLyRX8g2OFz3uMxUTzthL3JBmB8DK
	lRiMmsy9Q6vIxIqdIV1/N6zxDoAts3ly+ebuND3nTyOgZNgH3Z8gJOA=
X-Google-Smtp-Source: AGHT+IE1kqeyReImTVJHGW5IDLgtzpBSrI2/ZE4aOj+o6f7vrc3hrNQAxAn/RUr7v38bA4d+4LAZBQ==
X-Received: by 2002:a05:620a:2992:b0:7b9:a387:3cd8 with SMTP id af79cd13be357-7bffcd956e1mr2941465585a.42.1738655751905;
        Mon, 03 Feb 2025 23:55:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:51 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 09/10] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Tue,  4 Feb 2025 13:24:04 +0530
Message-ID: <20250204075405.824721-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235553_275017_6281FDD9 
X-CRM114-Status: GOOD (  16.44  )
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

Currently, the imsic_handle_irq() uses generic_handle_domain_irq() to
handle the irq which internally has an extra step of resolving hwirq
using domain. This extra step can be avoided by replacing hwirq with
irq in the IMSIC vector and directly calling generic_handle_irq().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    | 6 ++----
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
 drivers/irqchip/irq-riscv-imsic-state.c    | 8 ++++----
 drivers/irqchip/irq-riscv-imsic-state.h    | 4 ++--
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 73a93ce8668f..0c94ce8ce580 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -73,7 +73,7 @@ static int __init imsic_ipi_domain_init(void) { return 0; }
 static void imsic_handle_irq(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	int err, cpu = smp_processor_id();
+	int cpu = smp_processor_id();
 	struct imsic_vector *vec;
 	unsigned long local_id;
 
@@ -103,9 +103,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 			continue;
 		}
 
-		err = generic_handle_domain_irq(imsic->base_domain, vec->hwirq);
-		if (unlikely(err))
-			pr_warn_ratelimited("hwirq 0x%x mapping not found\n", vec->hwirq);
+		generic_handle_irq(vec->irq);
 	}
 
 	chained_irq_exit(chip, desc);
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index fae47b8ccf73..e6c81718ba78 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -112,7 +112,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -EBUSY;
 
 	/* Get a new vector on the desired set of CPUs */
-	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
+	new_vec = imsic_vector_alloc(old_vec->irq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 54773c27c411..e70f497a9326 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -443,7 +443,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -459,7 +459,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -472,7 +472,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -531,7 +531,7 @@ static int __init imsic_local_init(void)
 			vec = &lpriv->vectors[i];
 			vec->cpu = cpu;
 			vec->local_id = i;
-			vec->hwirq = UINT_MAX;
+			vec->irq = 0;
 		}
 	}
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 19dea0c77738..3202ffa4e849 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -20,7 +20,7 @@ struct imsic_vector {
 	unsigned int				cpu;
 	unsigned int				local_id;
 	/* Details saved by driver in the vector */
-	unsigned int				hwirq;
+	unsigned int				irq;
 	/* Details accessed using local lock held */
 	bool					enable;
 	struct imsic_vector			*move_next;
@@ -96,7 +96,7 @@ void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_ve
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask);
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask);
 void imsic_vector_free(struct imsic_vector *vector);
 
 void imsic_vector_debug_show(struct seq_file *m, struct imsic_vector *vec, int ind);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
