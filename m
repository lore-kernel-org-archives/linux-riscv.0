Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A6EC369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 22:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZeWb0zcOcyzWAsJcmT8IqllXb2DbOr3xfCFL0S08QMA=; b=23b
	QgT0Noip0CKTArSsBLcyAMAZ8EeGY0Z2FJbTuA9bDW3I+4QVh2UBlewBa73kCetJwwCFpDDMNJamH
	NcWA2rtq+/F0WHPiCYLNMlAD/lK6hMSKDQV2vfsu/BcWfex9eF+y/e++IJglHZITDskDQD1Qo9eIM
	JPYJ9NFh06eHMZ7UUq/RI7pJCuQyT7pqZK5tn4YgMCTSwL7KkaHjUQMnh/AblGk3bOMvKI32I8p+o
	f6Bt55ZUDdONwuKVNaFaVkNQVpRzmKX6Xiqb+CM1zalA24qMynKb/8sO5k9zot7wHlxbMaar0/ymT
	YMxJVWmDjfr/DNWBaALMiAmIxO6GXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGDA-0000000EBl6-0PWw;
	Wed, 30 Apr 2025 22:47:28 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGD7-0000000EBkf-0t3v
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 22:47:26 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22650077995so4923485ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 15:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746053243; x=1746658043; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I6d6xMX81cfx8vl/Zx5jrRQk1gOoG8o0iyTTHEscye4=;
        b=q8I1vEEZRxZruNIIzoJVYpYoffGR3Tm7Io4m89eBN5bT0OZ0fxhm3aC39VDmLFtyk4
         uuoozDftqWcapUDaDqmj/XHzokdncjGjNu9Fu99wUmWuPO9ZqK4WAyQzt+4R6gJCL828
         rmXbZyv00E46zGjw0EREa5I5AVhjeeuVJKB7VJC/C5YipaV1q8liSWQSsGWN0jpeHG1T
         Eucjm2OFBKsIG/Rv+DiJRjoKeHUvMQhxTExQ2a4Z+Q6WFNfpOUU+HwKJSZcrWe5ZZCAs
         uy9XabFc99mREtcgw67MaPWN4Bczk9u7BR037JQnxv1JuUEgMQkF5w+Z3iNeobp3mFs/
         uOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053243; x=1746658043;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6d6xMX81cfx8vl/Zx5jrRQk1gOoG8o0iyTTHEscye4=;
        b=RpMg07j0tWqJbSE6/WEgjPyBTAML2QXbElATEqFsckhXw0sSL6jv6OdLhJBwInG7L2
         e4FcnSgP1iTdEMBrVnDLcljtI2W2qhP+PVRC01Jnlrvugs2L80jRqAKSO7X+nmWv5RWT
         6EQyJrQ/wpjoUgLPF2nFA7ZsPPkCoGgYd4WCQBTAh1K5zWAN6mVX1QLUVMJjsMG4FIxH
         NmHxfuyR2vB5hS5tpw2WJSn603itM6WJgCPPq7CUn96GalSbPusmHP+ZRUgv6BEskDoW
         Oo0/l4IU5YkxV0k3gXuMSCfIJP6T+l9Ztk8YCOs2NsVl9SZVcQeigMyeWlUSP25iTvkq
         i/wA==
X-Forwarded-Encrypted: i=1; AJvYcCWLP3qVNKf0dWmo0YMcC82AI9UvXWRuMZB949sq1a567+ssCJxdV14GcXxLQ7SYSRVtScn7ObUob/d44w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtDe8bJRPWsKIU/QWRpgKnnWYhe+VzX1BC5L/jwEhHs93AsL5K
	IUI8XAwsgu91R2+LoIPRkw8x74cUouG8f+p55NzFwluSFpXZv7+jZTB5VlJ9EkZ1hGpo84cmQW8
	iEKsMAknG2w==
X-Google-Smtp-Source: AGHT+IHfuB23NFkGxUOAohzZBfnYlQDcsto8mmtSQcnh90hh0T1xBgxRL74TiSJiuHrr2SC7EIvaioBXJP/2qw==
X-Received: from plblq15.prod.google.com ([2002:a17:903:144f:b0:223:6458:d313])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f693:b0:223:90ec:80f0 with SMTP id d9443c01a7336-22e040c1f99mr12828775ad.22.1746053243561;
 Wed, 30 Apr 2025 15:47:23 -0700 (PDT)
Date: Wed, 30 Apr 2025 15:47:20 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430224720.1882145-1-dmatlack@google.com>
Subject: [PATCH] KVM: selftests: Use $(SRCARCH) instead of $(ARCH)
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Sean Christopherson <seanjc@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_154725_250605_631E4E4C 
X-CRM114-Status: GOOD (  10.46  )
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

Use $(SRCARCH) in Makefile.kvm instead of $(ARCH). The former may have
been set on the command line and thus make will ignore the variable
assignment to convert x86_64 to x86.

Introduce $(SRCARCH) rather than just reverting commit 9af04539d474
("KVM: selftests: Override ARCH for x86_64 instead of using ARCH_DIR")
to keep KVM selftests consistent with the top-level kernel Makefile,
which uses $(SRCARCH) for the exact same purpose.

While here, drop the comment about the top-level selftests allowing
ARCH=x86_64. The kernel itself allows/expects ARCH=x86_64 so it's
reasonable to expect the KVM selftests to handle it as well.

Fixes: 9af04539d474 ("KVM: selftests: Override ARCH for x86_64 instead of using ARCH_DIR")
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/Makefile     | 10 +++++----
 tools/testing/selftests/kvm/Makefile.kvm | 26 ++++++++++++------------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 20af35a91d6f..02bf061c51f8 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -1,13 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 top_srcdir = ../../../..
+
 include $(top_srcdir)/scripts/subarch.include
-ARCH            ?= $(SUBARCH)
+ARCH 	?= $(SUBARCH)
+SRCARCH := $(ARCH)
 
-ifeq ($(ARCH),$(filter $(ARCH),arm64 s390 riscv x86 x86_64))
-# Top-level selftests allows ARCH=x86_64 :-(
 ifeq ($(ARCH),x86_64)
-	ARCH := x86
+        SRCARCH := x86
 endif
+
+ifeq ($(SRCARCH),$(filter $(SRCARCH),arm64 s390 riscv x86))
 include Makefile.kvm
 else
 # Empty targets for unsupported architectures
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f62b0a5aba35..065029b35355 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -193,10 +193,10 @@ TEST_GEN_PROGS_riscv += steal_time
 SPLIT_TESTS += arch_timer
 SPLIT_TESTS += get-reg-list
 
-TEST_PROGS += $(TEST_PROGS_$(ARCH))
-TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH))
-TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH))
-LIBKVM += $(LIBKVM_$(ARCH))
+TEST_PROGS += $(TEST_PROGS_$(SRCARCH))
+TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(SRCARCH))
+TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(SRCARCH))
+LIBKVM += $(LIBKVM_$(SRCARCH))
 
 OVERRIDE_TARGETS = 1
 
@@ -208,24 +208,24 @@ include ../lib.mk
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
 LINUX_TOOL_INCLUDE = $(top_srcdir)/tools/include
-LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
+LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(SRCARCH)/include
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
 	-Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT \
 	-fno-builtin-memcmp -fno-builtin-memcpy \
 	-fno-builtin-memset -fno-builtin-strnlen \
 	-fno-stack-protector -fno-PIE -fno-strict-aliasing \
 	-I$(LINUX_TOOL_INCLUDE) -I$(LINUX_TOOL_ARCH_INCLUDE) \
-	-I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(ARCH) \
+	-I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(SRCARCH) \
 	-I ../rseq -I.. $(EXTRA_CFLAGS) $(KHDR_INCLUDES)
-ifeq ($(ARCH),s390)
+ifeq ($(SRCARCH),s390)
 	CFLAGS += -march=z10
 endif
-ifeq ($(ARCH),x86)
+ifeq ($(SRCARCH),x86)
 ifeq ($(shell echo "void foo(void) { }" | $(CC) -march=x86-64-v2 -x c - -c -o /dev/null 2>/dev/null; echo "$$?"),0)
 	CFLAGS += -march=x86-64-v2
 endif
 endif
-ifeq ($(ARCH),arm64)
+ifeq ($(SRCARCH),arm64)
 tools_dir := $(top_srcdir)/tools
 arm64_tools_dir := $(tools_dir)/arch/arm64/tools/
 
@@ -259,7 +259,7 @@ LIBKVM_S_OBJ := $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
 LIBKVM_STRING_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
 LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ)
 SPLIT_TEST_GEN_PROGS := $(patsubst %, $(OUTPUT)/%, $(SPLIT_TESTS))
-SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(ARCH)/%.o, $(SPLIT_TESTS))
+SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(SRCARCH)/%.o, $(SPLIT_TESTS))
 
 TEST_GEN_OBJ = $(patsubst %, %.o, $(TEST_GEN_PROGS))
 TEST_GEN_OBJ += $(patsubst %, %.o, $(TEST_GEN_PROGS_EXTENDED))
@@ -268,7 +268,7 @@ TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBKVM_OBJS))
 TEST_DEP_FILES += $(patsubst %.o, %.d, $(SPLIT_TEST_GEN_OBJ))
 -include $(TEST_DEP_FILES)
 
-$(shell mkdir -p $(sort $(OUTPUT)/$(ARCH) $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
+$(shell mkdir -p $(sort $(OUTPUT)/$(SRCARCH) $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
 
 $(filter-out $(SPLIT_TEST_GEN_PROGS), $(TEST_GEN_PROGS)) \
 $(TEST_GEN_PROGS_EXTENDED): %: %.o
@@ -276,9 +276,9 @@ $(TEST_GEN_PROGS_EXTENDED): %: %.o
 $(TEST_GEN_OBJ): $(OUTPUT)/%.o: %.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
-$(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH)/%.o
+$(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(SRCARCH)/%.o
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
-$(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH)/%.o: $(ARCH)/%.c
+$(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(SRCARCH)/%.o: $(SRCARCH)/%.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
 EXTRA_CLEAN += $(GEN_HDRS) \

base-commit: 45eb29140e68ffe8e93a5471006858a018480a45
-- 
2.49.0.906.g1f30a19c02-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
