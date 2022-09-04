Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80332ECAAD4
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=un9PtM1U27ds0E1vXvEqOggLK592yMGLKrbREwk2s2Y=; b=VVgan+8GOQZ48C
	wVwiCDrE4rXBmNscjLAzBa4+sdVFitQ70YZsKzVFfZE2qmIW83/pqXW6VrT4lRrgHEMrcrfBCMM/O
	H75LbVH2cQ/moGoBBq1JolyPiob/hCT3DZ/Z3A3e4ArIBw+FKkMSTq24M4b5ZHLYA4vDc4mFxMjhh
	6Dkz5NtMMrk5B62fDOjl8k+Z6mI9mKTVGgUSVwyjNVD88sRwacpKf1/gHmo7aJ2epCvKrQ+bFsUmN
	nxwZOjl47maMOLG4GHwxKbT5NbPZPb8ojMwyGoOVD8ASNRNkbLNtSwOCxH0hWJc9y8mLxICDIDE++
	XkUTFBO7paorOUgYLqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUoDz-004p3s-Gh; Sun, 04 Sep 2022 11:55:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUoDv-004p0w-Pj
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 11:55:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 27995B80D69
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 11:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCECEC43147
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662292531;
	bh=Ifm2jYc+GVOxme67tkpAAP8iyU1lr0Sp7tXITH/Z1GM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s/L8Mh2KYjDkg50qhjjMDk0QuQeZqOYMhZJhMOY5aBVuHngWMDD0I5dz4naEAcGSc
	 3r6HauWmbM/ykl6Wy9QZLJ6papSxMOCrBjI3eXl6GaRYQzlum0bSI+Ax9UvuR/AnXz
	 GKmsLVW3kyVciXMFUcYmiPL7inUhBu5Ne2MCmMM9U0T4EGL/yOpO1N528ENylP9tJi
	 tNhomXSFDXgffx2kRrQl8WTs0lN7J09AJ3CmPCzumuc6EtUPjV/25w84Q2Zf5dvdlx
	 h1Uvue3jeewKX1Jiou4NM88OLBRXclO5oxy5PlzdRxK/Ir4XH2v0+FqWYIhXNXQW2E
	 VZg2irPi48Q1g==
Received: by mail-ot1-f47.google.com with SMTP id v2-20020a056830090200b006397457afecso4517629ott.13
        for <linux-riscv@lists.infradead.org>; Sun, 04 Sep 2022 04:55:31 -0700 (PDT)
X-Gm-Message-State: ACgBeo1IhhVlXgdlXxN+A/net8MxMmZiIiubM/YCeoIfXb5t0Q2RZoat
	XtEUGVVqs0E6XuWciUz6euk3tlY3C0T1XRFEehg=
X-Google-Smtp-Source: AA6agR7E1nluqRw4qZiINjWPmeHGKzpp8l4SPUsHad64bOi4rRgWKW/vXFNrLzwvjkyVobbL7FJ39mxX8btwfro68eo=
X-Received: by 2002:a05:6830:3482:b0:638:92b7:f09b with SMTP id
 c2-20020a056830348200b0063892b7f09bmr17459110otu.140.1662292530673; Sun, 04
 Sep 2022 04:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220904072637.8619-1-guoren@kernel.org> <20220904072637.8619-6-guoren@kernel.org>
 <98efc4d8-f846-1ff1-2635-d18b7fca4ac8@microchip.com> <CAJF2gTQn0PpjERzKoBpx6npUs+gZmBNeRReNgeRP7RPod2WssA@mail.gmail.com>
 <8551463c-376c-8c64-6bf3-31dd5d9133d8@microchip.com>
In-Reply-To: <8551463c-376c-8c64-6bf3-31dd5d9133d8@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 4 Sep 2022 19:55:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQuJDev3fBjVvycDvwnhUBgaHzkh_sp9=BJefmr=KfqXQ@mail.gmail.com>
Message-ID: <CAJF2gTQuJDev3fBjVvycDvwnhUBgaHzkh_sp9=BJefmr=KfqXQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220904_045536_122627_05D32D56 
X-CRM114-Status: GOOD (  34.44  )
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

On Sun, Sep 4, 2022 at 7:13 PM <Conor.Dooley@microchip.com> wrote:
>
> On 04/09/2022 11:56, Guo Ren wrote:
> > On Sun, Sep 4, 2022 at 6:36 PM <Conor.Dooley@microchip.com> wrote:
> >>
> >> On 04/09/2022 08:26, guoren@kernel.org wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> From: Guo Ren <guoren@linux.alibaba.com>
> >>>
> >>> COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1
> >>> O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/
> >>>
> >>> ../arch/riscv/kernel/elf_kexec.c: In function 'elf_kexec_load':
> >>> ../arch/riscv/kernel/elf_kexec.c:185:23: warning: variable
> >>> 'kernel_start' set but not used [-Wunused-but-set-variable]
> >>>   185 |         unsigned long kernel_start;
> >>>       |                       ^~~~~~~~~~~~
> >>>
> >>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >>> Signed-off-by: Guo Ren <guoren@kernel.org>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> Is this then a
> >> Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
> >> ?
> >>
> >> Could you also add something like:
> >> "If CONFIG_CRYTPO is not enabled, ...." to explain why this
> >> may be unused?
> >>
> >>> ---
> >>>  arch/riscv/kernel/elf_kexec.c | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> >>> index 0cb94992c15b..bba3723a0914 100644
> >>> --- a/arch/riscv/kernel/elf_kexec.c
> >>> +++ b/arch/riscv/kernel/elf_kexec.c
> >>> @@ -182,7 +182,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> >>>         unsigned long new_kernel_pbase = 0UL;
> >>>         unsigned long initrd_pbase = 0UL;
> >>>         unsigned long headers_sz;
> >>> +#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
> >>>         unsigned long kernel_start;
> >>> +#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
> >>>         void *fdt, *headers;
> >>>         struct elfhdr ehdr;
> >>>         struct kexec_buf kbuf;
> >>> @@ -197,7 +199,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> >>>                              &old_kernel_pbase, &new_kernel_pbase);
> >>>         if (ret)
> >>>                 goto out;
> >>> +#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
> >>>         kernel_start = image->start;
> >>> +#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
> >>
> >> Instead of adding more #ifdefs to the file, could we instead just drop the
> >> kernel_start variable? For the sake of compilation coverage, we could then
> >> also do the following (build-tested only):
> > Em... I prefer:
>
> Uh, that works for me. The below diff is:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Thx, your idea is also awesome which let me know the benefit of
IS_ENABLED() than ifdef.

>
> >
> > diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> > index 0cb94992c15b..4b9264340b78 100644
> > --- a/arch/riscv/kernel/elf_kexec.c
> > +++ b/arch/riscv/kernel/elf_kexec.c
> > @@ -198,7 +198,7 @@ static void *elf_kexec_load(struct kimage *image,
> > char *kernel_buf,
> >         if (ret)
> >                 goto out;
> >         kernel_start = image->start;
> > -       pr_notice("The entry point of kernel at 0x%lx\n", image->start);
> > +       pr_notice("The entry point of kernel at 0x%lx\n", kernel_start);
> >
> >         /* Add the kernel binary to the image */
> >         ret = riscv_kexec_elf_load(image, &ehdr, &elf_info,
> >
> >
> >>
>
> Feel free to include this patch in your v3 then:
> >> -- >8 --
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >> Date: Sun, 4 Sep 2022 11:27:07 +0100
> >> Subject: [PATCH] riscv: elf_kexec: replace ifdef with IS_ENABLED()
> >>
> >> IS_ENABLED() gives better compile time coverage than #ifdef.
> >> Replace the ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY in elf_kexec_load()
> >> since none of the code it guards uses a symbol that's missing if it
> >> is not set.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  arch/riscv/kernel/elf_kexec.c | 28 ++++++++++++++--------------
> >>  1 file changed, 14 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> >> index 0cb94992c15b..29cbf655c474 100644
> >> --- a/arch/riscv/kernel/elf_kexec.c
> >> +++ b/arch/riscv/kernel/elf_kexec.c
> >> @@ -248,21 +248,21 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> >>                 cmdline = modified_cmdline;
> >>         }
> >>
> >> -#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
> >> -       /* Add purgatory to the image */
> >> -       kbuf.top_down = true;
> >> -       kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
> >> -       ret = kexec_load_purgatory(image, &kbuf);
> >> -       if (ret) {
> >> -               pr_err("Error loading purgatory ret=%d\n", ret);
> >> -               goto out;
> >> +       if (IS_ENABLED(CONFIG_ARCH_HAS_KEXEC_PURGATORY)) {
> >> +               /* Add purgatory to the image */
> >> +               kbuf.top_down = true;
> >> +               kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
> >> +               ret = kexec_load_purgatory(image, &kbuf);
> >> +               if (ret) {
> >> +                       pr_err("Error loading purgatory ret=%d\n", ret);
> >> +                       goto out;
> >> +               }
> >> +               ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
> >> +                                                    &kernel_start,
> >> +                                                    sizeof(kernel_start), 0);
> >> +               if (ret)
> >> +                       pr_err("Error update purgatory ret=%d\n", ret);
> >>         }
> >> -       ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
> >> -                                            &kernel_start,
> >> -                                            sizeof(kernel_start), 0);
> >> -       if (ret)
> >> -               pr_err("Error update purgatory ret=%d\n", ret);
> >> -#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
> >>
> >>         /* Add the initrd to the image */
> >>         if (initrd != NULL) {
> >> --
> >> 2.37.1
> >>
> >
> >



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
