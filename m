Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B30C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 00:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9BzBpCXcvfe2RWKLBpPB90Q0uBJX3jZVnSZhlxsHAw=; b=csq3e9VjHnpE0t
	4DAaIxDKst+EmH092GGGCl7WMN911PYryUEI2cDX+jTqbvquh6TkFDbxGYXlm5elJe5HnyU6X3Nm9
	1O2QXVTglyIrlBKxg3EFmGEIqvb2g6UH+9VIwr0f7FqyDf40UmLhB2iBQk0Lye9HJnpeBEvI+9xNK
	RED8cEH1Tt6PY31fMJfpj1PM7CAM8VlQoomJaDbibbk7zNgCeL4HL8uh9POI5esG1fi7+OGptLqAQ
	tP08MHjTjYWvt7yQHHa2esE1fCjfYv60yjUSIWvnBOpp1HT1SaRZZrfppcyAM7nCIz7PaXVLRwKGa
	m0yKlvsnxmbC1v+ftktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2M9C-009kK8-4r; Sat, 18 Jun 2022 00:17:06 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2M8Z-009k2L-Tm
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 00:16:30 +0000
Received: by mail-pj1-x104a.google.com with SMTP id o8-20020a17090a9f8800b001dc9f554c7fso2549380pjp.4
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 17:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=+kEOXupEgF3LEKaQ7ETtoR1RHv4ePLtA8ZhkwBe1RYk=;
        b=Dn05cv6fq5texyrcU+sgiFL6XElkOLr41OAqA7yu/YCnT3xe/CdMaKCDUb1d0e5uXg
         lMPAVJ0reAvcdyRvnIfWoeDL9sd1vhVHkOGHHlgWb1QdAt9GlJOd94PvMY4miywZXe7Y
         idwx5fC1h/wFYKMk0dPdRDEO+xMQ9WvDcMHgED/GS8UD68D98jVJWN4BUMbgzmlEVAhS
         2dIQkU0V/dN0ooZLh037pFfG6H3PI9Z2Wa32o3Jt2pzVHBd8EFgHlKGw6jEM6KaXI4Q+
         /6bGTvgNdYj3gmtIbUzGeExDloxJPM10xvcTCVAWHovIzmFD1dWbvQBhIlwBQPpmdPUz
         vNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=+kEOXupEgF3LEKaQ7ETtoR1RHv4ePLtA8ZhkwBe1RYk=;
        b=ZkAujp0yXccqRsqJavnakSfVD3nPz8Mn2j+VzPPjsAPskQp0tRQzxU+NT9EgCLPOxF
         mpR8SU7HG2CxGiyMf2DSBL2rLs9KMTq1IrvgcL5Y5XX23srMkRo2JAnMk5WKQnxBvzYM
         qc7KlB5ghH4Awmnizkbg1leMFkC1SmPOuX+nT1SN/RUqvWh97rgrRTJG4bzENaSG5cmV
         AJ7xearCdWgSezN5pVMZHsZqglapWYD0jkw/Y+EQ0zh8vpheFsfRisBc1aAByH7eLnH2
         LHux13zo+WYPTBtFIbG7IPS+LVY0P812Ofb1wIKXrpSrG7kOEZKMSO6YNIK76oF8iu+N
         QJfg==
X-Gm-Message-State: AJIora+N280E6jqw53LxkPjsEl7jE0hrJxk9s+HyE93g3FTIZiERrVg1
	VaD2TuDLDKX7ZuEoA3s57LqHtnMYib4=
X-Google-Smtp-Source: AGRyM1tH2/eIDP/hPfMRCm8Pd53yxKYarOYPiOjvNi7PZ3OcG2KrqTiKgCQWjn0rLrRXuxKbVTARh+hJDQU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1584:b0:51c:7932:975a with SMTP id
 u4-20020a056a00158400b0051c7932975amr12598033pfk.80.1655511386752; Fri, 17
 Jun 2022 17:16:26 -0700 (PDT)
Date: Sat, 18 Jun 2022 00:16:18 +0000
In-Reply-To: <20220618001618.1840806-1-seanjc@google.com>
Message-Id: <20220618001618.1840806-4-seanjc@google.com>
Mime-Version: 1.0
References: <20220618001618.1840806-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH 3/3] KVM: selftest: Add __weak stubs for ucall_arch_(un)init()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atishp@atishpatra.org>, 
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>, 
	Andrew Jones <drjones@redhat.com>, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_171628_017808_119A21B0 
X-CRM114-Status: UNSURE (   9.34  )
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

Provide __weak stubs for (un)initializing ucall, aarch64 is the only
architecture that actually needs to do work.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/riscv/ucall.c  |  8 --------
 tools/testing/selftests/kvm/lib/s390x/ucall.c  |  8 --------
 tools/testing/selftests/kvm/lib/ucall_common.c | 10 ++++++++++
 tools/testing/selftests/kvm/lib/x86_64/ucall.c |  8 --------
 4 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index 37e091d4366e..1c6c0432bdd7 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -10,14 +10,6 @@
 #include "kvm_util.h"
 #include "processor.h"
 
-void ucall_arch_init(struct kvm_vm *vm, void *arg)
-{
-}
-
-void ucall_arch_uninit(struct kvm_vm *vm)
-{
-}
-
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
 			unsigned long arg3, unsigned long arg4,
diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
index 0f695a031d35..3e8d4275c9e4 100644
--- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
+++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
@@ -6,14 +6,6 @@
  */
 #include "kvm_util.h"
 
-void ucall_arch_init(struct kvm_vm *vm, void *arg)
-{
-}
-
-void ucall_arch_uninit(struct kvm_vm *vm)
-{
-}
-
 void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
 	/* Exit via DIAGNOSE 0x501 (normally used for breakpoints) */
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index c488ed23d0dd..a1e563fd8fcc 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -1,6 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include "kvm_util.h"
 
+void __weak ucall_arch_init(struct kvm_vm *vm, void *arg)
+{
+
+}
+
+void __weak ucall_arch_uninit(struct kvm_vm *vm)
+{
+
+}
+
 void ucall(uint64_t cmd, int nargs, ...)
 {
 	struct ucall uc = {
diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
index ec53a406f689..2f724f0bed32 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
@@ -8,14 +8,6 @@
 
 #define UCALL_PIO_PORT ((uint16_t)0x1000)
 
-void ucall_arch_init(struct kvm_vm *vm, void *arg)
-{
-}
-
-void ucall_arch_uninit(struct kvm_vm *vm)
-{
-}
-
 void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
 	asm volatile("in %[port], %%al"
-- 
2.37.0.rc0.104.g0611611a94-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
