Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47953EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aA6DIc9qMfUauH5JN+pHQl862x5S8EbHG8AT4NqRsZs=; b=1gMc1h6pEX+mZP
	kc/KT29m33oOkk62oHth2neGkP81KT23nSq66/kfZoZMHrMhRmGMCfQqEzE/VTc5RQ3Smu/tjZ1Vb
	k3mAgJybTocNN4NXmN1GdF8AGcDLSnUhDTZAulUMHu9jmNWnyynNi1YJkHXUqMiixSU3GhYpCstPL
	8Q9oBPu+teTvAQykTtWHiNCxkiAoi3qQ6NRK1zRwu3++yHxUniieMZ5/tSgsNbgiPjRlgBn9Mzjh8
	u8NhTah++XC+l4ZPlzWCaM1hqy82qG+8am+JW68nz/aIavCBrly9ym68Xh7XDpcAP8zUvaL2klQff
	qWcspvalfgxYL23tNMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbi-005E1K-2T;
	Wed, 19 Jul 2023 05:20:14 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbK-005Dg5-1g
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rKvKKloUVvRbyK7Yz9l+FaUDBRsuXKkZHJmkKN7bi2Y=; b=Vb4c+0nhp/NXYcX3yA5OKHVT5Y
	zAOGqhWUlTKryCsfVFmqLuuNv84Ar34fYmCBqodkzILfzf/2EH17Ar9tpNAIkEFxutDbj9cq+Rgkr
	N7Anm/+wHjw/eLBIR2JZy576QF5ox5RMFPK9LYl/1J+J5exMDHWvjDX8udYuUd3tXr0DsGeTEu6Cb
	Y0ltX1RIRzsEtQcr6hjLlWObcvqeyyJCBRwxR5EDacrtbSW/BYISKOj/TeGTHDWxC4IwpEXyThX3R
	CPo1X2WqIm4TkFPh1tsEbSkS1OZSRYMV4ajoLHoPog7RBTTJJjbSVL5H2cjiq/Ov3h25w6BAmRkLT
	a64FYjXQ==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuSZ-005Qz8-KL
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:50:29 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b8a7735231so33091595ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724163; x=1692316163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rKvKKloUVvRbyK7Yz9l+FaUDBRsuXKkZHJmkKN7bi2Y=;
        b=EcELT5GqQbnbtfycTUnPewJaz2g/HV9AKkO3JNwzTK5uuMisxIn1WXx7YTmbjsQ+XX
         SDXAGUMBTiOn2FUH3qvEgk9rfsh+jdvFnBl1T8a1rL9ik/6x/Jikv7649Is1PpM4BQ17
         UtlDaSpo7OWPyOfIwkwyTxKFboN5htIa080od6JiwJUwpVFyOuq3uvwYJALuMoIA26MB
         r8Co4xPfs/9EJrO92UTiJyXzb+Jvnd6fmIjfIYKkVG9a/mBtJLUwQ6N3rJdy7g4z22zt
         Ygw1MQq7binRXHRVL1uS1Skbzt/nZzsALBROODqMohefttmXusLD/6T0/f1hYzjMb7FW
         vGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724163; x=1692316163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKvKKloUVvRbyK7Yz9l+FaUDBRsuXKkZHJmkKN7bi2Y=;
        b=E47POh/ocDN/M/isExc4HGn8OmZ0Mv4Iy0ilRSCIqWDm+49JSHZgqVIlP8W+3D+Quo
         sHya9W6u/AjGPT3C7nUpZy8jJBNyXZSNu4YZzO770IcAY49tctKygh4akCw/h58cQuuT
         ZdGkbl0iQ/ThConlEe8srGgsCRFPg3+xcw08Ld8ZuSaX3MwSJ9c7CB6p2j/7CHXIr/4P
         O3Dx0VRI1qSTpU21mDiGYaiH965QvpkWN5U0Q0taQ7mBTbCIcnyBX067MItXuGI6Z9zu
         c10S81gKi0ZxMb8EK2AzR1+IKieF9ATgco9QNbOa1iE56mlP0lzDPbyREAbiANiGcNZF
         rOTQ==
X-Gm-Message-State: ABy/qLZVjKDvCCOIIDfX4HemwIZPc0eaa7BqiNqG/ItVLHDSN1JzZ7tL
	raTXvVMobnrkoj3qa6EjV78BGSdOpFk=
X-Google-Smtp-Source: APBJJlFbJO/Hk1I/Rl2qqMZ4yuUcIy3+1AWTLJTDX9bCulv0CF4luI/t69zZ9PixxI+uL49XmU3+g1rdNDk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ec8c:b0:1b8:95fc:d0f with SMTP id
 x12-20020a170902ec8c00b001b895fc0d0fmr7824plg.7.1689724163589; Tue, 18 Jul
 2023 16:49:23 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:10 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-28-seanjc@google.com>
Subject: [RFC PATCH v11 27/29] KVM: selftests: Expand set_memory_region_test
 to validate guest_memfd()
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
X-CRM114-CacheID: sfid-20230719_005027_674710_C84E5ABC 
X-CRM114-Status: GOOD (  12.99  )
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

From: Chao Peng <chao.p.peng@linux.intel.com>

Expand set_memory_region_test to exercise various positive and negative
testcases for private memory.

 - Non-guest_memfd() file descriptor for private memory
 - guest_memfd() from different VM
 - Overlapping bindings
 - Unaligned bindings

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
[sean: trim the testcases to remove duplicate coverage]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 10 ++
 .../selftests/kvm/set_memory_region_test.c    | 99 +++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 334df27a6f43..39b38c75b99c 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -789,6 +789,16 @@ static inline struct kvm_vm *vm_create_barebones(void)
 	return ____vm_create(VM_SHAPE_DEFAULT);
 }
 
+static inline struct kvm_vm *vm_create_barebones_protected_vm(void)
+{
+	const struct vm_shape shape = {
+		.mode = VM_MODE_DEFAULT,
+		.type = KVM_X86_SW_PROTECTED_VM,
+	};
+
+	return ____vm_create(shape);
+}
+
 static inline struct kvm_vm *vm_create(uint32_t nr_runnable_vcpus)
 {
 	return __vm_create(VM_SHAPE_DEFAULT, nr_runnable_vcpus, 0);
diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index a849ce23ca97..ca2ca6947376 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -382,6 +382,98 @@ static void test_add_max_memory_regions(void)
 	kvm_vm_free(vm);
 }
 
+
+static void test_invalid_guest_memfd(struct kvm_vm *vm, int memfd,
+				     size_t offset, const char *msg)
+{
+	int r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+					     MEM_REGION_GPA, MEM_REGION_SIZE,
+					     0, memfd, offset);
+	TEST_ASSERT(r == -1 && errno == EINVAL, "%s", msg);
+}
+
+static void test_add_private_memory_region(void)
+{
+	struct kvm_vm *vm, *vm2;
+	int memfd, i;
+
+	pr_info("Testing ADD of KVM_MEM_PRIVATE memory regions\n");
+
+	vm = vm_create_barebones_protected_vm();
+
+	test_invalid_guest_memfd(vm, vm->kvm_fd, 0, "KVM fd should fail");
+	test_invalid_guest_memfd(vm, vm->fd, 0, "VM's fd should fail");
+
+	memfd = kvm_memfd_alloc(MEM_REGION_SIZE, false);
+	test_invalid_guest_memfd(vm, vm->fd, 0, "Regular memfd() should fail");
+	close(memfd);
+
+	vm2 = vm_create_barebones_protected_vm();
+	memfd = vm_create_guest_memfd(vm2, MEM_REGION_SIZE, 0);
+	test_invalid_guest_memfd(vm, memfd, 0, "Other VM's guest_memfd() should fail");
+
+	vm_set_user_memory_region2(vm2, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+	close(memfd);
+	kvm_vm_free(vm2);
+
+	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE, 0);
+	for (i = 1; i < PAGE_SIZE; i++)
+		test_invalid_guest_memfd(vm, memfd, i, "Unaligned offset should fail");
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+	close(memfd);
+
+	kvm_vm_free(vm);
+}
+
+static void test_add_overlapping_private_memory_regions(void)
+{
+	struct kvm_vm *vm;
+	int memfd;
+	int r;
+
+	pr_info("Testing ADD of overlapping KVM_MEM_PRIVATE memory regions\n");
+
+	vm = vm_create_barebones_protected_vm();
+
+	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE * 4, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+				   MEM_REGION_GPA, MEM_REGION_SIZE * 2, 0, memfd, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT + 1, KVM_MEM_PRIVATE,
+				   MEM_REGION_GPA * 2, MEM_REGION_SIZE * 2,
+				   0, memfd, MEM_REGION_SIZE * 2);
+
+	/*
+	 * Delete the first memslot, and then attempt to recreate it except
+	 * with a "bad" offset that results in overlap in the guest_memfd().
+	 */
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+				   MEM_REGION_GPA, 0, NULL, -1, 0);
+
+	/* Overlap the front half of the other slot. */
+	r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+					 MEM_REGION_GPA * 2 - MEM_REGION_SIZE,
+					 MEM_REGION_SIZE * 2,
+					 0, memfd, 0);
+	TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
+		    "Overlapping guest_memfd() bindings should fail with EEXIST");
+
+	/* And now the back half of the other slot. */
+	r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+					 MEM_REGION_GPA * 2 + MEM_REGION_SIZE,
+					 MEM_REGION_SIZE * 2,
+					 0, memfd, 0);
+	TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
+		    "Overlapping guest_memfd() bindings should fail with EEXIST");
+
+	close(memfd);
+	kvm_vm_free(vm);
+}
+
 int main(int argc, char *argv[])
 {
 #ifdef __x86_64__
@@ -398,6 +490,13 @@ int main(int argc, char *argv[])
 
 	test_add_max_memory_regions();
 
+	if (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM)) {
+		test_add_private_memory_region();
+		test_add_overlapping_private_memory_regions();
+	} else {
+		pr_info("Skipping tests for KVM_MEM_PRIVATE memory regions\n");
+	}
+
 #ifdef __x86_64__
 	if (argc > 1)
 		loops = atoi_positive("Number of iterations", argv[1]);
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
