Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F7CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1j6C1qVbCaUWd1PD7PaFA9RAeWGcQL7+30fsr4SCZc=; b=EA25NlsyIRewu5
	UWRmhjSa1bzrecjYgKkItT8a2nqI2SYt1HorRJnJybRxAQUSVdrKg3B8sOsqNQ9W4rdH8pbtdjFw7
	66FTZKf9jgrNuYRZeFHUsv2EZYxPbJmh7F6UuEzGKAWml1nls8+v19qvF3eRb+WX2i8TCPhtHwOvi
	NatQOUzy900AJJvsavvrAxmxuSmDYooXFC3gXALSd9/YvnOQt+UZExmKoeQQ3ijVJqEBwLmuaMyLU
	Ufo2kEUm+IkEg/yRXQRS2CZ9EAT9+s80AJscVP392JBrkyqMUQazavQnuIn62X1+5uIH3ZMDzfxq0
	y8bNCzg8qQ5RfvooLQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myE8j-00AcJD-As; Fri, 17 Dec 2021 14:23:17 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myE79-00AbTB-B1
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 14:21:40 +0000
Received: by mail-oi1-f181.google.com with SMTP id bj13so3810803oib.4
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 06:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=9o4EOmq+ROwfzC6UvQVhsNjTkGdilWZSOYUxWW+IJhU=;
 b=hXSYMD3mJf5H1/rJDG3MIWUBtHsrYO3x3yRAAxykSGfFv3NmgUrBKGa19u14jIGjlk
 T9STdoCiPf8SDFPYICFMFVJW+YxI8bo/x0q7z9MZh5u2UP+HXVkPucjyojLZaXpPvZ8b
 ChTfjucOFu+GX+ODvgYacOLDHusqDesMLPgAgtpvpqjBi1RhRmCvVV/cJSl6E6M8o6KQ
 edyl5JyP/2Tp/4HPQHIh06FUNZHQpqmjZm/XBCG7C9fat3YEr3SMwVn+J/smUHatouMn
 9vBzzwPy/7Fgd82lqJxmxRNoJ9Kde9l8sEQLtU4WrrnKAwzThCZoaXWS2W+xF5BHxKKn
 xS8Q==
X-Gm-Message-State: AOAM5322X3VYypqWVWHn3C89WlE1zLeC6Ck7MWD3asd0q/zg6rndGPph
 WA4TME7XeGzZENqgYV1/Yg==
X-Google-Smtp-Source: ABdhPJwd27y64wtW+mXglGkwTczy+y8F0FV0caGHNfX0/bkBe8x1ZLiaYabb22tee0bgLK+EssyWUw==
X-Received: by 2002:aca:44c5:: with SMTP id r188mr8352516oia.177.1639750898331; 
 Fri, 17 Dec 2021 06:21:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d6sm1597483otb.4.2021.12.17.06.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 06:21:37 -0800 (PST)
Received: (nullmailer pid 2814885 invoked by uid 1000);
 Fri, 17 Dec 2021 14:21:22 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: jassisinghbrar@gmail.com, devicetree@vger.kernel.org,
 bgolaszewski@baylibre.com, palmer@dabbelt.com, linux-crypto@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linus.walleij@linaro.org,
 linux-rtc@vger.kernel.org, lee.jones@linaro.org, bin.meng@windriver.com,
 robh+dt@kernel.org, geert@linux-m68k.org, gregkh@linuxfoundation.org,
 paul.walmsley@sifive.com, alexandre.belloni@bootlin.com, broonie@kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, aou@eecs.berkeley.edu, heiko@sntech.de,
 ivan.griffin@microchip.com, thierry.reding@gmail.com,
 linux-gpio@vger.kernel.org, daire.mcnamara@microchip.com, atish.patra@wdc.com,
 linux-i2c@vger.kernel.org, a.zummo@towertech.it, linux-spi@vger.kernel.org,
 lewis.hanly@microchip.com, linux-riscv@lists.infradead.org,
 krzysztof.kozlowski@canonical.com
In-Reply-To: <20211217093325.30612-10-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-10-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 09/17] dt-bindings: gpio: add bindings for microchip
 mpfs gpio
Date: Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.674842.2814884.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_062139_414669_24339003 
X-CRM114-Status: GOOD (  11.55  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 17 Dec 2021 09:33:17 +0000, conor.dooley@microchip.com wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1569834

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
