Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728E9C7EE29
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 10:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/w/JJWF7M7jkuTUen2+KOsrMuFRD8myxOnUCrs3vPU=; b=XIfVIchFc0tUQa
	oQ6B25kEil+G5vUgEuOrrPcxKVKxv/853TzLQU46uVLoHOmFR020NrSgCKFoepnGUeL5VZTmmmmoE
	oAfVZUjYQArutRhw+fJUPUawqhFy+ZedIoZ5DEZQxaUl1yfAjkZBMvOtKRA2bMnOepDhDMCGIFPnr
	B1EOPeOrEUe3G7ZiKM+HpjRXnJGxnum//xFnpcwb2/NFmYpdzdua522aHBY9btVPgrOziK3PZJaz+
	VKKsV7Fpi3tPp5xMWWZL5gvr2SkFOl2MGHcScy2OCjIyH5eOVgeqEAaLEzDLcoDFPmd1TEX/geuTU
	AXKTrZ5V9EYR5+maJPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5lBk-00BwyL-1M;
	Sun, 04 Jun 2023 10:42:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5lBg-00Bwuy-2C;
	Sun, 04 Jun 2023 10:42:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7A21601D0;
	Sun,  4 Jun 2023 10:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD6CC433D2;
	Sun,  4 Jun 2023 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685875334;
	bh=va3qiMMY1sl2WXpsRKVN8nbug/kGtcX+nr7kDg+fifg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C5gTqz+dTUiA9sbBaPB31tMjyVI3oYqkqkj2BfNug3oIDBP74S0+yRfRQKdbfY0qo
	 7HsOkcqTP5FMuO1Oz+8EC8PDbAQG1engZywszZHEAVKFThwvZJC5O66BVrdYTuzYO0
	 ELoUGLdFhxxCPUMVHJJeppa8JMIz7WizyiIq50qDqL6thy66qHU0iRgQH4JEArs05j
	 ovb4VdsrJgSL+R/9i9rUBX0AQJYDWWeX0WtrT55oeegE+ocB97PqzhZZeVX+VKgsAh
	 1WEeMQMo+OdtKtSH2Rq//VxGJ4GwbuQXWiBsCUT6lfrYokJtiuIUz9SC0o3JkCMWkt
	 0Az57aggjpb7A==
Date: Sun, 4 Jun 2023 11:42:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Cosmin Tanislav
 <demonsingur@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, ChiaEn
 Wu <chiaen_wu@richtek.com>, Arnd Bergmann <arnd@arndb.de>, Ramona Bolboaca
 <ramona.bolboaca@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 ChiYuan Huang <cy_huang@richtek.com>, Ibrahim Tilki
 <Ibrahim.Tilki@analog.com>, William Breathitt Gray
 <william.gray@linaro.org>, Leonard =?UTF-8?B?R8O2aHJz?=
 <l.goehrs@pengutronix.de>, Haibo Chen <haibo.chen@nxp.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Mike Looijmans <mike.looijmans@topic.nl>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs
 GPADC
Message-ID: <20230604114206.789708a2@jic23-huawei>
In-Reply-To: <ZHoBXxM80aqvLZNt@smile.fi.intel.com>
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
	<20230601223104.1243871-2-bigunclemax@gmail.com>
	<ZHoBXxM80aqvLZNt@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_034216_841522_A3522680 
X-CRM114-Status: GOOD (  15.98  )
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


> > +	if (!wait_for_completion_timeout(&info->completion,
> > +					 msecs_to_jiffies(100))) {  
> 
> Dunno if it's better to have this parameter to be defined with self-explanatory
> name.

Probably a response to my earlier comment.  I'd agree with a good name
but GPADC_TIMEOUT which was the earlier naming is less use than a value
and it's not obvious what that name should be.

A nice datasheet reference would be good to have though.

> 
> > +		ret = -ETIMEDOUT;
> > +		goto err;
> > +	}  
>
> 
> > +	if (num_channels > SUN20I_GPADC_MAX_CHANNELS) {
> > +		dev_err(dev, "num of channel children out of range");
> > +		return -EINVAL;
> > +	}  
> 
> Is it really critical error?

Overflow of registers - so yes. I wondered this on v1 and went digging :)
Now, there are no such devices known, so meh on whether check is useful. 

> 
> ...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
