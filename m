Return-Path: <SRS0=CBip=5G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5F5C4332D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2020 20:29:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA052072C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2020 20:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t3+0gTrq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpUDhAO4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDA052072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WW5o1pyalG30ClbZhbAg09cR2QEbOm6+hw2Xj1q5juE=; b=t3+0gTrqnqnBPd
	dDq0/Hp4W1cH0gY6R3TaScGFk6G5ihYKCNcm2N7CoxMEZcBIU7UVOxaXTWKXtB07Vm8n7A43UyD8f
	vBST+dPakHW1kKDK1u+qoBeaYPlH7tOTdgMdT7PCyJHwfeSYQmzS7erpY+MWJGtVKiDS5kkw+laY9
	TGScpHw08CD65av5E4P1tUCIVNz4dcrAhUUa0SufAhS/qkDcjqluz25QKtFxw1FpONqiiJJS5T+Jr
	mYknAAaxXMZP+TmiM+cDYm0iBZ7Kph+MRXBGw9Q6JgzJsUqVL/8SyOP+LO3I7/weGjDS9RqHHS4Gg
	TwDDntL17LnhEBXK1ttA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFkkd-00031U-0k; Sat, 21 Mar 2020 20:29:47 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFkka-000311-7O
 for linux-riscv@lists.infradead.org; Sat, 21 Mar 2020 20:29:45 +0000
Received: by mail-wr1-x442.google.com with SMTP id a25so11768652wrd.0
 for <linux-riscv@lists.infradead.org>; Sat, 21 Mar 2020 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WW5o1pyalG30ClbZhbAg09cR2QEbOm6+hw2Xj1q5juE=;
 b=SpUDhAO437ic3C0tq3/Tm2fjBEKNXFMgbD97zHI26nWMPMva3avf8LRsYEbSwKFvVA
 jVIuDSCyPXIGmUeoubYEkLcyo0MzMX5hKi3P9RgaKeaGj1nFzQKApwZDEKpi8Xw0XsDx
 K5ulklbGNODz4BdnIzwl/l9Xcxx7w11jCUjKu787MYCYCcLdedKeVhwyR1BPAjJJBSeT
 UOdPX32Ng/Q+a+1H77RqBEYx1m0nxOvWg+bzWfvVNesEjSZ+0ktqhaeIB4sBG0OR8Vzx
 JTjiDhiCQd2OstSqMouc/YL99qzngA7K5fMB3IwAKw4tpiafzD1Y09f6oD8qz86EX1p7
 t92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WW5o1pyalG30ClbZhbAg09cR2QEbOm6+hw2Xj1q5juE=;
 b=DsDarNuu+1pXIqhhjYpEYZDZq6i61z283bOaAAXid74dCXUb8iKk+6VpKVGMLxhmdE
 YfX7g3pgDe//HHwo4xR5HHSfkS85BgIGxGAo9RexcAXoqI9aes4mPCJmhpuAJ0iNJ7f/
 vfvopcQxO/0MRaEzBwkc0FrWS2Rfw/kn+3xT+EZPju5N5SJG5sF5LYTkjyvjWtvn97i0
 33eUaTkVvsPc6c5YQZiFGnURw0L6ZNrFLCoDIe6gaj8qRM3TFYpDpWWU5ASI3tVdBNNv
 y0NNULIVLm89zf+RAodnjS9R9Xja7qbmyelqI3Dtm2Bn5cIcK5pDFJTMh//M3PYnmgLc
 UJ1A==
X-Gm-Message-State: ANhLgQ0c070KGZsT0qiHbYKc2SwK9jqVk9metZK/tX4TOqnCEMwxjsuN
 9xJakt1wFfghzAtWMnofSqRhjFML1dZDfZNwbSE=
X-Google-Smtp-Source: ADFU+vv31P9Vtpx3s/Ti0yZgDDMox9AIW/uHr1E+GfynXVHdWcR1U6kemU+Bv88UkjaD2n076MBNYzHa80BK7GmGirk=
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr19934547wro.423.1584822582022; 
 Sat, 21 Mar 2020 13:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200224193436.26860-1-atish.patra@wdc.com>
 <mhng-a36eb560-2fbf-4fba-8416-8181a2c8ad5b@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-a36eb560-2fbf-4fba-8416-8181a2c8ad5b@palmerdabbelt-glaptop1>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Sat, 21 Mar 2020 22:29:06 +0200
Message-ID: <CAEn-LTo=GP5OMZiaBi8BL1etLcGrCyofQrtQ4-JOo5zcpCLu8A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Move all address space definition macros to one
 place
To: Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200321_132944_287956_90C47179 
X-CRM114-Status: GOOD (  19.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, nickhu@andestech.com,
 Bjorn Topel <bjorn.topel@gmail.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 akpm@linux-foundation.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 6, 2020 at 2:20 AM Palmer Dabbelt <palmerdabbelt@google.com> wr=
ote:
>
> On Mon, 24 Feb 2020 11:34:36 PST (-0800), Atish Patra wrote:
> > If both CONFIG_KASAN and CONFIG_SPARSEMEM_VMEMMAP are set, we get the
> > following compilation error.
> >
> > ---------------------------------------------------------------
> > ./arch/riscv/include/asm/pgtable-64.h: In function =E2=80=98pud_page=E2=
=80=99:
> > ./include/asm-generic/memory_model.h:54:29: error: =E2=80=98vmemmap=E2=
=80=99 undeclared
> > (first use in this function); did you mean =E2=80=98mem_map=E2=80=99?
> >  #define __pfn_to_page(pfn) (vmemmap + (pfn))
> >                              ^~~~~~~
> > ./include/asm-generic/memory_model.h:82:21: note: in expansion of
> > macro =E2=80=98__pfn_to_page=E2=80=99
> >
> >  #define pfn_to_page __pfn_to_page
> >                      ^~~~~~~~~~~~~
> > ./arch/riscv/include/asm/pgtable-64.h:70:9: note: in expansion of macro
> > =E2=80=98pfn_to_page=E2=80=99
> >   return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
> > ---------------------------------------------------------------
> >
> > Fix the compliation errors by moving all the address space definition
> > macros before including pgtable-64.h.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 8ad8b72721d0 (riscv: Add KASAN support)
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/include/asm/pgtable.h | 78 +++++++++++++++++---------------
> >  1 file changed, 41 insertions(+), 37 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/=
pgtable.h
> > index 453afb0a570a..4f6ee48a42e8 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -19,6 +19,47 @@
> >  #include <asm/tlbflush.h>
> >  #include <linux/mm_types.h>
> >
> > +#ifdef CONFIG_MMU
> > +
> > +#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> > +#define VMALLOC_END      (PAGE_OFFSET - 1)
> > +#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
> > +
> > +#define BPF_JIT_REGION_SIZE  (SZ_128M)
> > +#define BPF_JIT_REGION_START (PAGE_OFFSET - BPF_JIT_REGION_SIZE)
> > +#define BPF_JIT_REGION_END   (VMALLOC_END)
> > +
> > +/*
> > + * Roughly size the vmemmap space to be large enough to fit enough
> > + * struct pages to map half the virtual address space. Then
> > + * position vmemmap directly below the VMALLOC region.
> > + */
> > +#define VMEMMAP_SHIFT \
> > +     (CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
> > +#define VMEMMAP_SIZE BIT(VMEMMAP_SHIFT)
> > +#define VMEMMAP_END  (VMALLOC_START - 1)
> > +#define VMEMMAP_START        (VMALLOC_START - VMEMMAP_SIZE)
> > +
> > +/*
> > + * Define vmemmap for pfn_to_page & page_to_pfn calls. Needed if kerne=
l
> > + * is configured with CONFIG_SPARSEMEM_VMEMMAP enabled.
> > + */
> > +#define vmemmap              ((struct page *)VMEMMAP_START)
> > +
> > +#define PCI_IO_SIZE      SZ_16M
> > +#define PCI_IO_END       VMEMMAP_START
> > +#define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
> > +
> > +#define FIXADDR_TOP      PCI_IO_START
> > +#ifdef CONFIG_64BIT
> > +#define FIXADDR_SIZE     PMD_SIZE
> > +#else
> > +#define FIXADDR_SIZE     PGDIR_SIZE
> > +#endif
> > +#define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
> > +
> > +#endif
> > +
> >  #ifdef CONFIG_64BIT
> >  #include <asm/pgtable-64.h>
> >  #else
> > @@ -90,31 +131,6 @@ extern pgd_t swapper_pg_dir[];
> >  #define __S110       PAGE_SHARED_EXEC
> >  #define __S111       PAGE_SHARED_EXEC
> >
> > -#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> > -#define VMALLOC_END      (PAGE_OFFSET - 1)
> > -#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
> > -
> > -#define BPF_JIT_REGION_SIZE  (SZ_128M)
> > -#define BPF_JIT_REGION_START (PAGE_OFFSET - BPF_JIT_REGION_SIZE)
> > -#define BPF_JIT_REGION_END   (VMALLOC_END)
> > -
> > -/*
> > - * Roughly size the vmemmap space to be large enough to fit enough
> > - * struct pages to map half the virtual address space. Then
> > - * position vmemmap directly below the VMALLOC region.
> > - */
> > -#define VMEMMAP_SHIFT \
> > -     (CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
> > -#define VMEMMAP_SIZE BIT(VMEMMAP_SHIFT)
> > -#define VMEMMAP_END  (VMALLOC_START - 1)
> > -#define VMEMMAP_START        (VMALLOC_START - VMEMMAP_SIZE)
> > -
> > -/*
> > - * Define vmemmap for pfn_to_page & page_to_pfn calls. Needed if kerne=
l
> > - * is configured with CONFIG_SPARSEMEM_VMEMMAP enabled.
> > - */
> > -#define vmemmap              ((struct page *)VMEMMAP_START)
> > -
> >  static inline int pmd_present(pmd_t pmd)
> >  {
> >       return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
> > @@ -452,18 +468,6 @@ static inline int ptep_clear_flush_young(struct vm=
_area_struct *vma,
> >  #define __pte_to_swp_entry(pte)      ((swp_entry_t) { pte_val(pte) })
> >  #define __swp_entry_to_pte(x)        ((pte_t) { (x).val })
> >
> > -#define PCI_IO_SIZE      SZ_16M
> > -#define PCI_IO_END       VMEMMAP_START
> > -#define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
> > -
> > -#define FIXADDR_TOP      PCI_IO_START
> > -#ifdef CONFIG_64BIT
> > -#define FIXADDR_SIZE     PMD_SIZE
> > -#else
> > -#define FIXADDR_SIZE     PGDIR_SIZE
> > -#endif
> > -#define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
> > -
> >  /*
> >   * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
> >   * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
>
> While this isn't technically a fix, I'm inclined to target it for the RCs=
 just
> to avoid conflicts.  I've put it on for-next now so the builders have som=
e time
> to chew on things, as I don't want to put in a non-fix too quickly.

I hit the same issue in Fedora/RISCV while building kernel-5.6.0-0.rc6, and
we don't have KASAN selected. We do have CONFIG_SPARSEMEM_VMEMMAP
selected.

I will try this patch tomorrow.

>
> Thanks!

