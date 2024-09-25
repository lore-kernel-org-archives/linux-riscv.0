Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3239DCF9C71
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 06:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZ/6U9LSudiRbI4e736VGsDYZyEtOeINvqPqZUASVs8=; b=2VvsIh8fG5YksU
	nFhGmsdsn23UIELLOiGyaBUWmPXVsHaksBtai8+1ILqLp9I8GHCQ8HFhHGUGZm2SrP2vYxPOeYFTa
	QNry7ZI7Nu2YpnEW8JvL708EhrtyVBzYM1Vu/MzBdkdivNHkKzTVobB1OITSfNibmEJnlDxAjF9Xs
	wUJYlA2GKl37+3V64XcvqqqAtBgZMwvV3wuma1loj46g7+kBs80Gs7iTLis25QY3aFsJqOYnIjsGS
	+/O1RF8ZFcrVOoJJJLDZ4S/Hc1LJWfla6uFVaaEqmiLoGX7+RdBPpm5BV9UimJaYTOYM3dlX7jgsX
	I8aY38Hjni95zlVExsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stLaU-00000004BCp-1hW6;
	Wed, 25 Sep 2024 06:33:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stLaS-00000004BCM-1Acy
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 06:33:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1611FA43BDD;
	Wed, 25 Sep 2024 06:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49877C4CEC3;
	Wed, 25 Sep 2024 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727245998;
	bh=y9G0C2SMaTaMUO5hy0HPIGvfCwhhJGHDIxI2Up6CPGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0mhKFVCvSG/DxAMBggBKP8SnPMFh/btOWPIl6l3MD8j7TvIvNRHwORq23GXjXR4zX
	 6nHUbk01N25Bm+x1C3s1oOGk2+qs6Qlbp4lqyqmMxz6yoJT/otGkVu3fIvtAml8SSv
	 LsG6/K8btmiI0eoh+P9NNakWlGzpUezifbxacQS0=
Date: Wed, 25 Sep 2024 08:33:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: mka@chromium.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, wentong.wu@intel.com, oneukum@suse.com,
	javier.carrasco@wolfvision.net, matthias@kaehlcke.net,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, git@amd.com
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: introduce new config symbol
 for usb5744 SMBus support
Message-ID: <2024092551-fiddle-flatterer-e643@gregkh>
References: <1727187551-3772897-1-git-send-email-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1727187551-3772897-1-git-send-email-radhey.shyam.pandey@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_233320_430553_0E0321DD 
X-CRM114-Status: GOOD (  19.81  )
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

On Tue, Sep 24, 2024 at 07:49:11PM +0530, Radhey Shyam Pandey wrote:
> Introduce new kernel config symbol for Microchip usb5744 SMBus programming
> support. Since usb5744 i2c initialization routine uses i2c SMBus APIs these
> APIs should only be invoked when kernel has I2C support. This new kernel
> config describes the dependency on I2C kernel support and fix the below
> build issues when USB_ONBOARD_DEV=y and CONFIG_I2C=m.
> 
> riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.o:
> undefined reference to `i2c_find_device_by_fwnode'
> drivers/usb/misc/onboard_usb_dev.c:408:(.text+0xb24): undefined
> reference to `i2c_smbus_write_block_data'
> <snip>
> 
> Parsing of the i2c-bus bus handle is not put under usb5744 kernel config
> check as the intention is to report an error when DT is configured for
> usb5744 SMBus support and kernel has USB_ONBOARD_DEV_USB5744 disabled.
> 
> Fixes: 6782311d04df ("usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support")
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Suggested-by: Matthias Kaehlcke <matthias@kaehlcke.net>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409140539.3Axwv38m-lkp@intel.com/
> ---
>  drivers/usb/misc/Kconfig           | 11 +++++++++++
>  drivers/usb/misc/onboard_usb_dev.c |  6 ++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 50b86d531701..29976a93f122 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -331,3 +331,14 @@ config USB_ONBOARD_DEV
>  	  this config will enable the driver and it will automatically
>  	  match the state of the USB subsystem. If this driver is a
>  	  module it will be called onboard_usb_dev.
> +
> +config USB_ONBOARD_DEV_USB5744
> +	bool "Onboard USB Microchip usb5744 hub with SMBus support"
> +	depends on (USB_ONBOARD_DEV && I2C=y) || (USB_ONBOARD_DEV=m && I2C=m)
> +	default y

"default y" is if you can not boot without this option enabled for all
Linux systems.  I doubt that is the case here :(

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
