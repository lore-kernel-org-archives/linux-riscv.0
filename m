Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B544CEE57D7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvnDCaBxTbOg5cvGGbBpCuyCa0g6nRtxHvMfx6F48g4=; b=mF7EQ3VkGujXIb
	L2afGSmHw06TEnNJEGtF87TNnA1gFlsyMfBktV3ntdSAH1Q4GY1h5Apdu1YZb2snAoCmbfUtHniJn
	rWT1NHqHCddZNNeZKErRi8TSbal1D3BYuXYfyZqXyK8h0UsZKzf+Zk4mAoGNBJwroOrHgOHN6VENV
	x00pFU3G2Q6fJlo/2g8gmh6ORl1SUEULNqIdOpQtbxtwPom+eJ9+DM52APjqqqa3/HUl1XPuR81Tn
	BXzoFkeD5OeHqbE9Gyu2FvZRhXg+ESTXZX2JN+k1NFKni1vOblCbJ1OVu4RAUChKp5Y4nlpJ5pe3r
	yxIGPdgPWuirNUBjK/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUNZ-0000000B0XQ-0g3V;
	Wed, 11 Sep 2024 20:55:57 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAq-0000000AxBe-1Inf
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:49 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7d7cbd87bfaso174809a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087367; x=1726692167; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9gVKeS9zxIWQJ6wZPVMMrqlZKwDoa69fsuapAtj2LII=;
        b=NtguszBeKpXUzQpma5F2f7peZZCIHzA0BZ9+aZ0krwlreXSAGmCQMovQY8hNvmbHnB
         ZGwbvJGvQ+dkkO1WP1ftCWjdVlM4PsAA0RkThUapmG/WkPDrDjEQ0q1brFKWpRWerJqo
         0Ot7wDpaFJMsNFDny6RdsGB4PBwvxTuebkx5Pi/SweO/IAdQDu60nRr69IdgTMF55z7+
         aFktODiK+knanEwvtXZug/nq+O+wgxUlwb7gwVifuPHp3jcMyikha/pSEyy4XYcRs3z+
         ArP2sFFQhMvjNSwqz5Pj2ofTopvbs7Vtp5fWggxdh1pynYlFVS8fn44TqkCv9wPDpZpv
         V2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087367; x=1726692167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gVKeS9zxIWQJ6wZPVMMrqlZKwDoa69fsuapAtj2LII=;
        b=wCrzlx+aYrSXsg9usGClyP4wTkvx43uDQSX5KjKRTK1el6lyh799Tf47ShwFLRpI6k
         Pv8UN44IkLuCicL/FXFYpUW3OaypZOU3ocTcu0QL5QboEI5LWzfqqDZJ21DhflFp37kM
         h+fPuT19ReH1qu3G6qRo/Lg7oIU6ZDF9VRfM9uk/6JXAkhQYU6lZ4ZoeV6Fml9DQBOGa
         vSDqUvWWn7MBvIZcdHU9IsYWeqpaJPzWemNg/4UGWAyZey/JTZAbGQinMLEIN3qSWE4t
         4LIdySJ7jcNpJ3yeTdghG1O0rLZWgD4X+1aM0cdd+Z0Y7qqKD9+BEYWzCPz9jCc/IMlm
         UrMA==
X-Forwarded-Encrypted: i=1; AJvYcCUK9zZ3j8/GGlqrlV4oInbfyjPYnURVTXBVxUU0+7iilyTFywmpE8wK3Vd6P0gGJZGy2AIwZMXRubNCZw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5W1AArtTecgiTaY6dBLbtkYWRHBvO9Xg+rEJJhWvqJplfxo8Y
	6Gs57qRBqdxr1N8mQjj7QUOh8qKQ9Hf3QKGFcDkp+vWMusfkwa31KGzbsfPKJf7MGrpLdtP52BM
	shQ==
X-Google-Smtp-Source: AGHT+IGelrPvd4nOI5BY8vHHV3fhWRQXV6KTNrZs/VYSkLr9yCzToyzIxt0KpWTMZ3YrjpacOP321gVr5gM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:721a:0:b0:7cd:6621:8cd5 with SMTP id
 41be03b00d2f7-7db2057eeb1mr17290a12.3.1726087367261; Wed, 11 Sep 2024
 13:42:47 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:58 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-14-seanjc@google.com>
Subject: [PATCH v2 13/13] KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_134248_397619_F1DA8458 
X-CRM114-Status: GOOD (  18.28  )
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

Add two phases to mmu_stress_test to verify that KVM correctly handles
guest memory that was writable, and then made read-only in the primary MMU,
and then made writable again.

Add bonus coverage for x86 and arm64 to verify that all of guest memory was
marked read-only.  Making forward progress (without making memory writable)
requires arch specific code to skip over the faulting instruction, but the
test can at least verify each vCPU's starting page was made read-only for
other architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 104 +++++++++++++++++-
 1 file changed, 101 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 50c3a17418c4..c07c15d7cc9a 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -16,6 +16,8 @@
 #include "guest_modes.h"
 #include "processor.h"
 
+static bool mprotect_ro_done;
+
 static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 {
 	uint64_t gpa;
@@ -31,6 +33,42 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 		*((volatile uint64_t *)gpa);
 	GUEST_SYNC(2);
 
+	/*
+	 * Write to the region while mprotect(PROT_READ) is underway.  Keep
+	 * looping until the memory is guaranteed to be read-only, otherwise
+	 * vCPUs may complete their writes and advance to the next stage
+	 * prematurely.
+	 *
+	 * For architectures that support skipping the faulting instruction,
+	 * generate the store via inline assembly to ensure the exact length
+	 * of the instruction is known and stable (vcpu_arch_put_guest() on
+	 * fixed-length architectures should work, but the cost of paranoia
+	 * is low in this case).  For x86, hand-code the exact opcode so that
+	 * there is no room for variability in the generated instruction.
+	 */
+	do {
+		for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
+#ifdef __x86_64__
+			asm volatile(".byte 0x48,0x89,0x00" :: "a"(gpa) : "memory"); /* mov %rax, (%rax) */
+#elif defined(__aarch64__)
+			asm volatile("str %0, [%0]" :: "r" (gpa) : "memory");
+#else
+			vcpu_arch_put_guest(*((volatile uint64_t *)gpa), gpa);
+#endif
+	} while (!READ_ONCE(mprotect_ro_done));
+
+	/*
+	 * Only architectures that write the entire range can explicitly sync,
+	 * as other architectures will be stuck on the write fault.
+	 */
+#if defined(__x86_64__) || defined(__aarch64__)
+	GUEST_SYNC(3);
+#endif
+
+	for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
+		vcpu_arch_put_guest(*((volatile uint64_t *)gpa), gpa);
+	GUEST_SYNC(4);
+
 	GUEST_ASSERT(0);
 }
 
@@ -78,6 +116,7 @@ static void *vcpu_worker(void *data)
 	struct vcpu_info *info = data;
 	struct kvm_vcpu *vcpu = info->vcpu;
 	struct kvm_vm *vm = vcpu->vm;
+	int r;
 
 	vcpu_args_set(vcpu, 3, info->start_gpa, info->end_gpa, vm->page_size);
 
@@ -100,6 +139,57 @@ static void *vcpu_worker(void *data)
 
 	/* Stage 2, read all of guest memory, which is now read-only. */
 	run_vcpu(vcpu, 2);
+
+	/*
+	 * Stage 3, write guest memory and verify KVM returns -EFAULT for once
+	 * the mprotect(PROT_READ) lands.  Only architectures that support
+	 * validating *all* of guest memory sync for this stage, as vCPUs will
+	 * be stuck on the faulting instruction for other architectures.  Go to
+	 * stage 3 without a rendezvous
+	 */
+	do {
+		r = _vcpu_run(vcpu);
+	} while (!r);
+	TEST_ASSERT(r == -1 && errno == EFAULT,
+		    "Expected EFAULT on write to RO memory, got r = %d, errno = %d", r, errno);
+
+#if defined(__x86_64__) || defined(__aarch64__)
+	/*
+	 * Verify *all* writes from the guest hit EFAULT due to the VMA now
+	 * being read-only.  x86 and arm64 only at this time as skipping the
+	 * instruction that hits the EFAULT requires advancing the program
+	 * counter, which is arch specific and relies on inline assembly.
+	 */
+#ifdef __x86_64__
+	vcpu->run->kvm_valid_regs = KVM_SYNC_X86_REGS;
+#endif
+	for (;;) {
+		r = _vcpu_run(vcpu);
+		if (!r)
+			break;
+		TEST_ASSERT_EQ(errno, EFAULT);
+#if defined(__x86_64__)
+		WRITE_ONCE(vcpu->run->kvm_dirty_regs, KVM_SYNC_X86_REGS);
+		vcpu->run->s.regs.regs.rip += 3;
+#elif defined(__aarch64__)
+		vcpu_set_reg(vcpu, ARM64_CORE_REG(regs.pc),
+			     vcpu_get_reg(vcpu, ARM64_CORE_REG(regs.pc)) + 4);
+#endif
+
+	}
+	assert_sync_stage(vcpu, 3);
+#endif /* __x86_64__ || __aarch64__ */
+	rendezvous_with_boss();
+
+	/*
+	 * Stage 4.  Run to completion, waiting for mprotect(PROT_WRITE) to
+	 * make the memory writable again.
+	 */
+	do {
+		r = _vcpu_run(vcpu);
+	} while (r && errno == EFAULT);
+	TEST_ASSERT_EQ(r, 0);
+	assert_sync_stage(vcpu, 4);
 	rendezvous_with_boss();
 
 	return NULL;
@@ -182,7 +272,7 @@ int main(int argc, char *argv[])
 	const uint64_t start_gpa = SZ_4G;
 	const int first_slot = 1;
 
-	struct timespec time_start, time_run1, time_reset, time_run2, time_ro;
+	struct timespec time_start, time_run1, time_reset, time_run2, time_ro, time_rw;
 	uint64_t max_gpa, gpa, slot_size, max_mem, i;
 	int max_slots, slot, opt, fd;
 	bool hugepages = false;
@@ -287,19 +377,27 @@ int main(int argc, char *argv[])
 	rendezvous_with_vcpus(&time_run2, "run 2");
 
 	mprotect(mem, slot_size, PROT_READ);
+	usleep(10);
+	mprotect_ro_done = true;
+	sync_global_to_guest(vm, mprotect_ro_done);
+
 	rendezvous_with_vcpus(&time_ro, "mprotect RO");
+	mprotect(mem, slot_size, PROT_READ | PROT_WRITE);
+	rendezvous_with_vcpus(&time_rw, "mprotect RW");
 
+	time_rw    = timespec_sub(time_rw,     time_ro);
 	time_ro    = timespec_sub(time_ro,     time_run2);
 	time_run2  = timespec_sub(time_run2,   time_reset);
 	time_reset = timespec_sub(time_reset,  time_run1);
 	time_run1  = timespec_sub(time_run1,   time_start);
 
 	pr_info("run1 = %ld.%.9lds, reset = %ld.%.9lds, run2 = %ld.%.9lds, "
-		"ro = %ld.%.9lds\n",
+		"ro = %ld.%.9lds, rw = %ld.%.9lds\n",
 		time_run1.tv_sec, time_run1.tv_nsec,
 		time_reset.tv_sec, time_reset.tv_nsec,
 		time_run2.tv_sec, time_run2.tv_nsec,
-		time_ro.tv_sec, time_ro.tv_nsec);
+		time_ro.tv_sec, time_ro.tv_nsec,
+		time_rw.tv_sec, time_rw.tv_nsec);
 
 	/*
 	 * Delete even numbered slots (arbitrary) and unmap the first half of
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
