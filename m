Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAB5C83F04
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qgSraKmVBpq4DOh/ksKa8JIov+FI7BQ4omxl0CNR/C8=; b=qn5sP5Jz+bvisb
	gm99SktUtdUOgiFkRTk2Nft8QXnuDxVxZGiGCRKkFBbae8bL6kH4FVpIxHw597SRdU1jzcmSEqGT8
	K5KxC6bJSuQQ+e5htAAWEKtJ2AwohvfVDuGfWiMxeEgSpObLxYdWWFjjJwpVtR68Oc5K8NRDCl4F7
	NB6YVZDKmsft5mHOzNPYm97o/OjVa+MeNW6/d5TnJ17Y70YBfsBpXGZbuz8oqGYTKONnDrkiMTYdi
	XjOeTBKhf2VJMJ0os9U/uBS2oGYTqprMa50GF68tbti9gKFN8wZ7jTkjzRZaHG3S0O7ME2az9EM8N
	7fSmmjup2zTDxXZPaChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwXT-00000008Jec-32Hl;
	Wed, 02 Jul 2025 12:26:11 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvvJ-00000008BRA-0KSZ
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:46:46 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b31e076f714so7040574a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 04:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751456804; x=1752061604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yk2XrB5jQ5gWfcg8j5KkpuXSbfKXmb2HHqWVHfhl1GI=;
        b=U/cFnJZhWbFRADHZzW8N+oYXY43CT4DdtpwkswobA0gNpTpwBoCRcZpVmNmp6bmO/w
         kIMWNTfW0OOUxrR5yc5wbhCQYwe8HPYpUEhCEfF4nz7reTBpTjdB46uTE3AMXgXC9pwm
         p9hvpWCK410lZhJEj1R7+WGDM8mCAbafvOGiG6DZ+qFOqa3Uw28oQ7TvaBPG1E0oxAR3
         PHzJBvFcMjfxr2Yl1JYUPXbKd+4QZArez1EWd7YWATuFrTCtj5R4qGRHMmO9ES0KfdbO
         L0Ge4S57RWqe3qWrHx79UCKZdFlYUGlJWke7tA3RgVipufOgQWDSUW0ohlLKSMoEGvBl
         yJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456804; x=1752061604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk2XrB5jQ5gWfcg8j5KkpuXSbfKXmb2HHqWVHfhl1GI=;
        b=Kt+M1qSKwqw40IT8OUHLTKV47HoIz1p5FAp9Gq3qWhEDkd7nrY/Rso7DazCROqB7ox
         g/7YirS6Q0HSAcMVNbRIYVKMH0TRg50SSXEmr5gN4bopa3OYBXwx7IyfP1Ov+LSDrXJU
         7F5Ju/xaDTjuVU+dHlkrrIVoItzClfTqhdQWZTBsbqPw9NmIS6jdSt53j4gN3MG0QkLH
         V+CC2QwhQyKismYZarfu8mOiKEBxQcDLUTri87cP5+joMNf2o3mFLOkkOmPi1TeqyaRB
         nGKQu/w4Ak4XmeQ39XQ8B4ttv+cppo5fjV4jYLyBXhSStnR7oadGlM+hMteCCpkbBj0R
         owCA==
X-Forwarded-Encrypted: i=1; AJvYcCX2u2Cg5Smx6v0HP4zHdnFnU+4iS9G4cRAI0G5Pt5FCaZCjlmdr1XojypO12ZSgOXYV72SshrNANqXYxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxO+VKKoG4GMXNBzKSdGHdrQdzuNmA0OYyyRq+heaZqhH7bYZFu
	/fY3rqMg6rh0CbLcB0U14ZE68VCiehcF/ier8qV0kwUeg8fak83IDFYNV1oVKlluq9g=
X-Gm-Gg: ASbGncvFOV54g9EYkutesxjQGNeRZB6usaeaBz/h+tde+9gomEJ/ChDkskxSVEHCJur
	e0Xvs7BAzsolbmt7ivNL/xTbfIRyScdqeE/XdC6LzKn09GvQXZoGyRfTqzNGJDyx3TunjPp+19R
	EY5k/oG1tIo9An3PFnJ/1MoDRYY6cmNhIXvPB8eooI8orX+E+M7epGmvt1/h1+DWr+6TrD2slme
	oEyhJ3DGrBWeF/DwGPdCAOHSWxLE8iEehP6iT65TWqK+qKolXqLPbqfdJLArY3yAv+wo+DrLsGC
	a8oxscoIhS69DBJP5Jmj0G/ABWbnQeX5YjfmN+5h4SFwNtqn3odcDBE6Zr4cbXwBLMKMxN3hN2E
	o7qO3E0eyyC7Zz58aYeg=
X-Google-Smtp-Source: AGHT+IFCWxOZ8rl0VoQzyP66lbRbXpHM77edYEAEhKu5qS8o5WzfskN91xaYVQWAyRdHNQm0i8dLEg==
X-Received: by 2002:a17:90b:2dd2:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-31a917837f9mr3736824a91.2.1751456804171;
        Wed, 02 Jul 2025 04:46:44 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm18150271a91.26.2025.07.02.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:46:43 -0700 (PDT)
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
Subject: [PATCH v2] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
Date: Wed,  2 Jul 2025 17:16:33 +0530
Message-ID: <20250702114633.1490974-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_044645_115787_11422B9B 
X-CRM114-Status: GOOD (  17.92  )
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
