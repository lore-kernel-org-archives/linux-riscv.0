Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2387EC02197
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 08:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BERYYEdjvaLK8gKdO7RKdtx7EENt2M7IUO4qC18oixA=; b=R5nZbb0/dYJK82
	I9OXx9uDb/5hUDagrFY7pll9oHn5rO+ixWYnP29PDALbo0xzYII4ea2QqWh7TL0Ci1kV4JShWgELr
	wTO4sHt8gk9+O0rZbwExrXqqM/xbS9bFkOg2hJV3crz2VnQ3gSZAbH4acT4Ots0mSFCGsoAM5mEgr
	Ws6N0t1/34C1/C3pThj56tZqSJGH+8GQn//Z/3IZR8SJE5ZmLXKw1HmOzphZjFleIEzT8Ogo/kHNi
	+cdP09Rb2iRcS27ZJtUmtZLT9QCGOw95GgmGszDWjbFipco8XtDB3uzHN6KM57ceIQIJgTlPd/irc
	oxqjH2xs7/d0IfygxSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDzA-0000000HUxM-2d8O;
	Tue, 04 Feb 2025 08:08:44 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDmr-0000000HT5J-40cd
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 07:56:03 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7b702c3c021so507740385a.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 23:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655761; x=1739260561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MADFF5SwXkzmIBLKmDVwps1qS+gME3ryVy0pflkh7M=;
        b=j4P7OOWCnze8L1Xes5hSunclSvSbEUl1Z9Qb4Dgo6OYXsgqzo5R27iUMT4y5YNk0HR
         2bMDH5nONDRTgDr1jk5xTC7o7zsChVb68eBvqfe1Ir82P7nkeEUv9HRkIErKm5wybwIb
         6Mi4le7ZG8wiWibQw+AQIiv5hXlotFu/UoXtAnrVJFoJVJDAwVwFFfd6lLexUsbM40tl
         PRzOS7Sjipd89y9UkxJazznWkvMkNAyt8VA0NODw+vDLbxk//QoqE1pwVCe+//gMATLn
         E6XaCXXzattrlVj3z7OxBrIB0e5fgUGtrOxIQKVQnqEUIYZmwino5DBpHIvlnplpEFbj
         AATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655761; x=1739260561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MADFF5SwXkzmIBLKmDVwps1qS+gME3ryVy0pflkh7M=;
        b=PGDnbH6ueb3uRGl80I5X0uGQJchriVJpRGQQJlsUJc6PxhEwVhv3G0uvacmXuTi7sC
         D2XReY0VVSuAsIGehBAawEZ6UnQQu04nvz6rDEFutqztV5iZEiS6j4AT8wFW8CIXxjid
         EsnxVeqojTQN9fY8AtreK0lohaun0pRIw42SPbd98ukhJd3IBJ4EVC4tVnz1raUKuAbP
         ufDULwCNjKRn6JsC3o3lrzubOMVRDz2OXp4H93oIWxIhtI4iohv11Gm1Hrs6AfP5I1Te
         +I2rNXk3j+/ruMhVD5ha/PeBkenKlXffgWV0SbreEwNjv1N/ULqBH0MgvPII7bGscpfY
         k5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWSqZhm5ajDFDJ171WKlQaBScLezfUnv690YsOnnag/+WoxHzyccWZHhAmfnuZikuzOJrb3VRRSn96hPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIK63yrLu80wMZp/363SR5E02OKA6rsHIwdI2eu9NYj77N1Z6D
	F5OdLSuaQJ5jD+mKNHjs/mLVHEwFz3BBeqzbHQJC6DpPA0nk6S05LCjGwVwrlC0=
X-Gm-Gg: ASbGncvUbx0w5FRZ4Zq+aV5zqWVLJuvYcFE85zGmIwCr3941EPlv8KPQ/ZBGFg+IDxf
	2TIiu8FRhVy452VLTnTUpLGpduIgecTiB2hjJyIpBndAbn5KlmTQdflaaPrFPJsVFnNri8ySBNS
	0Bde9vF/o5UZrhvAiXjagJ4qwQyB+UwQVug5rO1mPsiFDVLt4H5QMz2oJQvY+15aRHG8Llw98KZ
	CzzcP1B9oVNqpEgeA4MwfbBY9oMcByUiWiQpVQ6QR9LusJVtn1ZBxPRxdf5/De/eQsDj0UBotu7
	fW3s12czZBh6GpJ/v3MnMHu/gHjbbdkSRyBZaNSd/NABUnzBi0BO7UU=
X-Google-Smtp-Source: AGHT+IF7prdvtKiSyJ0NFqTW4MBl378F96libEZvgvmb2g4BOpM5Yj9BonZGCkzjTLLgOdYhNcWtUA==
X-Received: by 2002:a05:620a:8427:b0:7c0:a2:e68a with SMTP id af79cd13be357-7c000a2e980mr2573236785a.30.1738655761078;
        Mon, 03 Feb 2025 23:56:01 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:56:00 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED flag for PCI devices
Date: Tue,  4 Feb 2025 13:24:05 +0530
Message-ID: <20250204075405.824721-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235601_998398_02E69B72 
X-CRM114-Status: GOOD (  23.80  )
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

Devices (such as PCI) which have non-atomic MSI update should
migrate irq in the interrupt-context so use IRQCHIP_MOVE_DEFERRED
flag for corresponding irqchips.

The use of IRQCHIP_MOVE_DEFERRED further simplifies IMSIC vector
movement as follows:

1) No need to handle the intermediate state seen by devices with
   non-atomic MSI update because imsic_irq_set_affinity() is called
   in the interrupt-context with interrupt masked.
2) No need to check temporary vector when completing vector movement
   on the old CPU in __imsic_local_sync().
3) No need to call imsic_local_sync_all() from imsic_handle_irq()

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 74 ++++++++++++++--------
 drivers/irqchip/irq-riscv-imsic-state.c    | 25 +-------
 2 files changed, 50 insertions(+), 49 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index e6c81718ba78..eac7f358bbba 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -64,6 +64,11 @@ static int imsic_irq_retrigger(struct irq_data *d)
 	return 0;
 }
 
+static void imsic_irq_ack(struct irq_data *d)
+{
+	irq_move_irq(d);
+}
+
 static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_msg *msg)
 {
 	phys_addr_t msi_addr;
@@ -97,7 +102,20 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct imsic_vector tmp_vec;
+
+	/*
+	 * Requirements for the downstream irqdomains (or devices):
+	 *
+	 * 1) Downstream irqdomains (or devices) with atomic MSI update can
+	 *    happily do imsic_irq_set_affinity() in the process-context on
+	 *    any CPU so the irqchip of such irqdomains must not set the
+	 *    IRQCHIP_MOVE_DEFERRED flag.
+	 *
+	 * 2) Downstream irqdomains (or devices) with non-atomic MSI update
+	 *    must do imsic_irq_set_affinity() in the interrupt-context upon
+	 *    next interrupt so the irqchip of such irqdomains must set the
+	 *    IRQCHIP_MOVE_DEFERRED flag.
+	 */
 
 	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
@@ -117,31 +135,13 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -ENOSPC;
 
 	/*
-	 * Device having non-atomic MSI update might see an intermediate
-	 * state when changing target IMSIC vector from one CPU to another.
-	 *
-	 * To avoid losing interrupt to some intermediate state, do the
-	 * following (just like x86 APIC):
-	 *
-	 * 1) First write a temporary IMSIC vector to the device which
-	 * has MSI address same as the old IMSIC vector but MSI data
-	 * matches the new IMSIC vector.
-	 *
-	 * 2) Next write the new IMSIC vector to the device.
-	 *
-	 * Based on the above, the __imsic_local_sync() must check both
-	 * old MSI data and new MSI data on the old CPU for pending
+	 * Downstream irqdomains (or devices) with non-atomic MSI update
+	 * may see an intermediate state when changing target IMSIC vector
+	 * from one CPU to another but using the IRQCHIP_MOVE_DEFERRED
+	 * flag this is taken care because imsic_irq_set_affinity() is
+	 * called in the interrupt-context with interrupt masked.
 	 */
 
-	if (new_vec->local_id != old_vec->local_id) {
-		/* Setup temporary vector */
-		tmp_vec.cpu = old_vec->cpu;
-		tmp_vec.local_id = new_vec->local_id;
-
-		/* Point device to the temporary vector */
-		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
-	}
-
 	/* Point device to the new vector */
 	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
@@ -198,6 +198,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
+	.irq_ack		= imsic_irq_ack,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
 				  IRQCHIP_MASK_ON_SUSPEND,
@@ -217,7 +218,7 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return -ENOSPC;
 
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
-			    handle_simple_irq, NULL, NULL);
+			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
 	irq_set_affinity(virq, cpu_online_mask);
 	irq_data_update_effective_affinity(irq_get_irq_data(virq), cpumask_of(vec->cpu));
@@ -256,15 +257,36 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
 #endif
 };
 
+static bool imsic_init_dev_msi_info(struct device *dev,
+				    struct irq_domain *domain,
+				    struct irq_domain *real_parent,
+				    struct msi_domain_info *info)
+{
+	if (!msi_lib_init_dev_msi_info(dev, domain, real_parent, info))
+		return false;
+
+	switch (info->bus_token) {
+	case DOMAIN_BUS_PCI_DEVICE_MSI:
+	case DOMAIN_BUS_PCI_DEVICE_MSIX:
+		info->chip->flags |= IRQCHIP_MOVE_DEFERRED;
+		break;
+	default:
+		break;
+	}
+
+	return true;
+}
+
 static const struct msi_parent_ops imsic_msi_parent_ops = {
 	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
 				  MSI_FLAG_PCI_MSIX,
 	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
 				  MSI_FLAG_USE_DEF_CHIP_OPS |
 				  MSI_FLAG_PCI_MSI_MASK_PARENT,
+	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
-	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+	.init_dev_msi_info	= imsic_init_dev_msi_info,
 };
 
 int imsic_irqdomain_init(void)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index e70f497a9326..f9b2cec72ff2 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,8 +126,8 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *tlocal, *mlocal;
-	struct imsic_vector *vec, *tvec, *mvec;
+	struct imsic_local_config *mlocal;
+	struct imsic_vector *vec, *mvec;
 	bool ret = true;
 	int i;
 
@@ -170,27 +170,6 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 		 */
 		mvec = READ_ONCE(vec->move_next);
 		if (mvec) {
-			/*
-			 * Device having non-atomic MSI update might see an
-			 * intermediate state so check both old ID and new ID
-			 * for pending interrupts.
-			 *
-			 * For details, refer imsic_irq_set_affinity().
-			 */
-
-			tvec = vec->local_id == mvec->local_id ?
-			       NULL : &lpriv->vectors[mvec->local_id];
-			if (tvec && __imsic_id_read_clear_pending(tvec->local_id)) {
-				/* Retrigger temporary vector if it was already in-use */
-				if (READ_ONCE(tvec->enable)) {
-					tlocal = per_cpu_ptr(imsic->global.local, tvec->cpu);
-					writel_relaxed(tvec->local_id, tlocal->msi_va);
-				}
-
-				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
-				writel_relaxed(mvec->local_id, mlocal->msi_va);
-			}
-
 			if (__imsic_id_read_clear_pending(vec->local_id)) {
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
