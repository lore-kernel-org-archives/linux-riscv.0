Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F3EC47095
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 08:25:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 642AB2078E
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 08:25:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y0rEu48r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHporHfA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 642AB2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sE97hdRUw2hVttWAplrU30iBuMLR745cPL2D2YaFb2Y=; b=y0rEu48rwXHZpLQYvAn7pUDxZ
	TB+ddj9CnfemQYNBZKNHTI8t0iF7y0MJJyrpR2hH4ANN1C0KA0LfqppzZyLeVnmilJrH7Nx+FcFbP
	CSQC2UHab/ozBNKqftwlk9Xy8CzwOggocdjp010iBh3GsTFNGxZBDTcsh1BjaFvLzcP5HmAW//zlk
	68XRSegfRmU83yoj+UyTZGyJsImr1KyaoJN4nRK/R/ZFK1DWhLryVL72E71h3QHV/pR1//9Bi7eD2
	OZ19HPLMK923eJwY8WZ5EkYwZkuyNLnEgnHGrW1OcxOxQwDsCB9+A2HG1SCrFelYxq0CCLGPRvG9P
	Qi55TLDvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPiHc-0007eA-Dd; Tue, 06 Oct 2020 08:25:16 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPiHX-0007c5-72
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 08:25:12 +0000
Received: by mail-wr1-x443.google.com with SMTP id t9so3773344wrq.11
 for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2020 01:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YdhpNKlTW8M5AEVFobND3IcWnRcYsnTU1ylxUOoxLOQ=;
 b=qHporHfANLglN4o1QtjGAQRWNnN7asjRL3cjazvXjsHh09RfWeLWPhNLVvwSLhWTRD
 dq9W25RBebcUYOBXWtFq8Xg4Jpr5iwt1eXNmqsekvon7Xl48K0UpprSPFSz88KD7f3X5
 mVcgrKZ1Q+07rFYOZ6TaIw9SiDE9zLlxqZ10OzeIv3M1P2sRohlLAogcHVmvgwhtbxWh
 aDv0+4vxSuOdMGAP1BZwP0BlcnNmUE37U3q6XBhiOW2IywzQSNU0oPIf35dwBbDiZGem
 YyfEcoZuw1vq+eSTNb3BPCippk6TyfUXDjeg7Imo0qPxxzlaz4AKfZHvUV+rJldsOuzH
 6yMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YdhpNKlTW8M5AEVFobND3IcWnRcYsnTU1ylxUOoxLOQ=;
 b=B1G3LIsbSnidZcgZQuhW2Fr1bjAmH525HDR5IvJ32VX5Yg1JHpCRyh1EyDPecmJaS9
 mDqkHYqXSjSDokS6UGsR3tMmQlNw0gW6kF90ouYpK8AgQLdWSbZkCYFua5Y7Kst8h1I6
 pXljF3GyMGLLfmug+bJvOXMV0NwQ2ivWJmQHuQspghHt6aOVewy5V5tYRK66axmkyLSe
 E61/nQ5j46w3G8J3+IgJHDjnKPfqSvsWqZMts5D/xEA06tDe9ZO8EVsE/gxYK3w+keNp
 URPEDWm7BCLONQ+61/Fp89b/5s8wvxh3oLIVufD9Gk/pz/uzn4Zgp+QW9YQ9uInBh3Mu
 +p1g==
X-Gm-Message-State: AOAM5331xtkQDIbf2KpxGomHp7WOyofcRfXJRYnIL1cPg2KNtvt1GY5f
 DFuWwPD8uRXS3IQp89MkEkjKgw==
X-Google-Smtp-Source: ABdhPJxsjuEumsaEtaU67N9vbg2cBftfsc/wZW21wnFzsv2BjeMFHC1JmQFLaFRJtrvHxARri2Z8Zg==
X-Received: by 2002:a5d:6409:: with SMTP id z9mr120080wru.391.1601972710164;
 Tue, 06 Oct 2020 01:25:10 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y11sm3353486wrs.16.2020.10.06.01.25.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Oct 2020 01:25:09 -0700 (PDT)
Subject: Re: [PATCH 0/4] dt-bindings: additional/unevaluatedProperties
 clean-ups
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20201005183830.486085-1-robh@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d04c47dd-6e37-a7ac-f3c4-d6e6c308dbcd@linaro.org>
Date: Tue, 6 Oct 2020 09:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-1-robh@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_042511_368001_A87E0F3B 
X-CRM114-Status: GOOD (  18.66  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-rtc@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 05/10/2020 19:38, Rob Herring wrote:
> The default behavior for json-schema is any unknown property is allowed.
> T
> 
> hat is generally not the behavior we want for DT. In order to disallow
> extra properties, schemas need to define 'additionalProperties: false'
> typically. Ideally, we'd just add that automatically with the tools, but
> there are some exceptions so only making things explicit everywhere
> really works. Missing 'additionalProperties' or 'unevaluatedProperties'
> has been a constant source of review comments, so a meta-schema check is
> really needed here.
> 
>   Documentation/devicetree/bindings/nvmem/nvmem.yaml     |  2 ++
>   .../devicetree/bindings/nvmem/qcom,qfprom.yaml         |  2 ++

for nvmem parts,

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


thanks,
--srini

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
