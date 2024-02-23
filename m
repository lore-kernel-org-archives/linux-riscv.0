Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CADC54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TlpRAcTeKaKL34cvq4axdjPn8z7T1T7iYSNwKO9jeA=; b=tid4ShfSAhVT57
	xTiUhlQa65Wsf6TU6hjdoj8TotNTDZ9IxuyH+T87TFpKQc5f3mlY25QcnUrmpCTVF9Fv9ACuvc2FU
	c1tiTjv9PMSdCLXGIY24IW3fZohqdeqCn+xI/R337cluHFD6QRyWi/oLSvEJTJsHbQMDrpPmOiqiy
	um+F7Axg44KN7v6TFlK81jBwiwQj8YUTT+OhslOexO7nd1dZCStKIAGaNviGUOcrhHI/pHZAydntS
	81BF+E/EXjBkzKYHMMqTJ/RO6DFD8LsdBq91Afx9qZbFRiyvCQ0T19Q6oNQ5wswSUCd6t5lBpbYGU
	QdS6YSKNnbg7loYuAgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJgc-00000007En9-0FDP;
	Fri, 23 Feb 2024 00:45:10 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJeh-00000007Doy-22Bm
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:43:17 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dced704f17cso511225276.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 16:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708648989; x=1709253789; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HqrOgwqdeyKlRqEiiRXs7cvS3neUx0UIcneX8OI5QMg=;
        b=4ObXghkZZW5IJN2CO0V3fykZIlPBGC3ejXoEqvjAaJQAVhYV5AOp/gbDb0fUHgEGSG
         KYKOSndE5lmQNB6GuMMAorBLMsjB5uq22Z8DRREP3ooBQ8XqhsOFRx5r/60vGrKG3OVD
         kVwI5vjBNUa/2nsqnOm+Q1vb+7/7t0PsT1OxJbzza6GuCXDh5PsV1LMPXNMvT3uk8kbV
         vLuEQTJ+nbQSY7I3NjB97cQZaHIG0anI7Jru91CnD6zfG300CVuSgGTzfLG45DS+DQgq
         ok2o9cFPI78sUK5xj2xQ9cr9S1TYswCUkJ+IqW26L+YCDA1d6CeUEwYo5Tc2YVGX/URs
         whdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708648989; x=1709253789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqrOgwqdeyKlRqEiiRXs7cvS3neUx0UIcneX8OI5QMg=;
        b=GPrhfTQOgtM5OrkbrXgxwLi3fpKWesz8PthjRJVkNRY7Z8PO155CcLTq2zmHNr9uTc
         l6eUKGu7MsnMJr2IIifsdoaOgMBi0UOIcI4NxHIovVrF8YNo2+Z1lgX+VY7FtRJr0lLU
         aehxeYuavJ2ByHjAKVVLf9KDfER4tIT0SaXnjBeIZzsYCAg2DrYyrdCmdRV1NWxe7lCo
         Qsm/MB6JzYXCkPg+exSFMmlKWYCiGGbIcZGVcZbwhyAiyTgazUiP84x1cXT9m7Pwsh13
         Dci3EbsUmeHJvT8CcPz6MoCah/e/L8o2M0as1Qrhv9n5cb2bGfhMiThRP+De2XthsgSt
         qkDA==
X-Forwarded-Encrypted: i=1; AJvYcCUcaMmGtOTzQ2gUDUQZAE2V/5b16n0jUrvZqoimfkVJfN9Pa73THLKhFT5cTsaIvn03OLGbA1zBYIFcPqf8ni3VfS9DjOPaKYcryGN5jQv7
X-Gm-Message-State: AOJu0YwrW2Nh7yaSBibCeEOLTfSenwvIBJcJmFhd1AGuNwjOdxqYvzgF
	riXkFI5lvJOj6FY3lNDaB2fGtz4bpLlEghxf7i5/Mp7CpiFhPHW9fDTEzMFQYZACb1Xr4ZPa6xv
	Z6Q==
X-Google-Smtp-Source: AGHT+IHAocQThc2nDGuTHCVQAHxE7aFJD+GhXyIt2aJYre2j8M6mtpdSWTf/tdU8cZ1cYJDcvyTMlv2LL8I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:181f:b0:dcc:94b7:a7a3 with SMTP id
 cf31-20020a056902181f00b00dcc94b7a7a3mr21587ybb.12.1708648989306; Thu, 22 Feb
 2024 16:43:09 -0800 (PST)
Date: Thu, 22 Feb 2024 16:42:51 -0800
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223004258.3104051-5-seanjc@google.com>
Subject: [PATCH v9 04/11] KVM: selftests: Add support for allocating/managing
 protected guest memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_164312_297855_F600EFC0 
X-CRM114-Status: GOOD (  14.22  )
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

From: Peter Gonda <pgonda@google.com>

Add support for differentiating between protected (a.k.a. private, a.k.a.
encrypted) memory and normal (a.k.a. shared) memory for VMs that support
protected guest memory, e.g. x86's SEV.  Provide and manage a common
bitmap for tracking whether a given physical page resides in protected
memory, as support for protected memory isn't x86 specific, i.e. adding a
arch hook would be a net negative now, and in the future.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>
cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Tested-by: Carlos Bilbao <carlos.bilbao@amd.com>
Originally-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 25 +++++++++++++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c    | 22 +++++++++++++---
 2 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index d9dc31af2f96..a82149305349 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -46,6 +46,7 @@ typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
 struct userspace_mem_region {
 	struct kvm_userspace_memory_region2 region;
 	struct sparsebit *unused_phy_pages;
+	struct sparsebit *protected_phy_pages;
 	int fd;
 	off_t offset;
 	enum vm_mem_backing_src_type backing_src_type;
@@ -573,6 +574,13 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		uint64_t guest_paddr, uint32_t slot, uint64_t npages,
 		uint32_t flags, int guest_memfd_fd, uint64_t guest_memfd_offset);
 
+#ifndef vm_arch_has_protected_memory
+static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
+{
+	return false;
+}
+#endif
+
 void vm_mem_region_set_flags(struct kvm_vm *vm, uint32_t slot, uint32_t flags);
 void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa);
 void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot);
@@ -836,10 +844,23 @@ const char *exit_reason_str(unsigned int exit_reason);
 
 vm_paddr_t vm_phy_page_alloc(struct kvm_vm *vm, vm_paddr_t paddr_min,
 			     uint32_t memslot);
-vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
-			      vm_paddr_t paddr_min, uint32_t memslot);
+vm_paddr_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
+				vm_paddr_t paddr_min, uint32_t memslot,
+				bool protected);
 vm_paddr_t vm_alloc_page_table(struct kvm_vm *vm);
 
+static inline vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
+					    vm_paddr_t paddr_min, uint32_t memslot)
+{
+	/*
+	 * By default, allocate memory as protected for VMs that support
+	 * protected memory, as the majority of memory for such VMs is
+	 * protected, i.e. using shared memory is effectively opt-in.
+	 */
+	return __vm_phy_pages_alloc(vm, num, paddr_min, memslot,
+				    vm_arch_has_protected_memory(vm));
+}
+
 /*
  * ____vm_create() does KVM_CREATE_VM and little else.  __vm_create() also
  * loads the test binary into guest memory and creates an IRQ chip (x86 only).
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index a53caf81eb87..ea677aa019ef 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -717,6 +717,7 @@ static void __vm_mem_region_delete(struct kvm_vm *vm,
 	vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
 
 	sparsebit_free(&region->unused_phy_pages);
+	sparsebit_free(&region->protected_phy_pages);
 	ret = munmap(region->mmap_start, region->mmap_size);
 	TEST_ASSERT(!ret, __KVM_SYSCALL_ERROR("munmap()", ret));
 	if (region->fd >= 0) {
@@ -1098,6 +1099,8 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	}
 
 	region->unused_phy_pages = sparsebit_alloc();
+	if (vm_arch_has_protected_memory(vm))
+		region->protected_phy_pages = sparsebit_alloc();
 	sparsebit_set_num(region->unused_phy_pages,
 		guest_paddr >> vm->page_shift, npages);
 	region->region.slot = slot;
@@ -1924,6 +1927,10 @@ void vm_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 			region->host_mem);
 		fprintf(stream, "%*sunused_phy_pages: ", indent + 2, "");
 		sparsebit_dump(stream, region->unused_phy_pages, 0);
+		if (region->protected_phy_pages) {
+			fprintf(stream, "%*sprotected_phy_pages: ", indent + 2, "");
+			sparsebit_dump(stream, region->protected_phy_pages, 0);
+		}
 	}
 	fprintf(stream, "%*sMapped Virtual Pages:\n", indent, "");
 	sparsebit_dump(stream, vm->vpages_mapped, indent + 2);
@@ -2025,6 +2032,7 @@ const char *exit_reason_str(unsigned int exit_reason)
  *   num - number of pages
  *   paddr_min - Physical address minimum
  *   memslot - Memory region to allocate page from
+ *   protected - True if the pages will be used as protected/private memory
  *
  * Output Args: None
  *
@@ -2036,8 +2044,9 @@ const char *exit_reason_str(unsigned int exit_reason)
  * and their base address is returned. A TEST_ASSERT failure occurs if
  * not enough pages are available at or above paddr_min.
  */
-vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
-			      vm_paddr_t paddr_min, uint32_t memslot)
+vm_paddr_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
+				vm_paddr_t paddr_min, uint32_t memslot,
+				bool protected)
 {
 	struct userspace_mem_region *region;
 	sparsebit_idx_t pg, base;
@@ -2050,8 +2059,10 @@ vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 		paddr_min, vm->page_size);
 
 	region = memslot2region(vm, memslot);
+	TEST_ASSERT(!protected || region->protected_phy_pages,
+		    "Region doesn't support protected memory");
+
 	base = pg = paddr_min >> vm->page_shift;
-
 	do {
 		for (; pg < base + num; ++pg) {
 			if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
@@ -2070,8 +2081,11 @@ vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 		abort();
 	}
 
-	for (pg = base; pg < base + num; ++pg)
+	for (pg = base; pg < base + num; ++pg) {
 		sparsebit_clear(region->unused_phy_pages, pg);
+		if (protected)
+			sparsebit_set(region->protected_phy_pages, pg);
+	}
 
 	return base * vm->page_size;
 }
-- 
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
