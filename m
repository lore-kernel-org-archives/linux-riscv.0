Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF25CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 12:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLEtNZ749reWP123APfVBafy32kv5XZIJp4LhfWAYOA=; b=ITVMAmpi6GjwqO
	KhKQBRVS8hj+hijXr64AndnwCIRc6LiikxnYoz/wv3mvweIw07YlGL7D/ivm2ghuSi7o0SgRTIIdw
	6bFyoGv/if+MEKnEaNAx7iiV0Y8nNqK9rQ/08Sx7J3Oi5+rsMiuTEYD2WUAggyomghavtK7z5tqUv
	J6B1OejSyydlDYLU+lj644gAMtTewVszfvjl7lcwqdDWhnRMfG/+2x3HuwsqRLVsroJGdDLzMS6+J
	ppPJjYKKVC6FHST63HswCyoqb0BBhJ0ygkFnBJzZeChbBx8iKv06pAL4tKRedLGBn0ecLlC3QoZBc
	mCLaKTE1XyG47CSKOcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2BAq-000rZG-E3; Tue, 28 Dec 2021 12:01:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2BAn-000rYH-IC
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 12:01:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4CD9DB81199;
 Tue, 28 Dec 2021 12:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C83C36AE8;
 Tue, 28 Dec 2021 12:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640692902;
 bh=dpf3i7sjhIXaDkn8SthFB0jsZoBRTSFg7eTP6aY/SC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cN4QD1KP8rQOfSZWJcUJF6kjhcWMfJ7bsZb/f5oUmzKHLL7psqPmCS6g0Qkj/K564
 7/rlEQ+Pe342cAd267FpeISixTvHGRK0P9C0wYDjAD6ufccb9veUMjKH50WqUkS/jg
 kHgfqD+MN2N2OGriHTomtwS+h+y4P/Fk7pKEHkJ8=
Date: Tue, 28 Dec 2021 13:01:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-serial@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <Ycr8ooFX+w9RGu1M@kroah.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
 <YcrJAwsKIxxX18pW@kroah.com> <20211228101435.3a55b983@coco.lan>
 <b1475f6aecb752a858941f44a957b2183cd68405.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1475f6aecb752a858941f44a957b2183cd68405.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_040145_897946_408A7EDE 
X-CRM114-Status: GOOD (  14.03  )
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

On Tue, Dec 28, 2021 at 11:58:55AM +0100, Niklas Schnelle wrote:
> We add both LEGACY_PCI and HAS_IOPORT to differentiate between two
> cases. HAS_IOPORT is for PC-style devices that are not on a PCI card
> while LEGACY_PCI is for PCI drivers that require port I/O. This
> includes pre-PCIe devices as well as PCIe devices which require
> features like I/O spaces. The "legacy" naming is comes from the PCIe
> spec which in section 2.1.1.2 says "PCI Express supports I/O Space for
> compatibility with legacy devices which require their use. Future
> revisions of this specification may deprecate the use of I/O Space."

Ah, then mention the reason why this is called LEGACY_PCI is that it is
because that is what the PCI spec calls it.  It was not obvious here at
all that this is where the name came from.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
