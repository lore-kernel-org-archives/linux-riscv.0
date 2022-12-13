Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625F0C04FDE
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 00:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HO2V15FMyQ+RPHcGmEmPQOeg5UEEwDQYm77MQlQnbEo=; b=41Iw9odw/YaZIH
	WCGIkS6JdNY3t7p7QKPFpqxFLIP6pLaEU67Yl0sTxBLyOKgW7Fw9I4GmYOUHsT0hHrRpp/GZE7oA2
	VU4NuEwsG/VOGn4mDn0HNw6KaXgo72P/Lm2YGdOBixbATuOqPzcTuMQ6y8IN94ua4uRX/S8JbStUh
	iX0zZ/QAKqy1N+Z6uLHraVAJt8XwBwgEIn8ZuXfPJPBEqhpGqNRXlTRzW9iWm4RUn7mqCvHU/6tY/
	0vLWU5Ii6qTAluGKkL9seb7LQX0TD371SpwVWXGCmv8UBxWtGvC1FaFhzn/gBVIq+laYD0yCE5TGw
	OZOcJpg3vuh88qJU8Gmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sz4-0089E6-SF; Tue, 13 Dec 2022 00:17:22 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4syx-00895r-Pl
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:17 +0000
Received: by mail-pj1-x1049.google.com with SMTP id v16-20020a17090a899000b00219b1f0ddebso1027917pjn.5
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aL+0YmMhUjGpxjB47w5qgiiQkK7wv4sJmU0mewoCPIk=;
        b=lXE9d6/lTyMaKAp9TWJ0VTH9OHNc6LWhK3blKtxoKuILCiWADb0CbU6Rsydob/gcil
         wHxIvfaDWuGlNvVquRWIv4yx5W+yznz7XM7a86CW8GDjqkZqbRCaIw2dz/EezUpsk1tU
         yj25I60njVb9EbdEvsJxtZS9+k7pDY33PzcH/LvsH4P5XlXsQXH7IoqjcG6Ie7dJ8g9T
         bujmb8hmgj/76jRObLTv9oiy9I32bf42pKVaFt8Dttopr1DOXN3wMxL93QijMNc8Zro1
         fKhDmxLqJgYkJDp2BLZwakAToojNx+YfT0/EJedWbNtVv2az4c/koY91ZlwuaKe+3P20
         zbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aL+0YmMhUjGpxjB47w5qgiiQkK7wv4sJmU0mewoCPIk=;
        b=CcMqhEp6GlT0hVnw3+JEQM18/MMTZ0ankUAPYlX6Z/o8Pbf1jSFFm+Ye7hLz8ikvia
         osi9f+YuE/0/8WPqaL0W0TZ/coRgQkGMMxUZhvfoFMFhZo1N6szGcNcqXKCrFpSu6sG+
         KXzLy7RZFmzx2Ke57tw+WUOf44ofI2R5osh4nhSDU8now2a11o3v5aBeZUvbMyLqH1rq
         p/Sk53AChlFD3ZnTMI9LX5N1xSvbQ8mQqJ6FVhB/ogBEabFv8J++HBtE2Chgyw2cq5Ce
         hmrnHbodKVlXdJxEffXeVRg6IhFQk/Z/Ke88seh7ejahcsm1NAIoKRrPKsv/rxNOjq5r
         Kf1Q==
X-Gm-Message-State: ANoB5pm4flj4egbZju0gO3+R1oMNZq8nns0fn59sv0fa5Vk2moxTln5O
	KnTkfP6iVZgU2ZskZHeKxBlsSrRG7SI=
X-Google-Smtp-Source: AA0mqf6x4MZJ4SJmtkdTS02X8t4NKcxtNfIcDJg0D7JOLNgsuOwcq0N0mfjb/DHFRBiMDDUKbvP/3oiNhVU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:3556:b0:219:f1a2:b641 with SMTP id
 lt22-20020a17090b355600b00219f1a2b641mr97398pjb.97.1670890626870; Mon, 12 Dec
 2022 16:17:06 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:45 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-7-seanjc@google.com>
Subject: [PATCH 06/14] KVM: selftests: Rename UNAME_M to ARCH_DIR, fill
 explicitly for x86
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Sean Christopherson <seanjc@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_161715_860365_D7B4C16E 
X-CRM114-Status: GOOD (  10.32  )
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

Rename UNAME_M to ARCH_DIR and explicitly set it directly for x86.  At
this point, the name of the arch directory really doesn't have anything
to do with `uname -m`, and UNAME_M is unnecessarily confusing given that
its purpose is purely to identify the arch specific directory.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 49 +++++++++-------------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 947676983da1..d761a77c3a80 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -7,35 +7,16 @@ top_srcdir = ../../../..
 include $(top_srcdir)/scripts/subarch.include
 ARCH            ?= $(SUBARCH)
 
-# For cross-builds to work, UNAME_M has to map to ARCH and arch specific
-# directories and targets in this Makefile. "uname -m" doesn't map to
-# arch specific sub-directory names.
-#
-# UNAME_M variable to used to run the compiles pointing to the right arch
-# directories and build the right targets for these supported architectures.
-#
-# TEST_GEN_PROGS and LIBKVM are set using UNAME_M variable.
-# LINUX_TOOL_ARCH_INCLUDE is set using ARCH variable.
-#
-# x86_64 targets are named to include x86_64 as a suffix and directories
-# for includes are in x86_64 sub-directory. s390x and aarch64 follow the
-# same convention. "uname -m" doesn't result in the correct mapping for
-# s390x and aarch64.
-#
-# No change necessary for x86_64
-UNAME_M := $(shell uname -m)
-
-# Set UNAME_M for arm64 compile/install to work
-ifeq ($(ARCH),arm64)
-	UNAME_M := aarch64
-endif
-# Set UNAME_M s390x compile/install to work
-ifeq ($(ARCH),s390)
-	UNAME_M := s390x
-endif
-# Set UNAME_M riscv compile/install to work
-ifeq ($(ARCH),riscv)
-	UNAME_M := riscv
+ifeq ($(ARCH),x86)
+	ARCH_DIR := x86_64
+else ifeq ($(ARCH),arm64)
+	ARCH_DIR := aarch64
+else ifeq ($(ARCH),s390)
+	ARCH_DIR := s390x
+else ifeq ($(ARCH),riscv)
+	ARCH_DIR := riscv
+else
+$(error Unknown architecture '$(ARCH)')
 endif
 
 LIBKVM += lib/assert.c
@@ -196,10 +177,10 @@ TEST_GEN_PROGS_riscv += kvm_page_table_test
 TEST_GEN_PROGS_riscv += set_memory_region_test
 TEST_GEN_PROGS_riscv += kvm_binary_stats_test
 
-TEST_PROGS += $(TEST_PROGS_$(UNAME_M))
-TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(UNAME_M))
-TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(UNAME_M))
-LIBKVM += $(LIBKVM_$(UNAME_M))
+TEST_PROGS += $(TEST_PROGS_$(ARCH_DIR))
+TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
+TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
+LIBKVM += $(LIBKVM_$(ARCH_DIR))
 
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
@@ -212,7 +193,7 @@ endif
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
 	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
 	-I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
-	-I$(<D) -Iinclude/$(UNAME_M) -I ../rseq -I.. $(EXTRA_CFLAGS) \
+	-I$(<D) -Iinclude/$(ARCH_DIR) -I ../rseq -I.. $(EXTRA_CFLAGS) \
 	$(KHDR_INCLUDES)
 
 no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
