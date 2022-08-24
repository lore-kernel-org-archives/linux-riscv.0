Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412F1C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 03:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gy62pl+ZYs6aeBvj7ofqr87MzydayfmkKi4DwLcwlBk=; b=pCF65U5jS+Gpfz
	Zf9yi6k3twlXghe+jbwa9WmfyFtTJ4p3pPBhfd2fz6b8vb+wRnYMkVq+K7I2bSaFycfEJAvXgPxB1
	39EOJk5Rfu7IDL3D+qU6BwhKvIT0NieDxzVqVcd5i27V560lnIF0zgyfzz8MosXDv7U1GYOz6p8j7
	DIlvP8Ymxc/qBO6oEvUSQyMp2+LxexloMRwIxWdLgQEmLHgppGho/o25E+0KLMEW9q9NWEob+dTBB
	QS3yamGI3FBuVV+77ZZhl8ULSNURIOxMBCyHfFf4g7Mx65a8W4kRFD6yO7PeMC3tyl3qHNa/eaFD9
	N+UoXRHeJ1MnEslv7ezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQhXr-00ANBf-Q8; Wed, 24 Aug 2022 03:59:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQhXi-00AMwr-9X
	for linux-riscv@bombadil.infradead.org; Wed, 24 Aug 2022 03:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ID0LEN54g4SKI12YiNIJ9Ou03DYNCbuKZq4SDDiKjA0=; b=Rz0cqnTZtTDRrOJBY8pVcSn9bO
	anTpdI1u6mckM8wmBKVIVtNmNetUISbRJBm6Mz5EwtKXW4irvO2H6LnHhszVeAYz/a8PMNY5pGIq+
	gLdQThviyHpczScdsDexRiAsnWYerZ43bCo1T/hLVDP9bZvtU/aoEwE9Hjppp3CT+0m1Wt7GZS5S7
	OBTkNfY7NBIwML0v9P7QSJGbupjJiKaMcMNtRhBRV3tDix5Y8NrbNjyLqWPRtad6UCTYmh1RsXxn8
	Dsdz2Al+gwHr9WNOQBPOBFdmre3iqHR2yZ76Mlru+atqrjBSMJyh6uZHEkTdSzcJI3uTeX8KjQZUi
	yOVgKZQQ==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgxU-005Xu4-Rz
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 03:21:44 +0000
Received: by mail-pf1-x44a.google.com with SMTP id cg5-20020a056a00290500b0053511889856so6835993pfb.18
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 20:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:reply-to:from:to:cc;
        bh=ID0LEN54g4SKI12YiNIJ9Ou03DYNCbuKZq4SDDiKjA0=;
        b=MIyLxnBhPREuMmCFGfdXhP05WPcmtjb1vwHFIbVVRFVs4jR2fonrTaIHNxayLeWFvI
         vRIjETuqqQtEl/oOfOlexNo6GSKg/65OOqECKXQJ9aAlA6XqJOBIwRcWgqfXOosk9D8j
         VPRBAhNwIIePzlmHjVuRHYhBIqcj0KGWUssusNH9xb3aVQ1PlhWKDMm/JNNBiztkl5/a
         dYhqP9ERH/fzgi8b5B88DLfvDynm0gh2FDpbyJuPInhEFP5GUhGS+IgiPBueJYfLLNjJ
         Ba+i6EfGZxmNdAYIRxaAyRtMlp9m8RqE/9c+o55oeMkydrSq6gQyilcJhm8JhRVM3xYo
         aHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc;
        bh=ID0LEN54g4SKI12YiNIJ9Ou03DYNCbuKZq4SDDiKjA0=;
        b=a16TdsrZEWBd2LE+w5Xj6In41ZOU50O9BPDOtLBk300GeB/qZlhAV3Qwtu+kah0eZi
         SwmBPfVM2RFYHP/YKbFdr5J9XlAHy6TKJ1eYVzLoRaTITOryKXWioDDGlok4yJ/tojt3
         lwUjGDQFq40O56OE0XeziIW4mY5s1DL5I0TLVMisVDp8bWSVH65TRFO2hciNIwk03onY
         cH1fFjqXqGrz3KEPBsO/HlWYg0Mkxl0R9M7fjuGvLPtjUXfyxVJM0oj44umTnHZQO/x7
         65taPAlhc5HGnp7SF2lp5W3nKWPgW/9QRq8Ufd6tgMKCpFlTduzr/q8vBCH4lhsNTFLo
         xLmQ==
X-Gm-Message-State: ACgBeo3g1/SByf78ilFmjqBMge1NQ6Hahk245PvdJ/YtnoKb8PnHIw41
	SXoGGluDHhMw2ccCFyUOU/WnyHBrzdk=
X-Google-Smtp-Source: AA6agR7qJXZ060IVlHFYw5MostRiExgVNSpQSb5aqpoFfJhg5KBymx9MNvVNgiIbEitImrJ5lWzWN1hYAyQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:a14:b0:1fa:bc6e:e5e8 with SMTP id
 gg20-20020a17090b0a1400b001fabc6ee5e8mr154528pjb.1.1661311289328; Tue, 23 Aug
 2022 20:21:29 -0700 (PDT)
Date: Wed, 24 Aug 2022 03:21:15 +0000
In-Reply-To: <20220824032115.3563686-1-seanjc@google.com>
Message-Id: <20220824032115.3563686-7-seanjc@google.com>
Mime-Version: 1.0
References: <20220824032115.3563686-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v4 6/6] KVM: selftests: Add ucall pool based implementation
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
X-CRM114-CacheID: sfid-20220824_042139_616876_DA27CD79 
X-CRM114-Status: GOOD (  20.71  )
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

From: Peter Gonda <pgonda@google.com>

To play nice with guests whose stack memory is encrypted, e.g. AMD SEV,
introduce a new "ucall pool" implementation that passes the ucall struct
via dedicated memory (which can be mapped shared, a.k.a. as plain text).

Because not all architectures have access to the vCPU index in the guest,
use a bitmap with atomic accesses to track which entries in the pool are
free/used.  A list+lock could also work in theory, but synchronizing the
individual pointers to the guest would be a mess.

Note, there's no need to rewalk the bitmap to ensure success.  If all
vCPUs are simply allocating, success is guaranteed because there are
enough entries for all vCPUs.  If one or more vCPUs are freeing and then
reallocating, success is guaranteed because vCPUs _always_ walk the
bitmap from 0=>N; if vCPU frees an entry and then wins a race to
re-allocate, then either it will consume the entry it just freed (bit is
the first free bit), or the losing vCPU is guaranteed to see the freed
bit (winner consumes an earlier bit, which the loser hasn't yet visited).

Signed-off-by: Peter Gonda <pgonda@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/ucall_common.h      | 14 ++--
 .../testing/selftests/kvm/lib/aarch64/ucall.c |  7 +-
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  2 +-
 tools/testing/selftests/kvm/lib/s390x/ucall.c |  2 +-
 .../testing/selftests/kvm/lib/ucall_common.c  | 83 ++++++++++++++++++-
 .../testing/selftests/kvm/lib/x86_64/ucall.c  |  2 +-
 6 files changed, 89 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index 8077a6d8b1ba..360397e3cbf5 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -22,6 +22,9 @@ enum {
 struct ucall {
 	uint64_t cmd;
 	uint64_t args[UCALL_MAX_ARGS];
+
+	/* Host virtual address of this struct. */
+	struct ucall *hva;
 };
 
 void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa);
@@ -32,15 +35,8 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu);
 void ucall(uint64_t cmd, int nargs, ...);
 uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
 
-static inline void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
-{
-	ucall_arch_init(vm, mmio_gpa);
-}
-
-static inline void ucall_uninit(struct kvm_vm *vm)
-{
-	ucall_arch_uninit(vm);
-}
+void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa);
+void ucall_uninit(struct kvm_vm *vm);
 
 #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4)	\
 				ucall(UCALL_SYNC, 6, "hello", stage, arg1, arg2, arg3, arg4)
diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
index acb47c813477..5f79c9fc72d7 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
@@ -43,12 +43,9 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 
 	if (run->exit_reason == KVM_EXIT_MMIO &&
 	    run->mmio.phys_addr == vcpu->vm->ucall_mmio_addr) {
-		vm_vaddr_t gva;
-
-		TEST_ASSERT(run->mmio.is_write && run->mmio.len == 8,
+		TEST_ASSERT(run->mmio.is_write && run->mmio.len == sizeof(uint64_t),
 			    "Unexpected ucall exit mmio address access");
-		memcpy(&gva, run->mmio.data, sizeof(gva));
-		return addr_gva2hva(vcpu->vm, gva);
+		return (void *)(*((uint64_t *)run->mmio.data));
 	}
 
 	return NULL;
diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index c58ecb8a0981..9526a200d038 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -59,7 +59,7 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 	    run->riscv_sbi.extension_id == KVM_RISCV_SELFTESTS_SBI_EXT) {
 		switch (run->riscv_sbi.function_id) {
 		case KVM_RISCV_SELFTESTS_SBI_UCALL:
-			return addr_gva2hva(vcpu->vm, run->riscv_sbi.args[0]);
+			return (void *)run->riscv_sbi.args[0];
 		case KVM_RISCV_SELFTESTS_SBI_UNEXP:
 			vcpu_dump(stderr, vcpu, 2);
 			TEST_ASSERT(0, "Unexpected trap taken by guest");
diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
index 208f0f04299b..1efdeac60b4e 100644
--- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
+++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
@@ -30,7 +30,7 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 	    (run->s390_sieic.ipb >> 16) == 0x501) {
 		int reg = run->s390_sieic.ipa & 0xf;
 
-		return addr_gva2hva(vcpu->vm, run->s.regs.gprs[reg]);
+		return (void *)run->s.regs.gprs[reg];
 	}
 	return NULL;
 }
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index ced480860746..29f8cb614382 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -1,22 +1,97 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include "kvm_util.h"
+#include "linux/types.h"
+#include "linux/bitmap.h"
+#include "linux/atomic.h"
+
+struct ucall_header {
+	DECLARE_BITMAP(in_use, KVM_MAX_VCPUS);
+	struct ucall ucalls[KVM_MAX_VCPUS];
+};
+
+/*
+ * This "global" holds different per-VM values, it must not be accessed from
+ * host code except to sync the guest value, and that must be done atomically.
+ */
+static struct ucall_header *ucall_pool;
+
+static void ucall_set_pool(struct kvm_vm *vm, struct ucall_header *val)
+{
+	atomic_sync_global_pointer_to_guest(vm, ucall_pool, val);
+}
+
+void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+	struct ucall_header *hdr;
+	struct ucall *uc;
+	vm_vaddr_t vaddr;
+	int i;
+
+	vaddr = vm_vaddr_alloc(vm, sizeof(*hdr), KVM_UTIL_MIN_VADDR);
+	hdr = (struct ucall_header *)addr_gva2hva(vm, vaddr);
+	memset(hdr, 0, sizeof(*hdr));
+
+	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
+		uc = &hdr->ucalls[i];
+		uc->hva = uc;
+	}
+
+	ucall_set_pool(vm, (void *)vaddr);
+
+	ucall_arch_init(vm, mmio_gpa);
+}
+
+void ucall_uninit(struct kvm_vm *vm)
+{
+	ucall_set_pool(vm, NULL);
+
+	ucall_arch_uninit(vm);
+}
+
+static struct ucall *ucall_alloc(void)
+{
+	struct ucall *uc;
+	int i;
+
+	GUEST_ASSERT(ucall_pool && ucall_pool->in_use);
+
+	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
+		if (!atomic_test_and_set_bit(i, ucall_pool->in_use)) {
+			uc = &ucall_pool->ucalls[i];
+			memset(uc->args, 0, sizeof(uc->args));
+			return uc;
+		}
+	}
+	GUEST_ASSERT(0);
+	return NULL;
+}
+
+static noinline void ucall_free(struct ucall *uc)
+{
+	/* Beware, here be pointer arithmetic.  */
+	clear_bit(uc - ucall_pool->ucalls, ucall_pool->in_use);
+}
 
 void ucall(uint64_t cmd, int nargs, ...)
 {
-	struct ucall uc = {};
+	struct ucall *uc;
 	va_list va;
 	int i;
 
-	WRITE_ONCE(uc.cmd, cmd);
+	uc = ucall_alloc();
+
+	WRITE_ONCE(uc->cmd, cmd);
 
 	nargs = min(nargs, UCALL_MAX_ARGS);
 
 	va_start(va, nargs);
 	for (i = 0; i < nargs; ++i)
-		WRITE_ONCE(uc.args[i], va_arg(va, uint64_t));
+		WRITE_ONCE(uc->args[i], va_arg(va, uint64_t));
 	va_end(va);
 
-	ucall_arch_do_ucall((vm_vaddr_t)&uc);
+	ucall_arch_do_ucall((vm_vaddr_t)uc->hva);
+
+	ucall_free(uc);
 }
 
 uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
index 016a0487cf72..82e7f6ae7811 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
@@ -30,7 +30,7 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 		struct kvm_regs regs;
 
 		vcpu_regs_get(vcpu, &regs);
-		return addr_gva2hva(vcpu->vm, regs.rdi);
+		return (void *)regs.rdi;
 	}
 	return NULL;
 }
-- 
2.37.1.595.g718a3a8f04-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
