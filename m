Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B51C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 03:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=555ehNAA7faGe8WN2cyzp0KMob2NNS5xgJUaj3d7ZjY=; b=iDh8kXaPjvmPYm
	bNzDCKl1QvjFD3/2ZJAHUTYuiKx9kmY/73ElWGaIUswUbIWU5D0tEFrg4kYEwan1VxqDl/oMS0R2h
	MCPs9WPTuy3aDkO41/lDZiog0h23DNYBH0ezQ+gIByd2lqGnJYKbvXYlfCoy0yzVN06Gc9xybJwCw
	LQkuSSY6d4CYaAdj+nrCNHmdZmVcvASUMv5/CxHu3/fdr9QeAj/HL2UikbWdCBGwr6sxmvUhlpHXn
	d7Cs0K9PfBf8r3mHTqQFXiznSzOhnuThiGXy96QR/T/8pRPAx8iJHx7inhKwIReALe5ZlAciW3Juq
	lTT02rYzWPL5ZCVCiGkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA1Ps-003f0n-0g; Wed, 19 Jan 2022 03:13:44 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA1Pp-003f01-JB
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 03:13:42 +0000
Received: by mail-oi1-f177.google.com with SMTP id bx18so2025407oib.7
 for <linux-riscv@lists.infradead.org>; Tue, 18 Jan 2022 19:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5ZZFJPHidCQVOJUgXU8NDVDeCWWOb2ixXDJzmOrCI4g=;
 b=J1s/P4OzZsEnN37tHtX5Lh2rfB+uetbvUV7SZCYpB9h3KCdZdgUUqndRn+FK8b9tYp
 URbAV3FuzpGeEl7v4kWcgyajX2XRLFTrwfJ25CE+1aiKj2JJzd4SHC2f4aNrXN6+OV7l
 GqDfbFjDoiAlN3xeDop/4iGjV2+IZiwclncj3OQTJ5IjKRuFAKQr4kWA7EVTa1yK6KeJ
 hk72TU/9VD+wlSUpba6nktWch8uimPeRU2YLc7scb+LmLO6q4m/ALSKdzNZ183UHIi+6
 57pFLa+lRCUnFAg4zewWeLENVxjuudxIrCWn5MVTmB5KYYKhZrpAYAX9ICh8vgOaxT2o
 Fwxw==
X-Gm-Message-State: AOAM53210/zUeXJRPKrTn8GuuGjq2e+kP99+JeCy1uvgT5xXp3kFqfy5
 70lDViLBiwv6azKxFBdDaA==
X-Google-Smtp-Source: ABdhPJy2hTQOyUUWRx/WNPYhoR/ZWBW976YqG168isT8JwwEo4TiwlcPB529jQ2MNsb4Kw0w/NOk9A==
X-Received: by 2002:aca:bd89:: with SMTP id n131mr1334026oif.64.1642562020944; 
 Tue, 18 Jan 2022 19:13:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u27sm7967798oth.18.2022.01.18.19.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 19:13:40 -0800 (PST)
Received: (nullmailer pid 2568888 invoked by uid 1000);
 Wed, 19 Jan 2022 03:13:38 -0000
Date: Tue, 18 Jan 2022 21:13:38 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, broonie@kernel.org, linux-crypto@vger.kernel.org,
 jassisinghbrar@gmail.com, geert@linux-m68k.org, heiko@sntech.de,
 alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
 aou@eecs.berkeley.edu, thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
 lewis.hanly@microchip.com, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, bin.meng@windriver.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 bgolaszewski@baylibre.com, ivan.griffin@microchip.com, a.zummo@towertech.it,
 palmer@dabbelt.com, lee.jones@linaro.org, daire.mcnamara@microchip.com,
 atishp@rivosinc.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, krzysztof.kozlowski@canonical.com,
 gregkh@linuxfoundation.org, paul.walmsley@sifive.com,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 07/14] dt-bindings: usb: add bindings for microchip
 mpfs musb
Message-ID: <YeeB4tI+zhnzoHiA@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-8-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-8-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_191341_654914_0BF620CA 
X-CRM114-Status: UNSURE (   9.83  )
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

On Mon, 17 Jan 2022 11:07:48 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-musb.yaml     | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
