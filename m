Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CECC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 07:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/MEUlr6v2yVotW7yrblemz4LkqG+BmXJ0KK6kzr68U=; b=dOYKSVBeV2rQMd
	HSFemX5zovLeKvFx/m0NUAbYO87m0ds9ybMFmF/xSJ+/BED1vFCSbU9reD3mbt9BhWNmNKp1vxlne
	uGrBRQbwtlxxJaGEk0epe9xll1X7sXsrokvBhuvWwc8irkqmW1LUv9CY3yHJffgAS9dCsQeHp+3uL
	MdBFQQ5NRFSaH5zBu5ywXWZGiXaNcXtfv+OTyIyNrv6qV5W0aYcM51Ed48VF9QKEIKYuK+gYiBByV
	dks1TP7rigSqxHDqtmI3hKFowR54wa1W8doCI5WzyvOE0JgXsK5DOVOBwIR4cPk5SuKOUNzeNW/Ie
	3TxxTYf3VbxjwU3IBrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpn8y-004Bvu-KJ; Wed, 24 Nov 2021 07:56:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpn8k-004BqO-Iz
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 07:56:28 +0000
Received: by mail-wr1-x433.google.com with SMTP id u18so2549101wrg.5
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 23:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VcjV0C2JAXQBDDMbeL+36DJY0eId/oRoFF8TPI/gCJ4=;
 b=vONA1Ak/5UD9tljIcxnytqMG5YKidkdZz2f3W5ZzKHTbuIByttaBV+eIc7p2lRydf/
 YJKoQqzF3ajYpF9yBD9eYQuneWienGrxoPW5+P6MN4yabn/h7mnTtgWquaITDNRI8R4H
 u0SqAqSeoqsrcAYYMu9BVVtq1JOTsb2a51bDv14M5s0238rw9P1n1ERe+Fvg4fPuVjfp
 Lecc3fyeqhMSPg8slhwX2Jn0yiXWqzuddt6/vxM3YWTlOiY211eCzQgK0xCn/Zuu51yl
 H3Zs3+BDIjy4emAs9OdZgbvx2RUwNmltWywZpMQrYILSRI+k4NR3+GbJ6VKvdZWcRObP
 UHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VcjV0C2JAXQBDDMbeL+36DJY0eId/oRoFF8TPI/gCJ4=;
 b=nGbU+wuLhKdf9KnDqUkQ6Bzeu6Jzh8QX7cfF/cHg9BBoo4L2TuJAAxQuPN/DHvXiLh
 Xw0LhnWQ79YMPxBF8ZaYb8Ugfr+cV8jl2/TXbMl1dxrapQeClrW6WSGjuFjtdaD7o6GI
 mY8OOWTWrHVoR1XZdgDYRHV5RDU4QM64VzJZ73msHaflXDLV8M1GUnemI4vE7qF+Oafa
 w7DKXXp9bX/W35GK9ImtxMFHH0OpVXRF9YzVwGmFVlO3f/EKWZNHlzD6Gwr6p7QdQKt7
 bSEsNdrGddeN/vCZ6i1S1aKjM/Lt78M511px4+f2QV+xIoQun11cFeFQmlK7Hb8oRNCA
 l9JA==
X-Gm-Message-State: AOAM533Owi8nFZjbPE92s9XPtayV7YOCmJn94Vgd3nvLvqaf4p7uCSOD
 LDoPchI817rkSUvQjADp7+Fpqxs4sN76QJ/CWTZ3gw==
X-Google-Smtp-Source: ABdhPJwClJrX6knE8UTXut3s66kbbEuDAMqdQwXZqQSH7GKDBVNtaOB2rrww6+y9qLtab1P5o7Gg1d/oHpIJdpt7us4=
X-Received: by 2002:a05:6000:168e:: with SMTP id
 y14mr15173772wrd.331.1637740584557; 
 Tue, 23 Nov 2021 23:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20211124060521.614015-1-guoren@kernel.org>
 <CAAhSdy1CZbdAPEYxFOhrn=wUcmc9Yea0ziMUmHjaudKdH2Yw1w@mail.gmail.com>
 <CAJF2gTRAXAmo4cVSfArf=eMU9CxXZr3kjaKcQ1u8764cnL+N_Q@mail.gmail.com>
In-Reply-To: <CAJF2gTRAXAmo4cVSfArf=eMU9CxXZr3kjaKcQ1u8764cnL+N_Q@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 24 Nov 2021 13:26:13 +0530
Message-ID: <CAAhSdy2_Vk5nPMUOni5JctV8Jd9NYh-WK=yZPXTN_yzaNdy-4g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixup one-page wasting
To: Guo Ren <guoren@kernel.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <Atish.Patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_235626_705156_5E1466D4 
X-CRM114-Status: GOOD (  20.90  )
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

On Wed, Nov 24, 2021 at 12:52 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Nov 24, 2021 at 2:55 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Wed, Nov 24, 2021 at 11:35 AM <guoren@kernel.org> wrote:
> > >
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > For small memory systems(Allwinner D1s/F133), one page size memory
> > > cannot be ignored.
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Cc: Alexandre Ghiti <alex@ghiti.fr>
> > > Cc: Anup Patel <anup@brainfault.org>
> > > Cc: Atish Patra <Atish.Patra@wdc.com>
> >
> > This PATCH breaks the CPU hotplug functionality.
> >
> > When a CPU/HART is turned off and turned on at runtime, the
> > low-level relocate() will be called to enable MMU on the CPU
> > being brought-up which in-turn uses trampoline_pg_dir.
> Yeah, I forgot that.
>
> How about removing trampoline_pg_dir totally and using
> early_pg_dir/swapper_pg_dir for relocate directly?

The trampoline_pg_dir is to handle the case when RAM is
large enough such that RAM physical address range overlaps
kernel virtual address range (i.e. VA >= PAGE_OFFSET). This
is overlap of virtual address range and physical address range
can be problematic for low-level code which is trying to enable
MMU (such as the relocate() function).

Here's a old kernel thread which tries to summarize this:
https://lore.kernel.org/lkml/CAAhSdy3URWHVY_GPNb2yRBuctRELRtTTWPM2OpwUVSRFAyXyiA@mail.gmail.com/

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> > > ---
> > >  arch/riscv/mm/init.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index 24b2b8044602..097bb3bc4020 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -241,9 +241,9 @@ unsigned long riscv_pfn_base __ro_after_init;
> > >  EXPORT_SYMBOL(riscv_pfn_base);
> > >
> > >  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> > > -pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> > >  static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> > >
> > > +pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
> > >  pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
> > >  static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> > >
> > > --
> > > 2.25.1
> > >
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
