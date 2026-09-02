Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AADC624DB
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyDyaLUOIkZHeXQxCN5gbkzWTy/7D/wrDAXstXWZllI=; b=3UXMO/AEeBQ6Qp
	PX5CM7GmtmNeJtyRQ3mSMqSAPCRVFPcAoyhQF90i/65d0zBFsLt3stSx52k5MN4bWQp/qYBxSnAtS
	Ep1hG1NIBtiQm3z/e3nuWvqtn0PB4BnoGBSd8Nm8v3GI2O9duiNIyO30R4clU9h7q+FIp7dBxEYt8
	K7CEPQaa9ljD1nUl3jfnVFAHNIv9Iq8t6jbONzdyOS+vAaYHbzLHnyuZX7mYb+FQnVBVS+LNj0k79
	JDI5naPFQsYIdx6xbbHdsqBKsl2dQiUtxKj7088uzoV0a/Rgn4WwbgGUt/RI0ADplZ7I1r9dsdMV+
	TFHyg5F8FwZc44OCR0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1k-0000000FE9N-3ejb;
	Wed, 02 Sep 2026 16:41:32 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1g-0000000FE3F-1yA2
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:30 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-84865f326efso631393b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367287; x=1788972087; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d/SeKhrpZbiLYnD0BJegQFxELS2UQb8EJmQMNb/zwWY=;
        b=fZUsoS/WhTaFSZ0RSQNEMahhBnK/DXJ9j4y7u5lYKMec0up/d0fmDwYLYMRIUHrAdc
         6qtOcmsEyknV0+smsMzpU0+Zj1gae60BTRSpiolOZKJ3gcAnHDMXYoe/wmz6aSAr06VI
         vMdyGcXkYpPhbFtmdPBpijFpnXdAP3wHp8iKsD/73hejczDxhjVNFlzU0K4j/lOs9ph7
         XGTVskLHfhMDssmqv0H7hnKvgFcdbgHJ197vGeYk2eZHnfaaPs44zDzL8hMwRrPVbsPE
         HSJZi2o0QykSahSKJTuSMKCQ3++JVg3D/PxdyH4neOhDTdTTyNNhlsRQhl6nkA727jnn
         JK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367287; x=1788972087;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/SeKhrpZbiLYnD0BJegQFxELS2UQb8EJmQMNb/zwWY=;
        b=nYTlVj7jGAp0QTdoMzYKpc3UXTQ/sHhHYBoHUyeMBBL56qKUzfaxPoqY/ueJBCPFgV
         +RYyJotYK5Wha6BXJz6cpnjxPaQBrVmFnuLamWAQQGu+TcdVW5MxGEM42vIzwJeoiHR3
         djgBiPpbVOgPrpVp+QksAES9kYu0+ZsS91kbGdZys/Ix61FydaBtr16TGOKzvY6mZaCY
         eIU/UIuwYi/tBcrAh8eVAc5wnA97hmHhg1ZBMgh2Jj34U3Vj1W8SfAJ04CDeTMyGUMcL
         ix587dPUVJoHoh2s/nAmSqKttfGFqufPF8Y6Ufc5YIwrULdAV/s0iZ5fr31At+03NA8k
         J+kQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtlavmVwXifTSUBRWsejKZEldQp0BO9D0zaC9VTtKEnsPEfrCgAuEojWcVQvyxPR1luAMZnczg+byaRA==@lists.infradead.org
X-Gm-Message-State: AFuF++lleZrGo9QL6/bXTqKpYjcQtbdo+4xhYbL/29HbwycQ3SCCKMIF
	CZUD44Yai3mMpOcJchmAB7Hss0MVzMjFMjWnR85p0mEXkyItS3e4VyTHI8CeA2TBZSNL7NhfHrE
	NN5Fndg==
X-Received: from pffj5-n2.prod.google.com ([2002:a05:6a00:c2c5:20b0:853:9828:ce3b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ad0d:b0:82f:38df:681c
 with SMTP id d2e1a72fcca58-85ed7744a8emr9789737b3a.6.1788367286625; Wed, 02
 Sep 2026 09:41:26 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:05 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-3-seanjc@google.com>
Subject: [PATCH v2 02/20] KVM: selftests: Use the common minimum GPA for page
 tables on LoongArch
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
X-CRM114-CacheID: sfid-20260902_094128_513267_68F7F7B4 
X-CRM114-Status: GOOD (  12.85  )
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

Use the common minimum GPA for page tables (0x180000) on LoongArch instead
of LoongArch's custom minimum of 0x200000, so that LoongArch can use
vm_alloc_page_table() instead of open coding a rough equivalent.  There are
no known reasons why LoongArch can't use a lower, less-aligned minimum.
The more-aligned value was originally selected to support huge pages for
the guest, but that only requires the address of the final allocation to be
aligned, the addresses of page table pages is irrelevant on that front.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/loongarch/processor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/loongarch/processor.c b/tools/testing/selftests/kvm/lib/loongarch/processor.c
index 47bbde3e205a..057a77713542 100644
--- a/tools/testing/selftests/kvm/lib/loongarch/processor.c
+++ b/tools/testing/selftests/kvm/lib/loongarch/processor.c
@@ -9,7 +9,6 @@
 #include "processor.h"
 #include "ucall_common.h"
 
-#define LOONGARCH_PAGE_TABLE_PHYS_MIN		0x200000
 #define LOONGARCH_GUEST_STACK_VADDR_MIN		0x200000
 
 static gpa_t invalid_pgtable[4];
@@ -57,7 +56,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	child = table = 0;
 	for (i = 0; i < vm->mmu.pgtable_levels; i++) {
 		invalid_pgtable[i] = child;
-		table = vm_phy_page_alloc(vm, LOONGARCH_PAGE_TABLE_PHYS_MIN,
+		table = vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
 				vm->memslots[MEM_REGION_PT]);
 		TEST_ASSERT(table, "Fail to allocate page tale at level %d\n", i);
 		virt_set_pgtable(vm, table, child);
-- 
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
