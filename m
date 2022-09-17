Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AE1ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 23:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7BZCGVYRAEia1fThy6HOumYxcUoDoIP0oS558AT2Ks=; b=v2fxCyQhKVWZWH
	jfs4S4YXWuu3iYUfbZwUsf5zQzTtffDN4J2E6hSiNaDDlaVVqLXpkId5J88LZwZ5tKlWr3mltV4Rk
	SlGogDxCrPm+XTzQ+wA8lt0WxVlCoybSL8boemBw6Vx8N3UhC1y3HNPqPV+FHO5R8+OF/ZdYxAreI
	TQh6lMvYxH/a+GuUphY6O/yN6mJc16SGDZtpDXEdCPQ1HtqIamOQMo4zw5+y8rMBvLAJuGuixeFIu
	eh6vbQ7ZcBSsjahJ/N4VgyQNbdNC8Th3IQ388HFrKWA4FnTYVccAxH/aB/LEzyDPPw9wRXyRn+AHb
	b6qqq3qN3oPgyD9PsSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZhZF-00AgYG-W1; Sat, 17 Sep 2022 23:49:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZhZD-00AgWp-7s
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 23:49:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A85B8B80E29
	for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 23:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6AEC433B5
	for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 23:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663458583;
	bh=JLxzWgqW+PGmKf2Rh84bOuLU/hkYwXAgeSp4bKIIIsc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uKhHHzz1xAsuP7rn3+Tk7JeF7vyRu4tIXkHuITZpjK/x7h4qUDl56rgpE6Uu1+Z+H
	 jiFTjq5YvZUdwWFCM0m17Y0ECsj7GjDQIzMV/wWVNsYsVPpu/95V4zCuyaNmIRptwP
	 VkI/CGzzxFJz1qxaxDIjbtPaeEnfzCI8rUhAbch0b38GAlhS56bwffbjlngF2habej
	 WPRlW7HNeUa7fvPOBMJX8HYP6SczPJIZdrAjwmzK6+c1GSdqG+g+fI3jpT8yLfCCBA
	 MdR71NiJFfg9OsKcXoV1DquTUBpcTXkV2lPZ1KHbBjMJXCq71p++j0ze4AVcUYWuV/
	 Prt2v15ymMz4g==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-11e9a7135easo57229677fac.6
        for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 16:49:43 -0700 (PDT)
X-Gm-Message-State: ACrzQf12ufeo7u2q6INIkAD/hpcJzs0B8A7ikW53EY5z4hvBWSIy16t4
	/v4GM9Did2RrNmll+ZOWe3IMXq/0lDqceDHrw/s=
X-Google-Smtp-Source: AMsMyM4eO4wJD1Tph72cpS3Tu4WeRCNsKKNFJvG9INUyvNlGo/V8rCuQUxp3UVMSI2sC08JyA1nOZIKcSHKmcw0K64I=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr1729011oap.19.1663458582351; Sat, 17 Sep
 2022 16:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAJF2gTRCkNHdE+JoLV=T7_D0eTaxDdjzoJ5fCJnUB_-ED+CrfA@mail.gmail.com>
 <20220917183849.589593-1-guoren@kernel.org>
In-Reply-To: <20220917183849.589593-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 18 Sep 2022 07:49:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRwH33CcRDOy3ngQ6KCTOLAR6VNdBOOT+eykBCoLojjQg@mail.gmail.com>
Message-ID: <CAJF2gTRwH33CcRDOy3ngQ6KCTOLAR6VNdBOOT+eykBCoLojjQg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch function
To: guoren@kernel.org
Cc: andy.chiu@sifive.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	greentime.hu@sifive.com, jbaron@akamai.com, jpoimboe@kernel.org, 
	kernel@esmil.dk, linux-riscv@lists.infradead.org, mingo@redhat.com, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, peterz@infradead.org, 
	rostedt@goodmis.org, zong.li@sifive.com, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_164947_577503_346F622E 
X-CRM114-Status: GOOD (  20.00  )
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
