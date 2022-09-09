Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E19ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 18:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lztt+KSnlBAbWhVFHid+4vrCb+l5rervqIriMLi33ak=; b=vMNnItjg9ZDTBN
	CBRypm61laDtCZp7WLuNpjUfAbInC1+Ztn+U6arhHIrIv4i3PpgHv1Vu+8IMFBfGhljZkEus92s5C
	impkgNeLuV8h5hqXZf1rmprW0nhTULnN+b9Xl5vtHOOCSZKeDATBqs58xVdXIQk5gu7pm3RqloEVz
	pzXxm4/vB/NsgEAqKcEsEfA/C53DsjysAywb5gdvpr1MqDzNW3Uut/tJ9ULJjgnvvZX/51Z7xFUPE
	8/NzEqT8Rg8MmWjWE/egoAJuhysMLJddVN5mK7SXfAEpoyTf5brP43CHxPPi3F2KyOvOcXPhHhEa8
	HWvSGen+Ca1r6fts97hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWj6v-001QXq-1i; Fri, 09 Sep 2022 18:52:17 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWj6s-001QWO-LI
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 18:52:16 +0000
Received: by mail-il1-x133.google.com with SMTP id g12so738829ilj.5
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 11:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nuX8RHdOBuwR18rb/hIKqVYoCioDbOlB9tjSaWc6TfE=;
        b=Q7u1GP81wzUd6Q5YRwMiSxpFY8c8++WLzn2hRT3zSDv46zq4SMTlWHT8g4Dx9ul15x
         cUIvGL6JEmEkw21Tv4+D3qQm91sdLj+xlMrWEIcr8Rer00eeSWnay2EoMNgpCkiWNvyU
         lM+OMZShB0ulM92Tr3YmHmirOHJIJYrrGod0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nuX8RHdOBuwR18rb/hIKqVYoCioDbOlB9tjSaWc6TfE=;
        b=TOtdkf2eoYDFk+DlivFtIkGhvrmPlS/tABKkZPWdijTSZ6ULFS7DbDh9dY1DUu97OT
         6eDPMLajkPaaBDem550U0ina8TAFx8q1c766zbEJygpasqYT/uOG3xTi5HuBtLqkCkyh
         Wl2qz0nI4FUiwlaBiWowcctbSOig3P0rnaR9QDYeB0DSj043dGU5wWPLKa8maExH2EC/
         eSWyUJGi8D32JaeJeF/fpfrqtuPVwJ/P36xEK2pNkhtamonJmTLp1jSfqwHYImikKjDr
         vr/Wjc/D0sUsuO4Pik1s+Od9xvpFK+nlchX1oIErmlyHlmHjS0TOkxTs0s3zmvRK52HR
         anVg==
X-Gm-Message-State: ACgBeo1QUoVf7YJrM77S5aTYyck/c6WTancYZ/tYTIs300YSYBekAtTG
	2b9Q9n6oKe7BOoDqqMnxwbk1U8b5B4H5SaS9BQTn
X-Google-Smtp-Source: AA6agR6pzEUW+mqZG3PaEOzTo4gvZqU1ZlYy278KgMLv1t2nzlQQ1rvsnPee+gs2iLrUggjzLXnEv01uqAxMVpnzfQg=
X-Received: by 2002:a05:6e02:20c2:b0:2f1:d171:8149 with SMTP id
 2-20020a056e0220c200b002f1d1718149mr4887812ilq.220.1662749531849; Fri, 09 Sep
 2022 11:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220908170133.1159747-1-abrestic@rivosinc.com> <20220908185006.1212126-1-abrestic@rivosinc.com>
In-Reply-To: <20220908185006.1212126-1-abrestic@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 9 Sep 2022 11:52:01 -0700
Message-ID: <CAOnJCULmjX9JScQOg4G16tYOeX=nMcvuJOpQM-eExERUb89uww@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Make mmap() with PROT_WRITE imply PROT_READ
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Celeste Liu <coelacanthus@outlook.com>, dram <dramforever@live.com>, 
	Ruizhe Pan <c141028@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_115214_730599_C4FADA53 
X-CRM114-Status: GOOD (  22.23  )
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

On Thu, Sep 8, 2022 at 11:50 AM Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
> invalid") made mmap() return EINVAL if PROT_WRITE was set wihtout
> PROT_READ with the justification that a write-only PTE is considered a
> reserved PTE permission bit pattern in the privileged spec. This check
> is unnecessary since RISC-V defines its protection_map such that PROT_WRITE
> maps to the same PTE permissions as PROT_WRITE|PROT_READ, and it is
> inconsistent with other architectures that don't support write-only PTEs,
> creating a potential software portability issue. Just remove the check
> altogether and let PROT_WRITE imply PROT_READ as is the case on other
> architectures.
>
> Note that this also allows PROT_WRITE|PROT_EXEC mappings which were
> disallowed prior to the aforementioned commit; PROT_READ is implied in
> such mappings as well.
>
> Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is invalid")
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
> ---
> v1 -> v2: Update access_error() to account for write-implies-read
> ---
>  arch/riscv/kernel/sys_riscv.c | 3 ---
>  arch/riscv/mm/fault.c         | 3 ++-
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 571556bb9261..5d3f2fbeb33c 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -18,9 +18,6 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>         if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>                 return -EINVAL;
>
> -       if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> -               return -EINVAL;
> -
>         return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>                                offset >> (PAGE_SHIFT - page_shift_offset));
>  }
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index f2fbd1400b7c..d86f7cebd4a7 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -184,7 +184,8 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
>                 }
>                 break;
>         case EXC_LOAD_PAGE_FAULT:
> -               if (!(vma->vm_flags & VM_READ)) {
> +               /* Write implies read */
> +               if (!(vma->vm_flags & (VM_READ | VM_WRITE))) {
>                         return true;
>                 }
>                 break;

This should be a separate patch with commit text about VMA permissions.

> --
> 2.25.1
>

Otherwise, lgtm.

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
