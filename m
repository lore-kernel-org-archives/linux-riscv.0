Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF06C5DF97
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dV1YUdTugfDYMoW5JE3psbgtpxaWpFprJJTJ/jzSE3o=; b=fEceZuN2cdSa67
	TK3LlKQVw6qdL/Noc6EfOIACRCwpS1PmW00JOcqVc+7KB/sS17FE+ZAOMonoRCcmhl7p5YBXtkCjN
	8Kpd+Ug+/ex3EMde3F1I4L96yNO59sOSU75jEd82uMtUDF2G3jf67xXX0WFH2qnPkyCfC3VFsyB0M
	zE/I/pE5c0x2GnuYYfD4DR09BEtBaQ/KnRjV/hK2Wxtt39b9BuDapYQqeiJaIvLL346sYw/SOkoQO
	sE9cd8v5PUD/iS1vdjM4RaEk7BWYWeoftdBSIG2DhYKVOnZX/7qQsPCj7qs4QckfIzQJoC1/g71J3
	AlYQ2YWxEC3bnjKYyPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMiG-000000038pj-1ENA;
	Wed, 26 Aug 2026 23:07:20 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgg-000000036Ue-2uQt
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:48 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-848d21bbb55so110120b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785540; x=1788390340; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHiSvQXl4tkWm+SikbwEM4QvcPfHzRPC0s7Gep7aVew=;
        b=INpkLr1fvVLvYon/bkf7KM65z2TYI7obmoBXbuvbOQS+rHmm5H0nmcEYV6NLWxzJ6d
         UYQJ5FYWQ9TUm9o3VLdHBsHXrcYxHJuhTWoz2QzWk3VoQl5O3B+GPfzqn9nMJZqAzWt+
         QfpwJAzu9wRUhg82MQl4SUHQhNbSfpn19j+E1luZ4YsnMmUU+Qg6QESGPWhIhqL9qeyY
         DbLyK7At1+Z8c/b+MSVEwSzH+SlB1Kj4T8GXmTjAc2+UxRMsND8jy01Abhbv3NQgUl3C
         8YqnL6wSqsHe5bWYP24aL/oNw6x6hiRNrm/dgcOmgLT2KqiKcBUABR8iRpLA4KzhmAcl
         FMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785540; x=1788390340;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pHiSvQXl4tkWm+SikbwEM4QvcPfHzRPC0s7Gep7aVew=;
        b=HXu/SO96rkiN0l2caOR9ct066buc6ooVswh65KvAJb0eTzdPmfH8JdCyNVou1hcFX3
         jIKUCPbcZxKXgJ562UnbtCvpuqgpP1SJGX+8D8H5bN0BJFPAO386mwgwjQlFTCbWFGpG
         YOz39ezMC/JjlKaQDzffKmc680XN9pYLzPxvNcaMbxllv20n/tseGr+U5fpgImx78tKU
         0bO3XH3W+jDTg41bbmGUMskaW6DyP5kaznyqFaXO03EYwHEuRiFhIvkMiUqohLRpUn/M
         cRGg3XFNsWuixq6RMsETKSHPpWAVo87VleB+y2eXvR2VgW0JLJokAboNpqUQv8Dfte/X
         RPNg==
X-Forwarded-Encrypted: i=1; AHgh+Rrn3T2EYPw7u3Ixql0eS421BdgUHD0Pz3nAgZ/G89zAPYrA2fCAN5Xg7BZk5rEdrrawHEsV7ovPi0HkvA==@lists.infradead.org
X-Gm-Message-State: AFuF++mhDN+04qtA/3UBWCbyDzoqjuxFdpTSQTqpyCVgS9UlnMYsvbKt
	QLdsWJe4Be7OzifTbs/E4n+bzObYgJCKZjXnRJb1s1KXErWuH3V8j+Z+DGNjdRxRbYKRwm6SiTZ
	86Wb++A==
X-Received: from pfbcb3.prod.google.com ([2002:a05:6a00:4303:b0:847:aa6c:47fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b53:b0:851:8baf:5b26
 with SMTP id d2e1a72fcca58-853749a5e4emr17924734b3a.14.1787785540289; Wed, 26
 Aug 2026 16:05:40 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:11 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-21-seanjc@google.com>
Subject: [PATCH 20/20] KVM: selftests: Add arch hook to force page tables to
 be naturally aligned
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
X-CRM114-CacheID: sfid-20260826_160543_085943_9B619466 
X-CRM114-Status: GOOD (  10.81  )
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

Add an arch hook to communicate to the core physical page allocator that
page table allocations need to be naturally aligned.  The hook will be used
for upcoming PowerPC support, which has MMU tables that are larger than the
guest base page size and need to be naturally aligned.

Bury the hook in the physical page allocator to avoid having to plumb a
rarely used param into the main APIs.

Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 1264cd1a343a..ffd4cf740d7f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1050,6 +1050,8 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 
 const char *exit_reason_str(unsigned int exit_reason);
 
+bool kvm_arch_needs_naturally_aligned_page_tables(void);
+
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 8b5b330a5889..57b653fbd0b1 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2085,10 +2085,16 @@ gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	__builtin_unreachable();
 }
 
+__weak bool kvm_arch_needs_naturally_aligned_page_tables(void)
+{
+	return false;
+}
+
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 			   enum kvm_mem_region_type type, bool protected)
 {
 	struct userspace_mem_region *region = vm_get_mem_region(vm, type);
+	bool naturally_aligned = false;
 	gpa_t min_gpa;
 
 	TEST_ASSERT(region, "No region for type '%u', memslot '%u'",
@@ -2110,6 +2116,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 		break;
 	case MEM_REGION_PT:
 		min_gpa = KVM_GUEST_PAGE_TABLE_MIN_PADDR;
+		naturally_aligned = kvm_arch_needs_naturally_aligned_page_tables();
 		break;
 	case MEM_REGION_TEST_EXTRA:
 		min_gpa = region->region.guest_phys_addr;
@@ -2120,7 +2127,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 	}
 
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, vm->memslots[type],
-				      protected, false);
+				      protected, naturally_aligned);
 }
 
 /*
-- 
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
