Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C52C61DBE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CYBe2MTSfEJyjEzLwAL/+QwamW1fY3+PcbQKxiywoU=; b=NTQumti97PhHeB
	NXPf51bHz2N7ja1HKnYHyaVxsGSk4pZVDzPvdR50ASOd3FUmMRlKqWwLnHP5SaFh2z7wc4PYHpPYo
	D26Imlq1TF7lUYVPaCKZ2nbvBqXsvxf2MJMSL37o/bpHbUbeIhZ+KXfT/byACCj52zJ+TcOVOnT7Y
	GxwJW4Nied3xfWG2smn4+imoqUknFVetj/Xz7k13IaDmfKv5CZZlCmQUgKT8kbus6a40fJrWQOnQ0
	RHL6OeZUHILnvqnPPpI85x6UTKZJZFeNdqavYdQTccsto7/1vyIkRm7Ur62/YNy0R/6vIK6y86Tc5
	ypLc4pool4xDo0+MQSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMhP-000000037eO-33IU;
	Wed, 26 Aug 2026 23:06:27 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgX-000000036JG-1GB9
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:35 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-854f274dd69so232766b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785532; x=1788390332; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cv4l6DetpbfnxZzj2chSUH1uUtI9CMqirdy2q6HV2z0=;
        b=lXDYexylpB9JiDLe1OwGEJlIDCLjLqQv3ehCbyRa88kArMK2Wkq/psDtaEUpZnwDE6
         C+2N4QzLjyfbRahHlMkVUmEj5aFl7i2qVeSsKUWsMjCkhFeapq6swcdccsfIDifJEi4J
         CVs9T2o8p8gPGooSxM4swpnEthSkmXwBsNTiGBhz+Ygu3z3F78bK46XJTCsKni20owzU
         c/S8DFkUguRHd2TCVdaK3oa1AavYzbClLm4EmsGSowJvHXIwmlmepKoIdgwwtAa7ZY2R
         WjTmOqEJVoLJnPNmTGaboOyzDpuFZ8vBcxZ+51zl8K7uZmIkos64dHsDc0tnEBKZvIuo
         8egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785532; x=1788390332;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cv4l6DetpbfnxZzj2chSUH1uUtI9CMqirdy2q6HV2z0=;
        b=ZtixBIedsAgTTB6NA6e4AuljD31YVWR7Ot9l75kdiroPxGv4m+cg5Cmfc/1L8N/KSu
         ygcOhH1sd+5mNOH1BDp6cbTYQC03Oksh6oSpSh27bNQQkqIrgvTx23NqrVAoEmdroJVK
         m5blzxAOhvKbA/FW4fMaAGq8oTabdEaChRgTZclqi2dF40eMbNrDqnUduJFhreFCY+V1
         acI0SPtus5xdrVKhYrZRSQkClaum5Yd02esM9zlMaltypl6AIFhfU4S7/2iaPaofaGEh
         ePHC+BiDFeA0Oe73lqwyDoDe5TekAatPH/iB68vuhkA9zYBd/hUvEoH1hkRZ6pYk2xnB
         CDVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtMX1NCHwnj6D3CpMttVxNxYv8BBOEy0myBu3YFcoVaDwa8TtoweYdvU6d2PclfG9xhiXnC3dWrT/4gQ==@lists.infradead.org
X-Gm-Message-State: AFuF++n9ddXughpysfHGOMABzBoR6zDOWslUpYZ+3siFZFz9lIw+Th7K
	Q4Rdl+xzxPplPb2cr1ThZ5W1pdcBU17PLqIk1B9HHtNinOnxhU9YuePsufpSH2dBAGG3jfCZqwf
	OvoVtrQ==
X-Received: from pgcq30.prod.google.com ([2002:a63:751e:0:b0:cc1:c78b:a2fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3086:b0:3c0:eeb7:28b
 with SMTP id adf61e73a8af0-3cf762865f1mr18455761637.8.1787785531152; Wed, 26
 Aug 2026 16:05:31 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:03 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-13-seanjc@google.com>
Subject: [PATCH 12/20] KVM: selftests: Add APIs to override memory region
 types with custom memslots
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160533_533818_C3F18D75 
X-CRM114-Status: GOOD (  12.14  )
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

Add and use APIs to override memory region types instead of open coding the
logic in tests, partly to dedup test code, but mostly to add some amount of
protection against conflicting overrides.  This will allow converting more
tests to override memory regions without taking on too much risk of bugs in
the long term, e.g. due to silently overriding a region multiple times.

Deliberately "unroll" the loops in __vm_create() and the CMMA test's
create_main_memslot() to avoid filling all memslots in anticipation of
adding an "extra" memslot that is for test use and *only* test use, i.e.
shouldn't be configured by core library code.

Converting tests to overriding memory regions will allow taking the region
type instead of the raw memslot in the physical page allocator APIs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/arm64/page_fault_test.c     | 18 +++++------
 .../testing/selftests/kvm/include/kvm_util.h  | 30 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  8 +++--
 tools/testing/selftests/kvm/s390/cmma_test.c  | 19 ++++--------
 4 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/page_fault_test.c b/tools/testing/selftests/kvm/arm64/page_fault_test.c
index 6bb3d82906b2..b0e3fc8cd76a 100644
--- a/tools/testing/selftests/kvm/arm64/page_fault_test.c
+++ b/tools/testing/selftests/kvm/arm64/page_fault_test.c
@@ -597,18 +597,16 @@ static void setup_memslots(struct kvm_vm *vm, struct test_params *p)
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0,
 				    CODE_AND_DATA_MEMSLOT, code_npages, 0);
-	vm->memslots[MEM_REGION_CODE] = CODE_AND_DATA_MEMSLOT;
-	vm->memslots[MEM_REGION_DATA] = CODE_AND_DATA_MEMSLOT;
+	____vm_override_mem_region(vm, MEM_REGION_CODE, CODE_AND_DATA_MEMSLOT);
+	____vm_override_mem_region(vm, MEM_REGION_DATA, CODE_AND_DATA_MEMSLOT);
 
-	vm_userspace_mem_region_add(vm, p->src_type, data_gpa - pt_size,
-				    PAGE_TABLE_MEMSLOT, pt_size / guest_page_size,
-				    p->test_desc->pt_memslot_flags);
-	vm->memslots[MEM_REGION_PT] = PAGE_TABLE_MEMSLOT;
+	__vm_override_mem_region(vm, MEM_REGION_PT, p->src_type, data_gpa - pt_size,
+				 PAGE_TABLE_MEMSLOT, pt_size / guest_page_size,
+				 p->test_desc->pt_memslot_flags);
 
-	vm_userspace_mem_region_add(vm, p->src_type, data_gpa, TEST_DATA_MEMSLOT,
-				    data_size / guest_page_size,
-				    p->test_desc->data_memslot_flags);
-	vm->memslots[MEM_REGION_TEST_DATA] = TEST_DATA_MEMSLOT;
+	__vm_override_mem_region(vm, MEM_REGION_TEST_DATA, p->src_type, data_gpa,
+				 TEST_DATA_MEMSLOT, data_size / guest_page_size,
+				 p->test_desc->data_memslot_flags);
 }
 
 static void setup_ucall(struct kvm_vm *vm)
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 70e77992dd2f..14f87c8a00ec 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -704,6 +704,36 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		gpa_t gpa, u32 slot, u64 npages, u32 flags,
 		int guest_memfd_fd, u64 guest_memfd_offset);
 
+
+static inline void ____vm_override_mem_region(struct kvm_vm *vm,
+					      enum kvm_mem_region_type type,
+					      u32 slot)
+{
+	TEST_ASSERT(vm->memslots[type] == KVM_INVALID_MEMSLOT,
+		    "Memory region type '%u' was already overridden with slot=%u",
+		    type, vm->memslots[type]);
+
+	vm->memslots[type] = slot;
+}
+
+static inline void __vm_override_mem_region(struct kvm_vm *vm,
+					    enum kvm_mem_region_type type,
+					    enum vm_mem_backing_src_type src_type,
+					    gpa_t gpa, u32 slot, u64 npages,
+					    u32 flags)
+{
+	____vm_override_mem_region(vm, type, slot);
+	vm_userspace_mem_region_add(vm, src_type, gpa, slot, npages, flags);
+}
+
+static inline void vm_override_mem_region(struct kvm_vm *vm,
+					  enum kvm_mem_region_type type,
+					  enum vm_mem_backing_src_type src_type,
+					  gpa_t gpa, u32 slot, u64 npages)
+{
+	__vm_override_mem_region(vm, type, src_type, gpa, slot, npages, 0);
+}
+
 #ifndef vm_arch_has_protected_memory
 static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
 {
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 56df5b1d9c79..781af2928d04 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -495,7 +495,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 						 nr_extra_pages);
 	struct userspace_mem_region *slot0;
 	struct kvm_vm *vm;
-	int i, flags;
+	int flags;
 
 	kvm_set_files_rlimit(nr_runnable_vcpus);
 
@@ -513,8 +513,10 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 		flags |= KVM_MEM_GUEST_MEMFD;
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
-	for (i = 0; i < NR_MEM_REGIONS; i++)
-		vm->memslots[i] = 0;
+	____vm_override_mem_region(vm, MEM_REGION_CODE, 0);
+	____vm_override_mem_region(vm, MEM_REGION_PT, 0);
+	____vm_override_mem_region(vm, MEM_REGION_DATA, 0);
+	____vm_override_mem_region(vm, MEM_REGION_TEST_DATA, 0);
 
 	kvm_vm_elf_load(vm, program_invocation_name);
 
diff --git a/tools/testing/selftests/kvm/s390/cmma_test.c b/tools/testing/selftests/kvm/s390/cmma_test.c
index 15d81b2ed7ad..73387cc3bca7 100644
--- a/tools/testing/selftests/kvm/s390/cmma_test.c
+++ b/tools/testing/selftests/kvm/s390/cmma_test.c
@@ -102,24 +102,17 @@ static void guest_dirty_test_data(void)
 
 static void create_main_memslot(struct kvm_vm *vm)
 {
-	int i;
-
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, MAIN_PAGE_COUNT, 0);
-	/* set the array of memslots to zero like __vm_create does */
-	for (i = 0; i < NR_MEM_REGIONS; i++)
-		vm->memslots[i] = 0;
+	____vm_override_mem_region(vm, MEM_REGION_CODE, 0);
+	____vm_override_mem_region(vm, MEM_REGION_PT, 0);
+	____vm_override_mem_region(vm, MEM_REGION_DATA, 0);
 }
 
 static void create_test_memslot(struct kvm_vm *vm)
 {
-	vm_userspace_mem_region_add(vm,
-				    VM_MEM_SRC_ANONYMOUS,
-				    TEST_DATA_START_GFN << vm->page_shift,
-				    TEST_DATA_MEMSLOT,
-				    TEST_DATA_PAGE_COUNT,
-				    0
-				   );
-	vm->memslots[MEM_REGION_TEST_DATA] = TEST_DATA_MEMSLOT;
+	vm_override_mem_region(vm, MEM_REGION_TEST_DATA, VM_MEM_SRC_ANONYMOUS,
+			       TEST_DATA_START_GFN << vm->page_shift,
+			       TEST_DATA_MEMSLOT, TEST_DATA_PAGE_COUNT);
 }
 
 static void create_memslots(struct kvm_vm *vm)
-- 
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
