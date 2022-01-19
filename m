Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429E8C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 03:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYuwwZhSEmEvJ9R93RKq9jnZMYpJpvdXQ7q/Mq9fbRA=; b=GbTrGeJW7HrkbH
	c2ga/M0Kvg/+xT7rViJg9BOVWMn94jOaUM5lzZOYt2QtDe11ArdIu95/suoDUZ51zH83xG3VtgwWj
	57lcEer6LnrO4sA05B1TVPOHP0X232vpmy84FVkOT7KsHZGQRmevdM++vaHFEYqslIq9BJ+aGRNdN
	46jT3xCavF2s+NcHMyD0cPMM7tWoeyeV8UlgXQOqPh5aeVGTbhLqj6UyNMOHEawzj2IEhbOUX2Xo5
	8efRe3C9PlNbnWkh2ECLK/Z9c9WCXaS25uKSqucKeQ151C6QtunXu4XYYgIXlNyGkb+qGwgsriMP1
	/UcmT5mv1aqTfm01Jrpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA1P2-003eov-4l; Wed, 19 Jan 2022 03:12:52 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA1P0-003eoU-3F
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 03:12:51 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 i7-20020a9d68c7000000b0059396529af8so1252039oto.4
 for <linux-riscv@lists.infradead.org>; Tue, 18 Jan 2022 19:12:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5gqey38xnzQ/AN6icaaKVGYlCqtKz1/9M6zJm85riEI=;
 b=o4kmd0uECWhqf9jl1clAL/oopGp2fQu6D0CoLiCycyYxIaDev25+fqQj1fwk7hxQlx
 8j91plmXMxeMLx3A3FjmgSUV2zYB7/T2XFmX2+KAZ6bhT04Afpx0bqRsllT6+pyE37Qh
 aTMCY5HJKpqVK81bJk9tDXAB0YoqkFQ4d/G40+bz93DMsB+AJLE/JwuTtEWbIfpX2a7S
 5gLy/1Ftk21dpjPqeJv4QMp1m54yTCkK30yb12gUD4NSlHGPuTY0Hc3hrJ2pJneFXMWh
 Vlzl+93n4rnSyKeT2QVhw99l8FIoJ2D/5ZSiXlt2bOvyUXFZrRPF0nyQjOKRXW3tX3QB
 kqFA==
X-Gm-Message-State: AOAM531WvExUN3rkELjF6gozM1cgMU3SNgTZ6ev2X0KRxynNu5WJLAy7
 yVM6F6GYOL65HKVWbZkUxA==
X-Google-Smtp-Source: ABdhPJxmwOB9i9klU93vugx+vRG9v6l4pFJ4EZu0dVzcyzNM+5q6DVy3tGoLX992X/2vFuKpHlZRuw==
X-Received: by 2002:a9d:6e16:: with SMTP id e22mr17523306otr.259.1642561969166; 
 Tue, 18 Jan 2022 19:12:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y21sm1991619oiv.53.2022.01.18.19.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 19:12:48 -0800 (PST)
Received: (nullmailer pid 2567106 invoked by uid 1000);
 Wed, 19 Jan 2022 03:12:47 -0000
Date: Tue, 18 Jan 2022 21:12:47 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: thierry.reding@gmail.com, palmer@dabbelt.com,
 krzysztof.kozlowski@canonical.com, a.zummo@towertech.it, robh+dt@kernel.org,
 gregkh@linuxfoundation.org, linux-spi@vger.kernel.org,
 linus.walleij@linaro.org, bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
 alexandre.belloni@bootlin.com, heiko@sntech.de, broonie@kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-riscv@lists.infradead.org,
 geert@linux-m68k.org, aou@eecs.berkeley.edu, linux-i2c@vger.kernel.org,
 daire.mcnamara@microchip.com, atishp@rivosinc.com, linux-gpio@vger.kernel.org,
 paul.walmsley@sifive.com, ivan.griffin@microchip.com, bin.meng@windriver.com,
 devicetree@vger.kernel.org, lewis.hanly@microchip.com, lee.jones@linaro.org,
 linux-rtc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 05/14] dt-bindings: gpio: add bindings for microchip
 mpfs gpio
Message-ID: <YeeBr+iNXCQWJxso@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-6-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-6-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_191250_156697_02F5A306 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On Mon, 17 Jan 2022 11:07:46 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml    | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
