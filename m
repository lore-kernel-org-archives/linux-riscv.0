Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DECBC5DF97
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqaSpYKvNi4prnLa60CWiLOQk6cPCcr3kEPZjUKjO2k=; b=ydZflvruOPJmWW
	KI8EX1WEufwUb8YmshflZVsZnIkmMHB4JdXPT6YqsXOy+JIhBZC1dVzg6l4+GR1fPBplZ09Jsjt2v
	PSVke+EgYRZylkq0DSLjBKIgJUC/3FeynHgdK6BmaZSq/jjeVj43jl94C4wMDaDxzsnicUxMhJy86
	hVYmWqKt876CNB+fh6m2TerWLKMidC9/GTjvhyNFUx0k6Jha2hZlXFLDNLMXXHb8b9B/9S/8XVzPN
	I39XeT+/S4YRW4WrT7NNe9wLLZB04J1k1qnd1PsW+jgoSN8xcDZp/UKJ6QJVjHHN3KjnvkjiEkaOS
	FOPaPZB5vgRBjQ/O2T/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgp-000000036lu-2afH;
	Wed, 26 Aug 2026 23:05:51 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgP-000000036Ae-3gBN
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:28 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso1457788a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785524; x=1788390324; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IKkZ5WMHTp+y0tIK6W989B7G/56Zjcmbkdc6Bf2mTQA=;
        b=uwCWgxFleRSJRE0VZ5W5DWTK0on/YpKTxl8EU83bgsR/8sCZiESNI7wHtCMR32qLR9
         suorfXLPnBwtCXOohiJ1foSKIe2a87+Tuou/G34wHC2khAiHZHO8PjHa8yJf8YfqhUGa
         c1TWh4KAN40gxNK0v79OHUgKvfClcUFKwLwZ+OJ1FZqIhMHn+RlTIfj89IVN++xHtxOc
         vdcTWeU8qBjutbnYemNJygqn/Y1MZgYYDwUTu4T8QMx1+k8EQZZZD3xWlKv4DTjAvYOw
         o/veAIJjpIeaGi/eiNNPqUTXzmvdmo4jAKzHp0QWRMSY+q9pfiTjjhNagBHLvsNfxqol
         1VIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785524; x=1788390324;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IKkZ5WMHTp+y0tIK6W989B7G/56Zjcmbkdc6Bf2mTQA=;
        b=mfLXLaYjKIasoBQYfgJarxl5KWO2rlxisVXmmeSc2EoFf2shLENNezJY0Y0UHB8NPv
         o3Mk/mMVtZ8YIRAWqQO30ETLkLfqKpMK9mZMYTo3fMnuOnVICRhn4YZqmRv1ym7VN3rF
         FlDP8Fx1Sqi2BSgruMQwjOD00f4ig5SRnIrg9BUnl0IwMrwscmE0qrmcbBOaAzqjB9La
         2gLBvgMcbQ4ip+0Q4iUy12LplpIpH3chm2/iNZb1oVIw7hDgR66t67uwsk1jqDcHx+OJ
         DYjUdlHBO0XCT3wxedzP02SZY4mrRDb3dvZEorNXjqGkkrbsAfJ/xb8CxJQT5rwVdGg0
         Zdtg==
X-Forwarded-Encrypted: i=1; AHgh+RqJfvx623mDmuk/yNbFXFal2w9r2lasYFDxH8AtvsH0FXGGkH7F2zF7JFEyqm+lmYpFMiAzxotDFmFDqw==@lists.infradead.org
X-Gm-Message-State: AFuF++mnF0IYAE4swRZ0De3bEIyPgt0NCZIiz6MkyXP+9SMBn+j0e8h6
	KxO3DuumleWqypKiY5SmxArqE3i+tMt5VHoZm/WUw5wUJL1dFHBuf1oFl35A4qjtGSd6zwuSllm
	4AxAI3Q==
X-Received: from pfwy20.prod.google.com ([2002:a05:6a00:1c94:b0:845:a3d5:fed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f92:b0:848:2e3c:9955
 with SMTP id d2e1a72fcca58-85371fa599amr18012291b3a.4.1787785524196; Wed, 26
 Aug 2026 16:05:24 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:58 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-8-seanjc@google.com>
Subject: [PATCH 07/20] KVM: selftests: Make the single-page allocator APIs
 static inline
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
X-CRM114-CacheID: sfid-20260826_160525_966976_02D9C639 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

Move the single-page allocator APIs to kvm_util.h as inline functions, as
the are trivial wrappers, and unlike __vm_phy_pages_alloc(), are expected
to remain that way for the foreseeable future.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 14 ++++++++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c     | 11 -----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 96c8251c224a..2525c2cacc22 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -990,12 +990,10 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 
 const char *exit_reason_str(unsigned int exit_reason);
 
-gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			   u32 memslot, bool protected);
-gpa_t vm_alloc_page_table(struct kvm_vm *vm);
 
 static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				       gpa_t min_gpa, u32 memslot)
@@ -1009,6 +1007,18 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				    vm_arch_has_protected_memory(vm));
 }
 
+static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
+				      u32 memslot)
+{
+	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
+}
+
+static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
+{
+	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				 vm->memslots[MEM_REGION_PT]);
+}
+
 /*
  * ____vm_create() does KVM_CREATE_VM and little else.  __vm_create() also
  * loads the test binary into guest memory and creates an IRQ chip (x86 only).
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 896da440659e..ce0d8fba4624 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2086,17 +2086,6 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot, protected, false);
 }
 
-gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
-{
-	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
-}
-
-gpa_t vm_alloc_page_table(struct kvm_vm *vm)
-{
-	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				 vm->memslots[MEM_REGION_PT]);
-}
-
 /*
  * Address Guest Virtual to Host Virtual
  *
-- 
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
