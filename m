Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F73C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFNYpawpmnDZePbdlmS9MnWT50olF6OONOqHom38ATQ=; b=tv/8Ulj+Sufdws
	lqTCH05Z5Jkq+wclS/SgeTwhWcHIOCc+onJVJFPLyeuFV04nJsPgzEwqpkc4XOqt7set0VlHx9vo+
	8/KS0OYHQzT71BsV2g/f5sJYJiONPTPtCKd85nZKWDnsrbaPisDOisUyqjzVPiTOnIqpVgaOw37Y+
	nnLWlML/po6CN5MWwgW9eBf66o8LV5AwCFqEJXkaKdQ6LzDkPkN4o44Ke5aUGEubXwF0miYXWEDiz
	pcoFj4zT/tYDWSj8AjaDL9ZQXcV6ncF79QWmL7kP+Tpkg0Mj9i0YBlkyTF9ajQwycz23WlDw2YoLq
	S3R9vk2ExWxIjK8LD88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwoz9-0000000DcjH-3jCK;
	Tue, 16 Apr 2024 20:00:55 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnu-0000000DMaV-3lMz
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:22 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2a4bdef3d8eso3573881a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293114; x=1713897914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdAbjdLX31vZDITT2BD/zRGEaHkPavc56BKt6Swumik=;
        b=yrcMvnN4AgpDIOY+2C7JaNZXx54RQwQ2ffdA2gCRFN7WxPIsSXf8hHH+MDzn8AkLYz
         SJ/Bnl9C+gr7jNtl55AK04UrUjpe7uH9kcmXvZ/vteqkO+rmGERS0UNZhTOF/jOAf98v
         UmLI97iY+LZwSdhyXRuCht+3xTqQzcMcCIE7XM4Qqc7us4yEuEdbr+qiXgqtDS8P8t9U
         uCPGzutJ7VE731uietJDpmvaMnUR4GT76J30Mu0i9nnCyAAfxoSvXdLr9MLvKphYiXoO
         RLE2MurLIulzJsueeSiitlE+EPmp+c55Aw5Jj21DnbWyDlQJzaXzkF/Tk7eLUIcJ1hRr
         l0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293114; x=1713897914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdAbjdLX31vZDITT2BD/zRGEaHkPavc56BKt6Swumik=;
        b=jWtbpykbwI4egfrlQBESp0Vuzn9mORIBfTTvMCEKDSlQ3YkL+kmUV2tNRyF5dhGH4g
         SEWUN//IOz2R/f3fF1K3GI0Hak/Hk1qwRj5y0d/dog0I9P4wBKtNMxlnSYmtfcP5Jk8l
         JCy0NwZQ6hY6s49m/sFtJcwFDnD/vyrY0ZFFR5fT5yOLDxg1GStz+Kr5vlJGm0lxQFmV
         LGWlvATWmOsHciE4RQ8Va3IxxDNC5R3MhuVclHSJjEKycdfFQsU0rtwLvzKtmotL66vj
         2o8WV3xfLAwHdU8S+dlG31pDff77BupS2/Ri3102ph5ulPOWlGFU2ottYAFCR1PQPnEc
         iC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6Kn1nna4eDbsb4djcQQdPQzpLJDQ8VZiZFt3XLJ43px3Z/2lelVmW6/QKyDZ25f2yQ5575GL7uLH+NWACME2C408pMiEj3KMJEyJ5DjD
X-Gm-Message-State: AOJu0Yy4iQlU2dp15NCAzo1t4lq0FUmAGB8ullo8fKIxsopf+qySsFeC
	Gyxb4w7ySUHkRho+GiqKPTXSn17S/BQahbU3wgkXY4eBmkttMaj3jy572lwAwgg=
X-Google-Smtp-Source: AGHT+IFDXNl2GlygE+KNUSGRBrtMVBiroiGsmGtTfesRXWf6Iha4NuVNKtPuqBWagZ1SKRgILxUJXw==
X-Received: by 2002:a17:90a:db97:b0:2a5:fb3a:32e8 with SMTP id h23-20020a17090adb9700b002a5fb3a32e8mr11035882pjv.38.1713293114015;
        Tue, 16 Apr 2024 11:45:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:45:13 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v7 23/24] KVM: riscv: selftests: Add a test for counter overflow
Date: Tue, 16 Apr 2024 11:44:20 -0700
Message-Id: <20240416184421.3693802-24-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_114515_305898_8DA06CD9 
X-CRM114-Status: GOOD (  17.72  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../selftests/kvm/riscv/sbi_pmu_test.c        | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 9002ff451abf..0fd9b76ae838 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -14,6 +14,7 @@
 #include "test_util.h"
 #include "processor.h"
 #include "sbi.h"
+#include "arch_timer.h"
 
 /* Maximum counters(firmware + hardware) */
 #define RISCV_MAX_PMU_COUNTERS 64
@@ -24,6 +25,9 @@ union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
 static void *snapshot_gva;
 static vm_paddr_t snapshot_gpa;
 
+static int vcpu_shared_irq_count;
+static int counter_in_use;
+
 /* Cache the available counters in a bitmask */
 static unsigned long counter_mask_available;
 
@@ -120,6 +124,31 @@ static void guest_illegal_exception_handler(struct ex_regs *regs)
 	regs->epc += 4;
 }
 
+static void guest_irq_handler(struct ex_regs *regs)
+{
+	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
+	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
+	unsigned long overflown_mask;
+	unsigned long counter_val = 0;
+
+	/* Validate that we are in the correct irq handler */
+	GUEST_ASSERT_EQ(irq_num, IRQ_PMU_OVF);
+
+	/* Stop all counters first to avoid further interrupts */
+	stop_counter(counter_in_use, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
+
+	csr_clear(CSR_SIP, BIT(IRQ_PMU_OVF));
+
+	overflown_mask = READ_ONCE(snapshot_data->ctr_overflow_mask);
+	GUEST_ASSERT(overflown_mask & 0x01);
+
+	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
+
+	counter_val = READ_ONCE(snapshot_data->ctr_values[0]);
+	/* Now start the counter to mimick the real driver behavior */
+	start_counter(counter_in_use, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_val);
+}
+
 static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
 				       unsigned long cflags,
 				       unsigned long event)
@@ -318,6 +347,33 @@ static void test_pmu_event_snapshot(unsigned long event)
 	stop_reset_counter(counter, 0);
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
+	start_counter(counter, SBI_PMU_START_FLAG_INIT_SNAPSHOT, 0);
+	dummy_func_loop(10000);
+	udelay(msecs_to_usecs(2000));
+	/* irq handler should have stopped the counter */
+	stop_counter(counter, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
+
+	counter_value_post = READ_ONCE(snapshot_data->ctr_values[0]);
+	/* The counter value after stopping should be less the init value due to overflow */
+	__GUEST_ASSERT(counter_value_post < counter_init_value,
+		       "counter_value_post %lx counter_init_value %lx for counter\n",
+		       counter_value_post, counter_init_value);
+
+	stop_reset_counter(counter, 0);
+}
+
 static void test_invalid_event(void)
 {
 	struct sbiret ret;
@@ -413,6 +469,34 @@ static void test_pmu_events_snaphost(void)
 	GUEST_DONE();
 }
 
+static void test_pmu_events_overflow(void)
+{
+	int num_counters = 0;
+
+	/* Verify presence of SBI PMU and minimum requrired SBI version */
+	verify_sbi_requirement_assert();
+
+	snapshot_set_shmem(snapshot_gpa, 0);
+	csr_set(CSR_IE, BIT(IRQ_PMU_OVF));
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
+	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
+	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
+
+	GUEST_DONE();
+}
+
 static void run_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct ucall uc;
@@ -498,6 +582,32 @@ static void test_vm_events_snapshot_test(void *guest_code)
 	test_vm_destroy(vm);
 }
 
+static void test_vm_events_overflow(void *guest_code)
+{
+	struct kvm_vm *vm = NULL;
+	struct kvm_vcpu *vcpu;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
+				   "SBI PMU not available, skipping test");
+
+	__TEST_REQUIRE(__vcpu_has_isa_ext(vcpu, KVM_RISCV_ISA_EXT_SSCOFPMF),
+				   "Sscofpmf is not available, skipping overflow test");
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
+	run_vcpu(vcpu);
+
+	test_vm_destroy(vm);
+}
+
 int main(void)
 {
 	test_vm_basic_test(test_pmu_basic_sanity);
@@ -509,5 +619,8 @@ int main(void)
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
