Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5EEE7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 17:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVK2WMLl578ns/6ZZhfHZqq1tBVmuVO0g3utRCtkI20=; b=n2GyXjr8JLTkIq
	DbgMM8yI8lgcAdYH0Td2NAvUW24Q2uAXidx3OgW7jqXIhsfoKktLm7Q7U6WzKE8w4Tnn1Rt9ND+3i
	/HbRx/eLxLozeM7yqCIfGNFcw2oozgspMWpG/WDNBFVLVtQq+p2aWUzQsawvYpJm1LkraaO9ioQyW
	Frrq46+K11l0xR9aIN0b5W56mq0Chebxq5UA4KyoArcXL2b1i6v8mQv6c+Nn1tyI1wA1SxNoXIIAK
	uxugLA16o81wdD+9mRTICUHV5Wjtg4ESRoTtHN0rW8SwAduJApHxwUHWXXBDuewuxf70eW/drIjJs
	Zce5st6mzF/ofIs6kIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMW3h-00000006iPv-27yo;
	Sat, 14 Dec 2024 17:36:05 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVv1-00000006gXp-3aNm
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 17:27:09 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so2457007a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Dec 2024 09:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197227; x=1734802027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8c4bSx6OeCafE/EjjWkj4NBjcuAlryx7NpTdvjZLKQ=;
        b=DyAQGC6PrV0cyPA1tAoa/aVyJn3JyNZBq6b7tYnZ3lU/vAI0vuV20DyBdUHfMh3mb0
         +GpIyUwFapPXO6ekwmmMal3LPBJkP1ItZxiVrylcDtcoEHVFgB8xmr6CzBFzHaGUOC80
         lLhoAvDoxE22t+MatTzrdCWo+ELJQns2uR8WPmB5BM2F+prjTV9IVEBv+4L284ggNReJ
         jD19Y20SGW+xtx6SZOg3EcylqCezHH0n3ddlFbXLRQEWCT2jG2GrxH9ni0ptaUNX5jBF
         NFpywYxu3obOLI6HwbAhaRVA/SZMhdtMcjTQuI1Bk1mREyiiC+PWYa9wwHTWZ/QjB3Kr
         XR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197227; x=1734802027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8c4bSx6OeCafE/EjjWkj4NBjcuAlryx7NpTdvjZLKQ=;
        b=gPdqY1+VHVhJuojOzoWzfhEWyJpBhbfRISLX7im//iapbUfPFBbhL9gR+vMK7PHZqe
         QRWdqZSzdboSTZu6EoiS6gd672JmBfIR3A3XPHrEACHoN7jLJLVXRiWQMxo8TCZLNhri
         oAHsXwpkZAXLGNXRPHgPOpLSpE2ES1YdFXQnphIcVZQb3F5TWx3EE9WLrbi7dFWCW0nX
         Rlk5IAInRD3aOPY0oKK3Op/s8vYA4DLKYdMrB64s0Q0O6rEpHiaGH50m1IHSbOW7KBND
         3mKoC+DX0cyNBHU+vje5r6zTeIDe97OV++mxx5bCzOClVB7lx+/DxTcxH0sJVd8mGOaz
         kfQg==
X-Forwarded-Encrypted: i=1; AJvYcCUVzJkBKjs8N0Xfc65iaINPyZCVyTWGTHORQcn6grPPUDs2WGtNbxIu0vfMKmBFYOzJ+xAsJcQRA01V3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YweEHzfQfdcSeKjg68k5gbhGiptkag/G9LNd1Va6Y7IPqycZtnF
	Wq+q9bwvbTV0FpdMrQKZsWZwDv4WyLcGm9AN6aRRNcA2PIQ20QQzWzjlSCDT0MI=
X-Gm-Gg: ASbGncsZ6OGhFtEA6bBs0pc4U9A3tvyIDDr+XKKmdz0Uq+0OlDD0IvAurraiM5HpF3Q
	IC1Q9R31Gzpu+l3JbSpC0L0FPfyZceCd/AnasdUTf++HujGQzWdkn4HPUUodIu1dmyc7E4r+Rqd
	BMvU95utRkEqR3274BFIdwHjR4YwMUvuKZZS+noutFVpDHR4Kw1hOngmXC5L+IHb8TAWHBm3/FS
	CJ+eQ6h7fmROBzkYoO++/gK4zyxvqQ/ETHgAlQpgP24uRAxVUV7POLl8A19u3j5aD6314OgQFAD
	/2TODWt9Rhuh78U=
X-Google-Smtp-Source: AGHT+IHUcfTVYGQvMkfUU7jHBszvrCcnJgKMrSzxBafo9cGQC89Lrd4GQaGCXdK1f1d1ktL3gp5V1w==
X-Received: by 2002:a17:90b:4a4f:b0:2ee:9902:18b4 with SMTP id 98e67ed59e1d1-2f2900a9878mr10311790a91.27.1734197227250;
        Sat, 14 Dec 2024 09:27:07 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:27:06 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 09/11] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Sat, 14 Dec 2024 22:55:47 +0530
Message-ID: <20241214172549.8842-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092707_927800_1FA6AD28 
X-CRM114-Status: GOOD (  14.64  )
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
index da49a160ea09..c915a5cf4187 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -323,6 +323,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
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
