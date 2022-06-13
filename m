Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06262C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 05:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOSyxowDFMzonBldcmEhQ6zinpbxFTaaM9wyt8Y8pLQ=; b=SmntPoCWMy4hLk
	il+PIM2PU65vGOU18jCr3PoAWccmapkeqG5PcwG0y3F8kmdW5MZLN0+QwQNYHVPf/rClI+1OIt2Xa
	oBelV6XEELX9ee+rJVcJcpn3EJWxRaCNpzz1bRNy8ynqFvjN2iYUJEsXkOEaA0F3uJMCnkmeEnqrq
	nuNk9KHhl2auVb45CZDHKzKyWpGnqJN7x5bALkd4oZsjCW3g+bZKiZb0rcMz2TG6YTLGuQ1nDUb1D
	LJ1+3NgLVp1oQImYnFT0aZmsDvu6Fw2SzeGQtudKWClYNr2BJT5kuzHOs/v43m5JoKZxg7m8whv8v
	QjYt9MGtWb7J+9PlFp5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0csa-001X6K-Su; Mon, 13 Jun 2022 05:44:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0csW-001X4p-St
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 05:44:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED4E660BB9
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jun 2022 05:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD0EC385A5
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jun 2022 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655099081;
	bh=70g/7M7E9P4sEW/N+16rq9stI2Il55a/CvsfR3Q+UXI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rZfnDSf147CzRKRQfx3b8bxpMJdLKRX3I7l1A3qaUsRXb4YxvOLd6h0tZvsEVV1nq
	 /6ATAWMhrylOltTjVUebdUPnweUeOrixVIVf0fOYVqK5XuSt5SZnOLjFxGVoVtN7wq
	 OADhSOpfcxDc+pa5c9D3KKXDhPXbwFliZ6Ipo+rDHBZEx5jwWAFmsd8Us1viN0V9B8
	 Xl7jSlTU/MHQSYqNjv+uyQqfQSO6z8KArB/EL+9jsLu0KI2jbh0HbtnDORTlgNV8hN
	 KkpiiGpl+yCD3S9Qr67ETnRkUabyfGb3fzDT47TlDH7es3p3HH+yxJOD+PxrYKzLk3
	 c9ExWN1o7BQdg==
Received: by mail-vs1-f49.google.com with SMTP id g6so4899959vsb.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jun 2022 22:44:41 -0700 (PDT)
X-Gm-Message-State: AOAM533pmHZ+xzKj+fTx9oN5/R+XxVhScsQAW443ZfM7GRJTKCUX8Zxl
	pN2WBvSo386zDrJhpd4XP9G7HaPSrVpZu6poF9U=
X-Google-Smtp-Source: ABdhPJxCp/wtzjVsx31yKJJjCVOmmnKZxkSlyKmTeNj9LTIY1WNb8RPcBhFeLWc3exKrFFkprr5UpZgcnburuvnjrlc=
X-Received: by 2002:a05:6102:22c2:b0:34b:9163:c6ab with SMTP id
 a2-20020a05610222c200b0034b9163c6abmr21818282vsh.8.1655099080281; Sun, 12 Jun
 2022 22:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <PH7PR14MB5594801243EB482C01963A2FCEAB9@PH7PR14MB5594.namprd14.prod.outlook.com>
In-Reply-To: <PH7PR14MB5594801243EB482C01963A2FCEAB9@PH7PR14MB5594.namprd14.prod.outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Jun 2022 13:44:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQjR_iqbH3ee1GYRnPCQdn79p+vK5-FiKZiTQNZFhPyeA@mail.gmail.com>
Message-ID: <CAJF2gTQjR_iqbH3ee1GYRnPCQdn79p+vK5-FiKZiTQNZFhPyeA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: don't allow write but not read page mapping
 request in mmap
To: Celeste Liu <coelacanthus@outlook.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, xctan <xc-tan@outlook.com>, dram <dramforever@live.com>, 
	Ruizhe Pan <c141028@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_224445_053840_C8878BF2 
X-CRM114-Status: GOOD (  25.60  )
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

On Mon, Jun 13, 2022 at 1:20 PM Celeste Liu <coelacanthus@outlook.com> wrote:
>
> When xctan tries to run one of libaio's tests
> (https://pagure.io/libaio/blob/1b18bfafc6a2f7b9fa2c6be77a95afed8b7be448/f/harness/cases/5.t),
> it encounters a strange behavior: for the same PROT_WRITE only mapping,
> there was a discrepancy in whether it could be read before and after writing
> (readable before writing, unreadable after writing). After some investigation,
> I found that mmap allows write only mapping, an undefined behavior, on RISC-V.
>
> As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3 version
> "20211203 Privileged Architecture v1.12, Ratified"[1], the PTE permission
> bit combination of "write+!read" is "Reserved for future use.". Hence, don't
> allow such mapping request in mmap call. In the current code[2], write+exec
> only is marked as invalid, but write only is not marked as invalid.
>
> This patch refines that judgment.
>
> [1]: https://github.com/riscv/riscv-isa-manual/releases/download/Priv-v1.12/riscv-privileged-20211203.pdf
> [2]: modified in commit e0d17c842c0f824fd4df9f4688709fc6907201e1
>      (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e0d17c842c0f824fd4df9f4688709fc6907201e1)
>
> Reported-by: xctan <xc-tan@outlook.com>
> Co-developed-by: dram <dramforever@live.com>
> Signed-off-by: dram <dramforever@live.com>
> Co-developed-by: Ruizhe Pan <c141028@gmail.com>
> Signed-off-by: Ruizhe Pan <c141028@gmail.com>
> Signed-off-by: Celeste Liu <coelacanthus@outlook.com>
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Yash Shah <yash.shah@sifive.com>
> ---
> v2: This version adds a link to the referenced spec, and reference of the
> previous related modification.
>
>  arch/riscv/kernel/sys_riscv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 9c0194f176fc..571556bb9261 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -18,9 +18,8 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>         if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>                 return -EINVAL;
>
> -       if ((prot & PROT_WRITE) && (prot & PROT_EXEC))
Yes, PROT_EXEC would prevent next PROT_READ check.

Looks good to me.

Reviewed-by: Guo Ren <guoren@kernel.org>

> -               if (unlikely(!(prot & PROT_READ)))
> -                       return -EINVAL;
Could we put your comment here?

/*
 * As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3 version
 * "20211203 Privileged Architecture v1.12, Ratified"[1], the PTE permission
 * bit combination of "write+!read" is "Reserved for future use.". Hence, don't
 * allow such mapping request in mmap call. In the current code[2], write+exec
 * only is marked as invalid, but write only is not marked as invalid.
 */

> +       if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> +               return -EINVAL;
>
>         return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>                                offset >> (PAGE_SHIFT - page_shift_offset));
> --
> 2.36.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
