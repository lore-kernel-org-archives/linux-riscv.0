Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E868EC4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jan 2022 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67UKOU70CiLMYI2yY9zZhG2P3nWWASoNn2wZqtyoQcc=; b=2ov472VzXIhbJd
	IKNJoWfGTn+ck9r5MqyTj7YmHW9T98weNB1ufwmGpOdd7gw2J7O9S06OzbkYGce9X3xhirkF0Xvjn
	oc7ZCIG0eLdjsruedaQYUs2XsDoWxm3sPcXoZH0oeHg1EDQlO29yyCiYlW25a3I4lG08WuyaUTITz
	tk1CF2Z9stTxpeZbbM11WBHRY4pNJD34WLCHLTqezSOci31r5isPdblnT4RaczaSqTQ8PfqopF9K3
	Tzsc9XktrpJMmZUfFoo0aAmehbM7Afm4v5jcj0SkLo+aLJJ6t5XgUgEgCLZLeQsNiq2QTbNS/G7Jx
	2CHd19KZ70u9GJ0AvYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8mlS-00BOuJ-67; Sat, 15 Jan 2022 17:22:54 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8mlP-00BOrj-A3
 for linux-riscv@lists.infradead.org; Sat, 15 Jan 2022 17:22:52 +0000
Received: by mail-oi1-f174.google.com with SMTP id i9so17059449oih.4
 for <linux-riscv@lists.infradead.org>; Sat, 15 Jan 2022 09:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=/ryk+C/4VJdMzNIa1mhcDuVOv8zspRXPYMFSmvgLva4=;
 b=ujeWOxHf4Q2s7Y/50CKu0lZYum5VyF19YV8Hstk05+LBAJCNR96y/0S5BQwyqvXgrG
 X77u6sXp1Ai6PvMvtFFzKamyZDPTegq1tZjknkBRHXyeEiKy8F3XtoaOhTErtWmywiHO
 1tOY1ZpMHNqfpu24FWHqbvXUWEnX2sbRLo9nCVdfs3k0sGdy6B32S071AmFUxvf6Ykvg
 JOxt+wwUmbC9JQ9ewAzjMaMk8EBGrFc1zQKIuXW3FKpITkJEQpqQOStFYlocPg3+ceFQ
 Eo31aDrVxBR2sYp/1mYDJhHZhJeDmEgSfUeqMfKZHX64hzw5PfoCZjkdMMebz1dWSZD7
 jlmA==
X-Gm-Message-State: AOAM53309n4oyFCeCmS9hceG9k6mrMLSZveXLF7qyA2q9XMab6G6ZFc0
 I0rJp3Im/qYs4jXIosRnow==
X-Google-Smtp-Source: ABdhPJy2cNm09rGkY81u/PixZAjMtw93C3BlQ4fLCmC6PwHgFMweTgS3Mvu40uVZQJK9kRcq6lbzCQ==
X-Received: by 2002:a05:6808:11c8:: with SMTP id
 p8mr16749283oiv.72.1642267370379; 
 Sat, 15 Jan 2022 09:22:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e69sm3266969ote.1.2022.01.15.09.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 09:22:49 -0800 (PST)
Received: (nullmailer pid 119882 invoked by uid 1000);
 Sat, 15 Jan 2022 17:22:30 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: atishp@rivosinc.com, bgolaszewski@baylibre.com, palmer@dabbelt.com,
 linux-rtc@vger.kernel.org, linux-crypto@vger.kernel.org,
 thierry.reding@gmail.com, heiko@sntech.de, lee.jones@linaro.org,
 paul.walmsley@sifive.com, broonie@kernel.org, gregkh@linuxfoundation.org,
 geert@linux-m68k.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 ivan.griffin@microchip.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 jassisinghbrar@gmail.com, aou@eecs.berkeley.edu, alexandre.belloni@bootlin.com,
 linux-gpio@vger.kernel.org, a.zummo@towertech.it,
 krzysztof.kozlowski@canonical.com, daire.mcnamara@microchip.com,
 lewis.hanly@microchip.com, bin.meng@windriver.com, robh+dt@kernel.org,
 linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20220114151727.2319915-5-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-5-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 04/15] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Date: Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.899241.119881.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_092251_381003_3D9A440A 
X-CRM114-Status: GOOD (  11.94  )
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

On Fri, 14 Jan 2022 15:17:16 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580106

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
