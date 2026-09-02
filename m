Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513B8C624D4
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c54n6ko4ZGtOr7SB10LBGhxYZ/Y1bT3F6gp82X8RRwM=; b=n3HYo3GintF+aq
	Gu8g6C4gl3PrfZSF0iWvcxtES7MsdHxuuGCyvtI7lcAI+5LLxDGKYkHzg0316HIzHz7htQ04Dr+yW
	WAxEDD1r3hez0XosjXUHy7lMTCqV/VGJBoIsCuZkPbNcqCp4hFMAEpHNdBiDIzyhbau+seNsbgv0F
	IXdJHATE1XMH56ogXQYBGB5BcgjUD0JOk/fsi9UMFQwPMf87LMVe+zNoeyozBcF9bElb2xmNAYduJ
	CO0xe5GgNtfcOQJ0jTTK94/NLTEfbgotyekB4Ap5nTrHyVbPcQSxCLSpnAlbACJzRuRQpfcR47YbJ
	2by2CtV1mkpmfIKMkePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1u-0000000FEUI-2GLm;
	Wed, 02 Sep 2026 16:41:42 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1m-0000000FE9w-0a7b
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:35 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso2514910a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367292; x=1788972092; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PFS8FckNWR5Ypo1TjtxFOP+XgfwND0gTpHBze+LVvng=;
        b=Lofer9YP61jyT+xNxZ7D9c4/a21Vq8aDe+pyjYMo4ynNi1TdlBPUCR0SSM9nSkxTZ2
         QCZ3+aQDq2FVcJDLbFnqtyhhWsW4fTYmC770QpzstqhKERZ0+HCBK9JDrGVIo4YTmFOS
         Ip8isrCq3OVivIjoNy6ra6odT/B4kksC94PbktnVwZlhd+Vjp0GnvaIhX6DCfGFHhx+F
         0UNeKLMCg+BkJjY0oBYrouzk0gSCx7MLRwZOgn3v3/iJ2x/HqyReHZehew5dTWP/5g+T
         9Er0bkjLqgELDxWYxB7PXh3h8uL5vt/kEi8yhDroMxdYtYaMgOdZWpjP/7lR9/aI7/8A
         xixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367292; x=1788972092;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFS8FckNWR5Ypo1TjtxFOP+XgfwND0gTpHBze+LVvng=;
        b=Uz+Oz5emuoPwha/keSmkrHEbd89GVU1A1J4Qi1oVfEfJXG2XEWsUUPXjRtXRu/Ie82
         Z72hvS8y96EgVqsthJGyNdUf+XsetvgIsBIT9TD9Hakzu7Pw1Glmy0CTYK4dv5SYRwQ1
         ByckX0vYyZmIQAZtkf1IWPMQ2waBcVii2ZKjxI5R4lqd4Cgny84GHEIhsUpOrfSifz60
         C2+liLQOzeNhA1HPdUMqq0PFrcaf0M9fnEhVaZpENwpu8sg67FTVpReyHEC4cMrOGbin
         iu7vCwhRwhtluWFOvmdDT7Hfr5ouUOkG232fZvJ9DDhJPgIVOr1KazIG7YV1FmEV1TNc
         O05Q==
X-Forwarded-Encrypted: i=1; AKwUvBz82lcZJIEnXoYDSdHu1ieIjHeMjDmAR9p5RyXYCujpYZzytmfM8wCSBKZMMeqpXQqxscLFSp4iSVQnxQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nP51UBIrShpQwp98WfWXrqtzQ9yPrsXhKnBmqK0sFE0VazWGpQ
	VIz/cLS+aQnsaH9DBs33rgtW5RM+4ogNRrSR/quB4OtRl1MVHS1ZxzxDDAPsX7IQW9SmlZRPCpF
	wa3nqcQ==
X-Received: from pjmm16.prod.google.com ([2002:a17:90b:5810:b0:383:7b51:b1cd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7cb:b0:396:65dd:4093
 with SMTP id 98e67ed59e1d1-39aee153a7amr7412902a91.14.1788367292151; Wed, 02
 Sep 2026 09:41:32 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:09 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-7-seanjc@google.com>
Subject: [PATCH v2 06/20] KVM: selftests: Extend page allocator to support
 naturally aligned allocations
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
X-CRM114-CacheID: sfid-20260902_094134_253946_84B3DB20 
X-CRM114-Status: GOOD (  11.22  )
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

Extend the page allocator to support naturally aligned allocations, as some
flavors of PowerPC page tables require multiple guest pages per table, and
those tables need to be naturally aligned.

Take care to align the potential base address *inside* the retry loop, i.e.
the base needs to be (re)aligned on every attempt.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h |  2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 13 +++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 95bc0a78d2bc..4732b9528812 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -991,6 +991,8 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 const char *exit_reason_str(unsigned int exit_reason);
 
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
+gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			   u32 memslot, bool protected);
 gpa_t vm_alloc_page_table(struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index bbf6d7684c0c..896da440659e 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -17,6 +17,7 @@
 #include <sys/stat.h>
 #include <time.h>
 #include <unistd.h>
+#include <linux/align.h>
 #include <linux/kernel.h>
 
 #define KVM_UTIL_MIN_PFN	2
@@ -2032,9 +2033,10 @@ const char *exit_reason_str(unsigned int exit_reason)
  *
  * Note, success is guaranteed!
  */
-gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
-			   u32 memslot, bool protected)
+gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+			     u32 memslot, bool protected, bool naturally_aligned)
 {
+	size_t alignment = naturally_aligned ? nr_pages : 1;
 	struct userspace_mem_region *region;
 	sparsebit_idx_t pg, base;
 
@@ -2051,6 +2053,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 
 	base = min_gpa >> vm->page_shift;
 again:
+	base = ALIGN(base, alignment);
 	for (pg = base; pg < base + nr_pages; ++pg) {
 		if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
 			base = sparsebit_next_set(region->unused_phy_pages, pg);
@@ -2077,6 +2080,12 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	__builtin_unreachable();
 }
 
+gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+			   u32 memslot, bool protected)
+{
+	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot, protected, false);
+}
+
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
 {
 	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
-- 
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
