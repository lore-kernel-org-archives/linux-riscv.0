Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1294EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9gpMyy/TX0KeqmiFGIuvNbOSfd9PKj1rpqPOjvxZJY=; b=xSzGnZ8WYSW9xu
	ht158uNG0rziovUiQvtneeeay7jzSB6+piG+SF9G97CaIfPQAKGIgJxWQ83BB4IvNxc2lM9Lfexdt
	9jcd2j2XwZi9CdFNPB3jhSalIgmgQLODGGx7BuPdNm5tqPgA4R+8CRwj0dPQN0Q02a8rZ9Ky1myYL
	qLI5iVyTH50Uxst9JZ6VH5XOxIwNSEJpLwJknK/xU0zwLRuzBLwCDsk6yyyAXNNtGacjvj45elON9
	13Q2I16e5SJQBoMN/jQCf1kwQ9YjhbN0LpoC3p4bI6wvFrVotMLWgS21adffCjWaU0/WuTYgQ6O4z
	FzbpPlUqMU8sssgOsOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzc0-005EGH-0T;
	Wed, 19 Jul 2023 05:20:32 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbM-005Dg5-0l
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=v06h+ALMtOOYf7fX/Ew5y3Hfc7UGMHCjlt3bjyKHsv0=; b=OMqvvkyY25RBNZK4RhJYy5t0TL
	CCAGkypFayW//ACRUPni0xJgtRV8fBbbDGXwVnhFmOwU5jEvqqBi6yxAE86N9Yd7TZMUtEzI7jzFq
	9YMWBVgsxdWBXv6f14R3BNNSj0q4+Lw0Qv0YHuzvXgGKNvQ8Oe6sIZ74XesFLQuLVW+chjn36Q8qx
	XuTxmsIr2snXJ1is3wjWjYneIFa7WLc3M85X8t/zUC0Qt/C5WVH507a8rS0q0KviC9WPumFAu8sz/
	ClZF2w2RgABA7WI/KhfTL9f4Joz3txsbwRV5JyytsFmjtET5UJJX8STlRYwi9i9qKvXMxU9XUzfS1
	g3NXtANg==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuSW-005Qx5-5X
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:50:27 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-573cacf4804so55413247b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724161; x=1692316161;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=v06h+ALMtOOYf7fX/Ew5y3Hfc7UGMHCjlt3bjyKHsv0=;
        b=YRRA1+3rdyppDplfs3XH3aJvhxtsAMd7YC9o1tjP/IyjupywaQyvKq+rps81DQn6n1
         IfT/9T8MBfb/05cpg+uFjPqU9WMKZxQ9fzOPBnRI+m2vIHPLSV2s/3KQGxo5DIXUHwOZ
         GdmSnQGPnvE14OEYqjCx4Fm+ABerxK8mDpsKlW+8NItJ+M4Kcnqzj3n4Y+k+3R/C1UBu
         wvL5E8Pm7bjCuwRxFwoKwRUML3nMWrNZ+3vwOtoXEZiYJEJR64OEqgs5nwKpwCN2Ct+r
         TXr64pWKwZcTWMIuNy53NUZP6UdwEiJkjqYQFxPcJ5UQJleLQ7qGIFzyDTx8Cn3NQNJC
         aywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724161; x=1692316161;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v06h+ALMtOOYf7fX/Ew5y3Hfc7UGMHCjlt3bjyKHsv0=;
        b=PrY6y2larIA//ezvjeaIqv9qQRNSs1Acs7b8lYPMArb8Km3mAxQIIxP3xyo31VpnTM
         31HBbXwygTWdQiw0Ou4TIph7ZMd/DgzZMK+AI/UfyzEhKwBy7jdaAp8sEfG8MYKm3BNd
         siwL6upwnBcKCHNpsutEwoU4ctuwYd+V8sAvOSD1aEmz23FpK7zJNmwxySq5SHnSg2q1
         sRPpsV9JtVAUSOUP0PupiymQIzAhXg4lpMjbD9CH9v7XQF5KTits9WtTJ7S5J60DAo+d
         DGovV2pmP4KzZpt7qtIkurgT1QO1dQY4/EZWixdsLOXQPAzBpE3iz7MBXuWdReF0VUH8
         6Uog==
X-Gm-Message-State: ABy/qLbsIXmmBWvwZR48YgpyOwRztPd3hefomrVYtOBRLtj2Skas7Rh0
	IODqVvkn59C7gLV/VG5R55NkCr/oP9s=
X-Google-Smtp-Source: APBJJlHpdLxbHGSEDlhfQMIka8AkYqbvfykkp39Gd8+LzOAP/g6chkA545wiuNlxw+N3wiN86qnMnz3hgbE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b306:0:b0:56c:fce1:7d8d with SMTP id
 r6-20020a81b306000000b0056cfce17d8dmr185110ywh.6.1689724161668; Tue, 18 Jul
 2023 16:49:21 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:09 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-27-seanjc@google.com>
Subject: [RFC PATCH v11 26/29] KVM: selftests: Add KVM_SET_USER_MEMORY_REGION2 helper
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
X-CRM114-CacheID: sfid-20230719_005024_231826_2BE9F1F4 
X-CRM114-Status: UNSURE (   8.33  )
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

From: Chao Peng <chao.p.peng@linux.intel.com>

Provide a raw version as well as an assert-success version to reduce
the amount of boilerplate code need for basic usage.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  7 +++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 29 +++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 856440294013..334df27a6f43 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -492,6 +492,13 @@ void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 			       uint64_t gpa, uint64_t size, void *hva);
 int __vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 				uint64_t gpa, uint64_t size, void *hva);
+void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot,
+				uint32_t flags, uint64_t gpa, uint64_t size,
+				void *hva, uint32_t gmem_fd, uint64_t gmem_offset);
+int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot,
+				 uint32_t flags, uint64_t gpa, uint64_t size,
+				 void *hva, uint32_t gmem_fd, uint64_t gmem_offset);
+
 void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	enum vm_mem_backing_src_type src_type,
 	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 64221c320389..f7b8b5eb3e8f 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -868,6 +868,35 @@ void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 		    errno, strerror(errno));
 }
 
+int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot,
+				 uint32_t flags, uint64_t gpa, uint64_t size,
+				 void *hva, uint32_t gmem_fd, uint64_t gmem_offset)
+{
+	struct kvm_userspace_memory_region2 region = {
+		.slot = slot,
+		.flags = flags,
+		.guest_phys_addr = gpa,
+		.memory_size = size,
+		.userspace_addr = (uintptr_t)hva,
+		.gmem_fd = gmem_fd,
+		.gmem_offset = gmem_offset,
+	};
+
+	return ioctl(vm->fd, KVM_SET_USER_MEMORY_REGION2, &region);
+}
+
+void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot,
+				uint32_t flags, uint64_t gpa, uint64_t size,
+				void *hva, uint32_t gmem_fd, uint64_t gmem_offset)
+{
+	int ret = __vm_set_user_memory_region2(vm, slot, flags, gpa, size, hva,
+					       gmem_fd, gmem_offset);
+
+	TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed, errno = %d (%s)",
+		    errno, strerror(errno));
+}
+
+
 /* FIXME: This thing needs to be ripped apart and rewritten. */
 void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		uint64_t guest_paddr, uint32_t slot, uint64_t npages,
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
