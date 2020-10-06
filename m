Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC90C4727E
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 08:23:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C15E12078E
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 08:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i+nL0mzK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zz0oXuy8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C15E12078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r1QxV2k5dlpLDwn1S5gem8Cdk6Z7/ER93mn9p1wD+CY=; b=i+nL0mzKc7PgPmEqBc0SfaKES
	Kf1E0EyyzlqkM+3MVlJcjkbU2irgXDuhCUlta5GgGLN5qA59sQHeNU8A2O6AnYXNdwCTO/ndBZqNR
	ageFc+CujM9xnVD5NlejaZG9DKu2uW5K8cTtmpUTJW8K7jAfUWnufTsXwUXF2GNBztnVi+RQl2VpI
	OVn5/SR5m8L/nsfsgGmQsA9GUBU/tltThZr+UuS1nl9NYg0qPJRBIspeLbGYoj7me0a0loruN3/KJ
	JPr0Aq13/6j22tL9cQPMyL9dEN0FYECQVwAeyCDmUwLffv2/sO8yXR0U8d1mCXA2o7k8ffMEICYR8
	mKpzryWNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPiFQ-0007He-7U; Tue, 06 Oct 2020 08:23:00 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPiFL-0007FR-4o
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 08:22:56 +0000
Received: by mail-wr1-x441.google.com with SMTP id n15so6645678wrq.2
 for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2020 01:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gQZ92N8EMr7LGVwcFgd0mzk1VK6749oG4otqf+GLMOc=;
 b=zz0oXuy8DvLu/oqK9eyLFeY6GHKr0NNTLe+2Dc/x+LalYxQQw6uANkSbT/JLx0kvFw
 JsFeeLTos6PMTBn+7hMGtQhoLWEqq+QuVUSBlZUX0ftSWK1YjyFRCOSMOBqz5D6MKAf1
 trjhFyJHYmtSCLJ5XHzS7cF0NIB/qannWZC+J0hX6vMT6mPQvXUmjZ455nksyYjcFU+P
 Sjl2xSWKvUjPg0CnAC82f7nU5/tWpx/auKHYNX85Ug+b+OjV7o89Jn5KftNigXVWbulQ
 oiixrU7pMYnJfnHsL1qk6QIXkuIzWdHeWBqffLu7TxlUGZ9S3im+iPRnZpD+Am2dPSXN
 L+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQZ92N8EMr7LGVwcFgd0mzk1VK6749oG4otqf+GLMOc=;
 b=NyQSA0KPq/Koq3gWL+A5BScQGCPWPjm0k+XFd8vJgEHOEaPz25j6vfkh4MWfa43Ng6
 cPylm8yHlnEsWW9Ieipl5knFz55UE14WWDcVCZ0LV9wGzhWZOdwS47s6/B9vniFZX2fv
 qqGTZQuV1208xrkHf76IJn2fFdtV6aOtn4bByrwQBHquWRUsJToaO1RavPVnrliyeleO
 n2/qm0GytrlTTbHhGiMAdkE4VAqiZLUQFNK6/bYPUshJH375mUMgUxyEU/DHGxhxU4Ks
 QL6tLGwogljHHeL/PUjoEN8VO93yVILrICcoR7o0I0bCIcN41eTQS/a26HJ7hkh5FF+6
 ASJQ==
X-Gm-Message-State: AOAM531wZ/1l7MOP5pAqKin+qmCCal/7GYJFHp0PdD7tjyMRl0UyaEEr
 4W3WoSjsZZDEO3xGKUNe1vlVfg==
X-Google-Smtp-Source: ABdhPJxneCP/XHEIGTuaYnepMY95XJGJWgT/9+OwKrX8AbsmbSuGbQwcSXMgWa3UoshUsl19yJaa5g==
X-Received: by 2002:adf:fa52:: with SMTP id y18mr3564855wrr.264.1601972572464; 
 Tue, 06 Oct 2020 01:22:52 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id v17sm3056116wrc.23.2020.10.06.01.22.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Oct 2020 01:22:51 -0700 (PDT)
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9d2a9da4-d28d-dcf0-2b43-66e28b6b8dec@linaro.org>
Date: Tue, 6 Oct 2020 09:22:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_042255_385605_F956B000 
X-CRM114-Status: GOOD (  17.36  )
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
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
> 
> Signed-off-by: Rob Herring<robh@kernel.org>
> 
>   Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml  | 2 ++
>   Documentation/devicetree/bindings/nvmem/nvmem.yaml           | 2 ++

for nvmem parts,

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

thanks,
srini

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
