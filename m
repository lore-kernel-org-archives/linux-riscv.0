Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E970BC2BB1D
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jan 2022 17:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BCubUSQx1E39+nD5yVnPbj54BEFdQsCy4maBRGO7gc=; b=LSkFv8ygtSgrAK
	9PBmgvEhUSCY8KQMxWnr43wDxUfxbkDnToks02izmn/5Y4p2Croq54wyJUJz0Z8kK4mEuvnBLbE8q
	J9vwoBV93ID3U/3jCc3d4mkbhchVArnOlTLbCNej26ai8wu7pMmAjyWPPIMFlRfctNPMzTB0n0+Jc
	veoBxpURaKtLa2ce+q94C9A6NoVD3eN11ZFPDQ7bVDfAtMorZivY5uAezkaWWtlL4f7V1DEJ/3htP
	nSqu8AlfYW1Uoy7fG9Jp/s0PfRXvY2YrjWSbckZK98/b1HfZNUnJ8LCQP9GEPnZTnYtgy3HsWFKQL
	rEyvErkaS6vYekon5S1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8mlJ-00BOoj-Ak; Sat, 15 Jan 2022 17:22:45 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8mlE-00BOmx-M1
 for linux-riscv@lists.infradead.org; Sat, 15 Jan 2022 17:22:42 +0000
Received: by mail-oi1-f171.google.com with SMTP id q186so17042526oih.8
 for <linux-riscv@lists.infradead.org>; Sat, 15 Jan 2022 09:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ZtQZQQtBYWI8Agjq6Y7PFot/NVrQMu+LHWLDC+pnaYs=;
 b=VVrAB2KWLgHmY4tQbaYmafKYswEAe8qJYRt9AEIfPt/snW0XkeSo86LlxQ0atWWcFY
 u63ueK/3i25+LwoMGlDd/H5ojIpQ8jto8TyvJxNwcHroygHd22ZcT+wfV4Y+pKvl+H1k
 PXlI3w2KWMxgWuHHTOCZowswey84CZg1X+XXmje969aKOPobfcHLh5q3JuPwTDNQtAkS
 tm5WxKKQHsISskpswFc/C3jnZ7eDKdoFAYqU10cEjQ6EBh86Y/eUCJFgiuxidbDyDxgt
 5vGSSJBPjIESrJDCX6l0UzJo1TQVGnyflUPWh209n2IYKqd232PHK73g5w8UVVSu0DiN
 N7iA==
X-Gm-Message-State: AOAM532P6VPgO3C6InnAObZRQ//lr/WzZD+twzN+te7Mm5QARyIPOZz0
 nnK4W4aALCEKbLNE4rseUg==
X-Google-Smtp-Source: ABdhPJy6RpEsOGN9sTiJA6qfKAqIaiAUMAxiy/euV0n2fuPnv1Vgvzop0yoLcdi/7lbeNfB1ZGfiNw==
X-Received: by 2002:a05:6808:e8a:: with SMTP id
 k10mr16992956oil.22.1642267359753; 
 Sat, 15 Jan 2022 09:22:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s24sm3209601otk.22.2022.01.15.09.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 09:22:39 -0800 (PST)
Received: (nullmailer pid 119890 invoked by uid 1000);
 Sat, 15 Jan 2022 17:22:30 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-pwm@vger.kernel.org, palmer@dabbelt.com, a.zummo@towertech.it,
 krzysztof.kozlowski@canonical.com, heiko@sntech.de, robh+dt@kernel.org,
 bin.meng@windriver.com, linux-kernel@vger.kernel.org, lee.jones@linaro.org,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 thierry.reding@gmail.com, geert@linux-m68k.org, atishp@rivosinc.com,
 daire.mcnamara@microchip.com, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, lewis.hanly@microchip.com,
 alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org, broonie@kernel.org,
 linux-rtc@vger.kernel.org, ivan.griffin@microchip.com,
 linus.walleij@linaro.org, paul.walmsley@sifive.com, bgolaszewski@baylibre.com,
 gregkh@linuxfoundation.org, u.kleine-koenig@pengutronix.de,
 linux-usb@vger.kernel.org, linux-spi@vger.kernel.org, jassisinghbrar@gmail.com,
 devicetree@vger.kernel.org
In-Reply-To: <20220114151727.2319915-9-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-9-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 08/15] dt-bindings: usb: add bindings for microchip
 mpfs musb
Date: Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.931458.119889.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_092240_757474_415DC982 
X-CRM114-Status: GOOD (  11.93  )
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

On Fri, 14 Jan 2022 15:17:20 +0000, conor.dooley@microchip.com wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/usb/microchip,mpfs-musb.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/usb/microchip,mpfs-musb.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580122

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
