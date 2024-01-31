Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61E9C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 22:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WDNtxB0WY64zzHh2NRgLy+RBLEBWC1u5yHuQchSeGOc=; b=HQXFMlro9sGOxw449Sg4qbwfqo
	4h9Mf620E3FkPEyBZg08+WjJAJidBHWC0AEhW6+Atq5+4bHVEurG/m5xvIh8AlnYsi1Q+rDohBmJI
	Z6YLAtcC1B2tjSNW8JBKBFREp3nbxx6s1tf52006DH+v0+wF974sNRC6UXXhfITVsNxRfQSc40CQr
	MRWe6lf6EC9Oodm3F4Bv+VuDptg4g3NKZTX7oAZyYVB/fT1Jhxm9TPSphuyLB3t1zNDq81Xy8SKVr
	p5zh5nt7bvh2tgFfBkDd+oTeb8b7NezM41TGPEx/JgW0ScuyunWMqJVfeweHsBUYB+ZpJ8AflHqyi
	amcvP3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVJL9-00000005jjM-0qfY;
	Wed, 31 Jan 2024 22:45:55 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVJL5-00000005jhm-2Hnv
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 22:45:53 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc6b9f4a513so414194276.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 14:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706741149; x=1707345949; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LFZR+caDlnxynR006W8r06MBUXUFwhkI/G9N83P84WQ=;
        b=DP24JNA8UPQGWGoKxvvYq9uPrz05bePQ7BsQdJa7XXoiicBlLCm/84kEu63B69S3hl
         hXHSizj39UuY7E4cYbilqX2Aso1pYuv2YtpZCYxVLMjdSWqLJnoPW5S7ym33gomMZ9NN
         2Dah/SAup94VddbzWtlOgvg57ywvv5HHF0nE/3dCpMEUIwgF4Y8vXxZzItSsoWonL4EF
         cqxq9TVhPfphY2dgzG+8BQxO5wQy7oA+Ws7nBs43cQ0TE5nk3fkAgsj/JVWf7PtENoDc
         hmWLkwnsDenzNSMoCZalmuXBhBDSGz4nTb/k7ABd38BeWQ7lxdSglgjf9Qv/8ENFQGxO
         LeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706741149; x=1707345949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFZR+caDlnxynR006W8r06MBUXUFwhkI/G9N83P84WQ=;
        b=slOVVKuq/VRh7HLoMCJHGPuAtXEHk8KDt/YzGY9K/TfqrDY9VWT/0JmRQmOvSI4+XT
         ++5ZOdLJUInVWuXFoA+bjokepQw6WvE/LeEA5yzB0mQ/3Y1AfxXPuX0qJ2tUwS//xrCP
         d08+m+4SCieLdt1FrXKdGYF5k291VrFcqsvJtDtKmT5ub5DUgedJDzcy1grMahrflNRF
         eNZsajdVX7xY3nXZvVC4AEkCGbxseqjhW/DWQP4rACGXLC86AL8vGQ3LyW6sWaaoQmv1
         Buqq7yS2B4iU98kec2Caq2WkZVvl0c9XTlpvIT2TsJ9/e9vrODpxXtdclCkwKiY290NU
         8dDA==
X-Gm-Message-State: AOJu0Yygzwa6q2Bg2TsUIxovcVEWF3DWeocUBLDflPyEilrbGbpLVfsZ
	uUKJyWng2Em1oLk80u//Nz7oM0iTMfWvK4kghBc6EWD0z3uKylNSATie9pp3WaIwy79vdCMHNXX
	24A==
X-Google-Smtp-Source: AGHT+IHbj+iyys3ihZ/6xbW07HHtto50GCqd6T2uQS3vYWtVgZ/I/uUSlscC69aVq4ekwAFGEgKUUC6N6OE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:11c3:b0:dc2:398d:a671 with SMTP id
 n3-20020a05690211c300b00dc2398da671mr827981ybu.10.1706741148737; Wed, 31 Jan
 2024 14:45:48 -0800 (PST)
Date: Wed, 31 Jan 2024 14:45:46 -0800
In-Reply-To: <20231102155111.28821-2-guang.zeng@intel.com>
Mime-Version: 1.0
References: <20231102155111.28821-1-guang.zeng@intel.com> <20231102155111.28821-2-guang.zeng@intel.com>
Message-ID: <ZbrNmoSiufn4RM9K@google.com>
Subject: Re: [RFC PATCH v1 1/8] KVM: selftests: x86: Fix bug in addr_arch_gva2gpa()
From: Sean Christopherson <seanjc@google.com>
To: Zeng Guang <guang.zeng@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_144551_600127_1FC445E2 
X-CRM114-Status: GOOD (  22.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 02, 2023, Zeng Guang wrote:
> Fix the approach to get page map from gva to gpa.
> 
> If gva maps a 4-KByte page, current implementation of addr_arch_gva2gpa()
> will obtain wrong page size and cannot derive correct offset from the guest
> virtual address.
> 
> Meanwhile using HUGEPAGE_MASK(x) to calculate the offset within page
> (1G/2M/4K) mistakenly incorporates the upper part of 64-bit canonical
> linear address. That will work out improper guest physical address if
> translating guest virtual address in supervisor-mode address space.

The "Meanwhile ..." is a huge clue that this should be two separate patches.

> Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> ---
>  tools/testing/selftests/kvm/lib/x86_64/processor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index d8288374078e..9f4b8c47edce 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -293,6 +293,7 @@ uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
>  	if (vm_is_target_pte(pde, level, PG_LEVEL_2M))
>  		return pde;
>  
> +	*level = PG_LEVEL_4K;
>  	return virt_get_pte(vm, pde, vaddr, PG_LEVEL_4K);
>  }
>  
> @@ -496,7 +497,7 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
>  	 * No need for a hugepage mask on the PTE, x86-64 requires the "unused"
>  	 * address bits to be zero.
>  	 */
> -	return PTE_GET_PA(*pte) | (gva & ~HUGEPAGE_MASK(level));
> +	return PTE_GET_PA(*pte) | (gva & (HUGEPAGE_SIZE(level) - 1));

I think I would prefer to "fix" HUGEPAGE_MASK() and drop its incorporation of
PHYSICAL_PAGE_MASK.  Regardless of anyone's personal views on whether or not
PAGE_MASK and HUGEPAGE_MASK should only cover physical address bits, (a) the
_one_ usage of HUGEPAGE_MASK is broken and (b) diverging from the kernel for
something like is a terrible idea, and the kernel does:

	#define PAGE_MASK		(~(PAGE_SIZE-1))
	#define HPAGE_MASK		(~(HPAGE_SIZE - 1))
	#define KVM_HPAGE_MASK(x)	(~(KVM_HPAGE_SIZE(x) - 1))

Luckily, there are barely any users in x86, so I think the entirety of the
conversion is this?

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 0f4792083d01..ef895038c87f 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -352,11 +352,12 @@ static inline unsigned int x86_model(unsigned int eax)
 
 #define PAGE_SHIFT             12
 #define PAGE_SIZE              (1ULL << PAGE_SHIFT)
-#define PAGE_MASK              (~(PAGE_SIZE-1) & PHYSICAL_PAGE_MASK)
+#define PAGE_MASK              (~(PAGE_SIZE-1))
+kvm_static_assert((PHYSICAL_PAGE_MASK & PAGE_MASK) == PHYSICAL_PAGE_MASK);
 
 #define HUGEPAGE_SHIFT(x)      (PAGE_SHIFT + (((x) - 1) * 9))
 #define HUGEPAGE_SIZE(x)       (1UL << HUGEPAGE_SHIFT(x))
-#define HUGEPAGE_MASK(x)       (~(HUGEPAGE_SIZE(x) - 1) & PHYSICAL_PAGE_MASK)
+#define HUGEPAGE_MASK(x)       (~(HUGEPAGE_SIZE(x) - 1))
 
 #define PTE_GET_PA(pte)                ((pte) & PHYSICAL_PAGE_MASK)
 #define PTE_GET_PFN(pte)        (PTE_GET_PA(pte) >> PAGE_SHIFT)
diff --git a/tools/testing/selftests/kvm/x86_64/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86_64/hyperv_tlb_flush.c
index 05b56095cf76..cc5730322072 100644
--- a/tools/testing/selftests/kvm/x86_64/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86_64/hyperv_tlb_flush.c
@@ -623,7 +623,7 @@ int main(int argc, char *argv[])
        for (i = 0; i < NTEST_PAGES; i++) {
                pte = vm_get_page_table_entry(vm, data->test_pages + i * PAGE_SIZE);
                gpa = addr_hva2gpa(vm, pte);
-               __virt_pg_map(vm, gva + PAGE_SIZE * i, gpa & PAGE_MASK, PG_LEVEL_4K);
+               __virt_pg_map(vm, gva + PAGE_SIZE * i, gpa & PHYSICAL_PAGE_MASK, PG_LEVEL_4K);
                data->test_pages_pte[i] = gva + (gpa & ~PAGE_MASK);
        }
 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
