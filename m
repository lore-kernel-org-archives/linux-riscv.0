Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95651C4321E
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jan 2022 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3sJuZcR1FXx0WtRMMXjYXb3UzrOhAdnrSMAYgOhCeY=; b=T7S15XRVwjTo4W
	oW3GZ8WriLxb3hsnyxrhZyjTDni4Uj2YjMO707tfnr/wsPtWsRsanhSGqhlieShoU+VVZN0OgC9iV
	JDWPUBGH7zxcX8PvpCgNxPa0dZOp+9Bh6P6vKPyDEPLFDI9gTTR/PnQNz/tJT4Xs+IToIbW5oxAWk
	ucCFUV+D23Xo6KuYlD2hpX2efhWM+eHyG9jX3chS87HfWi+xK9ilOAViMDYLLbnmACEbtBA2zFDV5
	xyzsXr8YWx6rUsUPTddd07bvyDOeCq3jWCv1M2zf8GDYtrI4fY1Beatm3chlo2ysLFVL1XswJL/4r
	7cwMrFtkbAspzTbc4uCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8mlO-00BOrg-MA; Sat, 15 Jan 2022 17:22:50 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8mlM-00BOqQ-NC
 for linux-riscv@lists.infradead.org; Sat, 15 Jan 2022 17:22:50 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 a12-20020a0568301dcc00b005919e149b4cso14146094otj.8
 for <linux-riscv@lists.infradead.org>; Sat, 15 Jan 2022 09:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=tOd5PlmluudALXw25P1FUTpuTqmX0VJHEIDiSnDnSyQ=;
 b=3wNbLO9aSourlawDH51OVHgHVYdmb3LDohS0tPED9+ZZ8pE7HL+pp4cx5bRSSEE+Qn
 o1ND7+8JeNY2t9KlQSuLmXBJZWxMPZIbkSn1HGlMU+NYPopI6jD9pbPX4Lk5kxdN0Oj2
 6DXDYH1XkudA/aPs7JX2T0f9NqsGKepvtQru+1hNZSokZ+bbCQZ5l6eTnZDQXxTQO9/s
 mW/CMf8mPika1j33gnfiwUCUfyqrWllSVOn2ts6ozcVzefSs3UONCNo++HLuxXyN77Iz
 nH5DgIM57udq/xgZAPb67tv8/Ji9/OKFCzU1ggYIaH2D93qH9DKUDErk1KK1Yg5KSqY7
 zwrw==
X-Gm-Message-State: AOAM531Pb2Q/SUqgS8tCHdFRr0v3+k1SC1siiMo/VTyRWcZrdaTyPGYW
 2PpqUerKCNwWP0U3LiPFSQ==
X-Google-Smtp-Source: ABdhPJwIybGqL+uwk2P4tWp5L19eVC71Jl+JwGpTzzBPt2XUw3/wznpGXkiPdKkv8jvQYIA+SGnISQ==
X-Received: by 2002:a9d:7cc9:: with SMTP id r9mr10587481otn.202.1642267368079; 
 Sat, 15 Jan 2022 09:22:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x13sm3251441oof.19.2022.01.15.09.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 09:22:47 -0800 (PST)
Received: (nullmailer pid 119886 invoked by uid 1000);
 Sat, 15 Jan 2022 17:22:30 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, heiko@sntech.de, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org, aou@eecs.berkeley.edu, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, atishp@rivosinc.com, bgolaszewski@baylibre.com,
 palmer@dabbelt.com, a.zummo@towertech.it, ivan.griffin@microchip.com,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 daire.mcnamara@microchip.com, thierry.reding@gmail.com, bin.meng@windriver.com,
 robh+dt@kernel.org, lewis.hanly@microchip.com, lee.jones@linaro.org,
 linux-crypto@vger.kernel.org, linux-pwm@vger.kernel.org,
 jassisinghbrar@gmail.com, linux-riscv@lists.infradead.org,
 geert@linux-m68k.org, linux-rtc@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, paul.walmsley@sifive.com,
 alexandre.belloni@bootlin.com, linux-i2c@vger.kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org
In-Reply-To: <20220114151727.2319915-7-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-7-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 06/15] dt-bindings: gpio: add bindings for microchip
 mpfs gpio
Date: Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.915591.119885.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_092248_781055_B4DCD819 
X-CRM114-Status: GOOD (  11.66  )
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

On Fri, 14 Jan 2022 15:17:18 +0000, conor.dooley@microchip.com wrote:
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

See https://patchwork.ozlabs.org/patch/1580118

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
