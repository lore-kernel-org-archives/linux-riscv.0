Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD87ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 00:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JU/LHZM0aPGcK1nkbrAywfImMxvK7fP3c9FDUWmk/cQ=; b=R0MUSTXQrZpzRh
	C5au2Ivcs705Z/IaCxYEAn31PPlXnDwzsiqzC4EXxacJMc038lEDXXoIeF3hcIgGwMkg8vT/2olUt
	NElSecD0YSFguWUBgphQraZEufuuqm9Ca2JMDG9fA5v+mv4NJBdBTwig9vLCmhMuaFnNurQKeGXbK
	Yays09v4CTimAFmaFKi6LJFMthqlfrVBN8un7UZI4rYN0psM1qR95/PlQZ4rP0uS8ZaITSQbaLyv+
	BL9UbWymdx+FdXNucEcp7O5jG45lNZluba9zWH7rbwpYEWozhIa/ZU6I6uTkmhdLDm/N4JEGiNVTy
	OmIHhzjK64qNiXUbENBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZiSH-00AtBo-V8; Sun, 18 Sep 2022 00:46:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZiSE-00AtAh-Nk
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 00:46:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E8BB610A2
	for <linux-riscv@lists.infradead.org>; Sun, 18 Sep 2022 00:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5909C433D6
	for <linux-riscv@lists.infradead.org>; Sun, 18 Sep 2022 00:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663461995;
	bh=kNgbNMNP290V3aZ2d7O+uUX+4ZLtkNKMlrdOY3u+Q4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a0jS+Ng7j8Qu6Gs3mWaS1cC6eo9Ojkp7Devnq9MY4mZSNVcXwK/i1eJgcHy7cJmsz
	 /1J2tnRVFJ8C0xtpcy9fbdhkFo2/VFe4HMe7lxIFxRGRdIbwBzhS1MGyl3tdTf0DVL
	 zOBbNZx9kGHbXpUWzGZkPr1akWjXzdESNiLF+BuStRcfr+Wrb9+Y5Nd4xUFUmHA1BE
	 Udfkv4XVYMPKbjVWtuYABYKvU5cfq3knBUF3BmlDVexyT82775JzCQjXdplfcId3k/
	 Jy6DDdLo7fYq/VtRFH4CQhHZDulFaLamggo3vtLaxxkLCtQ+NnK9anxT5wbSUI2crr
	 b7muz8RbBGNkw==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-12b542cb1d3so47535505fac.13
        for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 17:46:35 -0700 (PDT)
X-Gm-Message-State: ACgBeo2yK+VebVOiPeNYRmrZda9l0rghwgvjEwqzeyhCzJVQT31Lo1kO
	n3Jy2nzEa9D9q44/5EU/VGqgZPlAPJeMzipNWIk=
X-Google-Smtp-Source: AA6agR4YSPxymV/Czk/nMbVRxgblNM9fqhq8HCAZd1XGWz6SIr1AJLLn6cpHaawQ2aUSzv4YkQxSb+UybeeqETRYLVM=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr11871319oao.112.1663461994931; Sat, 17
 Sep 2022 17:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAJF2gTRCkNHdE+JoLV=T7_D0eTaxDdjzoJ5fCJnUB_-ED+CrfA@mail.gmail.com>
 <20220917183849.589593-1-guoren@kernel.org> <8496B5FE-1CB6-4C5C-AA83-482AE7E97B26@jrtc27.com>
In-Reply-To: <8496B5FE-1CB6-4C5C-AA83-482AE7E97B26@jrtc27.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 18 Sep 2022 08:46:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT380ivXxPAYTyGtbTCcMX2xRw11SFkQZz9Bt-g4eRmmQ@mail.gmail.com>
Message-ID: <CAJF2gTT380ivXxPAYTyGtbTCcMX2xRw11SFkQZz9Bt-g4eRmmQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch function
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ard Biesheuvel <ardb@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, jbaron@akamai.com, 
	jpoimboe@kernel.org, kernel@esmil.dk, 
	linux-riscv <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Peter Zijlstra <peterz@infradead.org>, rostedt@goodmis.org, Zong Li <zong.li@sifive.com>, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_174638_956438_629EA172 
X-CRM114-Status: GOOD (  24.77  )
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

On Sun, Sep 18, 2022 at 8:12 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 17 Sept 2022, at 19:38, guoren@kernel.org wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Reduce size of static branch.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> > arch/riscv/include/asm/jump_label.h | 17 ++++++++++-----
> > arch/riscv/kernel/jump_label.c      | 32 +++++++++++++++++++++++++++++
> > 2 files changed, 44 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> > index 38af2ec7b9bf..78f747dfa8a2 100644
> > --- a/arch/riscv/include/asm/jump_label.h
> > +++ b/arch/riscv/include/asm/jump_label.h
> > @@ -12,17 +12,21 @@
> > #include <linux/types.h>
> > #include <asm/asm.h>
> >
> > +#ifdef CONFIG_RISCV_ISA_C
> > +#define JUMP_LABEL_NOP_SIZE 2
> > +#else
> > #define JUMP_LABEL_NOP_SIZE 4
> > +#endif
> >
> > static __always_inline bool arch_static_branch(struct static_key *key,
> >                                              bool branch)
> > {
> >       asm_volatile_goto(
> > -             "       .option push                            \n\t"
> > -             "       .option norelax                         \n\t"
> > -             "       .option norvc                           \n\t"
> > +#ifdef CONFIG_RISCV_ISA_C
> > +             "1:     c.nop                                   \n\t"
> > +#else
> >               "1:     nop                                     \n\t"
> > -             "       .option pop                             \n\t"
> > +#endif
> >               "       .pushsection    __jump_table, \"aw\"    \n\t"
> >               "       .align          " RISCV_LGPTR "         \n\t"
> >               "       .long           1b - ., %l[label] - .   \n\t"
> > @@ -39,11 +43,14 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key,
> >                                                   bool branch)
> > {
> >       asm_volatile_goto(
> > +#ifdef CONFIG_RISCV_ISA_C
> > +             "1:     c.j             %l[label]               \n\t"
> > +#else
> >               "       .option push                            \n\t"
> >               "       .option norelax                         \n\t"
> > -             "       .option norvc                           \n\t"
> >               "1:     jal             zero, %l[label]         \n\t"
> >               "       .option pop                             \n\t"
> > +#endif
> >               "       .pushsection    __jump_table, \"aw\"    \n\t"
> >               "       .align          " RISCV_LGPTR "         \n\t"
> >               "       .long           1b - ., %l[label] - .   \n\t"
> > diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
> > index e6694759dbd0..64a4e5df093d 100644
> > --- a/arch/riscv/kernel/jump_label.c
> > +++ b/arch/riscv/kernel/jump_label.c
> > @@ -11,21 +11,52 @@
> > #include <asm/bug.h>
> > #include <asm/patch.h>
> >
> > +#ifdef CONFIG_RISCV_ISA_C
> > +#define RISCV_INSN_C_NOP 0x0001U
> > +#define RISCV_INSN_C_JAL 0xa001U
>
> This is C.J (i.e. JAL X0) not C.JAL (i.e. JAL RA, which is RV32-only
> and not what you want since it clobbers RA).

Sorry for the macro naming bug. I know I'm using c.j.


101 imm[11|4|9:8|10|6|7|3:1|5] 01 C.J

001 imm[11|4|9:8|10|6|7|3:1|5] 01 C.JAL (RV32)

Here is the correction:
-#define RISCV_INSN_C_JAL 0xa001U
+#define RISCV_INSN_C_J   0xa001U



>
> Jess
>
> > +#else
> > #define RISCV_INSN_NOP 0x00000013U
> > #define RISCV_INSN_JAL 0x0000006fU
> > +#endif
> >
> > void arch_jump_label_transform(struct jump_entry *entry,
> >                              enum jump_label_type type)
> > {
> >       void *addr = (void *)jump_entry_code(entry);
> > +#ifdef CONFIG_RISCV_ISA_C
> > +     u16 insn;
> > +#else
> >       u32 insn;
> > +#endif
> >
> >       if (type == JUMP_LABEL_JMP) {
> >               long offset = jump_entry_target(entry) - jump_entry_code(entry);
> > +#ifdef CONFIG_RISCV_ISA_C
> > +             if (WARN_ON(offset & 1 || offset < -2048 || offset >= 2048))
> > +                     return;
> >
> > +             /*
> > +              * 001 | imm[11|4|9:8|10|6|7|3:1|5] 01 - C.JAL
> > +              */
> > +             insn = RISCV_INSN_C_JAL |
> > +                     (((u16)offset & GENMASK(5, 5)) >> (5 - 2)) |
> > +                     (((u16)offset & GENMASK(3, 1)) << (3 - 1)) |
> > +                     (((u16)offset & GENMASK(7, 7)) >> (7 - 6)) |
> > +                     (((u16)offset & GENMASK(6, 6)) << (7 - 6)) |
> > +                     (((u16)offset & GENMASK(10, 10)) >> (10 - 8)) |
> > +                     (((u16)offset & GENMASK(9, 8)) << (9 - 8)) |
> > +                     (((u16)offset & GENMASK(4, 4)) << (11 - 4)) |
> > +                     (((u16)offset & GENMASK(11, 11)) << (12 - 11));
> > +     } else {
> > +             insn = RISCV_INSN_C_NOP;
> > +     }
> > +#else
> >               if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
> >                       return;
> >
> > +             /*
> > +              * imm[20|10:1|11|19:12] | rd | 1101111 - JAL
> > +              */
> >               insn = RISCV_INSN_JAL |
> >                       (((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
> >                       (((u32)offset & GENMASK(11, 11)) << (20 - 11)) |
> > @@ -34,6 +65,7 @@ void arch_jump_label_transform(struct jump_entry *entry,
> >       } else {
> >               insn = RISCV_INSN_NOP;
> >       }
> > +#endif
> >
> >       mutex_lock(&text_mutex);
> >       patch_text_nosync(addr, &insn, sizeof(insn));
> > --
> > 2.36.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
