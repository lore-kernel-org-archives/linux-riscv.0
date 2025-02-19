Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF4BC021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVC7J2sZqny83H4smWbkn/Lx7oZPF+mRmErZ/Eog8WI=; b=DGeTEFWUBGATOM
	v7A9Qm/yVGhQwDFdk04tWkVDv0UjBr5Lbu47VUrIkItDD0ziSUOyD4bTu0Xfr1q5Fgpv2AtyLLX9B
	LB+zZ2Fw2dYHYlIfpOtnSiFaeNZrzTL8ZutwR217mdbsvY6rp4EvtJufydrk6isVIsJPys/R/P5+G
	6g4PgzDLCrIlIsFz8vPjTTtgRo9CTBeS3URRZZTDEFS73HDup58/jVCESheFYM9WxUsFkK7TcuytO
	2KkUls7+tpHOXJgXOWiSxWGNM2n4anioeYopw7QJxXl44GkkkVS4CJJJ3lXKCjLyAGmkoToC8Q88n
	1pmT5Rdt8AEurjp79wJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkits-0000000Cawn-2e0t;
	Wed, 19 Feb 2025 12:10:00 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkisN-0000000CaZI-1GX7
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 12:08:29 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-543d8badc30so7700217e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 04:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739966905; x=1740571705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kfNES95aCHrH5DW7HOssGE1cf0vTi0kl2N0MBpHNSOY=;
        b=vpAnOqCQksCdkt9I6nhbAoljCaM4vnlIT/K/FBDE3zIhMVOyXwbN+XZPa/K6fpk3kt
         G7HXPxZTJcCyOvt5rzaiE7Z5trpf3JL7R8REIZWfyUz56X54DlZpIx3cuou1qtCl2AaN
         JjjT70O6/97MGwQIsrBheFC3VfRGckovCkSIItfo3junvnW8SXiKt+64Jx77vHbTCi91
         1epCD6PaPZMlj2XaMqgI+VM0CtkdZKKH+dWfxyvCRaOw9Hy7XLRsLNR49I/Lq6O7NBCR
         rsgmQx1GhD1WvEtLCHeBtb9QW+zxuq6mOa8rk+Qny9p8Eddicz7Sl65TP8MvhUFU/Ne9
         QUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739966905; x=1740571705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfNES95aCHrH5DW7HOssGE1cf0vTi0kl2N0MBpHNSOY=;
        b=tTP134G8tkFlqRPAaDVBSW7Jk0kBeR1wHoFx7x/RGYEKhBBrCgdyTU+JUy0gUjSBP1
         Uq4ZxKs9pZ1LTy7S92oxZIav8qwdn2I3MIk7FJ2npqRdqSd48QMKcXzaE45YlH1WqmZV
         qe3Jf466qG71fvdvuCCpg5yXS0UcsOGwDeypqnPYMQXldClAgwIqU4nxi/JyqlkIPq5H
         e1PFfy03vesf7J11/mCogr5dh9tSGjQRBLkUdtt5uUWb7ukmFi+wiWkh917KUHDXtdIg
         A1Q6qbgufS8mH9md28e9r93vrYM3+k3YHB6abjs9dvogCBIuhFWtyzBuLbZNOx2rb3fx
         MqYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUaux7FhVYTrnZ6eIVG0fn+WaBj5GA2GZwEZMQX1LBHQSKXCxVYTGdV4EdQJhm8CM13Raud8K7VT83Wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXI9IwvQGJQrji0Fr65j4v4DOv6pFCPq1OPApcH0ovOMGcrecM
	rVNgvtz6jlNQJsvAN6YKyB4lkWJt3iS9YpfAmSmWEZxGb6IKPRz31lfop1sGVrk=
X-Gm-Gg: ASbGncv+hzb12u6Zvgt59pTSICefv7ZrJC07KygS/6ajPAIxAkf3FYJDtk/SsVBhoTc
	GhHP1fbyCq3pocunVt9OHdpBoI6VphNgLdD/z/BHyupx0VBNP+VnkVf+vKkNbMpU0U8r9GDb9MU
	8uGG6CQVZpOnYdPFq4TaUkA0wHOzB9NTao8vxbcIv8avNAFX7plnezjRfTdwKOvxzYrDCltnKxT
	tO7lqiI50imczcksoVtoMOmyQ17l3QbYKPHpdXCz71qi4APiLhKsMC4twj6/mBFx4qtaB8sTxyl
	/jDggMtuMZjJ+ZQk20AY6E4zbBiu0rmlyJf+YSqfddmM7yK/IfAYorYydAA80eBQ35c524Y=
X-Google-Smtp-Source: AGHT+IFMLOpDHMHA4h3/Gxx2zV0fjSL0lgJbRphbGzyITSKOMSUgTcKxT5mQ7K/tT3lwL8tk5JoMMA==
X-Received: by 2002:ac2:4e05:0:b0:545:62c:4b29 with SMTP id 2adb3069b0e04-5452fe5bedcmr6706804e87.22.1739966905285;
        Wed, 19 Feb 2025 04:08:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461cfdd5a2sm1148260e87.39.2025.02.19.04.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:08:24 -0800 (PST)
Date: Wed, 19 Feb 2025 14:08:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <eskvhtljnrkhm6vmqy52gkweexj3tcethejeywcoib4la72jcl@ojuqcazpvht4>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
 <2025021922-spongy-swirl-0746@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2025021922-spongy-swirl-0746@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_040827_346774_17093C1A 
X-CRM114-Status: GOOD (  29.36  )
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

On Wed, Feb 19, 2025 at 11:13:14AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 19, 2025 at 11:06:02AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> > > Add helper functions to create a device on the auxiliary bus.
> > > 
> > > This is meant for fairly simple usage of the auxiliary bus, to avoid having
> > > the same code repeated in the different drivers.
> > > 
> > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > >  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/auxiliary_bus.h |  17 +++++++
> > >  2 files changed, 125 insertions(+)
> > > 
> > > diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> > > index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> > > --- a/drivers/base/auxiliary.c
> > > +++ b/drivers/base/auxiliary.c
> > > @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
> > >  }
> > >  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
> > >  
> > > +static void auxiliary_device_release(struct device *dev)
> > > +{
> > > +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> > > +
> > > +	kfree(auxdev);
> > > +}
> > > +
> > > +/**
> > > + * auxiliary_device_create - create a device on the auxiliary bus
> > > + * @dev: parent device
> > > + * @modname: module name used to create the auxiliary driver name.
> > > + * @devname: auxiliary bus device name
> > > + * @platform_data: auxiliary bus device platform data
> > > + * @id: auxiliary bus device id
> > > + *
> > > + * Helper to create an auxiliary bus device.
> > > + * The device created matches driver 'modname.devname' on the auxiliary bus.
> > > + */
> > > +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> > > +						 const char *modname,
> > > +						 const char *devname,
> > > +						 void *platform_data,
> > > +						 int id)
> > > +{
> > > +	struct auxiliary_device *auxdev;
> > > +	int ret;
> > > +
> > > +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> > > +	if (!auxdev)
> > > +		return NULL;
> > > +
> > > +	auxdev->id = id;
> > > +	auxdev->name = devname;
> > > +	auxdev->dev.parent = dev;
> > > +	auxdev->dev.platform_data = platform_data;
> > > +	auxdev->dev.release = auxiliary_device_release;
> > > +	device_set_of_node_from_dev(&auxdev->dev, dev);
> > > +
> > > +	ret = auxiliary_device_init(auxdev);
> > > +	if (ret) {
> > > +		kfree(auxdev);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	ret = __auxiliary_device_add(auxdev, modname);
> > > +	if (ret) {
> > 
> > This loses possible error return values from __auxiliary_device_add().
> 
> Why does that really matter?

At the very least the caller (or caller of a caller) can call
dev_err_probe() or dev_err("%pe"). With the current implementation as
everybody maps NULL to -ENOMEM the error message will be cryptic.

Or just having a cryptic value in the logs.

> > I'd suggest to return ERR_PTR(ret) here and in the
> > auxiliary_device_init() chunks and ERR_PTR(-ENOMEM) in case of kzalloc()
> > failure.
> 
> Will the caller do something different based on the error value here?
> All we care is that this worked or not, the specific error isn't going
> to matter for device creation like this.

The caller might not, the developer might.

-- 
With best wishes
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
