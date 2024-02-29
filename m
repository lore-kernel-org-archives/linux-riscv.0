Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93319C5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 01:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHe3TmKgMeUs0mmHwDzqJYX0PTCemhEnkVZzJK4oVy0=; b=qOZ1KnLtQa/yTt
	URHCyLc2y+xcTGPOcW1YItMXcn27wFhiFRyr/IKBMCnIDNSwYbARiiFqkB1QgkoZlFqmM5HCortHe
	HyyImrnnv5G0YMujiWJI0/l0jLaSzn29xKFrXcAWrlJhQZeFCpoBYBYt/xgvQuq+3btexayF3b6eW
	AMwQqngJxJ5gIBO6blvohemiF5laElWk47k6fyWFrbAq96bgL6OnLCOBjrolw037Cqjnu/wBiu7Tv
	1pXtZDeofcmpA9QEgzfjLyf1sItlPDdpZbwvjkoivD5x+UkPjG/dQQhi4aaHCIZiiezcexiKZ8Bb9
	NC174ngmNfPNY20scddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUpP-0000000BX6W-0row;
	Thu, 29 Feb 2024 01:03:15 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUoI-0000000BWHP-2DPt
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 01:02:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d944e8f367so3146685ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 17:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709168526; x=1709773326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVfqPs3ghKLhe8cbt8PYIn0Z6sgqULMQlrH1YTKTR2o=;
        b=njaQ5RI1sMuXSirRAMeyEs7uURoOPRZQ80LnYc/lxh+y1I/cSd3lyfCKD+PkWrxLAP
         wJHrnRfQllNCQrY6mlE9LNNtl1BNk86k7Mv11mkwr94d92u7g8OF4oFQP0Lll/GdOA7Q
         V9Wwi8BNizdsJfOR6Qhm3Fk0/d0ULSx3ShGgwVQaY9zSR7S5YkaOu1i5Mukn+1Ib+t6W
         6ORghodA9ug6+/lj+TqRG/NUDUceW1O6oYZ2kQagK0FXKd3nokpUGoITslPg2Tpav61d
         J59Hpx1bBz0kmgQta3HxLxpSlVqeA9PB7mgoWjL05ki6RZ0IsHUr/g7teeWoufz4RnDr
         fIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168526; x=1709773326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVfqPs3ghKLhe8cbt8PYIn0Z6sgqULMQlrH1YTKTR2o=;
        b=r9D4c5w4TwFuyDixcjFFG+tFxbsHVC9fq5dT7lnuF6rP0WPBkQUb6ozT3YaeSuBYj/
         Fy/QZd3fn8CK9WYJJT9hppjknSoO/t+Ki764L94zQsBtDolPUbL3N0mRVV+0Ll9jh7vu
         S0NZeFibtRD9l7VtresyqO0BnWHg7obWXWzyv8u2fuBYf57Iq47eQPtsi6ow1zJg56gE
         X5wd3thbNxlq8ItwyTtvlc992/2lvDqM6cbCSqNgPxbmJP6ApLAFZLk+DEYLEw9w8X4x
         r1gSKGKG66QQzcLcZ94vBlZxdluAPRT4Mjic04XwnNZgVsdfMN79EKFXnWSZua1xBvch
         wVhA==
X-Forwarded-Encrypted: i=1; AJvYcCVAz6Rctg2PCkHG8UXOsC2u8IYM9XIMYzzMTQVPuy9Bx5xGKCttvfLrvvZ0yZsHC6Jm5765b5jPIJgJZfmCTP2KIPNcdfMOXXIlHDO8bJAI
X-Gm-Message-State: AOJu0Yz61vTdf1pZ8f5EQw6aUa0LtDbxedQeFHJzXpW/1gNzgKwg3rVb
	LG2S/hDW2qZHAcFWb0gkejVM8cnRMK4TtuqERmLxCOE5woBZA0APS4YwmfLIq08=
X-Google-Smtp-Source: AGHT+IGV5cmLpBFINfDf9KTe1scgOUYkC99RehMcl2e49+L/s7ApKgt1ITuRxKPq985Tr32R5Y4kTg==
X-Received: by 2002:a17:902:a384:b0:1dc:ad9d:9e7b with SMTP id x4-20020a170902a38400b001dcad9d9e7bmr675766pla.59.1709168525635;
        Wed, 28 Feb 2024 17:02:05 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm78043plx.144.2024.02.28.17.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 17:02:05 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/15] KVM: riscv: selftests: Add a test for PMU snapshot functionality
Date: Wed, 28 Feb 2024 17:01:29 -0800
Message-Id: <20240229010130.1380926-15-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229010130.1380926-1-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_170206_916098_12DE7FE3 
X-CRM114-Status: GOOD (  20.27  )
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

Verify PMU snapshot functionality by setting up the shared memory
correctly and reading the counter values from the shared memory
instead of the CSR.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../selftests/kvm/include/riscv/processor.h   |  25 ++++
 .../selftests/kvm/lib/riscv/processor.c       |  12 ++
 tools/testing/selftests/kvm/riscv/sbi_pmu.c   | 124 ++++++++++++++++++
 3 files changed, 161 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index a49a39c8e8d4..e114d039e87b 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -173,6 +173,7 @@ enum sbi_ext_id {
 };
 
 enum sbi_ext_base_fid {
+	SBI_EXT_BASE_GET_IMP_VERSION = 2,
 	SBI_EXT_BASE_PROBE_EXT = 3,
 };
 
@@ -201,6 +202,12 @@ union sbi_pmu_ctr_info {
 	};
 };
 
+struct riscv_pmu_snapshot_data {
+	u64 ctr_overflow_mask;
+	u64 ctr_values[64];
+	u64 reserved[447];
+};
+
 struct sbiret {
 	long error;
 	long value;
@@ -247,6 +254,14 @@ enum sbi_pmu_ctr_type {
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
 #define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
 
+#define SBI_STA_SHMEM_DISABLE		-1
+
+/* SBI spec version fields */
+#define SBI_SPEC_VERSION_DEFAULT	0x1
+#define SBI_SPEC_VERSION_MAJOR_SHIFT	24
+#define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
+#define SBI_SPEC_VERSION_MINOR_MASK	0xffffff
+
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
 			unsigned long arg3, unsigned long arg4,
@@ -254,6 +269,16 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 bool guest_sbi_probe_extension(int extid, long *out_val);
 
+/* Make SBI version */
+static inline unsigned long sbi_mk_version(unsigned long major,
+					    unsigned long minor)
+{
+	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
+		SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;
+}
+
+unsigned long get_host_sbi_impl_version(void);
+
 static inline void local_irq_enable(void)
 {
 	csr_set(CSR_SSTATUS, SR_SIE);
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ec66d331a127..b0162d923e38 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -499,3 +499,15 @@ bool guest_sbi_probe_extension(int extid, long *out_val)
 
 	return true;
 }
+
+unsigned long get_host_sbi_impl_version(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_VERSION, 0,
+		       0, 0, 0, 0, 0);
+
+	GUEST_ASSERT(!ret.error);
+
+	return ret.value;
+}
diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu.c b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
index fc1fc5eea99e..8ea2a6db6610 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
@@ -21,6 +21,11 @@
 #define RISCV_MAX_PMU_COUNTERS 64
 union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
 
+/* Snapshot shared memory data */
+#define PMU_SNAPSHOT_GPA_BASE		(1 << 30)
+static void *snapshot_gva;
+static vm_paddr_t snapshot_gpa;
+
 /* Cache the available counters in a bitmask */
 static unsigned long counter_mask_available;
 
@@ -173,6 +178,20 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
 			       counter, ret.error);
 }
 
+static void snapshot_set_shmem(vm_paddr_t gpa, unsigned long flags)
+{
+	unsigned long lo = (unsigned long)gpa;
+#if __riscv_xlen == 32
+	unsigned long hi = (unsigned long)(gpa >> 32);
+#else
+	unsigned long hi = gpa == -1 ? -1 : 0;
+#endif
+	struct sbiret ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
+				      lo, hi, flags, 0, 0, 0);
+
+	GUEST_ASSERT(ret.value == 0 && ret.error == 0);
+}
+
 static void test_pmu_event(unsigned long event)
 {
 	unsigned long counter;
@@ -207,6 +226,43 @@ static void test_pmu_event(unsigned long event)
 	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
 }
 
+static void test_pmu_event_snapshot(unsigned long event)
+{
+	unsigned long counter;
+	unsigned long counter_value_pre, counter_value_post;
+	unsigned long counter_init_value = 100;
+	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
+
+	counter = get_counter_index(0, counter_mask_available, 0, event);
+	counter_value_pre = read_counter(counter, ctrinfo_arr[counter]);
+
+	/* Do not set the initial value */
+	start_counter(counter, 0, 0);
+	dummy_func_loop(10000);
+
+	stop_counter(counter, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
+
+	/* The counter value is updated w.r.t relative index of cbase */
+	counter_value_post = READ_ONCE(snapshot_data->ctr_values[0]);
+	__GUEST_ASSERT(counter_value_post > counter_value_pre,
+		       "counter_value_post %lx counter_value_pre %lx\n",
+		       counter_value_post, counter_value_pre);
+
+	/* Now set the initial value and compare */
+	WRITE_ONCE(snapshot_data->ctr_values[0], counter_init_value);
+	start_counter(counter, SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT, 0);
+	dummy_func_loop(10000);
+
+	stop_counter(counter, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
+
+	counter_value_post = READ_ONCE(snapshot_data->ctr_values[0]);
+	__GUEST_ASSERT(counter_value_post > counter_init_value,
+		       "counter_value_post %lx counter_init_value %lx for counter\n",
+		       counter_value_post, counter_init_value);
+
+	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
+}
+
 static void test_invalid_event(void)
 {
 	struct sbiret ret;
@@ -270,6 +326,41 @@ static void test_pmu_basic_sanity(int cpu)
 	GUEST_DONE();
 }
 
+static void test_pmu_events_snaphost(int cpu)
+{
+	long out_val = 0;
+	bool probe;
+	int num_counters = 0;
+	unsigned long sbi_impl_version;
+	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
+	int i;
+
+	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
+	GUEST_ASSERT(probe && out_val == 1);
+
+	sbi_impl_version = get_host_sbi_impl_version();
+	if (sbi_impl_version >= sbi_mk_version(2, 0))
+		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");
+
+	snapshot_set_shmem(snapshot_gpa, 0);
+
+	/* Get the counter details */
+	num_counters = get_num_counters();
+	update_counter_info(num_counters);
+
+	/* Validate shared memory access */
+	GUEST_ASSERT_EQ(READ_ONCE(snapshot_data->ctr_overflow_mask), 0);
+	for (i = 0; i < num_counters; i++) {
+		if (counter_mask_available & (1UL << i))
+			GUEST_ASSERT_EQ(READ_ONCE(snapshot_data->ctr_values[i]), 0);
+	}
+	/* Only these two events are guranteed to be present */
+	test_pmu_event_snapshot(SBI_PMU_HW_CPU_CYCLES);
+	test_pmu_event_snapshot(SBI_PMU_HW_INSTRUCTIONS);
+
+	GUEST_DONE();
+}
+
 static void run_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct ucall uc;
@@ -328,6 +419,36 @@ static void test_vm_events_test(void *guest_code)
 	test_vm_destroy(vm);
 }
 
+static void test_vm_setup_snapshot_mem(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
+{
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, PMU_SNAPSHOT_GPA_BASE, 1, 1, 0);
+	/* PMU Snapshot requires single page only */
+	virt_map(vm, PMU_SNAPSHOT_GPA_BASE, PMU_SNAPSHOT_GPA_BASE, 1);
+
+	/* PMU_SNAPSHOT_GPA_BASE is identity mapped */
+	snapshot_gva = (void *)(PMU_SNAPSHOT_GPA_BASE);
+	snapshot_gpa = addr_gva2gpa(vcpu->vm, (vm_vaddr_t)snapshot_gva);
+	sync_global_to_guest(vcpu->vm, snapshot_gva);
+	sync_global_to_guest(vcpu->vm, snapshot_gpa);
+}
+
+static void test_vm_events_snapshot_test(void *guest_code)
+{
+	struct kvm_vm *vm = NULL;
+	struct kvm_vcpu *vcpu = NULL;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	__TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_SBI_EXT_PMU)),
+				   "SBI PMU not available, skipping test");
+
+	test_vm_setup_snapshot_mem(vm, vcpu);
+
+	vcpu_args_set(vcpu, 1, 0);
+	run_vcpu(vcpu);
+
+	test_vm_destroy(vm);
+}
+
 int main(void)
 {
 	test_vm_basic_test(test_pmu_basic_sanity);
@@ -336,5 +457,8 @@ int main(void)
 	test_vm_events_test(test_pmu_events);
 	pr_info("SBI PMU event verification test : PASS\n");
 
+	test_vm_events_snapshot_test(test_pmu_events_snaphost);
+	pr_info("SBI PMU event verification with snapshot test : PASS\n");
+
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
