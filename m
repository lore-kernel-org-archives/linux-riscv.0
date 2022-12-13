Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C480C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T080csjVrCvbb+/2Bg/v1my9+7vESiA+QUk5SImfSHY=; b=xYxUM9kWJ4D+Zj
	+RhH6Lrfcbq0kpAxFgrdJu+vJQI7kYPdMcfzQLAArFnhlMcCA2SmLXSitglEn6m0PhT6f1uvxPsx5
	/wQgTxbg4owLQ7+kEZcMssCqmAAF7YSIDZ0fS98bqiFea8CxOGkf+J5PZ0x8M/AQnJXqkfH3oSQXs
	Z9mogq3boPDAjaK2XU/M4IViST/1CheZj5Ag+n3dqlg0/paaD8dfIij74y++h+rkxs6u2SglXKfnp
	0uM4cZ9vFQFH+XSMzI6/j18j83MiyIa+pWZaM07A+U7KWTSzZ7Kh+A6UNq0sGnWEglvYLOmYlM7iG
	rJc5RDfXBvbIAclgudhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u5O-008upd-GJ; Tue, 13 Dec 2022 01:27:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u5D-008umi-OU
	for linux-riscv@bombadil.infradead.org; Tue, 13 Dec 2022 01:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xj/6XiZ0FcL9g/cIOTUKNxH2a5zHGMGnhonaffOKQyU=; b=f/t/n7zgEhQgry4lx3U5vPuif9
	RV+3T67Ly/aBuybxE1+j9kc+MaTcmKIlzjh0FqZWnugEgNdj6Pav4LH790wtvjp8pBqkF8e6CL20u
	PUQgNFiR91Khh7ErUDgzIpY/swO6Xh+wM8gD8TrS4KwGU5kteQzy2QCihWaacLcZn+h5Vp12vZ5Eh
	AJbLa6UcWpdOTPDr8FGwH+jC0+zwAYIrRDXdIzwlNW0YF40rSCs+a3I+OVakWpQdNZ0yhewLHR5F3
	Oia5aZgG+VX6DeSB6bY+s0XPD9nRPYhQtIy6BLi3LxVIfsi3Klp2vyEZAFJAw01VwsqzG4q4RY4fW
	/JHsBkkw==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sz3-009w7J-Hf
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:18:13 +0000
Received: by mail-pg1-x54a.google.com with SMTP id i19-20020a63e913000000b004705d1506a6so8620577pgh.13
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xj/6XiZ0FcL9g/cIOTUKNxH2a5zHGMGnhonaffOKQyU=;
        b=Ynr5HNzm6tcPWug6yfLA7uxzPSFdxsDbFS0g0RKFnUjDpg1KpLtNRGj/Gf5/eVmZS7
         /E+4Syq2m0k2o5pz9jJkKOO6Sj8cSiSA59XiRJyOIRS4qCG3ooDGOujDsXFak0y3HWEH
         JVE64IrNpMB7KkNprBOvUTG/cEurYq5To2UJjMVj8f7IjF8u6mpzW6rAt4PhQmyqLhQB
         1i18xIcii3lgptRuB9CPP2XNPfFgre8ZBl8B6sbn4hkuTa1njt/nq23+dRz4CjgSzC33
         AdeV5GwIU5qK4qiw325lbgQvG6tA0I6pTb5gl4H3ZodnnRxzTiH/D2U7oooCiaGH4QZQ
         TQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xj/6XiZ0FcL9g/cIOTUKNxH2a5zHGMGnhonaffOKQyU=;
        b=fDdxZKITM2l9glfRpDbXqH0DNGXiWccXqWY6onHY2jH//XwQcAN6/OpgACzQBmpVhe
         E/9CyoY9L/CzmYhrq41+hyOKh/uyzMP47OVZC1clrF2lJ6j/96flAxAPz7RG0CJkfP76
         SPm8h7KA61dYnSW6ll2pJQth1FSz/u6eINBbQ4xei47wM6DG6m+mtwm33+JQMVhS3by6
         DFdxb3gjJ2jtHBFcZbEz8+UuIJ9V/GVM6dbOF9ypQPhgmkNol2RBFrnXYmcorBoTENee
         H+Y5+R9Yz+fWeCCUfpB0Mj+IcjxrrTN2ENrbh+herNJyg+ALQ0y1xfPOkVfvguue+U3v
         nwVQ==
X-Gm-Message-State: ANoB5plyCoioO+LeuV2dH+XoEHEPQ4Vr37l6H3v27i9IfKG5JVLRrCfC
	9n9bNwXtQiPunKiwF1h91Gzs3MqSY7Q=
X-Google-Smtp-Source: AA0mqf7B6mgUqxDLQ3i89LPKmIpCGPzYFo4QfxqabC4YmJpdYxUAVEO/jE0NsIR7MXoyw3EdaxVTTeKRQcw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:1b21:b0:218:e3e8:c024 with SMTP id
 q30-20020a17090a1b2100b00218e3e8c024mr75063pjq.125.1670890637231; Mon, 12 Dec
 2022 16:17:17 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:51 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-13-seanjc@google.com>
Subject: [PATCH 12/14] KVM: selftests: Use wildcards to find library source files
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
X-CRM114-CacheID: sfid-20221213_001721_749819_A921D2BE 
X-CRM114-Status: UNSURE (   7.39  )
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

Use $(wildcard ...) to find the library source files instead of manually
defining the inputs, which is a maintenance burden and error prone.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 45 ++++------------------------
 1 file changed, 5 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 9cff99a1cb2e..a9930e9197da 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -19,44 +19,6 @@ else
 $(error Unknown architecture '$(ARCH)')
 endif
 
-LIBKVM += lib/assert.c
-LIBKVM += lib/elf.c
-LIBKVM += lib/guest_modes.c
-LIBKVM += lib/io.c
-LIBKVM += lib/kvm_util.c
-LIBKVM += lib/memstress.c
-LIBKVM += lib/rbtree.c
-LIBKVM += lib/sparsebit.c
-LIBKVM += lib/test_util.c
-LIBKVM += lib/ucall_common.c
-LIBKVM += lib/userfaultfd_util.c
-
-LIBKVM_STRING += lib/string_override.c
-
-LIBKVM_x86_64 += lib/x86_64/apic.c
-LIBKVM_x86_64 += lib/x86_64/handlers.S
-LIBKVM_x86_64 += lib/x86_64/hyperv.c
-LIBKVM_x86_64 += lib/x86_64/memstress.c
-LIBKVM_x86_64 += lib/x86_64/processor.c
-LIBKVM_x86_64 += lib/x86_64/svm.c
-LIBKVM_x86_64 += lib/x86_64/ucall.c
-LIBKVM_x86_64 += lib/x86_64/vmx.c
-
-LIBKVM_aarch64 += lib/aarch64/gic.c
-LIBKVM_aarch64 += lib/aarch64/gic_v3.c
-LIBKVM_aarch64 += lib/aarch64/handlers.S
-LIBKVM_aarch64 += lib/aarch64/processor.c
-LIBKVM_aarch64 += lib/aarch64/spinlock.c
-LIBKVM_aarch64 += lib/aarch64/ucall.c
-LIBKVM_aarch64 += lib/aarch64/vgic.c
-
-LIBKVM_s390x += lib/s390x/diag318_test_handler.c
-LIBKVM_s390x += lib/s390x/processor.c
-LIBKVM_s390x += lib/s390x/ucall.c
-
-LIBKVM_riscv += lib/riscv/processor.c
-LIBKVM_riscv += lib/riscv/ucall.c
-
 # Non-compiled test targets
 TEST_PROGS_x86_64 += x86_64/nx_huge_pages_test.sh
 
@@ -213,10 +175,13 @@ pgste-option = $(call try-run, echo 'int main(void) { return 0; }' | \
 LDLIBS += -ldl
 LDFLAGS += -pthread $(no-pie-option) $(pgste-option)
 
-LIBKVM_C := $(filter %.c,$(LIBKVM))
-LIBKVM_S := $(filter %.S,$(LIBKVM))
+LIBKVM_C := $(filter-out lib/string_override.c,$(wildcard lib/*.c))
+LIBKVM_C += $(wildcard lib/$(ARCH_DIR)/*.c)
+LIBKVM_S := $(wildcard lib/*.S)
+LIBKVM_S += $(wildcard lib/$(ARCH_DIR)/*.S)
 LIBKVM_C_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_C))
 LIBKVM_S_OBJ := $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
+LIBKVM_STRING := lib/string_override.c
 LIBKVM_STRING_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
 LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ)
 
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
