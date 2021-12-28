Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D182C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 02:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Kqd4fN8jS35tA+U3cMUKqx2Y/AwzSQFDDn4USmlsaY=; b=GC1vLHIqLlry6u
	zRPct3Nyo1mBBx+KGuhYUu4/4T5fuNnLt1pE595K4TUkcTjOMI8l5ErL8rAGKOqvY3JP9CR/udc2v
	EheDwmXnNMtJDkmicm7nRHRWCeueqSZZkUCPjXEaHffyUqYCmg79tMgMqQ4lNSMbp/go0SMad03g5
	Qbyt0AkpBGd64E4Ia0BwzPWYa0vtjKs9svSWl0yS1awffASGqJ9ySYtlLn4ZvOPmgXmk6LMLC6lYO
	GO9LFLOcPaARGnFXNdSN0Y+wLT7LB5sOrO7GJlrzB4mPeK1/87qXWvlpNcKvzIQCDjABQ35CXcrig
	oOVbZvp29WhJ65eOkdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n21wI-0007GH-Ki; Tue, 28 Dec 2021 02:10:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n21wF-0007FG-LX
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 02:10:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5464961152;
 Tue, 28 Dec 2021 02:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19A8C36AEA;
 Tue, 28 Dec 2021 02:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640657404;
 bh=SWYw07zmaaDNu+bU6UjWMUGttSEKl48ssAwYr917Irk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AP7PTZtlYcp1DDFFD9oOox44rlGILxnZhjrWGoppO9nx889cG994Anev93Fi8avnE
 QKDjPgXQd+0j5ryyJUZRF2fBwkLwO80XrnSF/7Fx+x50yneeRCMv+6NTewDTm+M3mY
 UmjlUI3lKpBa+eY+azArRNs2im3Ff4KiJ7Zi2yf5dhhdWeFi5sankCfKs3hH/NkcWY
 C3nDae4xyYfSY866Hl7iueZkbXg7sQjQFFHeioueEr+2zR+wkgXwGDiPuaIoio9xml
 rwSFGRLZ2Ry45efsPcHYEzY5Wj/FdpgdsOlVeG8/L54LBpew0o0F/pJgWb5CCAbMPX
 5d9alQgd1Ngqw==
Date: Tue, 28 Dec 2021 03:09:46 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Damien Le
 Moal <damien.lemoal@opensource.wdc.com>, Ian Abbott <abbotti@mev.co.uk>, H
 Hartley Sweeten <hsweeten@visionengravers.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jean
 Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Karsten Keil <isdn@linux-pingi.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sathya Prakash
 <sathya.prakash@broadcom.com>, Sreekanth Reddy
 <sreekanth.reddy@broadcom.com>, Suganath Prabu Subramani
 <suganath-prabu.subramani@broadcom.com>, Michael Grzeschik
 <m.grzeschik@pengutronix.de>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Jesse Brandeburg
 <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Kalle Valo <kvalo@kernel.org>, Jouni Malinen <j@w1.fi>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Hannes Reinecke <hare@suse.com>, Kashyap
 Desai <kashyap.desai@broadcom.com>, Sumit Saxena
 <sumit.saxena@broadcom.com>, Shivasharan S
 <shivasharan.srikanteshwara@broadcom.com>, Nilesh Javali
 <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, Mark Brown
 <broonie@kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy
 Wang <teddy.wang@siliconmotion.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Forest Bond <forest@alittletooquiet.net>,
 Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-wireless@vger.kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-spi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-serial@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <20211228030946.65932d2e@coco.lan>
In-Reply-To: <20211227164317.4146918-2-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_181007_853305_069016DF 
X-CRM114-Status: GOOD (  21.79  )
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

Em Mon, 27 Dec 2021 17:42:46 +0100
Niklas Schnelle <schnelle@linux.ibm.com> escreveu:

> Introduce a new LEGACY_PCI Kconfig option which gates support for legacy
> PCI devices including those attached to a PCI-to-PCI Express bridge and
> PCI Express devices using legacy I/O spaces. Note that this is different
> from non PCI uses of I/O ports such as by ACPI.
> 
> Add dependencies on LEGACY_PCI for all PCI drivers which only target
> legacy PCI devices and ifdef legacy PCI specific functions in ata
> handling.
> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/ata/Kconfig                          | 34 ++++++++--------
>  drivers/ata/ata_generic.c                    |  3 +-
>  drivers/ata/libata-sff.c                     |  2 +
>  drivers/comedi/Kconfig                       | 42 +++++++++++++++++++
>  drivers/gpio/Kconfig                         |  2 +-
>  drivers/hwmon/Kconfig                        |  6 +--
>  drivers/i2c/busses/Kconfig                   | 24 +++++------
>  drivers/input/gameport/Kconfig               |  4 +-
>  drivers/isdn/hardware/mISDN/Kconfig          | 14 +++----

>  drivers/media/cec/platform/Kconfig           |  2 +-
>  drivers/media/pci/dm1105/Kconfig             |  2 +-
>  drivers/media/radio/Kconfig                  |  2 +-

Not sure what you meant by "legacy I/O spaces" on this patch. 
I mean, I would expect non-PCIe devices - like bttv and other
devices developed at the past millennium or so to be "legacy",
but at least on media, it is touching some drivers that aren't
that old, while keeping the really old ones untouched. Instead,
it is touching a driver developed in 2017 plus two other ones
that are a way newer than other drivers.

The support for the Bt8xx chipset, in particular, is really 
weird, as a sound driver for such chipset:

> @@ -172,6 +177,7 @@ config SND_AZT3328
>  
>  config SND_BT87X
>  	tristate "Bt87x Audio Capture"
> +	depends on LEGACY_PCI
>  	select SND_PCM
>  	help
>  	  If you want to record audio from TV cards based on

was marked as dependent of LEGACY_PCI, while the DVB and V4L2 ones 
weren't.

Sounds confusing to me, as the PCI bridge used by a Bt87x device 
should be the same for all three subdevices.

I'm confused...

Regards,
Mauro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
