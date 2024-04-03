Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7337ACD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5E7vy5FCQHFKyu6tJoV6wJC83nXHT4AJvUAk2PKT8I=; b=rsDQ1vVowVUAz/
	JejtFPEo54U6aZluGVPoXpyL2111+wr+6btCzSI+n+J6ambr+pHdUVxSWYoAKam82KUvILWeyZO5J
	VEfcrLHQ9bq5vfVeWob5KvYK2sfzOZ37tUtTpU7f7QL7RBY4na2vcPWYiTQ21zri26bnqrx7RH+VB
	v9TZ31wPmRRrtB1KOZtV3n691Bxz2WQWJNS8+afuxizrZnetdl60bAqgl6ZmBSwKwqCmGpM1fyRwv
	nBEPBM9qu0sjD1h8nFPGTtdMTmXsSrUZX3/OxOx98v5cmXLWb2O6o6nE1tzuR0dB3fsK//xKec7io
	Yx3KnyRqL/+gRxoLLfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvdb-0000000EjUW-3Dt9;
	Wed, 03 Apr 2024 08:06:27 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvd7-0000000Ej0X-1dbU
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:06:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e2987e9d67so1072315ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131557; x=1712736357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCMipi4iMwcecw5jkK7vSbrK4Smr7cw1nRJDkHi5YgY=;
        b=t5P892YEV8FnTiXMI9YwNqZMgp085n93dzQKXP3PDos6Kl/2wEKGIbSW8pxMru296p
         uDPwKALxRahcC2Ik6V98Edz+AaeLVTJg5SpdTFQkYVuVMrYfAFlajvKSegjreCXrYHsU
         Uer2UedIvKXgPqiDJ2dYO2MMd8RkdqRI4WFcLIWxpyxNRTYV3SaeEGB7gg4m6VMFFOCW
         GzIsAxgbW6s2FNZElvLXMw1Ak4dM4cl4HVvHieUElVvuzSr35MxKFRpgwJXiqQmMtJ7b
         Xokxkar6HoVhx8AGJaeBm81F/2LtLjn8JKCDJc7ipPXdBC2sJXBmbw4vgAqDhe6Q54Od
         wIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131557; x=1712736357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCMipi4iMwcecw5jkK7vSbrK4Smr7cw1nRJDkHi5YgY=;
        b=Twgh2og+fJScOKP8AwMr16gg/Nsg5vBbqqjeLKEolUBz9QC/AAutMHd2u6KI3wovSf
         SPFh2+5sUMqMNj4HT1Wdo3RwhAqwgmWSdzNm158g3Z3K8F34nOQnoYb3YwkEieg7lEoD
         pFgsOsSzYPDhF6fDxhI8fVUEF/2sX0ucUukula+U8aUNLk2w+C9Ahhq1LVn9n07soUDL
         K+rHJrGOBjTynA/n3a1EpQ2nE1K82FihqjEdQ9szQtHUaAE3V+cwaMPUm3tRjlzo3kH4
         wQYa6VAaodPwazzFDdzOstSHo1bu8e37uiruKbTV2mPa8+srxV9ZRCwD1UadhOLBmvyH
         mmog==
X-Forwarded-Encrypted: i=1; AJvYcCUxX/RD1PR8TX5srfImuMLxvxhlZLu0QzmfhwI1MVumZIvMN9POCupBNUQxU8bo0BOrSE4qEE9iezItsNj6uamXAU8J/zRj/xpYNN5vU3VR
X-Gm-Message-State: AOJu0YwvcHLTkL2xy87zqPKbEe5uLoEG+oknVWH7x2vf01IXWPEcQ42T
	2J3RMiFWKUKBwXEyfKPbmSekLsP1AMBj+hR15l++C9xQXTcEa/WIgI6/yb4VswM=
X-Google-Smtp-Source: AGHT+IHpyx5a6XqGmtOIk6bFUng2qDzlcvAJJ7ibWLTxJ0Xo8UDyEPRszXuJnMno9PGr0QMK56dlfw==
X-Received: by 2002:a17:902:d4d1:b0:1e0:ab65:85e5 with SMTP id o17-20020a170902d4d100b001e0ab6585e5mr2774053plg.1.1712131556762;
        Wed, 03 Apr 2024 01:05:56 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:55 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
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
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 20/22] KVM: riscv: selftests: Add SBI PMU selftest
Date: Wed,  3 Apr 2024 01:04:49 -0700
Message-Id: <20240403080452.1007601-21-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_010557_683743_5FCAEA17 
X-CRM114-Status: GOOD (  21.99  )
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

This test implements basic sanity test and cycle/instret event
counting tests.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/riscv/sbi_pmu_test.c        | 340 ++++++++++++++++++
 2 files changed, 341 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 741c7dc16afc..1cfcd2797ee4 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -189,6 +189,7 @@ TEST_GEN_PROGS_s390x += rseq_test
 TEST_GEN_PROGS_s390x += set_memory_region_test
 TEST_GEN_PROGS_s390x += kvm_binary_stats_test
 
+TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
 TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += demand_paging_test
 TEST_GEN_PROGS_riscv += dirty_log_test
diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
new file mode 100644
index 000000000000..8e7c7a3172d8
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * sbi_pmu_test.c - Tests the riscv64 SBI PMU functionality.
+ *
+ * Copyright (c) 2024, Rivos Inc.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include "kvm_util.h"
+#include "test_util.h"
+#include "processor.h"
+#include "sbi.h"
+
+/* Maximum counters(firmware + hardware) */
+#define RISCV_MAX_PMU_COUNTERS 64
+union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
+
+/* Cache the available counters in a bitmask */
+static unsigned long counter_mask_available;
+
+unsigned long pmu_csr_read_num(int csr_num)
+{
+#define switchcase_csr_read(__csr_num, __val)		{\
+	case __csr_num:					\
+		__val = csr_read(__csr_num);		\
+		break; }
+#define switchcase_csr_read_2(__csr_num, __val)		{\
+	switchcase_csr_read(__csr_num + 0, __val)	 \
+	switchcase_csr_read(__csr_num + 1, __val)}
+#define switchcase_csr_read_4(__csr_num, __val)		{\
+	switchcase_csr_read_2(__csr_num + 0, __val)	 \
+	switchcase_csr_read_2(__csr_num + 2, __val)}
+#define switchcase_csr_read_8(__csr_num, __val)		{\
+	switchcase_csr_read_4(__csr_num + 0, __val)	 \
+	switchcase_csr_read_4(__csr_num + 4, __val)}
+#define switchcase_csr_read_16(__csr_num, __val)	{\
+	switchcase_csr_read_8(__csr_num + 0, __val)	 \
+	switchcase_csr_read_8(__csr_num + 8, __val)}
+#define switchcase_csr_read_32(__csr_num, __val)	{\
+	switchcase_csr_read_16(__csr_num + 0, __val)	 \
+	switchcase_csr_read_16(__csr_num + 16, __val)}
+
+	unsigned long ret = 0;
+
+	switch (csr_num) {
+	switchcase_csr_read_32(CSR_CYCLE, ret)
+	switchcase_csr_read_32(CSR_CYCLEH, ret)
+	default :
+		break;
+	}
+
+	return ret;
+#undef switchcase_csr_read_32
+#undef switchcase_csr_read_16
+#undef switchcase_csr_read_8
+#undef switchcase_csr_read_4
+#undef switchcase_csr_read_2
+#undef switchcase_csr_read
+}
+
+static inline void dummy_func_loop(uint64_t iter)
+{
+	int i = 0;
+
+	while (i < iter) {
+		asm volatile("nop");
+		i++;
+	}
+}
+
+static void start_counter(unsigned long counter, unsigned long start_flags,
+			  unsigned long ival)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, counter, 1, start_flags,
+			ival, 0, 0);
+	__GUEST_ASSERT(ret.error == 0, "Unable to start counter %ld\n", counter);
+}
+
+/* This should be invoked only for reset counter use case */
+static void stop_reset_counter(unsigned long counter, unsigned long stop_flags)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, counter, 1,
+					stop_flags | SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+	__GUEST_ASSERT(ret.error == SBI_ERR_ALREADY_STOPPED,
+			       "Unable to stop counter %ld\n", counter);
+}
+
+static void stop_counter(unsigned long counter, unsigned long stop_flags)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, counter, 1, stop_flags,
+			0, 0, 0);
+	__GUEST_ASSERT(ret.error == 0, "Unable to stop counter %ld error %ld\n",
+			       counter, ret.error);
+}
+
+static void guest_illegal_exception_handler(struct ex_regs *regs)
+{
+	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
+		       "Unexpected exception handler %lx\n", regs->cause);
+
+	/* skip the trapping instruction */
+	regs->epc += 4;
+}
+
+static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
+				       unsigned long cflags,
+				       unsigned long event)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
+			cflags, event, 0, 0);
+	__GUEST_ASSERT(ret.error == 0, "config matching failed %ld\n", ret.error);
+	GUEST_ASSERT(ret.value < RISCV_MAX_PMU_COUNTERS);
+	GUEST_ASSERT(BIT(ret.value) & counter_mask_available);
+
+	return ret.value;
+}
+
+static unsigned long get_num_counters(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_NUM_COUNTERS, 0, 0, 0, 0, 0, 0);
+
+	__GUEST_ASSERT(ret.error == 0, "Unable to retrieve number of counters from SBI PMU");
+	__GUEST_ASSERT(ret.value < RISCV_MAX_PMU_COUNTERS,
+		       "Invalid number of counters %ld\n", ret.value);
+
+	return ret.value;
+}
+
+static void update_counter_info(int num_counters)
+{
+	int i = 0;
+	struct sbiret ret;
+
+	for (i = 0; i < num_counters; i++) {
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
+
+		/* There can be gaps in logical counter indicies*/
+		if (ret.error)
+			continue;
+		GUEST_ASSERT_NE(ret.value, 0);
+
+		ctrinfo_arr[i].value = ret.value;
+		counter_mask_available |= BIT(i);
+	}
+
+	GUEST_ASSERT(counter_mask_available > 0);
+}
+
+static unsigned long read_counter(int idx, union sbi_pmu_ctr_info ctrinfo)
+{
+	unsigned long counter_val = 0;
+	struct sbiret ret;
+
+	__GUEST_ASSERT(ctrinfo.type < 2, "Invalid counter type %d", ctrinfo.type);
+
+	if (ctrinfo.type == SBI_PMU_CTR_TYPE_HW) {
+		counter_val = pmu_csr_read_num(ctrinfo.csr);
+	} else if (ctrinfo.type == SBI_PMU_CTR_TYPE_FW) {
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ, idx, 0, 0, 0, 0, 0);
+		GUEST_ASSERT(ret.error == 0);
+		counter_val = ret.value;
+	}
+
+	return counter_val;
+}
+
+static void test_pmu_event(unsigned long event)
+{
+	unsigned long counter;
+	unsigned long counter_value_pre, counter_value_post;
+	unsigned long counter_init_value = 100;
+
+	counter = get_counter_index(0, counter_mask_available, 0, event);
+	counter_value_pre = read_counter(counter, ctrinfo_arr[counter]);
+
+	/* Do not set the initial value */
+	start_counter(counter, 0, counter_init_value);
+	dummy_func_loop(10000);
+	stop_counter(counter, 0);
+
+	counter_value_post = read_counter(counter, ctrinfo_arr[counter]);
+	__GUEST_ASSERT(counter_value_post > counter_value_pre,
+		       "counter_value_post %lx counter_value_pre %lx\n",
+		       counter_value_post, counter_value_pre);
+
+	/* Now set the initial value and compare */
+	start_counter(counter, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_init_value);
+	dummy_func_loop(10000);
+	stop_counter(counter, 0);
+
+	counter_value_post = read_counter(counter, ctrinfo_arr[counter]);
+	__GUEST_ASSERT(counter_value_post > counter_init_value,
+		       "counter_value_post %lx counter_init_value %lx\n",
+		       counter_value_post, counter_init_value);
+
+	stop_reset_counter(counter, 0);
+}
+
+static void test_invalid_event(void)
+{
+	struct sbiret ret;
+	unsigned long event = 0x1234; /* A random event */
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, 0,
+			counter_mask_available, 0, event, 0, 0);
+	GUEST_ASSERT_EQ(ret.error, SBI_ERR_NOT_SUPPORTED);
+}
+
+static void test_pmu_events(void)
+{
+	int num_counters = 0;
+
+	/* Get the counter details */
+	num_counters = get_num_counters();
+	update_counter_info(num_counters);
+
+	/* Sanity testing for any random invalid event */
+	test_invalid_event();
+
+	/* Only these two events are guaranteed to be present */
+	test_pmu_event(SBI_PMU_HW_CPU_CYCLES);
+	test_pmu_event(SBI_PMU_HW_INSTRUCTIONS);
+
+	GUEST_DONE();
+}
+
+static void test_pmu_basic_sanity(void)
+{
+	long out_val = 0;
+	bool probe;
+	struct sbiret ret;
+	int num_counters = 0, i;
+	union sbi_pmu_ctr_info ctrinfo;
+
+	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
+	GUEST_ASSERT(probe && out_val == 1);
+
+	num_counters = get_num_counters();
+
+	for (i = 0; i < num_counters; i++) {
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i,
+				0, 0, 0, 0, 0);
+
+		/* There can be gaps in logical counter indicies*/
+		if (ret.error)
+			continue;
+		GUEST_ASSERT_NE(ret.value, 0);
+
+		ctrinfo.value = ret.value;
+
+		/**
+		 * Accesibillity check of hardware and read capability of firmware counters.
+		 * The spec doesn't mandate any initial value. No need to check any value.
+		 */
+		read_counter(i, ctrinfo);
+	}
+
+	GUEST_DONE();
+}
+
+static void run_vcpu(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+
+	vcpu_run(vcpu);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	case UCALL_DONE:
+	case UCALL_SYNC:
+		break;
+	default:
+		TEST_FAIL("Unknown ucall %lu", uc.cmd);
+		break;
+	}
+}
+
+void test_vm_destroy(struct kvm_vm *vm)
+{
+	memset(ctrinfo_arr, 0, sizeof(union sbi_pmu_ctr_info) * RISCV_MAX_PMU_COUNTERS);
+	counter_mask_available = 0;
+	kvm_vm_free(vm);
+}
+
+static void test_vm_basic_test(void *guest_code)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
+				   "SBI PMU not available, skipping test");
+	vm_init_vector_tables(vm);
+	/* Illegal instruction handler is required to verify read access without configuration */
+	vm_install_exception_handler(vm, EXC_INST_ILLEGAL, guest_illegal_exception_handler);
+
+	vcpu_init_vector_tables(vcpu);
+	run_vcpu(vcpu);
+
+	test_vm_destroy(vm);
+}
+
+static void test_vm_events_test(void *guest_code)
+{
+	struct kvm_vm *vm = NULL;
+	struct kvm_vcpu *vcpu = NULL;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
+				   "SBI PMU not available, skipping test");
+	run_vcpu(vcpu);
+
+	test_vm_destroy(vm);
+}
+
+int main(void)
+{
+	test_vm_basic_test(test_pmu_basic_sanity);
+	pr_info("SBI PMU basic test : PASS\n");
+
+	test_vm_events_test(test_pmu_events);
+	pr_info("SBI PMU event verification test : PASS\n");
+
+	return 0;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
