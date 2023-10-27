Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4822EC25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 20:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BokzSlJsB0z/rIIVuZkScvfgni01Ks7l1LEcEYjsJ4=; b=MF8Xxu6TycIGWk
	zIB4G1AgoV2ZthO7agIF5P1wOqu5lqj3U153Tgz8GqmlfdI8gJ5LnIN9v7IT2EfFrpml6LAPamTUM
	D9H0VqEGSj1s1+KAHZyUVQFtXL0BYa4vBZzJD0NwKzUNA6LsbBcCkjavCqmhzRntNTRo2I+asnxBL
	OLWAnS/dhyWWBoxxJt2XJLGU5JJLsCBauJYpv9j7ATHhblBa3v7uzQMo7ClTcGH4nd9gmIwSva6o/
	fMkaqAM80R9jbiLmOHqVrndAvlpodp5iAPGIExKHzWht9YsBVVpE59Cv5a8ol4un3H/WD8ed85mKO
	RweqO2tUrxZ5ObQBe07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwTiM-00HBcK-2B;
	Fri, 27 Oct 2023 20:45:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUU-00Gxfm-0g
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZNZtzA/linIp+2GMXA1XUg0X+u1GFwKPof82zA2ctug=; b=kXnvvpxlfUZdkPtJjzsVBOK+OH
	O4St1sL+FZKIbneWIiYPQ5RS4PbcHgVdnAFa00F6VPuAADOnGwyPHq8w+6cCbBHvaGSBbNkZnN774
	jVsFSPO7RklD74zeZgED6cEpbnWqThIouIk2k81Bz8cXWvvc+XsoifEuXKEf6dYne1G0iKJAKWXRb
	Q1Pubt8rxREBlNijow9cie1o3X6Mp11ZlHLzLSHLbrlA8s8PJBe9W4VQ4fnh4eZ42sj4EAhZqJ6Xp
	cIvU4Fc41mZxTbISmMnC8olEihKyvGIig4ysyQw1kMf2royz2Tqg/GfsccTMSmgB43Tran6lkr/sV
	tvDyrcZg==;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUN-000um7-0R
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:23:24 +0000
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1caaaa873efso23355015ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430995; x=1699035795; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNZtzA/linIp+2GMXA1XUg0X+u1GFwKPof82zA2ctug=;
        b=jo/iyn+niKrzetnxe8gBbppb1Asmo2d8JiU7xKebr12sOBrpw/SxZKqKrF7eK03z5D
         YZ2CX4EiS4BSnHC7PLSgMa+GeF/CIXpfeF7qHCPh3QjCLXDTrKEYhr5tJLNCOu1nO4Mz
         /xFVcSaw2ahEiKMYxzReywiEbhXLaCkrYvIdy/7kphiHQ2XtSKA4B3l3zqzBh347rZqh
         B+S7LaCA11nsKspRelXUUp/+PwbFRHfF5dA0SQT5cG0j63lrqf+yuP+6oYbClGUgbEkd
         ppUCz6tBcziI9lm1sW5B4Pq4Z2/ZkFnfwdiNUxVjy+aBmtCRYRNxUYZc7+5bcvdgHHvE
         c0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430995; x=1699035795;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNZtzA/linIp+2GMXA1XUg0X+u1GFwKPof82zA2ctug=;
        b=LI8GfP9TmqdG+XMbsPkX5mjYX8kJpXJUAIy1Mno9OAX8pNdM4ksPPEon/N2Uxx5EW7
         ohLgvEVtUQ9xUhwDnW9CDSSm/6k6ClxAeHYmWqaVakjOINw+MiGvnAjisdLFkjPf7hJl
         FzAZOOsVG+rJubZy06Lta0wkStnMlS3yNjehdnLcG0nPdWrS05b8gjYu5z4tp8OYdFDn
         JnP2ppHX4TV33/XC+vpDMZEK1dbmuI5JJYeuM77cNjp2h1T2vMOeLQ8n6cjAe9lzutvV
         DLKpvm8z+zV51RsXTdR0PtpyHuuB2KHeyLFsG9r5U0FpIb0ow+sN1kSKTSIdOtceg5L+
         LjQQ==
X-Gm-Message-State: AOJu0YynM7i0Xb2Wl5Skr24K9Ii/wVNImmfReYuoEUjWMuqd41W7gUH4
	CeudUR4wXqolKq864+NyW3pkD+/N+h0=
X-Google-Smtp-Source: AGHT+IFgEK+vNYv/vNHgA3JkDytYkMCwP8RspbM7NAIhoWJ8dWWtLUmat77zU+/1XadLWoCAT7TkthpzXqU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f809:b0:1cc:2a6f:ab91 with SMTP id
 ix9-20020a170902f80900b001cc2a6fab91mr26127plb.0.1698430994917; Fri, 27 Oct
 2023 11:23:14 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:22:07 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-26-seanjc@google.com>
Subject: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192321_283786_21AE4533 
X-CRM114-Status: GOOD (  11.11  )
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

Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
support for guest private memory can be added without needing an entirely
separate set of helpers.

Note, this obviously makes selftests backwards-incompatible with older KVM
versions from this point forward.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 19 ++++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 967eaaeacd75..9f144841c2ee 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -44,7 +44,7 @@ typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
 typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
 
 struct userspace_mem_region {
-	struct kvm_userspace_memory_region region;
+	struct kvm_userspace_memory_region2 region;
 	struct sparsebit *unused_phy_pages;
 	int fd;
 	off_t offset;
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index f09295d56c23..3676b37bea38 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -453,8 +453,9 @@ void kvm_vm_restart(struct kvm_vm *vmp)
 		vm_create_irqchip(vmp);
 
 	hash_for_each(vmp->regions.slot_hash, ctr, region, slot_node) {
-		int ret = ioctl(vmp->fd, KVM_SET_USER_MEMORY_REGION, &region->region);
-		TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION IOCTL failed,\n"
+		int ret = ioctl(vmp->fd, KVM_SET_USER_MEMORY_REGION2, &region->region);
+
+		TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL failed,\n"
 			    "  rc: %i errno: %i\n"
 			    "  slot: %u flags: 0x%x\n"
 			    "  guest_phys_addr: 0x%llx size: 0x%llx",
@@ -657,7 +658,7 @@ static void __vm_mem_region_delete(struct kvm_vm *vm,
 	}
 
 	region->region.memory_size = 0;
-	vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->region);
+	vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
 
 	sparsebit_free(&region->unused_phy_pages);
 	ret = munmap(region->mmap_start, region->mmap_size);
@@ -1014,8 +1015,8 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	region->region.guest_phys_addr = guest_paddr;
 	region->region.memory_size = npages * vm->page_size;
 	region->region.userspace_addr = (uintptr_t) region->host_mem;
-	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->region);
-	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION IOCTL failed,\n"
+	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
+	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL failed,\n"
 		"  rc: %i errno: %i\n"
 		"  slot: %u flags: 0x%x\n"
 		"  guest_phys_addr: 0x%lx size: 0x%lx",
@@ -1097,9 +1098,9 @@ void vm_mem_region_set_flags(struct kvm_vm *vm, uint32_t slot, uint32_t flags)
 
 	region->region.flags = flags;
 
-	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->region);
+	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
 
-	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION IOCTL failed,\n"
+	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL failed,\n"
 		"  rc: %i errno: %i slot: %u flags: 0x%x",
 		ret, errno, slot, flags);
 }
@@ -1127,9 +1128,9 @@ void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa)
 
 	region->region.guest_phys_addr = new_gpa;
 
-	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->region);
+	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
 
-	TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION failed\n"
+	TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed\n"
 		    "ret: %i errno: %i slot: %u new_gpa: 0x%lx",
 		    ret, errno, slot, new_gpa);
 }
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
