Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2329C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 23:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEIAuCI/jFmmO8V+LTo7Y/NShupVfYPBCcGxEGjX4WM=; b=AXFkN6sAIva60d
	rsHytly4mckI5MyuK1Vs64tJuL+W+h8+o7bsm3KMwqU3B/EhyT5OuZFXpKZFt7RnejuiMMsK7/Pmm
	IgTws20/TgKGSBScZ+0ZwEdvNrkNhks+bKFm2KVCyvKAhp2c6mJAcwc88pSgKa1Uk561gqcTxkbLc
	eRIA7MtvLuACC86UyEQXL+JKgnO7HgYTJFyonytci6ftciaj0AdGt4WWsrIRouKI3uEY02h+208k/
	BlQNZ9ZjHYLbOJdRxTN99ob2G+HiSYOalMkpCI3mqXbqoYH4vYdX9XRKMcfadq0LtgVLu7+u6nKa8
	O0LkHo8LMc/N3Uad5QQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEfGP-00D6wl-Aa; Thu, 21 Jul 2022 23:07:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEfGC-00D6l6-AH; Thu, 21 Jul 2022 23:07:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6C3A3B826C3;
	Thu, 21 Jul 2022 23:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3626BC341C0;
	Thu, 21 Jul 2022 23:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658444826;
	bh=jny5j4zsShg38DT8VGi3vSOk3kBZqJAgJB0dTAkbAM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nyc7n95JFn+3L1ST5AObOHZL18EMNAMKKmlqEzmQ0x2W5l3SEuMQVXIJKB8x/PE43
	 d9tVFWtdjxHd3BaFaPjYNZFeXVgOFPwd45Q48VOVPGuy6oPi7iOS7mKtj5E/Arv6lf
	 mgpJxPiIK7TFoMot81cQo31c4CSItHkgW8BgIm9VjN68zF7Uohg5vFT0QbbmlJw7An
	 gY9M4hfStxnI1ajwOuZorbl9ksVc4yOr4AUeQM9cY8w7LsHAFe9mCyD1JsVq1DfWnh
	 lzgCvDODE+QD/PLNwxpiBXDImxIulyzVg7Ktyz69/H9lAwukc0b8xX2u29JGoE5Koy
	 14eNLCQBcUq6Q==
Received: by mail-vs1-f47.google.com with SMTP id 125so2926189vsx.7;
        Thu, 21 Jul 2022 16:07:06 -0700 (PDT)
X-Gm-Message-State: AJIora8RGmol1+PRIcR6ud0sF/fpwWazpABWMgmIpfi4lKdJsk0YmZwp
	rcP5WVpFY3b0epEl2aAWbxq36E9aEeTMmYLyAg==
X-Google-Smtp-Source: AGRyM1uBjCs+U2ymdUUsIXY05CrE+y/S2OAXKRtreP892HegrpbMmcbIq9jcywXUQ+NGl5aZo/092d9bZO+U+t4nOVM=
X-Received: by 2002:a67:c18e:0:b0:357:5fc3:45d7 with SMTP id
 h14-20020a67c18e000000b003575fc345d7mr235416vsj.53.1658444825112; Thu, 21 Jul
 2022 16:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220718004114.3925745-3-shorne@gmail.com> <mhng-3ae42214-abe0-4fad-9fa9-8f19809fa4d9@palmer-mbp2014>
In-Reply-To: <mhng-3ae42214-abe0-4fad-9fa9-8f19809fa4d9@palmer-mbp2014>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Jul 2022 17:06:52 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+_5-fhXddhxG2mr-4HD_brcKZExkZqvME1yEpa6dOGGg@mail.gmail.com>
Message-ID: <CAL_Jsq+_5-fhXddhxG2mr-4HD_brcKZExkZqvME1yEpa6dOGGg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] asm-generic: Add new pci.h and use it
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Stafford Horne <shorne@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-um@lists.infradead.org, 
	PCI <linux-pci@vger.kernel.org>, 
	"open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_160712_661096_F3EF3B59 
X-CRM114-Status: GOOD (  34.99  )
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

On Tue, Jul 19, 2022 at 9:59 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 17 Jul 2022 17:41:14 PDT (-0700), shorne@gmail.com wrote:
> > The asm/pci.h used for many newer architectures share similar
> > definitions.  Move the common parts to asm-generic/pci.h to allow for
> > sharing code.
> >
> > Two things to note are:
> >
> >  - isa_dma_bridge_buggy, traditionally this is defined in asm/dma.h but
> >    these architectures avoid creating that file and add the definition
> >    to asm/pci.h.
> >  - ARCH_GENERIC_PCI_MMAP_RESOURCE, csky does not define this so we
> >    undefine it after including asm-generic/pci.h.  Why doesn't csky
> >    define it?
> >  - pci_get_legacy_ide_irq, This function is only used on architectures
> >    that support PNP.  It is only maintained for arm64, in other
> >    architectures it is removed.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> > Second note on isa_dma_bridge_buggy, this is set on x86 but it it also set in
> > pci/quirks.c.  We discussed limiting it only to x86 though as its a general
> > quick triggered by pci ids I think it will be more tricky than we thought so I
> > will leave as is.  It might be nice to move it out of asm/dma.h and into
> > asm/pci.h though.
> >
> > Since v2:
> >  - Nothing
> > Since v1:
> >  - Remove definition of pci_get_legacy_ide_irq
> >
> >  arch/arm64/include/asm/pci.h | 12 +++---------
> >  arch/csky/include/asm/pci.h  | 24 ++++--------------------
> >  arch/riscv/include/asm/pci.h | 25 +++----------------------
> >  arch/um/include/asm/pci.h    | 24 ++----------------------
> >  include/asm-generic/pci.h    | 36 ++++++++++++++++++++++++++++++++++++
> >  5 files changed, 48 insertions(+), 73 deletions(-)
> >  create mode 100644 include/asm-generic/pci.h
> >
> > diff --git a/arch/arm64/include/asm/pci.h b/arch/arm64/include/asm/pci.h
> > index b33ca260e3c9..1180e83712f5 100644
> > --- a/arch/arm64/include/asm/pci.h
> > +++ b/arch/arm64/include/asm/pci.h
> > @@ -9,7 +9,6 @@
> >  #include <asm/io.h>
> >
> >  #define PCIBIOS_MIN_IO               0x1000
> > -#define PCIBIOS_MIN_MEM              0
> >
> >  /*
> >   * Set to 1 if the kernel should re-assign all PCI bus numbers
> > @@ -18,9 +17,6 @@
> >       (pci_has_flag(PCI_REASSIGN_ALL_BUS))
> >
> >  #define arch_can_pci_mmap_wc() 1
> > -#define ARCH_GENERIC_PCI_MMAP_RESOURCE       1
> > -
> > -extern int isa_dma_bridge_buggy;
> >
> >  #ifdef CONFIG_PCI
> >  static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > @@ -28,11 +24,9 @@ static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> >       /* no legacy IRQ on arm64 */
> >       return -ENODEV;
> >  }
> > -
> > -static inline int pci_proc_domain(struct pci_bus *bus)
> > -{
> > -     return 1;
> > -}
> >  #endif  /* CONFIG_PCI */
> >
> > +/* Generic PCI */
> > +#include <asm-generic/pci.h>
> > +
> >  #endif  /* __ASM_PCI_H */
> > diff --git a/arch/csky/include/asm/pci.h b/arch/csky/include/asm/pci.h
> > index ebc765b1f78b..44866c1ad461 100644
> > --- a/arch/csky/include/asm/pci.h
> > +++ b/arch/csky/include/asm/pci.h
> > @@ -9,26 +9,10 @@
> >
> >  #include <asm/io.h>
> >
> > -#define PCIBIOS_MIN_IO               0
> > -#define PCIBIOS_MIN_MEM              0
> > +/* Generic PCI */
> > +#include <asm-generic/pci.h>
> >
> > -/* C-SKY shim does not initialize PCI bus */
> > -#define pcibios_assign_all_busses() 1
> > -
> > -extern int isa_dma_bridge_buggy;
> > -
> > -#ifdef CONFIG_PCI
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -     /* no legacy IRQ on csky */
> > -     return -ENODEV;
> > -}
> > -
> > -static inline int pci_proc_domain(struct pci_bus *bus)
> > -{
> > -     /* always show the domain in /proc */
> > -     return 1;
> > -}
> > -#endif  /* CONFIG_PCI */
> > +/* csky doesn't use generic pci resource mapping */
> > +#undef ARCH_GENERIC_PCI_MMAP_RESOURCE
> >
> >  #endif  /* __ASM_CSKY_PCI_H */
> > diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
> > index 7fd52a30e605..12ce8150cfb0 100644
> > --- a/arch/riscv/include/asm/pci.h
> > +++ b/arch/riscv/include/asm/pci.h
> > @@ -12,29 +12,7 @@
> >
> >  #include <asm/io.h>
> >
> > -#define PCIBIOS_MIN_IO               0
> > -#define PCIBIOS_MIN_MEM              0
>
> My for-next changes these in bb356ddb78b2 ("RISC-V: PCI: Avoid handing
> out address 0 to devices").  Do you mind either splitting out the
> arch/riscv bits or having this in via some sort of shared tag?

Shouldn't the values not matter here if the IO and mem resources are
described in the DT (and don't use 0)? The values of 4 and 16 look
odd.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
