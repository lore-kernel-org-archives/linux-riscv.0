Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DD6CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csgp7wKAuWvVbATH5N1MBRmL8wc0RIwhd1Ysnq/JkcI=; b=1++TYcT/VRRRK9
	aAIjjXs0TyvM+6hV3jued8skNN0yhI9ROhaqFo/DbJwySMeEAbdtTk6ut/vjSkgRHcBaSTtO9Zezi
	g9oYOwQ+EUNDHW+D4c55eW+olVpyU9toqpTuAE5IR1In3d/sK0GP/XgxlfXAkBpfzKCU2JScfLo8V
	UnQoluRJ6v7dEerq7bSN0QctQjHHlsCclsqOGWfIGojbfy44y5WguBtyGdNNC5c8ZrDcyw+Vah/BR
	50Xa2RdZX31AJtLL9woHj8zsqiFbh+gTKhzzo3GRAQVMubyGhVRfMzN4/PNRiNTn79qAwkHOXKjyW
	URgcUY0p7I/PkyY37zxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquaC-000wSM-32;
	Thu, 12 Oct 2023 12:14:28 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qquaA-000wQR-10
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 12:14:27 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-457ae239ff3so283410137.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697112860; x=1697717660; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uIVKgMbPrdbBiBUZkSG3/934vJNvcwEmUkQTpoFMZCk=;
        b=d0fgHt83ReeUST8XwBRPpQjXpmW/wUZNIYGNUHRiek/ctJNAFHfuW1TRjJgUXp1LTY
         RtubNYI8XmHuEZjsIk7fxjZBa+PJwNtviNuvbptY0FU+gVulEtMiFJhQukyqWwwbkbFp
         ZkYB+FD1ydbgv1KV+jJuAQssrTza6UjpcoSh14Gpi0ur9HQHhO4UKuggd/zDAoqXBT0z
         SrV/2Alfk72mqOOu1lcNoNaKiNAciVRwOVECqkIgGZWiSSrPVMnFMIpxR2bhkR1WAyd0
         RRZy1LfPWDO9VNyepHO6R9cjNkfH6VYw/JUsnGta8nYNJnvwMVhOGpu6/lBo/DqgkZL2
         ltsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112860; x=1697717660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIVKgMbPrdbBiBUZkSG3/934vJNvcwEmUkQTpoFMZCk=;
        b=fnghnfoNic1oddR2jeqVz5oDdN6gHn30R1Ig3eQMRmQ3xkXmeXNM+DJgRkRm0Ja+zA
         OcjN2CpX7fzrxjTCzSOvL+cTPdUt4LhbiVatOQLZl+q4iSgR+lkHfJBmE9g++nALaImg
         6Tsxim41ZfJF8lT3G9I3NKqnucmaqE9PQi35WxIfbXO9SYzTEiW0vLEZAoGrFEDbRW0t
         iirhgQ8H4G3VM5qOxMLauVNkRdLw3p/0RT8KYvOZiXTBerJcWVyZd4+sfLV0HZOP00uI
         tYBnNMI1gOru2sMHByOXlSziUTD92Db2sK16AfFiGUHW6f70+tjmVQ7UpNI5KAdSdeQI
         TfRQ==
X-Gm-Message-State: AOJu0YwKnyY3DSqk6FE086uslIxIj6E5Tenj7xD3CMFKhaJZ09WPAy7W
	Gx1DZs/R6KoBsN5EPMDIwu+kGOZJtAap437Dh2Qb3Q==
X-Google-Smtp-Source: AGHT+IGSoIb8uQABAFJTeUJgo2RfYY4jfayfwcYkHHdPEVjq+eBHhrTPQ/7URUajOd/zOEzWZ81EtKRuSQPLeMl9XzI=
X-Received: by 2002:a05:6102:54a2:b0:457:a8fb:3251 with SMTP id
 bk34-20020a05610254a200b00457a8fb3251mr3718012vsb.0.1697112860491; Thu, 12
 Oct 2023 05:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231002151031.110551-1-alexghiti@rivosinc.com> <20231002151031.110551-5-alexghiti@rivosinc.com>
In-Reply-To: <20231002151031.110551-5-alexghiti@rivosinc.com>
From: Marco Elver <elver@google.com>
Date: Thu, 12 Oct 2023 14:13:44 +0200
Message-ID: <CANpmjNMvQUSNU+U80nWrUWPc4sszvSTGvivJjk0HOw8LRWx1sg@mail.gmail.com>
Subject: Re: [PATCH 4/5] riscv: Suffix all page table entry pointers with 'p'
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-efi@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_051426_347549_0FDCDB38 
X-CRM114-Status: GOOD (  14.94  )
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

On Mon, 2 Oct 2023 at 17:14, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> That makes it more clear what the underlying type is, no functional
> changes intended.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/kfence.h     |  6 +-
>  arch/riscv/include/asm/kvm_host.h   |  2 +-
>  arch/riscv/include/asm/pgalloc.h    | 86 +++++++++++++-------------
>  arch/riscv/include/asm/pgtable-64.h | 20 +++---
>  arch/riscv/kvm/mmu.c                | 22 +++----
>  arch/riscv/mm/fault.c               | 38 ++++++------
>  arch/riscv/mm/hugetlbpage.c         | 78 +++++++++++------------
>  arch/riscv/mm/init.c                | 30 ++++-----
>  arch/riscv/mm/kasan_init.c          | 96 ++++++++++++++---------------
>  arch/riscv/mm/pageattr.c            | 74 +++++++++++-----------
>  arch/riscv/mm/pgtable.c             | 46 +++++++-------
>  11 files changed, 251 insertions(+), 247 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kfence.h b/arch/riscv/include/asm/kfence.h
> index 0bbffd528096..3b482d0a4633 100644
> --- a/arch/riscv/include/asm/kfence.h
> +++ b/arch/riscv/include/asm/kfence.h
> @@ -15,12 +15,12 @@ static inline bool arch_kfence_init_pool(void)
>
>  static inline bool kfence_protect_page(unsigned long addr, bool protect)
>  {
> -       pte_t *pte = virt_to_kpte(addr);
> +       pte_t *ptep = virt_to_kpte(addr);
>
>         if (protect)
> -               set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
> +               set_pte(ptep, __pte(pte_val(*ptep) & ~_PAGE_PRESENT));
>         else
> -               set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
> +               set_pte(ptep, __pte(pte_val(*ptep) | _PAGE_PRESENT));
>
>         flush_tlb_kernel_range(addr, addr + PAGE_SIZE);

As others expressed, this seems unnecessary. It doesn't make the code
any clearer to me.

However, for your subsystem you make the rules. I would just suggest
to keep things consistent with other kernel code, although there are
already stylistic deviations between subsystems (e.g. comment style in
net and rcu vs rest), I'd simply vote for fewer deviations between
subsystems.

Real downsides of stylistic changes that have unclear benefit:
1. stable backports become more difficult.
2. chasing a change with git blame becomes harder.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
