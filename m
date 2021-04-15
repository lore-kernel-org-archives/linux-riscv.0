Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D694AC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 06:16:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390106101D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 06:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 390106101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=6pdxK+/OaRrk7XxtwPH3CEJNn3qKBEiytfZBB0/1fDo=; b=FZzcQyrP22NIwlHCiGDq8Klhn
	7USeXBfaY9K/1zR9vJCaA8QvacRPgSsuOsKYRINx0L12Cxnu1fEnXYrz09QUN+OqL3l0SS86sG3bu
	kv/UOAJNuKpGr64xN8I1HHh6b/AkNDKw/6lWeanIlZRvgxhr5HSGnL0HeKzASW6BNA68mbA4OQyaJ
	h7t5evlABYpi8g4zbPFgciSSXSqsXfBw1SREceP/N70RsGC1RmTXSGharNgis3ipF4oIQ1NHB+pey
	g9OSbPUnDV9fKNpysrUN0dMgA30rqtt1zlrZJe4gxGE5bREcrCeFK+ocAr8Tk1hNLg16hLuBPMJWP
	T9kuw1p9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWvIl-00F29i-JG; Thu, 15 Apr 2021 06:16:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWvIj-00F294-BJ
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 06:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=8aPMWJgLeOMSHDPtfmh56WRL1jMhYN833mNKhQBp9lg=; b=mdu7nAF7vCPiQsBI6xWEG1vXAZ
 NhHZ8jMOrQx61IC2bb2FbgVTfV96UwOVAwJnqx6UP7ZF1jxcLu/XZh3JrjdxtICruo4NecDGHp3SZ
 a8nXUSVYBWLfPslfNxePr6SaMQ3YL8dsh0QQ1cglyLA1/6VPKs6k50gsvfwYT6Zx1qF9vLu/oEu91
 VmGmNRfKjEJXs7vwAGqojZIhCsXX/B8R5RZy1B76t6wB6JGbEdPlsXMUqnOrOlKV3iMnP6wpVif4W
 U6Q0xQxGsORyqIYuvaFH1XR4XH1IfOzYDiNrEHzljntLsNpn+wbXWdOyUu9j3hO3RBlG3JdiNtTu9
 1bgE5YDQ==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWvIg-008J33-GW
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 06:16:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id m18so9263843plc.13
 for <linux-riscv@lists.infradead.org>; Wed, 14 Apr 2021 23:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8aPMWJgLeOMSHDPtfmh56WRL1jMhYN833mNKhQBp9lg=;
 b=S2hDQvA6UfYIH0obB5OOp9EyLCYxAEyAd3zUh7VQB70I3FE4ZQVlnB7pDBCv+EYFQR
 iFQFmiIaWxlgH15kJyqdoNWAXVIuM4M2ymSet5SjMCXRhlept12z7lOne2sKKM/Qahl7
 SR7pLqx9Vp7A+RTWtW8cb1WdsLFiMjf9rLjh125BDNZllXhK6EEvfBeKPL8z4bLGqKGk
 eFuDCXxvbc2teHQ6SsD24i8HjukX3iaINCwJ2VtvMJAWwhBc4Ndv9ROtmGrWt1xbQIm5
 DmNE3nxJvy2+8U5npx6FG2l55e7/FJb/AM0pRO39N+0wA1HUB8S4qbjmV/RhscpnPZUn
 ii2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8aPMWJgLeOMSHDPtfmh56WRL1jMhYN833mNKhQBp9lg=;
 b=GdEdkiIN2a5TV7VmQNkEGAzhERgxc2hE0/J9w5CdOb+npRDPXfoQy4xqjrZuPswedd
 y6vwYpDvf7kXZpLwWMdthe5FN/UgN+DDCIJUKEBB8B5f/iFa50ZqKD2tWrdGx7y57R49
 P6TVnD89sv8NbEObGQT7J1pGeECS/Y30tvFz/42JSbQenSmgt0BRd/5H9N5BdirSaHbX
 NKirBChIlBod4hprS3sEklmhDOV5w4/wPZYgC5dfm/zqBl3oleX9JdGabl4syvoesmMO
 9p+b2JPqDiU6L6bLxOrKrlg0TMyACoJg6d3Uvq2uWQmGkbxQoT1UfQJcYpxF3Qpa7xU+
 2lhQ==
X-Gm-Message-State: AOAM531mr9cRf6djJ5Prqm/jmFenfAZFcoqhX/7pjBD4EDdbKm8MCsRd
 eEZZw8XDoA11UxvoVoWGT72qHA==
X-Google-Smtp-Source: ABdhPJwQ8tlbhjRyFTql28i8d3dPzxk+82TQ7fucsms/w1A1eM/vcb693iFMmHVxxBPuNRepSBkMdQ==
X-Received: by 2002:a17:90a:670a:: with SMTP id
 n10mr2087887pjj.176.1618467385372; 
 Wed, 14 Apr 2021 23:16:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m9sm1242059pgt.65.2021.04.14.23.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 23:16:24 -0700 (PDT)
Date: Wed, 14 Apr 2021 23:16:24 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Apr 2021 23:16:23 PDT (-0700)
Subject: Re: [PATCH v3 2/2] riscv: Cleanup KASAN_VMALLOC support
In-Reply-To: <CAMuHMdXdhTUKuvJkJGUm=ESpwA6R06eKV5q6wFOJftJ1p3R7nw@mail.gmail.com>
CC: alex@ghiti.fr, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 nylon7@andestech.com, nickhu@andestech.com, aryabinin@virtuozzo.com,
 glider@google.com, dvyukov@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert@linux-m68k.org
Message-ID: <mhng-93309746-0fd6-42ec-b574-bf1ce486f34a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_231626_574261_67159AD1 
X-CRM114-Status: GOOD (  33.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 30 Mar 2021 02:47:30 PDT (-0700), geert@linux-m68k.org wrote:
> Hi Palmer,
>
> On Tue, Mar 30, 2021 at 7:08 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Sat, 13 Mar 2021 00:45:05 PST (-0800), alex@ghiti.fr wrote:
>> > When KASAN vmalloc region is populated, there is no userspace process and
>> > the page table in use is swapper_pg_dir, so there is no need to read
>> > SATP. Then we can use the same scheme used by kasan_populate_p*d
>> > functions to go through the page table, which harmonizes the code.
>> >
>> > In addition, make use of set_pgd that goes through all unused page table
>> > levels, contrary to p*d_populate functions, which makes this function work
>> > whatever the number of page table levels.
>> >
>> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> > ---
>> >  arch/riscv/mm/kasan_init.c | 59 ++++++++++++--------------------------
>> >  1 file changed, 18 insertions(+), 41 deletions(-)
>> >
>> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
>> > index 57bf4ae09361..c16178918239 100644
>> > --- a/arch/riscv/mm/kasan_init.c
>> > +++ b/arch/riscv/mm/kasan_init.c
>> > @@ -11,18 +11,6 @@
>> >  #include <asm/fixmap.h>
>> >  #include <asm/pgalloc.h>
>> >
>> > -static __init void *early_alloc(size_t size, int node)
>> > -{
>> > -     void *ptr = memblock_alloc_try_nid(size, size,
>> > -             __pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, node);
>> > -
>> > -     if (!ptr)
>> > -             panic("%pS: Failed to allocate %zu bytes align=%zx nid=%d from=%llx\n",
>> > -                     __func__, size, size, node, (u64)__pa(MAX_DMA_ADDRESS));
>> > -
>> > -     return ptr;
>> > -}
>> > -
>> >  extern pgd_t early_pg_dir[PTRS_PER_PGD];
>> >  asmlinkage void __init kasan_early_init(void)
>> >  {
>> > @@ -155,38 +143,27 @@ static void __init kasan_populate(void *start, void *end)
>> >       memset(start, KASAN_SHADOW_INIT, end - start);
>> >  }
>> >
>> > -void __init kasan_shallow_populate(void *start, void *end)
>> > +static void __init kasan_shallow_populate_pgd(unsigned long vaddr, unsigned long end)
>> >  {
>> > -     unsigned long vaddr = (unsigned long)start & PAGE_MASK;
>> > -     unsigned long vend = PAGE_ALIGN((unsigned long)end);
>> > -     unsigned long pfn;
>> > -     int index;
>> > +     unsigned long next;
>> >       void *p;
>> > -     pud_t *pud_dir, *pud_k;
>> > -     pgd_t *pgd_dir, *pgd_k;
>> > -     p4d_t *p4d_dir, *p4d_k;
>> > -
>> > -     while (vaddr < vend) {
>> > -             index = pgd_index(vaddr);
>> > -             pfn = csr_read(CSR_SATP) & SATP_PPN;
>> > -             pgd_dir = (pgd_t *)pfn_to_virt(pfn) + index;
>> > -             pgd_k = init_mm.pgd + index;
>> > -             pgd_dir = pgd_offset_k(vaddr);
>> > -             set_pgd(pgd_dir, *pgd_k);
>> > -
>> > -             p4d_dir = p4d_offset(pgd_dir, vaddr);
>> > -             p4d_k  = p4d_offset(pgd_k, vaddr);
>> > -
>> > -             vaddr = (vaddr + PUD_SIZE) & PUD_MASK;
>> > -             pud_dir = pud_offset(p4d_dir, vaddr);
>> > -             pud_k = pud_offset(p4d_k, vaddr);
>> > -
>> > -             if (pud_present(*pud_dir)) {
>> > -                     p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
>> > -                     pud_populate(&init_mm, pud_dir, p);
>> > +     pgd_t *pgd_k = pgd_offset_k(vaddr);
>> > +
>> > +     do {
>> > +             next = pgd_addr_end(vaddr, end);
>> > +             if (pgd_page_vaddr(*pgd_k) == (unsigned long)lm_alias(kasan_early_shadow_pmd)) {
>> > +                     p = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
>> > +                     set_pgd(pgd_k, pfn_pgd(PFN_DOWN(__pa(p)), PAGE_TABLE));
>> >               }
>> > -             vaddr += PAGE_SIZE;
>> > -     }
>> > +     } while (pgd_k++, vaddr = next, vaddr != end);
>> > +}
>> > +
>> > +static void __init kasan_shallow_populate(void *start, void *end)
>> > +{
>> > +     unsigned long vaddr = (unsigned long)start & PAGE_MASK;
>> > +     unsigned long vend = PAGE_ALIGN((unsigned long)end);
>> > +
>> > +     kasan_shallow_populate_pgd(vaddr, vend);
>> >
>> >       local_flush_tlb_all();
>> >  }
>>
>> Thanks, this is on for-next.
>
> Your for-next does not include your fixes branch, hence they now conflict,
> and for-next lacks the local_flush_tlb_all().

This came up before and I don't think we ever sorted out what the right 
thing to do is.  Right now I'm keeping for-next pinned an at early RC, 
but fast-forwarding fixes to the latest RC every time I sent a PR.  I 
don't have fixes merged back into for-next because I don't want those 
merges to show up when I send my merge window PRs.

For this one I purposefully left out the local_flush_tlb_all() whene I 
pulled in this patch, and was planning on fixing it up along with any 
other merge conflicts when I send along the PR.  It does all seem like a 
bit of a song and dance here, though, so I'm open to suggestions as to 
how to run this better -- though last time I went through that exercise 
it seemed like everyone had their own way of doing it, they all had a 
different set of issues, and I was at least familiar with this flavor of 
craziness.

I was kind of tempted to convert for-next over into a branch that only 
contains merges, though, which would make it a bit easier to merge fixes 
in.

>
> Gr{oetje,eeting}s,
>
>                         Geert

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
