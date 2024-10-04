Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD97ACF854E
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQ1JDTHGGCQOEwrSiEBv8bsqgPiTbz5J6LHdCo5/lHg=; b=bD4/yF042IRsUj
	gA4xJH3Vy3oYy1OPyGuB7WEYzQyIt2k1Lfj4ClmkuSTtGQCLLohGoIV8n8Lkly1n1eO4iSeWWbSUc
	HsWaZVzWhzznJTl62G8iWAvexdo/Bw4Ue+6bafJYtKrz4DHClSi4XvZMeE8spSdhoy9FaWK+uxycE
	S/7NBP6ZTqWI7EyXvHynMS8YzqiKmc2u6QP5GJCsC3SjjFbadds3OcGXp3LqTF9Jg4ZJgddOXtMid
	ADFetEBMxoK4ezzQHSPU0KgID6TTL9+RyDL3lJ7XT/wFAF0qIv5qnPm7fSD/wCKQIsvTz2jYBM5QK
	nQooP0OJpOhw2QF2vObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swiw6-0000000CgF9-3e4J;
	Fri, 04 Oct 2024 14:05:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swiUq-0000000CZLf-0qWe
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 13:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BCAF2A449E2;
	Fri,  4 Oct 2024 13:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427CFC4CEE9;
	Fri,  4 Oct 2024 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728049043;
	bh=VCQYCMDeLbPZDcPRtkc1G603J37v7olth2VxaQVhvz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpfqaVrs9UxEMSduJFeoUmIKN/iVYISdJ2r0COgFTfBx+hqY0h80HLSFF9ZsWVl0e
	 /ZEeqjc+4ZA6777fFXNI+cMl4pf1arORMPZmAwiT4SeaVAzKx1rVhUD+2u0xkYXHEM
	 gjNi6vWGeAmvb3Fgb/rXQI2Raf+cvG4nf0YVPPxU=
Date: Fri, 4 Oct 2024 15:37:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: mka@chromium.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, wentong.wu@intel.com,
	sakari.ailus@linux.intel.com, javier.carrasco@wolfvision.net,
	matthias@kaehlcke.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	git@amd.com
Subject: Re: [PATCH v2] usb: misc: onboard_usb_dev: introduce new config
 symbol for usb5744 SMBus support
Message-ID: <2024100406-spyglass-roulette-761d@gregkh>
References: <1727529992-476088-1-git-send-email-radhey.shyam.pandey@amd.com>
 <2024100442-yoyo-fifth-2125@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2024100442-yoyo-fifth-2125@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_063728_651934_4947596F 
X-CRM114-Status: GOOD (  29.98  )
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

On Fri, Oct 04, 2024 at 03:36:11PM +0200, Greg KH wrote:
> On Sat, Sep 28, 2024 at 06:56:32PM +0530, Radhey Shyam Pandey wrote:
> > Introduce new kernel config symbol for Microchip usb5744 SMBus programming
> > support. Since usb5744 i2c initialization routine uses i2c SMBus APIs these
> > APIs should only be invoked when kernel has I2C support. This new kernel
> > config describes the dependency on I2C kernel support and fix the below
> > build issues when USB_ONBOARD_DEV=y and CONFIG_I2C=m.
> > 
> > riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.o:
> > undefined reference to `i2c_find_device_by_fwnode'
> > drivers/usb/misc/onboard_usb_dev.c:408:(.text+0xb24): undefined
> > reference to `i2c_smbus_write_block_data'
> > <snip>
> > 
> > Parsing of the i2c-bus bus handle is not put under usb5744 kernel config
> > check as the intention is to report an error when DT is configured for
> > usb5744 SMBus support and kernel has USB_ONBOARD_DEV_USB5744 disabled.
> > 
> > Fixes: 6782311d04df ("usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support")
> > Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> > Suggested-by: Matthias Kaehlcke <matthias@kaehlcke.net>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202409140539.3Axwv38m-lkp@intel.com/
> > Acked-by: Matthias Kaehlcke <matthias@kaehlcke.net>
> > ---
> > Changes for v2:
> > - As suggested by Greg drop default 'y' and instead describe the
> >   constraints in the kconfig description.
> > ---
> >  drivers/usb/misc/Kconfig           | 12 ++++++++++++
> >  drivers/usb/misc/onboard_usb_dev.c |  6 ++++--
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > index 50b86d531701..6497c4e81e95 100644
> > --- a/drivers/usb/misc/Kconfig
> > +++ b/drivers/usb/misc/Kconfig
> > @@ -331,3 +331,15 @@ config USB_ONBOARD_DEV
> >  	  this config will enable the driver and it will automatically
> >  	  match the state of the USB subsystem. If this driver is a
> >  	  module it will be called onboard_usb_dev.
> > +
> > +config USB_ONBOARD_DEV_USB5744
> > +	bool "Onboard USB Microchip usb5744 hub with SMBus support"
> > +	depends on (USB_ONBOARD_DEV && I2C=y) || (USB_ONBOARD_DEV=m && I2C=m)
> > +	help
> > +	  Say Y here if you want to support onboard USB Microchip usb5744
> > +	  hub that requires SMBus initialization.
> > +
> > +	  This options enables usb5744 i2c default initialization sequence
> > +	  during hub start-up configuration stage. It is must to enable this
> > +	  option on AMD Kria KR260 Robotics Starter Kit as this hub is
> > +	  connected to USB-SD converter which mounts the root filesystem.
> 
> With this applied I get the following build warning:
> 
> 
> WARNING: unmet direct dependencies detected for MODVERSIONS
>   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
>   Selected by [y]:
>   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
> 
> WARNING: unmet direct dependencies detected for MODVERSIONS
>   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
>   Selected by [y]:
>   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
> 
> WARNING: unmet direct dependencies detected for MODVERSIONS
>   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
>   Selected by [y]:
>   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
> 
> 
> Which is odd.
> 
> It's one extra "unmet direct ..." message than normal for now, so
> something in this commit is not working properly.
> 
> Can you fix this up and send a new version?

Nevermind, it's not this patch's fault, I'll go take this now, sorry for
the noise...

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
