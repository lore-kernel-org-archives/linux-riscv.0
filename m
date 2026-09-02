Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05818C624D6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlEJoUTQ68dzD+uNLfKZujcj86dpLYrcspbZqrn4SFw=; b=KDeDjQ7FKjeJxt
	gjLvvGdljXyuhz5NqIwrYFqJ0RPJUKcQGCtrUBKpovDHC7tmyVzPBWTt9jIBAtA1gYJmQN3cKsHtz
	LVLCvsGfLupCdQFfk0ZXQt+htPKNP1wbuvmZyEY3t/tGAklB3lLUzOduSF/huV5tk2Y7XIfZynpNh
	FopoEMQn1PNyp9Sr0Kpt3XIOrntS+OT5uMqpKQrHNnotOPjn++1xMwJFtaNnSKWSl0Ect2VzZEX7J
	zZS0UJrYsvS6zwJ5tWxyiIIicznaaPK2takndPbDMWqva80CyL3OQFON7L9RddRZnErOjtWqrbp72
	kTIvfTuei2JNH4MCBkSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2B-0000000FF0q-1Lnc;
	Wed, 02 Sep 2026 16:41:59 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1q-0000000FEJo-3yYf
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:43 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cc39363cc88so1111198a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367297; x=1788972097; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nUBJYSRlpoGNr9NmdwArWEE9moAAM62vGLNGWV3DD18=;
        b=VS4WnYGXnVpgevxINkM9hWjH/TgflAHLOyNJa9We+B9MW083zBK1JcUtEpDFWyFa7f
         RcfnKi7xfRTkQtSALE/YHMc6vDnMSqKeQXCww2pTPtWsj3aCr36u1QkLCShvhnQCPy1I
         6Gm7TgNy8FoFkLKxb1vVKGo9bvo7axwQKfrxdaf+emYjlEsXzc3GMxLIlZhLXE92xWU1
         fMRhyWWgTYOGCLDljeXmBCm1HVTDDMDnyTzjMoo5HOAY0b2UDk+zcS/l5zq+H/qA3vI3
         IbJYOXIIrXYWOySze+CEO8uCguQSXMOFaKDSY7AX1dY7i2+ZdRIqTpjCsIoAyXXJ07id
         japw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367297; x=1788972097;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUBJYSRlpoGNr9NmdwArWEE9moAAM62vGLNGWV3DD18=;
        b=HXyDMvP1TucbfuTkx2tPRpOXuNXaEZfbKpjwv9FkHF+Mq0Vhib7+zRLPMWjqTulW2K
         eGxNOmRzoj+gymnAN2E0/W+y0OppMNJEUMxBtWKMjzfOkEdoTEfEAPpHWKrnRnGHyFux
         U7NGzO8lrwME9nNWIIc6Du/hXa6/8HsnbzLK7OYdCVyjyTSK+U0dH8QVHT5Ov60mMxbD
         ZT39x1G5Yui4yTXyo/0E+c8DPl2SVKu295JjjTNUBXEi8O+6MsmIRWM6cE6KUSup5lQB
         G89TzPLnEYRsEjVoPHMvy+Uhfivs0PqkY+Cf+xA1ot6b3y9Lo7vIOxpThNON5Pk2eX5J
         OiEA==
X-Forwarded-Encrypted: i=1; AKwUvBx7czx0kEG7BdKOpts+EbzCaTjCLkvobqTXmLHIqDVU2coE80acw0/4pRqIb66NgGduKj8/eZdnpT+Q0g==@lists.infradead.org
X-Gm-Message-State: AFuF++kkcDMcbXOSekJlOSnXwly1hTToZCAgR632HJMuDe0X1XQbGruv
	KnYJ+VpHtwg+S/5uBAN5O8MGmz2iZeuhisSnQLEBob0zfl/f+Iipn+N3NfwWZE8GHIa9Bmt003+
	jMEh25Q==
X-Received: from pgnd15.prod.google.com ([2002:a63:734f:0:b0:cc4:3a7b:365b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3944:b0:3d3:af85:eb98
 with SMTP id adf61e73a8af0-3d9af3efa11mr10754332637.26.1788367296882; Wed, 02
 Sep 2026 09:41:36 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:13 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-11-seanjc@google.com>
Subject: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate
 multiple page table pages
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
X-CRM114-CacheID: sfid-20260902_094139_035246_FDD80B06 
X-CRM114-Status: UNSURE (   9.77  )
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

Add vm_alloc_page_table_pages() and use it throughout arch code to replace
open coded equivalents.

No functional change intended.

Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h    | 9 +++++++--
 tools/testing/selftests/kvm/lib/arm64/processor.c | 4 +---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 4 +---
 tools/testing/selftests/kvm/lib/s390/processor.c  | 8 ++------
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index d9d39a8894e2..c56f342b16fd 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1013,10 +1013,15 @@ static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
 	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
 }
 
+static inline gpa_t vm_alloc_page_table_pages(struct kvm_vm *vm, size_t nr_pages)
+{
+	return vm_phy_pages_alloc(vm, nr_pages, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				  vm->memslots[MEM_REGION_PT]);
+}
+
 static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
 {
-	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				 vm->memslots[MEM_REGION_PT]);
+	return vm_alloc_page_table_pages(vm, 1);
 }
 
 /*
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 01325bf4d36f..2dcaa2c4a038 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -115,9 +115,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	if (vm->mmu.pgd_created)
 		return;
 
-	vm->mmu.pgd = vm_phy_pages_alloc(vm, nr_pages,
-					 KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-					 vm->memslots[MEM_REGION_PT]);
+	vm->mmu.pgd = vm_alloc_page_table_pages(vm, nr_pages);
 	vm->mmu.pgd_created = true;
 }
 
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..c175dcd14114 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -69,9 +69,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	if (vm->mmu.pgd_created)
 		return;
 
-	vm->mmu.pgd = vm_phy_pages_alloc(vm, nr_pages,
-					 KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-					 vm->memslots[MEM_REGION_PT]);
+	vm->mmu.pgd = vm_alloc_page_table_pages(vm, nr_pages);
 	vm->mmu.pgd_created = true;
 }
 
diff --git a/tools/testing/selftests/kvm/lib/s390/processor.c b/tools/testing/selftests/kvm/lib/s390/processor.c
index fb9dab92d4d1..33f49d743b5f 100644
--- a/tools/testing/selftests/kvm/lib/s390/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390/processor.c
@@ -20,9 +20,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	if (vm->mmu.pgd_created)
 		return;
 
-	gpa = vm_phy_pages_alloc(vm, PAGES_PER_REGION,
-				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				   vm->memslots[MEM_REGION_PT]);
+	gpa = vm_alloc_page_table_pages(vm, PAGES_PER_REGION);
 	memset(addr_gpa2hva(vm, gpa), 0xff, PAGES_PER_REGION * vm->page_size);
 
 	vm->mmu.pgd = gpa;
@@ -38,9 +36,7 @@ static u64 virt_alloc_region(struct kvm_vm *vm, int ri)
 {
 	u64 taddr;
 
-	taddr = vm_phy_pages_alloc(vm,  ri < 4 ? PAGES_PER_REGION : 1,
-				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				   vm->memslots[MEM_REGION_PT]);
+	taddr = vm_alloc_page_table_pages(vm, ri < 4 ? PAGES_PER_REGION : 1);
 	memset(addr_gpa2hva(vm, taddr), 0xff, PAGES_PER_REGION * vm->page_size);
 
 	return (taddr & REGION_ENTRY_ORIGIN)
-- 
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
