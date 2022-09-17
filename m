Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D22ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 23:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpgMY/126FTFWvogyGQGzicqDoqR+Lh/B5Iof4m6gtQ=; b=1O1pZa5ZqfK9pr
	6bYFnHoR4RWuZbllLVZvzvO0Lej00kQNlHM1mFMzORTVnbd8dBkTlT3F9xrQcdZJzwoohpRqg2L8C
	q/BPDvOi4dIwMeFXPPfp5Hi12t5b7XKOzciDgLmgd2WAvi7fxEL4/NhFfUZJ56RxEwxIOOxLR0cWJ
	x6Au7aGLVJ/lTQ+2gMXLGyD3fbLU5z+Jk5q0+Z5d9aFez36A5S6t9+qAfEA62OphYgh7hkpTNWeHv
	NPk0Ry533Us9suKVR+n5sEWIEe5Xc6crpB7NN7iYuqT7dWUM27xMeLU+CXFgDVqEAV88vKO1NYB3g
	HrPQirMBMIeRXwPd3hLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZhic-00AixH-N7; Sat, 17 Sep 2022 23:59:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZhiZ-00AiwB-Io
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 23:59:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1E0D61231
	for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 23:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E73CC43140
	for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 23:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663459166;
	bh=SOyAx3uO6Ij43egFNjlPCu3aKVH8OQF5a5pVD/Xr/D0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XItGQYK/4Q/7VfqdyVGOlmBNtUMM0JwA5OeDWTkEZzcJATny2EjhiERgPjFvvdP3Z
	 8zV51DvPFhnwN4rRZvzQMCBWSE+ckn0bb60ZAM6oSbg3poS8OXBqZrSQzVdvHhB5F7
	 2cR0AKQDpv1Al4u8YWKo1Fm0rraly4cd3XqlPq8++S0pAUKtqXjL2tYNq+2LCfsj99
	 eloLEuDAbDaSlcU/gGq/xEZS39U8gRVqOWnnSvE7zBx1wEBuN0NOy+jDcI/CxoODtE
	 u8jAAV4nJrEzj4a3jk4eR9eeilI6l+7TSHwnK3GkVXCn2QSwJSr/GKWYbvDVemeqDF
	 ftguQt9SaqAEQ==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-11e9a7135easo57245065fac.6
        for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 16:59:26 -0700 (PDT)
X-Gm-Message-State: ACgBeo0adDXXfAaEgV8FqqKc0b4b3Q9uvtH4pbdu+ZA612Vl6I5ju40g
	F00DuzrHZPRhPy7k1lwMyBBR40vH6ICj0nNQOKE=
X-Google-Smtp-Source: AA6agR5NQ79T9y9MuR5qQaz074qLN4YPCrc0PAnqULwyaGD2i9ueXJSKR9U6r0TISLJPw/lpnTwkpV7qLH/xM4Z2a7E=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr11810209oao.112.1663459165300; Sat, 17
 Sep 2022 16:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAJF2gTRCkNHdE+JoLV=T7_D0eTaxDdjzoJ5fCJnUB_-ED+CrfA@mail.gmail.com>
 <20220917183849.589593-1-guoren@kernel.org>
In-Reply-To: <20220917183849.589593-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 18 Sep 2022 07:59:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQE-ihzkYGf6QwfbT=WZPrTabc0SRet4N1w+5E-9esw3A@mail.gmail.com>
Message-ID: <CAJF2gTQE-ihzkYGf6QwfbT=WZPrTabc0SRet4N1w+5E-9esw3A@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch function
To: guoren@kernel.org
Cc: andy.chiu@sifive.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	greentime.hu@sifive.com, jbaron@akamai.com, jpoimboe@kernel.org, 
	kernel@esmil.dk, linux-riscv@lists.infradead.org, mingo@redhat.com, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, peterz@infradead.org, 
	rostedt@goodmis.org, zong.li@sifive.com, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_165927_724419_4AFB8E23 
X-CRM114-Status: GOOD (  21.25  )
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

On Sun, Sep 18, 2022 at 2:39 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Reduce size of static branch.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/jump_label.h | 17 ++++++++++-----
>  arch/riscv/kernel/jump_label.c      | 32 +++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> index 38af2ec7b9bf..78f747dfa8a2 100644
> --- a/arch/riscv/include/asm/jump_label.h
> +++ b/arch/riscv/include/asm/jump_label.h
> @@ -12,17 +12,21 @@
>  #include <linux/types.h>
>  #include <asm/asm.h>
>
> +#ifdef CONFIG_RISCV_ISA_C
> +#define JUMP_LABEL_NOP_SIZE 2
> +#else
>  #define JUMP_LABEL_NOP_SIZE 4
> +#endif
>
>  static __always_inline bool arch_static_branch(struct static_key *key,
>                                                bool branch)
>  {
>         asm_volatile_goto(
> -               "       .option push                            \n\t"
> -               "       .option norelax                         \n\t"
> -               "       .option norvc                           \n\t"
> +#ifdef CONFIG_RISCV_ISA_C
> +               "1:     c.nop                                   \n\t"
> +#else
>                 "1:     nop                                     \n\t"
> -               "       .option pop                             \n\t"
> +#endif
>                 "       .pushsection    __jump_table, \"aw\"    \n\t"
>                 "       .align          " RISCV_LGPTR "         \n\t"
>                 "       .long           1b - ., %l[label] - .   \n\t"
We should check the range during compile time, here. Run-time checking
is the last and most painful method to prevent some errors.

> @@ -39,11 +43,14 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key,
>                                                     bool branch)
>  {
>         asm_volatile_goto(
> +#ifdef CONFIG_RISCV_ISA_C
> +               "1:     c.j             %l[label]               \n\t"
> +#else
>                 "       .option push                            \n\t"
>                 "       .option norelax                         \n\t"
> -               "       .option norvc                           \n\t"
>                 "1:     jal             zero, %l[label]         \n\t"
>                 "       .option pop                             \n\t"
> +#endif
>                 "       .pushsection    __jump_table, \"aw\"    \n\t"
>                 "       .align          " RISCV_LGPTR "         \n\t"
>                 "       .long           1b - ., %l[label] - .   \n\t"
> diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
> index e6694759dbd0..64a4e5df093d 100644
> --- a/arch/riscv/kernel/jump_label.c
> +++ b/arch/riscv/kernel/jump_label.c
> @@ -11,21 +11,52 @@
>  #include <asm/bug.h>
>  #include <asm/patch.h>
>
> +#ifdef CONFIG_RISCV_ISA_C
> +#define RISCV_INSN_C_NOP 0x0001U
> +#define RISCV_INSN_C_JAL 0xa001U
> +#else
>  #define RISCV_INSN_NOP 0x00000013U
>  #define RISCV_INSN_JAL 0x0000006fU
> +#endif
>
>  void arch_jump_label_transform(struct jump_entry *entry,
>                                enum jump_label_type type)
>  {
>         void *addr = (void *)jump_entry_code(entry);
> +#ifdef CONFIG_RISCV_ISA_C
> +       u16 insn;
> +#else
>         u32 insn;
> +#endif
>
>         if (type == JUMP_LABEL_JMP) {
>                 long offset = jump_entry_target(entry) - jump_entry_code(entry);
> +#ifdef CONFIG_RISCV_ISA_C
> +               if (WARN_ON(offset & 1 || offset < -2048 || offset >= 2048))
> +                       return;
>
> +               /*
> +                * 001 | imm[11|4|9:8|10|6|7|3:1|5] 01 - C.JAL
> +                */
> +               insn = RISCV_INSN_C_JAL |
> +                       (((u16)offset & GENMASK(5, 5)) >> (5 - 2)) |
> +                       (((u16)offset & GENMASK(3, 1)) << (3 - 1)) |
> +                       (((u16)offset & GENMASK(7, 7)) >> (7 - 6)) |
> +                       (((u16)offset & GENMASK(6, 6)) << (7 - 6)) |
> +                       (((u16)offset & GENMASK(10, 10)) >> (10 - 8)) |
> +                       (((u16)offset & GENMASK(9, 8)) << (9 - 8)) |
> +                       (((u16)offset & GENMASK(4, 4)) << (11 - 4)) |
> +                       (((u16)offset & GENMASK(11, 11)) << (12 - 11));
> +       } else {
> +               insn = RISCV_INSN_C_NOP;
> +       }
> +#else
>                 if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
For the unify, it also should be:
                   if (WARN_ON(offset & 1 || offset < -2048 || offset >= 2048))

After some tests, 2048 is enough for the current riscv Linux.

>                         return;
>
> +               /*
> +                * imm[20|10:1|11|19:12] | rd | 1101111 - JAL
> +                */
>                 insn = RISCV_INSN_JAL |
>                         (((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
>                         (((u32)offset & GENMASK(11, 11)) << (20 - 11)) |
> @@ -34,6 +65,7 @@ void arch_jump_label_transform(struct jump_entry *entry,
>         } else {
>                 insn = RISCV_INSN_NOP;
>         }
> +#endif
>
>         mutex_lock(&text_mutex);
>         patch_text_nosync(addr, &insn, sizeof(insn));
> --
> 2.36.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
