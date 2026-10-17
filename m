Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F591CCF2C9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 11:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dJC1c1rNBI6CnUp2VctSvDX9RjO8z3PuPgeQBPruIU=; b=p/zJr9qrRxIPzO
	miphuhtM6zZaJi7fQy43ZeFL2xVjJ5jQETioKEg2xvl6NLyCeJeakdIPX4XRFSDZBEBwhS+G+o8aL
	hEWvc0QNcRJFpesCK2pDLqtPSAHGycEJ7CXqsu8/YW2EQDR7tPxwvW3uLhkqNulVuhO16aRlQopBp
	nVGUQNwD5XuQIjZGztJ2AI4repsMaaChA7iKAsVGl78QWwcJvKBZtmYnszQ6GZNYJmjvUoiqF6pIq
	VSDLhPcSdGVg1UlWvMf9fkDIOXEaDy6Vfwv85SVdGMJLE3GJEaU43GaHyzX0c3vC8p9zlvIwZdHQS
	iqIfyuHz1iaC9YRdnoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2CR-00000004hcg-0vkB;
	Sat, 17 Oct 2026 11:03:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2CK-00000004hX0-3Grd
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 11:03:37 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e5fb79ce82so3356675ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235012; x=1792839812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tf4fy3DAykjNBLlmTR7a2o12P+Rb24NlY7yvH7wOMkE=;
        b=jK+0Sjrqpju1AkuXLTRUyuKjIDC4qhrN2fR7xsnfuHWijU3ZNlY36894EawAU5OTj0
         6+j51KmhE3lIuQsJyaFKLIvU9Sgg/PFuhKkgyULxWgHutsWBl5X0aPoGGS+2VbZnnptJ
         C+hQy0iBPDTtQurKwDtuVF82yII92RBa9au9NBv252Q91MiZoE6D0Au37O70tcSzWbNI
         qg8PbapbkCOqY7Et9E0Xm8NM8k5WP8a3E6/FkyPcJzZZV9GFkCMxm+5EBWCdQOGfKFAw
         LMP1hfJhE5snrLPvqbUULK9YbIAXdrWCxPktZlqCwO+9e7sfZwrJ/JVrZB/KUN8nZQUI
         KNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235012; x=1792839812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tf4fy3DAykjNBLlmTR7a2o12P+Rb24NlY7yvH7wOMkE=;
        b=w4PKrspaXQCChSylIUSf/9Agz5FCb8asWFzJudzRA6cUmKkZVjelMz9Dbmj5zdH+ik
         FexyNaXGX1xi0ZRGJmvX769XnmlByDLCKmGC4b+mgY6XaW4ivbHJIC32wBt01306SP/e
         tiPajUYeYxavc8DxCEARkke/jcUb5QfPGiX1FCv3NErk0jaFRTTOC1WxrAP/oMjod6Pt
         sfHLc6twu09XYUjDkVtypTajMqfT0861RHzT45XVljTF0SUi8zsx7dMAGMuMZT0YeiYr
         R/mtA4vwylzQR6iw+yD8JBRDrL4SMvI4jsmCytibsJR2eV8Z/8zX3ejRV5deGinN6CaS
         b0Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwDtWWfdDJ9vtnHGS6YHOEm7Cr/hjFTufqEpdXtgt25VHvrNWvv3WKTTQYxdm96vfjWakh8SL32S5GDXQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKxL2jzVtdVdpuzXQakbaJEXqEEheJWL6T0gBhnGEaPCtqkqqc8
	G1pDBBC2AlR9xjs/w1y0Snp02FBA9NcchvyiDval4ml/hAPi9Yx9YDBe
X-Gm-Gg: AYBFou38JBKb2pn/81aM9fE44DS7qPUdPQ7s/WSUJTNUkqu534kAqudM4MgWFxw1Ku8
	IRjYZx1c//QPmMKOHnj1CNuRrpRgy3SVbfWiARFezN/4I3Mwlngk8aqvTKT20NPqG3QqpR3Ip3f
	5uqo6ktqvSnGvxz6DbBt0J6XaA6d6kDx/W7YWs2V80stVscSQ+CG7KTWI15gUKLH5qt4djPHRno
	z3Ka1rpPEJFfct4t4+avRcftLi+vn2HOLJvrAEA5k5hJZ3ObcDt7k+p1LYNX0suIwOWoneYcNt4
	qB7Zam5iUuUEb1KteZaiJU+aJmn2AQsmmsIL7yOBhGOKYW1cu4lejo4HfZovhxsoYO289MbNOay
	DsywyOqgTi9+kDg7qZH9TD5Y8ekqkAhZMAwcztab9xjHHENt0R0uLjSMniTM/2yMAdaYP7vKqVa
	g6y+sj8gzcOPk/GL8BsFIxHBEL1O5fPqa0t//l4W9eLxJc4m3AAxRe8USxxliBHiaK2t2oA1wS3
	+4ZKkgRR2V3lasHcFfylw==
X-Received: by 2002:a17:902:e84c:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2e9a69e93d4mr22504755ad.30.1792235011936;
        Sat, 17 Oct 2026 04:03:31 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:31 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 5/5] KVM: selftests: Test protection of the ucall MMIO region
Date: Sat, 17 Oct 2026 18:02:13 +0700
Message-ID: <20261017110213.46199-6-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040333_991638_7F703737 
X-CRM114-Status: GOOD (  12.83  )
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

Verify that creating a memslot overlapping the ucall MMIO region
fails with EEXIST and that ucalls work before and after the
attempt. Skip when MMIO ucalls or read-only memory are unsupported.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/reserved_slot_test.c        | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/reserved_slot_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 1f4bc2a1322d..ff4a5e9733e9 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -68,6 +68,7 @@ TEST_GEN_PROGS_COMMON += set_memory_region_test
 TEST_GEN_PROGS_COMMON += memslot_modification_stress_test
 TEST_GEN_PROGS_COMMON += memslot_perf_test
 TEST_GEN_PROGS_COMMON += vm_types_test
+TEST_GEN_PROGS_COMMON += reserved_slot_test
 
 # Compiled test targets
 TEST_GEN_PROGS_x86 = $(TEST_GEN_PROGS_COMMON)
diff --git a/tools/testing/selftests/kvm/reserved_slot_test.c b/tools/testing/selftests/kvm/reserved_slot_test.c
new file mode 100644
index 000000000000..4a908017ca73
--- /dev/null
+++ b/tools/testing/selftests/kvm/reserved_slot_test.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+#define CLOBBERED_SLOT		TEST_MEM_SLOT_BASE
+
+static void guest_code(void)
+{
+	GUEST_SYNC(1);
+	GUEST_SYNC(2);
+}
+
+static void test_slot1_protected(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_run *run;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	u32 nr_pages;
+	size_t slot_size;
+	void *slot_mem;
+	int ret;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	nr_pages = vm_adjust_num_guest_pages(vm->mode, 1);
+	slot_size = (size_t)nr_pages * vm->page_size;
+
+	run = vcpu->run;
+	vcpu_run(vcpu);
+	TEST_ASSERT(run->exit_reason == KVM_EXIT_MMIO,
+		    "Unexpected exit reason = %u", run->exit_reason);
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_SYNC && uc.args[1] == 1,
+		    "Expected the first sync before clobbering the ucall GPA");
+
+	slot_mem = kvm_mmap(slot_size, PROT_READ | PROT_WRITE,
+			    MAP_PRIVATE | MAP_ANONYMOUS, -1);
+	ret = __vm_set_user_memory_region2(vm, CLOBBERED_SLOT, 0,
+					   vm->ucall_mmio_addr, slot_size, slot_mem, 0, 0);
+	TEST_ASSERT(ret == -1 && errno == EEXIST,
+		    "Expected the ucall GPA overlap to be rejected: ret=%d errno=%d",
+		    ret, errno);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT(run->exit_reason == KVM_EXIT_MMIO,
+		    "Unexpected exit reason = %u", run->exit_reason);
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_SYNC && uc.args[1] == 2,
+		    "Expected the second sync after attempting to clobber the ucall GPA");
+
+	kvm_vm_free(vm);
+	TEST_ASSERT(!munmap(slot_mem, slot_size), "munmap() failed, errno=%d", errno);
+}
+
+int main(void)
+{
+	TEST_REQUIRE(UCALL_EXIT_REASON == KVM_EXIT_MMIO);
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_READONLY_MEM));
+
+	test_slot1_protected();
+	return 0;
+}
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
