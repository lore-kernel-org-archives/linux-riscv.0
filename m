Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460F7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lw3eWw4b4xB1UrN5YBvID8lS+N0YB6y3cYG6HvMHDnw=; b=XSVQnNlGfKdQbJ
	z02+zvXQLC8WvZ8RPaUWvmdVYih0XJv8DBJ5uahYKi5zY66Vqvhw8sHr898/IH8M5K1ztMdpaksfW
	DxlPrm9rEaccYI86Ts3LWNkS5zVzyPgYRPYQpGorWxVVqFzUhZSY4tpHWSw0upHX9BnZcT8awUzVe
	MKk0CR/P7ltsXg70Qb2Q7L1fH3KfXlbV2qgFnF/InLpUxXjAL4MDTduIywpcq/C7eXXK3V2F86YIv
	PiD6BmXvMwEGr7Ic4ujCAbSTaaMFCbOuXcHisSXq/Nri+nx10exq8rUHuaxjYRb7Du7FDN4p5Zqrk
	3X7+H4/BIxXqg6z4CaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmxng-003MoQ-JQ; Fri, 06 May 2022 13:15:16 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmxnZ-003Mkr-Bp; Fri, 06 May 2022 13:15:10 +0000
Received: by mail-qt1-f176.google.com with SMTP id x9so5923420qts.6;
 Fri, 06 May 2022 06:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2s+AM5Z/cEWfKtZbdmffBUO5M791JT3EdrRSPC+WgI=;
 b=MtezCPxYDntcaxxZm67GFxY0p2KB24Dj/ngyXeG+FCQxYJRiL8gH4gujWkaQdirneN
 8/FWtGV7xoPBhgsVHvzVIEOqIcmlgHYV1V80wB6xUVIqhqnC99ulWQsCE3TjB2wPyVci
 vgGrCvDKS+a5Xu+8RgAwAHicl4ebB6CwjpuykYPjjP/FTrdSYDmc9jW7nOWeRHR5cLxD
 6Z9IVFE9xrscLAyaEWMucVWEiKHQFAKqiL4k1zt9UzbILlEWUapbOAtk2ZJ8GOqVWZOa
 F31tDuFNIZzvTsMGW7sPQiqhvuRRsnLwmlEVsotgyB9xm2i817kH4lhdrl4GN9oZ77Mv
 Gdeg==
X-Gm-Message-State: AOAM531YK+9597n1UHq7lgfEgcHeM2uQTNQiZ4kyL/kmcVSK1NSdV4d8
 LOuFdNt7NuMIAiwGgd54nq2haYJoLth2jg==
X-Google-Smtp-Source: ABdhPJzf1aOyHdkxpsrHhv9KowkiW59mtaBKuLXxf3/+eKfxdOA7tKVfp1EvAVaEVY+fmHbMToARtA==
X-Received: by 2002:a05:622a:1998:b0:2f3:ba11:d768 with SMTP id
 u24-20020a05622a199800b002f3ba11d768mr2579884qtc.672.1651842903159; 
 Fri, 06 May 2022 06:15:03 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 l15-20020ac848cf000000b002f39b99f6c3sm2444924qtr.93.2022.05.06.06.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 06:15:03 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id w17so12774711ybh.9;
 Fri, 06 May 2022 06:15:02 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr2250498yba.380.1651842538339; Fri, 06
 May 2022 06:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
In-Reply-To: <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 May 2022 15:08:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
Message-ID: <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To: David Laight <David.Laight@aculab.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Arnd Bergmann <arnd@kernel.org>,
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
X-CRM114-CacheID: sfid-20220506_061509_434777_7893D6A8 
X-CRM114-Status: GOOD (  45.01  )
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

On Fri, May 6, 2022 at 2:56 PM David Laight <David.Laight@aculab.com> wrote:
> From: Maciej W. Rozycki
> > Sent: 06 May 2022 13:27
> > On Fri, 6 May 2022, Arnd Bergmann wrote:
> > > >  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> > > > pattern put on the bus/in the TLP in the address phase.  So what is there
> > > > inherent to the s390 architecture that prevents that different bit pattern
> > > > from being used?
> > >
> > > The hardware design for PCI on s390 is very different from any other
> > > architecture, and more abstract. Rather than implementing MMIO register
> > > access as pointer dereference, this is a separate CPU instruction that
> > > takes a device/bar plus offset as arguments rather than a pointer, and
> > > Linux encodes this back into a fake __iomem token.
> >
> >  OK, that seems to me like a reasonable and quite a clean design (on the
> > hardware side).
> >
> >  So what happens if the instruction is given an I/O rather than memory BAR
> > as the relevant argument?  Is the address space indicator bit (bit #0)
> > simply ignored or what?
>
> You don't understand something...
>
> For a memory BAR pci_ioremap() returns a token that can be used with readl().
> On most architectures readl() is just a memory access.
> This all fails on an I/O BAR.
>
> For an I/O BAR you want a similar pair of functions.
> On x86 the access function would need to use the 'in/out' instructions but
> there is no requirement for the token to be the native io port number.
> On many non-x86 architectures the access function would be a simple memory
> access - but a specific system (eg many ppc) may never actually allow
> such mappings to succeed.
>
> You might also want a third PCI mapping function that can map a memory
> BAR or an I/O BAR - with a suitable access function.
> On x86 this would need something like ioread8() for accesses.
> Except that function uses small integers for io port numbers
> (which is inherently dangerous).
>
> Nothing except the architecture specific implementation of the function
> to access an io BAR would ever go near a function called inb().
>
> The same is really true for other bus type - including ISA and EISA.
> (Ignoring the horrid of probing ISI bus devices - hopefully they
> are in the ACPI tables??_
> If a driver is probed on a ISA bus there ought to be functions
> equivalent to pci_ioremap() (for both memory and IO addresses)
> that return tokens appropriate for the specific bus.
>
> That is all a different load of churn.

A loooong time ago,  it was suggested to add register accessor
functions to struct device, so e.g. readl(dev, offset) would call
into these accessors, which would implement the bus-specific behavior.
No more worries about readl(), __raw_readl(), ioread32b(), or whatever
quirk is needed, at the (small on nowadays' machines) expense of
some indirection...

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
