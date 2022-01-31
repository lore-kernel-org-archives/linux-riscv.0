Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD4AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3dz1aFxD/zLAy0kXBJGp8Um/seVu67OCYuHyw8SNU0=; b=BcUpUGz/uJ5wh6
	gExrCQTXO11HqKCzPGIklxuSBJ923EXDLcoYgW/vlmfcRZX+ay5q/TqSNxCIsBUY2Yjg/+E7ezrtt
	C/yDY4Wm/O2tkt40RV5oH4/0DFy7HrWMMi6rP8rHVw+/bYbbKBi3YE2H/m5b+WJeETGSP1MnUZ0Od
	JIVH4SNNtifOdNFy9IO0/q0ApmRqM3FUP5BETZ+GBGVkHbBrNugzj+dTjDzqU3566UkEY/I2XarEp
	4T2TPKyiQSxaFJD0n38+75s5/9tj1AYJA7ZgRuWTZa7HS5Kj5j9pmB3GnMHxOJZdVjJ5KeLq++1It
	odi6sD+rIS/I48E1yDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWsH-009V05-VF; Mon, 31 Jan 2022 13:37:42 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWsE-009UyY-2S
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 13:37:39 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso12973524ott.7
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 05:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=hmPqqMH89APxATVRducOHUhrVsYSdhK58FU8hjuJFYU=;
 b=AebvMJYzJAu78RvFsTXkfaW+eF3b+Fs6cJKACqScQkwk3yeP5asgZAEVIFySmXmsKe
 AcgLipfvw9Mo+FNFjtBJJoJCAX+pmlNkqi1pa6wkds373OC0qPir+xPHk3kk5vKwun1s
 Ddy5rICvzLuVYyhbEXS2WuvlCijJcPtw+xcvR+0n/HUkaoGbPDJLNQLAaA14u2U4Us8k
 DROuNbmuoXCzyw11hvbMBWySZXulZ4j1EmAvzS3Ahlm/1La8GfjwqkBFAJOq+OmAKUfD
 gno72JT9V4b+JAqfeIo5RE4DeGndkIo5oyt/oOU8FLGuVIYZEc2W7vWk/4O0zIYhAV04
 tMLw==
X-Gm-Message-State: AOAM530EqkwwafvNRkBrbtJyGDm/ViOVMcNY/DsmGxX3XiQLREC7DBip
 ZW3riCmvfvXmx899n/UWFA==
X-Google-Smtp-Source: ABdhPJxRn59r1bJ55L4bUsinNm/Dim5FdPonnilsaHoyZ/qmjUHFKSeP/tTIxH3eXslra7duYbwfsg==
X-Received: by 2002:a9d:eca:: with SMTP id 68mr1879048otj.274.1643636257269;
 Mon, 31 Jan 2022 05:37:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q9sm9487122oif.9.2022.01.31.05.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:37:36 -0800 (PST)
Received: (nullmailer pid 140171 invoked by uid 1000);
 Mon, 31 Jan 2022 13:37:31 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: alexandre.belloni@bootlin.com, geert@linux-m68k.org, heiko@sntech.de,
 paul.walmsley@sifive.com, ivan.griffin@microchip.com,
 linux-pwm@vger.kernel.org, thierry.reding@gmail.com, jassisinghbrar@gmail.com,
 atishp@rivosinc.com, lewis.hanly@microchip.com, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-i2c@vger.kernel.org, robh+dt@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, linux-riscv@lists.infradead.org,
 bin.meng@windriver.com, devicetree@vger.kernel.org,
 daire.mcnamara@microchip.com, lee.jones@linaro.org,
 krzysztof.kozlowski@canonical.com, u.kleine-koenig@pengutronix.de,
 a.zummo@towertech.it, linux-gpio@vger.kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
In-Reply-To: <20220131114726.973690-6-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-6-conor.dooley@microchip.com>
Subject: Re: [PATCH v5 05/12] dt-bindings: gpio: add bindings for microchip
 mpfs gpio
Date: Mon, 31 Jan 2022 07:37:31 -0600
Message-Id: <1643636251.114216.140170.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_053738_138777_C239D4CF 
X-CRM114-Status: GOOD (  12.57  )
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

On Mon, 31 Jan 2022 11:47:20 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
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
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1586677

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
