Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EEBC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 21:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkZ78+dHvI4yJkgcTgOul0SSRMJF+xAcnFDxpP9AJ0o=; b=07t3Yd9G93Rq32
	zzanIcErB55Fb2vxskqVgLOopoCX4Jw+znUC1mxBmyOlJwZ7Y0VIQ25zCDTMihLmfBeQF6zIA0KrT
	4YmP/d6UQR9LOdQLmGEUgLtDO5qYp2w3dU2DduBj0/PBfGHOjqmCg5lVQrfoOiRKGTlIc9pq+rlnl
	QVlR5N5buNDVtMuZcpw3g2E7grWpReK7UxQzk6ZYJjU/m70W2iyzmLKiaFdXaQAgUM/oKplOIIZRE
	5Ey0iQnnMeSzRZZpgzKqaIpPxISL0dED9eFLNHycfwV1Ry5wQwYDFIHv36pm7ji9ZtogNxwsgS+Im
	BqTT+zMSlbUWTaDVKUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpaQo-0000000B8Mx-03jX;
	Wed, 27 Mar 2024 21:03:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTR-0000000Au4v-3gld
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:16 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1e0d8403257so2162425ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569732; x=1712174532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGWc9ebaY2QC87evSRTtIDPTTKODWYBNdAFlf6sP+x8=;
        b=m3X9YGsaUuj9tc4w8GJ4t07x29cO5RHX+NlvG7j1Zs9uXrI/soO69XCK7pyUNOv2lJ
         YkJk8HE5qW21x4Sr0sF4cU9HklZXmEnF8IxejWlezma1aZ24dLl8D9PrJlIe9OdICr68
         Dm5HA3/h7TcJ38EocSE1LuXn8y0FQBm58NOUTpdP/0/spnH4W72KewSc0H1Xk7T9HMEg
         joU98o5olUHKgvbk2xyBvNOH0+IowzNDwDWqRLa2hO6W7tz9yBqQh69U9UD1ypdgz7UI
         e0RMrTSUZPnJu9rlHJbDRIZJ9nvU/nhtjvSBQIf0lQOJRJdyLBk4OqncktSjesmJM2Ed
         7QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569732; x=1712174532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGWc9ebaY2QC87evSRTtIDPTTKODWYBNdAFlf6sP+x8=;
        b=ltXnclKHFIGpf/zbaGE28GmDdS8MVG1ykDjT0mJ7LC93jsdMGH6Uu8227bORF+Hz83
         ZS+KOtH/D8O/odfQi0w+vLsbW65g0ZUKb6LbXN8+Z4xjGpxBLWyDF8y19cTk8kf/n8AY
         4MY791iluMOpxLb30PjRDyeKh+KLqdINUP9TREBWZbWUQ5hPf7k8gfbSlqtf4G/6ReYY
         2kwwG0BDiTruLg02mqoLN0Qu3Og1XGBpO3IVPJIjnFngMDTJPCrm1zz06R2tWz3x6s94
         m9rOzoLCCpX6bUWmULL3WtCVumAkZS8VvLFBMBHjwAtnd6T2Mi7DXOAWpRpmHSQOs3NH
         sg6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2ufRi3IHLnUPJE5v90Zelv579CzgSXSsOTdtSRUgtVp8CKLZmg+CsjUpdXjB8izA/z+zqbmPDVInsN89As8j8t2DXImCm77cjkKHmTSPp
X-Gm-Message-State: AOJu0YxRrTjypCf/UEwRmiqLExCnnaLm3/xfvfuPuPs0NcGD6CDvKPMU
	YA1+UEsFUwJsGrQ9W1Fzcjz7mdBPVZ941pNNmKnigPyR0/qvoARHHNO+UD2iCgz/O+/dM4zPmIt
	9
X-Google-Smtp-Source: AGHT+IF/XXLIIHj+pdeHOeaQpfwKr83x+9g91i//d+1nB1dHcUYu9bI9urgKfRLt2peRxnrkYrSQjA==
X-Received: by 2002:a17:902:ec92:b0:1e0:73d:9175 with SMTP id x18-20020a170902ec9200b001e0073d9175mr916865plg.45.1711569732549;
        Wed, 27 Mar 2024 13:02:12 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:12 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 10/14] riscv: Add support for kernel-mode FPU
Date: Wed, 27 Mar 2024 13:00:41 -0700
Message-ID: <20240327200157.1097089-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_130214_200370_2B6F1B0C 
X-CRM114-Status: GOOD (  16.84  )
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

This is motivated by the amdgpu DRM driver, which needs floating-point
code to support recent hardware. That code is not performance-critical,
so only provide a minimal non-preemptible implementation for now.

Support is limited to riscv64 because riscv32 requires runtime (libgcc)
assistance to convert between doubles and 64-bit integers.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Rebase on v6.9-rc1
 - Limit ARCH_HAS_KERNEL_FPU_SUPPORT to 64BIT

Changes in v2:
 - Remove RISC-V architecture-specific preprocessor check

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/Makefile                 |  3 +++
 arch/riscv/include/asm/fpu.h        | 16 ++++++++++++++++
 arch/riscv/kernel/Makefile          |  1 +
 arch/riscv/kernel/kernel_mode_fpu.c | 28 ++++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 arch/riscv/include/asm/fpu.h
 create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..3bcd0d250810 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -27,6 +27,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if 64BIT && FPU
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_MMIOWB
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 252d63942f34..76ff4033c854 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -84,6 +84,9 @@ KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64i
 
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
+# For C code built with floating-point support, exclude V but keep F and D.
+CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
diff --git a/arch/riscv/include/asm/fpu.h b/arch/riscv/include/asm/fpu.h
new file mode 100644
index 000000000000..91c04c244e12
--- /dev/null
+++ b/arch/riscv/include/asm/fpu.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_RISCV_FPU_H
+#define _ASM_RISCV_FPU_H
+
+#include <asm/switch_to.h>
+
+#define kernel_fpu_available()	has_fpu()
+
+void kernel_fpu_begin(void);
+void kernel_fpu_end(void);
+
+#endif /* ! _ASM_RISCV_FPU_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 81d94a8ee10f..5b243d46f4b1 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
 obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)	+= copy-unaligned.o
 
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_FPU)		+= kernel_mode_fpu.o
 obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
 obj-$(CONFIG_RISCV_ISA_V)	+= kernel_mode_vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
diff --git a/arch/riscv/kernel/kernel_mode_fpu.c b/arch/riscv/kernel/kernel_mode_fpu.c
new file mode 100644
index 000000000000..0ac8348876c4
--- /dev/null
+++ b/arch/riscv/kernel/kernel_mode_fpu.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#include <linux/export.h>
+#include <linux/preempt.h>
+
+#include <asm/csr.h>
+#include <asm/fpu.h>
+#include <asm/processor.h>
+#include <asm/switch_to.h>
+
+void kernel_fpu_begin(void)
+{
+	preempt_disable();
+	fstate_save(current, task_pt_regs(current));
+	csr_set(CSR_SSTATUS, SR_FS);
+}
+EXPORT_SYMBOL_GPL(kernel_fpu_begin);
+
+void kernel_fpu_end(void)
+{
+	csr_clear(CSR_SSTATUS, SR_FS);
+	fstate_restore(current, task_pt_regs(current));
+	preempt_enable();
+}
+EXPORT_SYMBOL_GPL(kernel_fpu_end);
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
