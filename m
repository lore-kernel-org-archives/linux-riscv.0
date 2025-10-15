Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD994CCD1A1
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 19:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kT2vQ7rOWNN5LGleS1MtrUQDiaanV2iftleFMVgyZNg=; b=QYadh1KVBf55Mb
	MjYHyf1JflhjckcyeId2ADhn4dYQvCDU4CEi0OFaK9mfw0DvClu4VJbeexpd+Sdfd37IyXV0y7gNu
	5Tj6hSFZKqGw4dpgGKMNyLiFP0nBDZtc9N9T8CEIuNDBXDRweLe+X3bXsPZNn9akimGhr8GMMjCaA
	/x643oEnOdObzuBCYzGk7hvhW/InQ47BHevrPD9q1bwzWjyEn9LKjMhP7Lfl0TwMWDQlgKaL8EQTI
	Ip8U2JATtZZm9X9FkXBLOMZPIKyckbiAL8xGTz5JtEkuJ7UrOo8o7nmgRMmB4bzJROb7qXXjvOM6f
	DmgZntK1QmewfuHu2oSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97ce-00000002nhV-2ymS;
	Wed, 15 Oct 2025 19:57:20 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97cb-00000002nfG-3kCI
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 19:57:19 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so10754b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760558237; x=1761163037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1cXGjl5LALpTkEmKF1wH+9n+RdSexytoXIs7SXyiuk=;
        b=boM6vOWVK3KUgvKBFH9tYiUeJT03+ysb6OZlJud329peD2cWnlqwLflV3SqzXMS0YJ
         NlmUuh6aGXwUd+/ICPzVrWmEHEClBYYS/uHDdP7Baz64Jaiw3oYMG6/M2d9A5BkAaaCj
         w4nheM0sI3F8T4PSDTJy6xao4qgPDUNIqPNNinBWaOC5YF2oG41/Xl+tIUyAORme5WZa
         JqnKFfsKEYOSSv12Gnl5jlSJH74LObOiESLR6lfI8CNgmcnpNA1oyUHosyBDmNv7Ag+C
         4IZ+FhTST1x/HoOmVfvxuCQV/z3nMYa9YKcoYRyUCMG4G30NvIGCdu89vTX43wNpVZLF
         OYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558237; x=1761163037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1cXGjl5LALpTkEmKF1wH+9n+RdSexytoXIs7SXyiuk=;
        b=rh7vLHN2cz1moRHIx7ZL6lBteFINcDb+ft0elY5TcadA/e2iuoBQj9hD9tTX+qiSg9
         9sE2gBj35q/PcPwaLhpNW2p2hIa7ZZEe8aZiNNuulnvZYE2zJM/kHyv/+mTKw26H+OGT
         4s0SgkihvVuLmGqO3+b9A1g3h9G8O/mAuT/egJ30GOVkzkBdOJkPmk/89CKhQYEhI4Yp
         H2MpSjd0hCQCrulfydekqybZ207nJlnOOlDAmNLO5dfUGnRBxEWEaDfR/z80qc6P8C/H
         UAnF/7Bx0kepXGdUZuOzcO0e+nEL0+WTP0dGhOfVfuDwjq1avqq0mFgcsQTj/v/R2Izz
         1vXw==
X-Forwarded-Encrypted: i=1; AJvYcCWn+MXOcBMre6hpcxLJo0o6veOV4MRUch3syCuI+OWbynAP/gJC9EDBbZQtxXpke0/H3KZYk9romXqW/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWnWIxzo/HQdsMXm8IP2N/KhdZtcBbiKyuewAJmKe3RaUI6Px8
	DXWnusjptpzHbx2s4nUZtjj31BUIbz+v8QvxTOkBWOYxaK2rhukfk8IuRXHb7XtIMpY=
X-Gm-Gg: ASbGncv3ThEIqbW5V/D9mqZJPhvoSdqRQq5neYMlqh0uryISiydeZbVzlbXt1rK6nls
	AFqzBAfheiPH9mbLrYKC3eZWTTqDDkSZ4IwWO0a53v4ldkWZM7gYxCofbZBuckeZ8jkfAQV9+Z/
	x3YzMOSrhwXncJ4Dz0XYixFLEcMqDE6dFRutYxkzcNdhGz1WR5rcyaqXfW0kkMnoxPZMRuPr1pr
	dl9OD4REQjA8mIYElp2nFAQXxTo+xFc6SWQ/4lrsSHBs1yX6NUJMuJrFSwARPhBg5JEkHwCOAiL
	KwKSa/frBivM/7F/nbbGYiudeJBjgYXijqYzgvr7YCav2WvghcF4mJ94RROh6ALaJpXDP+mIPBb
	pXwP2XbVKtua/SsDBSLs7S58QYapeeFic+z7Am5Qrey2V5UHaXay3ml+tVhF+xmqBPtnI2T+s2Q
	==
X-Google-Smtp-Source: AGHT+IFLZrPjORuUwaeRdJWDWHubXFyOAKctiPm3J2eMbE7qpSS37pMYp1CngUyq68x7ODSrNq0gxQ==
X-Received: by 2002:a05:6a21:9993:b0:2e4:9004:530c with SMTP id adf61e73a8af0-32da8206d98mr40544884637.17.1760558237119;
        Wed, 15 Oct 2025 12:57:17 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b06075fsm20151322b3a.17.2025.10.15.12.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:57:16 -0700 (PDT)
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
Subject: [PATCH 3/4] irqchip/riscv-imsic: Inline imsic_vector_from_local_id()
Date: Wed, 15 Oct 2025 12:55:14 -0700
Message-ID: <20251015195712.3813004-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251015195712.3813004-1-samuel.holland@sifive.com>
References: <20251015195712.3813004-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_125717_939050_A4B7BD0B 
X-CRM114-Status: GOOD (  13.81  )
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

This function is only called from one place, which is in the IRQ
handling hot path. Inline it to improve code generation and to take
advantage of this_cpu operations. lpriv and imsic->base_domain can
never be NULL because irq_set_chained_handler() is called after they
are allocated.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/irqchip/irq-riscv-imsic-early.c | 11 +++--------
 drivers/irqchip/irq-riscv-imsic-state.c | 10 ----------
 drivers/irqchip/irq-riscv-imsic-state.h |  2 --
 3 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 2c4c682627b8..6bac67cc0b6d 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -91,9 +91,8 @@ static int __init imsic_ipi_domain_init(void) { return 0; }
  */
 static void imsic_handle_irq(struct irq_desc *desc)
 {
+	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	int cpu = smp_processor_id();
-	struct imsic_vector *vec;
 	unsigned long local_id;
 
 	/*
@@ -113,16 +112,12 @@ static void imsic_handle_irq(struct irq_desc *desc)
 			continue;
 		}
 
-		if (unlikely(!imsic->base_domain))
-			continue;
-
-		vec = imsic_vector_from_local_id(cpu, local_id);
-		if (!vec) {
+		if (unlikely(local_id > imsic->global.nr_ids)) {
 			pr_warn_ratelimited("vector not found for local ID 0x%lx\n", local_id);
 			continue;
 		}
 
-		generic_handle_irq(vec->irq);
+		generic_handle_irq(lpriv->vectors[local_id].irq);
 	}
 
 	chained_irq_exit(chip, desc);
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 9a499efdebe3..385368052d5c 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -434,16 +434,6 @@ void imsic_vector_debug_show_summary(struct seq_file *m, int ind)
 }
 #endif
 
-struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id)
-{
-	struct imsic_local_priv *lpriv = per_cpu_ptr(imsic->lpriv, cpu);
-
-	if (!lpriv || imsic->global.nr_ids < local_id)
-		return NULL;
-
-	return &lpriv->vectors[local_id];
-}
-
 struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 196457f1bbca..6332501dcbd8 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -95,8 +95,6 @@ static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *ve
 void imsic_vector_force_move_cleanup(struct imsic_vector *vec);
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
 
-struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
-
 struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask);
 void imsic_vector_free(struct imsic_vector *vector);
 
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
