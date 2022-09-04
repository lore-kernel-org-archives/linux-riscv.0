Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C3AECAAD4
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2GsvN1SSQWXb6TvVZH8vNoOfQuP0TZUxDwxKQugS2Q=; b=Dlv7K4zeiNpxcn
	yxGaW+RyHDahy6N2QgcDxLvzwr+t3UovlZCPZWnpFO2dULTBovYsbm+hk4Ecrcjq9xYFCe6SnwvFN
	68OeSOKoIdg2wpq2VoO86JPVEROrkLD3yd0dNTt6LITIcbUmV3ydSYyIRNm166aLqNNnzGr/xzVyA
	qiW5SUowFI+/SLopjy9ATxYUlNtNZk/CiBBDfyY1FR5zkSemhl1NH7Xr1rTNr2j/T0BlxoZYnjMvX
	KNhAb8mdUolh0QNHUW3EFK3DvsK9TvaOczPa2Cs3vrTmgQJboex65EBvfyff3recy4RdVoknz+TIy
	gFBNuBwF7sUi/VSLEP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUnJM-003nFq-Bp; Sun, 04 Sep 2022 10:57:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUnJJ-003nCw-HV
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 10:57:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2B5FAB80D68
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 10:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58C9C43140
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 10:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662289021;
	bh=aE3Lzt0mghWBYhRRYPgtuF/TAYQh83dAwNSkTUNTgbI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cbutf74Zg+i4qBm5vsW2mqxxACOwWCvIBtqyUuwD+FNcRaLXDq/amRT2vQ/WOYSGy
	 DkwAc3T0xw3+Cujhr9yz/A4tlswfwFO98dJ48tjKmv6FAbrQoeBmYfgRZx+VGY1w74
	 RuPuf23GyKvl8apwbTM+A6vGme9PxwHgRR7fmpfilXUjU980b/608zF7om+WgUlUGe
	 85SGbW4+e+lvlZozdFZgyDmFiwLnKf+bUeQgFkmgQNCSQZteV+QV5IBV46ciXZkZ6o
	 V4s/LP5ohTAHs8bmnIqhIpNYAPITa/X3Zki+gffGmFpJcjI3Kb02xB9sdWSVfWNExB
	 MipbLbvEIoD9A==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-11f11d932a8so15673817fac.3
        for <linux-riscv@lists.infradead.org>; Sun, 04 Sep 2022 03:57:01 -0700 (PDT)
X-Gm-Message-State: ACgBeo2zGQquWzyvWDugLr2JJsSMjcl3XfqV5EWEMEbl0DlRxChCdecM
	VpytGQfj9RWxQjDZQvERke1XeAYKPbWkjAJcHnc=
X-Google-Smtp-Source: AA6agR7jdKTNe2FRhNW8k0znlXUrgx7feNvmOtWzcf4WBfkjzFYgi6nG0mLNVsj72gFtD7YDubR4fnMyiWxHDnyGuKw=
X-Received: by 2002:a05:6808:2028:b0:344:246d:2bed with SMTP id
 q40-20020a056808202800b00344246d2bedmr5238536oiw.19.1662289020747; Sun, 04
 Sep 2022 03:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220904072637.8619-1-guoren@kernel.org> <20220904072637.8619-6-guoren@kernel.org>
 <98efc4d8-f846-1ff1-2635-d18b7fca4ac8@microchip.com>
In-Reply-To: <98efc4d8-f846-1ff1-2635-d18b7fca4ac8@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 4 Sep 2022 18:56:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQn0PpjERzKoBpx6npUs+gZmBNeRReNgeRP7RPod2WssA@mail.gmail.com>
Message-ID: <CAJF2gTQn0PpjERzKoBpx6npUs+gZmBNeRReNgeRP7RPod2WssA@mail.gmail.com>
Subject: Re: [PATCH V2 5/6] riscv: elf_kexec: Fixup compile warning
To: Conor.Dooley@microchip.com
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	guoren@linux.alibaba.com, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_035705_886625_10B096F9 
X-CRM114-Status: GOOD (  32.80  )
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

On Sun, Sep 4, 2022 at 6:36 PM <Conor.Dooley@microchip.com> wrote:
>
> On 04/09/2022 08:26, guoren@kernel.org wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1
> > O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/
> >
> > ../arch/riscv/kernel/elf_kexec.c: In function 'elf_kexec_load':
> > ../arch/riscv/kernel/elf_kexec.c:185:23: warning: variable
> > 'kernel_start' set but not used [-Wunused-but-set-variable]
> >   185 |         unsigned long kernel_start;
> >       |                       ^~~~~~~~~~~~
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Reported-by: kernel test robot <lkp@intel.com>
>
> Is this then a
> Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
> ?
>
> Could you also add something like:
> "If CONFIG_CRYTPO is not enabled, ...." to explain why this
> may be unused?
>
> > ---
> >  arch/riscv/kernel/elf_kexec.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> > index 0cb94992c15b..bba3723a0914 100644
> > --- a/arch/riscv/kernel/elf_kexec.c
> > +++ b/arch/riscv/kernel/elf_kexec.c
> > @@ -182,7 +182,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> >         unsigned long new_kernel_pbase = 0UL;
> >         unsigned long initrd_pbase = 0UL;
> >         unsigned long headers_sz;
> > +#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
> >         unsigned long kernel_start;
> > +#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
> >         void *fdt, *headers;
> >         struct elfhdr ehdr;
> >         struct kexec_buf kbuf;
> > @@ -197,7 +199,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> >                              &old_kernel_pbase, &new_kernel_pbase);
> >         if (ret)
> >                 goto out;
> > +#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
> >         kernel_start = image->start;
> > +#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
>
> Instead of adding more #ifdefs to the file, could we instead just drop the
> kernel_start variable? For the sake of compilation coverage, we could then
> also do the following (build-tested only):
Em... I prefer:

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 0cb94992c15b..4b9264340b78 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -198,7 +198,7 @@ static void *elf_kexec_load(struct kimage *image,
char *kernel_buf,
        if (ret)
                goto out;
        kernel_start = image->start;
-       pr_notice("The entry point of kernel at 0x%lx\n", image->start);
+       pr_notice("The entry point of kernel at 0x%lx\n", kernel_start);

        /* Add the kernel binary to the image */
        ret = riscv_kexec_elf_load(image, &ehdr, &elf_info,


>
> -- >8 --
> From: Conor Dooley <conor.dooley@microchip.com>
> Date: Sun, 4 Sep 2022 11:27:07 +0100
> Subject: [PATCH] riscv: elf_kexec: replace ifdef with IS_ENABLED()
>
> IS_ENABLED() gives better compile time coverage than #ifdef.
> Replace the ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY in elf_kexec_load()
> since none of the code it guards uses a symbol that's missing if it
> is not set.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/elf_kexec.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> index 0cb94992c15b..29cbf655c474 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -248,21 +248,21 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
>                 cmdline = modified_cmdline;
>         }
>
> -#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
> -       /* Add purgatory to the image */
> -       kbuf.top_down = true;
> -       kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
> -       ret = kexec_load_purgatory(image, &kbuf);
> -       if (ret) {
> -               pr_err("Error loading purgatory ret=%d\n", ret);
> -               goto out;
> +       if (IS_ENABLED(CONFIG_ARCH_HAS_KEXEC_PURGATORY)) {
> +               /* Add purgatory to the image */
> +               kbuf.top_down = true;
> +               kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
> +               ret = kexec_load_purgatory(image, &kbuf);
> +               if (ret) {
> +                       pr_err("Error loading purgatory ret=%d\n", ret);
> +                       goto out;
> +               }
> +               ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
> +                                                    &kernel_start,
> +                                                    sizeof(kernel_start), 0);
> +               if (ret)
> +                       pr_err("Error update purgatory ret=%d\n", ret);
>         }
> -       ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
> -                                            &kernel_start,
> -                                            sizeof(kernel_start), 0);
> -       if (ret)
> -               pr_err("Error update purgatory ret=%d\n", ret);
> -#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
>
>         /* Add the initrd to the image */
>         if (initrd != NULL) {
> --
> 2.37.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
