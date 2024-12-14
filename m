Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74063E7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxWY7Ul6uBA+JZibfqvkkI14zABpBAm/jf7bUpt/zrA=; b=fDX8bCAlfLgDy0
	oE8HtaRR1dQB0i1GUQ2P6uD+kE4npGW1hiHSNEaxpf4N7uYunOF9XUVJQJ0phxkr8f4OvvpKqLmnT
	HqU9xj58Ux/Sfh/zMYhGl95hRL9dPfEfFb8+tinPCYT/G3n45S2dnoZ7clqO6Y4R2VLYTOVMKzkJR
	lbb36afbrZ0r/FCyGdyqEnpVRecIxyflwhX/P8RAHyN4n4InNdK8YGBlFRJGeIMTUQJW/Npg1n0gn
	++jnb1N2hBW29o70lX9Yv/srt75+AiRyrMoehFjLinV+hWrvFPiEI566biOLY1vpCxVHsDd6+XpOS
	aCtNhR7B3KJPY3g7lx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVwG-00000006gsC-4A70;
	Sat, 14 Dec 2024 17:28:24 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVu9-00000006gKf-2sZf
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:15 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso1959347a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Dec 2024 09:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197172; x=1734801972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBfvQ3kWrJIo4ZX2fO574K2xNLHLI8xt5fD3UcZCgGE=;
        b=O8ASwWDGJDQQglYqviY9NxmKvooU405TN3d6pn1fMaBaVeclms3nsKD4qOaRsm3z3i
         CW5Y57IKmT5J2fVE73dc//fbljsx457DTWisSecQNvC1khBi6ngS4qEvoQPatnYsqPuk
         QRlJC7UOdFRfPK+xOvfPO3M5NQ6y2kwYjoV04LL6zwGOgbA78OcrvqmLG2YpoAa61Zd0
         V8OEvlHxPdD/Qd1+vn+5mUeVKDzpxZSmV4AV2rE/kgL0akc8/T112+xqMrMRh/eW7/8J
         hPxstMIzKAVKKV7Wtn+/JHAaXpYA5GwYlSugJRkw8+6z2Mnhpq1E+OjJUkOucc7s9X8W
         3+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197172; x=1734801972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBfvQ3kWrJIo4ZX2fO574K2xNLHLI8xt5fD3UcZCgGE=;
        b=VTQ/eFrr1GXJHngd522UpHv/OqejekPChogHOCWN/DYB8FpSEau/i+k8WkFkFkwp36
         5d3IRV0CkYAE6dQbesNWRGYxFsAexPvyMqbndVvdwkmsRpRU6CmYwbEKIk4g6WcqCN9o
         wt38SrRWrYjwPWAGRddoTCqf9CRP9T+4d0IvW89AlOWzK9vOuHMWgVxTnY0s91OA/pzd
         iV688CeMVEPfO8yKoM6GIIBbzfYP88I2j7Pu84px3355AIbl7o5I4Lu8h7wVZcO+J7N6
         HNDYfqgu5qN71kYt8GxG0C2wdMQMNmDP14UF9+qTmRjoUEluJ3cBEaybvPNtOZNzP2VJ
         3kJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpVBNxv4eGKE4dqlM7zoyA6/En3dtk8QXXd5ylsL8NZQhLqRe/aQEbmGAXOTSf5fFkVkO6sMFfgtP7Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSiil+SbDjOnvdM6wIeIad881kT2zJoXt6+PhmVl1xIkPyoLhc
	onC+/r6tD6XmqR4WH3WWhL9XaS8wpSSwMijufSbcOtcZ9OyEnJE1A04FipYYAe0=
X-Gm-Gg: ASbGnctYP+x1MGkjHtktBtn/jh0aMIsn07GGzdH8LiuUMa+W0LRi4gn32c+S14rYpi4
	I7mvBO+kWkpj3KOrs5odhDHCIqeOzK33l8oEBOOgNLND0OjnuKIPElycFgGqKp+o5eG8JI6HezR
	GqUJQ99UOchhdqi/hZACfVAt7/irJ1hAsmHqgm96M7qlQRgOpwp+KqfbMy/N0cqDt2uY5KMAb/Q
	kcjJf/lSi51xToxJvgijF9g8RToT1vDVuJQK/65yLHs5lj/H40WMSQ+cC9uUBT0nSenmEZIsWqM
	tmnrllBg4upSOfk=
X-Google-Smtp-Source: AGHT+IHTs9Samt1nUdMUjND/qbDSnn282FzLK2X5JD8ULRiRDj00BeL2dfgDijLQRIK8XWPNIoxzrQ==
X-Received: by 2002:a17:90b:180b:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-2f28fb6efa6mr13056275a91.12.1734197172388;
        Sat, 14 Dec 2024 09:26:12 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:11 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 01/11] irqchip/riscv-imsic: Handle non-atomic MSI updates for device
Date: Sat, 14 Dec 2024 22:55:39 +0530
Message-ID: <20241214172549.8842-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092613_767476_2E602661 
X-CRM114-Status: GOOD (  20.94  )
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

Device having non-atomic MSI update might see an intermediate
state when changing target IMSIC vector from one CPU to another.

To handle such intermediate device state, update MSI address
and MSI data through separate MSI writes to the device.

Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support for platform devices")
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    |  8 +++-
 drivers/irqchip/irq-riscv-imsic-platform.c | 27 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 50 ++++++++++++++--------
 drivers/irqchip/irq-riscv-imsic-state.h    |  2 +-
 4 files changed, 68 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index c5c2e6929a2f..73a93ce8668f 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -77,6 +77,12 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	struct imsic_vector *vec;
 	unsigned long local_id;
 
+	/*
+	 * First process pending IMSIC vector enable, disable and movement
+	 * on the current CPU.
+	 */
+	imsic_local_sync_all(false);
+
 	chained_irq_enter(chip, desc);
 
 	while ((local_id = csr_swap(CSR_TOPEI, 0))) {
@@ -120,7 +126,7 @@ static int imsic_starting_cpu(unsigned int cpu)
 	 * Interrupts identities might have been enabled/disabled while
 	 * this CPU was not running so sync-up local enable/disable state.
 	 */
-	imsic_local_sync_all();
+	imsic_local_sync_all(true);
 
 	/* Enable local interrupt delivery */
 	imsic_local_delivery(true);
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..b44eb0b3990b 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -97,6 +97,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 {
 	struct imsic_vector *old_vec, *new_vec;
 	struct irq_data *pd = d->parent_data;
+	struct imsic_vector tmp_vec;
 
 	old_vec = irq_data_get_irq_chip_data(pd);
 	if (WARN_ON(!old_vec))
@@ -115,6 +116,32 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	if (!new_vec)
 		return -ENOSPC;
 
+	/*
+	 * Device having non-atomic MSI update might see an intermediate
+	 * state when changing target IMSIC vector from one CPU to another.
+	 *
+	 * To avoid losing interrupt to some intermediate state, do the
+	 * following (just like x86 APIC):
+	 *
+	 * 1) First write a temporary IMSIC vector to the device which
+	 * has MSI address same as the old IMSIC vector but MSI data
+	 * matches the new IMSIC vector.
+	 *
+	 * 2) Next write the new IMSIC vector to the device.
+	 *
+	 * Based on the above, the __imsic_local_sync() must check both
+	 * old MSI data and new MSI data on the old CPU for pending
+	 */
+
+	if (new_vec->local_id != old_vec->local_id) {
+		/* Setup temporary vector */
+		tmp_vec.cpu = old_vec->cpu;
+		tmp_vec.local_id = new_vec->local_id;
+
+		/* Point device to the temporary vector */
+		imsic_msi_update_msg(d, &tmp_vec);
+	}
+
 	/* Point device to the new vector */
 	imsic_msi_update_msg(d, new_vec);
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b97e6cd89ed7..a8645084bd8f 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,21 +126,21 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *mlocal;
-	struct imsic_vector *vec, *mvec;
+	struct imsic_local_config *tlocal, *mlocal;
+	struct imsic_vector *vec, *tvec, *mvec;
 	int i;
 
 	lockdep_assert_held(&lpriv->lock);
 
 	for_each_set_bit(i, lpriv->dirty_bitmap, imsic->global.nr_ids + 1) {
 		if (!i || i == IMSIC_IPI_ID)
-			goto skip;
+			continue;
 		vec = &lpriv->vectors[i];
 
 		if (READ_ONCE(vec->enable))
-			__imsic_id_set_enable(i);
+			__imsic_id_set_enable(vec->local_id);
 		else
-			__imsic_id_clear_enable(i);
+			__imsic_id_clear_enable(vec->local_id);
 
 		/*
 		 * If the ID was being moved to a new ID on some other CPU
@@ -151,26 +151,47 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 		mvec = READ_ONCE(vec->move);
 		WRITE_ONCE(vec->move, NULL);
 		if (mvec && mvec != vec) {
-			if (__imsic_id_read_clear_pending(i)) {
+			/*
+			 * Device having non-atomic MSI update might see an
+			 * intermediate state so check both old ID and new ID
+			 * for pending interrupts.
+			 *
+			 * For details, refer imsic_irq_set_affinity().
+			 */
+
+			tvec = vec->local_id == mvec->local_id ?
+			       NULL : &lpriv->vectors[mvec->local_id];
+			if (tvec && __imsic_id_read_clear_pending(tvec->local_id)) {
+				/* Retrigger temporary vector if it was already in-use */
+				if (READ_ONCE(tvec->enable)) {
+					tlocal = per_cpu_ptr(imsic->global.local, tvec->cpu);
+					writel_relaxed(tvec->local_id, tlocal->msi_va);
+				}
+
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
 
-			imsic_vector_free(&lpriv->vectors[i]);
+			if (__imsic_id_read_clear_pending(vec->local_id)) {
+				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
+				writel_relaxed(mvec->local_id, mlocal->msi_va);
+			}
+
+			imsic_vector_free(vec);
 		}
 
-skip:
-		bitmap_clear(lpriv->dirty_bitmap, i, 1);
+		bitmap_clear(lpriv->dirty_bitmap, vec->local_id, 1);
 	}
 }
 
-void imsic_local_sync_all(void)
+void imsic_local_sync_all(bool force_all)
 {
 	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&lpriv->lock, flags);
-	bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
+	if (force_all)
+		bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
 	__imsic_local_sync(lpriv);
 	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
 }
@@ -190,12 +211,7 @@ void imsic_local_delivery(bool enable)
 #ifdef CONFIG_SMP
 static void imsic_local_timer_callback(struct timer_list *timer)
 {
-	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&lpriv->lock, flags);
-	__imsic_local_sync(lpriv);
-	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
+	imsic_local_sync_all(false);
 }
 
 static void __imsic_remote_sync(struct imsic_local_priv *lpriv, unsigned int cpu)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 391e44280827..8fae6c99b019 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -74,7 +74,7 @@ static inline void __imsic_id_clear_enable(unsigned long id)
 	__imsic_eix_update(id, 1, false, false);
 }
 
-void imsic_local_sync_all(void);
+void imsic_local_sync_all(bool force_all);
 void imsic_local_delivery(bool enable);
 
 void imsic_vector_mask(struct imsic_vector *vec);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
