Return-Path: <SRS0=o0tQ=NF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C65C46475
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 21:14:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D672054F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 21:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qbXRKwy0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8keHK4b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5D672054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zjxYXoyKPsXRur7hdQxrQh8aL4TJF6bKhSkhN9jsTU=; b=qbXRKwy0JOaNFz
	DmUkC+KXkM15JwNjjgrJefHJm4Z2bSuS5TASNv70DkN/ibWmidNMLkj54X/MRYvj2KS2EfT/ddS2F
	Vg0iVA1bbIUGe770jjRAswIuXZYOOQq93r3gGV/kP31QNL3OQ58qOS+0WjLmU/FbaVUW6/Xz/VRB/
	bwdKdYPV3KmSn6+3FnpzmLsQeI9fU0XsKCZ93SXkHYLfgMnIMGWOFlSLOZ7C98N7bZ1C8QMdKyDxm
	Rui3ljmkOprkZ0IW6Z+EgYNd5lfOCqJyqYX1++3CvcNvaopHgE3ri0LjGF2CsMkP390H8TXXuT8s0
	y1g2+I/Fxzw8bY7u/8Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFmxP-0007LU-16; Thu, 25 Oct 2018 21:14:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFmwh-0006xm-Br; Thu, 25 Oct 2018 21:13:36 +0000
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 211C520869;
 Thu, 25 Oct 2018 21:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1540502004;
 bh=wvEMaua9XdNX1S7F8WvyfWYk7OlmWIlhYhxZAJeKwdE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n8keHK4bHi/xaU7wAjGjXtDkmgMY8Qagu8h7WqN7FIhYyEGhQykJZ8U0GWJsHpN/c
 jQH5Kkd7QhNYJgyFAWFcx20GEGC/gdGKM73Pscz0htyoSgpK2JSVeEUyKcx6BUU7a2
 sqVzAPRLSh/5ae7Jkj81s663W2+KZHMF4yR9w9og=
Received: by mail-qt1-f172.google.com with SMTP id u34-v6so11690575qth.3;
 Thu, 25 Oct 2018 14:13:24 -0700 (PDT)
X-Gm-Message-State: AGRZ1gIkvypLCaBuVxSPWXNys+DAkpD4Qc5POwVwCPRvqrXaYK6bm6yL
 S7VtlsFeChAAkXusXD/qwqlpvJWgkjHAiurUEg==
X-Google-Smtp-Source: AJdET5dPMimUPy72Toq8ADoMpWDW5u//FVc5SZkVtwbySihlnauOZqcr3hb+YS+Sv4mS4dGpTmGh/T9QeMcbV1qAVzw=
X-Received: by 2002:a0c:8c86:: with SMTP id p6-v6mr836511qvb.246.1540502003189; 
 Thu, 25 Oct 2018 14:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20181024193256.23734-1-f.fainelli@gmail.com>
 <CAL_Jsq+KCOv6pXXHhHDZ+7-QUrmtMDvSjEVhK15yZ3qbnn61Ag@mail.gmail.com>
 <20181025093833.GA23607@rapoport-lnx>
 <CAL_JsqL62ttsGSbE1BS5v-mX3pKE-p_HyvuZD6nB+GUbQyetzg@mail.gmail.com>
 <20181025172935.GA27364@rapoport-lnx>
In-Reply-To: <20181025172935.GA27364@rapoport-lnx>
From: Rob Herring <robh@kernel.org>
Date: Thu, 25 Oct 2018 16:13:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJrMq+QHvuOsqEdCFchmXsd4s2XKUD_TboKzeEQprJvjg@mail.gmail.com>
Message-ID:
 <CAL_JsqJrMq+QHvuOsqEdCFchmXsd4s2XKUD_TboKzeEQprJvjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: Cut rebuild time when changing
 CONFIG_BLK_DEV_INITRD
To: rppt@linux.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181025_141335_475919_0FCEFC97 
X-CRM114-Status: GOOD (  36.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-ia64@vger.kernel.org,
 SH-Linux <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org,
 arcml <linux-snps-arc@lists.infradead.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Marc Zyngier <marc.zyngier@arm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Openrisc <openrisc@lists.librecores.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-parisc@vger.kernel.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-alpha@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181025211310.WWde8IABCKgz4M88hpGXkcghguM9DVon7UbczYTGD7U@z>

On Thu, Oct 25, 2018 at 12:30 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Thu, Oct 25, 2018 at 08:15:15AM -0500, Rob Herring wrote:
> > +Ard
> >
> > On Thu, Oct 25, 2018 at 4:38 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > >
> > > On Wed, Oct 24, 2018 at 02:55:17PM -0500, Rob Herring wrote:
> > > > On Wed, Oct 24, 2018 at 2:33 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > > > >
> > > > > Hi all,
> > > > >
> > > > > While investigating why ARM64 required a ton of objects to be rebuilt
> > > > > when toggling CONFIG_DEV_BLK_INITRD, it became clear that this was
> > > > > because we define __early_init_dt_declare_initrd() differently and we do
> > > > > that in arch/arm64/include/asm/memory.h which gets included by a fair
> > > > > amount of other header files, and translation units as well.
> > > >
> > > > I scratch my head sometimes as to why some config options rebuild so
> > > > much stuff. One down, ? to go. :)
> > > >
> > > > > Changing the value of CONFIG_DEV_BLK_INITRD is a common thing with build
> > > > > systems that generate two kernels: one with the initramfs and one
> > > > > without. buildroot is one of these build systems, OpenWrt is also
> > > > > another one that does this.
> > > > >
> > > > > This patch series proposes adding an empty initrd.h to satisfy the need
> > > > > for drivers/of/fdt.c to unconditionally include that file, and moves the
> > > > > custom __early_init_dt_declare_initrd() definition away from
> > > > > asm/memory.h
> > > > >
> > > > > This cuts the number of objects rebuilds from 1920 down to 26, so a
> > > > > factor 73 approximately.
> > > > >
> > > > > Apologies for the long CC list, please let me know how you would go
> > > > > about merging that and if another approach would be preferable, e.g:
> > > > > introducing a CONFIG_ARCH_INITRD_BELOW_START_OK Kconfig option or
> > > > > something like that.
> > > >
> > > > There may be a better way as of 4.20 because bootmem is now gone and
> > > > only memblock is used. This should unify what each arch needs to do
> > > > with initrd early. We need the physical address early for memblock
> > > > reserving. Then later on we need the virtual address to access the
> > > > initrd. Perhaps we should just change initrd_start and initrd_end to
> > > > physical addresses (or add 2 new variables would be less invasive and
> > > > allow for different translation than __va()). The sanity checks and
> > > > memblock reserve could also perhaps be moved to a common location.
> > > >
> > > > Alternatively, given arm64 is the only oddball, I'd be fine with an
> > > > "if (IS_ENABLED(CONFIG_ARM64))" condition in the default
> > > > __early_init_dt_declare_initrd as long as we have a path to removing
> > > > it like the above option.
> > >
> > > I think arm64 does not have to redefine __early_init_dt_declare_initrd().
> > > Something like this might be just all we need (completely untested,
> > > probably it won't even compile):
> > >
> > > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > > index 9d9582c..e9ca238 100644
> > > --- a/arch/arm64/mm/init.c
> > > +++ b/arch/arm64/mm/init.c
> > > @@ -62,6 +62,9 @@ s64 memstart_addr __ro_after_init = -1;
> > >  phys_addr_t arm64_dma_phys_limit __ro_after_init;
> > >
> > >  #ifdef CONFIG_BLK_DEV_INITRD
> > > +
> > > +static phys_addr_t initrd_start_phys, initrd_end_phys;
> > > +
> > >  static int __init early_initrd(char *p)
> > >  {
> > >         unsigned long start, size;
> > > @@ -71,8 +74,8 @@ static int __init early_initrd(char *p)
> > >         if (*endp == ',') {
> > >                 size = memparse(endp + 1, NULL);
> > >
> > > -               initrd_start = start;
> > > -               initrd_end = start + size;
> > > +               initrd_start_phys = start;
> > > +               initrd_end_phys = end;
> > >         }
> > >         return 0;
> > >  }
> > > @@ -407,14 +410,27 @@ void __init arm64_memblock_init(void)
> > >                 memblock_add(__pa_symbol(_text), (u64)(_end - _text));
> > >         }
> > >
> > > -       if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && initrd_start) {
> > > +       if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) &&
> > > +           (initrd_start || initrd_start_phys)) {
> > > +               /*
> > > +                * FIXME: ensure proper precendence between
> > > +                * early_initrd and DT when both are present
> >
> > Command line takes precedence, so just reverse the order.
> >
> > > +                */
> > > +               if (initrd_start) {
> > > +                       initrd_start_phys = __phys_to_virt(initrd_start);
> > > +                       initrd_end_phys = __phys_to_virt(initrd_end);

BTW, I think you meant virt_to_phys() here?

> >
> > AIUI, the original issue was doing the P2V translation was happening
> > too early and the VA could be wrong if the linear range is adjusted.
> > So I don't think this would work.
>
> Probably things have changed since then, but in the current code there is
>
>                 initrd_start = __phys_to_virt(initrd_start);
>
> and in between only the code related to CONFIG_RANDOMIZE_BASE, so I believe
> it's safe to use __phys_to_virt() here as well.

Here is fine yes, but I believe it was the the phys to virt in the DT
code before adjusting the linear range that was the problem.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
