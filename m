Return-Path: <SRS0=Ffl8=L7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A48C07E95
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jul 2021 18:51:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B3961CB2
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jul 2021 18:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9B3961CB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HyhWOZAg7mcOd1o5qfRbMG7H3kH5u+OVF/iWXTcGQ9U=; b=2mP
	nGvVfvL56Gu6WmrVgBYD4HGA7bP/xQLPD8+coO1hcSUNAKdUNovNIr84bHhjqGYxJsB357P/VPg6l
	PM74VsxCaHPdb7dejHMMvEZCBsWd8cI1DNaCKtxeJptBuQPftVZiUzDPcKKRbd6jmPApEKQY2PVpU
	nN1WPQ9H3ZjbKBdcHdaUOWy+Rxc2mt5Qc9+SbrKCJsMChUagCxDaOdaOnmQLsWbLIvTeT3L14H9SD
	IQiKQKKbIzmVkgSe/vxO6LRGpqVSgttr4S9o2MQhU4NSF0ZYdpcX7TRIgz+HvGVRSFtN1DMEPqmSX
	0V4LCOuXQsbEA+ULa1MfXKlVuTc2kSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Cdn-00FYth-43; Wed, 07 Jul 2021 18:51:23 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Cdj-00FYsx-H9
 for linux-riscv@lists.infradead.org; Wed, 07 Jul 2021 18:51:21 +0000
Received: by mail-pf1-x44a.google.com with SMTP id
 d22-20020a056a0024d6b0290304cbae6fdcso2099915pfv.21
 for <linux-riscv@lists.infradead.org>; Wed, 07 Jul 2021 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=cTXCexUCBYLjSq8WLV6y4Psori5M9mLAKAHZFzbkUxE=;
 b=OrPI9jXSGASdQUDl6kI263sh5Mio1Rf8HCJNzHaY7NR6DEFJ3YeuqF5/9uDfdzGfZa
 pDvpAF5aTDBe+jxgDpRWBf2K+TI2SEjDxQWIuy2I5oHyieVUyk15cYxdQYG/R4YCHSmb
 XjZALcdD2m4k09rgUsNoE90XsHZvm7TMgxJJ0AVOwh8lBK84XKfrlyqYhxLCfGn2PvXd
 RYskLuggttGWUJ8KhjZYewVj4x/iz0m6/zxgKFlefBhb0SiXC/5KrwByKDVdk9cCf+ye
 y41AbslvwMS/8IIUmDhuV6iutMgcqYP55AX5dZ2TI91UAtQlfHMF2PR7kK6eLsG1FZ6K
 ulEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=cTXCexUCBYLjSq8WLV6y4Psori5M9mLAKAHZFzbkUxE=;
 b=fXv4AFpMg7WuiwyGuVaKATsE16QVx+9o25wuhMIyHkTBpl+E2Uo/fvku0wBo0Aq8L3
 HxZyXDQcV/pybpJPrgIlRLIUbowxBAkaD85OVRByVYzP6vrxpzzyl7ZF7rcTldyJxq5W
 PcaYhjpYOaY+jiRMx88JLIpGMkcKPvCeyH/Zh3uj2Wcjp1fgnpTvCSE7/CWrqqo9Khu+
 gnLTAlKNXwxxYcUJV5Hjl8ZyjRET8JL9dfIOqvfbASZ9kPrLNQkToit7XNuzqzjFNjT6
 GmhVyMrSxhhaaMsr1XbwXyZFJIm4SLdQR1YlZCk7Luv05meRTww3qbr4hkzuOCIFmv6L
 eu6g==
X-Gm-Message-State: AOAM5318UH0oMZO5kEXjkTEi463OHCrVBEuC8xvbJwzxWM8GF5Zn+Pgy
 3FlKijfLUXcp8Wnpwuo6qsFrJO4F2GCqfg==
X-Google-Smtp-Source: ABdhPJykBvcRyNzdtBhE2SdtWe6ckhl0TLkLvtHmT/DPg7RRqbFnKZnyUzQuLHzYvDOrJcuyKi49Nvn4teXU6w==
X-Received: from abdulras.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:41e1])
 (user=abdulras job=sendgmr) by 2002:a05:6a00:2145:b029:30b:127:e0a3 with SMTP
 id o5-20020a056a002145b029030b0127e0a3mr26856522pfk.34.1625683877901; Wed, 07
 Jul 2021 11:51:17 -0700 (PDT)
Date: Wed,  7 Jul 2021 18:51:05 +0000
Message-Id: <20210707185105.1180526-1-abdulras@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH] riscv: explicitly use symbol offsets for VDSO
From: Saleem Abdulrasool <abdulras@google.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Nathan Chancellor <natechancellor@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Saleem Abdulrasool <abdulras@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_115119_622301_78DB279A 
X-CRM114-Status: GOOD (  22.21  )
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
 arch/riscv/include/asm/vdso.h              | 11 ++---------
 arch/riscv/kernel/vdso/Makefile            | 21 +++++++++------------
 arch/riscv/kernel/vdso/gen_vdso_offsets.sh |  5 +++++
 arch/riscv/kernel/vdso/so2s.sh             |  6 ------
 5 files changed, 20 insertions(+), 27 deletions(-)
 create mode 100755 arch/riscv/kernel/vdso/gen_vdso_offsets.sh
 delete mode 100755 arch/riscv/kernel/vdso/so2s.sh

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index e241e0e85ac8..f2beaa3c9fcb 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -92,6 +92,10 @@ PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
 
+prepare: vdso_prepare
+vdso_prepare: prepare0
+	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
+
 ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_KENDRYTE),yy)
 KBUILD_IMAGE := $(boot)/loader.bin
 else
diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index 8454f746bbfd..a72c4093d1c7 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -9,24 +9,17 @@
 #define _ASM_RISCV_VDSO_H
 
 #include <linux/types.h>
+#include <generated/vdso-offsets.h>
 
 #ifndef GENERIC_TIME_VSYSCALL
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
index f001ae91ef46..17cb755cf282 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -42,20 +42,22 @@ $(obj)/vdso.o: $(obj)/vdso.so
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
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
@@ -64,11 +66,6 @@ quiet_cmd_vdsold = VDSOLD  $@
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
2.32.0.93.g670b81a890-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
