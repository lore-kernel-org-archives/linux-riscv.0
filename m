Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4B2C021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 09:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yl7t3/Ns+wjb7+1KXDSkJHPP2T143tdRSDMzb5wswrU=; b=CHIUqP/tWYbqh+
	s8svzJV5PARPhLUPHNYwtrksEfTsuaDSYzaaOhv2PTs6Li3N2mnBLE6iHaKso7Bj8bTOVwLVf2mbo
	7bdDBID5f88OWTMJ1QSuhkliNnJ62xBFdx6RGrBz8t0Cf+c+SBggVnX6c4N2dqYB+HPx8B1i/RAfl
	9sarzVzma/ATuTcrtVnMh6CKyY/XJM2ke0H3+PYOiRQUDca4JmQXmP3uLcTl0ll4T8QtSZnjEKRBD
	JBKaeRdUf9GwJAbh7X2cMne5QKGgU7SMyhthY+0W2bDOJxiuYfYz2G9iPyw1aLYVtEDyvt+XvuH01
	n1lryILkGMBMYoQ0tLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxBK-00000003tFv-44Iu;
	Mon, 17 Feb 2025 09:12:50 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxy-00000003poj-2BHg
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:59:04 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2fc1f410186so5455984a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782742; x=1740387542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koCL3sGSNowxnA2uthh7D1mm9ult5obqPLO5TypzPmY=;
        b=PH00+nYQ6Vf3D150ksjsP5miu5HL/gVaiAwwhUb0YGdBcokD52Y6S/2NN5b4d6cxfa
         vyuM/9npvGj3mS6yckbFm1LDjL1+5oOyW+Fyl657gEGYs9sD3uc3+N5Ci0DukW1Se6k9
         XVMBzS/stz0PmoZGmoR5jsLIjMvl1amXoB3bb5Q4j67hBsAe2oGVty0uczC7sACEWRLr
         pXsZA/dSD3pQvGdxLQM1veB+1vzV2NjkrwNGyBBkipAJSpXF0wtf4ewI4FWglnPmqs1C
         q83lG9SF3rwCI2RYaDUe5WHn7VRllFV+JIbgxt2TuJ/sTdLye3WoHNODypWmsTXicVI9
         YM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782742; x=1740387542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koCL3sGSNowxnA2uthh7D1mm9ult5obqPLO5TypzPmY=;
        b=VvPl9Cs1RHOSkvuaAHGN8Ty3cqLt6V3pzaVNWXQruNiX5Cu08x1L2QxtJL+u0vFfWW
         61T3Dl2IOtAE3d2F1iW+P1NF4i8k7s49kVhl9tj0NzkoalWvIacUdrKBEtCQ4sKh1hCu
         ZWq3cjiZ3aDVOeo+zSwgKxEBYHFVuoNo2ni+aQYScQkexzWKAFWYlbNQB6+4ZUjPmw1u
         N6gzg9M8ZlBzS+VXix7882cYz5Akz2nQ0cGuFYW5J/pV4uIZyEoH1xFW5u733ZMfOsGC
         EZUDmfYpexutdoHtjPrEbzfiM6WPsKZRhX3rpndqnKou5XPiBXLgBRAc5Io/xLg1gdky
         0JFg==
X-Forwarded-Encrypted: i=1; AJvYcCVEfNUw4Hl81BgzdT+xN+aLZRvhbXW8cLOEtVlP99OsbdI/Xb7Hs/+A0VA8FFFqt7SbELndB+DwCySbXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6e7HafRN8AqJp1JfytRYt2Uot80Fx8/UQGRofe0t46Tcw61Dg
	4MlsWxDtkXh+QrNUMjtGu8fCpguJUYKsf3sPNh+gI7HqX4i7rZUAZ0t0n6uvkCo=
X-Gm-Gg: ASbGncuvWvMdHzrtKg99M1b0IoYrzHK+3FgnoGgSjXF91zMoef5VHhHrt32POQAbOlE
	ijnRG25piGVFY88oHbOJ/FSdlz4IjaIag3Icb3mlh21awzdLaGmr7oPWK79MSwAFx67dD7+07Vd
	4GhuHKfN7MJ72a5Y8AQdJSPUo+TelddAiVHVFtbxOFy7mBL0tCt04dlmf9n06eaqjJipsWoG3Dq
	m5PLXvWbjLgROt4wSDGC7IqjSuGBKGuDlzK6R8S5yiL4cAXqJiAJ9elPI+YyBjC55c+iQPQAsgZ
	vxTTApEWJhYoxfjuCqGt3m9e5D8R7A9HuQC0wHkp8E1karA4mCztIK4=
X-Google-Smtp-Source: AGHT+IHbBvzPw0Wn7/Eyf5Y7dSkIAJVrU71JRxh4insgq9Beex3YYjwNlgnCYaOLqfIHDCH+B/xxjA==
X-Received: by 2002:a05:6a00:4fd2:b0:730:949d:2d52 with SMTP id d2e1a72fcca58-73262158ademr14543775b3a.3.1739782741534;
        Mon, 17 Feb 2025 00:59:01 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:59:00 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v6 09/10] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Mon, 17 Feb 2025 14:26:55 +0530
Message-ID: <20250217085657.789309-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005902_558616_08840C6C 
X-CRM114-Status: GOOD (  16.69  )
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
index 553650932c75..d9ae87808651 100644
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
