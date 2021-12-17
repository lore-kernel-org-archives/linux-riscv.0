Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B5AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 14:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLcfaqc3l8nLJhHGMRlyii1bbrfnAWbo35Au6RvfFK0=; b=xgbX2m4E4PQJiX
	JV651hWr7YvM97kRma/YG7mki5Cexfo4yYdd4+2mXju4YAMaOwj8yq8QMxmg5yPyC2YdWgAY1IcD+
	ICVZ2NFtFAbdppBJP4TYQ2k8nEW1FCVnaGfON+E/H3qEA4A99QA7kLpjkEVDweCxMpHKU+X11TqHt
	cTI/hFFSRi261PFSrl8pTkrk25kocb1qR5dEGmoYy/+S+2ALhbCLcOMDTpxVVGq3WR7NGy5r7zQDZ
	niiX2wvLB9ELYhNEicz9j36qxtb98RN9HezyWzqcPDqhkwJqmyA+23UMbc6VWF6TkqKAUKmUJV7Sd
	ROUOiVAGQBbEDB6ROn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myE81-00AbqH-EK; Fri, 17 Dec 2021 14:22:33 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myE6x-00AbNW-Sk
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 14:21:29 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 w15-20020a4a354f000000b002d85ef0533dso741370oog.7
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 06:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=0CTYbf7WcVEIWf1SfUbbnMgBSJ0VdANxQxhVm4uvlY0=;
 b=JCkBpf4eblA67ybKwlHMsAyRoNDtGnHano3KGTjfD3QE1q1XHspnyv7wlliDF7ZboZ
 zcLJxGULRPL2fajyl0SLc2zqzEA0qlISC03j5xiAXrGGfL8efwj7C1eDsqjJwSVuoRrU
 ttDYMqTU3Jrjyw9Br5p6LwMyl8fhN5PGBF/8nqEwR5mcKK5TUhMjLWE0H1AdIYEcIuTq
 0YJhJdrpWdN5ebrEERXUI0A7z+qu2BtGt+SumF1dGhVzogNLiQ6NKSxKey07xdqvMbj9
 CuXa2c5dev1nvsxz0YcAX82n/j9ccQ/iqBx4m2w/a96QsRqLYTwDd3fZkteY0pNTum5B
 U9nQ==
X-Gm-Message-State: AOAM5329B2+GDXgW4aty1ET4Hkzu0I3covexF4THvKvCTlc1IqqB+OJA
 MDRNrBkecTfBEmAQU86nZQ==
X-Google-Smtp-Source: ABdhPJzHsnbteoaUGagiqRaGKtjBFUvSNvdOeJ9ZS+0MxZiGB8nLr3d7uklhHQ1qehLtgxHiZ+WF0A==
X-Received: by 2002:a4a:af02:: with SMTP id w2mr2118116oon.7.1639750887258;
 Fri, 17 Dec 2021 06:21:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k4sm1581026oij.54.2021.12.17.06.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 06:21:26 -0800 (PST)
Received: (nullmailer pid 2814887 invoked by uid 1000);
 Fri, 17 Dec 2021 14:21:22 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: broonie@kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, alexandre.belloni@bootlin.com,
 aou@eecs.berkeley.edu, linux-i2c@vger.kernel.org, ivan.griffin@microchip.com,
 a.zummo@towertech.it, lee.jones@linaro.org, bgolaszewski@baylibre.com,
 linus.walleij@linaro.org, heiko@sntech.de, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, paul.walmsley@sifive.com,
 lewis.hanly@microchip.com, linux-crypto@vger.kernel.org, atish.patra@wdc.com,
 robh+dt@kernel.org, bin.meng@windriver.com, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org,
 jassisinghbrar@gmail.com, krzysztof.kozlowski@canonical.com,
 geert@linux-m68k.org, devicetree@vger.kernel.org, daire.mcnamara@microchip.com
In-Reply-To: <20211217093325.30612-11-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-11-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip
 mpfs spi
Date: Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.686168.2814886.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_062127_975472_22E34B6F 
X-CRM114-Status: GOOD (  11.84  )
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

On Fri, 17 Dec 2021 09:33:18 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the {q,}spi controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/microchip,mpfs-spi.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1569843

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
