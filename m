Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44462C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLKkE8cOaJgKrS6WO5JmM6UGEp9hkgFg+3WIrMqxf3o=; b=wrOtOdQSdMoDjD
	v6blKzUGNwD30PCe8v/XFvoesRPwOjZEylDAFvgoJDQjLhhEzh96S0t5S00icBjuZU/hib7dYlhVr
	f9b5PlpaQoM6p3DF0cR75rAslQCLeQokisDx5UAMGc6atp0ktis/f9Yp4QbIPT183Ptw8sVW22lZl
	dkyuBv2l/CwwpcG/dmcg3ubhGDaTzf0ddcfbr1bwJ84AFUMqDblTYDcHB2gyUwU5sVStA+Fm1N/3S
	1/w93TZ33JMuPOrHrbb/P6zA3f39dgDjVlY7r2uAqOckzV+J9wZYAdtERXapJ0q3dLq8Qw6nWG1Rc
	3/tIcxHyoHRF25Q51/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbO-005DnK-3A;
	Wed, 19 Jul 2023 05:19:55 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbH-005Dg5-1t
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SY4++Pw7jN82rDNqoaD2dHTLrQhm/Cpf9xmKrcaKe3Q=; b=JJnk9CTtChzBh/QTtmt/b8SKfF
	9kJ+O6bSsaBh84432nneom5V7xKPXUJXaug10rsRYfmExoAEm/bSzdUxx5TWznpmlhGIR/zOLcIvt
	IgnBHP7mDTnb0rvkLLPsrmAdDyStx7kmBWX2qHD8JK76vrkguUH0bk8aV5VK4iUlnltFPq9/DukWQ
	PR4nQ3ODQpF9p/B6iEged4rFu379EzgABAxUbS5QEDZsZUCJO1uh2bLrmeHR07H9gRHqFyqGejlkm
	z1O4XwY+/LP9uAtNrl02br3GsTpe35hRHzmZtGOjkyxEnr0G4alWtvED/+5Dnn192SASRo3bnuDIp
	hZwCZrew==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuSc-005R0W-Sw
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:50:35 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5633ad8446bso600413a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724167; x=1692316167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SY4++Pw7jN82rDNqoaD2dHTLrQhm/Cpf9xmKrcaKe3Q=;
        b=iijdn5XDnjegnaaZfYZHmIdkKvvbAR+aFZwPs8fwv123kJVz2p2h/9oBWkdPqyaRsS
         tYPXzs8KW5tlit8ApBuNWuWVjoEh89xnSIsgu/Whq88891SPn+gBWtiDPpY3l3dMc6wN
         ZjIh27i9FIC2CgcS+8BUw/DTO5qbR+xqgce5EIjbVioflun88hYQpcoeohA5Q62CdacX
         bkVvUE31SkOaTSOFjNAxW/3riwskjxgdetH4j8mMZ5lGin7O2rYWfZ3WzOi8k2zslRid
         eo6zcZxWKCaMvtsfl3KXqqEZuMntBe3POabIgGzEM7GnbE1ZCGONcRiVjXe/yh+0wR7u
         lHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724167; x=1692316167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY4++Pw7jN82rDNqoaD2dHTLrQhm/Cpf9xmKrcaKe3Q=;
        b=VwKoeb1hjBzKYvAbkkiaFdp6x7P6FimLoa+FY4sJxMo8baqiwW0WX79DDp5rEqpwjI
         2oRv92IArCnhlbgfpSKRP9LRnjaTYM/fsfuOZ8ObHNBy8O2aO4DM1SIsNQ8tt+HM/KUz
         A2yqvoLlj5r3PZpUegnkfa8Hg0Q2kIQjNRZdvOCa+g95zTpHDS9NAvAGhI3rFkh+YT6x
         1iWt/so9ZfFWugtmvSpcVeNjVIZQqHfWZQ13zaWV0qjQNGcDnmWAldCGMv7rNNgK6IlQ
         L9RCfk5mHbu/Z3q/OByO4pZgOFHCb9wMRueAmAluvHNVQZMy7/iVY5uFIiyOcfiJepiS
         usdw==
X-Gm-Message-State: ABy/qLZhLZbqchSYU366wVqiRu69HuunTx+GRRHPZ2s4x00STAWF7Spx
	RQoWYMiciiUE/2oUNcn6riRIssJj3pw=
X-Google-Smtp-Source: APBJJlGpCneoSQTZl+h8R9VWDYL/V/WxbKXYmZJOD4TnVpMy34jgsMpJIAUA/D5Xqm41I27LXxp2p+nHZ10=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:7112:0:b0:534:6929:8ff5 with SMTP id
 m18-20020a637112000000b0053469298ff5mr109745pgc.10.1689724167553; Tue, 18 Jul
 2023 16:49:27 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:12 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-30-seanjc@google.com>
Subject: [RFC PATCH v11 29/29] KVM: selftests: Test KVM exit behavior for
 private memory/access
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005030_941772_F3D31DC0 
X-CRM114-Status: GOOD (  13.50  )
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

From: Ackerley Tng <ackerleytng@google.com>

"Testing private access when memslot gets deleted" tests the behavior
of KVM when a private memslot gets deleted while the VM is using the
private memslot. When KVM looks up the deleted (slot = NULL) memslot,
KVM should exit to userspace with KVM_EXIT_MEMORY_FAULT.

In the second test, upon a private access to non-private memslot, KVM
should also exit to userspace with KVM_EXIT_MEMORY_FAULT.

sean: These testcases belong in set_memory_region_test.c, they're private
variants on existing testscases and aren't as robust, e.g. don't ensure
the vCPU is actually running and accessing memory when converting and
deleting.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../kvm/x86_64/private_mem_kvm_exits_test.c   | 115 ++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 18c43336ede3..cb9450022302 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -81,6 +81,7 @@ TEST_GEN_PROGS_x86_64 += x86_64/nested_exceptions_test
 TEST_GEN_PROGS_x86_64 += x86_64/platform_info_test
 TEST_GEN_PROGS_x86_64 += x86_64/pmu_event_filter_test
 TEST_GEN_PROGS_x86_64 += x86_64/private_mem_conversions_test
+TEST_GEN_PROGS_x86_64 += x86_64/private_mem_kvm_exits_test
 TEST_GEN_PROGS_x86_64 += x86_64/set_boot_cpu_id
 TEST_GEN_PROGS_x86_64 += x86_64/set_sregs_test
 TEST_GEN_PROGS_x86_64 += x86_64/smaller_maxphyaddr_emulation_test
diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
new file mode 100644
index 000000000000..8daaa08c0d90
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022, Google LLC.
+ */
+#include <linux/kvm.h>
+#include <pthread.h>
+#include <stdint.h>
+
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+/* Arbitrarily selected to avoid overlaps with anything else */
+#define EXITS_TEST_GVA 0xc0000000
+#define EXITS_TEST_GPA EXITS_TEST_GVA
+#define EXITS_TEST_NPAGES 1
+#define EXITS_TEST_SIZE (EXITS_TEST_NPAGES * PAGE_SIZE)
+#define EXITS_TEST_SLOT 10
+
+static uint64_t guest_repeatedly_read(void)
+{
+	volatile uint64_t value;
+
+	while (true)
+		value = *((uint64_t *) EXITS_TEST_GVA);
+
+	return value;
+}
+
+static uint32_t run_vcpu_get_exit_reason(struct kvm_vcpu *vcpu)
+{
+	vcpu_run(vcpu);
+
+	return vcpu->run->exit_reason;
+}
+
+const struct vm_shape protected_vm_shape = {
+	.mode = VM_MODE_DEFAULT,
+	.type = KVM_X86_SW_PROTECTED_VM,
+};
+
+static void test_private_access_memslot_deleted(void)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	pthread_t vm_thread;
+	void *thread_return;
+	uint32_t exit_reason;
+
+	vm = vm_create_shape_with_one_vcpu(protected_vm_shape, &vcpu,
+					   guest_repeatedly_read);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    EXITS_TEST_GPA, EXITS_TEST_SLOT,
+				    EXITS_TEST_NPAGES,
+				    KVM_MEM_PRIVATE);
+
+	virt_map(vm, EXITS_TEST_GVA, EXITS_TEST_GPA, EXITS_TEST_NPAGES);
+
+	/* Request to access page privately */
+	vm_mem_set_private(vm, EXITS_TEST_GPA, EXITS_TEST_SIZE);
+
+	pthread_create(&vm_thread, NULL,
+		       (void *(*)(void *))run_vcpu_get_exit_reason,
+		       (void *)vcpu);
+
+	vm_mem_region_delete(vm, EXITS_TEST_SLOT);
+
+	pthread_join(vm_thread, &thread_return);
+	exit_reason = (uint32_t)(uint64_t)thread_return;
+
+	ASSERT_EQ(exit_reason, KVM_EXIT_MEMORY_FAULT);
+	ASSERT_EQ(vcpu->run->memory.flags, KVM_MEMORY_EXIT_FLAG_PRIVATE);
+	ASSERT_EQ(vcpu->run->memory.gpa, EXITS_TEST_GPA);
+	ASSERT_EQ(vcpu->run->memory.size, EXITS_TEST_SIZE);
+
+	kvm_vm_free(vm);
+}
+
+static void test_private_access_memslot_not_private(void)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	uint32_t exit_reason;
+
+	vm = vm_create_shape_with_one_vcpu(protected_vm_shape, &vcpu,
+					   guest_repeatedly_read);
+
+	/* Add a non-private memslot (flags = 0) */
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    EXITS_TEST_GPA, EXITS_TEST_SLOT,
+				    EXITS_TEST_NPAGES, 0);
+
+	virt_map(vm, EXITS_TEST_GVA, EXITS_TEST_GPA, EXITS_TEST_NPAGES);
+
+	/* Request to access page privately */
+	vm_mem_set_private(vm, EXITS_TEST_GPA, EXITS_TEST_SIZE);
+
+	exit_reason = run_vcpu_get_exit_reason(vcpu);
+
+	ASSERT_EQ(exit_reason, KVM_EXIT_MEMORY_FAULT);
+	ASSERT_EQ(vcpu->run->memory.flags, KVM_MEMORY_EXIT_FLAG_PRIVATE);
+	ASSERT_EQ(vcpu->run->memory.gpa, EXITS_TEST_GPA);
+	ASSERT_EQ(vcpu->run->memory.size, EXITS_TEST_SIZE);
+
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char *argv[])
+{
+	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
+
+	test_private_access_memslot_deleted();
+	test_private_access_memslot_not_private();
+}
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
