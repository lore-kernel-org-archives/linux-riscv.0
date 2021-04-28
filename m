Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80DEC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 15:54:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C410E61185
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 15:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C410E61185
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=14mn0kfUtOU7SyA12C6s5GLvzjWG5ok4ZuLBp84Kv6M=; b=AujxwOSTYpL3eRXPR3amYdgya
	Zt0rAYQzFXuL3p75WRGyf0xaMsyZ0pmO184/12u5XM8vfNpTUIkzWzlLbtPL9ERA8TLBCXOv2syDS
	rBOP7arv+BEj9L1vAM2osgDC1yDrTgwNvULYVg72OUaxyjVPz7hOKVaASDSq9CSydpY0GHlC1eYML
	yNthYSTJ1t4+4d317hV7b+K8uCezvuZHP5n7rT47vpW7g0Q/DA9RUXWocoeLqe7SPHxDwCwBwgzJv
	ZYVXfninxhIeakEVOinNsCNmqzrtG3+aQDNjz9G6Kj5cQdBg5eomM0xVsVJBtDOE3yog/zOO264nG
	J+oFBOcGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbmW1-003n7g-DQ; Wed, 28 Apr 2021 15:54:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbmVy-003n7S-Ig
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 15:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yorkGYDsy18hlhqwAhCnDga1F1o5TKgaoPR9G/DLZ4k=; b=Kt8ItwlYD9b6q/iu9HwZWDwEgz
 N+TDmomEgwUFudEnsJuGX3XaWKDL4I3WFbDIzdtJQ4aID+26O3VGhCxFMnR+7F/4R99bYJqLUzx/B
 heM8DNXmZ/VziWtLdLwibOg3UddcIJyj3Hcy+k4aMZ1J0gYGMJS+6zon7vgdPaaIuvba2OuU0ilVV
 yHJHGNO03xCezZafsz8kcVsGB9SLJOtye62YnB5h7rYdyOhOEP2u760h7E7GJBbfBmBdDfuYr6EtW
 GnPwPL3uHyXEL67ieaICecTVg2vGc4ZIZWtm4t+cFrV2ltlWzfZeB4zEitpEslAUuHhvVsJWT3Cdg
 yNgZEeqw==;
Received: from air.basealt.ru ([194.107.17.39])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbmVv-00Hapt-6p
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 15:54:13 +0000
Received: by air.basealt.ru (Postfix, from userid 490)
 id 1133A58982A; Wed, 28 Apr 2021 15:54:04 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by air.basealt.ru (Postfix) with ESMTPSA id 551FB589517
 for <linux-riscv@lists.infradead.org>; Wed, 28 Apr 2021 15:53:59 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id n138so100153646lfa.3
 for <linux-riscv@lists.infradead.org>; Wed, 28 Apr 2021 08:53:59 -0700 (PDT)
X-Gm-Message-State: AOAM533SOzlsRgVCSmlYWFR/VPl3C+DEu9E1DkyjZBCdUsrnwnrSPELl
 BCnEdaQLGZlsqJ12bp0Q684BnZRHSB1c5Dogs2U=
X-Google-Smtp-Source: ABdhPJx5vGyFCavDZ0bGTHpchNBpFKoMmtZo4e8mFWs9KS+BByQzfj0cVI1vx+buY8ZWti7UPQn6YpWavDEjfHbuDVM=
X-Received: by 2002:a05:6512:10cb:: with SMTP id
 k11mr21304043lfg.84.1619625239082; 
 Wed, 28 Apr 2021 08:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210427120607.2646166-1-arei@altlinux.org>
 <CAMj1kXGm9d7SdBoozEoOP4G6ETmNiZR8kum91RVc_4eUTroE2w@mail.gmail.com>
In-Reply-To: <CAMj1kXGm9d7SdBoozEoOP4G6ETmNiZR8kum91RVc_4eUTroE2w@mail.gmail.com>
From: Nikita Ermakov <arei@altlinux.org>
Date: Wed, 28 Apr 2021 18:53:23 +0300
X-Gmail-Original-Message-ID: <CANA1cBL0AiJBbZX6x3LjTLYJ7z2ueaDWDKJrM50Xd2AxNPO14g@mail.gmail.com>
Message-ID: <CANA1cBL0AiJBbZX6x3LjTLYJ7z2ueaDWDKJrM50Xd2AxNPO14g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Relocate the kernel relative to a DRAM base.
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nikita Ermakov <arei@altlinux.org>, linux-efi <linux-efi@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_085411_656961_05E4A425 
X-CRM114-Status: GOOD (  33.20  )
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

On Tue, 27 Apr 2021 at 15:43, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 27 Apr 2021 at 14:07, Nikita Ermakov <arei@altlinux.org> wrote:
> >
> > Try to get the base of the DRAM from a DTB to use it as a lowest address
> > in physical memory to relocate the kernel. If it is not possible to
> > obtain the base from a /memory node of the DTB let's make an assumption
> > that the DRAM base at the beginning of the memory.
> >
>
> Why?
>

You right, this patch is useless. I made it because I overlooked
efi_low_alloc_above() in libstub/relocate.c
Sorry for bothering.

I had an issue with booting a Linux kernel with EFI stub on a HiFive
Unleashed board.
My boot chain was as follows: ZSBL -> FSBL -> OpenSBI -> U-Boot
(bootefi) -> Linux
When I tried to boot the kernel, U-Boot throws an Store/AMO access
fault exception.
I checked the riscv-stub.c and libstub/relocate.c and I thought that
it tries to relocate the kernel at the 2 MiB.
With this patch the kernel started to boot and I thought that the
theory was right.
But, after further investigation I found out that U-Boot EFI does not
mark the first 4 KiB page of DRAM as EFI_BOOT_SERVICE_DATA on the
board and efi_low_alloc_above() allocates this region as conventional
memory. The lowest region of DRAM is protected and that is why I got
the exception when the kernel tries to relocate to the 0x80000000. The
reason why U-Boot EFI does not mark the first 4 KiB of DRAM as
EFI_BOOT_SERVICE_DATA was that there wasn't /reserved-memory node in a
DTB. I had the FSBL with a patch which enables an entire L2 cache and
it does not preserve a0, a1 registers before a jump to the OpenSBI.
So, OpenSBI didn't fixup the DTB where it adds the /reserved-memory
node.

> > Signed-off-by: Nikita Ermakov <arei@altlinux.org>
> > ---
> >  drivers/firmware/efi/libstub/riscv-stub.c | 39 ++++++++++++++++++++++-
> >  1 file changed, 38 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> > index 380e4e251399..1b5944276e1a 100644
> > --- a/drivers/firmware/efi/libstub/riscv-stub.c
> > +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> > @@ -46,6 +46,39 @@ static u32 get_boot_hartid_from_fdt(void)
> >         return fdt32_to_cpu(*prop);
> >  }
> >
> > +static unsigned long get_dram_base_from_fdt(void)
> > +{
> > +       const void *fdt;
> > +       int node, len;
> > +       const fdt32_t *addr_cells;
> > +       const void *prop;
> > +
> > +       fdt = get_efi_config_table(DEVICE_TREE_GUID);
> > +       if (!fdt)
> > +               return ULONG_MAX;
> > +
> > +       node = fdt_path_offset(fdt, "/");
> > +       if (node < 0)
> > +               return ULONG_MAX;
> > +
> > +       addr_cells = fdt_getprop((void *)fdt, node, "#address-cells", &len);
> > +       if (!addr_cells)
> > +               return ULONG_MAX;
> > +
> > +       node = fdt_path_offset(fdt, "/memory");
> > +       if (node < 0)
> > +               return ULONG_MAX;
> > +
> > +       prop = fdt_getprop((void *)fdt, node, "reg", &len);
> > +       if (!prop)
> > +               return ULONG_MAX;
> > +
> > +       if (fdt32_to_cpu(*addr_cells) > 1)
> > +               return fdt64_to_cpu(*((fdt64_t *)prop));
> > +       else
> > +               return fdt32_to_cpu(*((fdt32_t *)prop));
> > +}
> > +
> >  efi_status_t check_platform_features(void)
> >  {
> >         hartid = get_boot_hartid_from_fdt();
> > @@ -97,7 +130,11 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
> >          * lowest possible memory region as long as the address and size meets
> >          * the alignment constraints.
> >          */
> > -       preferred_addr = MIN_KIMG_ALIGN;
> > +       preferred_addr = get_dram_base_from_fdt();
> > +       if (preferred_addr == ULONG_MAX)
> > +               preferred_addr = MIN_KIMG_ALIGN;
> > +       else
> > +               preferred_addr += MIN_KIMG_ALIGN;
> >         status = efi_relocate_kernel(image_addr, kernel_size, *image_size,
> >                                      preferred_addr, MIN_KIMG_ALIGN, 0x0);
> >
> > --
> > 2.29.3
> >



-- 
Thanks,
Nikita
B8 00 4C CD 21

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
