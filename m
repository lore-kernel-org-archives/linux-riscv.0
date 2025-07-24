Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C9CC87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+EtmzmQEMG0opmAqHcnXdE4EgtE/q2iGw/TYa0NsV6w=; b=Je0tAImjHq55+fDkt1bychiY0C
	qMLqJrxlq4Fq1UCfK6Lz1vho4IQIwLmrBTrcPL2n2VC/A8KEnCX2CedllohDcSjtNkWLYoX57FC9j
	qZbp9oQI6A/XYBJTN6q6Vq6KkZnz7JP5chJShIAN2T7PxLjkerfoLRaYLTFn5i7og9ERuSzOgb7Ua
	ChCRVOzFdM3Aar9D7xVSOLOVPuNQKEXJj3ddumRSYHhxz/0NHfW4HSS5Tp8AsoLpPe2V7aWb5vIMg
	yxw4epcfs1tMvHYED8zez0G9+Fa6QtF8gK8p61iT/bjdznIoScdIBBOuGyuKfyJZNnUmgVRuewz2p
	v+jgH07w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3XQ-00000008VDe-3uUM;
	Thu, 24 Jul 2025 21:31:40 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3XN-00000008VCT-041h
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 21:31:38 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so999170a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 14:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753392696; x=1753997496; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EF9sxiK3Xy/PXVuW+exVELSMPBsoTeCFIahlM0k1Eq0=;
        b=nhwskRVAxUVsp57q/77ttEg0OfEU6hA4kJKrp4WJ67931UrpN3HOQsNUkdgDk2kGux
         qs6mXqztovA9UIr2q2PSzubt1BaWzvNakRPcs2GXGNbJVwIMKKkmKDRqjr7SnzjltlpG
         TZH4VsvY1p5TrtYIUpS5qUyhuOYynljEB8um32x2M8b+XK6ZEo8bvzcVUPMTOx4QjyCH
         FdKp6yY60is6tyfAg7V+5LwZKfmLyFRg1F3fQoMlJY4Cd4YFHWFUIj71UmfWwNZttG0t
         wJFlEkVOo/cgksjKFSc6/um8UDBat8duKj2XQzNGs46MKzxIqc22of4hklHo7KEHF5O2
         P6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392696; x=1753997496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EF9sxiK3Xy/PXVuW+exVELSMPBsoTeCFIahlM0k1Eq0=;
        b=bui12kW/+kzpDxPxZUzJjcajh54+Mg0TQBDxc2ij8JxjO+t7PfdASjAT+AvNSTgPxy
         DDjChtsBaeCGb7zvlQTbaP+sVdi/d+g7lWK+XA9rGD+NFYpzeA3ad+i6BBrFocD3UUc2
         A+TxA3KI/+O+iTcgz3XGldDq+VYSy+phmCnkuhQAt7M2BSse3n+k6FsGJe3i/sBtXiJv
         AO//3DuYwWvZuSo+uy+CqI+tmBPlH0vSRjhu46fDvq0ry2yTOGpGtMxWgV4bpDRueqj9
         Sj9Zj4nm4IlYHpReMT+TfojgsMWBpkfBrI2avYdJdZAkIuYnFIOV92Ov2jMNvlZ4HtuM
         yDHg==
X-Forwarded-Encrypted: i=1; AJvYcCWNS27a9Enkc8oS8R7pazXvv+wxDPSnX8e52IAifjcaOxdLxMmy4hsSqPcVy75EgJI32LDScP4M1dDbaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7JrzVUBBBhsSDd58EVHTn/jtIKg22T70Zeje1X89T5SNmwste
	4EGIFUrXY+Dvfeqx9WablQ2zG/24j+kPFvZj8b2pBFVYTX8LFq2I4zt+2H2iGau9CBeOfJxFWN0
	G1EM8oGYZUOcBXQ==
X-Google-Smtp-Source: AGHT+IEVnap/eu9Dz2ddWw4wyMBOt0WtnZUh233sGTHqAfXQEwS/hWW2xddcmUxipaoBtbgbu5pOyoCLHXoZEA==
X-Received: from pfbct19.prod.google.com ([2002:a05:6a00:f93:b0:73c:26eb:39b0])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:a346:b0:215:df3d:d56 with SMTP id adf61e73a8af0-23d490e7f2dmr13646377637.21.1753392695802;
 Thu, 24 Jul 2025 14:31:35 -0700 (PDT)
Date: Thu, 24 Jul 2025 21:31:29 +0000
In-Reply-To: <20250724213130.3374922-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20250724213130.3374922-1-dmatlack@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250724213130.3374922-2-dmatlack@google.com>
Subject: [PATCH v2 1/2] Revert "KVM: selftests: Override ARCH for x86_64
 instead of using ARCH_DIR"
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sean Christopherson <seanjc@google.com>, 
	David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_143137_052791_0BDD47AE 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This reverts commit 9af04539d474dda4984ff4909d4568e6123c8cba.

If ARCH is set on the command line then Make will skip the variable
assignment to convert x86_64 to x86. i.e. Revert this commit because it
breaks builds where ARCH=x86_64 is specified on the command line.

Fixes: 9af04539d474 ("KVM: selftests: Override ARCH for x86_64 instead of using ARCH_DIR")
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/Makefile     |  4 +++-
 tools/testing/selftests/kvm/Makefile.kvm | 26 ++++++++++++------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index d9fffe06d3ea..7aad782aeb1d 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -6,7 +6,9 @@ ARCH            ?= $(SUBARCH)
 ifeq ($(ARCH),$(filter $(ARCH),arm64 s390 riscv x86 x86_64 loongarch))
 # Top-level selftests allows ARCH=x86_64 :-(
 ifeq ($(ARCH),x86_64)
-	ARCH := x86
+	ARCH_DIR := x86
+else
+	ARCH_DIR := $(ARCH)
 endif
 include Makefile.kvm
 else
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index e11ed9e59ab5..d770c2f244da 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -215,10 +215,10 @@ TEST_GEN_PROGS_loongarch += set_memory_region_test
 SPLIT_TESTS += arch_timer
 SPLIT_TESTS += get-reg-list
 
-TEST_PROGS += $(TEST_PROGS_$(ARCH))
-TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH))
-TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH))
-LIBKVM += $(LIBKVM_$(ARCH))
+TEST_PROGS += $(TEST_PROGS_$(ARCH_DIR))
+TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
+TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
+LIBKVM += $(LIBKVM_$(ARCH_DIR))
 
 OVERRIDE_TARGETS = 1
 
@@ -231,24 +231,24 @@ include ../cgroup/lib/libcgroup.mk
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
 LINUX_TOOL_INCLUDE = $(top_srcdir)/tools/include
-LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
+LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH_DIR)/include
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
 	-Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT \
 	-fno-builtin-memcmp -fno-builtin-memcpy \
 	-fno-builtin-memset -fno-builtin-strnlen \
 	-fno-stack-protector -fno-PIE -fno-strict-aliasing \
 	-I$(LINUX_TOOL_INCLUDE) -I$(LINUX_TOOL_ARCH_INCLUDE) \
-	-I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(ARCH) \
+	-I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(ARCH_DIR) \
 	-I ../rseq -I.. $(EXTRA_CFLAGS) $(KHDR_INCLUDES)
-ifeq ($(ARCH),s390)
+ifeq ($(ARCH_DIR),s390)
 	CFLAGS += -march=z10
 endif
-ifeq ($(ARCH),x86)
+ifeq ($(ARCH_DIR),x86)
 ifeq ($(shell echo "void foo(void) { }" | $(CC) -march=x86-64-v2 -x c - -c -o /dev/null 2>/dev/null; echo "$$?"),0)
 	CFLAGS += -march=x86-64-v2
 endif
 endif
-ifeq ($(ARCH),arm64)
+ifeq ($(ARCH_DIR),arm64)
 tools_dir := $(top_srcdir)/tools
 arm64_tools_dir := $(tools_dir)/arch/arm64/tools/
 
@@ -282,7 +282,7 @@ LIBKVM_S_OBJ := $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
 LIBKVM_STRING_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
 LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ) $(LIBCGROUP_O)
 SPLIT_TEST_GEN_PROGS := $(patsubst %, $(OUTPUT)/%, $(SPLIT_TESTS))
-SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(ARCH)/%.o, $(SPLIT_TESTS))
+SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(ARCH_DIR)/%.o, $(SPLIT_TESTS))
 
 TEST_GEN_OBJ = $(patsubst %, %.o, $(TEST_GEN_PROGS))
 TEST_GEN_OBJ += $(patsubst %, %.o, $(TEST_GEN_PROGS_EXTENDED))
@@ -291,7 +291,7 @@ TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBKVM_OBJS))
 TEST_DEP_FILES += $(patsubst %.o, %.d, $(SPLIT_TEST_GEN_OBJ))
 -include $(TEST_DEP_FILES)
 
-$(shell mkdir -p $(sort $(OUTPUT)/$(ARCH) $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
+$(shell mkdir -p $(sort $(OUTPUT)/$(ARCH_DIR) $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
 
 $(filter-out $(SPLIT_TEST_GEN_PROGS), $(TEST_GEN_PROGS)) \
 $(TEST_GEN_PROGS_EXTENDED): %: %.o
@@ -299,9 +299,9 @@ $(TEST_GEN_PROGS_EXTENDED): %: %.o
 $(TEST_GEN_OBJ): $(OUTPUT)/%.o: %.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
-$(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH)/%.o
+$(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH_DIR)/%.o
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
-$(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH)/%.o: $(ARCH)/%.c
+$(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH_DIR)/%.o: $(ARCH_DIR)/%.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
 EXTRA_CLEAN += $(GEN_HDRS) \
-- 
2.50.1.470.g6ba607880d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
