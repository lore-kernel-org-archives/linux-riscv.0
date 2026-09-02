Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C22C624DA
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWyYbYQ44Yt35qfVX2nD2hXcNUJVr2ei3aML30svUiI=; b=K8R5SdFNWBPg2u
	krS6045D9+TRJl+OU0Kb1Grf66YNCOVtyZx8q4D6YoCShrNfjmk8LNbaLC+MKH+tEr5erMsPogfCA
	nKso+d6opVXcvlGLKhy6qRxfLQ7/WsVbMFnqeTciQv1j1bpQ9+eJiRd4X4KFkR5e9VTH81oC/bL7A
	fBDliE72rDSvaA/Av9bMo05ggigPNIjvm1jFEAN5j0LtQCUBxJYS4rIdeyZl4AE5nf9TmBVwukLmL
	78y0Hv9/4uh6hH+K6DHuItwQIQc2ZXH7PJz86o0nNp/ZoJc3UWjLCghjRajnUyqb4dLkuHe8E+xIh
	fPOUbkgRtdRqxiT4YYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2Z-0000000FG5l-0EyO;
	Wed, 02 Sep 2026 16:42:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o26-0000000FEph-2vFj
	for linux-riscv@bombadil.infradead.org;
	Wed, 02 Sep 2026 16:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BHZG1y8vqLRAbs9gwwYCsROxfX8BN1ebrpFia3yeMLQ=; b=Ah36noo+dZI28s6Tus//+/FwFH
	iQyfWkkmLF5yCLhZ7aPtZ7fyOT21n8YfJPNLJjuqf434/6PcWIiGYLJjnnj4BISwu/viJYYrH9fsy
	NF8GJblKrBaHq8evA9wxHr4GyaJBSHQ423y20uaVSYuZeBqnNHY1bA/504U/84gkrw371enoa5QKq
	N7hZTlxRw6JVuKCvvJO/4m58Q/yvd1vNFsfORJZ0Vo0uwjSLK3PaPsNqYtlFQI4bW44dWSm2fJ7U8
	moDRHXFZaVBjCyikov7IyJ55T30PCAV384AIQVdyXV9NcBBLg0tswqKbM0dlXFtlU8ykz2gpXHYWE
	XQb4UZhQ==;
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1o23-0000000CDD9-026c
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:53 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-84e1da97175so1682784b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367309; x=1788972109; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BHZG1y8vqLRAbs9gwwYCsROxfX8BN1ebrpFia3yeMLQ=;
        b=uHGJHr8D4hSCmgGaq72/dffj+Xwhk7xjNm+8EDm2zr3IMi+ckF/WPb1wcyQLVP1Qp/
         J6Cq3n4hydsx49RsYTuSyloeeJWvS002iJoYpgAdNZoTcKdXDhxPyB77XnrmTe6kAWdQ
         5OTNszZ6teIBdyYRE8SOP3sYJON0IH86g+Vl6u4QitbRV7InAWnpkvfpEgJSSZLX/IYJ
         1DquqxW2GOtPjhplTZIWdJnMSA1tcC+2kGIvEx/YB5MIjZQd9tartqN/pwZne923c+iO
         jZgLI8bQotthPGFBITDZ+u17qLSh9Os50T1PRn/dIay6KoPNklRS76OaYiQ27hNYBsjL
         bFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367309; x=1788972109;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BHZG1y8vqLRAbs9gwwYCsROxfX8BN1ebrpFia3yeMLQ=;
        b=pkrFt0nawkbPmwBjl0DLi4Y8XwpsIbO4c/xjA6mQBun19qgig+RYpsFuIk9rf+YcT/
         poVFEYfsOsnCZh7f2i5cP3d+gkN/OYsMv7O8HtYXSKalm08B1gKr98fEw4v0pv2Ns5tE
         hnODEmuk+ASkXftfVEEVNRY7pgxjEPuf6VsTsrp9rV3MiEumTOokR7gnpH7EhrBOiLZZ
         D/0EeNJcsKpQkfiHc2g2hIcC8gsjobk537rZ/cWc8vEsXs0iPlCnelSvinN/bROSYXQt
         TIzrxPRjwZKuPjgcd6LKXFwYVS0SNYXmJ/tGMw95eWsINv/FS4qFxzkA/aD7h6UDE+Ym
         C1Mw==
X-Forwarded-Encrypted: i=1; AKwUvBw00Uv/csbMQ6L30e9NXoZl1PHWBLqnhvB9lMtt+xImsSzxxbGfVvMDH1VwBLNWrPQohpoFvVeCmdeLsg==@lists.infradead.org
X-Gm-Message-State: AFuF++lrfD9RAay0qqos/ao+m7inI9u2nkvVqpSf3pxjzJHfiuocxe3s
	5En6PHH+xB5TW3ooE1vIIuRw5j2PHYUAH3F84xqLYIVo6BowSCjZfsAEvFJ4H2BvkNEwZYLZjrY
	Eh0Zwpg==
X-Received: from pfaz23.prod.google.com ([2002:aa7:91d7:0:b0:847:9472:cf8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:e8f:b0:857:72f8:dc91
 with SMTP id d2e1a72fcca58-85ed850a6d7mr9743799b3a.18.1788367308520; Wed, 02
 Sep 2026 09:41:48 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:23 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-21-seanjc@google.com>
Subject: [PATCH v2 20/20] KVM: selftests: Add arch hook to force page tables
 to be naturally aligned
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
X-CRM114-CacheID: sfid-20260902_174151_112463_E489ABF6 
X-CRM114-Status: GOOD (  11.48  )
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
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 43b49d0ad4eb..89b4fc2af751 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1052,6 +1052,8 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 
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
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
