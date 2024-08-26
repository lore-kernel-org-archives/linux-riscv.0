Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDE0C5472F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 19:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaUoP3PpM5zOLLP9ORD5jA0M90mahhAEkDH773joORs=; b=GQ1nBu7Q+GHAco
	x+yMzxxncJkOBzgz9WsmCywqCjUKeAOA0X5qbdRM2aFx0DrL4+MJzv7/BoSE5AET2yTwJiiyn+/DG
	oUz/Sqkc9TR0yXMgWeOAHOGV8566hZp7mDEez+boQj1ZadXyc0DOOi+hauoXdx5GDNZaNw53h+prp
	Fhae7E3Aa/DSEVs/GULM5/xVKuV8Ws5dtbJBXY5xwoJqDdcL8SVq7m+pVn63wnVgcDYAS2ejV73B+
	meD20ln0nuG68T/KJeldrYRevOUrF/IIurGRv8DsHw7wDeYhYU9i2lz5/tVqrWX+95yNSTI122tSv
	A3vQS8zpGjZAuibJtaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siezk-00000008RDg-0v3N;
	Mon, 26 Aug 2024 19:03:16 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siey1-00000008Qfv-1GDw
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 19:01:30 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e11cdb464f2so7515463276.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 12:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724698887; x=1725303687; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wlfMvk8YP/kQvzhrtnMiI9Fgfb/TBne1V0LIqcoAt2M=;
        b=T/KoBh7Ynvx+A39G1ynmAqLkTZz1CU6cmRQpzLGd0Fy2NWtBoKSpbtbMwa8ncaxw5W
         6kPqvlcl71LRXaw4M9WqdGbAeyGCCSkyfbqNN2wPWe/5DWmJhQcxSTFc2qJO/ShnPDIg
         9NpkD9PtK8vmWPZOB0g6m9aPNfUsHzF3ofIbleRwc0ZJJjB1cqJN+2H/nIxrDPnZYvoK
         aoLH+MFx8d6+/CbJVdS+kzRbVXec39YarXUE9AuOmODv+exndc5OlWZaPcQTb/igN2EV
         z2PUh62Y5jIM0wppYGGP+waUdSok/iJt8eiPASg9W2lGsUSEj2WJy2ij04F2y8V0zsNq
         Mkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724698887; x=1725303687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlfMvk8YP/kQvzhrtnMiI9Fgfb/TBne1V0LIqcoAt2M=;
        b=bCEzPnR+rS7HLrb7RFehxyzJesYfomXyerD/ob/sWJ5ZiIm+dkwFsWJXC46eI6z8by
         A9t0LjT9e4O4judTHZoJUnYfeR1Y/Tu4ox1ZHyQK8mAem8Ky7dfZ09OtarDE8v9YIcyz
         FfFhzDJPpJBawGwFhObKiwPITDntG7Hvsh68Xks9yHHknOWDfjUqZZIDzZpCcl2gmIOt
         5phINyUIuM5Em+3VhllOQudFWsFzNQOilouha68cnIilkm8IcQ0I7xLhjvMq31MK3ZZZ
         DxdIyzckqrhuPPhB5jH6LDXHP0kt6thQJIsVzrTMcoetl5MaHDNu2zOFM9XETUgnq3TM
         Zkcw==
X-Forwarded-Encrypted: i=1; AJvYcCWIavR8qvWrAIh+6+4nsCAt6bFOaKFoBZLXHRd+lPYF/bV/LdIRIUI4YYRhutymAiIkbeQJyHanRbstmg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yym+PrYPZZssQPZ65gPbCqqOmCDtnvgN6oWcVvHe6p2RBjypj+H
	/JNFWBHBqECO7OAO5Pwk1cIFYu5RjjiOS3DrnBxJiMRJAXPrGrGjNgBHWTA8giSSndO7XKhHGsj
	XXw==
X-Google-Smtp-Source: AGHT+IEBA6sQPWzAdi8CzCDBzNF24Q7LCGUPm+EBp+JckJEMXbI5RjdBt7EA/qQscaFI/JvHbD6L23p5ztg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:fc0d:0:b0:e0b:f69b:da30 with SMTP id
 3f1490d57ef6-e1a2a9430d2mr615276.9.1724698887108; Mon, 26 Aug 2024 12:01:27
 -0700 (PDT)
Date: Mon, 26 Aug 2024 12:01:16 -0700
In-Reply-To: <20240826190116.145945-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240826190116.145945-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240826190116.145945-4-seanjc@google.com>
Subject: [PATCH 3/3] KVM: selftests: Override ARCH for x86_64 instead of using ARCH_DIR
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_120129_399797_A63B0D64 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Now that KVM selftests uses the kernel's canonical arch paths, directly
override ARCH to 'x86' when targeting x86_64 instead of defining ARCH_DIR
to redirect to appropriate paths.  ARCH_DIR was originally added to deal
with KVM selftests using the target triple ARCH for directories, e.g.
s390x and aarch64; keeping it around just to deal with the one-off alias
from x86_64=>x86 is unnecessary and confusing.

Note, even when selftests are built from the top-level Makefile, ARCH is
scoped to KVM's makefiles, i.e. overriding ARCH won't trip up some other
selftests that (somehow) expects x86_64 and can't work with x86.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile     |  4 +---
 tools/testing/selftests/kvm/Makefile.kvm | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index a9c1d85905d8..30b1a88aea2e 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -6,9 +6,7 @@ ARCH            ?= $(SUBARCH)
 ifeq ($(ARCH),$(filter $(ARCH),arm64 s390 riscv x86 x86_64))
 # Top-level selftests allows ARCH=x86_64 :-(
 ifeq ($(ARCH),x86_64)
-	ARCH_DIR := x86
-else
-	ARCH_DIR := $(ARCH)
+	ARCH := x86
 endif
 include Makefile.kvm
 else
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 27f4e100c6ac..c8bfd0815a57 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -197,10 +197,10 @@ TEST_GEN_PROGS_riscv += steal_time
 SPLIT_TESTS += arch_timer
 SPLIT_TESTS += get-reg-list
 
-TEST_PROGS += $(TEST_PROGS_$(ARCH_DIR))
-TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
-TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
-LIBKVM += $(LIBKVM_$(ARCH_DIR))
+TEST_PROGS += $(TEST_PROGS_$(ARCH))
+TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH))
+TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH))
+LIBKVM += $(LIBKVM_$(ARCH))
 
 OVERRIDE_TARGETS = 1
 
@@ -212,14 +212,14 @@ include ../lib.mk
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
 LINUX_TOOL_INCLUDE = $(top_srcdir)/tools/include
-LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH_DIR)/include
+LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
 	-Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT \
 	-fno-builtin-memcmp -fno-builtin-memcpy \
 	-fno-builtin-memset -fno-builtin-strnlen \
 	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
 	-I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
-	-I$(<D) -Iinclude/$(ARCH_DIR) -I ../rseq -I.. $(EXTRA_CFLAGS) \
+	-I$(<D) -Iinclude/$(ARCH) -I ../rseq -I.. $(EXTRA_CFLAGS) \
 	$(KHDR_INCLUDES)
 ifeq ($(ARCH),s390)
 	CFLAGS += -march=z10
@@ -258,7 +258,7 @@ LIBKVM_S_OBJ := $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
 LIBKVM_STRING_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
 LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ)
 SPLIT_TEST_GEN_PROGS := $(patsubst %, $(OUTPUT)/%, $(SPLIT_TESTS))
-SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(ARCH_DIR)/%.o, $(SPLIT_TESTS))
+SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(ARCH)/%.o, $(SPLIT_TESTS))
 
 TEST_GEN_OBJ = $(patsubst %, %.o, $(TEST_GEN_PROGS))
 TEST_GEN_OBJ += $(patsubst %, %.o, $(TEST_GEN_PROGS_EXTENDED))
@@ -267,7 +267,7 @@ TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBKVM_OBJS))
 TEST_DEP_FILES += $(patsubst %.o, %.d, $(SPLIT_TEST_GEN_OBJ))
 -include $(TEST_DEP_FILES)
 
-$(shell mkdir -p $(sort $(OUTPUT)/$(ARCH_DIR) $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
+$(shell mkdir -p $(sort $(OUTPUT)/$(ARCH) $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
 
 $(filter-out $(SPLIT_TEST_GEN_PROGS), $(TEST_GEN_PROGS)) \
 $(TEST_GEN_PROGS_EXTENDED): %: %.o
@@ -275,9 +275,9 @@ $(TEST_GEN_PROGS_EXTENDED): %: %.o
 $(TEST_GEN_OBJ): $(OUTPUT)/%.o: %.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
-$(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH_DIR)/%.o
+$(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH)/%.o
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
-$(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH_DIR)/%.o: $(ARCH_DIR)/%.c
+$(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH)/%.o: $(ARCH)/%.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
 EXTRA_CLEAN += $(GEN_HDRS) \
-- 
2.46.0.295.g3b9ea8a38a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
