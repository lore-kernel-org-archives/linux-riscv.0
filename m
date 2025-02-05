Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A322FC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExNMvzogq+Y0cOv/uWbNl1TVVYdSsbo39ahMGzB6e60=; b=cyYGK0PEPSgptg
	WkfxLX0fZ+XwOY19C6OrqChOj6eKdJPyvjR670uMr7m6qCrvm23qJn0l+M9Dwqwg3jqSbcsOC8KMH
	B18g4ahcoGCFSOBvdvXaK/m2Ml4qiEegYGw8EvodO/3U5JPkVj60t7rYINnQ43a1FUoxAm0eK8H1E
	QBi1p3CVUyFeZkBthlsgD48oGxxExJLfZ6uI3mLmMHo9LwDLafehyt9FJj9SrSKiHZd+ODYHGrbvD
	D9wcAoDTHlKDHtkxHmye1WS+ud9U3eSOods+y9AaoknwhgInv9l6yxpFPUmbv7/IOs/K6+ESL9EI+
	KSsaKMpcBOC96NeR4pZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfi3K-00000003w3G-19vc;
	Wed, 05 Feb 2025 16:15:02 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpt-00000003t64-31pm
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:01:10 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so9429760a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 08:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771269; x=1739376069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=EJHUaDgVXOk6ExS4Lb3q6IogKQhFxky7eygMQFThZBVrZL5CVD3c5DI41qw8s9urF5
         mz42FHKXVCbW6YskN89ZBPZpLAhe2sQ/s16qm95zCWGusuhH7tzxzgIlMqVw0n/MoBRD
         JL8KA1KLnFWWZ0BWgi3eFQVsLzEXpDpolvLzmGSfMnjb/vFcfNSlXjKB5SD7x+doWWVr
         DIO/2+wHp7r8Szdc2IA9Iwfjgej+yNOcT/OYI8xMAm4a9vmkVmrXZWlQrPVMrQAxY4cH
         yJlCTMem5idsUJ5lvTWR3GXvPXJ9UIaeEVuSuStGGrLVCgNtjbj0DjZWNp0dU6vo/DUS
         HGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771269; x=1739376069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=R7Ul/eQmBMwWPLjGNcC0DXAmhaYG8/K2mlPsjDnxFup8Qv+HWYADvbquNp/CnZk25g
         p9NaXziBnnrLSOLqkstvrwjXrgXbwr2QD8M1yDbYGuNTbfwakc2bpnHmz85SGE2CmNq9
         +p0Lt87gKCXxSA42Fe1dJKYsulKyPSmEL2rCSiAl+B3rlrboZ9CHCU5YY+esUrUGujNS
         6/VGjxMzZhvE/K46AS7WTrXc5ky/Go1k/NSCtyDOwzi+royt106wvtEj53OOssh9QMUg
         51WwnGM3IuhQlJTFlwh8uAcsf2unMyLO+B/c3hNS+VR2uLk+Vo7Ar1GuyI5wPFCDuK8k
         ygAA==
X-Forwarded-Encrypted: i=1; AJvYcCWUPAkE9yqCQzrPMa3Lh3KJrg8zVwLSxA/83FlCThZ3NwiCo1/+qHS5gOpVXeXEhXVEs4cDcdqHM5F2nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpXaRvQHqxEPnlBJ3k+9RB5ngDM/Fcsdkd+DaL00UAn63MhFll
	DwKo16lyZpelCVmmzO2BIEAQSKoEA6eCB6fV8SRhwFRcOIUXwMOp4d+6qviSjMw=
X-Gm-Gg: ASbGncvW6AgkXnLgRAq0Mm0LuBCGD/El9gsz3gwSiFNbSV/SpJrs2hn5OmahOUr6tYS
	mXIwFEY0OYcps5cGhBhICTjBBhO3YGj6XS/7BsUPGvmnQuWXdvAvon3wMrr/qARMDBW9rmojYVj
	c+KVRWxqP1y6GlL5LeTHaenYq3n5AV5jugL57EyZWVOLKwWFaxH8v9FJev2TgCqM344vM+2GprJ
	K66Yd8MIzL85rdPIc3D2TY0HpQ8Dj9M8CEsIxU+sC4tyeDJSs94kwCCZnX7dACyjh/CZTGe/fzk
	E30Pn0DpP+Zm/Dt86ls3DiAfwQqWRfz5ZA5NVHU2ykW4LjyDAaSmdL4=
X-Google-Smtp-Source: AGHT+IFnLvRLZKvgJpx8dmK1OqS269EnZ/fW86sG/bu7Q2nxZbfcOX7ctDxWBsYaZVjqDvgkXox9sw==
X-Received: by 2002:a17:90b:4a8a:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-2f9e08003demr5011059a91.27.1738771268829;
        Wed, 05 Feb 2025 08:01:08 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:01:08 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 10/11] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Wed,  5 Feb 2025 21:29:46 +0530
Message-ID: <20250205155948.81385-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080109_759222_10086556 
X-CRM114-Status: GOOD (  16.55  )
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
index b5def6268936..d2e8ed70d396 100644
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
index b9e3f9030bdf..6bf5d63f614e 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -111,7 +111,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -EBUSY;
 
 	/* Get a new vector on the desired set of CPUs */
-	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
+	new_vec = imsic_vector_alloc(old_vec->irq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 5ec2b6bdffb2..d0148e48ab05 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -422,7 +422,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -438,7 +438,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -451,7 +451,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -510,7 +510,7 @@ static int __init imsic_local_init(void)
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
