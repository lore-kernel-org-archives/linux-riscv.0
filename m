Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1169CC32774
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 03:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2wWqvpRJ8FsYZb5QtJkh/rGPhfBO8PT1nJenHGWBy8=; b=dK9YvI20CZ/ZgX
	gdszipt61lkJTw06wVzbJJZrZSWaqB1KxFx83UmefQbOuIY8IlPZMKRqHSti4WuNVR9pS3X2IFeea
	KJu7NnbjwkbCeAqg80nv18mXwLbrTB9VVSY5EZPxRtRsQD4KjioU0IRl5v1dAzrVLrdqnR85IL0Ve
	dKJrjG7SjADRiklsxocPi+UedRfw9ETNlY0/ir6CNgdNdxJMjEdrtWqoviz3tni9uUFj6ae9Y6CSr
	k4FpfUxfX36Zrtr+1Xqwmk0AVbadc4RVMAcno8LLAzwBNFzaSm4p+8YszHz7N/Ry8ROt9nt0FjLyJ
	G2tVhEtwHsAwZMKgpAow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgxT-00ACU4-BU; Wed, 24 Aug 2022 03:21:35 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgxF-00ACN6-J7
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 03:21:23 +0000
Received: by mail-pl1-x64a.google.com with SMTP id h12-20020a170902f54c00b0016f8858ce9bso10121528plf.9
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 20:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:reply-to:from:to:cc;
        bh=wtLUCfKzRSBKyqzo4FVzGqM9LhFt5R903IOvXYqBYBc=;
        b=eESBbT2+W9zCsVMpXik4dEDPaalIRvqdfo16s/t6/J7UBvxuox/eTDwod741qM/q42
         V2jOf16DCIo7j9ygYiiPJD4hMuiWpHhxEuDgXGn7BC8srOGyGn3fROIwULAmeLOWmUWD
         Xm6Nezf8Hn5vhndS0c7qiGNnDX52X0nSVAWjGnj2ixKQbyOWm/kNtdYni8gzyX13EM7l
         ulC6jj4JgYmWenwU0fSZulZLKxWfv5NaOt1UPHvsRYX16Lm37yJ3uewDiWK+oFri4mR1
         UPND6Wsjc1qKNkDoEQSdFKXAiACb7pNJy7OLaLGPmb7jBV0LFGf4UWuz9Impqpe6vdUj
         i5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc;
        bh=wtLUCfKzRSBKyqzo4FVzGqM9LhFt5R903IOvXYqBYBc=;
        b=5cN02ImnUHvlwBw24Qf1Q8bXSPc7moxN7dchsby9oEyhSaCkBBvzI8wb5owMMKQSuu
         7CcBun/ODozKwANk6nVc+WoD82bXf6L79tC26SlxtTdEWF/W2b7fFsJBQvE4sW17PdSS
         7vfUPhPFAPZcFab6UtJEWceEuPT+DYSvRj2oDlaxt51S4zqdu2UG3KeXwU8MFz8hljgL
         0Bjp2iBirF1bAa7fh3xy0oLqok6wwtsiTU5fW9CCx7tbxoFrZdjdOBrovbpDAFoQadIH
         Wngz6Z+0TW4rx5cnedW5mLJFnvVC3Dm5EFwEaIg2zp6vY2bOFvr0/hK8nRWZlSmfMfPu
         8E9Q==
X-Gm-Message-State: ACgBeo3ThSNU5XD73RbG9soCYJ24cRZf1XfLcagPbRHTtVceNZI5UP+E
	ti16LWqLsEJyH9gLas1JTP529q7M6yQ=
X-Google-Smtp-Source: AA6agR7nWH/v46q+tJqwDgyPv3qjQXZ6329HUyxQYK0CjAquGSgm9hmktSh4bMhhS4QHH6ZbXrQZdF1h+pQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c9cc:b0:172:e18d:4703 with SMTP id
 q12-20020a170902c9cc00b00172e18d4703mr14110982pld.41.1661311279817; Tue, 23
 Aug 2022 20:21:19 -0700 (PDT)
Date: Wed, 24 Aug 2022 03:21:10 +0000
In-Reply-To: <20220824032115.3563686-1-seanjc@google.com>
Message-Id: <20220824032115.3563686-2-seanjc@google.com>
Mime-Version: 1.0
References: <20220824032115.3563686-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v4 1/6] KVM: selftests: Consolidate common code for populating
 ucall struct
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>, 
	Peter Gonda <pgonda@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_202121_653293_B48A6A70 
X-CRM114-Status: GOOD (  17.97  )
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
Cc: Peter Gonda <pgonda@google.com>
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
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
index 4c122f1b1737..23649c5d42fc 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -47,6 +47,7 @@ LIBKVM += lib/perf_test_util.c
 LIBKVM += lib/rbtree.c
 LIBKVM += lib/sparsebit.c
 LIBKVM += lib/test_util.c
+LIBKVM += lib/ucall_common.c
 
 LIBKVM_x86_64 += lib/x86_64/apic.c
 LIBKVM_x86_64 += lib/x86_64/handlers.S
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
2.37.1.595.g718a3a8f04-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
