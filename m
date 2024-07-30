Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA0BC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuSB9EN/rExJtW2jHPbCZDlso76zU21sWEDAtpW9kvQ=; b=J9jpZG4esw60pd
	vHuucmD3vJKnnS/N/mEOUS4I77dGQ4j9mYGMB2ItSCWlbs83xF6CelSjmK+UUZpuOtkeM6qRe8J0V
	6GDOE5M4Hb8A8t3cryUUOnlMVynM3aP0kERHD1ABMoPWhO0GJ7Cuc3D44juLszlJ8msS1O7k8iDG5
	wH1UddyjUhVVndm34vUNZ5etiEgf/eHwrEZ1gXXboLRzoQ2liejkxnnetq1y0G0582DdlUWiu5JEr
	q7uBusbaDrdR+a8+IX+aDs9xQc4g9JoZMNQOr4eS4DWuCEas0AmlDcGxuWieqkvLNgHr613ZU4+dT
	Sp9mOBIuH6dA38pGemew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhwQ-0000000EB6R-3a89;
	Tue, 30 Jul 2024 08:10:42 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhwM-0000000EB4i-0Oah;
	Tue, 30 Jul 2024 08:10:39 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2cdadce1a57so2686987a91.2;
        Tue, 30 Jul 2024 01:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722327036; x=1722931836; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/S17o3ryXO92fKPDsd+20QrVlSG6ehQAGuA4AgUnAA=;
        b=bpMD3sfCbnDT0RhXiaganU456awP1FqKdBraLX1RudxNBG78phIUFTI7GX3YwxqhC+
         +cO+m7usz9+GGyEwzCgcCobvxBi5sYzpIKwwElP6sp+DRLXrrpNRBRjLGJC5sDhT67to
         QmhH0b/psyYWPMwiqpyt+rRcoA/oVyrsX6SAwVpGtwfv0nTlkZEO9Nvxi/QxfRwX29h9
         oMLtvT5K2Hb277EefHYL9V6hNszVHsLCUQfxgJr/dMmGLz8aZ/58957cIlXnJLqHWCye
         fE8b1nHnKg7i33DpEqHwDVZ1xGhAL4uXLkdmFCKSnLW6wWKBzhMY8d1z+wCQmtnHXdQk
         1klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722327036; x=1722931836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/S17o3ryXO92fKPDsd+20QrVlSG6ehQAGuA4AgUnAA=;
        b=oQsW/VZeqNq75M9Ze0W5GV5BRylDbKGAX4vjKrZBM3SL3G0b3XRLeYBz9SpjEQ+msL
         q9tUgiyq16qRkfhgizWuvPOEsonbJAPT+r4zDdi6zAYbn6oaIk0CQ+C0ZzP4+AnseKKW
         6JtgXMweiNMmFylPYwTgZp9RD4L1HShISB6rL2MF+9E7UjuOG0PqHKK9mfnMQvTgnJ1z
         PhzVJOfmSye4Oi1+hhGBWg/nyZaVAfLGjVMDsZnZTNmTdx2zW28hUFSytGv9hmyzeDwq
         iUGiMs8Ry5w44lJtHBxgpaFBZnsI+Nqz6UE6KInjQoNd68gVXkPdkEBbE8RKIQSMDWz9
         +iAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnsiA1WxgD7jiKnB45AOQc1f9W3aVd/eBDaEwi9UmNth8N540lgQ3wLVnFH3I8O9rm76I4TA0TZebLXNON2aHSoQMiBrEOH6Ykqq/KAaKkQrcwZjryR6jepAXyTjZOb1u5gaPS6Xu/r+kIH2D4+5N++nXvvvs=
X-Gm-Message-State: AOJu0Yz91ln2E0BfyCrgpwNy+VpPXFF1swObWu6vs7o2KXnkpEsrLQn4
	aCv2g0riLMyxvsqaTOt2kM+wn/FN4gtZOTomkErhqkyz8xYwBJQ1
X-Google-Smtp-Source: AGHT+IHd+8idtSf9No9KXFiHPkFqgsgm8Dqu198TXfzlUpyaNdqot/AMDpkwkaetathdKfNuieqdfQ==
X-Received: by 2002:a17:90b:3a90:b0:2c9:9fdf:f72e with SMTP id 98e67ed59e1d1-2cf7e606d04mr8262857a91.26.1722327036447;
        Tue, 30 Jul 2024 01:10:36 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28e3cbaasm9886868a91.51.2024.07.30.01.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 01:10:35 -0700 (PDT)
Message-ID: <c2accb5d-33f6-404b-9298-6b9e8bf24a9b@gmail.com>
Date: Tue, 30 Jul 2024 16:10:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] use struct ptdesc to replace pgtable_t
To: alexs@kernel.org, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Brian Cain <bcain@quicinc.com>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Vishal Moola <vishal.moola@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Lance Yang <ioworker0@gmail.com>,
 Peter Xu <peterx@redhat.com>, Barry Song <baohua@kernel.org>,
 linux-s390@vger.kernel.org
Cc: Guo Ren <guoren@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Breno Leitao <leitao@debian.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_011038_177550_A08053FD 
X-CRM114-Status: GOOD (  19.17  )
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

BTW, the patchset based on the latest git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm mm-unstable branch.

On 7/30/24 2:46 PM, alexs@kernel.org wrote:
> From: Alex Shi <alexs@kernel.org>
> 
> We have struct ptdesc for page table descriptor a year ago, but it
> has no much usages in kernel, while pgtable_t is used widely.
> 
> The pgtable_t is typedefed as 'pte_t *' in sparc, s390, powerpc and m68k
> except SUN3, others archs are all same as 'struct page *'.
> 
> These blocks the conception and code update for page table descriptor to
> struct ptdesc.
> 
> So, the simple idea to push the ptdesc conception forward is to update
> all pgtable_t by ptdesc or pte_t pointer. But this needs widely
> knowledges for most all of different archs. Common code change is easy
> for include/ and mm/ directory, but it's hard in all archs.
> 
> Thanks for intel LKP framework, I fixed most all of build issues except
> a bug on powerpc which reports a "struct ptdesc *" incompatible with 
> struct ptdesc *' pointer issue...
> 
> Another trouble is pmd_pgtable() conversion in the last patch.
> Maybe some of arch need define theirself own pmd_ptdesc()?
> 
> This patchset is immature, even except above 2 issues, I just tested
> virutal machine booting and kselftest mm on x86 and arm64.
> 
> Anyway any input are appreciated!
> 
> Thanks
> Alex
> 
> Alex Shi (18):
>   mm/pgtable: use ptdesc in pte_free_now/pte_free_defer
>   mm/pgtable: convert ptdesc.pmd_huge_pte to ptdesc pointer
>   fs/dax: use ptdesc in dax_pmd_load_hole
>   mm/thp: use ptdesc pointer in __do_huge_pmd_anonymous_page
>   mm/thp: use ptdesc in do_huge_pmd_anonymous_page
>   mm/thp: convert insert_pfn_pmd and its caller to use ptdesc
>   mm/thp: use ptdesc in copy_huge_pmd
>   mm/memory: use ptdesc in __pte_alloc
>   mm/pgtable: fully use ptdesc in pte_alloc_one series functions
>   mm/pgtable: pass ptdesc to pte_free()
>   mm/pgtable: introduce ptdesc_pfn and use ptdesc in free_pte_range()
>   mm/thp: pass ptdesc to set_huge_zero_folio function
>   mm/pgtable: return ptdesc pointer in pgtable_trans_huge_withdraw
>   mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
>   mm/pgtable: pass ptdesc to pmd_populate
>   mm/pgtable: pass ptdesc to pmd_install
>   mm: convert vmf.prealloc_pte to struct ptdesc pointer
>   mm/pgtable: pass ptdesc in pte_free_defer
> 
>  arch/alpha/include/asm/pgalloc.h              |   4 +-
>  arch/arc/include/asm/pgalloc.h                |   4 +-
>  arch/arm/include/asm/pgalloc.h                |  13 +--
>  arch/arm/include/asm/tlb.h                    |   4 +-
>  arch/arm/mm/pgd.c                             |   2 +-
>  arch/arm64/include/asm/pgalloc.h              |   4 +-
>  arch/arm64/include/asm/tlb.h                  |   4 +-
>  arch/csky/include/asm/pgalloc.h               |   4 +-
>  arch/hexagon/include/asm/pgalloc.h            |   8 +-
>  arch/loongarch/include/asm/pgalloc.h          |   8 +-
>  arch/m68k/include/asm/motorola_pgalloc.h      |  12 +-
>  arch/m68k/include/asm/sun3_pgalloc.h          |   4 +-
>  arch/microblaze/include/asm/pgalloc.h         |   2 +-
>  arch/mips/include/asm/pgalloc.h               |   4 +-
>  arch/nios2/include/asm/pgalloc.h              |   4 +-
>  arch/openrisc/include/asm/pgalloc.h           |   8 +-
>  arch/parisc/include/asm/pgalloc.h             |   2 +-
>  arch/powerpc/include/asm/book3s/32/pgalloc.h  |   4 +-
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  |   4 +-
>  arch/powerpc/include/asm/book3s/64/hash-64k.h |   4 +-
>  arch/powerpc/include/asm/book3s/64/pgalloc.h  |   4 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h  |   8 +-
>  arch/powerpc/include/asm/book3s/64/radix.h    |   4 +-
>  arch/powerpc/include/asm/pgalloc.h            |   8 +-
>  arch/powerpc/mm/book3s64/hash_pgtable.c       |  10 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c      |  10 +-
>  arch/riscv/include/asm/pgalloc.h              |   8 +-
>  arch/s390/include/asm/pgalloc.h               |   4 +-
>  arch/s390/include/asm/pgtable.h               |   4 +-
>  arch/s390/mm/pgalloc.c                        |   2 +-
>  arch/s390/mm/pgtable.c                        |  14 +--
>  arch/sh/include/asm/pgalloc.h                 |   4 +-
>  arch/sparc/include/asm/pgalloc_32.h           |   6 +-
>  arch/sparc/include/asm/pgalloc_64.h           |   2 +-
>  arch/sparc/include/asm/pgtable_64.h           |   4 +-
>  arch/sparc/mm/init_64.c                       |   2 +-
>  arch/sparc/mm/srmmu.c                         |   6 +-
>  arch/sparc/mm/tlb.c                           |  14 +--
>  arch/x86/include/asm/pgalloc.h                |  10 +-
>  arch/x86/mm/pgtable.c                         |   8 +-
>  arch/xtensa/include/asm/pgalloc.h             |  12 +-
>  fs/dax.c                                      |  14 +--
>  include/asm-generic/pgalloc.h                 |  10 +-
>  include/linux/mm.h                            |  16 ++-
>  include/linux/mm_types.h                      |   4 +-
>  include/linux/pgtable.h                       |   6 +-
>  mm/debug_vm_pgtable.c                         |   6 +-
>  mm/huge_memory.c                              | 103 +++++++++---------
>  mm/internal.h                                 |   2 +-
>  mm/khugepaged.c                               |  14 +--
>  mm/memory.c                                   |  15 +--
>  mm/mremap.c                                   |   2 +-
>  mm/pgtable-generic.c                          |  37 +++----
>  53 files changed, 240 insertions(+), 236 deletions(-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
