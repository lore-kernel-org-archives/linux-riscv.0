Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FCDC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gekXai54iqjM/3mHpvZgPZ385GDRR+JkE1cnl0T3NUo=; b=JoSV5wlM9G/btk
	EoG5SxI4yPA7jifhFf9NlbPhrvuzbb3x4WgQpcsdl4bz9zPnjj4Rjw3haLT1i+xEWk1ggnNCp72Fr
	tEuwTB9S0h9h+UvxpdXFmBV9Xtzjn50ziJ0DN11pTmg/NIHLCq8VtjKvYmK4QIx8OwFVmLdieHcdV
	XvQ/bJP8dbZCQJb5yCLmg6RiRPOgBCpUU72+hsurlp3ZdaEOrm9+XkLyd9pxnCi7UGuMqXhLruCWX
	9/BaD078+vDKiQMuStExcHdlTLPMuA68Mx57zPMBVopynaioKMkuiORJ7ROb/W4D4XeOLJwcPrTqI
	dE6VtRV5Ip1fLFrugb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzcd-005Emj-10;
	Wed, 19 Jul 2023 05:21:11 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbU-005Dg5-0E
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pGQ5gVRuMnBz+jdxpSwzxuVc9EOZlP96OVaeomtmpkk=; b=cdWVn34/ToRzs7yBd1B6GfwD0J
	uFNPH1av18ihHmu86q81uuAnNXtTiac/BrpSypFf1YYR189Ks7s0uXhbO79cYh24iRkI8Yw9EAM/P
	A4nsw96Ga+PbJBO4GD6Vm2tyuz4hatAt3IPLxAFqlYuH19dBAOz3gbPN7UofGAWKjDN8cr3Svvtp+
	6vc1mbzB6TJLE/prtudVgrqVH+oIX2BPIzxnLBZjwiuU42ZDQdqGNICF8IzRFF6ywvwvcnSV+c5Ka
	+CF9gPLSt9TIjwxct/Ff1QnXnMzqeOkuC5zTzi57dtrCzj9WBVm4g4/P7uiKPxdYEd7eghdYCtyjH
	JMnqeGpA==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuSM-005Qrf-Qt
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:50:17 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b8b2a2e720so32166115ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724152; x=1692316152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pGQ5gVRuMnBz+jdxpSwzxuVc9EOZlP96OVaeomtmpkk=;
        b=2IP+YPfxNvjiaW9VMbkPph4zWt8don45lFKbHWgoQYVJCSZxgSAoTrJwRk0xU3bSB/
         sJB5qD3FZVt8Ze6IV9hIaNYVvM6HbxMbldM07upaECnO4CedX1dugCNr5s9x/FmwtvtO
         si2av9K7pfZJ/7gTkPujf/XMubSer7Qe7Hk25O62UufmOcyJqVk+8eCPNK70zpezhYfY
         A9rO9H29+732lNEvb2WPSKb4tVXPWyzzY8EtOEkscIvFTwv6KnE4TjP9uoIgqNV/+oaA
         QzM/AXzRRDUz2a5t+BshOVSOVX+X2P43Bg9zMlMkd6w4tV0d4azrL5OFMA3XvIN7BoSE
         3brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724152; x=1692316152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGQ5gVRuMnBz+jdxpSwzxuVc9EOZlP96OVaeomtmpkk=;
        b=bQ+IQ2TfBHXwpEstJ0mtYBc6y9R8C7zo1qapCbPeL4OFHmY40iWqNJvpD+C3MiDUcy
         nONH191yDA7eEZ6SKupK/2ymGG6PuNm1jPDQ+siX8m6+x6IYbQmEDunMGrVBXu1BffqQ
         Yqycwq5EpAcoSlBvjrgE1pBjnrhg62oHqCwWSBw0h4LHL9tup0lFtaumSO9syTulsyfY
         zs+8vD3qHIJMNtvCkPu+WYgYm1YLhKzocY+EN+QOj+SGcVJkRgwl904wpEeVyo/rVEYO
         Mu3cPDjg7YgFJ7nCtrINJP5G7UJS6buLwbUoPDOBnKCQwTAflxhUxAh/iv7KUdJpbNy9
         7/TA==
X-Gm-Message-State: ABy/qLbStfevenF49KPorvPaNwtkImAC9UKXVt3jkoCDBo+OUnoa/Z2u
	n/hN63JnhOM5doP72jKtU+gudLUp/aE=
X-Google-Smtp-Source: APBJJlGQidXExDXOvSIttpWwi+Oy77zoM8uyPE3vIg+QQ5r0vSYyBiY+n22aaCj4624S2+uneMtj6gNdfj0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e841:b0:1b5:2b14:5f2c with SMTP id
 t1-20020a170902e84100b001b52b145f2cmr6941plg.4.1689724152040; Tue, 18 Jul
 2023 16:49:12 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:04 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-22-seanjc@google.com>
Subject: [RFC PATCH v11 21/29] KVM: selftests: Add helpers to convert guest
 memory b/w private and shared
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
X-CRM114-CacheID: sfid-20230719_005014_896981_CACA3308 
X-CRM114-Status: GOOD (  10.60  )
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

From: Vishal Annapurve <vannapurve@google.com>

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 48 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 26 ++++++++++
 2 files changed, 74 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index f1de6a279561..1819787b773b 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -312,6 +312,54 @@ static inline void vm_enable_cap(struct kvm_vm *vm, uint32_t cap, uint64_t arg0)
 	vm_ioctl(vm, KVM_ENABLE_CAP, &enable_cap);
 }
 
+static inline void vm_set_memory_attributes(struct kvm_vm *vm, uint64_t gpa,
+					    uint64_t size, uint64_t attributes)
+{
+	struct kvm_memory_attributes attr = {
+		.attributes = attributes,
+		.address = gpa,
+		.size = size,
+		.flags = 0,
+	};
+
+	/*
+	 * KVM_SET_MEMORY_ATTRIBUTES overwrites _all_ attributes.  These flows
+	 * need significant enhancements to support multiple attributes.
+	 */
+	TEST_ASSERT(!attributes || attributes == KVM_MEMORY_ATTRIBUTE_PRIVATE,
+		    "Update me to support multiple attributes!");
+
+	vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
+}
+
+
+static inline void vm_mem_set_private(struct kvm_vm *vm, uint64_t gpa,
+				      uint64_t size)
+{
+	vm_set_memory_attributes(vm, gpa, size, KVM_MEMORY_ATTRIBUTE_PRIVATE);
+}
+
+static inline void vm_mem_set_shared(struct kvm_vm *vm, uint64_t gpa,
+				     uint64_t size)
+{
+	vm_set_memory_attributes(vm, gpa, size, 0);
+}
+
+void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t gpa, uint64_t size,
+			    bool punch_hole);
+
+static inline void vm_guest_mem_punch_hole(struct kvm_vm *vm, uint64_t gpa,
+					   uint64_t size)
+{
+	vm_guest_mem_fallocate(vm, gpa, size, true);
+}
+
+static inline void vm_guest_mem_allocate(struct kvm_vm *vm, uint64_t gpa,
+					 uint64_t size)
+{
+	vm_guest_mem_fallocate(vm, gpa, size, false);
+}
+
 void vm_enable_dirty_ring(struct kvm_vm *vm, uint32_t ring_size);
 const char *vm_guest_mode_string(uint32_t i);
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b93717e62325..1283e24b76f1 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1171,6 +1171,32 @@ void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot)
 	__vm_mem_region_delete(vm, memslot2region(vm, slot), true);
 }
 
+void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t gpa, uint64_t size,
+			    bool punch_hole)
+{
+	struct userspace_mem_region *region;
+	uint64_t end = gpa + size - 1;
+	off_t fd_offset;
+	int mode, ret;
+
+	region = userspace_mem_region_find(vm, gpa, gpa);
+	TEST_ASSERT(region && region->region.flags & KVM_MEM_PRIVATE,
+		    "Private memory region not found for GPA 0x%lx", gpa);
+
+	TEST_ASSERT(region == userspace_mem_region_find(vm, end, end),
+		    "fallocate() for guest_memfd must act on a single memslot");
+
+	fd_offset = region->region.gmem_offset +
+		    (gpa - region->region.guest_phys_addr);
+
+	mode = FALLOC_FL_KEEP_SIZE | (punch_hole ? FALLOC_FL_PUNCH_HOLE : 0);
+
+	ret = fallocate(region->region.gmem_fd, mode, fd_offset, size);
+	TEST_ASSERT(!ret, "fallocate() failed to %s at %lx[%lu], fd = %d, mode = %x, offset = %lx\n",
+		     punch_hole ? "punch hole" : "allocate", gpa, size,
+		     region->region.gmem_fd, mode, fd_offset);
+}
+
 /* Returns the size of a vCPU's kvm_run structure. */
 static int vcpu_mmap_sz(void)
 {
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
