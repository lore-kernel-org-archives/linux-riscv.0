Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80644C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 18:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=kjSRzFy8S4YOLy55soWpqyxqYYEzYFUAFYVesZHb9fM=; b=usHF4Svc0+De12
	bwD0+qvRGzhkPUBCyofY5rT6HM16Yn7H/isM/6aGUbOKcSD5LGKsfgJjgqOL3+yvY6uFp92znQFEZ
	ajs/usSVYutctmh7cNz1TUFFfkqMA6bs3Y6ZIL2ZnyuZ+IIhGHMM000gVI+4pCfWw2XoWe7IRl40z
	HQM3BeWACrGU7Y4VxeqYW9fF+VPkDj00/GklmbO+Fe/nACt0GgMQ7hUGJmB2A+miSbqI0hSCAqa73
	cRmGTzVIOTGBPFDkzMp98LOSguKKBEGSGZ1fFQjFD5/PGHV1zwck42FPk1BZfWNI4Eyc5t/CNniNt
	HsObqX/2KBJqL7IdBYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5XHF-000xX4-3z; Thu, 06 Jan 2022 18:14:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5XHB-000xUt-Ck
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 18:14:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E4BAFB822E4;
 Thu,  6 Jan 2022 18:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A780C36AEB;
 Thu,  6 Jan 2022 18:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641492850;
 bh=pk9c3vFsS24A9H9YRNmuoLU04tTgveyiSfxz/RguLrg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=tWL9ah320xPJ7ZLvQrLFkjIeV1LTlPrJ2qSY/t0fKFbU+5MxnpWBBUesVfIjO0xOO
 l+Yvi8TANgRjNK2vReZYRlLqehfzP4qE2oNJarfvWixIS0OfQkuKWpI6rrQEfWGn25
 oroVHI/IQA8JEpMkHqxWMkHxAKg+IVXn/Zqji7RoVtpWyymeRt5WcM4qay0A7EFOWe
 jnI4JpbaAmAttF9a/Yhl/wWUUgx6A1s8zF9Wpc8ft5Y9hFSMLv91rRujQQ/od6scnA
 LsHiF+8iYMGoQ6RcvIn/+ZU8WqHN0Y3LnsXMJdYHRbXi/+K/WGfnGi+pM9zExj10bs
 +smYL/+iBYHZg==
Date: Thu, 6 Jan 2022 12:14:09 -0600
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
Message-ID: <20220106181409.GA297735@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74bf4fde-3972-1c36-ca04-58089da0d82b@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_101413_729393_62409FDA 
X-CRM114-Status: GOOD (  22.17  )
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

On Thu, Jan 06, 2022 at 05:41:00PM +0000, John Garry wrote:
> On 05/01/2022 19:47, Bjorn Helgaas wrote:

> > IMO inb() should
> > be present but do something innocuous like return ~0, as it would if
> > I/O port space is supported but there's no device at that address.
> > 
> > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/scsi/megaraid.c?id=v5.15#n4210
> > 
> 
> That driver would prob not be used on systems which does not support PIO,
> and so could have a HAS_IOPORT dependency. But it is not strictly necessary.

I don't want the path of "this driver isn't needed because the device
is unlikely to be used on this arch."

Maybe it's not _always_ possible, but if the device can be plugged
into the platform, I think we should be able to build the driver for
it.

If the device requires I/O port space and the platform doesn't support
it, the PCI core or the driver should detect that and give a useful
diagnostic.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
