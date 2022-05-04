Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B069C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqWLq7g48jb5PTLiNt7dKQhmPIhtkc1agOn8bCGvaks=; b=WwyKUxFSkTkoFt
	/qvjiXy4nXP0a2Qpq2FB6YqUVL+4492OkT26o189QReVaROa4S+Dkk12BN2D6V3Ju0NrKkSp/tNyf
	iOhYKXgX646IuX+kjNw+UFzIIqfaSbX9VZNQg6FNfD2Wc0g5UDFp95bGhGAoVb3SQdk9RCggKmaOQ
	OCQWIL7HAwy5ch89/uAJQfNQQXr2QCzwvp84mX6Hksfit5OyzMrkTWBKJGboQvgWTAI3eh6mKsnr/
	p5xCLCeATVGFa/UUa3j3+/NAbjP+meyRIWOpyNY9PHRmVFssie+MSFxVENlTFxonJ9hO2u2SvxbyF
	3Fj3BMqXNijM2UBdaaqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmMbT-00Cod6-RS; Wed, 04 May 2022 21:32:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmMbH-00Cob1-WB; Wed, 04 May 2022 21:32:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AE181B829E8;
 Wed,  4 May 2022 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B46CC385BE;
 Wed,  4 May 2022 21:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651699916;
 bh=zFvzT8pCm+1ful8W/hZ4LOb35c/AZPHiTAR5f5uq/tc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qix03QWrW/M9Q01/CbNXabQPqALS0k2BKt6VxlOe1jiP/AezUZVDCvh4yTzGSZ1VX
 f3sd0OANEUGS9y8e49LguWWCyW4IIqICzTbIRENSe7H562JU9DKsizSMJGj0D1qgE0
 e3sbpXCVZ0YHdBu7pjY81yf79hjsGUtLgflShVgutaLE+7z6GG3nTPnUVFOGctNypM
 uPNVpy9CFsHRw2h5q6RwUUMPGQDWh/B3pMSzlWBDN62C8KEDNkvEiyYMjP44xLdr3z
 lxTJ/50ArU+B8Ay1W19vAfqkOvhBHHTgMSpDt0dLDSO9PzH0nQh5Pjqn5G0BCRwXrd
 JEEWLoC1A5IGg==
Received: by mail-wr1-f48.google.com with SMTP id j15so3680762wrb.2;
 Wed, 04 May 2022 14:31:56 -0700 (PDT)
X-Gm-Message-State: AOAM533W1qx23h+/wwBlmSM9/GFYviv5/OkcIlJ7G5CL0cJwpKMV9qza
 gvJcknd6D217wNsnu8nCnujLRpRP01VuabVKmWA=
X-Google-Smtp-Source: ABdhPJxAVZcK+UbsrIHV3UqhufeJ7C2MWsg9y8caQR3XP4mze6wyb/qHpchpXkh4iCCt0pJlSodAlnXDA871Nj1pC0U=
X-Received: by 2002:adf:e106:0:b0:20a:b31b:213d with SMTP id
 t6-20020adfe106000000b0020ab31b213dmr17558428wrz.219.1651699904306; Wed, 04
 May 2022 14:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220429135108.2781579-2-schnelle@linux.ibm.com>
 <20220504210840.GA469916@bhelgaas>
In-Reply-To: <20220504210840.GA469916@bhelgaas>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 4 May 2022 23:31:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
Message-ID: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, 
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, 
 "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, 
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, 
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
 "open list:SUPERH" <linux-sh@vger.kernel.org>, 
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_143200_333960_0ABAA446 
X-CRM114-Status: GOOD (  26.53  )
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

On Wed, May 4, 2022 at 11:08 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Apr 29, 2022 at 03:49:59PM +0200, Niklas Schnelle wrote:
> > We introduce a new HAS_IOPORT Kconfig option to indicate support for
> > I/O Port access. In a future patch HAS_IOPORT=n will disable compilation
> > of the I/O accessor functions inb()/outb() and friends on architectures
> > which can not meaningfully support legacy I/O spaces such as s390 or
> > where such support is optional.
>
> So you plan to drop inb()/outb() on architectures where I/O port space
> is optional?  So even platforms that have I/O port space may not be
> able to use it?
>
> This feels like a lot of work where the main benefit is to keep
> Kconfig from offering drivers that aren't of interest on s390.
>
> Granted, there may be issues where inb()/outb() does the wrong thing
> such as dereferencing null pointers when I/O port space isn't
> implemented.  I think that's a defect in inb()/outb() and could be
> fixed there.

The current implementation in asm-generic/io.h implements inb()/outb()
using readb()/writeb() with a fixed architecture specific offset.

There are three possible things that can happen here:

a) there is a host bridge driver that maps its I/O ports to this window,
    and everything works
b) the address range is reserved and accessible but no host bridge
   driver has mapped its registers there, so an access causes a
   page fault
c) the architecture does not define an offset, and accessing low I/O
    ports ends up as a NULL pointer dereference

The main goal is to avoid c), which is what happens on s390, but
can also happen elsewhere. Catching b) would be nice as well,
but is much harder to do from generic code as you'd need an
architecture specific inline asm statement to insert a ex_table
fixup, or a runtime conditional on each access.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
