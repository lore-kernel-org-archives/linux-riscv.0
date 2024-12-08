Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F64E77173
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Dec 2024 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zy25GFZWRCq9s2/S6+uwTU+bz3dT4lhSYzhfqidmuDk=; b=a9F6FjtQq8+ai/
	U5A+tVgfyhMhZ87oYK3+rwDU/2GF6vqHITCYpDC6Oqj8lzCmD75osgjeTnkRKPbkUs+5ApswlpyIx
	MJNZ1RAGkB7IzLo66lI9iAqJyadH/Qio3f7M7xenO2BPoOw5PxABA7r3XBqeVwmswNl0qNe4E0mLH
	cD4EDWoYeONID1ZL7ILVCHbgyEubn9Z4IjCAnf0lQ9QeE9ZumPdYv5t8RSZfSjVGUKo6FuKRy4kE3
	VbYe7kpv9bdcOlDihJhxlmBQ5MzX5jloF4oA8Uh7S44OpTPlJkCRgVJrKkfuDyglOWpYC3afKu0+G
	UdLB8KSsMPHZTZUjSYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIua-00000005QWq-3XPG;
	Sun, 08 Dec 2024 15:09:32 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIsb-00000005Q52-08sV
	for linux-riscv@lists.infradead.org;
	Sun, 08 Dec 2024 15:07:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-215909152c5so40801955ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 07:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670448; x=1734275248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPiL+4+uUrxsUPNFNe0qcu/2Buvw2EBCmaBEkU4Ga+k=;
        b=czm/e5o3GwrIWk9vvk3bUgZlbd6rGHjSDPxY8xKaZIR0+8QvpRWT952pq7/l4C5ZSE
         uVje1xffP+IVcxMmIqa+s0udULVHkdPeiVqCV4/c4+CoZXIXh42mjmp7BpNk6rdd7ZIu
         lz4VOO6KIM7nGn/wt16DGbAfHlH/li81P+uBdkNlUuWRdfsIZwvBz1aEmysZBD4oeZZ1
         ZmhTAZaL77O5mGpsi7rUB4a+a5OL/cQGEXo5Xc0nWaAJy9bfWw/ttq2kOlXBiP9C+/Dn
         eJNS2Ehd7o/udFJK7SyiOVq8wpkUcBTHLQBJ8BbvthzgLV6jgxZOU2lsIDtQQi0YLUPe
         6qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670448; x=1734275248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPiL+4+uUrxsUPNFNe0qcu/2Buvw2EBCmaBEkU4Ga+k=;
        b=ih57+UxheM8H/kat8QmdVZ6AY4Tobsv5bRR8rrwiuo9VAuaIVouXehuJRUJLa1E9+h
         tvu53AfX6I9GSrnCMpziuDnd8PlgjayjGaPfmAiqlrOJOTepPLtOngqene0bSymU0ham
         +PhwaqJibmSH/JKw7oK4DUJJySeZoQFvE5Azre9AgXyZCEGLk/vMOb1INs/0FAPXRgU6
         3eOxr0v6pOftu+tT07GlbwTzBSfJhioJTcKJmQIHGPrDd7sHtmFCNSmw9phA5EPoNG6r
         2uGcvJHBkF+ux94FW00d9CPfGPxD/VzkdpG5GgIfkmETZHxuW9r3PtmG+w53Xz5txp7Z
         dB8A==
X-Forwarded-Encrypted: i=1; AJvYcCU+XHnL+wo43u0/YXprMrmT5moKEFxDd7VLSeNxtckAyj9/N2krtXpsRJT6EWWSc4rOp6VUedqadGlmZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt2R11HXo5M4K/SxpCkLphResi2hdDXsaj3fRSXT6OSUgfvSPt
	UHiGSFnTeRcn3u3OpzjdueLnYcUldr58K2kjNLgRzdFl2gYacrcfpjngyFSK3nQ=
X-Gm-Gg: ASbGncuLqcCdbVpcvwaWE/AbgUIKQBq2tFH3yPsb/itfN6sIX59ifi239mUXKyH/Un0
	grUl+EBhFM/Xt94wutYJV4rMQDfDBXASumRPwRWl7tNaKP16XTeYxggSzmisjUxwsdL7tbjGJ8y
	vtufs0eH4Y8oqaeaDywwneaCr4fMfTLPv9xQjSwsFhQelx6+T5NBixIo9iB3yPqNAuGc38axmdw
	/StI6BtXq/MV+fAH0MKsfy8xhgq1AL08EKzf32ZJeqDnB/yzWRYUby1Mm+MpVkEJNcX1zSDVpaT
	e/qgHVBxewfJQH4=
X-Google-Smtp-Source: AGHT+IGeMHvOT6RCYMvwhhYpeZ8b5RyMdQq1g0U5HspyszP4RDGsvXBxsgKTLdGXoqrj8jvGvqY46w==
X-Received: by 2002:a17:902:ec90:b0:215:b5d6:5fa8 with SMTP id d9443c01a7336-21614d98c11mr163726535ad.22.1733670448046;
        Sun, 08 Dec 2024 07:07:28 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:27 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates for device
Date: Sun,  8 Dec 2024 20:37:08 +0530
Message-ID: <20241208150711.297624-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208150711.297624-1-apatel@ventanamicro.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_070729_102126_896A8781 
X-CRM114-Status: GOOD (  17.53  )
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
 drivers/irqchip/irq-riscv-imsic-platform.c | 27 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 27 +++++++++++++++++++---
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..707c7ccb4d08 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -97,6 +97,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 {
 	struct imsic_vector *old_vec, *new_vec;
 	struct irq_data *pd = d->parent_data;
+	struct imsic_vector tmp_vec;
 
 	old_vec = irq_data_get_irq_chip_data(pd);
 	if (WARN_ON(!old_vec))
@@ -110,11 +111,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	if (imsic_vector_get_move(old_vec))
 		return -EBUSY;
 
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
 	/* Get a new vector on the desired set of CPUs */
 	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
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
index b97e6cd89ed7..230b917136e6 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,8 +126,8 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *mlocal;
-	struct imsic_vector *vec, *mvec;
+	struct imsic_local_config *tlocal, *mlocal;
+	struct imsic_vector *vec, *tvec, *mvec;
 	int i;
 
 	lockdep_assert_held(&lpriv->lock);
@@ -151,7 +151,28 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
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
+				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
+				writel_relaxed(mvec->local_id, mlocal->msi_va);
+			}
+
+			if (__imsic_id_read_clear_pending(vec->local_id)) {
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
