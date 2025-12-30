Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBE9EE57C6
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTzf5v1LlHIYtQ0Vxkepbl55VK7okSCkigOIXwG0ovU=; b=w8Ho6IlrTOEqck
	M/JzBeYT9qsM2ZJG0E229qV+DCEoDkbAGYEipPaLbpA6zvfWrdslnrmK4ufhOCddBBaOKRVJdZisG
	LqI78ZLa9kvjgjuY+v3/offatX5Q9X5WaG1oZwQFVxi/Y62z+JcG/yEH2dwC5Gc+6KjgnxlDqVO+h
	wIbU1KGM4w32jEW3BuQLX40kgMpqn++P81pGMGf4oQH0HcV9XEr1OjlIq1B+xFc3xiZUoCyrvBTRF
	OpMBmuNKQDd4f+TqQb3lGK7gNBGBqviZnHru1kmfxyMBkmCdoSYxpLJI//KrBdXvUJmZ2NkZgb3de
	ZvhVoUu7KiQemhCMzGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijP-00000005MzR-1EoI;
	Tue, 30 Dec 2025 23:02:23 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaiiz-00000005MgJ-1I6v
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:11 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2a351686c17so115110815ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135716; x=1767740516; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A1x3Jv4hKAWrGgMmMHZE2moCxnL8NNPpEDvW/jENOxU=;
        b=i6bYKEI1mEGv6N6fRZjvs72FE9C/W/9FtuzfO5O/hFR3VGjWIia48gJbfDd90Cb/cy
         ARU6RGcoDImh4q/YODRfu8jYKM/KOG+hRdbxoA0SDFLENeXCcGiiXmqUQJNhu8Tvkg6u
         OLG3qCP+TaMTKP1b+xMNA5UfYnxd57q1WZVoJXs5dkOx0tetb2dPnmme3ihtgeTeDVLn
         UuW/Ed61v65pCR/YNFq3P0LVnpRSaOIkzi5G4pys7iubBQ2W/wgDpq1+3Ed8KDv2EX/K
         gytLnAWUE2A9doly5CdUeQ1yrncfFZ/H4uA5zxx48t2ZfwhsC1LoCFZRCYPeHJFLy/ay
         EyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135716; x=1767740516;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1x3Jv4hKAWrGgMmMHZE2moCxnL8NNPpEDvW/jENOxU=;
        b=Ac6zNfSjY3pc7MccZ0Gg38bIZjHj7GGxA/B3AIOJOYvipgmMDIah//5uVyy3QbMcm8
         Kul9h7aANg2A1yJ7P3OkPY/CFLi68+Hhjizrfd9+xYBBt0Ybjy8vzFxWMBj2TWv2Q9zS
         FCJPbHY0WehophdAvEdNfg28AdKK6asHYxZprGn+jx3Vp/ip52wzIWAmThfIAAsPqjWO
         PaaeWHN8QJB5p1RrOICru4dxoReYiFg3RgrX/GntkaohK2hrpMKETCpOf8M8tfcMpdTH
         RPWy7MjTHhNV7O+PPDT8IfrsgaK1LcR6ZkB5G1w80RfziiMbAFdyx0pEVbburbPeWlwW
         HB5A==
X-Forwarded-Encrypted: i=1; AJvYcCVSj21G8bRQvPBRmYoiLp5AdAIl2xfKLTmfilp011pQ3Ytpb6hitoqz68NW5H43cpck+Wht87seBnK0/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWpHz9CXT7Ls6PZaZ31Wbh+46AtpZil5cSFMBbLPXuBAnV03oj
	tNw08rv603tcKUdOsrXO9DKg+Ovc2lBgDeLim1TgSztDgN1q9CvI9sfovKD5JGZYvD+bBTdoOt8
	iY7j+vw==
X-Google-Smtp-Source: AGHT+IEv+GX7evZLjKnG5+SJTBFZGdYgiJ8sh+9jSGp5VMcqldVrrbZx+5CrciujOKyo6Zq9eBa3EV2km6w=
X-Received: from pjbpm1.prod.google.com ([2002:a17:90b:3c41:b0:34c:2ca6:ff3e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:32d1:b0:293:e12:1bec
 with SMTP id d9443c01a7336-2a2f2229207mr365100115ad.20.1767135715930; Tue, 30
 Dec 2025 15:01:55 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:31 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-3-seanjc@google.com>
Subject: [PATCH v4 02/21] KVM: selftests: Stop passing a memslot to nested_map_memslot()
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
X-CRM114-CacheID: sfid-20251230_150157_341649_E8AF9419 
X-CRM114-Status: GOOD (  13.78  )
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

On x86, KVM selftests use memslot 0 for all the default regions used by
the test infrastructure. This is an implementation detail.
nested_map_memslot() is currently used to map the default regions by
explicitly passing slot 0, which leaks the library implementation into
the caller.

Rename the function to a very verbose
nested_identity_map_default_memslots() to reflect what it actually does.
Add an assertion that only memslot 0 is being used so that the
implementation does not change from under us.

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/vmx.h        |  4 ++--
 tools/testing/selftests/kvm/lib/x86/vmx.c            | 12 ++++++++----
 tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
index 96e2b4c630a9..91916b8aa94b 100644
--- a/tools/testing/selftests/kvm/include/x86/vmx.h
+++ b/tools/testing/selftests/kvm/include/x86/vmx.h
@@ -563,8 +563,8 @@ void nested_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 		   uint64_t nested_paddr, uint64_t paddr);
 void nested_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 		 uint64_t nested_paddr, uint64_t paddr, uint64_t size);
-void nested_map_memslot(struct vmx_pages *vmx, struct kvm_vm *vm,
-			uint32_t memslot);
+void nested_identity_map_default_memslots(struct vmx_pages *vmx,
+					  struct kvm_vm *vm);
 void nested_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
 			    uint64_t addr, uint64_t size);
 bool kvm_cpu_has_ept(void);
diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 29b082a58daa..eec33ec63811 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -494,12 +494,16 @@ void nested_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 /* Prepare an identity extended page table that maps all the
  * physical pages in VM.
  */
-void nested_map_memslot(struct vmx_pages *vmx, struct kvm_vm *vm,
-			uint32_t memslot)
+void nested_identity_map_default_memslots(struct vmx_pages *vmx,
+					  struct kvm_vm *vm)
 {
+	uint32_t s, memslot = 0;
 	sparsebit_idx_t i, last;
-	struct userspace_mem_region *region =
-		memslot2region(vm, memslot);
+	struct userspace_mem_region *region = memslot2region(vm, memslot);
+
+	/* Only memslot 0 is mapped here, ensure it's the only one being used */
+	for (s = 0; s < NR_MEM_REGIONS; s++)
+		TEST_ASSERT_EQ(vm->memslots[s], 0);
 
 	i = (region->region.guest_phys_addr >> vm->page_shift) - 1;
 	last = i + (region->region.memory_size >> vm->page_shift);
diff --git a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c b/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
index 98cb6bdab3e6..aab7333aaef0 100644
--- a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
+++ b/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
@@ -121,7 +121,7 @@ static void test_vmx_dirty_log(bool enable_ept)
 	 */
 	if (enable_ept) {
 		prepare_eptp(vmx, vm);
-		nested_map_memslot(vmx, vm, 0);
+		nested_identity_map_default_memslots(vmx, vm);
 		nested_map(vmx, vm, NESTED_TEST_MEM1, GUEST_TEST_MEM, PAGE_SIZE);
 		nested_map(vmx, vm, NESTED_TEST_MEM2, GUEST_TEST_MEM, PAGE_SIZE);
 	}
-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
