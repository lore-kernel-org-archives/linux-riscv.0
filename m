Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D57C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AZUTqSB7yRKo9vOZxVRWt1+v3He02h74FkEjXXndySw=; b=IXk5YN2dyrH/hUBpYHa5uJeKAJ
	sM+G2jzJ2LN8IL3tCxvkWCAvB23tN3UXdATJvLF5aw7tI+ltsmefJSs3kyg66jtirIG/tED7R5Txt
	DcWOU90bvDmdnwIZw059n2c//e55jQmOf9Iu9J9+vH2pQwGeyLCQcu0rPmowt3g+g8tFn3mtFaAgK
	OfylHgpdaTVsgtq60CVJdkBqiTpzc7CHx9BA5XScVRX1AHZVjGa8igP2oDHOHwtxdItHSExCur2Ja
	rZQXTs0FtzYbJg114SzRIftV/mPxMh0bhEPrhhAdDpUw5gmxNkb76mqEhaFSPUXBhbGFawwlkOECb
	n/4LQqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3XR-00000008VEJ-2T9V;
	Thu, 24 Jul 2025 21:31:41 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3XO-00000008VCn-2dww
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 21:31:39 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-74927be2ec0so2254426b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 14:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753392697; x=1753997497; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GNn2q0Z8fFnvvjG2A8fpdx/gfmHIZHIsS4NnWlZQeUk=;
        b=elxj+xMguLaAS1jINVkZ7X6r21e6J79hxcVcoNFkPX3WO4OpXaJxE9zCEVS9020Jzj
         r9MoZIffhj0tSEY8z32ydQuwpP1m9PoFVyDQoVaSgjamlvf5xXnZQ918en0wMDhSTDkf
         T6qOkwE4pMpcfwEdmyMc9jMYYXApEUiXoBOwid3fTLSkf6VU//nr3Gwg8fMoKEKHTTAk
         Vh5JEUUMJJeeec4OJ6PgsDyP2WWdpaWtKmHBuh0ZLoBJSEb+1Po53bepKn0Yq7XWrvW+
         4WmkVL/dGzlIYWZkXI3DHFURqBFcXMWOcMX0bvDiJoBalb4zV1GxtQeuQPLhr3gM1AAQ
         Fzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392697; x=1753997497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GNn2q0Z8fFnvvjG2A8fpdx/gfmHIZHIsS4NnWlZQeUk=;
        b=JU8onSc6eKJ0ygJjQrS8+BANCPgpt+jbtNuSIexPmkVx1lTxN6Poora8MMwCSK5NZ0
         LfU8NTp+R9vLgAH9NsGCOTZ/l5SxpStqjsRvy7jO2J7SCKoeKKwNL4Q8Uon+/fGaIdq7
         nvFcCrNQfFf8I9BuewRNRXrfGdtFQc78lh9YvqyoxkRdFd8csBSXrdEbCh7M0U8qg16m
         Yc6kJ6K/NGPDb2cJbnVQQFxVQmSD30hKX+IWdNeFrMoSzJ6eFKU5rJA5pm68u/Kr3zcl
         mDXOn+PXTVYQx+/wlxudzZHwpF5HRFKxusqZOPFTWu0b2Qaqm7fOP71TZ5vJ3YGAb7sO
         K0jg==
X-Forwarded-Encrypted: i=1; AJvYcCW5sW2m8MEyuOOYHR01ElFRAYN82cxQZHMIai/HLU1Nbvea6a/sOm4hy5dwdcGbGqjkK0QEThrfV8Eixw==@lists.infradead.org
X-Gm-Message-State: AOJu0YycGzdaq9fMjbn0murm5zrmGttPCAoN9hXsSdGlrXUjRFJg9hQU
	5vp6Si51BYBLpVEp6N9oltmq/pwvg0tOPOsusnSijBPONDbM5pM4vjPHCOJiv4qPex0Al4mB8LT
	GzsVQ3GarYV3uHw==
X-Google-Smtp-Source: AGHT+IFvUnez9Bkuwx2pMJHu6VcnoXxwXp4RquHl0WtbI1rpTaCty2K5T3a3JzCxfErZmH7ew+8CdlnN0ixiJg==
X-Received: from pfbjr14.prod.google.com ([2002:a05:6a00:914e:b0:747:a8ac:ca05])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2315:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-76035bfa5ebmr11692206b3a.24.1753392697163;
 Thu, 24 Jul 2025 14:31:37 -0700 (PDT)
Date: Thu, 24 Jul 2025 21:31:30 +0000
In-Reply-To: <20250724213130.3374922-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20250724213130.3374922-1-dmatlack@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250724213130.3374922-3-dmatlack@google.com>
Subject: [PATCH v2 2/2] KVM: selftests: Rename $(ARCH_DIR) to $(SRCARCH)
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sean Christopherson <seanjc@google.com>, 
	David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_143138_671084_C4EB39B1 
X-CRM114-Status: GOOD (  11.58  )
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

Rename $(ARCH_DIR) to $(SRCARCH) to match the top-level kernel Makefile
which uses $(SRCARCH) to represent the same thing that $(ARCH_DIR)
represents in the KVM selftests.

This change also paves the way for eventually sharing the code construct
$(SRCARCH) with the top-level kernel Makefile instead of KVM having its
own logic e.g. to convert x86_64 to x86.

While here, drop the comment about the top-level selftests allowing
ARCH=x86_64. The kernel itself allows/expects ARCH=x86_64 so it's
reasonable to expect the KVM selftests to handle it as well.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/Makefile     | 10 ++++-----
 tools/testing/selftests/kvm/Makefile.kvm | 26 ++++++++++++------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 7aad782aeb1d..340657052fc3 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -1,15 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 top_srcdir = ../../../..
+
 include $(top_srcdir)/scripts/subarch.include
 ARCH            ?= $(SUBARCH)
+SRCARCH := $(ARCH)
 
-ifeq ($(ARCH),$(filter $(ARCH),arm64 s390 riscv x86 x86_64 loongarch))
-# Top-level selftests allows ARCH=x86_64 :-(
 ifeq ($(ARCH),x86_64)
-	ARCH_DIR := x86
-else
-	ARCH_DIR := $(ARCH)
+        SRCARCH := x86
 endif
+
+ifeq ($(SRCARCH),$(filter $(SRCARCH),arm64 s390 riscv x86 loongarch))
 include Makefile.kvm
 else
 # Empty targets for unsupported architectures
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index d770c2f244da..d2729e678025 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -215,10 +215,10 @@ TEST_GEN_PROGS_loongarch += set_memory_region_test
 SPLIT_TESTS += arch_timer
 SPLIT_TESTS += get-reg-list
 
-TEST_PROGS += $(TEST_PROGS_$(ARCH_DIR))
-TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
-TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
-LIBKVM += $(LIBKVM_$(ARCH_DIR))
+TEST_PROGS += $(TEST_PROGS_$(SRCARCH))
+TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(SRCARCH))
+TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(SRCARCH))
+LIBKVM += $(LIBKVM_$(SRCARCH))
 
 OVERRIDE_TARGETS = 1
 
@@ -231,24 +231,24 @@ include ../cgroup/lib/libcgroup.mk
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
 LINUX_TOOL_INCLUDE = $(top_srcdir)/tools/include
-LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH_DIR)/include
+LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(SRCARCH)/include
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
 	-Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT \
 	-fno-builtin-memcmp -fno-builtin-memcpy \
 	-fno-builtin-memset -fno-builtin-strnlen \
 	-fno-stack-protector -fno-PIE -fno-strict-aliasing \
 	-I$(LINUX_TOOL_INCLUDE) -I$(LINUX_TOOL_ARCH_INCLUDE) \
-	-I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(ARCH_DIR) \
+	-I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(SRCARCH) \
 	-I ../rseq -I.. $(EXTRA_CFLAGS) $(KHDR_INCLUDES)
-ifeq ($(ARCH_DIR),s390)
+ifeq ($(SRCARCH),s390)
 	CFLAGS += -march=z10
 endif
-ifeq ($(ARCH_DIR),x86)
+ifeq ($(SRCARCH),x86)
 ifeq ($(shell echo "void foo(void) { }" | $(CC) -march=x86-64-v2 -x c - -c -o /dev/null 2>/dev/null; echo "$$?"),0)
 	CFLAGS += -march=x86-64-v2
 endif
 endif
-ifeq ($(ARCH_DIR),arm64)
+ifeq ($(SRCARCH),arm64)
 tools_dir := $(top_srcdir)/tools
 arm64_tools_dir := $(tools_dir)/arch/arm64/tools/
 
@@ -282,7 +282,7 @@ LIBKVM_S_OBJ := $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
 LIBKVM_STRING_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
 LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ) $(LIBCGROUP_O)
 SPLIT_TEST_GEN_PROGS := $(patsubst %, $(OUTPUT)/%, $(SPLIT_TESTS))
-SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(ARCH_DIR)/%.o, $(SPLIT_TESTS))
+SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(SRCARCH)/%.o, $(SPLIT_TESTS))
 
 TEST_GEN_OBJ = $(patsubst %, %.o, $(TEST_GEN_PROGS))
 TEST_GEN_OBJ += $(patsubst %, %.o, $(TEST_GEN_PROGS_EXTENDED))
@@ -291,7 +291,7 @@ TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBKVM_OBJS))
 TEST_DEP_FILES += $(patsubst %.o, %.d, $(SPLIT_TEST_GEN_OBJ))
 -include $(TEST_DEP_FILES)
 
-$(shell mkdir -p $(sort $(OUTPUT)/$(ARCH_DIR) $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
+$(shell mkdir -p $(sort $(OUTPUT)/$(SRCARCH) $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
 
 $(filter-out $(SPLIT_TEST_GEN_PROGS), $(TEST_GEN_PROGS)) \
 $(TEST_GEN_PROGS_EXTENDED): %: %.o
@@ -299,9 +299,9 @@ $(TEST_GEN_PROGS_EXTENDED): %: %.o
 $(TEST_GEN_OBJ): $(OUTPUT)/%.o: %.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
-$(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH_DIR)/%.o
+$(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(SRCARCH)/%.o
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
-$(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH_DIR)/%.o: $(ARCH_DIR)/%.c
+$(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(SRCARCH)/%.o: $(SRCARCH)/%.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
 EXTRA_CLEAN += $(GEN_HDRS) \
-- 
2.50.1.470.g6ba607880d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
