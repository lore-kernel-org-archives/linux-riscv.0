Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783CCC47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA6661377
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EA6661377
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fclo7khX9kH/jtyJAPr5Q7FcEFmSV00WU4UApYnucXU=; b=GDAowSzMuxCVLf
	ofccPnxiItotXVScG2wgZV3TMf+5ShAAd0V4m8o5Zx2mrzBFcFAe4R7Cu2y8VTS5O3qigUIO8M2Nl
	kqfE/7+Kgu3L+ShJS55JgbOuLsQqLQVyfoytnQ3JuGZx7kmuiILj+kIwyt3M7HPULK420HKU/Jif6
	lT113jcyx7Vs7KgabKCV0yV/wgWKyl6X036aobGgvSVP9woHJQPuo5PgE6QVYGZ2JPuuun74ijyHI
	SHs39ceiw1MyoJJr/NN1w2VXS5ipAFAzAb+oQT5N2GwfRYcazVTJJ+Ji3oPQpVHh0t9Q5AyQw0V+g
	uDwVE5Ma5By5imUhupdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpvsK-000ZIa-9I; Sun, 06 Jun 2021 16:43:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpvsH-000ZI5-1V
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 16:43:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C61261430
 for <linux-riscv@lists.infradead.org>; Sun,  6 Jun 2021 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622997821;
 bh=RCdfr7c8cIkdbopQcMjNV6nZklbfSX22C7zD1lCW95I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UcOgZ9dBsVmHVtXczAb9SxViegy4RUmk4sbRx9s0wym7cUbnqX40vxITwz+joXAqY
 tMcEOr01GW0HdQZioR4kSsAFHS3Bq5rrMrzQNXUjUGANwFr/L3GfPBg4IlMgNZjZJz
 PrxUe3ucsFxVZ0dnkvHM20NSAmrokKkUjVDdXTTECwhF3pSXwUdWujnbkbV7MPjfAk
 rVVlzS3sQUjhA1dMCacXrtximRyikciu6DKLJjs9TjqPXb2Y4LAW6hGjmrPl3u7BF+
 maDU9WdrqclieZaFUChf8M3YLVTQ1ThN+vOvhi0JKxHj32r9tXHX6mzur4oYv4Fdyc
 +FTqTcPKl8GFA==
Received: by mail-lf1-f45.google.com with SMTP id p17so21228239lfc.6
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 09:43:41 -0700 (PDT)
X-Gm-Message-State: AOAM5321XYdlzi8UYadkIIzCNldxG8boA901FEeT3VISI3+H6DD+/bEK
 7Usl2l88tCZmmVkjxtRnYb9m0RxPv/yCDQEZH3E=
X-Google-Smtp-Source: ABdhPJwIoENg/b9gbZmEDlAaoqFn/YPfeYOw79aSws6JJGhWikjMERqkHeX5A5qjgvOp3yOi1SuncGEJsXfOHqGwfiE=
X-Received: by 2002:ac2:4c0e:: with SMTP id t14mr9468066lfq.555.1622997819871; 
 Sun, 06 Jun 2021 09:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210606152050.636038-1-hch@lst.de>
 <20210606152050.636038-2-hch@lst.de>
In-Reply-To: <20210606152050.636038-2-hch@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 00:43:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRmqVLJY+Ubc5g67mzXmfKoUO0oJpejK+pgTgDFupGSrQ@mail.gmail.com>
Message-ID: <CAJF2gTRmqVLJY+Ubc5g67mzXmfKoUO0oJpejK+pgTgDFupGSrQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: pass the mm_struct to __sbi_tlb_flush_range
To: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <anup.patel@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_094345_146512_C577373B 
X-CRM114-Status: GOOD (  17.92  )
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

Rebase with "THP supprt for RISCV" & "Add DMA_COHERENT v2" on linux-5.13-rc4.

Tested-by: Guo Ren <guoren@kernel.org>

On Sun, Jun 6, 2021 at 11:21 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Move the call mm_cpumask from the callers into __sbi_tlb_flush_range to
> reduce a bit of duplicate code and prepare for future changes.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/mm/tlbflush.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index fea45af91f53..b458949fa8df 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -10,13 +10,10 @@ void flush_tlb_all(void)
>         sbi_remote_sfence_vma(NULL, 0, -1);
>  }
>
> -/*
> - * This function must not be called with cmask being null.
> - * Kernel may panic if cmask is NULL.
> - */
> -static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
> +static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
>                                   unsigned long size, unsigned long stride)
>  {
> +       struct cpumask *cmask = mm_cpumask(mm);
>         struct cpumask hmask;
>         unsigned int cpuid;
>
> @@ -41,23 +38,23 @@ static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
>
>  void flush_tlb_mm(struct mm_struct *mm)
>  {
> -       __sbi_tlb_flush_range(mm_cpumask(mm), 0, -1, PAGE_SIZE);
> +       __sbi_tlb_flush_range(mm, 0, -1, PAGE_SIZE);
>  }
>
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>  {
> -       __sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE, PAGE_SIZE);
> +       __sbi_tlb_flush_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);
>  }
>
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>                      unsigned long end)
>  {
> -       __sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start, PAGE_SIZE);
> +       __sbi_tlb_flush_range(vma->vm_mm, start, end - start, PAGE_SIZE);
>  }
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>                         unsigned long end)
>  {
> -       __sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start, PMD_SIZE);
> +       __sbi_tlb_flush_range(vma->vm_mm, start, end - start, PMD_SIZE);
>  }
>  #endif
> --
> 2.30.2
>


--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
