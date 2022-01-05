Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F213BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jan 2022 19:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=51+1OckvD4X0eYW2IBEQjemDwVYM1vVsiiasGIk/X90=; b=r3+sLWx/FYXwPl
	Ka0nYMDPrRyjaZvYWafqGy4OHZEfRPwD1W28yky9SFaomkIGlphSLU1vuDvWngbZl/SycV/axGo5/
	BEwL+01jqIPMmBhLOeKh3aln6b1A1L9TjLKlHBHTyHRS5a6lpx/z12TJErEcIhAE4+Z0LsvpdC2qq
	q4tC3kBQT1yTXlTxkCIZUSARqDsUlR1sflw7t5l8BFWszTKwUaxskeQ56u77wmyGitLE6qnix+xKe
	vqdDFWXsaeLh8fatLfulLdR3MbJvz+G2q5TMumWjXeIFtedVHu9bziPQqOI2souyE06lOkrebPUGf
	kB3WRjQgX+2JUMFs0YGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5CGI-00Fhv4-KL; Wed, 05 Jan 2022 19:47:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5CGE-00Fhui-SU
 for linux-riscv@lists.infradead.org; Wed, 05 Jan 2022 19:47:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27F5261859;
 Wed,  5 Jan 2022 19:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8F0C36AE0;
 Wed,  5 Jan 2022 19:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641412069;
 bh=t/Luv/nk2DzaSNkJU//u39w5XVRhppoSx5pKsM3k/v4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=VUv9O2qdqKxA+jG4CFc2u3LsBBtVCfotavPXFO/fA1pTVEWrxgynepfFoNwDmpPe3
 gm6mzSwrf0Mu9v8LI0ep1L8d0gF07n+txTEieNZIGWxOqW9SiL4CAOcvJbfSVMhQ+3
 AXwKESLwYk/C/VLxQ9B09ONeiabtURx+gn19Ju8IEKSa/0hYllteATy6HWhv5F/Jtp
 78FWTCTutn0mw70OCHpRgC8L6tBrcnnp3ILK1zuW9o6rgJRHSCKyS7qdLXCdCEZ3Sf
 pZgJlDurZwMThwqJkqgUgnGVT16YwqrnJM1KhaMG1e1LQ7K8PhR9cgiSRWv4dC4Mip
 cFT1uhvBqjObQ==
Date: Wed, 5 Jan 2022 13:47:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: John Garry <john.garry@huawei.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Karsten Keil <isdn@linux-pingi.de>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Kalle Valo <kvalo@kernel.org>, Jouni Malinen <j@w1.fi>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Hannes Reinecke <hare@suse.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Nilesh Javali <njavali@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com, Mark Brown <broonie@kernel.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Forest Bond <forest@alittletooquiet.net>,
 Jiri Slaby <jirislaby@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-wireless@vger.kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-spi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-serial@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-watchdog@vger.kernel.org
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <20220105194748.GA215560@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f39d8a2-2e57-a671-2926-eb4f2bf20c76@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_114751_053362_BEE9498E 
X-CRM114-Status: GOOD (  44.86  )
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

On Wed, Jan 05, 2022 at 05:42:16PM +0000, John Garry wrote:
> On 29/12/2021 16:55, Niklas Schnelle wrote:
> > On Wed, 2021-12-29 at 10:03 -0600, Bjorn Helgaas wrote:
> > > On Wed, Dec 29, 2021 at 01:12:07PM +0100, Mauro Carvalho Chehab wrote:
> > > > Em Wed, 29 Dec 2021 12:45:38 +0100
> > > > Niklas Schnelle<schnelle@linux.ibm.com>  escreveu:
> > > > > ...
> > > > > I do think we agree that once done correctly there is value in
> > > > > such an option independent of HAS_IOPORT only gating inb() etc uses.
> > > I'm not sure I'm convinced about this.  For s390, you could do this
> > > patch series, where you don't define inb() at all, and you add new
> > > dependencies to prevent compile errors.  Or you could define inb() to
> > > return ~0, which is what happens on other platforms when the device is
> > > not present.
> > > 
> > > > Personally, I don't see much value on a Kconfig var for legacy PCI I/O
> > > > space. From maintenance PoV, bots won't be triggered if someone use
> > > > HAS_IOPORT instead of the PCI specific one - or vice-versa. So, we
> > > > could end having a mix of both at the wrong places, in long term.
> > > > 
> > > > Also, assuming that PCIe hardware will some day abandon support for
> > > > "legacy" PCI I/O space, I guess some runtime logic would be needed,
> > > > in order to work with both kinds of PCIe controllers. So, having a
> > > > Kconfig option won't help much, IMO.
> > > > 
> > > > So, my personal preference would be to have just one Kconfig var, but
> > > > I'm ok if the PCI maintainers decide otherwise.
> > > I don't really like the "LEGACY_PCI" Kconfig option.  "Legacy" just
> > > means something old and out of favor; it doesn't say*what*  that
> > > something is.
> > > 
> > > I think you're specifically interested in I/O port space usage, and it
> > > seems that you want all PCI drivers that *only* use I/O port space to
> > > depend on LEGACY_PCI?  Drivers that can use either I/O or memory
> > > space or both would not depend on LEGACY_PCI?  This seems a little
> > > murky and error-prone.
> > I'd like to hear Arnd's opinion on this but you're the PCI maintainer
> > so of course your buy-in would be quite important for such an option.

I'd like to hear Arnd's opinion, too.  If we do add LEGACY_PCI, I
think we need a clear guide for when to use it, e.g., "a PCI driver
that uses inb() must depend on LEGACY_PCI" or whatever it is.

I must be missing something because I don't see what we gain from
this.  We have PCI drivers, e.g., megaraid [1], for devices that have
either MEM or I/O BARs.  I think we want to build drivers like that on
any arch that supports PCI.

If the arch doesn't support I/O port space, devices that only have I/O
BARs won't work, of course, and hopefully the PCI core and driver can
figure that out and gracefully fail the probe.

But that same driver should still work with devices that have MEM
BARs.  If inb() isn't always present, I guess we could litter these
drivers with #ifdefs, but that would be pretty ugly.  IMO inb() should
be present but do something innocuous like return ~0, as it would if
I/O port space is supported but there's no device at that address.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/scsi/megaraid.c?id=v5.15#n4210

> I can't see the value in the LEGACY_PCI config - however I don't really
> understand Arnd's original intention.
> 
> It was written that it would allow us to control "whether we have any
> pre-PCIe devices or those PCIe drivers that need PIO accessors other than
> ioport_map()/pci_iomap()".
> 
> However I just don't see why CONFIG_PCI=y and CONFIG_HAS_IOPORT=y aren't
> always the gating factor here. Arnd?
> 
> Thanks,
> John

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
