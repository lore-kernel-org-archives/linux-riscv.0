Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80C0C83F04
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KsPkuvYWu3yjDPxluuXLiIC8PcCiKVOUhvJNXXFpwtc=; b=2aofGdJdHa6FK6
	4kxwO6KN3gC/XOUj+oKSqzk49HntmwoLr4zEsQMXNoM5CFzL49dvQluBJBwsGLG9V59BHb/2hY+F6
	Cii9wyxR8ZcskQO/QREuD1pRDIGLpzt4BM4fFPrLESKUE0ga3lShJ3H8RUyej23/u4jaQCxIuuZxM
	F31rL6UwEe6lwSFT4cYbir9mlRl3OgHqI/WEppwCXVAKdna19KcIAxJvSIaUBrm5PszFDlBC7aEgA
	JSAjpuF9MTqgook4ZviB5oNErVeVdxgHqetuOwjOSlQlPVltZDgYDKaNJAfc24uxUJaID5V9qTHLB
	2oX0l7TE3o9TCbSuwZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqU-00000008Lb4-0i67;
	Wed, 02 Jul 2025 12:45:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwWT-00000008JUG-2EfK
	for linux-riscv@bombadil.infradead.org;
	Wed, 02 Jul 2025 12:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=d2/Oz6A0ZcrKaCz3NC9OtHbxQaQqo8pmpupCjGRpV8w=; b=aQ1ogyClBbmc66Muvk3g9FKscb
	Rc6ImRlLw55thkLqnRrz9o3g+RWN9Dp6VqW+hYNkH6WKAbJPtOcIrz5+971jkC6ToyJbnAKfrzyxJ
	allGh8eErUGg3kIb7wk0vQvweJYtgHA9HH4qvIqeOclruAYQDxKcXyGKrfs0AGGrurNjgqv+MIAJs
	jfo+M9JJfNFqhhvALnxdbPWTRUADhztU9wVHDQGdzFyItwu/+lOaI/xYIPw9a8/tfd/hL1PoPs1u2
	kga+dN19rzBREUS5CBNgFlxYyYm7K9gPJcscxsqEcmxPdBjYVIVbrJM8CF9aDwptpIoZHLuKubHxm
	l/k9LI2Q==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwWP-00000007M34-3t4D
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:25:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-23636167b30so40327685ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 05:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751459103; x=1752063903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d2/Oz6A0ZcrKaCz3NC9OtHbxQaQqo8pmpupCjGRpV8w=;
        b=mFC/SqfCgNkGqxvGbYGwmqmKeKr+UJV6RvErNZ4MxQB2wcbIGBOl9j6gbzGs/F53c2
         z1IfPRls0RZE3y+Z2ZzZLA7aPLOTRsLmtvMSaIu+Qvbum735ogEXHj0drjwU0FvxfaHX
         5MMJlb1JusYg3y3ElU3JdwtZD4nsVIUSVP66xFRUPHjZH6qhYWWytNwTcO3TIwka+QOT
         plIssUkEQWZr/ITdcHNO48Fw8PsRV15qBQYQoIFC3TXeRgfC1bPpglsVD33J5GNUJ8cG
         FPXCEjgQUhKyWE0jcX+jt7l+NNebvPHzVyhuIBYnv4BdxiromDQGVd8I3Bj348Rd3HxY
         R93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459103; x=1752063903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2/Oz6A0ZcrKaCz3NC9OtHbxQaQqo8pmpupCjGRpV8w=;
        b=gYTUFcW6AzE0KQFhDrMabRWSsCCbYFMo+R8+WKcaOAaFs++xY2GjER3eBqIuIEUSeF
         89vCiykAtPy9WQgcTXjxaaqnvqRgpydzmJ/GTq7W+9rrcMi2DZRbbpZZB1yz3YfpTizH
         bcZPT7tjRjzNeu+28nbDrf0m07REK/gNP7CkEDbSl9CFh8d2+eOl/05u6yCLOc4MxTlg
         H/RZAqkS+2+zh40mHvy+dEkegnRBxX/rQdIGc+YwgRyie/xUnCupP4fyAtIJaxjgfjUA
         +IjAnJq/iFp92ryJ+28XdD2STQqe6WPCdLKKDf50GE7cPFEjzbki6BKuc3T7RRTnbEeL
         PzUw==
X-Forwarded-Encrypted: i=1; AJvYcCVKOb3EE2mxz2uZkZWqfpkCYyME22+i/fP5/Wt66+ZlJJpkalwYSiZMIg5xjTpTe+7pJb6fq0W+pBMKoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQZ1xUkENmUFtWWst6jxokEbG4NmgtpqsTknH5byKyTkFCdn+0
	XNGgprSW3UX0PEvCWP/K1X6hC37UWfy+ZGuZxnzJZqHOjPI5p9G/siHnGA9yw1bfAPw=
X-Gm-Gg: ASbGncvUd/LDms+kaf0d65anLqw9iFlvcSbstFyJ1YUc2CWQ3CohjnPCwzvO6Xl7V7S
	SriO3l/iBjJdMkkv9DnYmGnzEfk/2fosoabFjAFLWM6zHPDZo/COQgFFsdy1whFxpyPIdsGpvpf
	lkHAd5jEWUh6cfDIk7o2HkkAKEpLT4e4Am2QGRFKeDv0eCJbjN+1n+SMKnMWXjP8cjFvYKeylF2
	BTN+oIyuJXCw2YtHK+BMKAVpFHtFplKZMSAEKm7xoXy3RRRneANT4o3qR6ZN+ypIfEQEFthVBkI
	tXBtGGn/03vDjY10OHctNvvjXpT4hTUrljS2b/4XkQvjchsGnuttGj5ePSGMC9euqlnZG1wlaGu
	Z++b/8h6cIwLZzx/vuj8=
X-Google-Smtp-Source: AGHT+IFIlXXlzsuMFgHtCxyhdIuOG14wM/hhcIz6P+W+5GsHULhVeQI6sehkPkzz7x0xAIuoLbb44w==
X-Received: by 2002:a17:902:ccd0:b0:235:ed02:288b with SMTP id d9443c01a7336-23c6e552cacmr40153115ad.30.1751459103084;
        Wed, 02 Jul 2025 05:25:03 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1b49sm131147265ad.22.2025.07.02.05.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:25:02 -0700 (PDT)
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
Subject: [PATCH v3] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
Date: Wed,  2 Jul 2025 17:54:34 +0530
Message-ID: <20250702122434.1514328-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_132506_117127_082DA757 
X-CRM114-Status: GOOD (  23.08  )
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
index 1dbc41d7fe80..7e71f41c0d46 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -9,6 +9,7 @@
 #include <linux/cpu.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
@@ -22,6 +23,14 @@
 #include "irq-riscv-imsic-state.h"
 
 static int imsic_parent_irq;
+bool imsic_noipi;
+
+static int __init imsic_noipi_cfg(char *buf)
+{
+	imsic_noipi = true;
+	return 0;
+}
+early_param("irqchip.riscv_imsic_noipi", imsic_noipi_cfg);
 
 #ifdef CONFIG_SMP
 static void imsic_ipi_send(unsigned int cpu)
@@ -33,12 +42,18 @@ static void imsic_ipi_send(unsigned int cpu)
 
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
@@ -47,6 +62,9 @@ static int __init imsic_ipi_domain_init(void)
 {
 	int virq;
 
+	if (imsic_noipi)
+		return 0;
+
 	/* Create IMSIC IPI multiplexing */
 	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
 	if (virq <= 0)
@@ -89,7 +107,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
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
