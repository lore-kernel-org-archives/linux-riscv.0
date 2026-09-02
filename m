Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C463C624DB
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiiPKfA6Og+009WvlYxsiISqW+DWYhObwZ3VuKl8sQ4=; b=0VJ9+89OLA+zQf
	QqNe30/mvgo6Brpi+bJSDlDiqDdo6MNHwQrCjFAVeQ2Xmyb7dbElXFhs9LlmRIQeXMdGthk2C5aGr
	u9Un6aAoahGI3Ifde/zzauCG1kTTfEE+2tsHcFNDBEgbnZB47maSyQ8FipjQ3HCLmxvQg+yTpiMMO
	/EgdmVRzxSBrTSLXZLVjHYsETswBawPUh/+pEyaQI7BPt/FCDh2dU8DZSmp6Ha+O7+LH64FMfxrqk
	t2ZPTD9G28k1Erme/+/j8F/aR2AGDvUPlRYsUaDc24fdlLPjFv0wTZFHB/afmJxqFRz77BjUbC5TH
	bR3OyQ6XMr3kx6fTs9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2J-0000000FFNO-3NpQ;
	Wed, 02 Sep 2026 16:42:07 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1u-0000000FERQ-3bkN
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:48 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so2564470a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367301; x=1788972101; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SeJnYNm/30DDrGtlzlyhX4F8Ff+qodk8muwORsydLHQ=;
        b=r2lfLO9uOoaV5wSHpzvDukz8rXqueOIeZfc3QS6Q5Q86LfsrczrpLKtl1a0wPAVsf6
         auXyzqABMtUVQI0aLnYkAys0wc49D3SGB4Jg403T7xxXalLQy1JK5YH/UsrN7V0qK7p8
         C1Ix5hblwguvM5oXokEscY3vZ5Kj+f+EA6Ce0ENtoxhUalUl+YDCC4LSCegV4wnghC3X
         U1Dvyil/7hrD3kgK1nrJTM7mcobdG2qDMhwYC4Yr9h31wr3ACVo5BzYhTYzSWkBCOEAW
         lw+w5N1+G6VQ6bz0oGr76kL/JjR10MoIst/xJ+sBeSZuYmK8cAe+Ut3WUM3Ygxf4RZX6
         XZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367301; x=1788972101;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SeJnYNm/30DDrGtlzlyhX4F8Ff+qodk8muwORsydLHQ=;
        b=FTEH22MZCKW/2mX+R8ya/nsOxhhmX2fsqDtO562GXp03kQKwaTh9wPfsSm6B9HINUG
         liLaFGoQqu+EbLYADyzlsRJOLtl30YdVcUTVXVM3Y4wBD+tPNWKZnB05KLbmP/63w6VD
         xc9H90iT1Ed5G5s4hS9QPR2IQd6NDlJ59ZruXXfPl/oENfRiCNUEW3tPh/ooM+43zZcp
         Fl9lWrQslHDQeFNYIAaCcW/V05y1f+zW6APoHoTwzkPNjNKOib9FOoX8Fc2Xz7l1FC6N
         gim8ep/d+e4CFzUMXflxREtiAI8sNahToL4R1t0abqIXhJc0+7JiCBirMmwEDCQk1AVj
         ZxXA==
X-Forwarded-Encrypted: i=1; AKwUvBzqE/DIhU1agojBpEfVdAq3dxYkkzflIt2qPzImpeLhp/MNJrI5paFtwfaEeYKWqXm4vfsAwQ68CVU8EA==@lists.infradead.org
X-Gm-Message-State: AFuF++mSZxs0MPOkkirzpuzjmUVWx6NvkW0tzKchbGGutQEFcf+B89V5
	vIu1p4TTzsK0cZVU3OzGmB7xnbTWsr8YNXQ/dPiczuUK3/82jHMdWNtRd5gYQlsQp/VN3+fzhUu
	8cq3Ahg==
X-Received: from pjan2.prod.google.com ([2002:a17:90a:1602:b0:398:9c5e:d8f2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ac9:b0:398:9bd5:490c
 with SMTP id 98e67ed59e1d1-39aee0b498dmr7421235a91.19.1788367300525; Wed, 02
 Sep 2026 09:41:40 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:16 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-14-seanjc@google.com>
Subject: [PATCH v2 13/20] KVM: selftests: Add TEST_EXTRA memory region type
 for "special" memslots
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094142_961199_C71C3FCD 
X-CRM114-Status: GOOD (  20.44  )
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

And another memory region type to deal with extra, one-off memory regions,
and use the new type to manage x86's SMRAM memslot, as another step towards
taking the region type instead of the raw memslot in the physical page
allocator APIs.

Alternatively, SMRAM setup could simply use the quad-underscore API to
continue passing in the memslot, but a surprising number of tests use an
"extra" memslot for a variety of reasons.  I.e. allocating memory from one
(and exactly one) extra memslot isn't all that rare, and so should be
treated as normal behavior, not as something extraordinary, as
quad-underscore functions typically suggest.

Opportunistically add comments to document the intended usage of the types,
as the difference between DATA, TEST_DATA, and TEST_EXTRA in particular
isn't exactly obvious.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 39 ++++++++++++++++---
 tools/testing/selftests/kvm/include/x86/smm.h |  2 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  7 ++--
 3 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c8faa8a02b93..b6b96d6978b2 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -82,11 +82,45 @@ struct userspace_mem_regions {
 	DECLARE_HASHTABLE(slot_hash, 9);
 };
 
+/*
+ * Memory region types are passed to various page allocators to communicate
+ * various properties and metadata related to the allocation.  Note, the
+ * descriptions below described the primary usage of each type.  Individual
+ * tests may allocate memory for other purposes.
+ *
+ * By default, all regions except TEST_EXTRA are mapped to memslot '0'.  The
+ * TEXT_EXTRA region is left unmapped as it's intended to be used only for test
+ * specific allocations, i.e. should never be used by core/infrastructure code.
+ * Tests can override the memslot for any or all types, e.g. so that all test
+ * data is allocated from a curated memslot.
+ */
 enum kvm_mem_region_type {
+	/*
+	 * The CODE region is used by lib/elf when loading the test's code into
+	 * guest memory.
+	 */
 	MEM_REGION_CODE,
+	/*
+	 * The DATA region is used to allocate core data structures, e.g. vCPU
+	 * stacks, VM exception tables, x86's TSS, etc.
+	 */
 	MEM_REGION_DATA,
+	/*
+	 * The PT region, a.k.a. Page Table region, is used to allocate page
+	 * table pages.
+	 */
 	MEM_REGION_PT,
+	/*
+	 * The TEST_DATA region is used for allocating test data that is either
+	 * test specific, and/or isn't considered a "core" data structure.
+	 */
 	MEM_REGION_TEST_DATA,
+	/*
+	 * The TEST_EXTRA region is for special snowflakes, where a test wants
+	 * to create and use a one-off memslot, without impacting "normal" test
+	 * data allocations.
+	 */
+	MEM_REGION_TEST_EXTRA,
 	NR_MEM_REGIONS,
 };
 
@@ -129,11 +163,6 @@ struct kvm_vm {
 
 	struct kvm_binary_stats stats;
 
-	/*
-	 * KVM region slots. These are the default memslots used by page
-	 * allocators, e.g., lib/elf uses the memslots[MEM_REGION_CODE]
-	 * memslot.
-	 */
 	u32 memslots[NR_MEM_REGIONS];
 };
 
diff --git a/tools/testing/selftests/kvm/include/x86/smm.h b/tools/testing/selftests/kvm/include/x86/smm.h
index 2d1afa09819b..15faaa060126 100644
--- a/tools/testing/selftests/kvm/include/x86/smm.h
+++ b/tools/testing/selftests/kvm/include/x86/smm.h
@@ -8,7 +8,7 @@
 #define SMRAM_MEMSLOT	((1 << 16) | 1)
 #define SMRAM_PAGES	(SMRAM_SIZE / PAGE_SIZE)
 
-void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
+void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 		 const void *smi_handler, size_t handler_size);
 
 void inject_smi(struct kvm_vcpu *vcpu);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index ea5fa59888af..b988eea373ad 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1468,11 +1468,12 @@ bool kvm_arch_has_default_irqchip(void)
 	return true;
 }
 
-void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
+void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 		 const void *smi_handler, size_t handler_size)
 {
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, smram_gpa,
-				    SMRAM_MEMSLOT, SMRAM_PAGES, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       smram_gpa, SMRAM_MEMSLOT, SMRAM_PAGES);
+
 	TEST_ASSERT(vm_phy_pages_alloc(vm, SMRAM_PAGES, smram_gpa,
 				       SMRAM_MEMSLOT) == smram_gpa,
 		    "Could not allocate guest physical addresses for SMRAM");
-- 
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
