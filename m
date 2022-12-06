Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2DCC352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 04:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZFPQIMbNxFagdQIUz431dAMrjy8fJ4Oba/ntsHlXv0=; b=CAhH+WsqNvtHth
	zYO/swYam4PjpeD0DYjAtr9R1xQo0Mg2fQTdZ1QBEC2eXCTu9J+YWgXuzk5ZR24bbS8o0J6OIQ2M1
	wJR7PPAEdnT/F/t5hGNLzUd6PQvQmD7l/ZqCOqYmpGqp7kFtByGiNl9LQfVC8AC/gkk4/bHLhyixR
	vJU1fXs0Nrsl7fcUBJ1Qyl8O/1xkCsfVkirFx1zDw4IG2GVC6+xXZ3Z8N7eCFfcbCm/HqaHI7lzhV
	qtAZ8rqyM+dUPkwG1tfGER9zgspvkUrtjWxPYVzFcuBd/Oh92h8A3cZeOQ+1FnhKgStyaOtXwsgwm
	2r6ZLntvAQAKsTqefrMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2PfW-0001yE-CB; Tue, 06 Dec 2022 04:34:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2PfT-0001lW-3O; Tue, 06 Dec 2022 04:34:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 729BC61553;
	Tue,  6 Dec 2022 04:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61B4C433C1;
	Tue,  6 Dec 2022 04:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670301293;
	bh=msa/VwPes92I5wu/vP8BsHcD7BgDu9WgymdDavuJWxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CuN4sq4wwjyML+PXFapg5qJk6mPVkcHbsZuwUZjLtlsZ5kbDTDW9yKUt5aRjbYsRZ
	 /PDYBgG3STC8wsEpxguMFPcLUwY083/OOrBO2grps/+zm4Qg3ZZ9CoYIS9AoEJQoV7
	 abALkPKNw35YJVZKjxYiJLyWXZXbvq1nlub2MzObwFeyNEwLVDlvAM0LZIvDSUAon/
	 DWLJfhyYJ6ASDTbzyTumOv833Xps7A9U+wi7T8TTTDXvijP3eJLJAsSGhj5tlIAC/W
	 sfa6xXY6wzyfzZwYKDbb9WwOZzKjHHAYSKjQRCPTxhC1wRrTXiQbAop/xtGMe9mm8H
	 MVTAiu+BHK01Q==
Received: by mail-ej1-f53.google.com with SMTP id qk9so3376249ejc.3;
        Mon, 05 Dec 2022 20:34:53 -0800 (PST)
X-Gm-Message-State: ANoB5plEHCnzeJTW83YpJxGP0q/q6e9KpPOoEQGvuoSHowxCHMMAYDDb
	I8hkLZITKZgx4OVIv5tF6YF89/gZoaRFXSOce08=
X-Google-Smtp-Source: AA0mqf6GuGvHiOPgth8wIKnoKnt5jLhpQ86kofAEtziMuYgxI4HGvPlxaa3cPf+bC0eiMd9r7hVWqPfgNab+xB5zkpw=
X-Received: by 2002:a17:906:ee2:b0:78d:3f96:b7aa with SMTP id
 x2-20020a1709060ee200b0078d3f96b7aamr56776437eji.74.1670301292065; Mon, 05
 Dec 2022 20:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20221204174632.3677-1-jszhang@kernel.org> <20221204174632.3677-10-jszhang@kernel.org>
 <CAJF2gTRxm7LJFtups5fexJ5ishm9_j3e+yzfKv3nTtQqUtXPtA@mail.gmail.com> <Y44LuRcQYPnVnFje@xhacker>
In-Reply-To: <Y44LuRcQYPnVnFje@xhacker>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Dec 2022 12:34:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ98fyTNc6d3PJrkMjUjUstN8s1FcRNyZQCLiN5CV5NCw@mail.gmail.com>
Message-ID: <CAJF2gTQ98fyTNc6d3PJrkMjUjUstN8s1FcRNyZQCLiN5CV5NCw@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] riscv: switch to relative alternative entries
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_203455_266393_68EB401F 
X-CRM114-Status: GOOD (  30.46  )
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

On Mon, Dec 5, 2022 at 11:28 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Mon, Dec 05, 2022 at 08:51:41AM +0800, Guo Ren wrote:
> > On Mon, Dec 5, 2022 at 1:57 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> > >
> > > Instead of using absolute addresses for both the old instrucions and
> > > the alternative instructions, use offsets relative to the alt_entry
> > > values. So we can not only cut the size of the alternative entry, but
> > > also meet the prerequisite for patching alternatives in the vDSO,
> > > since absolute alternative entries are subject to dynamic relocation,
> > > which is incompatible with the vDSO building.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  arch/riscv/errata/sifive/errata.c           |  4 +++-
> > >  arch/riscv/errata/thead/errata.c            | 11 ++++++++---
> > >  arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
> > >  arch/riscv/include/asm/alternative.h        | 12 ++++++------
> > >  arch/riscv/kernel/cpufeature.c              | 13 ++++++-------
> > >  5 files changed, 33 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> > > index 1031038423e7..0e537cdfd324 100644
> > > --- a/arch/riscv/errata/sifive/errata.c
> > > +++ b/arch/riscv/errata/sifive/errata.c
> > > @@ -107,7 +107,9 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
> > >
> > >                 tmp = (1U << alt->errata_id);
> > >                 if (cpu_req_errata & tmp) {
> > > -                       patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > > +                       patch_text_nosync((void *)&alt->old_offset + alt->old_offset,
> > > +                                         (void *)&alt->alt_offset + alt->alt_offset,
> >  (void *)&alt->alt_offset + alt->alt_offset. ??!!
>
> Hi Guo,
>
> what's the problem? I can't catch your meaning, could you please proide
> more details?
Can you explain why:

alt->old_ptr = (void *)&alt->old_offset + alt->old_offset

| offset | <- &offset
| ...       |
| value | <- ptr = &offset + offset

I don't make sense of the above.

>
> Thanks
>
> >
> > > +                                         alt->alt_len);
> > >                         cpu_apply_errata |= tmp;
> > >                 }
> > >         }
> > > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> > > index 21546937db39..2a6e335b5a32 100644
> > > --- a/arch/riscv/errata/thead/errata.c
> > > +++ b/arch/riscv/errata/thead/errata.c
> > > @@ -68,6 +68,7 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
> > >         struct alt_entry *alt;
> > >         u32 cpu_req_errata = thead_errata_probe(stage, archid, impid);
> > >         u32 tmp;
> > > +       void *oldptr, *updptr;
> > >
> > >         for (alt = begin; alt < end; alt++) {
> > >                 if (alt->vendor_id != THEAD_VENDOR_ID)
> > > @@ -77,12 +78,16 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
> > >
> > >                 tmp = (1U << alt->errata_id);
> > >                 if (cpu_req_errata & tmp) {
> > > +                       oldptr = (void *)&alt->old_offset + alt->old_offset;
> > > +                       updptr = (void *)&alt->alt_offset + alt->alt_offset;
> > > +
> > >                         /* On vm-alternatives, the mmu isn't running yet */
> > >                         if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > > -                               memcpy((void *)__pa_symbol(alt->old_ptr),
> > > -                                      (void *)__pa_symbol(alt->alt_ptr), alt->alt_len);
> > > +                               memcpy((void *)__pa_symbol(oldptr),
> > > +                                      (void *)__pa_symbol(updptr),
> > > +                                      alt->alt_len);
> > >                         else
> > > -                               patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > > +                               patch_text_nosync(oldptr, updptr, alt->alt_len);
> > >                 }
> > >         }
> > >
> > > diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> > > index ec2f3f1b836f..dd40727bc859 100644
> > > --- a/arch/riscv/include/asm/alternative-macros.h
> > > +++ b/arch/riscv/include/asm/alternative-macros.h
> > > @@ -7,11 +7,11 @@
> > >  #ifdef __ASSEMBLY__
> > >
> > >  .macro ALT_ENTRY oldptr newptr vendor_id errata_id new_len
> > > -       RISCV_PTR \oldptr
> > > -       RISCV_PTR \newptr
> > > -       REG_ASM \vendor_id
> > > -       REG_ASM \new_len
> > > -       .word   \errata_id
> > > +       .long \oldptr - .
> > > +       .long \newptr - .
> > > +       .short \vendor_id
> > > +       .short \new_len
> > > +       .long \errata_id
> > >  .endm
> > >
> > >  .macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c : vararg
> > > @@ -75,11 +75,11 @@
> > >  #include <linux/stringify.h>
> > >
> > >  #define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)                \
> > > -       RISCV_PTR " " oldptr "\n"                                       \
> > > -       RISCV_PTR " " newptr "\n"                                       \
> > > -       REG_ASM " " vendor_id "\n"                                      \
> > > -       REG_ASM " " newlen "\n"                                         \
> > > -       ".word " errata_id "\n"
> > > +       ".long  ((" oldptr ") - .) \n"                                  \
> > > +       ".long  ((" newptr ") - .) \n"                                  \
> > > +       ".short " vendor_id "\n"                                        \
> > > +       ".short " newlen "\n"                                           \
> > > +       ".long  " errata_id "\n"
> > >
> > >  #define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)           \
> > >         ".if " __stringify(enable) " == 1\n"                            \
> > > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > > index 33eae9541684..3baf32e05b46 100644
> > > --- a/arch/riscv/include/asm/alternative.h
> > > +++ b/arch/riscv/include/asm/alternative.h
> > > @@ -33,12 +33,12 @@ void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> > >                                int patch_offset);
> > >
> > >  struct alt_entry {
> > > -       void *old_ptr;           /* address of original instruciton or data  */
> > > -       void *alt_ptr;           /* address of replacement instruction or data */
> > > -       unsigned long vendor_id; /* cpu vendor id */
> > > -       unsigned long alt_len;   /* The replacement size */
> > > -       unsigned int errata_id;  /* The errata id */
> > > -} __packed;
> > > +       s32 old_offset;         /* offset to original instruciton or data  */
> > > +       s32 alt_offset;         /* offset to replacement instruction or data */
> > > +       u16 vendor_id;          /* cpu vendor id */
> > > +       u16 alt_len;            /* The replacement size */
> > > +       u32 errata_id;          /* The errata id */
> > > +};
> > >
> > >  struct errata_checkfunc_id {
> > >         unsigned long vendor_id;
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 6244be5cd94a..adeac90b1d8e 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -257,6 +257,7 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > >                                                   unsigned int stage)
> > >  {
> > >         struct alt_entry *alt;
> > > +       void *oldptr, *updptr;
> > >
> > >         if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > >                 return;
> > > @@ -270,17 +271,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > >                         continue;
> > >                 }
> > >
> > > +               oldptr = (void *)&alt->old_offset + alt->old_offset;
> > > +               updptr = (void *)&alt->alt_offset + alt->alt_offset;
> > >                 if (!__riscv_isa_extension_available(NULL, alt->errata_id))
> > >                         continue;
> > >
> > >                 /* do the basic patching */
> > > -               patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > > -               riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> > > -                                                alt->alt_len,
> > > -                                                alt->old_ptr - alt->alt_ptr);
> > > -               riscv_alternative_fix_jal(alt->old_ptr,
> > > -                                         alt->alt_len,
> > > -                                         alt->old_ptr - alt->alt_ptr);
> > > +               patch_text_nosync(oldptr, updptr, alt->alt_len);
> > > +               riscv_alternative_fix_auipc_jalr(oldptr, alt->alt_len, oldptr - updptr);
> > > +               riscv_alternative_fix_jal(oldptr, alt->alt_len, oldptr - updptr);
> > >         }
> > >  }
> > >  #endif
> > > --
> > > 2.37.2
> > >
> >
> >
> > --
> > Best Regards
> >  Guo Ren



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
