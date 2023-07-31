Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B89C04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 20:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3p6ISIQ7gG4GmNzgg0bCotBiGOtbOMcxRI1eYYOd/Wc=; b=zIWaSNGD8xwdi8
	kQ16wydU45uhNVEjpM0CGN+nIn+c7mMxQL0jUFY2ZqomQ/WtETp7sI3dCt3IT4ZDcni5OEjSo6klz
	3UUcPiYTEoARWZkviRyIlghDbdbz5JbGp55F5+C9QsA6nsFx9XKLW0FHj5wS1SnXc6tS6q1eF7nU4
	6xus9eWVf919cEOzOHZoE95X9ZfVHRggqHfWKi/X+VhaJX6OsrtUNe1K0IypTluAzZNCc0PnbNR7Z
	qqjwqOtml0ccMMTsdceymIhHGNV0r4h5c2BVwiiAe0tzOgFP3n1TkcliF0mv4Q3JtrHfMl9PwVsOX
	uNSmp4CcCxza+0LIy7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQZXp-00HHcx-2u;
	Mon, 31 Jul 2023 20:31:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQZXn-00HHbn-2x
	for linux-riscv@bombadil.infradead.org;
	Mon, 31 Jul 2023 20:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5U+ePjx5uvIPbOFZvIPuPHJZ5mQDJ+KWLfp0+392RLI=; b=DuJg3C05zETR0LMS5giYk2EE3t
	Jcs4mcfnYjj96x93k2mOUR1ygxyrBud53zz4Wp8LhWjSwvMW26cnbRY12CxNh740YHCZgQUrILvcO
	h5tsePb2+BeMkZTfl/97mskI9HvAhMFyFWuxdCdqrzheyvhn8Lvhc+q4QQ5WvuSZ+XeEliTFJ9wLD
	45JFk/fyDOd4Lcb+cUPXl3zAxXzVEWjTifaq9drPGjrBjGyd2CjNjoXUzuLtTGfddBP7SY5NNHpP0
	M1hrM095BEfsbZcAftMebfvFhq+FIann8L5AGFM1zScv0bu6f6VXpgGKa7k+VSOsL3RuXrhUD6dul
	hBJ7Aziw==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQZXT-00D3bF-2S
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 20:30:59 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-57320c10635so59004897b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 13:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690835431; x=1691440231;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5U+ePjx5uvIPbOFZvIPuPHJZ5mQDJ+KWLfp0+392RLI=;
        b=j+LTBrLYE45KvHh8yvAoteE2ggn6Qwq9y+k3kwsvbhuMIRZxzeC/Hkjnp1PzL4jKz6
         0SP7Y2Gyw3r8NONVoC4Os2TY22A/s+xUaYg8F+e67r3OuSq/79zEB/FJpE7SxNxQgu/Y
         gZOPprNIVKzVSAqxaZyd5xLl/r38weSLqHNqGEwiYrcDFt55ycppOXKngWWznZHV691M
         7Pgo+NJgXx2OqWMQ+bAElTC2/b6oHmyW5u0ibv3o7mfpTTpROKZbq6DYkG+21bO/Jl6+
         gma6G0gTU6JJ1sDlUZTklxSaDSY69hwMHE+D2+qOXCtqK6dc1gf2rR/85GyHtr0hKZyr
         mZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690835431; x=1691440231;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5U+ePjx5uvIPbOFZvIPuPHJZ5mQDJ+KWLfp0+392RLI=;
        b=RsAXeh9oaIZfQJaeKlFODm/zjMmUeWYFjjIb1McIsULY6Dg3OaYUtgXjLCK62iQltX
         cuHU7K8EMzosorMdGDmSvQfc4iZgfe/UtORtooJwbvdiWqfzqRoBaXtFt7MZfHrjmdvG
         jRrOupvP3uuqkJKvsz/CohB1awsHi4wjppe+LgQOy7ylrVGeI0rfurRRPawc9K9Q1++D
         3SblBQIKwwT5a6jnE8CQWtwxQzcmQfp3eyPop7oo6Ww5olyapHK6Jaurc8r4qx/FRyf8
         jZC3+39PbjrqxGhiO8L5jEMIQdolDLN/DUh49H+aG+c13Fl6vdBxpDBSsdeiCvSe3KsB
         lBfw==
X-Gm-Message-State: ABy/qLb8Qg34Bgz+SffzgYHvNoEizlm/jlLBUl5iqrLQweyrARjeE/+d
	40hjyowgOnkkKcqRkBmSZwnJw+ElNVM=
X-Google-Smtp-Source: APBJJlHsVu0gs/pIFQ5XNCO1CEWhZmz2TqbrIDwiZ84JP4lQkpQZDXLalyai8ajrI0RoXSI338A/z0leqG8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:30b:0:b0:cea:ef04:1c61 with SMTP id
 11-20020a25030b000000b00ceaef041c61mr69191ybd.1.1690835431546; Mon, 31 Jul
 2023 13:30:31 -0700 (PDT)
Date: Mon, 31 Jul 2023 13:30:24 -0700
In-Reply-To: <20230731203026.1192091-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230731203026.1192091-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230731203026.1192091-2-seanjc@google.com>
Subject: [PATCH v4.1 1/3] KVM: selftests: Add arch ucall.h and inline simple
 arch hooks
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Aaron Lewis <aaronlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_213048_470617_89FFE97F 
X-CRM114-Status: GOOD (  18.16  )
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

Add an architecture specific ucall.h and inline the simple arch hooks,
e.g. the init hook for everything except ARM, and the actual "do ucall"
hook for everything except x86 (which should be simple, but temporarily
isn't due to carrying a workaround).

Having a per-arch ucall header will allow adding a #define for the
expected KVM exit reason for a ucall that is colocated (for everything
except x86) with the ucall itself.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/aarch64/ucall.h      | 18 ++++++++++++++++++
 .../selftests/kvm/include/riscv/ucall.h        | 18 ++++++++++++++++++
 .../selftests/kvm/include/s390x/ucall.h        | 17 +++++++++++++++++
 .../selftests/kvm/include/ucall_common.h       |  1 +
 .../selftests/kvm/include/x86_64/ucall.h       | 11 +++++++++++
 .../testing/selftests/kvm/lib/aarch64/ucall.c  | 11 +----------
 tools/testing/selftests/kvm/lib/riscv/ucall.c  | 11 -----------
 tools/testing/selftests/kvm/lib/s390x/ucall.c  | 10 ----------
 tools/testing/selftests/kvm/lib/x86_64/ucall.c |  4 ----
 9 files changed, 66 insertions(+), 35 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/aarch64/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/s390x/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/ucall.h

diff --git a/tools/testing/selftests/kvm/include/aarch64/ucall.h b/tools/testing/selftests/kvm/include/aarch64/ucall.h
new file mode 100644
index 000000000000..fe65fdf4f0d3
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/aarch64/ucall.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_UCALL_H
+#define SELFTEST_KVM_UCALL_H
+
+#include "kvm_util_base.h"
+
+/*
+ * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
+ * VM), it must not be accessed from host code.
+ */
+extern vm_vaddr_t *ucall_exit_mmio_addr;
+
+static inline void ucall_arch_do_ucall(vm_vaddr_t uc)
+{
+	WRITE_ONCE(*ucall_exit_mmio_addr, uc);
+}
+
+#endif
diff --git a/tools/testing/selftests/kvm/include/riscv/ucall.h b/tools/testing/selftests/kvm/include/riscv/ucall.h
new file mode 100644
index 000000000000..86ed0500972b
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/riscv/ucall.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_UCALL_H
+#define SELFTEST_KVM_UCALL_H
+
+#include "processor.h"
+
+static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+}
+
+static inline void ucall_arch_do_ucall(vm_vaddr_t uc)
+{
+	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
+		  KVM_RISCV_SELFTESTS_SBI_UCALL,
+		  uc, 0, 0, 0, 0, 0);
+}
+
+#endif
diff --git a/tools/testing/selftests/kvm/include/s390x/ucall.h b/tools/testing/selftests/kvm/include/s390x/ucall.h
new file mode 100644
index 000000000000..47ad4b1fbccb
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/s390x/ucall.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_UCALL_H
+#define SELFTEST_KVM_UCALL_H
+
+#include "kvm_util_base.h"
+
+static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+}
+
+static inline void ucall_arch_do_ucall(vm_vaddr_t uc)
+{
+	/* Exit via DIAGNOSE 0x501 (normally used for breakpoints) */
+	asm volatile ("diag 0,%0,0x501" : : "a"(uc) : "memory");
+}
+
+#endif
diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index 4ce11c15285a..9e5948dab030 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -7,6 +7,7 @@
 #ifndef SELFTEST_KVM_UCALL_COMMON_H
 #define SELFTEST_KVM_UCALL_COMMON_H
 #include "test_util.h"
+#include "ucall.h"
 
 /* Common ucalls */
 enum {
diff --git a/tools/testing/selftests/kvm/include/x86_64/ucall.h b/tools/testing/selftests/kvm/include/x86_64/ucall.h
new file mode 100644
index 000000000000..05cc69b0d550
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86_64/ucall.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_UCALL_H
+#define SELFTEST_KVM_UCALL_H
+
+#include "kvm_util_base.h"
+
+static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+}
+
+#endif
diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
index f212bd8ab93d..ddab0ce89d4d 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
@@ -6,11 +6,7 @@
  */
 #include "kvm_util.h"
 
-/*
- * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
- * VM), it must not be accessed from host code.
- */
-static vm_vaddr_t *ucall_exit_mmio_addr;
+vm_vaddr_t *ucall_exit_mmio_addr;
 
 void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
@@ -23,11 +19,6 @@ void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 	write_guest_global(vm, ucall_exit_mmio_addr, (vm_vaddr_t *)mmio_gva);
 }
 
-void ucall_arch_do_ucall(vm_vaddr_t uc)
-{
-	WRITE_ONCE(*ucall_exit_mmio_addr, uc);
-}
-
 void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index 9a3476a2dfca..fe6d1004f018 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -10,10 +10,6 @@
 #include "kvm_util.h"
 #include "processor.h"
 
-void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
-{
-}
-
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
 			unsigned long arg3, unsigned long arg4,
@@ -40,13 +36,6 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 	return ret;
 }
 
-void ucall_arch_do_ucall(vm_vaddr_t uc)
-{
-	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
-		  KVM_RISCV_SELFTESTS_SBI_UCALL,
-		  uc, 0, 0, 0, 0, 0);
-}
-
 void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
index a7f02dc372cf..cca98734653d 100644
--- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
+++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
@@ -6,16 +6,6 @@
  */
 #include "kvm_util.h"
 
-void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
-{
-}
-
-void ucall_arch_do_ucall(vm_vaddr_t uc)
-{
-	/* Exit via DIAGNOSE 0x501 (normally used for breakpoints) */
-	asm volatile ("diag 0,%0,0x501" : : "a"(uc) : "memory");
-}
-
 void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
index a53df3ece2f8..1265cecc7dd1 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
@@ -8,10 +8,6 @@
 
 #define UCALL_PIO_PORT ((uint16_t)0x1000)
 
-void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
-{
-}
-
 void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
 	/*
-- 
2.41.0.585.gd2178a4bd4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
