Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326EEC83F27
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qJr/Ti3atV3k4ch7eiPTk1x1WXhCFzZ2Ig0j7ipRCrA=; b=Jp0AmgthV74lmy
	VJTT+4isG2gukBWP6yX/XuQtE2rj58EkMYt+DWNGCVZh0qMY6JzFeRG9Koa96xnjLAjOrU8KeasJO
	fpSX7GWh9KPkHsjwvMwgVlMUWUSynMPtJq5wJD+InmGqo5Ms0I6q3+AXUImmAceJH6l7PHsNJWyzt
	O1c5DRxDarZCaOtPAdXqPe71T6Y7NIqFsCoc3r63xeviBrsrZw2xraX2BDrhUY8efNXX0UH3w5xIY
	f0o6HIhRlS8GmEDA8/aYKRJW7FXNRdm1nx+V91tPc7geZVmMILyFiPe2Pbi//QWeurbM0dR/8eiJf
	DuX7mM4U3BcdQ+TRt56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1OZ-00000007fy0-2K6S;
	Wed, 16 Jul 2025 12:37:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1OX-00000007fxQ-0yl3
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 12:37:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-23aeac7d77aso51100175ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752669476; x=1753274276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRLSENgI/MGJbaGVqAa8IBYA8T+PU3c6shTbsSeztZI=;
        b=Yzsvrjmbe7lCMNSwmwmQzhKDHqMdcj7ZjLsfRmj9DykfSFiRqzWeDUCUBUwnvrIOev
         wr9khMGkWp1kidOVJ/5oCzsGC7+2ifaa0FBXbjjXHo/h6B7CGZB6vm2zv6A336KYUuZQ
         jWGTw9U2e7xlIjeeyeoAAKpWBFItaArUTZWK8Q9dEq7ATlZkrjhsCCnuHddSK0aO+bBY
         7voI2S6nOvMfmVINMP81hfJLkFrOm1lc+2g00pqCiXqoJ8BgZ9DjBZ9EV7xKAkXfg2qD
         3d5tc/yCkXANcyIQQgkcDWK5PlBOR5Yk6Xe4ObpLTDYDYAG4//86eEiqhcg7jQWebhiI
         vv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752669476; x=1753274276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRLSENgI/MGJbaGVqAa8IBYA8T+PU3c6shTbsSeztZI=;
        b=gcs2edebE4weKFgI9lE+bDusMtgOwLcQf6PQfAkeLsgcosjhIJEI7abLWywFoNaV6/
         1hCkTYpUt/uJ7PdM41AbFBZvmPLHNVaQ2qU9uNdTkpdcRH3K0jIJCEQ5wK7RDFhXcqtl
         FYaog2mkDDDcm2M0ouFcy0YTeo3s6/cC6Bq25U7EbpiYaQ7WwO+6Xirbbi/wIvYo4hlv
         WajUkiUpASj8BTskb8JDF9L+0wGhHHei36qlgabYYB0dllREqClvp6tcqpSV+KssI4Fo
         7qXNUZ3GJeLDpywGVBHTk94of5X/zNnzJRhCwpjF2Q/lDAUIx5M5bSFfooC5NNpn39YA
         3nyg==
X-Forwarded-Encrypted: i=1; AJvYcCUXxTsxUeR8Q6+CQ53skX4AHXzoTukJlE6/ln2ey4BpLFpGhZbbZpJtkVybB/kHiaFT374O4ivdsvdZXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8LMI7wVmjL/IxpZbf47VuOxlx8Tbr3RZgyV9Ikf78Y8I2uSJg
	sJjhwLK9IfF2t1jlEGxYZZYYd3eD+oTruu3JAM4JQu33fgSpAHEvgSR8hI+FnqPZOgA=
X-Gm-Gg: ASbGncsRUyOlJ7oCoDmKRJCYh3/fnZUZ0smI3OJFm6+aCCy4XoS8Tl32QY78iUjX5qz
	MeBr7g1G4EMoj/llCvtWoTsjxl988YfUuKPdL9BCzuYIf9yLiy+MHrqzXu4RpMIdMUyyklH2LpN
	eueM4TfBVQ89znOqT2iHJfF3SdY4LkCfwoh8vUiITgIcUlWto0kiy1Jwj/Ke7Br18JSuYSpuoj+
	ICMk6I3XMI4/D18Ruc8OqdKI5s0bI4iaUEMVwCEl4oej+jk7pF9QyHQqdrHGt0wTlWOuJFwYfpe
	eTfiNm+xMFUvv17Sg1crvJ6nMLw9VtqWtQoCEsPnaICewX5Gr4rsGLFwrMOXbRuwfisWZn43vqS
	QVJdR++//P3hAA1nI+5GvzCwFsSKv/SHgqMh1NUfQn/PqVelsa9br8A==
X-Google-Smtp-Source: AGHT+IFS0ERKXZDU/2paRwDAwj1qIE00GcJ4rlO9U8G8qiuVi07BwHIJVfO1FD2FE0d9SCuPJE4CnA==
X-Received: by 2002:a17:902:ecd1:b0:22c:3609:97ed with SMTP id d9443c01a7336-23e24fbf7bcmr36821175ad.30.1752669475780;
        Wed, 16 Jul 2025 05:37:55 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e2b31aba5sm5148085ad.0.2025.07.16.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:37:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
Date: Wed, 16 Jul 2025 18:07:45 +0530
Message-ID: <20250716123745.557585-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_053757_276554_B0F967D9 
X-CRM114-Status: GOOD (  22.76  )
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

When injecting IPIs to a set of harts, the IMSIC IPI support will do
a separate MMIO write to the SETIPNUM_LE register of each target hart.
This means on a platform where IMSIC is trap-n-emulated, there will be
N MMIO traps when injecting IPI to N target harts hence IMSIC IPIs will
be slow on such platform compared to the SBI IPI extension.

Unfortunately, there is no DT, ACPI, or any other way of discovering
whether the underlying IMSIC is trap-n-emulated. Using MMIO write to
the SETIPNUM_LE register for injecting IPI is purely a software choice
in the IMSIC driver hence add a kernel parameter to allow users disable
IMSIC IPIs on platforms with trap-n-emulated IMSIC.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v3:
 - Rebase upon Linux-6.16-rc4
 - Make imsic_noipi as __ro_after_init
Changes since v2:
 - Skip enabling/disabling IMSIC_IPI_ID in imsic_ipi_starting_cpu()
   and imsic_ipi_dying_cpu() when imsic_noipi is set
 - Re-use the reserved IPI ID for devices when imsic_noipi is set
Changes since v1:
 - Added more details to patch description
---
 .../admin-guide/kernel-parameters.txt         |  7 +++++++
 drivers/irqchip/irq-riscv-imsic-early.c       | 20 ++++++++++++++++++-
 drivers/irqchip/irq-riscv-imsic-state.c       |  7 ++++---
 drivers/irqchip/irq-riscv-imsic-state.h       |  1 +
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1f2c0874da9..7f0e12d0d260 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2538,6 +2538,13 @@
 			requires the kernel to be built with
 			CONFIG_ARM64_PSEUDO_NMI.
 
+	irqchip.riscv_imsic_noipi
+			[RISC-V,EARLY]
+			Force the kernel to not use IMSIC software injected MSIs
+			as IPIs. Intended for system where IMSIC is trap-n-emulated,
+			and thus want to reduce MMIO traps when triggering IPIs
+			to multiple harts.
+
 	irqfixup	[HW]
 			When an interrupt is not handled search all handlers
 			for it. Intended to get systems with badly broken
diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index d9ae87808651..2709cacf4855 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -8,6 +8,7 @@
 #include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
@@ -21,6 +22,14 @@
 #include "irq-riscv-imsic-state.h"
 
 static int imsic_parent_irq;
+bool imsic_noipi __ro_after_init;
+
+static int __init imsic_noipi_cfg(char *buf)
+{
+	imsic_noipi = true;
+	return 0;
+}
+early_param("irqchip.riscv_imsic_noipi", imsic_noipi_cfg);
 
 #ifdef CONFIG_SMP
 static void imsic_ipi_send(unsigned int cpu)
@@ -32,12 +41,18 @@ static void imsic_ipi_send(unsigned int cpu)
 
 static void imsic_ipi_starting_cpu(void)
 {
+	if (imsic_noipi)
+		return;
+
 	/* Enable IPIs for current CPU. */
 	__imsic_id_set_enable(IMSIC_IPI_ID);
 }
 
 static void imsic_ipi_dying_cpu(void)
 {
+	if (imsic_noipi)
+		return;
+
 	/* Disable IPIs for current CPU. */
 	__imsic_id_clear_enable(IMSIC_IPI_ID);
 }
@@ -46,6 +61,9 @@ static int __init imsic_ipi_domain_init(void)
 {
 	int virq;
 
+	if (imsic_noipi)
+		return 0;
+
 	/* Create IMSIC IPI multiplexing */
 	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
 	if (virq <= 0)
@@ -88,7 +106,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	while ((local_id = csr_swap(CSR_TOPEI, 0))) {
 		local_id >>= TOPEI_ID_SHIFT;
 
-		if (local_id == IMSIC_IPI_ID) {
+		if (!imsic_noipi && local_id == IMSIC_IPI_ID) {
 			if (IS_ENABLED(CONFIG_SMP))
 				ipi_mux_process();
 			continue;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 77670dd645ac..dc95ad856d80 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -134,7 +134,7 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 	lockdep_assert_held(&lpriv->lock);
 
 	for_each_set_bit(i, lpriv->dirty_bitmap, imsic->global.nr_ids + 1) {
-		if (!i || i == IMSIC_IPI_ID)
+		if (!i || (!imsic_noipi && i == IMSIC_IPI_ID))
 			goto skip;
 		vec = &lpriv->vectors[i];
 
@@ -419,7 +419,7 @@ void imsic_vector_debug_show(struct seq_file *m, struct imsic_vector *vec, int i
 	seq_printf(m, "%*starget_cpu      : %5u\n", ind, "", vec->cpu);
 	seq_printf(m, "%*starget_local_id : %5u\n", ind, "", vec->local_id);
 	seq_printf(m, "%*sis_reserved     : %5u\n", ind, "",
-		   (vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);
+		   (!imsic_noipi && vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);
 	seq_printf(m, "%*sis_enabled      : %5u\n", ind, "", is_enabled ? 1 : 0);
 	seq_printf(m, "%*sis_move_pending : %5u\n", ind, "", mvec ? 1 : 0);
 	if (mvec) {
@@ -583,7 +583,8 @@ static int __init imsic_matrix_init(void)
 	irq_matrix_assign_system(imsic->matrix, 0, false);
 
 	/* Reserve IPI ID because it is special and used internally */
-	irq_matrix_assign_system(imsic->matrix, IMSIC_IPI_ID, false);
+	if (!imsic_noipi)
+		irq_matrix_assign_system(imsic->matrix, IMSIC_IPI_ID, false);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 3202ffa4e849..57f951952b0c 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -61,6 +61,7 @@ struct imsic_priv {
 	struct irq_domain			*base_domain;
 };
 
+extern bool imsic_noipi;
 extern struct imsic_priv *imsic;
 
 void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend, bool val);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
