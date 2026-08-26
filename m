Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98E7C5DF97
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwydoV8x5Np2k39Oj50f7GmbE6NXDHI8M6K1k6c62GU=; b=2Jykjfd6ZAMpJp
	HdUZSDpGTjxw6763KvFH3R6PYqb71SaCgwgbW4zn4YhlBePU/5/0cHkqAtQMmIPoFQZGZuOKbA98V
	8fjGMFnvYCs59C5XaH3rsJ0CY9IkkMkW6qL+7pIYAPXEpJ9qUgNFBk2Em3uPDWfcpQ5ZJZlbnZkM6
	XK2VrDXfdNoBECf/K8GWU37f7znJThEUpFyYDu4a+0jk8RhxzbbqwDjSvcO7l8gsorY8JShGNF6f8
	KCGyfvhKfAFNbtKAvDtOwGiCGwUwrK+IC5Y34UCfBrY6wrdhi3KenB7J2ZpcHeXD+RNn+U54z29R/
	OfjsnJciHNHJ3l1HfJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgJ-0000000365U-3NKE;
	Wed, 26 Aug 2026 23:05:19 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgG-0000000362r-3D6u
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:18 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-848568a6f62so86067b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785515; x=1788390315; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q4+F4DrSTt+i0FxJ84+DMWU3o/oO2URpTpZf4B4dXhQ=;
        b=Fh55Iy5KsJnwxeZg6UtIB4BDKmrLyvQ8PiunPV6ScI/a9bPMLI/SzPdBbJMxBnct2p
         Di+IjPRUIH7ZZsGtcdOLLoaQFzdYoqErKgvPD7aDsnQR0HtJIK5KcV/edGRGruwEXF5O
         kwAczJf1IGvGz+lyeRtpwdE+3xyzlEwwqh1z38pkxjwC6gkJjerKBSU/FSx0OYGgHgk0
         QcaTK9a4S+IEEeS6YUXype2e8qJuoUIPrEQHiuCG+iuz6WJvr/Peu353CfDr/PBcbqVf
         /9MMZln8k0VMd7/EeWE1Jez1XaQLAoH5azoEnT+5x1hnZq4P7TFMv0KstcLEfeTKG5+O
         +O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785515; x=1788390315;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4+F4DrSTt+i0FxJ84+DMWU3o/oO2URpTpZf4B4dXhQ=;
        b=PAkJzLV2qNI2g/bE710XU2sFSG/4ZdUM5F+S8ChvHlxmz1u6NzCfyckUREvkrKEWkG
         JY++EywZT2pu7qGl87FY7NRso6O/VnsLEXhl5Ip//bZzUJaXJKHayqGu9JVggOdHuC/J
         S8tyJR0Xp6AYmZXbj+K/iU+MaldFWPchXSV5n8vJLcg/yqilxa+T6Gs8hVhZUa6RqoDR
         4lvoW9xpbAn7a75KqtIv7SzO6aOcO1jQW0nw4eAZsIKo8JTQd6fOwG6aLFmIKfpHCawA
         2C03aPt/HYX3b69XOI83REPkCr96U/QCfpXt7UJPax4oiQYEdz6/vh3bUnv2hY4xSb4S
         79kg==
X-Forwarded-Encrypted: i=1; AHgh+RpU1TtHmRR5UHn9feoubqvrA+xD0lOAYtbAoUsbJi94ntqBhsH27ioOzi5IWvnM8LA3i5EbJQ2jUgnTqA==@lists.infradead.org
X-Gm-Message-State: AFuF++meVTouQxwifQLYu4chlNW5aT89gXRSTwwJFwYgKCyq7OFMNCCr
	WP+U11SEtVIq407zXGjrefhjBlKVQVSGBvKpV7igCzjg96IAEgTLIBS9TSZhZNZzhzeEMt0Qzk5
	HVM7M1w==
X-Received: from pfpk15.prod.google.com ([2002:aa7:9d0f:0:b0:848:2e0e:62e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:c96:b0:845:ce5f:c926
 with SMTP id d2e1a72fcca58-85372ea6666mr19057054b3a.1.1787785515178; Wed, 26
 Aug 2026 16:05:15 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:52 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-2-seanjc@google.com>
Subject: [PATCH 01/20] KVM: selftests: Use MEM_REGION_PT memslot instead of
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
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160516_806280_73B98764 
X-CRM114-Status: UNSURE (   9.05  )
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
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
