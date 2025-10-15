Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35385CCD195
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 19:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xt1zLmlGWUsZI4KpuCxsVaI/W0n8/1q16yr4gmk8Ejs=; b=d50mHlSowq0lel
	/np9bsb+woBCVNnjFJs8CCGAXGGlHCW1fDkpIZ0jPRGuYxggBjWq5v0lhVpTeyJIICvoCmii2T25U
	GkNJHGg5xgt4kUaDDQWbNljxmDNSXifnjX2XiSPNvqRT6+yJLBpeAUjpE7yrgFbpa7mMcqzaKPELD
	GWW2ycFlRhlwnuazRt2H4R6XjEpT9yo040oReS6dSos0WTDXsKAjPpdwU+3Tkfdz/r3Js27EQY8kg
	pmnuuTNaHUoO8O7ThiN9/sPq9q99bWnj8UfZ63eVgnFrzuLQlk5hFJYnd+0NeBsatdeRzCCLIvu3Y
	4WqJGpoPnY8vWs3UntBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97cf-00000002nhw-04C3;
	Wed, 15 Oct 2025 19:57:21 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97cd-00000002ngI-0auC
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 19:57:20 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-77f5d497692so14612b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760558238; x=1761163038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+g8lhoHRY5Iwc3gNxWC8a/yM7D/uKYdnjVnSP6JGxc=;
        b=LHP5ADVMyGbfYpfs3kK9v8bbw8i2Z6TrebURvPRQkCH+GE8HBSmpiRqk79IZ4yLuAu
         IcsxQWkk8A/pJjOqew0IKgl3UCTHcGnacQ5y/Xphhk5qZ1FpE/w5HRcfI22VVJpKXBrS
         PUgRR64yOAwGqi6Mk0ZgmhjNlmLWjU5g+jbWIbAT4nLkqpIqWEyvz16ov41wtNMBsb6+
         TBLPOA3lU7WAS4jmLPkiub6M1pKWgqCI3QXleoqiZWGCtzWDZmsoWYcyrXIwf7bENuz4
         NDZzAFg2iG9Og08SKQjXgrW9UMUhaLNlq/B8wTSO7kXwH/Qq0WR8twpNE4Vm25XDq4qH
         GKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558238; x=1761163038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+g8lhoHRY5Iwc3gNxWC8a/yM7D/uKYdnjVnSP6JGxc=;
        b=FyW2Cd1moGRZtccTYlS/QhjZPDopScNTfwvnFY6SaJdCtGwtRed39NTgqq891EE6jz
         T5OPLwDlEZXrSuhWangb5ve/4F9oS4M1bhjLEOH/ulhBp4z8i4xDIQdBNvw1x2Bh5rDo
         jDjcSDwxtkz7rHZg11wXTkag8PIOgZiQheelPTV1aIWoSGpwZIsm0IrTCX21f7md75pe
         I5USDMHDCaIIqAt87QGLS9LW8gtiGEN9HvPZPIRmq+VPjshBk4aAqVFoGpna+N2KL6ka
         sT6Wy2E4YoXP6NTYq4cjvRsFnDyNGaWFoJUBcAYnYrfVxXAbEGaxPUejlbImMkuT7CgA
         tMtA==
X-Forwarded-Encrypted: i=1; AJvYcCWTiUWe721EDrtsmszvWTdLuVzO0y1gyKl3K/ukW1h22ixH6g/OW+5rtMle4f7Abah7uwpy9uTb/B9f1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx29yvZe31URFTPK61Gg6U7rNoC/Rz2I6iV/WB5rSbheYpbr9Ac
	XzVmRQIFZzr3HYY4zuQC36jrkA6R17jH7qOtqtXnVFkYg3uOALaoA/89DklKKlGCEvg=
X-Gm-Gg: ASbGncsLVHuqrT1Ju2Oi8pwhitsYCvvI1tlocrOe2yTUWA+hQmbNWvPrBsokn3Bh51V
	KS2hxpid1TvqYHsPsFqjVtARxBNhiXu+B8e2DSIbWrtenv5GGPNs2vh/JKYOxecnNzS2TaFLXo2
	YPrCqI2bcltv/Znp8Tk8JOjV/PwBjmNVKT4OCKSDU57OgmANYwpMCWoPJ4ffBHZAZL5fTj/cXnc
	6qWYWjYOo1bb0DLcRugQ7doUDYUQwjsEuzAdQ0nq8Q/eNXDmbFaqDZRbHJD4nBlz8sA5BZfSNPp
	qnllI8Cn3z4cSyrdeuQcd7KElHhUvOS+EMHzAtFFwbIeu/KoACw1j0fb0WHKtXhEurkmQ0Tngzz
	Hrhg9TPgKBoSU9QcRLAMjvAQS4W608gae8scAIAsh9qeLwR+tDaJPzVcuXblBg+u9saTosVr/Fg
	f9ytrLAUWdZ3ouy1d435gbSg==
X-Google-Smtp-Source: AGHT+IEKQ+uDEI7W9I1l+VaCyNVgX9OC+Z12nOqaxOeClud0KyIU0We9Y4LSjxHB28Nwak6ZUg9h4Q==
X-Received: by 2002:a05:6a00:2e13:b0:781:1771:c12c with SMTP id d2e1a72fcca58-7938269d8b7mr37200981b3a.0.1760558238577;
        Wed, 15 Oct 2025 12:57:18 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b06075fsm20151322b3a.17.2025.10.15.12.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:57:17 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 4/4] irqchip/riscv-imsic: Remove irq_desc lookup from hot path
Date: Wed, 15 Oct 2025 12:55:15 -0700
Message-ID: <20251015195712.3813004-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251015195712.3813004-1-samuel.holland@sifive.com>
References: <20251015195712.3813004-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_125719_199107_0C05B975 
X-CRM114-Status: GOOD (  22.88  )
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

The IMSIC driver uses the IRQ matrix allocator, so there is an arbitrary
mapping from the per-CPU interrupt identity to the global irq number. As
a result, the driver maintains a table of vectors so it can look up the
virq number during interrupt handling. The driver uses the virq for one
main purpose: it gets passed to generic_handle_irq(), which then uses it
to look up the irq_desc in the sparse_irqs tree.

Taking inspiration from the loongarch AVEC irqchip driver, skip the tree
lookup by storing a pointer to the irq_desc in the vector table and
calling generic_handle_irq_desc() directly.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/irqchip/irq-riscv-imsic-early.c    |  2 +-
 drivers/irqchip/irq-riscv-imsic-platform.c |  7 ++++---
 drivers/irqchip/irq-riscv-imsic-state.c    | 10 +++++-----
 drivers/irqchip/irq-riscv-imsic-state.h    |  4 ++--
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 6bac67cc0b6d..f3afcfa3242d 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -117,7 +117,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 			continue;
 		}
 
-		generic_handle_irq(lpriv->vectors[local_id].irq);
+		generic_handle_irq_desc(lpriv->vectors[local_id].desc);
 	}
 
 	chained_irq_exit(chip, desc);
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 7228a33f6c37..89618d2791c2 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -131,7 +131,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -EBUSY;
 
 	/* Get a new vector on the desired set of CPUs */
-	new_vec = imsic_vector_alloc(old_vec->irq, mask_val);
+	new_vec = imsic_vector_alloc(old_vec->desc, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
@@ -225,13 +225,14 @@ static struct irq_chip imsic_irq_base_chip = {
 static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				  unsigned int nr_irqs, void *args)
 {
+	struct irq_data *data = irq_get_irq_data(virq);
 	struct imsic_vector *vec;
 
 	/* Multi-MSI is not supported yet. */
 	if (nr_irqs > 1)
 		return -EOPNOTSUPP;
 
-	vec = imsic_vector_alloc(virq, cpu_online_mask);
+	vec = imsic_vector_alloc(irq_data_to_desc(data), cpu_online_mask);
 	if (!vec)
 		return -ENOSPC;
 
@@ -239,7 +240,7 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
 	irq_set_affinity(virq, cpu_online_mask);
-	irq_data_update_effective_affinity(irq_get_irq_data(virq), cpumask_of(vec->cpu));
+	irq_data_update_effective_affinity(data, cpumask_of(vec->cpu));
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 385368052d5c..f37800da3746 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -179,7 +179,8 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 			tvec = vec->local_id == mvec->local_id ?
 				NULL : &lpriv->vectors[mvec->local_id];
 
-			if (tvec && !irq_can_move_in_process_context(irq_get_irq_data(vec->irq)) &&
+			if (tvec &&
+			    !irq_can_move_in_process_context(irq_desc_get_irq_data(vec->desc)) &&
 			    __imsic_id_read_clear_pending(tvec->local_id)) {
 				/* Retrigger temporary vector if it was already in-use */
 				if (READ_ONCE(tvec->enable)) {
@@ -434,7 +435,7 @@ void imsic_vector_debug_show_summary(struct seq_file *m, int ind)
 }
 #endif
 
-struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(struct irq_desc *desc, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -450,7 +451,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->irq = irq;
+	vec->desc = desc;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -463,7 +464,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->irq = 0;
+	vec->desc = NULL;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -516,7 +517,6 @@ static int __init imsic_local_init(void)
 			vec = &lpriv->vectors[i];
 			vec->cpu = cpu;
 			vec->local_id = i;
-			vec->irq = 0;
 		}
 	}
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 6332501dcbd8..a09dd140461b 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -20,7 +20,7 @@ struct imsic_vector {
 	unsigned int				cpu;
 	unsigned int				local_id;
 	/* Details saved by driver in the vector */
-	unsigned int				irq;
+	struct irq_desc				*desc;
 	/* Details accessed using local lock held */
 	bool					enable;
 	struct imsic_vector			*move_next;
@@ -95,7 +95,7 @@ static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *ve
 void imsic_vector_force_move_cleanup(struct imsic_vector *vec);
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
 
-struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask);
+struct imsic_vector *imsic_vector_alloc(struct irq_desc *desc, const struct cpumask *mask);
 void imsic_vector_free(struct imsic_vector *vector);
 
 void imsic_vector_debug_show(struct seq_file *m, struct imsic_vector *vec, int ind);
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
