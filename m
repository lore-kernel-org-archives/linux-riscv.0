Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBD9EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIR4sqIFbBm/x1uOeUN24698k+wwndRj1Bjpn9lY/i8=; b=W85S+BENaDV5hq
	akdobdZPoLcU/CFbCUUIQ33x3XaOVslw7HMOVzng/TRW7Cw00GstBkojjyE5P+8Ut/iWFk0xtugix
	efAFggTUIvLoxJY/eIBMuldWReZozb2kcbUV/18NCnA6IB3YglA7LbT6QbKBHbBLX2HcD+5XRA6P3
	QoQwo/rR1k9hPjMWU0VAGs5TqzRpUa8IjOj3H62g+0xz1/0+MZUqWkyaOOaWqywt2wj3BP+fgzj3g
	z339C6VDbf/GonzBC3HVRgZKJZ4s00HSFCl6FTGy/JyO03sDe2yY08gf7/p89isUrfltGGJvXBfm0
	zQwLz+hLniA7ZlNRYyhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzd2-005F1h-1m;
	Wed, 19 Jul 2023 05:21:36 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbU-005Dg5-2Z
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JFyfv7cUwdHBFE0lZxkORbobiGr29Mhkt+V0sNgVMXY=; b=e1BSVatyeGubE/w/NxqlITufTg
	o+L9wtpimkFgR60t58CWfgsKVh3p3um+b2BuftLpd8340potDZfWtbqNy8lqZRmLJRnI1relpeNkW
	MpK8Jwquf14OwPTSlQIfnLpKhOAjLuTnkKXcLnBZpRnrlMpMneOSRyeNb/FagvjIt5BBLRmCWYC1t
	Qbm1WvdxRrk6ipbB0qjJCzgV1+oxKMol9dnq6HSjD4jNYvGXr+bLElO8p6+6XW+lD+q+fICcCH4oA
	87qnJlDqIVjetc1Yd5Rul2u3sJersb7p3WVAgqvbddfin3OgVD/GGt5seCVOTDHNit2UAMt+0HL9p
	4h84Dw7Q==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuSM-005QrM-Fp
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:50:16 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-570553a18deso61306727b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724150; x=1692316150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JFyfv7cUwdHBFE0lZxkORbobiGr29Mhkt+V0sNgVMXY=;
        b=abyqbSNyZycbaxPKt18pqhXSJrOGWpP5TwZf2YgbTCjUsbLuck513ndjv+yHxwR2sk
         YXcAtOTCPMJ3ZCgUIBa4jnm/lq2OcsNjwC1Fj6Y07OEgH7SysP/bGP2SB4tR/ecVGcu4
         fEHJP2PX+ioBvlhIrpfr71tiQHQn7HGyc1Vhipg5f5eFk5waSaRXG9UhM9FPVNp/fgfh
         /x7VksYEZ48UwtM7+maBDxgjLxJDpzdBH28sB/wSc3YOlVD/5LGCB8VT/iGIiYNyhqoK
         ufXypH8AMhELepjGdX4TlzxygisepfpxvZFIbAVdyACzx065jg7I/3gO6mWtJGLjx91v
         PwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724150; x=1692316150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFyfv7cUwdHBFE0lZxkORbobiGr29Mhkt+V0sNgVMXY=;
        b=RuXx/OiD/cMMK3IqIEYwMSQSLh9oQcsMfYNI68hj/7xkGUwqLJzHTFu40oXq6Zc9dd
         M9i+hXV7Q1sw1AUjHMS8RBbls0X63IhASkUDJRGAMmnyGSBlV4VZdCTShV7WPi3G9LNF
         7vET72LBE/+MdF0ILg5V6owjASQQcGzxe2vxFVwYDNNxE7UWzvKTByeSQo/fWRICtM7k
         NgRTXzHRLaKH/wqk+hGOCyl3vx/H6EzEiFMyN1XNpPCnZgX9UrWCONw/fyrX0UKX6Yd8
         Toq9z+Hm49aqZcQPyjiCSt+o054w7JFcCLfAhnJm7Fd2YtDLgyPkngkONzPbh0pQreyA
         A9bw==
X-Gm-Message-State: ABy/qLbY0ZMEu9XifDED3TRgOPjzmW1cGz7VxyYP5Efay7h0Jelr0YX2
	ATodhX88ttNLjLqvgEhRU3YEpLPeNUI=
X-Google-Smtp-Source: APBJJlHWr1DY6cVuvCqn9XA/EKnl3Vs3TUUs4H5jlXd8CgpkU85x3MFXTOonALS9aP+w4FK1lG3HeouM/K4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1709:b0:c8d:469a:a749 with SMTP id
 by9-20020a056902170900b00c8d469aa749mr13714ybb.3.1689724150322; Tue, 18 Jul
 2023 16:49:10 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:03 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-21-seanjc@google.com>
Subject: [RFC PATCH v11 20/29] KVM: selftests: Add support for creating
 private memslots
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
X-CRM114-CacheID: sfid-20230719_005014_561127_815E4049 
X-CRM114-Status: GOOD (  16.53  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 16 ++++
 .../testing/selftests/kvm/include/test_util.h |  5 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 85 ++++++++++++-------
 3 files changed, 75 insertions(+), 31 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index d4a9925d6815..f1de6a279561 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -407,6 +407,19 @@ static inline uint64_t vm_get_stat(struct kvm_vm *vm, const char *stat_name)
 }
 
 void vm_create_irqchip(struct kvm_vm *vm);
+static inline int vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,
+					uint64_t flags)
+{
+	struct kvm_create_guest_memfd gmem = {
+		.size = size,
+		.flags = flags,
+	};
+
+	int fd = __vm_ioctl(vm, KVM_CREATE_GUEST_MEMFD, &gmem);
+
+	TEST_ASSERT(fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_GUEST_MEMFD, fd));
+	return fd;
+}
 
 void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 			       uint64_t gpa, uint64_t size, void *hva);
@@ -416,6 +429,9 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	enum vm_mem_backing_src_type src_type,
 	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
 	uint32_t flags);
+void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
+		uint64_t guest_paddr, uint32_t slot, uint64_t npages,
+		uint32_t flags, int gmem_fd, uint64_t gmem_offset);
 
 void vm_mem_region_set_flags(struct kvm_vm *vm, uint32_t slot, uint32_t flags);
 void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa);
diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index a6e9f215ce70..f3088d27f3ce 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -143,6 +143,11 @@ static inline bool backing_src_is_shared(enum vm_mem_backing_src_type t)
 	return vm_mem_backing_src_alias(t)->flag & MAP_SHARED;
 }
 
+static inline bool backing_src_can_be_huge(enum vm_mem_backing_src_type t)
+{
+	return t != VM_MEM_SRC_ANONYMOUS && t != VM_MEM_SRC_SHMEM;
+}
+
 /* Aligns x up to the next multiple of size. Size must be a power of 2. */
 static inline uint64_t align_up(uint64_t x, uint64_t size)
 {
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index c1e4de53d082..b93717e62325 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -664,6 +664,8 @@ static void __vm_mem_region_delete(struct kvm_vm *vm,
 		TEST_ASSERT(!ret, __KVM_SYSCALL_ERROR("munmap()", ret));
 		close(region->fd);
 	}
+	if (region->region.gmem_fd >= 0)
+		close(region->region.gmem_fd);
 
 	free(region);
 }
@@ -865,36 +867,15 @@ void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 		    errno, strerror(errno));
 }
 
-/*
- * VM Userspace Memory Region Add
- *
- * Input Args:
- *   vm - Virtual Machine
- *   src_type - Storage source for this region.
- *              NULL to use anonymous memory.
- *   guest_paddr - Starting guest physical address
- *   slot - KVM region slot
- *   npages - Number of physical pages
- *   flags - KVM memory region flags (e.g. KVM_MEM_LOG_DIRTY_PAGES)
- *
- * Output Args: None
- *
- * Return: None
- *
- * Allocates a memory area of the number of pages specified by npages
- * and maps it to the VM specified by vm, at a starting physical address
- * given by guest_paddr.  The region is created with a KVM region slot
- * given by slot, which must be unique and < KVM_MEM_SLOTS_NUM.  The
- * region is created with the flags given by flags.
- */
-void vm_userspace_mem_region_add(struct kvm_vm *vm,
-	enum vm_mem_backing_src_type src_type,
-	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
-	uint32_t flags)
+/* FIXME: This thing needs to be ripped apart and rewritten. */
+void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
+		uint64_t guest_paddr, uint32_t slot, uint64_t npages,
+		uint32_t flags, int gmem_fd, uint64_t gmem_offset)
 {
 	int ret;
 	struct userspace_mem_region *region;
 	size_t backing_src_pagesz = get_backing_src_pagesz(src_type);
+	size_t mem_size = npages * vm->page_size;
 	size_t alignment;
 
 	TEST_ASSERT(vm_adjust_num_guest_pages(vm->mode, npages) == npages,
@@ -947,7 +928,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	/* Allocate and initialize new mem region structure. */
 	region = calloc(1, sizeof(*region));
 	TEST_ASSERT(region != NULL, "Insufficient Memory");
-	region->mmap_size = npages * vm->page_size;
+	region->mmap_size = mem_size;
 
 #ifdef __s390x__
 	/* On s390x, the host address must be aligned to 1M (due to PGSTEs) */
@@ -994,14 +975,47 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	/* As needed perform madvise */
 	if ((src_type == VM_MEM_SRC_ANONYMOUS ||
 	     src_type == VM_MEM_SRC_ANONYMOUS_THP) && thp_configured()) {
-		ret = madvise(region->host_mem, npages * vm->page_size,
+		ret = madvise(region->host_mem, mem_size,
 			      src_type == VM_MEM_SRC_ANONYMOUS ? MADV_NOHUGEPAGE : MADV_HUGEPAGE);
 		TEST_ASSERT(ret == 0, "madvise failed, addr: %p length: 0x%lx src_type: %s",
-			    region->host_mem, npages * vm->page_size,
+			    region->host_mem, mem_size,
 			    vm_mem_backing_src_alias(src_type)->name);
 	}
 
 	region->backing_src_type = src_type;
+
+	if (flags & KVM_MEM_PRIVATE) {
+		if (gmem_fd < 0) {
+			uint32_t gmem_flags = 0;
+
+			/*
+			 * Allow hugepages for the guest memfd backing if the
+			 * "normal" backing is allowed/required to be huge.
+			 */
+			if (src_type != VM_MEM_SRC_ANONYMOUS &&
+			    src_type != VM_MEM_SRC_SHMEM)
+				gmem_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
+
+			TEST_ASSERT(!gmem_offset,
+				    "Offset must be zero when creating new guest_memfd");
+			gmem_fd = vm_create_guest_memfd(vm, mem_size, gmem_flags);
+		} else {
+			/*
+			 * Install a unique fd for each memslot so that the fd
+			 * can be closed when the region is deleted without
+			 * needing to track if the fd is owned by the framework
+			 * or by the caller.
+			 */
+			gmem_fd = dup(gmem_fd);
+			TEST_ASSERT(gmem_fd >= 0, __KVM_SYSCALL_ERROR("dup()", gmem_fd));
+		}
+
+		region->region.gmem_fd = gmem_fd;
+		region->region.gmem_offset = gmem_offset;
+	} else {
+		region->region.gmem_fd = -1;
+	}
+
 	region->unused_phy_pages = sparsebit_alloc();
 	sparsebit_set_num(region->unused_phy_pages,
 		guest_paddr >> vm->page_shift, npages);
@@ -1014,9 +1028,10 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL failed,\n"
 		"  rc: %i errno: %i\n"
 		"  slot: %u flags: 0x%x\n"
-		"  guest_phys_addr: 0x%lx size: 0x%lx",
+		"  guest_phys_addr: 0x%lx size: 0x%lx guest_memfd: %d\n",
 		ret, errno, slot, flags,
-		guest_paddr, (uint64_t) region->region.memory_size);
+		guest_paddr, (uint64_t) region->region.memory_size,
+		region->region.gmem_fd);
 
 	/* Add to quick lookup data structures */
 	vm_userspace_mem_region_gpa_insert(&vm->regions.gpa_tree, region);
@@ -1037,6 +1052,14 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	}
 }
 
+void vm_userspace_mem_region_add(struct kvm_vm *vm,
+				 enum vm_mem_backing_src_type src_type,
+				 uint64_t guest_paddr, uint32_t slot,
+				 uint64_t npages, uint32_t flags)
+{
+	vm_mem_add(vm, src_type, guest_paddr, slot, npages, flags, -1, 0);
+}
+
 /*
  * Memslot to region
  *
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
