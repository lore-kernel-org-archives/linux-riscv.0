Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4199CCD128D
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQV3WvmoLQG9ojSOU7c/BiR28mavtKxjBrW/wb97ne0=; b=jKqjxxWVHGUTCa
	ijbyzwTRLtk88BPAow+DxtmQ7gVL0IC0o4ovKeJkgqLY3jhkCWt6ZyxIowq/JT/Y5SITBmaMW3unH
	t1BVyi35CMRmbDUuW7SL1bnWa6dQS1vkyHhZ20vr48JdIuCSfQCh7qqTGMYPQRsp2/yFE7sMsq/qg
	v6k2z4frXWwf9m5GfTi5ZXHjftM6HVRVFi9QZfnd2+xkujUFjMlPY2djEWSYVuuKccst+4vdXPLVH
	Lgt5oRG7xqvWqRwNeN8Shjb7TgN9xCtEhSA/Mk/uxHt7hyfmI5J/756osyjuUo+2pE0daLUmoUTip
	4HJRrJAsonq7cBTHip0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6dn-0000000HA4e-2IbT;
	Fri, 29 Mar 2024 07:27:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bu-0000000H8mk-0TEL
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 07:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Z4EVp4FPE+/jeIRBNmVRsUyItk8Ntjq2i9UEb5o+3e0=; b=JunElJ/UZGZNzy+zxkUNEY+fMn
	VtUdXf7Z2PJUSbr/wl9pBly6UKabpJ9RL3THhmJ/knYBQhy9dlzokAOMg64j15jGZJNnkCMSvkWrS
	MbR08Bzv6eWKM+Sp+VCOQiuDnCwQRCnxpe6pOSUgP8FuBx4CxKzoaSoSVpH9f9a3WwwgfLY9rNzCH
	nlFhMCCuvMlhZFaWAnViOjOMnDuAEBBoNHxTb9c2ch/lVQR5JsZLqb2jEx6MM+dFF+vuAt2OJCV5U
	R1GGbPSvGt5OR6mEArFLjbhNR2bbHs76tSFS4HbAqyqe3v/niO5HHsTmFtrQxb+wGYl0DeRrBvEmv
	JxKJAIeQ==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bo-00000001Quu-34zZ
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:25:07 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-29c75e348afso1379356a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697103; x=1712301903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4EVp4FPE+/jeIRBNmVRsUyItk8Ntjq2i9UEb5o+3e0=;
        b=RK/qrRTgX+LiiZm89uNqUuFP+s9tqeoCWpShL1fCDsWDz45ZGspke2ZtC6D/GiG5FS
         NcyYW/e5Bvfec8RWdD6LECEn43BCleuB3JhUg/8ZajV28IwGljZvQgCTGVNBYER1wf7l
         G5RDjvm9oSWPnfr0vHjVz8bbrygZpI3oH6EbIviJxg1iCOpb+Pyhb2Yh8KLkFx/AgsNx
         57tUf5FP7kuwtkes3WWRVErJQrfWV5313eMdsQqkX5P5go2vRPydVVg1LbRNbnG6OEam
         AWMr4+G9OHpoEIiTElzqBHrcmnRmsLaA267MRFT0vZpAqLoXb+dJzXSvEcoX1WiEyT8/
         mMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697103; x=1712301903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4EVp4FPE+/jeIRBNmVRsUyItk8Ntjq2i9UEb5o+3e0=;
        b=gozgcqOigTXVWhGkGJRMnGDVgLIV2SlyT56s0ZoUSXpAGSmOwrX9LkbGC9JWD2DkxS
         EiLMdAuKBwe1ETldzc1SiL9/tOGTnbDWFOj5Q6s/3XCCEGmB/pWA78DLCxNLRukh4MBW
         FbVNg/ziSJehri/qlR+kmxplqtgUapuej+o6sKJbs5FDhSwK/nKW23oZZ0XmHj8hGOJE
         ztNOYpG/kUMs+XepKjGZAyCVmkHbaR6jQwsmEe2JxGtdmqUvSV7Ui7uOomyWZI/5OqaV
         HdWQ9s5Ky3EFWzp2leDFsDFSnJphmyIwya1uxemmpJbjbvYvHmTtLcBLlMxo5PAzf57k
         1HFw==
X-Forwarded-Encrypted: i=1; AJvYcCW+lhAsgw63lpgk8fUGqD78wkR2Upa3y2w4sGpkPSP9SDG5PcX9GKYofZzi2UcGFCP053oO7Cf43mwT8EFf6e7DpWhRE+0fMWhX6xPIeeLC
X-Gm-Message-State: AOJu0YyPYKS+tjPH7vof9Kq6e2wKe0PPzuvP597MVGAo/ReT3wmVbu86
	h+neSDl1LxDXnLdqTwndrNHVOXzGAM6+UNnynlmbabNCnBWGZBTxB0yRNDGmx7k=
X-Google-Smtp-Source: AGHT+IHObpmsfqDnVzwffSCR0G9zA2Nzm55W89HV7TW/i69TFVB/o13/9rds5tWd/Fn8feEYN1IDow==
X-Received: by 2002:a17:90a:f2ce:b0:29f:cbd8:ea11 with SMTP id gt14-20020a17090af2ce00b0029fcbd8ea11mr1691675pjb.15.1711697102774;
        Fri, 29 Mar 2024 00:25:02 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:25:02 -0700 (PDT)
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
Subject: [PATCH v4 11/15] riscv: Add support for kernel-mode FPU
Date: Fri, 29 Mar 2024 00:18:26 -0700
Message-ID: <20240329072441.591471-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072505_358674_74CE8120 
X-CRM114-Status: GOOD (  16.16  )
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

(no changes since v3)

Changes in v3:
 - Limit riscv ARCH_HAS_KERNEL_FPU_SUPPORT to 64BIT

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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
