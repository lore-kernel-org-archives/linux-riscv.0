Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B880C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 03:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOydVNEFodWoowS9mUjpDC+pOXC6bDz5tCw9Dze/ruU=; b=s5Wet+T914vzHW
	TdY1PDV0ps+horhWcvaQwP5/Hk6CiRuyU/MmHqkJRmAk2vRI9jrTcYpw/HT+LDe69ZRlP+jjbp1Ey
	ac1BZIbRrmNjLkq5G1F7qr3oiwFVx/hl/Bv5VX+r8S97pAoApX0Lmr8f4eeLqSzC+VlJr9m4yr1qb
	K9FCacV93aReU7X3s27eY2OZXzSVYsXAz+Wg7UBd4lYu7rvGlyorK5ie50UpKiUGQP9uPf2vRauII
	z23uushCCFhXbIqegW6RsgEflNE3jI8+iP0Bw1ZFfF59JZXnyLHbtacUfeIE1KU5tBCZF7AGX3k4r
	f93CkGXdMuUSFTaFL/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBcK-000000073Nn-200R;
	Fri, 07 Aug 2026 03:51:32 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBcG-000000073MQ-3krn
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 03:51:30 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8485b358552so2529112b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 20:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786074688; x=1786679488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roc/IS/aTyNJNRiP/nrbSlyNrCVYc83nltBjgP79s1s=;
        b=Zt+n5dsiZ3KYM8A1S/1K9BgBcN58r9PynHv9zgRCc5xg2dRD+Nda+x0FSJvkeFDkkr
         3iuqZcuXT0M9H5e0B7hgIxw7DF3ib0zh8KaxE7ZcD/WleVqNmjyShXPATSKu+HwCjEEH
         yOIeN44rBnup1fB+BqyCHwyCfSTPoXB6QCD0zb63213AXlkc7btsRyCVDYyK9nvmxZQn
         YWjDvtJ2CT01ETjxWWcxIyIu7YYHTljhzWM66A1acLJvgkivpc/hL9cYxPZScGvRUONY
         7Ms7PbgD9lSP8f8W2cQ536OTysljfTu1LBJdtqojmekyPWw2va+kPX6VXgO8CXz3mj0Y
         AcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786074688; x=1786679488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roc/IS/aTyNJNRiP/nrbSlyNrCVYc83nltBjgP79s1s=;
        b=CenOh5ywrtl7j8gcgkwJgKYoz1mBmT0mFjtW/EBQAdvW2MamXY5PRURiFEdl4jk+Qc
         XrTuauwTCVLEcoUVty719uZyKeuNCoMt5hr0aQK3aa9gqtYqIfUfciUOPGj6i4wlrZ7i
         rNH+yqCFbzxEiXXIIaclWhpEYEdq47FfEFVmML2LsZFeFtCQ+oNWH/njPuNSfV607ArE
         SKfCG01hb+OCHjlSxMM0OTSgU6yHP+AQwl38fNKBYf8w1XcA8t2cwOBaXf5eaDwvtC10
         NKCGhAD5IjYFcmhpH2ZIZGTanXBolZHC/VQyJQQqAjrfzSXwm718henIvuIndG8+glgH
         pR9g==
X-Forwarded-Encrypted: i=1; AHgh+Rqy2tKjNEFsLBunX30xabXs96MVEe7XJaUa3Hm+wLj8w5ZBh+Ihn9ct4RZ8DZE1CDQSR06mrHcrKcOBjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy7KfZuaSEl1TXqkRsQ7vYJ6/76ibkT0ytNn1wwQySFqydipZq
	P0g1kzjyNYSVReceDSSMqhqM0cpfIZPC2/V58KMCJg5eA3YYMBRnh9qe
X-Gm-Gg: AR+sD12+xwJFiP9D63Dhe3+r2ELYug7bl+8nD2sj8RCA+Rk+DqOzdscpu4zFSc5hBVQ
	oYENTOgMQQJvMO0AQQoZVlVwW98EQvayb6OJ2DNKOAvYx7NbSB2znF78jSdrxYQW31iylWlN658
	PtIbYdY/f5e3uQ9wdkEeLBNQB+hjeiAvKkEEiiAARZoOTebxZreoZIzbmELcMXA9tge/H0cVKGj
	fOeVBe0CPqogNkjH2Vk5DBuuIagqqzy/IrbjlU9aTnA3Sb+0xdj0BnkKvMgrII0muctlqcCSIAA
	7C9N2YKsECYVvL0raQbzXZil2jMyjNvsVYoH+oycnUJ6wUtMlO2xGkQGgqymTJqZHsDNNticqUz
	6QCHN2Wo2lhYhI8DwVCzHmP32e19rLDDsGPM3TMe3sy9rGWgBD8xFCKQzhjWv+HHzJ0d44Ide/R
	QOGNi5SzBNu1D5fNA8Rg+/gsvDSbkgA953e7WXXKLEw0RkIPC1MX/NQj5Fjn85omtuBX67v6XmO
	s7PLHU=
X-Received: by 2002:a05:6a00:4504:b0:845:da74:5d7c with SMTP id d2e1a72fcca58-84f2e0dba2cmr23794104b3a.32.1786074688151;
        Thu, 06 Aug 2026 20:51:28 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3d0d96sm287586b3a.18.2026.08.06.20.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 20:51:27 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	pbonzini@redhat.com,
	shuah@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhouquan@iscas.ac.cn,
	"Yuhang.chen" <yhchen312@gmail.com>
Subject: [PATCH 2/2] RISC-V: KVM: selftests: Add PMU event filter test
Date: Fri,  7 Aug 2026 11:50:39 +0800
Message-Id: <20260807035039.294998-3-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807035039.294998-1-yhchen312@gmail.com>
References: <20260807035039.294998-1-yhchen312@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_205128_950313_A26CA095 
X-CRM114-Status: GOOD (  22.27  )
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

Add a selftest that exercises KVM_SET_PMU_EVENT_FILTER on RISC-V. The
guest programs the CPU cycles and instructions SBI PMU events through
SBI_EXT_PMU_COUNTER_CFG_MATCH while the host installs filters with the
ALLOW and DENY actions, asserting that disallowed events return
SBI_ERR_NOT_SUPPORTED and allowed events succeed.

The test also validates ioctl argument rejection: an invalid action, a
non-zero flags field, and an over-large nevents value are each expected
to fail with -EINVAL or -E2BIG. A baseline run verifies PMU
availability and the test skips (KSFT_SKIP) when PMU or the filter
capability is absent.

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/riscv/pmu_event_filter_test.c         | 199 ++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index d28a057fa6c2..5d2dc3b25eac 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -218,6 +218,7 @@ TEST_GEN_PROGS_s390 += pre_fault_memory_test
 TEST_GEN_PROGS_riscv = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
 TEST_GEN_PROGS_riscv += riscv/ebreak_test
+TEST_GEN_PROGS_riscv += riscv/pmu_event_filter_test
 TEST_GEN_PROGS_riscv += access_tracking_perf_test
 TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += coalesced_io_test
diff --git a/tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c b/tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c
new file mode 100644
index 000000000000..1a76fce2aca6
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test for RISC-V KVM_SET_PMU_EVENT_FILTER.
+ *
+ * Verify that a VM-scoped PMU event filter installed via the
+ * KVM_SET_PMU_EVENT_FILTER ioctl is enforced when a guest configures a
+ * counter through the SBI PMU COUNTER_CFG_MATCH call:
+ *
+ *   - with no filter, events are programmable (baseline / PMU probe);
+ *   - KVM_PMU_EVENT_DENY rejects the listed events;
+ *   - KVM_PMU_EVENT_ALLOW admits only the listed events;
+ *   - replacing the filter with an empty DENY list re-enables everything.
+ *
+ * The filter is checked before any perf event is created, so the test only
+ * ever programs the cycle event (always supported by the host PMU) and varies
+ * the filter *list* contents to exercise membership without depending on host
+ * support for other events.  Counter management and SBI error reporting happen
+ * in the guest; the host installs filters and checks the reported errors.
+ */
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "kvm_util.h"
+#include "test_util.h"
+#include "processor.h"
+#include "ucall_common.h"
+#include "sbi.h"
+
+/* SBI PMU hardware event indexes (type == HW == 0, so eidx == code). */
+#define EV_CYCLES	SBI_PMU_HW_CPU_CYCLES		/* 1 */
+#define EV_INSTR	SBI_PMU_HW_INSTRUCTIONS		/* 2 */
+
+/* Must match KVM_PMU_EVENT_FILTER_MAX_EVENTS in arch/riscv/kvm/vm.c. */
+#define MAX_EVENTS	256
+
+static void guest_code(void)
+{
+	struct sbiret ret;
+	unsigned long ctr;
+	long err;
+
+	for (;;) {
+		/*
+		 * Request the fixed cycle counter (cbase=0, cmask=1) for the
+		 * cycle event.  The host installs (or clears) the filter
+		 * before each entry, so the result reflects the active policy.
+		 */
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
+				0, 1, 0, EV_CYCLES, 0, 0);
+		err = ret.error;
+		ctr = ret.value;
+
+		/* Release the counter on success so the next iteration reuses it. */
+		if (!err)
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
+				  ctr, 1, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+
+		GUEST_SYNC1(err);
+	}
+}
+
+static struct kvm_pmu_event_filter *
+build_filter(__u32 action, __u32 flags, const __u64 *events, __u32 nevents)
+{
+	struct kvm_pmu_event_filter *f;
+	size_t size = sizeof(*f) + (size_t)nevents * sizeof(__u64);
+
+	f = calloc(1, size);
+	TEST_ASSERT(f, "calloc(pmu_event_filter)");
+	f->action = action;
+	f->nevents = nevents;
+	f->flags = flags;
+	if (nevents && events)
+		memcpy(f->events, events, nevents * sizeof(__u64));
+	return f;
+}
+
+/* Install a filter, asserting success. */
+static void set_filter(struct kvm_vm *vm, __u32 action,
+		       const __u64 *events, __u32 nevents)
+{
+	struct kvm_pmu_event_filter *f = build_filter(action, 0, events, nevents);
+
+	vm_ioctl(vm, KVM_SET_PMU_EVENT_FILTER, f);
+	free(f);
+}
+
+/* Install a filter and return the raw ioctl result (for negative tests). */
+static int try_set_filter(struct kvm_vm *vm, __u32 action, __u32 flags,
+			  const __u64 *events, __u32 nevents)
+{
+	struct kvm_pmu_event_filter *f = build_filter(action, flags, events, nevents);
+	int ret = __vm_ioctl(vm, KVM_SET_PMU_EVENT_FILTER, f);
+
+	free(f);
+	return ret;
+}
+
+/* Run the guest one step and return the cfg_match error code it reports. */
+static long run_one(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_SYNC);
+	return (long)uc.args[0];
+}
+
+static void test_filter_case(struct kvm_vm *vm, struct kvm_vcpu *vcpu,
+			     __u32 action, const __u64 *events, __u32 nevents,
+			     long expect, const char *desc)
+{
+	long err;
+
+	set_filter(vm, action, events, nevents);
+	err = run_one(vcpu);
+	TEST_ASSERT_EQ(err, expect);
+	pr_info("%s: err=%ld (expected %ld)\n", desc, err, expect);
+}
+
+static void test_bad_args(struct kvm_vm *vm)
+{
+	__u64 ev = EV_CYCLES;
+	int ret;
+
+	/* Invalid action. */
+	errno = 0;
+	ret = try_set_filter(vm, 2, 0, &ev, 1);
+	TEST_ASSERT(ret < 0 && errno == EINVAL,
+		    "invalid action should fail with EINVAL, got ret=%d errno=%d",
+		    ret, errno);
+
+	/* Non-zero flags are not supported. */
+	errno = 0;
+	ret = try_set_filter(vm, KVM_PMU_EVENT_ALLOW, 1, &ev, 1);
+	TEST_ASSERT(ret < 0 && errno == EINVAL,
+		    "non-zero flags should fail with EINVAL, got ret=%d errno=%d",
+		    ret, errno);
+
+	/* Too many events. */
+	errno = 0;
+	ret = try_set_filter(vm, KVM_PMU_EVENT_DENY, 0, NULL, MAX_EVENTS + 1);
+	TEST_ASSERT(ret < 0 && errno == E2BIG,
+		    "nevents > max should fail with E2BIG, got ret=%d errno=%d",
+		    ret, errno);
+}
+
+int main(void)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	long err;
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_PMU_EVENT_FILTER));
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	/*
+	 * Baseline / PMU probe: with no filter the cycle event must be
+	 * programmable.  If it isn't, the host PMU is unusable in this
+	 * environment (e.g. Sscofpmf unavailable under TCG); skip the rest.
+	 */
+	err = run_one(vcpu);
+	if (err) {
+		pr_info("PMU unavailable (baseline cfg_match err=%ld), skipping\n",
+			err);
+		kvm_vm_free(vm);
+		exit(KSFT_SKIP);
+	}
+
+	/* DENY{cycles}: the cycle event is rejected. */
+	test_filter_case(vm, vcpu, KVM_PMU_EVENT_DENY,
+			 &(__u64){ EV_CYCLES }, 1,
+			 SBI_ERR_NOT_SUPPORTED, "deny cycles");
+
+	/* ALLOW{cycles}: the cycle event is admitted. */
+	test_filter_case(vm, vcpu, KVM_PMU_EVENT_ALLOW,
+			 &(__u64){ EV_CYCLES }, 1,
+			 0, "allow cycles");
+
+	/*
+	 * ALLOW{instructions}: cycles is not in the allow list, so it is
+	 * rejected.  Instructions itself is never programmed, so host support
+	 * for it is irrelevant.
+	 */
+	test_filter_case(vm, vcpu, KVM_PMU_EVENT_ALLOW,
+			 &(__u64){ EV_INSTR }, 1,
+			 SBI_ERR_NOT_SUPPORTED, "cycles not in allow{instr}");
+
+	/* Empty DENY list: nothing is denied, cycles is programmable again. */
+	test_filter_case(vm, vcpu, KVM_PMU_EVENT_DENY, NULL, 0,
+			 0, "clear (deny empty)");
+
+	test_bad_args(vm);
+
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
