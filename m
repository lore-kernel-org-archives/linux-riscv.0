Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74870C02199
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 04:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYkGQtD89YXF5oo41GUIndlRaba6DKliLoofi/hRVSc=; b=0a/tMHa+VDPZF8
	grKbjONjv7j25JY/SjrlyWy6K5SwJcZbiOoUrOA1oWPEcDpQ/JAGjpTG2wd7Sfg4LkaiahmyytxkB
	b2fVBwizNTQL9ve27SYMpAns+7EFcCEeOsTcPJMp+xoXqtfLjB1vgHlfhsjn1Etd/FU4DZ1Tm/VPp
	Ul6W7DV/hWlHTySyWCzHhIJxxCtL03Eeq+mob1iiivI1lHqmwey4cRz/KhUrEaFumzTjS+J5ymacN
	hyXxHXo6FiPTcbWzpj/Chzqmac0mCwFCxbQePE70P1dnuwh0B4SKqbmwuMDHwhF4P2i0Cv/ERm0ZC
	U7ev3GSrAJdQ36YuBMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyxG-0000000E4bC-0fiO;
	Sun, 09 Feb 2025 04:30:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgym8-0000000E2eR-0lks
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 04:18:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f5268cf50so26802215ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 08 Feb 2025 20:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074712; x=1739679512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=GbtDVINbpEfX8FglJJetZ8ZfLA/+Sf8zkwhN8rL4+Za8TsXPOsM3IPokkgpKAWGuL8
         U6OAiEVDGia0Wr5GA6yxGdVaOZbtbLVa8yu5k/wa3yuvOgJ/WXXC3JM8Mp4BayhCCOlj
         yoZ21NXDFPsuHqE+/6X4tcUOkSUw9bNq/TM2r/wwGHZg9u7wkWM0XjGuejKoLn+UKe3J
         uH+E5clDWfqS5KgFrFJE3oHj1xz2KGzM00VA6SLrYvQWTJavKOjA3isrhoPTHIJuWcQc
         ijjIaHZJ/95PFFBE/keBI3zYaWTpE03B/lDd/0KJ+k/Ipeu1I6lCvfGcXIVYCwacdHjN
         oNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074712; x=1739679512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=wUjhP3TTdTUVYdTmFxFwZuIs842mEiSYiywdwf+fLXewGMPa+/r6Rrd68JK4PX3b1o
         BuQwvWI4xAKQYhQYM9WFHkErC2GBZfL58qeQZ+tpr1i0gB/huwy9VnybIwYK3h5l1gYm
         IstM5FU9c43FYgqjfdkZzbqR2QoQQcLzmKk42BifHp5dbAECGpoWkA0BJQ5h40rcgG6C
         b8maZSiXdRgG9TD2axtV5/4IRZZzZm38CGaK+RIM7eXh+Udgpv3N0LuorqndO9FfhSUs
         jNv9mQSmbW1DVmEapu1Sobl9FDuBUnHvQXdGGxyAZAy9MJF0UKYJVosoZ5/fI3GcB1FG
         w8zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+4CDnGdEsv2SwWVjidH224R3LQtZCZczWhD4YJrxTslGP81sZkw7+BYwGbwEjin+VLTy3UbcCktQdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaCUmtn5MVVg5EJfQJVjYaat+79Q2Xz84GSRxOa35ypOKnzZGC
	Q68Od2hPRVLi09ruaXGZpoPClBuVzI7BkphJqlFDOwpPjYQzAkDvcypoCM++yiM=
X-Gm-Gg: ASbGncszQaMTl7wNpYcCNLVECDt8MhQYwHjIF9Kd4DzRKll6jP9tOgFsQxSX77r5N38
	iQT9mnux+S2OG/09rC9RxyMFoNHfLXa+HVzILUVk5N6oZu2PXdiWPcbQs137n14CIocWa4PZJK+
	GQwhMQNNgv4BTorcM2wBNr+QPhd+cIDStBAGBfUebeO4a4oQ4A1WXPP90WPoy2s4lEIh+bb2hBl
	2wyLqIh7uiktSQaIhjdYSiEFcsnJy/VDyGkKHZ9tz8nhRy10pDt9/jqP5P9ZPkWuWPZHd+HOLxP
	Q/HudzRTumsoWwlk8+Cf06uKf2JtO2zZWtk3rVO4n+tg44QmQV27Nls=
X-Google-Smtp-Source: AGHT+IGE4yR6cgBkkvQcZ0IHX6BsNq+H8UInEThSWisvqbLPPoF9w9oT5fD4cZTzd5CMtWIib7XuTw==
X-Received: by 2002:a05:6300:6f82:b0:1ee:1910:803f with SMTP id adf61e73a8af0-1ee191082f5mr4625773637.42.1739074711624;
        Sat, 08 Feb 2025 20:18:31 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:31 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v5 09/11] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Sun,  9 Feb 2025 09:46:53 +0530
Message-ID: <20250209041655.331470-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201832_243084_2E0F65D3 
X-CRM114-Status: GOOD (  14.38  )
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
