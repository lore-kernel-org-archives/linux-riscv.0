Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BF6C35263
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jan 2022 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lj+wRoa+qz0J3llhriDoj903XumEdrARcm4MDlVzllE=; b=zTojzoQhdoOt5Z
	ZjhFuSm4FXztsbOcEMNRbA2W4H0TAA5yhX9J9FgNkUDc0XkjSc2MRhK2s+qT5Z3vKKj0A4o78rSDc
	2eYyxlYVadUkyUBvqQtcFQWTDr0yssur4Cd6317SGgImHkoNE4GEIxXPfNb9O3AdIYiStdi7sA8QX
	bw3Hj6P2dypEUXM4s7lVnvDjBoEchp5j5yLQCfdeS85syaBwkA5Z74lr1aZ879MKHX7UqYtGSNbXE
	NA9LvPDor+fR0x3MDkXFJOwjRCDUYcVOlqTbZtFsW88NS8j8hi/wtOCxQUMoqnv3vK9tCsMPePUp8
	5aBn9zhXIsXOYmduz/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8mlL-00BOpK-1X; Sat, 15 Jan 2022 17:22:47 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8mlH-00BOnY-6X
 for linux-riscv@lists.infradead.org; Sat, 15 Jan 2022 17:22:44 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso14197960otf.0
 for <linux-riscv@lists.infradead.org>; Sat, 15 Jan 2022 09:22:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=CYssEdn4U+D0DKxBFx9coxO44MoyGtGFbzFuFgNIr2E=;
 b=N3mPriSCeQ+ECAZlHt5VUXyjc9o0OOEm7jgAfE8oW1kwRQbTHBf0GBEWFE/o+XBXOd
 GGmiz+LrHlbyECL2wv+1xiOoYNPvs5qqXU5nCM9rTiW/WOIg14knzFUN4N8WY1qXKB7/
 TtVM+b6GuwLvXPEQevbtanjgR/f934KAd1keSiZCwJdhcKFSba69jGHkxtpEKhz8Y0lV
 yBSm8lTmFmAaWvCBIdtn9OthMDNXokfJx8cnw9UYKLS9ru6Sf009/fRi50oaLHGEzfc/
 ampNbZVYwAzEDKVX20yzbpeuyFl3HzPGI6i7NekdQexc1gL1tOdavDigeAfoyFJKWH7z
 lLnQ==
X-Gm-Message-State: AOAM532wXWGJkHxUJbRrAuLKLJrNShbPgOB9enitRs8cvaLfP0JKsf+I
 0QpbpBpcBKs8nXhcVIFlQQ==
X-Google-Smtp-Source: ABdhPJxa0Y95SAgsnFgvzW2QXkzA/LkZ4mlEhY1BKNnbCRyfZlp+mRbzX6AfmWmwF/mz5bmb22E9Bg==
X-Received: by 2002:a05:6830:4393:: with SMTP id
 s19mr10668275otv.272.1642267362255; 
 Sat, 15 Jan 2022 09:22:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n26sm3426650ooc.48.2022.01.15.09.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 09:22:41 -0800 (PST)
Received: (nullmailer pid 119892 invoked by uid 1000);
 Sat, 15 Jan 2022 17:22:30 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: heiko@sntech.de, daire.mcnamara@microchip.com, palmer@dabbelt.com,
 bgolaszewski@baylibre.com, alexandre.belloni@bootlin.com,
 linux-pwm@vger.kernel.org, bin.meng@windriver.com,
 linux-riscv@lists.infradead.org, robh+dt@kernel.org, atishp@rivosinc.com,
 broonie@kernel.org, lee.jones@linaro.org, linux-gpio@vger.kernel.org,
 thierry.reding@gmail.com, linux-spi@vger.kernel.org,
 ivan.griffin@microchip.com, gregkh@linuxfoundation.org,
 linux-crypto@vger.kernel.org, lewis.hanly@microchip.com,
 u.kleine-koenig@pengutronix.de, jassisinghbrar@gmail.com,
 krzysztof.kozlowski@canonical.com, a.zummo@towertech.it,
 linux-usb@vger.kernel.org, paul.walmsley@sifive.com, linux-rtc@vger.kernel.org,
 geert@linux-m68k.org, linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org
In-Reply-To: <20220114151727.2319915-10-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-10-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 09/15] dt-bindings: pwm: add microchip corepwm binding
Date: Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.939328.119891.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_092243_270252_4DC65F04 
X-CRM114-Status: GOOD (  11.11  )
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

On Fri, 14 Jan 2022 15:17:21 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the Microchip fpga fabric based "core" PWM controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pwm/microchip,corepwm.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/pwm/microchip,corepwm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580131

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
