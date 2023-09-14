Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69543EE0203
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAcOAt4+xNiBaIxYNMLkyRFdVgI99maCuAhSvPhHFEk=; b=T1voJqCxdW5nPY
	HVvvzHoVkLlgnpRwIIbyMMRs4ts7BBBJ2sWfhltANVs3GOgwpjpiZVxo2++YbnkRjvosjfq+5bgXr
	hpVWkHbiNfrP08eZKTZ3eWrq/7q3sudME2sBWS7gwDW57HfVqvB3fc2MuHm62Tq7c7OW15jDmuasw
	DnfwCVpwN1QpOtOeUmfauUEjh4Gs+YGOpJbeqJMFXK1H/VXHwL1awMhMDzuJ708pgzydFIjp0d6GC
	N9Ue+ZIppSEQdtYN0+/L2RCKLrwwbbQA5v9m8MOn9LQpG8nqi3iGQbxcN3vNDEGKKDHexikaeSu9B
	1IJK/mxMFnBz02Npo05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbdH-0075zx-0c;
	Thu, 14 Sep 2023 01:59:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbar-0073eS-14
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Sep 2023 01:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yQPra1dQiB3SthC1x0t7SGlDkIN4vOXtCvjVK4W5apc=; b=EOrIgeRU9VMMsbZqgxZx/91nQL
	Coqc9zWnapzh99v3h2SVhI5HENkyfvdh5/I7Z6AKKpnkxJMf+gv+JcVHyqKKju+9svqOgzwRyGKb+
	RHeCk+osqZg6IAoFLMfh43eLwESr9FxTboQ/sJYzdVm5XJQioYCG+kj7I3/utNWDcdLj0qBjYmE4r
	f/OTra/xN2mj1XzQlG/aUA3s0dn2pm+QRxncgEQpIcum1j7f8fsBlp9wudjCbDSFgXI+ueAGOnMzz
	PUBQvIVy8L5Gwa7X1a/5lNWJDah5dJMaPgRe5IX6kMnwtT5qSDAAP9Zq5dTDkUYJaUn/t3Q/9AtCD
	Sn2ikyvQ==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbal-007Tfb-1u
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:31 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-273fa168866so433372a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656586; x=1695261386; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yQPra1dQiB3SthC1x0t7SGlDkIN4vOXtCvjVK4W5apc=;
        b=KeNfnznR6+CMFmBRscO/ai4MK3XoKHYOD2hWm00/iiNlHBCHqAeEQlxJUC+eauu3Lx
         K5c9DPAEHyceapCu2PYfz0pkS+kXI6uuxItdnpfnNcrt0yhxAoNW88tCVrI9XOtsmeSb
         mrHWndd9BI0oB3cAukOrzctJNRgcMgZMCcePbk7iAyGb2Mbmqd+BatO8E9WDoaYH1N+N
         fpxiR1L2GZ6llUPdzhx5arf2IaY+r3EvlK2GxPNXDN8ZxIHyZFc0dgQjnPK//+jMc9sQ
         B95N2vcApbQ6LjI+/UmSjJUvXsWcDUKa8m3knTiXgG73PMxXrtb5H+ddKjg58RX4D5fQ
         3IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656586; x=1695261386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQPra1dQiB3SthC1x0t7SGlDkIN4vOXtCvjVK4W5apc=;
        b=ejjlv/V53ZtUdme31w1K1KZVYgVE6Q4gTnaQqztp35Gdy1rjwyCd6QTjgfLQC4LYRf
         as2xbfiBUMSqLbyIvKgnvLaWR10Wp1TvQ1wBAZC6mAwjn4FmcDr2m9heG84Or0rW3qVe
         7/Agbn8tpXqKz3OIaGFXvqS4uABGxr1sP+QM7/p9cylh+FdGNUMpbH9NR+IZzDZNuO/G
         XynIveAkFQSIWkpVS30blTYI6GSlqvRTIBqQzXIQczLtfUJj7C4EqmGgUZFdDer4QZxH
         i6MRpQhTIZyFLrYixVhjzlW1OR0j0kguHcnQDvdADChx+4fZKSB5CtDBl3FYlRvm0O4x
         dU6w==
X-Gm-Message-State: AOJu0Yx9hMRw4KY9quMhMkord5TdNJXu35QBxrjFB4z8mxLdwOzgDUTF
	W06SlGnu0QAQ9PbyzuIWFzOkSXrXuOU=
X-Google-Smtp-Source: AGHT+IFAHhW5BZGO1uppfpot1pEr0aAhGs0ZmH0MKLDsA+afIocjRRcxvAD33MR5tv+EpN9UJvITdXcpd9o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:da8e:b0:1c0:e87e:52b9 with SMTP id
 j14-20020a170902da8e00b001c0e87e52b9mr204011plx.12.1694656585587; Wed, 13 Sep
 2023 18:56:25 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:23 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-26-seanjc@google.com>
Subject: [RFC PATCH v12 25/33] KVM: selftests: Add helpers to convert guest
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
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025629_441495_4A7FF938 
X-CRM114-Status: GOOD (  11.98  )
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

Add helpers to convert memory between private and shared via KVM's
memory attributes, as well as helpers to free/allocate guest_memfd memory
via fallocate().  Userspace, i.e. tests, is NOT required to do fallocate()
when converting memory, as the attributes are the single source of true.
The fallocate() helpers are provided so that tests can mimic a userspace
that frees private memory on conversion, e.g. to prioritize memory usage
over performance.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 48 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 26 ++++++++++
 2 files changed, 74 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 47ea25f9dc97..a0315503ac3e 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -333,6 +333,54 @@ static inline void vm_enable_cap(struct kvm_vm *vm, uint32_t cap, uint64_t arg0)
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
index 127f44c6c83c..bf2bd5c39a96 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1176,6 +1176,32 @@ void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot)
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
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
