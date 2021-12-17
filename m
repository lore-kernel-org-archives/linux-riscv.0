Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DC9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 14:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWwKFZPn7Z6gQhmBdiAS1P0Aq3xs/wbvZlNBGCHxtFs=; b=jGsxxCWEjDcjwd
	hDAYCrIYwo3dME+HGZvwvFEHGkma4LngYpEgQw+mBSsFN5bgHOEVYg46LrP1rSLVvL0YhBokhRlJo
	C2LcU/Ay209uQzd93AowSvdov55dXG6aZNXtAPgc7a5nIfjmfy3+gDEqqSErJp45Nh6uOrJPWO8fo
	YWe55QXahFwL5d96lAQCY50gLlDNyJhV9vJifbVRQa5SAifYK3C6Ew+a1zqLtgkncrc60mIes7YUi
	ETbIrWCJGZmx3L85bA29AijC1JlUvSghXY73Sfo8MTqJSmoRI0jJrBUQ92Ojf4ZQrNnE2g+y9MlNw
	LylVM72dJLd2KURCZV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myE8c-00AcDS-0I; Fri, 17 Dec 2021 14:23:10 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myE77-00AbS0-40
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 14:21:38 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 d1-20020a4a3c01000000b002c2612c8e1eso746053ooa.6
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 06:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=4EKb7W0mJkyH6TbJycp3IxpudXweTd3JUfvQdZFmwmM=;
 b=eD5J7Ne6z3TpvDjsheN4XBmlmnTdW2LkWdSnJ6ISPcP8gZvp/fZ69Qyd37shHAgUtN
 Dy6lQiK0XjlZwaQRut4x5u9T7yvHtHH/IhKFiOaM39FBFzjmZ0tta1IeZatQM/YapJmX
 QnXJInnFvoiiSPq8htw1ICnrfGbm4UFAlQ0IEArWyKw7Dr0zeHX0uGV3PGLy7EZikA/n
 2NoNLPmqUN/5ku8cE3xwz4Ff7/QvNK0XPa/XcMarEhVPzWLPx5ZofmVnr6ihymYRuMDW
 T9s9M+rQizAoxd3jNebOfxieafGEkLz2HGs8RPd3O4GfV4JM7UJwCsdZyE1GKEA6D9vh
 x3Gw==
X-Gm-Message-State: AOAM532i0WLEzHYba3OXRB4FgGcaabK5nyqitoZZoO+F8s5QYAm8A+dj
 vVv+3nY+8Ego54e4xZFuiQ==
X-Google-Smtp-Source: ABdhPJzgcnuBgZHVkCNHyzmmA8V24n9OttHKJ4rBUqvjr5sf9o12yxKJgaDITOHdTCNJKuDFYJXSWA==
X-Received: by 2002:a4a:41c3:: with SMTP id x186mr2069310ooa.76.1639750896096; 
 Fri, 17 Dec 2021 06:21:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a12sm1607447otk.35.2021.12.17.06.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 06:21:35 -0800 (PST)
Received: (nullmailer pid 2814883 invoked by uid 1000);
 Fri, 17 Dec 2021 14:21:22 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 lee.jones@linaro.org, linux-i2c@vger.kernel.org, robh+dt@kernel.org,
 linux-usb@vger.kernel.org, atish.patra@wdc.com, thierry.reding@gmail.com,
 devicetree@vger.kernel.org, bin.meng@windriver.com, a.zummo@towertech.it,
 linus.walleij@linaro.org, ivan.griffin@microchip.com, heiko@sntech.de,
 linux-spi@vger.kernel.org, geert@linux-m68k.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexandre.belloni@bootlin.com,
 daire.mcnamara@microchip.com, linux-kernel@vger.kernel.org,
 lewis.hanly@microchip.com, linux-rtc@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, broonie@kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 jassisinghbrar@gmail.com, bgolaszewski@baylibre.com,
 gregkh@linuxfoundation.org, u.kleine-koenig@pengutronix.de
In-Reply-To: <20211217093325.30612-8-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-8-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 07/17] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Date: Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.663579.2814882.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_062137_201016_14640B2E 
X-CRM114-Status: GOOD (  11.96  )
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

On Fri, 17 Dec 2021 09:33:15 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1569828

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
