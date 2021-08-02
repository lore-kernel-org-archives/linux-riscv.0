Return-Path: <SRS0=JNkM=MZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3D6C4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Aug 2021 21:01:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E84160F11
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Aug 2021 21:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E84160F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=eIBsfunUpsmoOqdguZk98yNZ+cAohmLJGeZrFv2rVIc=; b=nKG
	Z/ZZhFjLC0JcEXx3N4LoD1PJHFgQk/wSBWbNUjyccuyBKlvtNDBzW/WMCO7Eb2b3BSlkgeLpmdFer
	JjSYlhoF8ZOgahr1PinDJDfOEslSxusekEFXhwbiVLQh40frBMmOQRwcoJfFY/GBhXlDrlCAb7vEV
	i/cS072tWNiQUTQoXFIPunMG24snzedx63CkGvF++ri5YN4kzXQ8oCEDAvWPspgUAXsA1R8n+2sxP
	PNja5SSsZ341UybI911xPFOIdoKPbb/7zniSmRHov3W2Joz8tQ42yr4DE4zEQpGap708gm9Rb1eVN
	2jWkSGkcbOPNldFfgI1EWKJDuCSgQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAf3R-000EsI-Qd; Mon, 02 Aug 2021 21:00:57 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAf3O-000Epk-7f
 for linux-riscv@lists.infradead.org; Mon, 02 Aug 2021 21:00:55 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 w200-20020a25c7d10000b02905585436b530so20407313ybe.21
 for <linux-riscv@lists.infradead.org>; Mon, 02 Aug 2021 14:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=OoLM5GDms1jfZ6y4Gk1k9eO6cWXtYL+TWzyRucDvVfA=;
 b=XJtClUzYLLXjYHOvxy9DSAO9KvUZgtqCqzEDJdmLkunONTYMt6GbjLgqsXu7QKrrMI
 IAwAreniD2nLhRA+EBw0TSC7iD7GllMAAZZLgoqa9CTW5oB4K6n75yF48OwhrC/skVi2
 wuLI4ZESOldy89Qjlnsqwirzgvk0SgONq1sBU4YARzQK94LXVB0q2do4d35V26F/9tVo
 NsmiRjppalhRjJm8asHWxkmcxZkK94maNIDxCabo95mivm5HisexFZpZvleoZvB59tql
 EY24JfKZOWGcMwVkI5HEnCiC9MLHOBXpYoyWy3T+JrOIESFwMa19AHxyI1nXbgCqe2Uo
 ztqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=OoLM5GDms1jfZ6y4Gk1k9eO6cWXtYL+TWzyRucDvVfA=;
 b=tzXiS5rUXTy7ZLXnFoPhXxT0RMELgOs+c34KQ6wDi3xTMMOOWL/7KZz6RY/shPr9Wu
 a2X/Uyfu+2dGVNhBNyz4Ks4mezzc/MHDtNE1aS9tdw77ZmaQI+6S65Gc64/t1YpE9wtU
 P7pnNz7q4VKFet1EWG7fREgX+eGYdb+0G8K4uklb3x9Un0tUL20G8mmnpkuV0LfgngSH
 vLveZ6ae1Kyis9cuoYO6XQ7YU9YES2Ksbm+ZQpbknsg7ABr63trHYQBRZO4S7WJcqdKa
 SIPgk+wtI8yiwK4cGFuCKGEqaI9upD4zdef+8lAkjocO9yhaLevx0sMJIaD2g+WIBysI
 I/vg==
X-Gm-Message-State: AOAM532KzJFRRLxJG5mzr+Y9CbQ6uKCF2BWBuJ6jJ471jIaCUIiGvtnn
 8PVnLaO5KdPi8+SulJnhmMmRlc1ZODF2kWAE+auCgfPQykYO6EWmKInD+4ynDSVhIqa0ljyKFDw
 PegPiJaZdNpe1SO9cu0R6kFjJsxOsFodmwydgmLygFs3iQ36vat6kcz3xvFltlu87AbIsW60VJb
 aG5mY=
X-Google-Smtp-Source: ABdhPJzBvucKHIMweIDl3BdrobRn6IW1m9USz1Sy/nCMSJpejfHC6+264kj7Ouh/T6rzlCsxIz+723Uk9Kd67w==
X-Received: from abdulras.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:41e1])
 (user=abdulras job=sendgmr) by 2002:a25:ac18:: with SMTP id
 w24mr25228768ybi.289.1627938048937; Mon, 02 Aug 2021 14:00:48 -0700 (PDT)
Date: Mon,  2 Aug 2021 21:00:17 +0000
Message-Id: <20210802210016.642262-1-abdulras@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH] riscv: explicitly use symbol offsets for VDSO v2
From: Saleem Abdulrasool <abdulras@google.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 clang-built-linux@googlegroups.com, Saleem Abdulrasool <abdulras@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_140054_355405_6D86DCF9 
X-CRM114-Status: GOOD (  22.24  )
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

The current implementation of the `__rt_sigaction` reference computed an
absolute offset relative to the mapped base of the VDSO.  While this can
be handled in the medlow model, the medany model cannot handle this as
it is meant to be position independent.  The current implementation
relied on the BFD linker relaxing the PC-relative relocation into an
absolute relocation as it was a near-zero address allowing it to be
referenced relative to `zero`.

We now extract the offsets and create a generated header allowing the
build with LLVM and lld to succeed as we no longer depend on the linker
rewriting address references near zero.  This change was largely
modelled after the ARM64 target which does something similar.

Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
---
 arch/riscv/Makefile                        |  4 ++++
 arch/riscv/include/asm/vdso.h              | 11 ++--------
 arch/riscv/kernel/vdso/Makefile            | 25 ++++++++++------------
 arch/riscv/kernel/vdso/gen_vdso_offsets.sh |  5 +++++
 arch/riscv/kernel/vdso/so2s.sh             |  6 ------
 5 files changed, 22 insertions(+), 29 deletions(-)
 create mode 100755 arch/riscv/kernel/vdso/gen_vdso_offsets.sh
 delete mode 100755 arch/riscv/kernel/vdso/so2s.sh

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index bc74afdbf31e..e026b2d0a5a4 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -108,6 +108,10 @@ PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
 
+prepare: vdso_prepare
+vdso_prepare: prepare0
+	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
+
 ifneq ($(CONFIG_XIP_KERNEL),y)
 ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
 KBUILD_IMAGE := $(boot)/loader.bin
diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index 1453a2f563bc..098795262b92 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -9,24 +9,17 @@
 #define _ASM_RISCV_VDSO_H
 
 #include <linux/types.h>
+#include <generated/vdso-offsets.h>
 
 #ifndef CONFIG_GENERIC_TIME_VSYSCALL
 struct vdso_data {
 };
 #endif
 
-/*
- * The VDSO symbols are mapped into Linux so we can just use regular symbol
- * addressing to get their offsets in userspace.  The symbols are mapped at an
- * offset of 0, but since the linker must support setting weak undefined
- * symbols to the absolute address 0 it also happens to support other low
- * addresses even when the code model suggests those low addresses would not
- * otherwise be availiable.
- */
 #define VDSO_SYMBOL(base, name)							\
 ({										\
 	extern const char __vdso_##name[];					\
-	(void __user *)((unsigned long)(base) + __vdso_##name);			\
+	(void __user *)((unsigned long)(base) + __vdso_##name##_offset);	\
 })
 
 asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 24d936c147cd..f8cb9144a284 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -23,10 +23,10 @@ ifneq ($(c-gettimeofday-y),)
 endif
 
 # Build rules
-targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds vdso-syms.S
+targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds
 obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
 
-obj-y += vdso.o vdso-syms.o
+obj-y += vdso.o
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 
 # Disable -pg to prevent insert call site
@@ -43,20 +43,22 @@ $(obj)/vdso.o: $(obj)/vdso.so
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
 	$(call if_changed,vdsold)
-LDFLAGS_vdso.so.dbg = -shared -s -soname=linux-vdso.so.1 \
+LDFLAGS_vdso.so.dbg = -shared -S -soname=linux-vdso.so.1 \
 	--build-id=sha1 --hash-style=both --eh-frame-hdr
 
-# We also create a special relocatable object that should mirror the symbol
-# table and layout of the linked DSO. With ld --just-symbols we can then
-# refer to these symbols in the kernel code rather than hand-coded addresses.
-$(obj)/vdso-syms.S: $(obj)/vdso.so FORCE
-	$(call if_changed,so2s)
-
 # strip rule for the .so file
 $(obj)/%.so: OBJCOPYFLAGS := -S
 $(obj)/%.so: $(obj)/%.so.dbg FORCE
 	$(call if_changed,objcopy)
 
+# Generate VDSO offsets using helper script
+gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
+quiet_cmd_vdsosym = VDSOSYM $@
+	cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
+
+include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
+	$(call if_changed,vdsosym)
+
 # actual build commands
 # The DSO images are built using a special linker script
 # Make sure only to export the intended __vdso_xxx symbol offsets.
@@ -65,11 +67,6 @@ quiet_cmd_vdsold = VDSOLD  $@
                    $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
                    rm $@.tmp
 
-# Extracts symbol offsets from the VDSO, converting them into an assembly file
-# that contains the same symbols at the same offsets.
-quiet_cmd_so2s = SO2S    $@
-      cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
-
 # install commands for the unstripped file
 quiet_cmd_vdso_install = INSTALL $@
       cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
diff --git a/arch/riscv/kernel/vdso/gen_vdso_offsets.sh b/arch/riscv/kernel/vdso/gen_vdso_offsets.sh
new file mode 100755
index 000000000000..c2e5613f3495
--- /dev/null
+++ b/arch/riscv/kernel/vdso/gen_vdso_offsets.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+LC_ALL=C
+sed -n -e 's/^[0]\+\(0[0-9a-fA-F]*\) . \(__vdso_[a-zA-Z0-9_]*\)$/\#define \2_offset\t0x\1/p'
diff --git a/arch/riscv/kernel/vdso/so2s.sh b/arch/riscv/kernel/vdso/so2s.sh
deleted file mode 100755
index e64cb6d9440e..000000000000
--- a/arch/riscv/kernel/vdso/so2s.sh
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0+
-# Copyright 2020 Palmer Dabbelt <palmerdabbelt@google.com>
-
-sed 's!\([0-9a-f]*\) T \([a-z0-9_]*\)\(@@LINUX_4.15\)*!.global \2\n.set \2,0x\1!' \
-| grep '^\.'
-- 
2.32.0.554.ge1b32706d8-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
