Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1075CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Dec 2021 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RzoP9KHLCmh7LXfb8UhAKIVktOB/YWnnIAxAnQbpHBk=; b=tb3G/rzsCwFrRk
	YbnsHYiMp+Wwl16Pw+/yedfNmoef9NvK6bBJl8sMXY+QgOv/e/MheiqFZqvsqajW2Eef4cdaQoJms
	6o6rZkFmDmqA2qZqoVNItLqN/U0r5jKRHpX72KKOdzLPvhGm6KKSBMiG9WjZ5swFY0YryieXziVvu
	+Tu9Qju5MZvG8qmyvMaK+2T4ViphcXI2Tt8paNs8vf/tr3glBsvs443lRn/B0ktdPjb8omjRGVMOm
	unGP9SfIg+Y4PnSL+Of5X5ScUb1vIs9AV+dMffck32CBEtIogU9+9a/Q0GmrFTRa25KqVShmpBlKf
	CLh4FfkpyR9l+G3HZ0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2bQB-0035aJ-OX; Wed, 29 Dec 2021 16:03:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2bQ9-0035ZX-7P
 for linux-riscv@lists.infradead.org; Wed, 29 Dec 2021 16:03:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5F876150C;
 Wed, 29 Dec 2021 16:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8504C36AE7;
 Wed, 29 Dec 2021 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640793799;
 bh=JjpeFlX1D08ft528esGQ/Dmp3d8gak2dGxLVU5277kI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=JpP2t1WEsiIyRq1md3yeDJqKD5b+v6vPK3dQL5KYtPRU6IzcCE2hfeoejuHeG11gd
 lC8IFpViEh+GNBkNBx4n5nW244Tql53dIjOETTsQ8i+5UfJvW9Ilc8EhjCT4Q4lOA4
 QM42sYWxI3kXC/do4dsN3O/F/5QTnKyWIH4D+TjWyd3Qv8ZelIjD6sZhRig841ypqR
 mTWsO71n3E7t2fJyuxqamjyrcVx+C0YBZwG9aCQStF11NC5RlZEPgKB5Mk28JwNuWp
 wwR/on9msDkJi5KBJfEq5mX9Wm2DfRpIzk3oUTTCtQJyiHOzO2W6s1m8x+iPToCIeX
 pL3LlEJMF3ouw==
Date: Wed, 29 Dec 2021 10:03:17 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
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
Message-ID: <20211229160317.GA1681139@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211229131207.1ac25424@coco.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_080321_391339_25DEE291 
X-CRM114-Status: GOOD (  25.00  )
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

On Wed, Dec 29, 2021 at 01:12:07PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 29 Dec 2021 12:45:38 +0100
> Niklas Schnelle <schnelle@linux.ibm.com> escreveu:
> > ...

> > I do think we agree that once done correctly there is value in
> > such an option independent of HAS_IOPORT only gating inb() etc uses.

I'm not sure I'm convinced about this.  For s390, you could do this
patch series, where you don't define inb() at all, and you add new
dependencies to prevent compile errors.  Or you could define inb() to
return ~0, which is what happens on other platforms when the device is
not present.

> Personally, I don't see much value on a Kconfig var for legacy PCI I/O 
> space. From maintenance PoV, bots won't be triggered if someone use
> HAS_IOPORT instead of the PCI specific one - or vice-versa. So, we
> could end having a mix of both at the wrong places, in long term.
> 
> Also, assuming that PCIe hardware will some day abandon support for 
> "legacy" PCI I/O space, I guess some runtime logic would be needed, 
> in order to work with both kinds of PCIe controllers. So, having a
> Kconfig option won't help much, IMO.
> 
> So, my personal preference would be to have just one Kconfig var, but
> I'm ok if the PCI maintainers decide otherwise.

I don't really like the "LEGACY_PCI" Kconfig option.  "Legacy" just
means something old and out of favor; it doesn't say *what* that
something is.

I think you're specifically interested in I/O port space usage, and it
seems that you want all PCI drivers that *only* use I/O port space to
depend on LEGACY_PCI?  Drivers that can use either I/O or memory
space or both would not depend on LEGACY_PCI?  This seems a little
murky and error-prone.

What if you used the approach from [1] but just dropped the warning?
The inb() would return ~0 if the platform doesn't support I/O port
space.  Drivers should be prepared to handle that because that's what
happens if the device doesn't exist.  

HAS_IOPORT and LEGACY_PCI is a lot of Kconfiggery that basically just
avoids building drivers that aren't useful on s390.  I'm not sure the
benefit outweighs the complication.

Bjorn

[1] https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
