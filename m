Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A41C4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 10:11:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5BC23A9F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 10:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5BC23A9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4iLk4/NVDZX6qJbtNkfesis818K6Cf0dYHEdnx4ZDT4=; b=ZTgvP7/7JNY/ORtMfAhielx6Q
	mHHSRTV+61IAfxHJt8iGwpsuaJbW28ZmZ/0UgRmlfC7ElePBx3yFLdkttvfVQA1R2SppCqB4bE3aL
	XF8IIrXLeiSq1Rf/WOeFnaITzDmIpYy0X+qOlIIo5FwPG94hSravdX6+wfPMWvxM6zRYjZr7otiiC
	nfNGkpWg4h066ePoQLyFz4Vxbwjgah/voZUEIMmL3LCoBOpG6G3tXX9SwgSVo23hPogYmH3OYuYl0
	jjByzZXQvZuct++UuNbfWGQzC084JZwFAnoa7CK7lF4zRk9KpZRdHgwpRVRBBI1V2o3+pnlSrQcvj
	Vt9bKgBow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmZxT-0000Lf-3a; Tue, 08 Dec 2020 10:10:59 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmZxP-0000JT-NX
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 10:10:57 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2735AD12;
 Tue,  8 Dec 2020 10:10:52 +0000 (UTC)
Date: Tue, 8 Dec 2020 11:10:51 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201208101051.GC6564@kitsune.suse.cz>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205142218-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_051056_027309_5875A494 
X-CRM114-Status: GOOD (  28.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: stefanha@redhat.com, corbet@lwn.net, Jason Wang <jasowang@redhat.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, linus.walleij@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello

On Sat, Dec 05, 2020 at 02:32:04PM -0500, Michael S. Tsirkin wrote:
> On Sat, Dec 05, 2020 at 08:59:55AM +0100, Enrico Weigelt, metux IT consult wrote:
> > On 04.12.20 04:35, Jason Wang wrote:
> > 
> > > 
> > > Let's use select, since there's no prompt for VIRTIO and it doesn't have
> > > any dependencies.
> > 
> > whoops, it's not that simple:
> > 
> > make: Entering directory '/home/nekrad/src/apu2-dev/pkg/kernel.apu2.git'
> > make[1]: Entering directory
> > '/home/nekrad/src/dk/DistroKit/platform-x86_64/build-target/linux-5.8.9-build'
> >   GEN     Makefile
> > drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
> > drivers/gpu/drm/Kconfig:74:	symbol DRM_KMS_HELPER is selected by
> > DRM_VIRTIO_GPU
> > drivers/gpu/drm/virtio/Kconfig:2:	symbol DRM_VIRTIO_GPU depends on VIRTIO
> > drivers/virtio/Kconfig:2:	symbol VIRTIO is selected by GPIO_VIRTIO
> > drivers/gpio/Kconfig:1618:	symbol GPIO_VIRTIO depends on GPIOLIB
> > drivers/gpio/Kconfig:14:	symbol GPIOLIB is selected by I2C_MUX_LTC4306
> > drivers/i2c/muxes/Kconfig:47:	symbol I2C_MUX_LTC4306 depends on I2C
> > drivers/i2c/Kconfig:8:	symbol I2C is selected by FB_DDC
> > drivers/video/fbdev/Kconfig:63:	symbol FB_DDC depends on FB
> > drivers/video/fbdev/Kconfig:12:	symbol FB is selected by DRM_KMS_FB_HELPER
> > drivers/gpu/drm/Kconfig:80:	symbol DRM_KMS_FB_HELPER depends on
> > DRM_KMS_HELPER
> > 
> > Seems that we can only depend on or select some symbol - we run into
> > huge trouble if thats mixed. Just changed DRM_VIRTIO_GPU to just select
> > VIRIO instead of depending on it, and now it works.
> > 
> > I've posted another patch for fixing drivers/gpu/drm/virtio/Kconfig
> > to use 'select' instead of 'depends on'.
> 
> It seems a bit of a mess, at this point I'm not entirely sure when
> should drivers select VIRTIO and when depend on it.
> 
> The text near it says:
> 
> # SPDX-License-Identifier: GPL-2.0-only
> config VIRTIO
>         tristate
>         help
>           This option is selected by any driver which implements the virtio
>           bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
>           or CONFIG_S390_GUEST.
> 
> Which seems clear enough and would indicate drivers for devices *behind*
> the bus should not select VIRTIO and thus presumably should "depend on" it.
> This is violated in virtio console and virtio fs drivers.
> 
> For console it says:
> 
> commit 9f30eb29c514589e16f2999ea070598583d1f6ec
> Author: Michal Suchanek <msuchanek@suse.de>
> Date:   Mon Aug 31 18:58:50 2020 +0200
> 
>     char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
>     
>     Make it possible to have virtio console built-in when
>     other virtio drivers are modular.
>     
>     Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>     Reviewed-by: Amit Shah <amit@kernel.org>
>     Link: https://lore.kernel.org/r/20200831165850.26163-1-msuchanek@suse.de
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> which seems kind of bogus - why do we care about allowing a builtin
> virtio console driver if the pci virtio bus driver is a module?
> There won't be any devices on the bus to attach to ...
The console driver provides early console which should initialize
without any transport. I have not tested it actually works but the code
seems to be there to support this use case.

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
