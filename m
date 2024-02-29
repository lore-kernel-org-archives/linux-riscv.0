Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5301C5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 01:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vzJGWo5PWRVDlRe9QhlFDzTKPasnhROZkZ3CaDcEcE=; b=KE8/ATpF//nMTZ
	Sf/zM8JbA5TaW4JDX8yEcZd4XFrzCxrXoVVjImqUujuLMuV0ebzuQcKIE8KcMYHTX9GQUx5RpMXoq
	AdlA3H/JG3KnMoSWN16fpV2eS7M7ygDD5BlKB9fwU9ID78aJ/z0eRMf0HnFtZul7wx4Q2NHBa52tq
	6OsGCHpcLxUHJEM7YZ3oKzHeuOdfzz5vHasaJaszVhZ83EUyrDHCUkJu4RO48cMYzPjzEkTH5DsL0
	OwHQOJ4hxgwf9sSBsjd6JC/WAfhX/V91rPduT2s24VdcCXRjNYMUZt7Tds7C/6nE7vJxOjcRh6UI5
	HMK5zyD208gLytdJb1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUpu-0000000BXWt-0TVK;
	Thu, 29 Feb 2024 01:03:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUoX-0000000BWRl-2odS
	for linux-riscv@bombadil.infradead.org;
	Thu, 29 Feb 2024 01:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OJ2VUtbLaQ9lOdd37SBu/yCmKnVIsQUEbE5aRuu2Z70=; b=Bgiaxw+dZqmCnrlcCyoWK2IwNY
	IVOw2FA7rk9VVog5F1jUl+HpB2aLnNoedFHCWj/TeMufarlsMoSvTcJuTgn/vLRC05n/s0mUqH1+c
	4vNyshnk53Xja+h2MlxDO/ulZa8F3Shpc9QUGk0e44uhn/zmFUFPifEKE2OpugnUon8cmKpx88u74
	11/uQ2kCj4CHyNLYboA77Kx4q12cnCegECuAnT6kM6blD56SPmvVV1SjhOb4fk113B1ORHQrn3ICf
	VbjdUbUKsNbDbjwbQj54BhCi9gpvV2hkrNoVXgZumb93lwcWgks+qNV6/f9YFO1UQNgBkMIbWBczs
	MLKPeaiA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUoN-00000002blP-1Dx0
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 01:02:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dcd6a3da83so1986965ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 17:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709168527; x=1709773327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ2VUtbLaQ9lOdd37SBu/yCmKnVIsQUEbE5aRuu2Z70=;
        b=eYUwqe9gc38TlNy6jB7mRh6heGiJXFRxJcLofCcPbmhOyaan8XyJXRx/aS1X7xEgT+
         ysZgazzWN9EAMo6le2727Guj8ayPjESjxfDw7s8rSKzyXMgA5J/SkqwVxqkom6C6FswW
         gTm4TBKfCCrjGufKoDSioG/qtY/h3uS9kAwpypaqGvO4cGX569mo6Ci09kmjlSxigLSZ
         GAj5ap+OR6LKXWB5xcTjqTErscEVDLWgkM3SMGMRgQjONY+MrAWv0p40hhYNa+GS7WUV
         mtxItdNELm1pe+wH4kIQ/A/4BE253H27EFkeZC+Adr5HTxizpY5pYw3TDWbmTAnLygOp
         NccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168527; x=1709773327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJ2VUtbLaQ9lOdd37SBu/yCmKnVIsQUEbE5aRuu2Z70=;
        b=dLATim6E5uBxi+mtmLREqvZRQwj/KhmgKcjDs2p7fLk13f+G+mXqtvEi9K8bC0pNVe
         yoSbTENEacQAGMVb8w1oiQ0lrOiLP27q//trAJq2puyoJ34Y3lFAOnjIEiSoOBeORIAP
         mqeAIcRoUDPXFJYh+jtaMLZWHvRcGDQHJdFl8QUbVKOIvJD+CZLqXAe9/8V4pZy1wj6e
         InBeGagkaMbJ4Trt7pzKXQ3VoSu1YWyJcZvpkeCVtX038B63QnyFG3VU+kYUEkqGGuro
         /TcIDS66cr6Zp9LOcf6ACG65BV7Ob9cMUOGuw78th2+CecA+hZXru8l37U/YYCqyCfqd
         Cuog==
X-Forwarded-Encrypted: i=1; AJvYcCWBDSdICkDCmT/FE88q18o92ZhiZX0vTsXIaWXqkMwPcIRe/4W6zNOgAtg5w9fBKnDrzhqpxomX9eyFuKfyIC8S65TUOOhQH9cDsqhoBes2
X-Gm-Message-State: AOJu0YzIYo1896REaoR/TLDnjqFo5RaxoYsfZ8PXZsMK4+mAL9mOFjIO
	Y3IVPTd2TmgGH27o9I+fe/7Aw9GV0Z0DW1QZ47VrbVxe3vH4CSW2H2DZBN9L0fo=
X-Google-Smtp-Source: AGHT+IGeJ2TX2e1/AVgQrlWwwewtQU0Iq+EdlhkTaVKmJ8/GQ0YRQzdBq1EA4Qgv9EWmM7B9wA2nQg==
X-Received: by 2002:a17:902:d386:b0:1dc:5d2e:c18c with SMTP id e6-20020a170902d38600b001dc5d2ec18cmr595324pld.67.1709168527350;
        Wed, 28 Feb 2024 17:02:07 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm78043plx.144.2024.02.28.17.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 17:02:07 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/15] KVM: riscv: selftests: Add a test for counter overflow
Date: Wed, 28 Feb 2024 17:01:30 -0800
Message-Id: <20240229010130.1380926-16-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229010130.1380926-1-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_010214_374029_A4BBF9A6 
X-CRM114-Status: GOOD (  20.56  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a test for verifying overflow interrupt. Currently, it relies on
overflow support on cycle/instret events. This test works for cycle/
instret events which support sampling via hpmcounters on the platform.
There are no ISA extensions to detect if a platform supports that. Thus,
this test will fail on platform with virtualization but doesn't
support overflow on these two events.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu.c | 126 +++++++++++++++++++-
 1 file changed, 125 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu.c b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
index 8ea2a6db6610..c0264c636054 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2024, Rivos Inc.
  */
 
+#include "asm/csr.h"
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -16,6 +17,7 @@
 #include "kvm_util.h"
 #include "test_util.h"
 #include "processor.h"
+#include "arch_timer.h"
 
 /* Maximum counters (firmware + hardware)*/
 #define RISCV_MAX_PMU_COUNTERS 64
@@ -26,6 +28,11 @@ union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
 static void *snapshot_gva;
 static vm_paddr_t snapshot_gpa;
 
+static int pmu_irq = IRQ_PMU_OVF;
+
+static int vcpu_shared_irq_count;
+static int counter_in_use;
+
 /* Cache the available counters in a bitmask */
 static unsigned long counter_mask_available;
 
@@ -69,7 +76,9 @@ unsigned long pmu_csr_read_num(int csr_num)
 #undef switchcase_csr_read
 }
 
-static inline void dummy_func_loop(int iter)
+static void stop_counter(unsigned long counter, unsigned long stop_flags);
+
+static inline void dummy_func_loop(uint64_t iter)
 {
 	int i = 0;
 
@@ -88,6 +97,26 @@ static void guest_illegal_exception_handler(struct ex_regs *regs)
 	regs->epc += 4;
 }
 
+static void guest_irq_handler(struct ex_regs *regs)
+{
+	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
+	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
+	unsigned long overflown_mask;
+
+	/* Stop all counters first to avoid further interrupts */
+	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0, 1UL << counter_in_use,
+		  SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT, 0, 0, 0);
+
+	csr_clear(CSR_SIP, BIT(pmu_irq));
+
+	overflown_mask = READ_ONCE(snapshot_data->ctr_overflow_mask);
+	GUEST_ASSERT(overflown_mask & (1UL << counter_in_use));
+
+	/* Validate that we are in the correct irq handler */
+	GUEST_ASSERT_EQ(irq_num, pmu_irq);
+	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
+}
+
 static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
 				       unsigned long cflags,
 				       unsigned long event)
@@ -263,6 +292,32 @@ static void test_pmu_event_snapshot(unsigned long event)
 	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
 }
 
+static void test_pmu_event_overflow(unsigned long event)
+{
+	unsigned long counter;
+	unsigned long counter_value_post;
+	unsigned long counter_init_value = ULONG_MAX - 10000;
+	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
+
+	counter = get_counter_index(0, counter_mask_available, 0, event);
+	counter_in_use = counter;
+
+	/* The counter value is updated w.r.t relative index of cbase passed to start/stop */
+	WRITE_ONCE(snapshot_data->ctr_values[0], counter_init_value);
+	start_counter(counter, SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT, 0);
+	dummy_func_loop(10000);
+	udelay(msecs_to_usecs(2000));
+	/* irq handler should have stopped the counter */
+
+	counter_value_post = READ_ONCE(snapshot_data->ctr_values[counter_in_use]);
+	/* The counter value after stopping should be less the init value due to overflow */
+	__GUEST_ASSERT(counter_value_post < counter_init_value,
+		       "counter_value_post %lx counter_init_value %lx for counter\n",
+		       counter_value_post, counter_init_value);
+
+	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
+}
+
 static void test_invalid_event(void)
 {
 	struct sbiret ret;
@@ -361,6 +416,43 @@ static void test_pmu_events_snaphost(int cpu)
 	GUEST_DONE();
 }
 
+static void test_pmu_events_overflow(int cpu)
+{
+	long out_val = 0;
+	bool probe;
+	int num_counters = 0;
+	unsigned long sbi_impl_version;
+
+	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
+	GUEST_ASSERT(probe && out_val == 1);
+
+	sbi_impl_version = get_host_sbi_impl_version();
+	if (sbi_impl_version >= sbi_mk_version(2, 0))
+		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");
+
+	snapshot_set_shmem(snapshot_gpa, 0);
+	csr_set(CSR_IE, BIT(pmu_irq));
+	local_irq_enable();
+
+	/* Get the counter details */
+	num_counters = get_num_counters();
+	update_counter_info(num_counters);
+
+	/*
+	 * Qemu supports overflow for cycle/instruction.
+	 * This test may fail on any platform that do not support overflow for these two events.
+	 */
+	test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
+	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 1);
+
+	/* Renable the interrupt again for another event */
+	csr_set(CSR_IE, BIT(pmu_irq));
+	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
+	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
+
+	GUEST_DONE();
+}
+
 static void run_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct ucall uc;
@@ -449,6 +541,35 @@ static void test_vm_events_snapshot_test(void *guest_code)
 	test_vm_destroy(vm);
 }
 
+static void test_vm_events_overflow(void *guest_code)
+{
+	struct kvm_vm *vm = NULL;
+	struct kvm_vcpu *vcpu = NULL;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	__TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(KVM_RISCV_SBI_EXT_PMU)),
+				   "SBI PMU not available, skipping test");
+
+	__TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_SSCOFPMF)),
+				   "Sscofpmf is not available, skipping overflow test");
+
+
+	test_vm_setup_snapshot_mem(vm, vcpu);
+	vm_init_vector_tables(vm);
+	vm_install_interrupt_handler(vm, guest_irq_handler);
+
+	vcpu_init_vector_tables(vcpu);
+	/* Initialize guest timer frequency. */
+	vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency), &timer_freq);
+	sync_global_to_guest(vm, timer_freq);
+
+	vcpu_args_set(vcpu, 1, 0);
+
+	run_vcpu(vcpu);
+
+	test_vm_destroy(vm);
+}
+
 int main(void)
 {
 	test_vm_basic_test(test_pmu_basic_sanity);
@@ -460,5 +581,8 @@ int main(void)
 	test_vm_events_snapshot_test(test_pmu_events_snaphost);
 	pr_info("SBI PMU event verification with snapshot test : PASS\n");
 
+	test_vm_events_overflow(test_pmu_events_overflow);
+	pr_info("SBI PMU event verification with overflow test : PASS\n");
+
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
