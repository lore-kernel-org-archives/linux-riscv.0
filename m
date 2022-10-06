Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4918EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 00:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78P7gxs1MCYT9DbFCes0zCFsK6lArBxEDrOlIaje9Ck=; b=MMaJ5WbfxON0IO
	vltcmS4Rm8kZuuu5nMxjy5BSESrB0yADwKFzQp+GtUXfezIH04BSlo2DZpUPfdwXZMQ2npIHGDnFR
	jK63bmUxpCThIzDBQuGPI5PsZ9mGHVP76r2ESlE2k96Hc5eHaAPyU5UAEr2YDB4NAXUabb5huVOgS
	J8u9fLf3/ysGWXp4RDdT4LPUp77gg3ejjbYalQFQAcPQPT0Ur8YWRREqYKeikMHvIup6o6rF63GaH
	/jDOKo4BlJwR2CX+9qRpRrbX5DmRsKuuS0P/GNkxT24Nmb04mgxdOfNLwmG6MCdwigbA+GEB/h+lG
	BEBi4yRZvqwaHyqbSCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogEqC-00Gd54-CN; Thu, 06 Oct 2022 00:34:20 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogEq9-00Gd0W-Ld
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 00:34:19 +0000
Received: by mail-pg1-x54a.google.com with SMTP id r126-20020a632b84000000b004393806c06eso190917pgr.4
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 17:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LxD1Ig1Wg9dHPvXi6MK9jGxHhkv2R7KkJnjSBckG4C0=;
        b=AfxO+Er11HVjf/Y10wy9fBxzGZO94qsVOxlhlno9xnC17t63/Tr5Dqcdnn4SgvpLuG
         CuJqkVZk7Y2Nwx9waPSTB561h6UAaO2K4RQzHy7Az1TPcPTtq5pSQPvcBWN5gOouyY6k
         4I34xu/irDrmfqkx36b3NkVK+rVKDB9KBL6LdG2tndjidRcrR2pOzpqph0jvh77XbKZk
         /Z1zGmieRScTq3oOEkySFyVpZBUxPcZe/VYPQHuO564VtXObBd5GQI4VfhzXYVlpiDRA
         uI+V38I7ZlQhWma4UcdPLaxXvmHzH0m5NoByfdMlosXVrL4xaFqrN8UyGXf4L7ywFi6w
         mKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxD1Ig1Wg9dHPvXi6MK9jGxHhkv2R7KkJnjSBckG4C0=;
        b=DuH5BuLB6+pfq6ZY9xb3M4kD5S1ar6wQm87wv8pcL54MCRfNnEgjWT1QxpYIBNOmhX
         6UAyLGXqqWJ1z8KSGY8JilQWzT6ltPhisMLM5Gatu6D+zswofLwoD9y3KuOJGd3lvucW
         uZs4NjUaAtMxJ2Yh+/Sss5TQ4AST0ibBF1O6ojUMpk7EXYmKFOK/zv4YXEoGibTo1cqu
         UbfW/e6TQfj5Qcf92DuRYvBEm0KgEAfBce1S38J2OKUkp9TRvjgC7rYu8fflSErGDk8+
         rdSnYJFwnc2iXFIny20BrQ4CHMSy6qDQoWOhwofXPorR7ylgj2zSyj4r76gaTlnOua+6
         qWQg==
X-Gm-Message-State: ACrzQf0sX7XEDZ01Vtefrn/27MQgfPl3Ao6zjFtgZ8lO1GPjAeBDYPfK
	iVsdXXf+8vKB/zMgphjAUXSGX9vEfcs=
X-Google-Smtp-Source: AMsMyM7eCt0EkeFVVtjGTO8xDyWvbelrIj+5gtw3GtcA4yoUoAjJIz+e6CsiiencYUd1amboMYPXXKjRKWw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:190d:b0:550:6db3:b9be with SMTP id
 y13-20020a056a00190d00b005506db3b9bemr2333440pfi.1.1665016455813; Wed, 05 Oct
 2022 17:34:15 -0700 (PDT)
Date: Thu,  6 Oct 2022 00:34:03 +0000
In-Reply-To: <20221006003409.649993-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221006003409.649993-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221006003409.649993-2-seanjc@google.com>
Subject: [PATCH v6 1/7] KVM: selftests: Consolidate common code for populating
 ucall struct
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Colton Lewis <coltonlewis@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Peter Gonda <pgonda@google.com>, 
	Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_173417_743589_5B5E8DAD 
X-CRM114-Status: GOOD (  17.89  )
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

Make ucall() a common helper that populates struct ucall, and only calls
into arch code to make the actually call out to userspace.

Rename all arch-specific helpers to make it clear they're arch-specific,
and to avoid collisions with common helpers (one more on its way...)

Add WRITE_ONCE() to stores in ucall() code (as already done to aarch64
code in commit 9e2f6498efbb ("selftests: KVM: Handle compiler
optimizations in ucall")) to prevent clang optimizations breaking ucalls.

Cc: Colton Lewis <coltonlewis@google.com>
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Tested-by: Peter Gonda <pgonda@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          |  1 +
 .../selftests/kvm/include/ucall_common.h      | 23 ++++++++++++++++---
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 22 ++++--------------
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 23 ++++---------------
 tools/testing/selftests/kvm/lib/s390x/ucall.c | 23 ++++---------------
 .../testing/selftests/kvm/lib/ucall_common.c  | 20 ++++++++++++++++
 .../testing/selftests/kvm/lib/x86_64/ucall.c  | 23 ++++---------------
 7 files changed, 61 insertions(+), 74 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/lib/ucall_common.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 0172eb6cb6ee..65eb45ff1bff 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -47,6 +47,7 @@ LIBKVM += lib/perf_test_util.c
 LIBKVM += lib/rbtree.c
 LIBKVM += lib/sparsebit.c
 LIBKVM += lib/test_util.c
+LIBKVM += lib/ucall_common.c
 
 LIBKVM_STRING += lib/string_override.c
 
diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index ee79d180e07e..5a85f5318bbe 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -24,10 +24,27 @@ struct ucall {
 	uint64_t args[UCALL_MAX_ARGS];
 };
 
-void ucall_init(struct kvm_vm *vm, void *arg);
-void ucall_uninit(struct kvm_vm *vm);
+void ucall_arch_init(struct kvm_vm *vm, void *arg);
+void ucall_arch_uninit(struct kvm_vm *vm);
+void ucall_arch_do_ucall(vm_vaddr_t uc);
+uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
+
 void ucall(uint64_t cmd, int nargs, ...);
-uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
+
+static inline void ucall_init(struct kvm_vm *vm, void *arg)
+{
+	ucall_arch_init(vm, arg);
+}
+
+static inline void ucall_uninit(struct kvm_vm *vm)
+{
+	ucall_arch_uninit(vm);
+}
+
+static inline uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+{
+	return ucall_arch_get_ucall(vcpu, uc);
+}
 
 #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4)	\
 				ucall(UCALL_SYNC, 6, "hello", stage, arg1, arg2, arg3, arg4)
diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
index ed237b744690..3630708c32d6 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
@@ -21,7 +21,7 @@ static bool ucall_mmio_init(struct kvm_vm *vm, vm_paddr_t gpa)
 	return true;
 }
 
-void ucall_init(struct kvm_vm *vm, void *arg)
+void ucall_arch_init(struct kvm_vm *vm, void *arg)
 {
 	vm_paddr_t gpa, start, end, step, offset;
 	unsigned int bits;
@@ -64,30 +64,18 @@ void ucall_init(struct kvm_vm *vm, void *arg)
 	TEST_FAIL("Can't find a ucall mmio address");
 }
 
-void ucall_uninit(struct kvm_vm *vm)
+void ucall_arch_uninit(struct kvm_vm *vm)
 {
 	ucall_exit_mmio_addr = 0;
 	sync_global_to_guest(vm, ucall_exit_mmio_addr);
 }
 
-void ucall(uint64_t cmd, int nargs, ...)
+void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
-	struct ucall uc = {};
-	va_list va;
-	int i;
-
-	WRITE_ONCE(uc.cmd, cmd);
-	nargs = min(nargs, UCALL_MAX_ARGS);
-
-	va_start(va, nargs);
-	for (i = 0; i < nargs; ++i)
-		WRITE_ONCE(uc.args[i], va_arg(va, uint64_t));
-	va_end(va);
-
-	WRITE_ONCE(*ucall_exit_mmio_addr, (vm_vaddr_t)&uc);
+	WRITE_ONCE(*ucall_exit_mmio_addr, uc);
 }
 
-uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 {
 	struct kvm_run *run = vcpu->run;
 	struct ucall ucall = {};
diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index 087b9740bc8f..b1598f418c1f 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -10,11 +10,11 @@
 #include "kvm_util.h"
 #include "processor.h"
 
-void ucall_init(struct kvm_vm *vm, void *arg)
+void ucall_arch_init(struct kvm_vm *vm, void *arg)
 {
 }
 
-void ucall_uninit(struct kvm_vm *vm)
+void ucall_arch_uninit(struct kvm_vm *vm)
 {
 }
 
@@ -44,27 +44,14 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 	return ret;
 }
 
-void ucall(uint64_t cmd, int nargs, ...)
+void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
-	struct ucall uc = {
-		.cmd = cmd,
-	};
-	va_list va;
-	int i;
-
-	nargs = min(nargs, UCALL_MAX_ARGS);
-
-	va_start(va, nargs);
-	for (i = 0; i < nargs; ++i)
-		uc.args[i] = va_arg(va, uint64_t);
-	va_end(va);
-
 	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
 		  KVM_RISCV_SELFTESTS_SBI_UCALL,
-		  (vm_vaddr_t)&uc, 0, 0, 0, 0, 0);
+		  uc, 0, 0, 0, 0, 0);
 }
 
-uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 {
 	struct kvm_run *run = vcpu->run;
 	struct ucall ucall = {};
diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
index 73dc4e21190f..114cb4af295f 100644
--- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
+++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
@@ -6,34 +6,21 @@
  */
 #include "kvm_util.h"
 
-void ucall_init(struct kvm_vm *vm, void *arg)
+void ucall_arch_init(struct kvm_vm *vm, void *arg)
 {
 }
 
-void ucall_uninit(struct kvm_vm *vm)
+void ucall_arch_uninit(struct kvm_vm *vm)
 {
 }
 
-void ucall(uint64_t cmd, int nargs, ...)
+void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
-	struct ucall uc = {
-		.cmd = cmd,
-	};
-	va_list va;
-	int i;
-
-	nargs = min(nargs, UCALL_MAX_ARGS);
-
-	va_start(va, nargs);
-	for (i = 0; i < nargs; ++i)
-		uc.args[i] = va_arg(va, uint64_t);
-	va_end(va);
-
 	/* Exit via DIAGNOSE 0x501 (normally used for breakpoints) */
-	asm volatile ("diag 0,%0,0x501" : : "a"(&uc) : "memory");
+	asm volatile ("diag 0,%0,0x501" : : "a"(uc) : "memory");
 }
 
-uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 {
 	struct kvm_run *run = vcpu->run;
 	struct ucall ucall = {};
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
new file mode 100644
index 000000000000..2395c7f1d543
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "kvm_util.h"
+
+void ucall(uint64_t cmd, int nargs, ...)
+{
+	struct ucall uc = {};
+	va_list va;
+	int i;
+
+	WRITE_ONCE(uc.cmd, cmd);
+
+	nargs = min(nargs, UCALL_MAX_ARGS);
+
+	va_start(va, nargs);
+	for (i = 0; i < nargs; ++i)
+		WRITE_ONCE(uc.args[i], va_arg(va, uint64_t));
+	va_end(va);
+
+	ucall_arch_do_ucall((vm_vaddr_t)&uc);
+}
diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
index e5f0f9e0d3ee..9f532dba1003 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
@@ -8,34 +8,21 @@
 
 #define UCALL_PIO_PORT ((uint16_t)0x1000)
 
-void ucall_init(struct kvm_vm *vm, void *arg)
+void ucall_arch_init(struct kvm_vm *vm, void *arg)
 {
 }
 
-void ucall_uninit(struct kvm_vm *vm)
+void ucall_arch_uninit(struct kvm_vm *vm)
 {
 }
 
-void ucall(uint64_t cmd, int nargs, ...)
+void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
-	struct ucall uc = {
-		.cmd = cmd,
-	};
-	va_list va;
-	int i;
-
-	nargs = min(nargs, UCALL_MAX_ARGS);
-
-	va_start(va, nargs);
-	for (i = 0; i < nargs; ++i)
-		uc.args[i] = va_arg(va, uint64_t);
-	va_end(va);
-
 	asm volatile("in %[port], %%al"
-		: : [port] "d" (UCALL_PIO_PORT), "D" (&uc) : "rax", "memory");
+		: : [port] "d" (UCALL_PIO_PORT), "D" (uc) : "rax", "memory");
 }
 
-uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 {
 	struct kvm_run *run = vcpu->run;
 	struct ucall ucall = {};
-- 
2.38.0.rc1.362.ged0d419d3c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
