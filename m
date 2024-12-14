Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D40E7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKLzFrPGahRK6/mbHBMZHp6Lw7RYzlS6pnHmtyEtJnY=; b=tIa1mNqVKYHST1
	NDEx1MCjcyP4cypIMSCefogad7cTdeZsb9NGns4GXiSFiPX0Ozp8Hhf9PHHhVcUNrSb6YSUp8jQge
	1NRCttcHrMdatt4Y8JgspnrDLZi6vvpTnQJSXGYS4cQqp2c14QmI1EClitc08aDf6+ZUO/ydUW0B2
	j5Gr51LJo2cDz/noGmortJ13uaXR9lRAIU4rVM7sWWMuYrETcinavk+jvFaJIoUq14H14OhIcXVAC
	AeccSkotKuBF8bFCJaQyT2HeWlytGwIRrw5XZZCAXtoVpuonSeCdQfZPhlPOf2e8rvRHjoRL2WjTh
	KhlbjGXQ4amVItUS057Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMX9H-00000006nYH-0Our;
	Sat, 14 Dec 2024 18:45:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVv9-00000006gZt-1tZv
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 17:27:16 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso1914712a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Dec 2024 09:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197234; x=1734802034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP+pJC86HytY47PbI5sMBg+o5TFAFMoqjjekp4WBZSk=;
        b=NEwm7NCgBZvTjh5PL4xLstTePcqDe4KhrPWnztezena2SxcMXXwOFjVkWHCQ93468f
         L6P855gjOlOfFV9arAAEaGBCPQLdGEMCqzHq9USk5LfsQt9TCxA23t9qBWDBP6aPJP3L
         MyZWr2dbz7fXLsJdmWOTDXaa0cHkuHqJfs1YAaZFv6BjpvAy6RZDdaxYbRRFl1jdDKna
         BrIjH5gDhGWcDMl2m7osUDsegpFfMzdIhfK/XMKyfv91GPfGqrBrfrsQYziiWFixcsBQ
         vwfdjMzSsJ+QML1GohD+EOZZbLjqk1DfGOu8EG3hfEfJmrkQyrIYm/XfKk9PyUpDeVzk
         Ig+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197234; x=1734802034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EP+pJC86HytY47PbI5sMBg+o5TFAFMoqjjekp4WBZSk=;
        b=rP81E+tqtMztl5Z9HbedhV8qJ2y7farnoO2q96Yk1pom1UHr7W0bFqX7APu0lTbPTC
         w1hBEb8axebYjaJKs4wh1fb803q4SzjWmwEr9IpeCIODWyDq/mm0Q3mGIsavNubuUHb8
         5kD4OU0mnjewCQ7axH+EVW1cQLHonqozC4kq4d/XYfK9WCzwXUtGwOz+fqxgZ1pnwm++
         m87Suk6AP6g9l9tKNHWKf/j8aoy0jZBEjhmKyaKT0O3nts6WmQveJfr/EWjw4AlFX8Oy
         rkbQokTM846XruJbnnj5xZmo+Laop9aqhL0ge5z2KO1FR9UN000ZOmEFaRUVf2bUVJb9
         90Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXc4+SazafCoXR+A1BT5wONSMsQor0kFqm3B08HttId9fxWX5/K1j/NmF11SlDrHef0y8R8uBBDalN1uA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6qOWfGrhs+zrUqb07QddeeiHqMsnLoEN1/cfe+Kp9YgtZQatn
	7IP66mqElu3+uvcJk8l8ZMyZ3YvG1x8jHNwxpDSHS67bd/KTyQx7OJ5IGbkDPNc=
X-Gm-Gg: ASbGnctUPSJBDIH0jJClwzJKK5umv5RcmjMkO5OTwsqKT6TIwiGz+g3bGKnQoT0BcB1
	b7B6mPT8rJ2Dv3/DgleihOuzDQIZk5Zo9D8CukSKpHJaedSUtK+7XyW6hrDhOq7wwnQrCW+blN4
	y08AE0UisVkqxvXLfJYSB+INTk/gNOSk8qPQzsbtPpQewhKoCtzFa0KNErbRJw/cU9xLUK0hJfO
	020gSuOmSboattNk1QN9P6StaKo/3AgsyVxb+APysojTInUJzYih/otu6+LThC0Drk/WrDYN/fk
	jUk76PpK1ScB2QA=
X-Google-Smtp-Source: AGHT+IEViE/EyOEoU9avO8xOUuGHIK7Nu4di+ccQuUelW0qrSBcAUC23H6R13dSAPO44yc0spDyzYw==
X-Received: by 2002:a17:90a:ec84:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2f290dbce03mr10584296a91.33.1734197234199;
        Sat, 14 Dec 2024 09:27:14 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:27:13 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 10/11] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Sat, 14 Dec 2024 22:55:48 +0530
Message-ID: <20241214172549.8842-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092715_481244_31E735AC 
X-CRM114-Status: GOOD (  16.74  )
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
index c915a5cf4187..aca769d915bf 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -434,7 +434,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -450,7 +450,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -463,7 +463,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -522,7 +522,7 @@ static int __init imsic_local_init(void)
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
