Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE36C43217
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jan 2022 17:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXSecnvMZNm1BOwJjXtxBaYmUGMKrBpG8/ch051qD2k=; b=VyB4HbSOXcCJZS
	bWHr4SBCRgDBUtbsKzNjb9H2qTSmh+cqdQfrucARzepQa8oqhUM4JMGlbH/KrZgee03xi+vaivC41
	70+SR4iuzhQOyfD/bvNAFB0b978IJm6rNW6QKgsmU4imvyr/SjHNkPYSVxXUEp9NpC5vVCANIplos
	yIyzvPmByauQbjUlLhP9n2LO5jlaVfzMmmah2ANu/VnjpTdT8UEv8fPcApkWM48BS8FxyuSIz03Xi
	TCXL1+MI/jrGGo/AY6Ef1fo9Zy+w4E0dUh7/5u51SlZnBl0TAFSlG95QHqXhJH4b2ySgEIVDbzSaN
	PK4uOT1P68z+JoBVesKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8mlH-00BOo8-L5; Sat, 15 Jan 2022 17:22:43 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8mlC-00BOm6-HO
 for linux-riscv@lists.infradead.org; Sat, 15 Jan 2022 17:22:40 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso14197794otf.0
 for <linux-riscv@lists.infradead.org>; Sat, 15 Jan 2022 09:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=WJTPWHZ9LwOb7SC1kUk35a1mxBx9tABomICwyYusPpU=;
 b=p3Tvk16n7BS0fG57lqTrCHobq5BqE40wWRoHXbGiwFNWPbKglCH4CktRgtL7Z5+jg3
 V6hRAxSmMBBehpD9WtgB9of/X1gCYUqk/rxFf3n+CDYGJSpoGkfqGI/pmRBnxlmk6eXU
 fMAE2VNGrRZzGqWTJRA3dFO1kRFGIqeRfJ3h9NLsoyes0aGucD6QIJiKIRakY9sJjTEq
 +hiJWtpN+Je9W1gtcL0TK5NvQQsoJ2C4jRPcK6DtRZ2xaXrd10hHisRGwo5MY9CiL2UR
 r1NGxqjCZL/+PU7saWFxeYGLry3utyITuG6cZ020rAwEF7h970x7zt0iLiAfgOi+O0be
 Nx+g==
X-Gm-Message-State: AOAM533Mqu0sz7KllAxG7CfdeWD1ecF7d3TAnXsmGmcE7v8h5MbqraR/
 F1aLrDMTGYXLrUeHzYxYSQ==
X-Google-Smtp-Source: ABdhPJzoYppZy2tOmTmU6rJcYjnjFTiAbWYoPhFUY18CRjBii8Nb1cWS4+iNAqG2YO/PG9nzz2i7ng==
X-Received: by 2002:a9d:6012:: with SMTP id h18mr11309090otj.203.1642267357628; 
 Sat, 15 Jan 2022 09:22:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m8sm2868149otn.29.2022.01.15.09.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 09:22:36 -0800 (PST)
Received: (nullmailer pid 119884 invoked by uid 1000);
 Sat, 15 Jan 2022 17:22:30 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: alexandre.belloni@bootlin.com, linux-i2c@vger.kernel.org,
 geert@linux-m68k.org, daire.mcnamara@microchip.com, aou@eecs.berkeley.edu,
 a.zummo@towertech.it, bin.meng@windriver.com, thierry.reding@gmail.com,
 linux-spi@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 linux-gpio@vger.kernel.org, lee.jones@linaro.org, lewis.hanly@microchip.com,
 heiko@sntech.de, linux-crypto@vger.kernel.org, robh+dt@kernel.org,
 palmer@dabbelt.com, linux-rtc@vger.kernel.org, ivan.griffin@microchip.com,
 atishp@rivosinc.com, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 broonie@kernel.org, linux-pwm@vger.kernel.org, paul.walmsley@sifive.com,
 bgolaszewski@baylibre.com, linux-kernel@vger.kernel.org,
 jassisinghbrar@gmail.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
In-Reply-To: <20220114151727.2319915-6-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-6-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 05/15] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Date: Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.907374.119883.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_092238_596625_28F89898 
X-CRM114-Status: GOOD (  11.77  )
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

On Fri, 14 Jan 2022 15:17:17 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
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

See https://patchwork.ozlabs.org/patch/1580112

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
