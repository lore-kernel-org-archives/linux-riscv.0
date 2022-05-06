Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAC5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kg1ZEISIGBmLCBcsnIxhPraKFeci2pzHcrD7Xw+1w08=; b=x5J2LjMCLQCATr
	/O/oamIrm/od5YYb5XAfzR6p+KviV7BFOzm5Td8InarlGn88rD/3yqnMhQFnZHliS6evILftGNqB1
	WknHKG/8SbkXbDRED9IWcO39198Sj2P+il2ZMsdJt5PSEATFBxFRXb2AsAr3+Z5ynk5tUfxZYTluY
	nKchqf+wL9fFG1GDgMFmjRXwGfkpzv2Y6/6CRR5VL0Qz1odxliHlk/iPk6WM156Gh44tcvU078oe5
	oeSYW5KKZH57RISVJf390arFx7p3fxsfG2/SnZ57lmhRgqlRWJHaiF9PtReInpHpiqgN4CgS0k3mQ
	yNKuYkWkiaADLc9BdskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmzay-003zbs-OV; Fri, 06 May 2022 15:10:16 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmzaj-003zVM-Nt; Fri, 06 May 2022 15:10:04 +0000
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso7490168fac.1; 
 Fri, 06 May 2022 08:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T95DKyI860o0Ni6h4dJD+E7diEEpmm2y8EkaKK0YMZc=;
 b=y3dsAr33cCZ/Ytad1MxMRmyR9VHqmoL8Z4Noldj8yHqQmyfL2SqCsnCz81L9+Fu/B3
 9mQFyywZiw8xKgse0iwuwv2htCLYaokI0h44bS3e/j04TELBqWrIzSZwGTTgau4zFz+y
 pOqCagvbnYQOUMYqOphwAZqumUziVh/4pfBvlOQdSO0fOn0qTotpidJVICFwq2bCWRtz
 qh5kZGhPCVGJ9K5rH3toXWSGblKw+ae7knnDN0OhQq4OmJy2sUhgjbbKMwQzaLR5Vhxs
 C12+6FjQdnKkbv8X3D+zp7cd1Cu6S2TaTKkzwbZuZJmmW9IWxVMzEvkSJ4y+O47/hoAw
 YKNw==
X-Gm-Message-State: AOAM533dq25ox2DefR1yHdTerxGfnyINETf9TgOnPs77cWmXY6o7Q/y9
 u7CPnebR72tBl9TfTxwE/lx9t966koGZhg==
X-Google-Smtp-Source: ABdhPJyG0Wf9IBTmQeURJp0Pm0pt5VQJhPthWs3BbIr5J1Mpnbc2N5kIJXggEvqCh3yZFbFPUyO1cw==
X-Received: by 2002:a05:6870:2103:b0:e9:6d65:4abb with SMTP id
 f3-20020a056870210300b000e96d654abbmr4927111oae.261.1651849800350; 
 Fri, 06 May 2022 08:10:00 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52]) by smtp.gmail.com with ESMTPSA id
 bf10-20020a056808190a00b00325cda1ffb4sm1835392oib.51.2022.05.06.08.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 08:10:00 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so5106847otu.4; 
 Fri, 06 May 2022 08:10:00 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr2817893ybu.604.1651849338111; Fri, 06
 May 2022 08:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
 <62c1bf6687ac4abc98d4015852930241@AcuMS.aculab.com>
In-Reply-To: <62c1bf6687ac4abc98d4015852930241@AcuMS.aculab.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 May 2022 17:02:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1HpUNKdZDqd0e5BKfr-FqGrwGJJ_xTKw5Z55bdEJa+Q@mail.gmail.com>
Message-ID: <CAMuHMdV1HpUNKdZDqd0e5BKfr-FqGrwGJJ_xTKw5Z55bdEJa+Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220506_081001_834609_64ED2C31 
X-CRM114-Status: GOOD (  36.56  )
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

Hi David

On Fri, May 6, 2022 at 4:05 PM David Laight <David.Laight@aculab.com> wrote:
> From: Geert Uytterhoeven
> > Sent: 06 May 2022 14:09
> > > The same is really true for other bus type - including ISA and EISA.
> > > (Ignoring the horrid of probing ISI bus devices - hopefully they
> > > are in the ACPI tables??_
> > > If a driver is probed on a ISA bus there ought to be functions
> > > equivalent to pci_ioremap() (for both memory and IO addresses)
> > > that return tokens appropriate for the specific bus.
> > >
> > > That is all a different load of churn.
> >
> > A loooong time ago,  it was suggested to add register accessor
> > functions to struct device, so e.g. readl(dev, offset) would call
> > into these accessors, which would implement the bus-specific behavior.
> > No more worries about readl(), __raw_readl(), ioread32b(), or whatever
> > quirk is needed, at the (small on nowadays' machines) expense of
> > some indirection...
>
> I was just thinking that the access functions might need a 'device'.
> Although you also need the BAR (or equivalent).
> So readl(dev, bar_token, offset) or readl(dev, bar_token + offset).

Note that we do have such a system: regmap.

> Clearly the 'dev' parameter could be compiled out for non-DEBUG
> build on x86 - leaving the current(ish) object code.

Assumed all devices are PCI devices.
E.g. USB devices would still need the indirection.

> You don't want an indirect call (this year), but maybe real
> function call and a few tests won't make that much difference.
> They might affect PCIe writes, but PCIe reads are so slow you
> need to avoid them whenever possible.
> I've not timed reads into something like an ethernet chip,
> but into our fpga they are probably 1000 clocks+.
>
> OTOH I wouldn't want any overhead on the PIO fifo reads
> on one of our small ppc devices.
> We push a lot of data though that fifo and anything extra
> would kill performance.

Right.

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
