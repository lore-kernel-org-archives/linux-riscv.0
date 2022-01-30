Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CDAC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjrZoRob81/Nq77yFlRBUV0eGUg7p5BTZl7wHy8bscg=; b=bvuePMM3hXEPDw
	s+i8Pgr5ACzowDX3eRDyTK9m6rpGZmZI5B26VqoVh/klPm3BqemmOl6k+s5Kv6uil3n/NC33sL8uu
	fsEkOwvzzBdwTsIQLQcl/jntQ0vWECST1z5eLz/Lr+88lH7UUmwHqvc20ZdVp1gdFRYDMvXNANcLu
	mt/itil8A1L32sFekS8N5D2CpoTMC0fFzAHhdZQHY/RKCKN6zYDb5qgbZs0rl/rQdfRKUvPNWrund
	aaJyeeKhjO6VyPYiPgNUS2nO9YumA0F9dxRhGehvsXBt4n8/nmvx2e+tVUq6fHqcBfS58M9dHHORL
	6vOEcf6ssgVaxG3p1RGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBhg-006o5n-6O; Sun, 30 Jan 2022 15:01:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBfH-006mxE-Qr
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 14:58:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 198A261201;
 Sun, 30 Jan 2022 14:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C61C340E4;
 Sun, 30 Jan 2022 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643554730;
 bh=GL1zKW+fnVss13mOmdWWVRmOagcQ6XFxtwi7aOMdkXw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iqwJ3iNFmreR4JSoSb4n27mVOKwAewuQXXOFGNk4buR2bUqeaXL0Pnz8qH7UMdbOL
 YVTNx/bXBnSh3ddVHi9MjxOyx4o56pVqJkaF5orz2suVUp6L7z7MNGvI9jwWDluvQM
 abfTwVqaEnksmOuCzx9B/LQOMLDwXIF0sgsiGg1/L/TgqCl5f0hfPSayS9WYnP1rNE
 Wf4xIlKEeKSB4bzDrcS6HvjQXQPUtiudZiKxLkmdfDy181KMyWBXUosw397yqxSx0e
 AcVsnpixAiVrsts7NdGblMAN8BclBYHagOWoUo+t4wO+G3vfpXR3yhnk9TmfX070XJ
 oaa3r6iUZCoWg==
Date: Sun, 30 Jan 2022 15:05:10 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann
 <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, John Garry
 <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, Greentime Hu
 <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org,
 linux-iio@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>
Subject: Re: [RFC 12/32] iio: adc: Kconfig: add HAS_IOPORT dependencies
Message-ID: <20220130150510.66ea7cd4@jic23-huawei>
In-Reply-To: <20211228170031.12dac755@jic23-huawei>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-13-schnelle@linux.ibm.com>
 <CAMuHMdXDL6XXfohzJFTTV6tR=gg=bcCQq935eKUbNaNLHp9xiw@mail.gmail.com>
 <b21410ee32857b4913e4ba4595f9e8da299c501f.camel@linux.ibm.com>
 <20211228170031.12dac755@jic23-huawei>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_065852_027615_C7514F36 
X-CRM114-Status: GOOD (  42.01  )
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

On Tue, 28 Dec 2021 17:01:25 +0000
Jonathan Cameron <jic23@jic23.retrosnub.co.uk> wrote:

> On Tue, 28 Dec 2021 13:50:20 +0100
> Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> 
> > On Tue, 2021-12-28 at 11:32 +0100, Geert Uytterhoeven wrote:  
> > > Hi Niklas,
> > > 
> > > On Mon, Dec 27, 2021 at 5:53 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:    
> > > > In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> > > > not being declared. We thus need to add HAS_IOPORT as dependency for
> > > > those drivers using them.
> > > > 
> > > > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > > > Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> > > > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>    
> 
> As a side note, whilst it doesn't always happen and I regularly forget
> to fix it up whilst applying, it's really helpful to make sure the driver
> name is somewhere in the patch title.
> 
> e.g. iio: adc: ad7606: add HAS_IOPORT dependencies.
> 
> > > 
> > > Thanks for your patch!
> > >     
> > > > --- a/drivers/iio/adc/Kconfig
> > > > +++ b/drivers/iio/adc/Kconfig
> > > > @@ -119,7 +119,7 @@ config AD7606
> > > > 
> > > >  config AD7606_IFACE_PARALLEL
> > > >         tristate "Analog Devices AD7606 ADC driver with parallel interface support"
> > > > -       depends on HAS_IOMEM
> > > > +       depends on HAS_IOPORT    
> > > 
> > > While this driver uses ins[bw](), this seems unrelated to legacy
> > > I/O space, as the driver maps a MMIO region.  Probably different
> > > accessors should be used instead.    
> > 
> > You're right on first glance it looks like a misuse of the ins[bw]()
> > accessors. I do wonder how that even works, if PCI_IOBASE is 0 it would
> > result in readsw()/readsb() with presumably the correct address but no
> > idea how this interacts witth x86's special I/O instructions.
> >   
> > > 
> > > Note that this driver has no in-tree users. Same for the SPI variant,
> > > but at least that one has modern json-schema DT bindings ;-)    
> > 
> > Can't find any mention in the MAINTAINERS file either.  
> 
> It falls under the Analog devices catch all.
> We don't list them all individually because there are a lot of them and
> it would just be noise in many case.
> 
> Added Michael to CC. You already have Lars.
> 
> ANALOG DEVICES INC IIO DRIVERS
> M:	Lars-Peter Clausen <lars@metafoo.de>
> M:	Michael Hennerich <Michael.Hennerich@analog.com>
> S:	Supported
> W:	http://wiki.analog.com/
> W:	http://ez.analog.com/community/linux-device-drivers
> F:	Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9523
> F:	Documentation/ABI/testing/sysfs-bus-iio-frequency-adf4350
> F:	Documentation/devicetree/bindings/iio/*/adi,*
> F:	Documentation/devicetree/bindings/iio/dac/adi,ad5758.yaml
> F:	drivers/iio/*/ad*
> F:	drivers/iio/adc/ltc249*
> F:	drivers/iio/amplifiers/hmc425a.c
> F:	drivers/staging/iio/*/ad*
> X:	drivers/iio/*/adjd*
> 
> https://wiki.analog.com/resources/tools-software/linux-drivers/iio-adc/ad7606
> includes some details.
> 
> I'll leave it to the Lars or Michael to confirm what is going on here.

Can someone (probably at Analog Devices) take a look at this?

Thanks,

Jonathan

> 
> Jonathan
> 
> >   
> > >     
> > > >         select AD7606
> > > >         help
> > > >           Say yes here to build parallel interface support for Analog Devices:    
> > > 
> > > Gr{oetje,eeting}s,
> > > 
> > >                         Geert
> > > 
> > > --
> > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > > 
> > > In personal conversations with technical people, I call myself a hacker. But
> > > when I'm talking to journalists I just say "programmer" or something like that.
> > >                                 -- Linus Torvalds    
> >   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
