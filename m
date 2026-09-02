Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F6CC624DC
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1WFLwYC7SehYxjk51bsu7AkHmhSxF0cII1qca/IiU8=; b=Ya/jL54nUru4rP
	M9Up4IipXURLb2I76Ehkaq63Hu712lEyZs4HYIjPvyQ/4fTnOVWvgS9oM8sMwSgh5NyxjXZHjlvKm
	aDZDqrkcC+icWZIyCJDh92QtwNR1A9RUGlXX264HYh6r2frLelL0PlTT0BxmK2+9MdFODxUFQa/fl
	2g1C+CDqjePYM+mtWT3UtihoZP99Yto9cIXg6ZVBR/omON1uXwAxXRRoShTpCZ2VS+N+RiJ7kpaUP
	RHJ7ZZGqkMAVRLIMPU65VuGvPbpDhXFRh74wkBSvXmx1iEy28wy9JAoH4zwdVd4vIq4FTpggqbmgI
	jFw6x8RS1gr7/1JxzEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1j-0000000FE6F-0B64;
	Wed, 02 Sep 2026 16:41:31 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1e-0000000FE2B-3ir0
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:28 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2d6f80c76e6so21700505ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367286; x=1788972086; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=377f8tXnWvaciY/JLF+PS/DOVpUUGqN5+0rwp4hwx/U=;
        b=XG7SBFlrsjxKL83XAopai/oXjsmyOGGQOqNoxeVoatc9yYiW9MlU+4+M95HBKTO7K8
         fpxwwv3/KSa0MYx6mXhb+L8W647s4C7bU0zOrH1BMWN85qBx0LZHOd7AXPLmarbgX0ef
         7oaPJMSxgQdENoY06v1oov3v/eu09LzfzYCBBXhRvm5NcDZ5hLl2ncsGOohsiWowAdMe
         tFCuLba2NdlGL76hfz7kxf09DX/fTh/MEPilCjFLlp3n8a1QTR3qtddqtUZ+ke0T3LFz
         /h822KGI34ab+89R8rhbyH6KaQ/URdkWCEOxrho+kWjlW1aVBujhqZlV2aOjQT/naCAd
         sM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367286; x=1788972086;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=377f8tXnWvaciY/JLF+PS/DOVpUUGqN5+0rwp4hwx/U=;
        b=s5/halUufRkox8nN9YBsEbOjLgN0VdGokRG5Bt4MXz85L6Cxr8XiljZosZhCc21MXu
         rfuz7wrk4OdQiRRzIEKeiiwi5dMThJuRA5icqBjlTg+2wVmDCRi9FxnReV46EUm9uPA0
         kPdY8XCTlxIRqQuZjG1CbbMPsTWr27U3VVSyEq33VQcEPGuExS985Q/5eEfO1pbl7SwN
         a/iDhdPZU/bp1krEc4R3A6uz2jW1AGfwkfdS2XPDFlmaNzFrVhY+ZYPG9hgD86ScPRyf
         GkTlZ7t9pVbuF6R+fjDKuEf6w6Y3Fr7K9rDBxBP6Fip3FzNpShnsh3bdi3NB0u+ZFzy/
         QFJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbPZCZLv/Fqk/vdE4bXYb7VPb0CNgdc2Kgq6jH5/BtddEEu9gU6P3P8Hu8zcnt6ToTAYuftIOs5Zjznw==@lists.infradead.org
X-Gm-Message-State: AFuF++nCfO1GPBBZ/TnFjEWZ6bVii6CuVIcc6N5rdh/JGEWIbjUa1G77
	tiAuXsHA9jFjE8iL9KuHrm8rdBKIbOMO0iQBUJdzliBdMzeGw0Fjcl+umVS/Dts1IY9ughyW7Tw
	N8C+5gA==
X-Received: from plru4.prod.google.com ([2002:a17:902:b284:b0:2cc:e407:8fef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf0d:b0:2cf:4339:aaa
 with SMTP id d9443c01a7336-2daec6d8a20mr100626665ad.12.1788367285568; Wed, 02
 Sep 2026 09:41:25 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:04 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-2-seanjc@google.com>
Subject: [PATCH v2 01/20] KVM: selftests: Use MEM_REGION_PT memslot instead of
 '0' for s390 regions/segments
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
X-CRM114-CacheID: sfid-20260902_094126_926661_2DF3D1E2 
X-CRM114-Status: UNSURE (   9.90  )
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

Use MEM_REGION_PT to indirectly specify memslot '0' instead of hardcoding
the memslot in s390's virtual memory allocator, as a first step towards
taking the allocation type instead of the exact, raw memslot in the
physical memory allocator.

Note, the only tests that set MEM_REGION_PT to a memslot other than '0' are
arm64-only, i.e. s390 always uses memslot '0' for page tables.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/s390/processor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/s390/processor.c b/tools/testing/selftests/kvm/lib/s390/processor.c
index a9adb3782b35..fb9dab92d4d1 100644
--- a/tools/testing/selftests/kvm/lib/s390/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390/processor.c
@@ -39,7 +39,8 @@ static u64 virt_alloc_region(struct kvm_vm *vm, int ri)
 	u64 taddr;
 
 	taddr = vm_phy_pages_alloc(vm,  ri < 4 ? PAGES_PER_REGION : 1,
-				   KVM_GUEST_PAGE_TABLE_MIN_PADDR, 0);
+				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				   vm->memslots[MEM_REGION_PT]);
 	memset(addr_gpa2hva(vm, taddr), 0xff, PAGES_PER_REGION * vm->page_size);
 
 	return (taddr & REGION_ENTRY_ORIGIN)
-- 
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
