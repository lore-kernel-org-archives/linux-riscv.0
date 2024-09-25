Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2656BC369AA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRA9iVqVg+Egk0LuDOMXEP2KntvSfpXAp4mdvZJRAxk=; b=D3odDgM5PFn29r
	zW0tSG3S7mv1vTSwwNn1joIy6WQAWpS0W3ZEAQZ/cxqEHBg3rNK8d7VmcChYS5jIKDQsllfF129gl
	ejGsNauvWNhuU95ovzZN5SxdHwMrsFOZxsawNG4YYwfUChi5a8diEkXMx2waNWfcSRxQh/HUY+C0V
	T3V4WxFxuvTRA2LOYM49cgnu+0GnPxS14vKniYR5+5GjM8QbOcypqP2vV+hoQO/zUibSfoJhHWh7g
	+cQntCv0A17S8D9ADFSXuDlNCQ9efASypv7qRk6CkVA2m3ZNgyP1qNWS/MPyeRTba51fltBVGDNNC
	RJZ4/qWz51tarKMfYnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stN5h-00000004SqF-0X82;
	Wed, 25 Sep 2024 08:09:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stN46-00000004SZr-3Iqe
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 08:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B59E6A43C65;
	Wed, 25 Sep 2024 08:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63529C4CEC3;
	Wed, 25 Sep 2024 08:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727251681;
	bh=lTFOVzuAlya0UbOyBgHH6STpD6xx219ysmuap5hgg10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HE9835vOVFjuYgmNZaecgjKRTThlBL1JXzrDbLYqhVKaP5exW3JMNlq6ZGYUIbs98
	 A7xvKUj7DqT7euUp/pAsPtRhMSqYiZm5ZMUxMDA45/eVa9BkFHMffcRTPQE1CYjDqf
	 tNi+ktGqGmZtqYBoryPZcZXf1DbQGV5K+6kQR16s=
Date: Wed, 25 Sep 2024 10:07:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, mka@chromium.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	wentong.wu@intel.com, oneukum@suse.com,
	javier.carrasco@wolfvision.net, matthias@kaehlcke.net,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, git@amd.com
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: introduce new config symbol
 for usb5744 SMBus support
Message-ID: <2024092553-conclude-rebuild-5541@gregkh>
References: <1727187551-3772897-1-git-send-email-radhey.shyam.pandey@amd.com>
 <2024092551-fiddle-flatterer-e643@gregkh>
 <4da1353f-1209-43ba-930e-7b4f4a0cb2eb@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4da1353f-1209-43ba-930e-7b4f4a0cb2eb@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_010803_297871_E5DC0F74 
X-CRM114-Status: GOOD (  27.85  )
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

On Wed, Sep 25, 2024 at 08:59:00AM +0200, Michal Simek wrote:
> 
> 
> On 9/25/24 08:33, Greg KH wrote:
> > On Tue, Sep 24, 2024 at 07:49:11PM +0530, Radhey Shyam Pandey wrote:
> > > Introduce new kernel config symbol for Microchip usb5744 SMBus programming
> > > support. Since usb5744 i2c initialization routine uses i2c SMBus APIs these
> > > APIs should only be invoked when kernel has I2C support. This new kernel
> > > config describes the dependency on I2C kernel support and fix the below
> > > build issues when USB_ONBOARD_DEV=y and CONFIG_I2C=m.
> > > 
> > > riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.o:
> > > undefined reference to `i2c_find_device_by_fwnode'
> > > drivers/usb/misc/onboard_usb_dev.c:408:(.text+0xb24): undefined
> > > reference to `i2c_smbus_write_block_data'
> > > <snip>
> > > 
> > > Parsing of the i2c-bus bus handle is not put under usb5744 kernel config
> > > check as the intention is to report an error when DT is configured for
> > > usb5744 SMBus support and kernel has USB_ONBOARD_DEV_USB5744 disabled.
> > > 
> > > Fixes: 6782311d04df ("usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support")
> > > Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> > > Suggested-by: Matthias Kaehlcke <matthias@kaehlcke.net>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202409140539.3Axwv38m-lkp@intel.com/
> > > ---
> > >   drivers/usb/misc/Kconfig           | 11 +++++++++++
> > >   drivers/usb/misc/onboard_usb_dev.c |  6 ++++--
> > >   2 files changed, 15 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > > index 50b86d531701..29976a93f122 100644
> > > --- a/drivers/usb/misc/Kconfig
> > > +++ b/drivers/usb/misc/Kconfig
> > > @@ -331,3 +331,14 @@ config USB_ONBOARD_DEV
> > >   	  this config will enable the driver and it will automatically
> > >   	  match the state of the USB subsystem. If this driver is a
> > >   	  module it will be called onboard_usb_dev.
> > > +
> > > +config USB_ONBOARD_DEV_USB5744
> > > +	bool "Onboard USB Microchip usb5744 hub with SMBus support"
> > > +	depends on (USB_ONBOARD_DEV && I2C=y) || (USB_ONBOARD_DEV=m && I2C=m)
> > > +	default y
> > 
> > "default y" is if you can not boot without this option enabled for all
> > Linux systems.  I doubt that is the case here :(
> 
> Intention is to have it enabled when USB_ONBOARD_DEV is enabled with all
> other conditions. In our case where our HW guys started to use this usb hub
> with usb-sd convertor where rootfs is on it. Without usb hub initialization
> via i2c we are not able to boot our system.

That's fine, so say so in the Kconfig text and your depends line should
be fine for that to be correct.  But don't do "default y" as it is not
normal for drivers.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
