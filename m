Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5A7C0219D
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 04:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExNMvzogq+Y0cOv/uWbNl1TVVYdSsbo39ahMGzB6e60=; b=OsT2X76DYnPURc
	gEk2ABa5XoOMpurHX8v+FA6Mu7GU4CqOop6rt3wr4G/xgsId/PVcV+UFaDFTHByZEd9x1OFfrjVD0
	D7nAnVs7DIHrYfPl2i6pMdsDLfJ1gIllb/gFWiiltjOapih/5ScomTg9uTrdB1in9AZR5Esd7G0nT
	dpZm3XT0oy+3b0S0+nla/WLMQpln0RlfcwsAoSKfFzN9a5Ir+Rk6iDosVtUQVHwPF4gRa/7i0ajwS
	6ipXKsAIPCUDt7KeQH1dTHN/PpjH+hpmwKt/xMoAvdQD+hr19m+DNT3w0BJoVw27gFkiSG2YnMb5Y
	0riM2WwGdm0rksU/BotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyzy-0000000E508-1JN7;
	Sun, 09 Feb 2025 04:32:50 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgymG-0000000E2hF-3paz
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 04:18:42 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2f9bac7699aso4843975a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 08 Feb 2025 20:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074720; x=1739679520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=TOi2f7YvdDCI1YjIVnHfKIIF8HkLUwjeIIZnsYt1FpeMDq8GS8dYcnqKnRrIxxllmv
         RV2RecWq4oSy5K+GfVEBYzmlw5t2YUzxVbU6XVk2e9zghV2XPoMr9WGwuBYdabjJ7p80
         Ww+phkPZCVkPhxdJoOE+/JqMKb1t70Kk9KIdZymLjV/WotyoLAaYiL01a9smS6DEn5zy
         qn6StW9LEDnkurjITnRdEMxJhC3CieCsW/a6F3rxGiCwO0TdWStFBS55ihQU1X1C2E9Q
         mIS/y7NvaXCRXhLPPfJlKDnbiDMMKrIrI7MALnXC6nteANOJRbIkc9EenfLs4/KDjsmC
         VQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074720; x=1739679520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=oqU7uNf5HH9hSFmMhBUZtIEo/ZMekcZ1FcGOFPhgEl6L+OzedSmyWDIhJpm89zyh2W
         dwJcKYGnTp6y+WRMQIBRvoQjAxSad+/kRJv4FfNsDvg535ANLLFnAG/upXtZ3KD1A1Vw
         jISNmSET6vqp4vkL6Qrrw7xy3E4l4Aj1o9sD61wK+WQ/4LuZX7iuy0hvSc07NMnpWoEP
         SeQ2qKPiqdkd8+0rn5xUsRkwzcsECNG8n61mhU7v6jsU0QVNd/b57wxYUCJDWTR/05cj
         nDDpiayTCJ6Sh9LEk+Uj5JrKR4OMssS68ieer/ecy5b9v7eanPnl9UyNMo3qYCk3Flip
         iE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX33L5t/ilrbeE82mMdbg1ivTC1ikoU1tAnrFjNc40Gu2d2yDfyXH8/xKe7a3x8NOR2hVq0vErTh//YrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkLGUszSkTeLKQ24kQO7q74dO1OU2ExoqP7FiMyO2dzEuJ8q92
	GroPIwtcdGuCNqreOUPYpv3SMp1m9buIylI8BPlv39ENv3iXOMRuuR0h7IOQod0=
X-Gm-Gg: ASbGncsmjeIPus1YKYUX4ehD9Tv4U6XJPlJS+FVo1dTobvmbFMrFa/IyhECG0nvnAyW
	RyCbZSH8DW01xgFxSO5JZ4vqPL+wbyC9f9DFSB6iFAKyWfIOozjj1d3n0M9aAFYF8t13JTbdsPS
	4/GS3pU/YCPe1qYSA7vYTfw1mI3CTz7XTFNq3IP/pJTpXhO7oKr2LD1BDeIVgRg88BWl895HTHy
	OnMICo9z5ZdXeVngW/PBLyxYFIy0EoLlRKHXvPOCigR+JPiD52scNnP/vui4QGBXdaGNCa/IrQE
	DYT3awOlwKM+KMCf99VcwahIoAs7qbVkIdbqBUuB77hwR0yGVAKSk8k=
X-Google-Smtp-Source: AGHT+IHUzy54yYs2fS4vJemZHOHOIs8APlSMaPpVV2klzUoQAT+FU5F1TyPBFlToppvPWeQiJJcXfw==
X-Received: by 2002:a05:6a00:949a:b0:730:75b1:720a with SMTP id d2e1a72fcca58-73075b1752dmr5977536b3a.23.1739074719968;
        Sat, 08 Feb 2025 20:18:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:39 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v5 10/11] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Sun,  9 Feb 2025 09:46:54 +0530
Message-ID: <20250209041655.331470-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201840_952494_B9E13FC6 
X-CRM114-Status: GOOD (  16.46  )
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
