Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2C2C4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jan 2022 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTYRt7Qx7NNRVIEHhvFuIIGKeXq/wE2xWhxJkwCVlHc=; b=1nLTMTCfykt6qF
	/ri0zp60cJJ10Vk+4w6ckejhP7y3vE+DYnqYbyqT440M+OTxxN7ktrXw9GfRZWJ/4rS7qPHnHX6v0
	u0Vtgnnr3ClmJ79BdgRq2GrR0KlhCwLXR6LJgRugFpMuSQkvK9vJgml4YbGclZa1Lt5ypWYx4qGfR
	Zb6Pr8GVU41pBBBo2XjwrLR5eT2rVg8FWING3TPzPvAqz9D7XGKGoIbFTgkSRVTpjpUMGz9drqLV0
	f+j2TeaCnrqBCtNtugiNUXXtHrNBmY4KDg6FgQ26OmBlqEey6CU3RRBpKD+PH/Yip9TAIE2MhSxPx
	2GepvvdsSpgtFMFb+0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8mlF-00BOnP-Sv; Sat, 15 Jan 2022 17:22:41 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8mlB-00BOle-GX
 for linux-riscv@lists.infradead.org; Sat, 15 Jan 2022 17:22:38 +0000
Received: by mail-oi1-f179.google.com with SMTP id w188so17017488oib.7
 for <linux-riscv@lists.infradead.org>; Sat, 15 Jan 2022 09:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=1Tt+rbrf5r83N/U3je/yYA3NoWM2IQlvftFWp2MMPP8=;
 b=hcGn6M4yMSS6GyiJL5RVWjAklab1Qm7qpFYPgpgcXUdqwAzJJGg23wiFbdkzAEYfka
 AJNLUQC7GD/thdZzhd5g0jZicVYFRhBk9fnSoQ3sCxgNul4d3mOx8dqPCUFJA/RtOk/u
 W9u9gf7x/Nj3KTqnzPC1v8WCUNrnxhRkBPjU1kPz+LS+ZqTB5oZaepY1kA0EtokYyrxn
 L/a2ukbtn6GmwYCb0wD9oGwK3EeYO1sBx4z93+FVYJcC9KIpEjzFHuumlk9IcvOiYZEh
 R8B/Yor+eXnFOSsAEj0PrKnPWkjN2sQHlhYsmeoxZKXl+kbJKpKZEHTzdLDWK4S76FM6
 OVHg==
X-Gm-Message-State: AOAM533MOjY80hm99ItN7heZlXsqTuvzX6OiFJEx2hU+e/PIGdTT9p2b
 woql0zjD9eJosDBZjICO9g==
X-Google-Smtp-Source: ABdhPJzScKDdEHoku6BgCOg51JV5Qp70zhivDJmOaquTVFJUGaqdX+T9lu4RlZmPt57uFEQgZhQ97w==
X-Received: by 2002:a05:6808:45:: with SMTP id
 v5mr15888461oic.58.1642267355453; 
 Sat, 15 Jan 2022 09:22:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q145sm3392410ooq.31.2022.01.15.09.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 09:22:34 -0800 (PST)
Received: (nullmailer pid 119888 invoked by uid 1000);
 Sat, 15 Jan 2022 17:22:30 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: aou@eecs.berkeley.edu, paul.walmsley@sifive.com, linux-spi@vger.kernel.org,
 linux-crypto@vger.kernel.org, jassisinghbrar@gmail.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ivan.griffin@microchip.com, thierry.reding@gmail.com,
 gregkh@linuxfoundation.org, heiko@sntech.de, robh+dt@kernel.org,
 alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 linux-i2c@vger.kernel.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, broonie@kernel.org, linus.walleij@linaro.org,
 lee.jones@linaro.org, linux-usb@vger.kernel.org, geert@linux-m68k.org,
 atishp@rivosinc.com, krzysztof.kozlowski@canonical.com,
 linux-gpio@vger.kernel.org, bin.meng@windriver.com, bgolaszewski@baylibre.com,
 u.kleine-koenig@pengutronix.de, a.zummo@towertech.it
In-Reply-To: <20220114151727.2319915-8-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-8-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 07/15] dt-bindings: spi: add bindings for microchip
 mpfs spi
Date: Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.923323.119887.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_092237_571424_5C021C85 
X-CRM114-Status: GOOD (  11.76  )
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

On Fri, 14 Jan 2022 15:17:19 +0000, conor.dooley@microchip.com wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580121

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
