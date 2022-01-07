Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EA3C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdwHIzomAr6Yh41Ib5qB2fQUvKFvIdSo0WV/qxy+9ws=; b=0+eBf0+ksuFoVCfSSIqeDD0uO0
	2d21oTYlalEj+fvTCER8uoHoLsG/Ovww3l8c7txiy0kmAJnr4Riev2PxMdfKwrbWgvNrmY7GTwyDM
	24c0Lbzgh2AqQEszVqdpIVoPLOp74x4bH7/teb98Z5tpNmpynBANVW7VHw/o4PUqNj53wyNVBiVOb
	rcySuMUBfjDcjDwgf0HLefCAJ1/Xx8apEFQXdOrPMJLDV62GuQoqfYNa9eIRYlUNLMSms3Qz/3qE1
	Fxy3sbVnwX4w0byG5bFFgtH7pyd9OG9WwiPiDHcjBGv7PopmhdsXwezbn5Z2Xw/Si1KYNDtE6MTDh
	/zi/xpiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5srA-004j03-F0; Fri, 07 Jan 2022 17:16:48 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5sr7-004iz2-4H
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 17:16:47 +0000
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JVqWg6H9Pz67ZhV;
 Sat,  8 Jan 2022 01:11:43 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 18:16:40 +0100
Received: from [10.47.89.210] (10.47.89.210) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 7 Jan
 2022 17:16:37 +0000
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Niklas Schnelle <schnelle@linux.ibm.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Ettore Chimenti <ek5.chimenti@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, "Damien Le
 Moal" <damien.lemoal@opensource.wdc.com>, Ian Abbott <abbotti@mev.co.uk>, "H
 Hartley Sweeten" <hsweeten@visionengravers.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Karsten Keil <isdn@linux-pingi.de>, "Sathya
 Prakash" <sathya.prakash@broadcom.com>, Sreekanth Reddy
 <sreekanth.reddy@broadcom.com>, Suganath Prabu Subramani
 <suganath-prabu.subramani@broadcom.com>, Michael Grzeschik
 <m.grzeschik@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Jouni Malinen <j@w1.fi>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Hannes Reinecke <hare@suse.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>, Sumit Saxena
 <sumit.saxena@broadcom.com>, Shivasharan S
 <shivasharan.srikanteshwara@broadcom.com>, Nilesh Javali
 <njavali@marvell.com>, <GR-QLogic-Storage-Upstream@marvell.com>, Mark Brown
 <broonie@kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, "Teddy
 Wang" <teddy.wang@siliconmotion.com>, Forest Bond
 <forest@alittletooquiet.net>, Jiri Slaby <jirislaby@kernel.org>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, Jaroslav Kysela <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
 <linux-arch@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-csky@vger.kernel.org>,
 <linux-ide@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <MPT-FusionLinux.pdl@broadcom.com>,
 <linux-scsi@vger.kernel.org>, <intel-wired-lan@lists.osuosl.org>,
 <linux-wireless@vger.kernel.org>, <megaraidlinux.pdl@broadcom.com>,
 <linux-spi@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-watchdog@vger.kernel.org>
References: <20220106181409.GA297735@bhelgaas>
From: John Garry <john.garry@huawei.com>
Message-ID: <b0e772ed-4c21-3d5a-d890-aba05c41904c@huawei.com>
Date: Fri, 7 Jan 2022 17:16:23 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20220106181409.GA297735@bhelgaas>
Content-Language: en-US
X-Originating-IP: [10.47.89.210]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_091645_501571_B23D90E1 
X-CRM114-Status: GOOD (  20.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 06/01/2022 18:14, Bjorn Helgaas wrote:
>> That driver would prob not be used on systems which does not support PIO,
>> and so could have a HAS_IOPORT dependency. But it is not strictly necessary.
> I don't want the path of "this driver isn't needed because the device
> is unlikely to be used on this arch."

Sure, that was just a one off example. As I mentioned before, I think 
that Arnd already did most of the ifdeffery work, but it was not 
included in this series.

> 
> Maybe it's not_always_  possible, but if the device can be plugged
> into the platform, I think we should be able to build the driver for
> it.
> 
> If the device requires I/O port space and the platform doesn't support
> it, the PCI core or the driver should detect that and give a useful
> diagnostic.
> 

I'm not sure what the driver can say apart from -ENODEV. Or IO port 
management in resource.c could warn for requesting IO port region when 
it's unsupported.

Anyway, this same conversion was had with Linus before I got involved. 
If you think it is worth discussing again then I suppose the authors 
here need to gain consensus.

Thanks,
John

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
