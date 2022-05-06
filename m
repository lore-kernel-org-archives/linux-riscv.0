Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1714C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLs9Q/GXSSeJ9Y1omcI1ufexe/Zpv05YMBSI2hVPDpw=; b=Ac2YJcrq455QjP
	gu5NCEv45IWR8mKppKuERZeR+CkGSa5AOO0a23WT4fnJPcRHeE3tn23haJ/So+RN0u4XcQotTwLpJ
	1FttCkAtp1QJNy5iEes1GwvSX61RU4Ws59dgNc0AAnir2Ckks+HUVVCRZmCrVoCjQcp3qF1/rFjDn
	n+Nqk6HuhiU7qctGQlzHW1iV1LmpIDH4j0xd89Vo50QFONYKc2V00TZAHzLxvU8vlxnt5kw17cPcy
	M9qkB2g5ygpSvnY0dcGfMhP/UrpoeRhgGi+xFvlTg/djH02/wDG6hjWJz+6K94ZQzamB2yrbTKrsL
	pYJkTmGkgAG1Dk+OTmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmzOM-003uro-1A; Fri, 06 May 2022 14:57:14 +0000
Received: from mail-qv1-f49.google.com ([209.85.219.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmzOJ-003uqu-Us; Fri, 06 May 2022 14:57:13 +0000
Received: by mail-qv1-f49.google.com with SMTP id js14so5574201qvb.12;
 Fri, 06 May 2022 07:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TFKDqxAl8kAhgchSspFlV1jC/a94gKje1e9uHi6vXps=;
 b=PeNKBKJmNkHXBxAv8lBfJpGekyHvIoLdJ2Yr/cdvqrIX8V0J0et/WbhV6oMrNsRUuG
 Ih15/6vqEtgw6BIK5J+PtpyuDY0APmNFzzhmgaMPI6PK5tGavJKZ9TZoUUg2HEVSXwh3
 2RjUiR/BUZscEbeNmVK9FWIM/UvEVgisPzEMTmykmVOLbMkD5zJivuqdeuICVcx+wcQC
 zLvnq6xBhv0TJtITvNsi/uZMUStmC8nC0nmrcBgY2yWdK/Bdn6PjV+sBFNXgZoqXb33O
 gkcMVa0GAq9nOs8n5qrVDndntn5Xu4F7TOPez7/xmUcSh/KWwi92OQl3WY3iQYdJ3HmP
 0IDg==
X-Gm-Message-State: AOAM533LwiOblnb5lPcqqKKlkwz/Tqauq0Niar2J2I2253mwnDas8ac6
 BPiUOxuueGY33Q2MipCslBCNnix4fMjbEA==
X-Google-Smtp-Source: ABdhPJxWcYnjeVejrC7KpomPEgH4gEYBtxItbxpbM8PUAsHZB3HuJRi2jShvqAfUmmgglum6qLxGVw==
X-Received: by 2002:ad4:5c6c:0:b0:45a:c466:6bca with SMTP id
 i12-20020ad45c6c000000b0045ac4666bcamr3116366qvh.43.1651849029327; 
 Fri, 06 May 2022 07:57:09 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 n1-20020ac81e01000000b002f39b99f679sm2665525qtl.19.2022.05.06.07.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 07:57:08 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id m190so1767929ybf.4;
 Fri, 06 May 2022 07:57:08 -0700 (PDT)
X-Received: by 2002:a05:6902:352:b0:63e:94c:883c with SMTP id
 e18-20020a056902035200b0063e094c883cmr2500583ybs.365.1651849027963; Fri, 06
 May 2022 07:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061412080.52331@angie.orcam.me.uk>
 <3669a28a055344a792b51439c953fd30@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 May 2022 16:56:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
Message-ID: <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@kernel.org>, 
 Rich Felker <dalias@libc.org>, 
 "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Helge Deller <deller@gmx.de>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
 Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, 
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, 
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_075712_033159_DF1D3058 
X-CRM114-Status: GOOD (  30.50  )
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

Hi Maciej,

On Fri, May 6, 2022 at 4:44 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Fri, 6 May 2022, David Laight wrote:
> > >  It was retrofitted in that x86 systems already existed for ~15 years when
> > > PCI came into picture.  Therefore the makers of the CPU ISA couldn't have
> > > envisaged the need for config access instructions like they did for memory
> > > and port access.
> >
> > Rev 2.0 of the PCI spec (1993) defines two mechanisms for config cycles.
> > #2 is probably the first one and maps all of PCI config space into
> > 4k of IO space (PCI bridges aren't supported).
>
>  This one is even more horrid than #1 in that it requires two separate
> preparatory I/O writes rather than just one, one to the Forward Register
> (at 0xcfa) to set the bus number, and another to the Configuration Space
> Enable Register (at 0xcf8) to set the function number, before you can
> issue a configuration read or write to a device.  So you need MP locking
> too.
>
>  NB only peer bridges aren't supported with this mechanism, normal PCI-PCI
> bridges are, via the Forward Register.
>
> > #1 requires a pair of accesses (and SMP locking).
> >
> > Neither is really horrid.
>
>  Both are.  First neither is MP-safe and second both are indirect in that
> you need to poke at some chipset registers before you can issue the actual
> read or write.
>
>  Sane access would require a single CPU instruction to read or write from
> the configuration space.  To access the conventional PCI configuration
> space in a direct linear manner you need 256 * 21 * 8 * 256 = 10.5MiB of
> address space.  Such amount of address space seems affordable even with
> 32-bit systems.

Won't have fit in the legacy 1 MiB space ("640 KiB...").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
