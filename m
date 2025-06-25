Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4914CC7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+deXBGMYWjAuulmgScgUlrnXdKa0NoJvd1fFWHR2fSo=; b=2aM0OeAZBgySQw
	NSEBCf1NUeOjiCXOwOtJbB1n6KTvW6ak8U9fNbvKFzSH8mKZhyjGnNa1MJMCeRTT3zVbm9j2E+O+s
	Opslp/RhD3LAKi1Qlug/bR3JOXdxMcJ8Eq3ojrZkkZDhuIWFouLVkRcKKq5ZAk2Ok+tZ1NTEh9qZS
	9C1+kPH+9T/ip2vPHGPmRYACuFU7RQwV+zqnPNBKma0Xgm6GrEAJKbTfcbiqPAwR65zIMylyDeoJI
	Jj15twr/AP/1JKtpEG24V3ZqCoS7gmpFCO8UcyUGANUsQ57t64J1HANc/u2Nn+5MHnnEAmKje2IaD
	ZotQ5KcUVfzUTvoU+cpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUsc-00000009ar5-0nie;
	Wed, 25 Jun 2025 18:29:54 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSoU-00000009Fmx-2CbY
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 16:17:31 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7426c44e014so126303b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 09:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750868249; x=1751473049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ucgASzDHlxpA/1R6gfwSR+grfWmp0YH8y7SE+A0JJg=;
        b=M3TtRdOltqMbx5xiahCuzRD2nPCIaBm8Z2/sIC/ZfZzJCBrhh1VcMTs6QZPNPNaYO+
         s1bUeGCoJWy4zgmqyRpZiDOfXA9ZGJyAN566G4zp/wIO3lqSUWhmqpevzQLAYXx7vDmJ
         Esnop4XagZN8roCSTR8TW0cZz2AZImc3W7SXhvv/jqBnQ+wtR59lgFXWdrfSVUkJxSgJ
         mkF0ol+F/bd+HXQY0B+0EbkwyXfoqKhqQJaOXj05ASq2psc1pK1Esw57dWQ0KwBrBj8N
         qAf8MmVef4Mt0YPw5cuXfgFMG91NqohEefhftriX2/WkDwBQD0EG+7CTeSr6LjaCtGs9
         JBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750868249; x=1751473049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ucgASzDHlxpA/1R6gfwSR+grfWmp0YH8y7SE+A0JJg=;
        b=OmQ+vPpuIdQ7aTFzqYQSZ9Z/R+3qzBFNLnWr7usb7NiEvl5A/IzXN/0xmhL+d+HR/o
         35M3T+0gUIQvLazwD6Flw1jvGZf354Ha5ClHDcw58doiw1s2sGIhsrZ1wmgJL417ipa1
         IfOOrKzNlci12hqOPIUGPtjVIYnTY+jvm/nJnB7xJWexicCScV7ol9mLVEK2PKTY6lJY
         4D2YnNvzNcAM+Ul2o51PR+G+gBaAd+EAdeGstGrpAjKt0HHyxwXtnTAtC1GhZEyTz0GO
         ElLS9m8c5S4fCD8OzAI4zma8JDCu59Lj0k6nbalfU0qq30mYbGCbALK+jOugMVKmVIVt
         YsYg==
X-Forwarded-Encrypted: i=1; AJvYcCXrj5Fj5MajgGjit9kceuuS4ka4ehpuRA4sALH8uF8mo+cOV9ey20A8jSSPVC1pbpWEy9RQAw/v5YAtpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUV+pYEOQs/R8ExfubmR1eZkfWrN0zpXeTqTxK56ZlBKHEOX+3
	K8W1HwvtzneB9Msxc/LiGcrbrZYJ41uLVZ785iK7Z7LX4XJ0HG8YIxUCYH3nD/jSK43zmuhfIKX
	XmAs4
X-Gm-Gg: ASbGncttDEDAuXUMFDHcnd6QH1VnAG86RWJZ8vnBI62NvmdDVoCOfXTLeZo83dC2EL1
	5Y6IfLDdMkDGw5IMucQ/VYuxINeYvOZMd+CeR7INwckrrPnkzSG7LoPpTSZek7D+YpJCuGCU0mm
	1urcCzqzUcFUB6f54Wush8Y0qA55XMISLqsbJLDEezXkvN8D5tPeZEBbyr8uWBq1R6KsRPNdqxu
	/2lP2PqIhv8DMBxG0qvucgOE2cDMWyD6E56IVbu0QyjzcCA4hP1H7gw+pWLNVcIdSxtG3AeVKXH
	TAwCZbXEDKWbrNv9F9ZCkV5urvUTf8qS5uO6gPvvOV+yJB0lag/p+ZLjKwa4VUEQuOC+o2/WKhW
	T0KtyWeOCA880YI/4Z+/sY+dWntjxCdK6B56M
X-Google-Smtp-Source: AGHT+IFpDcqx44HzncJdJNVAkQLG5gSRrOhDC4JGf2UMPexno4tsLpTKKz23ZIhlWN8/zRHxl5MEaw==
X-Received: by 2002:a05:6a21:e96:b0:21f:4ecc:11ab with SMTP id adf61e73a8af0-2208c08a340mr673741637.9.1750868247253;
        Wed, 25 Jun 2025 09:17:27 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e217afsm5024436b3a.55.2025.06.25.09.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:17:26 -0700 (PDT)
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
Subject: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
Date: Wed, 25 Jun 2025 21:47:15 +0530
Message-ID: <20250625161715.1003948-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_091730_565258_9EEEDE16 
X-CRM114-Status: GOOD (  15.09  )
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

When injecting IPIs to a set of harts, the IMSIC IPI support will
do a separate MMIO write to SETIPNUM_LE register of each target
hart. This means on a platform where IMSIC is trap-n-emulated,
there will be N MMIO traps when injecting IPI to N target harts
hence IPIs based on IMSIC software injected MSI is slow compared
to the SBI IPI extension.

Add a kernel parameter to disable IPIs in IMSIC driver for platforms
with trap-n-emulated IMSIC.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 drivers/irqchip/irq-riscv-imsic-early.c         | 12 ++++++++++++
 2 files changed, 19 insertions(+)

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
index 1dbc41d7fe80..c6fba92dd5a9 100644
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
+static bool imsic_noipi;
+
+static int __init imsic_noipi_cfg(char *buf)
+{
+	imsic_noipi = true;
+	return 0;
+}
+early_param("irqchip.riscv_imsic_noipi", imsic_noipi_cfg);
 
 #ifdef CONFIG_SMP
 static void imsic_ipi_send(unsigned int cpu)
@@ -47,6 +56,9 @@ static int __init imsic_ipi_domain_init(void)
 {
 	int virq;
 
+	if (imsic_noipi)
+		return 0;
+
 	/* Create IMSIC IPI multiplexing */
 	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
 	if (virq <= 0)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
