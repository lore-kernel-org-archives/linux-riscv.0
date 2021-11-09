Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05ACBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 04:06:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEF3C61130
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 04:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEF3C61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HeJqK2mZlLaLABcz72VLks1uBhyVKF07UzooVUGn2dw=; b=lNbqFmICOWHixm
	AcAc+k37n6zFU9z42bIJYRT7MVbo32x2VDPaWJObPCDNJMMAOtPUPWb8iMfyzxhLjubLT7JB5e2u3
	0Nm1++fe2VzgVM3g3T0cqKHTZjzbaykN4cUN5qt15rdna4gT3TWJhcG3WzrOcQKXHciLSy4vLEPAR
	I9Gy1XzLJXbIzxd1t9h6MvijZocPtx475B2YZuSly2NWOvj/6GDI4Z8Q6cZVWl9nqhG3jE+3oAT2g
	BbJulY+JFngiGmqQK9zxvlYGMm/51CcGcepnFHctn33GBMQOEVRcedaZjsxOhPyeZ1G1u5akpTMK/
	gY1CI9KZTY5eMBgBF1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkIPG-000dhj-Ay; Tue, 09 Nov 2021 04:06:46 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkIP9-000de6-Px
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 04:06:42 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so593183otl.3
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 20:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=sKmNlZSZoAElUfGTKNnaMRLkfv9QOdA2lm06+/ZjStw=;
 b=imsN23YRw7+xwSI2hV6GAJVMh43g2FbsQc2q/kcouat7yInl/pzeT7nDpjXbZMDPPC
 kJoLnm5roeN16FAFAxconBAbrTaOnBRqk4AL/unUI4CMjROHbuJXIgD/b+PkhCP6iD9C
 RA+3sARuLrwLSx1SLbCh4eks17HGHZGRAWA9QZKeHZbcIYdnNzazUCLTv42Nm1JATOx2
 oeMWQPrGP4X2G+/eyLIsTIXXefzg3GcAvAIFwkdedV139a6/sBElcQFfvUNPqUkNAdYr
 jgQWAAng8fmquQ7Zzxhzit7fRQtIFW6oMcW+wSo37t7Tl6eIphmtGLlXYgc6N3TZWEEN
 twlA==
X-Gm-Message-State: AOAM533Cx2G8BnHOhDS+6PHqsO/N3Gt539t2ofPbqeZ7rMz17Ol5N7En
 gd2FtWsKHUFfCYMZVmo5rg==
X-Google-Smtp-Source: ABdhPJzGMR43jH1r8YoLKO/8WbqHBDKP5KH+Ll0UQu7GMVsnGMEYVBXzIyfexWPbGzgJb90Jc9Q4Fw==
X-Received: by 2002:a05:6830:1314:: with SMTP id
 p20mr3292768otq.381.1636430793961; 
 Mon, 08 Nov 2021 20:06:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p133sm6807792oia.11.2021.11.08.20.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 20:06:33 -0800 (PST)
Received: (nullmailer pid 743041 invoked by uid 1000);
 Tue, 09 Nov 2021 04:06:29 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 robh+dt@kernel.org, a.zummo@towertech.it, palmer@dabbelt.com,
 paul.walmsley@sifive.com, jassisinghbrar@gmail.com, bgolaszewski@baylibre.com,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, broonie@kernel.org, ivan.griffin@microchip.com,
 alexandre.belloni@bootlin.com, geert@linux-m68k.org, lewis.hanly@microchip.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 atish.patra@wdc.com, linux-usb@vger.kernel.org, bin.meng@windriver.com,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 daire.mcnamara@microchip.com, linux-spi@vger.kernel.org
In-Reply-To: <20211108150554.4457-10-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-10-conor.dooley@microchip.com>
Subject: Re: [PATCH 09/13] dt-bindings: gpio: add bindings for microchip mpfs
 gpio
Date: Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.924306.743040.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_200639_877899_5CB472BE 
X-CRM114-Status: GOOD (  12.39  )
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

On Mon, 08 Nov 2021 15:05:50 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml    | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
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
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552384

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
