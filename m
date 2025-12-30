Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2B9EE57C6
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tL3UNP/wp/0lcdKki4raZeoaia/FZQTVxtd+BzVUZTo=; b=GsRGx+15ttnJpU
	XEBMTNV7+sbWzjZhwsyVQ0Y72WSRyrl9ZMTkOD3CICxBM0nS6n95XN42KEcnE0isRPyxUA61o1RQJ
	InmgPlY+ltPfHfiQJcZzV3sv8Pq2VhFtwuN8Py77yK7QGC2XwwAlz3RVEtfrngz8NqG8O5zJuqwfC
	P+Mt8QSQml3cB6IM1JPpL+EDezT51jyRuDIlE0CnBJAJd9Y7Vh3ehVe8G56ggZYcISeST+Vd2RX6/
	PuG4rfjSvzAJyYWIoz3EhnsxZBuDTGnsGNxXjr0QZgYe7aDjnSdXtUyXkqapUhT3dUnwXNwPaeMsm
	ohnVVD+9/Le8YnX6bwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vailF-00000005PKW-036v;
	Tue, 30 Dec 2025 23:04:17 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijS-00000005N4J-35cM
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:28 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34ea5074935so9471141a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135745; x=1767740545; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=l02CRqI+Ghgr8JnMhLywloG9mLg+BlVpb36VX9/E5wI=;
        b=nf9yYxABfDQlGS2b6JYuiLqaVrhqPVY4o1X5gd/jtdeNOKqX5Y6Ju6T0KK3cnI9ksS
         HH9A5/1kkWSxqcVYDL+tZrzbiP+t1lH6k8cU3q13NkpTox7QVy/2cP7ZwGryYnItnJAh
         C7bnoWTgEpgG8r2qu/2mb/yBN908XDflEFIt4FUiIbjdPbd04yiEtlPwWzB2N2IBsevP
         s5bzJjfMspimegMmw4c2+sM1KWFCGCVax+gYE8Ub4vHjL1qRCTdUcPK3l3WUpLPNLnU7
         KDCbRaZbgp3l85UDZOF5kzXB/xpBbnIwJSw04WQrcJXCqXp/OhRAL0Rs43mcuun2XXQz
         0hpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135745; x=1767740545;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l02CRqI+Ghgr8JnMhLywloG9mLg+BlVpb36VX9/E5wI=;
        b=ME+DJ/8cOJBUiEI6XxtVeQHXARcBee9GcEQ5IkV/xziFGEAz1NrQ6KzVbTHiuUsFbu
         ClDBBg35yq+4WF3kHndfRr0ewLRg9Cm+s3oM5A4wuFqdBSQc7Uj0rUdwaMA2fGvQscDV
         rLGPkVjSvt3yg99pyMzg+zF1atMNkXhXXzpiV1kWxDPTxmg0Dh7UXEh55WrQ2+tmKcsS
         xny6zV/V9H/ySUICqoSiMs9aJM8w1mn5H0qmsG+K0G52VoLywOahWat0vPRy+4JGgiB0
         mvGshzKOB+hox/CzqmGFJMpndsTh+dEA0GUve7rOJPQjZ68TUhbuiDXjEgue2h4zv2j3
         Zekw==
X-Forwarded-Encrypted: i=1; AJvYcCXXlQkcomyTYfRFqwKSjnQMbd+5FCud8SEEUm67glo4Jm72Frc8RBhHokGwm63uRQFR6wn8c8xKSQmosw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv0i/C4YRBIJVudHE33ICXyewBVa6DnR09JVsibWuW6gVm3Dgp
	veESb9fgXTLkoWsCjoYxwJ1UYSU89Xhwvw+cCwfBPkYgrwywyHnk+2gOInnPGv7rl4QKHE2syau
	zN/3FIA==
X-Google-Smtp-Source: AGHT+IGdzi4L+tULZgNB2XZI1GCuJkpL9VP6/Muf2M4d65NarSlafnhFOOOyBjKAOuvQIqtL04yY0e8Tvtc=
X-Received: from pjbsw11.prod.google.com ([2002:a17:90b:2c8b:b0:34a:bf4e:cb5c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3c90:b0:35f:26b2:2f94
 with SMTP id adf61e73a8af0-376a9acefcdmr33777508637.46.1767135745424; Tue, 30
 Dec 2025 15:02:25 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:47 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-19-seanjc@google.com>
Subject: [PATCH v4 18/21] KVM: selftests: Extend vmx_dirty_log_test to cover SVM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150226_804172_36E08E9E 
X-CRM114-Status: GOOD (  15.21  )
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

From: Yosry Ahmed <yosry.ahmed@linux.dev>

Generalize the code in vmx_dirty_log_test.c by adding SVM-specific L1
code, doing some renaming (e.g. EPT -> TDP), and having setup code for
both SVM and VMX in test_dirty_log().

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  2 +-
 ...rty_log_test.c => nested_dirty_log_test.c} | 73 ++++++++++++++-----
 2 files changed, 54 insertions(+), 21 deletions(-)
 rename tools/testing/selftests/kvm/x86/{vmx_dirty_log_test.c => nested_dirty_log_test.c} (71%)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index ba5c2b643efa..8f14213ddef1 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -89,6 +89,7 @@ TEST_GEN_PROGS_x86 += x86/kvm_buslock_test
 TEST_GEN_PROGS_x86 += x86/monitor_mwait_test
 TEST_GEN_PROGS_x86 += x86/msrs_test
 TEST_GEN_PROGS_x86 += x86/nested_close_kvm_test
+TEST_GEN_PROGS_x86 += x86/nested_dirty_log_test
 TEST_GEN_PROGS_x86 += x86/nested_emulation_test
 TEST_GEN_PROGS_x86 += x86/nested_exceptions_test
 TEST_GEN_PROGS_x86 += x86/nested_invalid_cr3_test
@@ -115,7 +116,6 @@ TEST_GEN_PROGS_x86 += x86/ucna_injection_test
 TEST_GEN_PROGS_x86 += x86/userspace_io_test
 TEST_GEN_PROGS_x86 += x86/userspace_msr_exit_test
 TEST_GEN_PROGS_x86 += x86/vmx_apic_access_test
-TEST_GEN_PROGS_x86 += x86/vmx_dirty_log_test
 TEST_GEN_PROGS_x86 += x86/vmx_exception_with_invalid_guest_state
 TEST_GEN_PROGS_x86 += x86/vmx_msrs_test
 TEST_GEN_PROGS_x86 += x86/vmx_invalid_nested_guest_state
diff --git a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c b/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
similarity index 71%
rename from tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
rename to tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
index 032ab8bf60a4..89d2e86a0db9 100644
--- a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
@@ -12,6 +12,7 @@
 #include "test_util.h"
 #include "kvm_util.h"
 #include "processor.h"
+#include "svm_util.h"
 #include "vmx.h"
 
 /* The memory slot index to track dirty pages */
@@ -25,6 +26,8 @@
 #define NESTED_TEST_MEM1		0xc0001000
 #define NESTED_TEST_MEM2		0xc0002000
 
+#define L2_GUEST_STACK_SIZE 64
+
 static void l2_guest_code(u64 *a, u64 *b)
 {
 	READ_ONCE(*a);
@@ -42,20 +45,19 @@ static void l2_guest_code(u64 *a, u64 *b)
 	vmcall();
 }
 
-static void l2_guest_code_ept_enabled(void)
+static void l2_guest_code_tdp_enabled(void)
 {
 	l2_guest_code((u64 *)NESTED_TEST_MEM1, (u64 *)NESTED_TEST_MEM2);
 }
 
-static void l2_guest_code_ept_disabled(void)
+static void l2_guest_code_tdp_disabled(void)
 {
-	/* Access the same L1 GPAs as l2_guest_code_ept_enabled() */
+	/* Access the same L1 GPAs as l2_guest_code_tdp_enabled() */
 	l2_guest_code((u64 *)GUEST_TEST_MEM, (u64 *)GUEST_TEST_MEM);
 }
 
-void l1_guest_code(struct vmx_pages *vmx)
+void l1_vmx_code(struct vmx_pages *vmx)
 {
-#define L2_GUEST_STACK_SIZE 64
 	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
 	void *l2_rip;
 
@@ -64,22 +66,49 @@ void l1_guest_code(struct vmx_pages *vmx)
 	GUEST_ASSERT(load_vmcs(vmx));
 
 	if (vmx->eptp_gpa)
-		l2_rip = l2_guest_code_ept_enabled;
+		l2_rip = l2_guest_code_tdp_enabled;
 	else
-		l2_rip = l2_guest_code_ept_disabled;
+		l2_rip = l2_guest_code_tdp_disabled;
 
 	prepare_vmcs(vmx, l2_rip, &l2_guest_stack[L2_GUEST_STACK_SIZE]);
 
 	GUEST_SYNC(false);
 	GUEST_ASSERT(!vmlaunch());
 	GUEST_SYNC(false);
-	GUEST_ASSERT(vmreadz(VM_EXIT_REASON) == EXIT_REASON_VMCALL);
+	GUEST_ASSERT_EQ(vmreadz(VM_EXIT_REASON), EXIT_REASON_VMCALL);
 	GUEST_DONE();
 }
 
-static void test_vmx_dirty_log(bool enable_ept)
+static void l1_svm_code(struct svm_test_data *svm)
 {
-	vm_vaddr_t vmx_pages_gva = 0;
+	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
+	void *l2_rip;
+
+	if (svm->ncr3_gpa)
+		l2_rip = l2_guest_code_tdp_enabled;
+	else
+		l2_rip = l2_guest_code_tdp_disabled;
+
+	generic_svm_setup(svm, l2_rip, &l2_guest_stack[L2_GUEST_STACK_SIZE]);
+
+	GUEST_SYNC(false);
+	run_guest(svm->vmcb, svm->vmcb_gpa);
+	GUEST_SYNC(false);
+	GUEST_ASSERT_EQ(svm->vmcb->control.exit_code, SVM_EXIT_VMMCALL);
+	GUEST_DONE();
+}
+
+static void l1_guest_code(void *data)
+{
+	if (this_cpu_has(X86_FEATURE_VMX))
+		l1_vmx_code(data);
+	else
+		l1_svm_code(data);
+}
+
+static void test_dirty_log(bool nested_tdp)
+{
+	vm_vaddr_t nested_gva = 0;
 	unsigned long *bmap;
 	uint64_t *host_test_mem;
 
@@ -88,15 +117,19 @@ static void test_vmx_dirty_log(bool enable_ept)
 	struct ucall uc;
 	bool done = false;
 
-	pr_info("Nested EPT: %s\n", enable_ept ? "enabled" : "disabled");
+	pr_info("Nested TDP: %s\n", nested_tdp ? "enabled" : "disabled");
 
 	/* Create VM */
 	vm = vm_create_with_one_vcpu(&vcpu, l1_guest_code);
-	if (enable_ept)
+	if (nested_tdp)
 		vm_enable_tdp(vm);
 
-	vcpu_alloc_vmx(vm, &vmx_pages_gva);
-	vcpu_args_set(vcpu, 1, vmx_pages_gva);
+	if (kvm_cpu_has(X86_FEATURE_VMX))
+		vcpu_alloc_vmx(vm, &nested_gva);
+	else
+		vcpu_alloc_svm(vm, &nested_gva);
+
+	vcpu_args_set(vcpu, 1, nested_gva);
 
 	/* Add an extra memory slot for testing dirty logging */
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
@@ -115,10 +148,10 @@ static void test_vmx_dirty_log(bool enable_ept)
 	 * ... pages in the L2 GPA range [0xc0001000, 0xc0003000) will map to
 	 * 0xc0000000.
 	 *
-	 * When EPT is disabled, the L2 guest code will still access the same L1
-	 * GPAs as the EPT enabled case.
+	 * When TDP is disabled, the L2 guest code will still access the same L1
+	 * GPAs as the TDP enabled case.
 	 */
-	if (enable_ept) {
+	if (nested_tdp) {
 		tdp_identity_map_default_memslots(vm);
 		tdp_map(vm, NESTED_TEST_MEM1, GUEST_TEST_MEM, PAGE_SIZE);
 		tdp_map(vm, NESTED_TEST_MEM2, GUEST_TEST_MEM, PAGE_SIZE);
@@ -166,12 +199,12 @@ static void test_vmx_dirty_log(bool enable_ept)
 
 int main(int argc, char *argv[])
 {
-	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_VMX));
+	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_VMX) || kvm_cpu_has(X86_FEATURE_SVM));
 
-	test_vmx_dirty_log(/*enable_ept=*/false);
+	test_dirty_log(/*nested_tdp=*/false);
 
 	if (kvm_cpu_has_tdp())
-		test_vmx_dirty_log(/*enable_ept=*/true);
+		test_dirty_log(/*nested_tdp=*/true);
 
 	return 0;
 }
-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
