Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F83CEE330
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 17:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVz7s4WGbmB8FaeAqGQCwq5ZiqK1nwao9Zn3RHSwnEs=; b=j2BV02JbxhPm7k
	UCOXhVWTp2b3n70QQm0xKfzoejdbZqUUrJPnF4mx4aZvM0ZhB+IgEw0dDAD7UAhIrKd4PFkmacLv5
	MNxH+teZXDDdKiBp67o+iEkqw8/x2qgbkFYcXlFtjQ3ratVwYucKaQYN5ZFgKvo6Gh8Ne7M/2SVy9
	Rkj2t5QDH3F2IG5HLhuwcD6J9MO/sG9QbKauaBlzdccC6nBVJvCuKsrr5yAPDEo+O91/xuATtJE/X
	RsHlBqlhS+Wmt+3N2VLBjZR+nYuFux+RMeifl+/9BgUpMl2RSm71OnaHCAgV1jtaJMV1aZll264zE
	Q6JxfeK81dQp9L21d72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syaHw-0000000A8nD-0kJ8;
	Wed, 09 Oct 2024 17:15:52 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYxG-00000009oGq-2DZ8
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:28 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-20b61ec80a2so78991475ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489025; x=1729093825; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pdirxHCOZgZcScGJrji1f7MunRQ6Bg++3PkXMCIJLoA=;
        b=ehWBh0nZ+3Kc09JWFcYq4NkZxZJTiboeS4gDIgMG29reWa5RWQlf0t9bTZ92gPe+ud
         jX5jpzHuTwZwDOLS34xJYPgNxRonYwG2h4h5Vj8rG65579amXLk0wmi5cgVQOJtF4Pg8
         2GCANT7yX2anbLjzWqgccdfCPNDiehbliEkEN3TrXO0tb/ZmXuexyn6falPiSU0LoNc3
         pIQHEZYF5Yn9spMvnXpBQp0mkIAEpTr+6kx35gT5mNLf7ox3618rHluVEamPCJDkbAX+
         n6J685g0HupVahlZiCiZ9ZitoyHXqQ5KbgXuOWMNpQHK6rA/7XqVsVhyfZSu7drwnWOv
         2URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489025; x=1729093825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdirxHCOZgZcScGJrji1f7MunRQ6Bg++3PkXMCIJLoA=;
        b=EjR1Btg9kZ5VvIc6SxiyJCRGSlYTx5feGHBGXh29WA6Sx0kE5MWV7wU9u9nZBVmv/a
         Ab5JKy2wSzHpDQk7/LScb1gHhS49aX9vhsfA8Sy4b9ciFGe4ksj4rbt0MwS7plY18OjA
         JVUVPEf4uFVqhOfgKS8trLlu3rN+iTSPCZrtlc8/+mY/gCn853Wm5ETLCtKOqWcMpuTz
         Ni95RQzhH2g+H8wfNfbuhE+zSMVm7R9nSkYwCMgM+vj8+h74RAlVg8Sk0xJ/4lk5asyU
         G2Vd6b60fU7RABhcwIjopW7Ldux6FvzpsqFxl2K3oA9yssmRbUf1+szs4ANk2NCpJBem
         ZEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+s9MOJABz5t40skKA2CNlvisFuoeTq0w7bfgx01VDQlLwb1MgXNvLfzz4X79mtR4vkx9+d4l6VreITw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsweWWUzDyyZhatmozdv0H278CBnIeRSzLzrEa7b9txNe7xWwl
	Ta+8NmrSytpV8wkDUVUBTptPHC6/+GOq7j+PX5dabS8CsB+Pvjn48DKZiVi/iMCbdRcH71hVM6W
	mEg==
X-Google-Smtp-Source: AGHT+IF06EOvabba1YpY/m+9TdddfKJv+phXMs6xFxlGn64HlbjifXqL0d0/QpkP5vVUJng9o1/hHhmQcTE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:d2c2:b0:20b:ad74:c83d with SMTP id
 d9443c01a7336-20c6377b2e8mr457555ad.8.1728489024593; Wed, 09 Oct 2024
 08:50:24 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:53 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-15-seanjc@google.com>
Subject: [PATCH v3 14/14] KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085026_653872_2468F8CC 
X-CRM114-Status: GOOD (  18.53  )
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
index 0918fade9267..d9c76b4c0d88 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -17,6 +17,8 @@
 #include "processor.h"
 #include "ucall_common.h"
 
+static bool mprotect_ro_done;
+
 static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 {
 	uint64_t gpa;
@@ -32,6 +34,42 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
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
 
@@ -79,6 +117,7 @@ static void *vcpu_worker(void *data)
 	struct vcpu_info *info = data;
 	struct kvm_vcpu *vcpu = info->vcpu;
 	struct kvm_vm *vm = vcpu->vm;
+	int r;
 
 	vcpu_args_set(vcpu, 3, info->start_gpa, info->end_gpa, vm->page_size);
 
@@ -101,6 +140,57 @@ static void *vcpu_worker(void *data)
 
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
@@ -183,7 +273,7 @@ int main(int argc, char *argv[])
 	const uint64_t start_gpa = SZ_4G;
 	const int first_slot = 1;
 
-	struct timespec time_start, time_run1, time_reset, time_run2, time_ro;
+	struct timespec time_start, time_run1, time_reset, time_run2, time_ro, time_rw;
 	uint64_t max_gpa, gpa, slot_size, max_mem, i;
 	int max_slots, slot, opt, fd;
 	bool hugepages = false;
@@ -288,19 +378,27 @@ int main(int argc, char *argv[])
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
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
