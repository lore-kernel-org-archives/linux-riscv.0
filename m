Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB5FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 03:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAqCULsqkxNvUBc4BDg+1dKHYN2gULMZjuIDF6InV94=; b=J64+vAjN+Np9B2
	sOexXb+hVY60a+9gAZjet6v+YLZPlFCr7KtxekNJx/cVE4jLTSbd9f2BsENIGNFyTVt/DPo+djwF1
	UxrIczrGVKAJ7M/p2F6LqRLnNEQsllSOOrCGqgjvGp7JYErE8lar7BKq55DN0ICMF+OSbK31iRGD1
	Rfl4b0XquPOqs4h9LYe4my/GbQY81EhfLASXAT6Tt7aAe05jb3VxvURcAHQPUI8cQXYVSg3LHBHxn
	NcgB3fo7k0KKKfWBQ1G7MNkkZXD4qB8IGUojhn+Jqkngk+JgS8CzdPVHe6L9fPVsVGEtfy/CQT7C3
	DjZ2DnUmPZf8ofX3XBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA1PN-003etY-1i; Wed, 19 Jan 2022 03:13:13 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA1PK-003esk-WE
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 03:13:12 +0000
Received: by mail-oi1-f181.google.com with SMTP id x193so2141988oix.0
 for <linux-riscv@lists.infradead.org>; Tue, 18 Jan 2022 19:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZRPgofTjL/2uMaGwaTyzFgCzOnb2/xkop7RDJkHpRPI=;
 b=JsLL7rY7/tqQAzGA94s9kbnxCxGMLPj5VmxLxz45pNF7s7fwrHSPM2JmlrknAqCWAg
 DMNz5vjn9gPJfCfP5v4hBdN8Gh6R22cgcV30lQjUzRQv17ZpdaOR2aGabb/TlP/6q/37
 kACsSK1tgNwbHe30yqnBLtsmaFy/1bAFEyH9VJBg7hXMtmQe/hwWBHzKmadNHxaQ8S1N
 HJ0HGg7XPBjVvcTwxkV8KJf70xLIqr9TUpys0s8MUL5yiVgZ7clcbawH7JhSGNlN5ZL6
 3XQ7rA7FehDKwIWvu7mcf2kwOQ/bbYTYFHHZaC6IzAsjvSrJNJLIPLNfvBvFOd0YhaFQ
 FMMQ==
X-Gm-Message-State: AOAM531gatyNKH757NqKeqfnHHN9T7I4xIjSjX2YZp5BwO6rBuDyeTyo
 35PfbdoW5owdqXr+/9XNow==
X-Google-Smtp-Source: ABdhPJwOckFgCRnXSA+wugL4msEIdXhoYLAu8vr/C1aTeltHAEZdWofuYihNKuItI980wdKU2RqpZw==
X-Received: by 2002:aca:eb52:: with SMTP id j79mr1341475oih.150.1642561990044; 
 Tue, 18 Jan 2022 19:13:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q5sm9905090oiv.2.2022.01.18.19.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 19:13:09 -0800 (PST)
Received: (nullmailer pid 2567843 invoked by uid 1000);
 Wed, 19 Jan 2022 03:13:07 -0000
Date: Tue, 18 Jan 2022 21:13:07 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: atishp@rivosinc.com, robh+dt@kernel.org, lee.jones@linaro.org,
 bin.meng@windriver.com, bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, u.kleine-koenig@pengutronix.de,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 linux-gpio@vger.kernel.org, gregkh@linuxfoundation.org, aou@eecs.berkeley.edu,
 linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
 paul.walmsley@sifive.com, geert@linux-m68k.org, a.zummo@towertech.it,
 linux-rtc@vger.kernel.org, jassisinghbrar@gmail.com,
 ivan.griffin@microchip.com, lewis.hanly@microchip.com, broonie@kernel.org,
 krzysztof.kozlowski@canonical.com, heiko@sntech.de,
 daire.mcnamara@microchip.com, linux-pwm@vger.kernel.org,
 linux-usb@vger.kernel.org, linus.walleij@linaro.org,
 alexandre.belloni@bootlin.com, linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 06/14] dt-bindings: spi: add bindings for microchip
 mpfs spi
Message-ID: <YeeBw05yCtJDe3G2@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-7-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-7-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_191311_061712_C69A3F8F 
X-CRM114-Status: UNSURE (   9.53  )
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

On Mon, 17 Jan 2022 11:07:47 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the {q,}spi controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/microchip,mpfs-spi.yaml      | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
