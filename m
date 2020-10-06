Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA969C4727F
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 05:42:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74BCF2078A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 05:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J12JnHWx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scAXD8Yu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74BCF2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cbEQOQDNPZ0Ur8CdesHK4m+5R0c/gLSb+dIBQDn9p9o=; b=J12JnHWx/Rj9jri4vy3uX50Ye
	uUczIDlcl2QG8ZxGd4m6tC3qadUtYsM5UR4ZhACY/pxkAWsC8SuKFW9SNO59k1JD/sRMzBeMOWSRI
	Lwn+7yM3iCo68yEBjEwCzGfMSqMqsKTr+CpQNklMed5zLymiV5c7Ar+S/FXQTROALpHWZVs6NQ5rw
	p/oyphT6ICzaQut010rcsULmIWICW+Erokjmr2OUH4k4hjhPS1DVkig19h0Nl0Pqy9BCiTqi9F1Sn
	iCYac61uWxx0tCaXi163yMhzO+vobrCW1WwL6ZbJJe7AVObRJReDSxeg1rsU1WnvnQ3NC6k3tSuZJ
	+WeW1plvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPfkB-0004H5-Bv; Tue, 06 Oct 2020 05:42:35 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPfk8-0004Fh-ND
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 05:42:33 +0000
Received: by mail-pj1-x1044.google.com with SMTP id a1so1080288pjd.1
 for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2020 22:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FYOEybxQ9Y8nUxVZmzLLg+Qyso2tjlpbGNthFRqblLc=;
 b=scAXD8YuBk8j/NF0iYDdCeaAVj2lJqU4ekQ7XmxKGRZD9n7rlAL/7uG23DDE1fcZ56
 zF72mU8P6EdMfXizzEbowAVRT7aqB90B0ZPahldWPyAERYWd6msUiWvIw5u5I68GC10s
 2mfO8dqRM6oWZLB0Q6RNjtouVvMzAMtCqHytHKbKwrjH25Far6tK8oMk2FL/+Ytm6yFo
 ix24Oh/3R7FZgjcOmnnbZhO2Rnj4pwkEjTGIWiz4UAhFCmHcKJq5fJPHDGVhMb52+bja
 GRW+sJiWWq/RfS6N9j6fS0MlegpQS8J4O6R0p/6fHQbNSKo6Dg2SOD+ESIa+qx/GxTp7
 QQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FYOEybxQ9Y8nUxVZmzLLg+Qyso2tjlpbGNthFRqblLc=;
 b=suxyauNskTFmDL/lWzFqTySVvjRGHFdb/xV2oF/Zs7h2YhqeZRPkOHfjm+ffIQi96n
 NYza6pOtIhkeRoiGx8l0N+jl6CEj7Ar2VqAwWxNNBW68cGEHhkew/iSn0gOR292VM/LH
 QsWgUgapYwAf9WH5fsevpjAaAKxF9EeXnP53GZPCEBfS+0wPYrThaUsVnFWrVMV2BI/D
 kHE39EiZXY0D7a7QggBL55MS/YYDShY+mqnMiZt3qfLUTv1TyoeSAxV9VwolMJxCyAda
 yF0CnkYmgmHOy4ZIYqdRuUit1JJjZ2Ln29xd8ZBbFTMVQIfykMkjS8Tiz28Kx2LjFlr6
 MGfw==
X-Gm-Message-State: AOAM532vuNuQ7tjh2AQ4MmI0hq2Hz+IZKQi1Q1os3ag/Yk8iJLIOVu3t
 kunbR+ya4Qci5JTm9Xej75sS/A==
X-Google-Smtp-Source: ABdhPJzo+T1F54fl8q16F3SuWBffglk48PEytQu7/wpxM8oR5iYvbOQGglf6EbVoa0EICQ893qG+lw==
X-Received: by 2002:a17:90b:950:: with SMTP id
 dw16mr2661711pjb.200.1601962950652; 
 Mon, 05 Oct 2020 22:42:30 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id d145sm2005503pfd.136.2020.10.05.22.42.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Oct 2020 22:42:29 -0700 (PDT)
Date: Tue, 6 Oct 2020 11:12:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: Explicitly allow additional properties
 in board/SoC schemas
Message-ID: <20201006054228.ho3ajzfgpiew32ft@vireshk-i7>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-4-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-4-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_014232_772109_8EDBFB52 
X-CRM114-Status: GOOD (  14.66  )
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
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 05-10-20, 13:38, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As the top-level
> board/SoC schemas always have additional properties, add
> 'additionalProperties: true'.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/spear.yaml               | 3 +++

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
