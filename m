Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42B1C43217
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGfoInsgaUai8I2th9/dFQinTtJD5a+EcryvToEqBls=; b=NgrEVA32u/UL2L
	/KUcLd1glT8G4NzadhWjjwPJVEH+8jLgqOXia2+KZkwuOt1tTd2dfj1AOW+1RdXZrGwuj++quAILF
	/fzOmUGFzlNwwCWUIxdntfvB4r46/1kMbMCahrkHtJUevGfyktvfT50feSMGGnj421yQPzLlyKA0Y
	yRJHTTOgm/Lx5R8OnHkyF4U0WFuE2LmK5+8D6Bztm1+WalWpi861g7QPkVN5Dh/ivRZcAJh2OOpPz
	4ZhK+d7aSTPDrkoRQKYWa+N4e0J+ivXnlLqESdg4uzrXHQUB4FHsAwEJzy/heIkd+5jbq/NUlgLrv
	OwC1t4THgKsj3Vto9OWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myE89-00AbwD-7k; Fri, 17 Dec 2021 14:22:41 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myE70-00AbOn-Lv
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 14:21:32 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so3012160otv.9
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 06:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=9mHbdQJvEBq0GiZo1fgGbP6sxeF+R8bP3s4ARUmlceM=;
 b=BNnga8ZjBOEu9JtaCb44PwdMZvPnnNl1r6kIJThYNf2uAWNhZQ8NkFaBm9wf6LTT6O
 KlHbiZ1CmiAW+OQOqH/3a/YK8WKpP/ejFZQbW0BD6C88g/AU5y+L61RVYB7ZjLbH8M/0
 99og/1ihhUx6VElcfNS8gRBAP3RRfzVxWwfsmw9/ZLY6fA3fR9mcd36v8C0tqMOAqh0G
 ReTOxQgnVrLpZM7ItA8nrWHujab8MCOkX7Qe9I+u4rO+LB/b6IqOhKwTI85EEDPjnzji
 erWCwcDIN3/rgSXP+u7hN3QFIzuoMkYSMvEOHzCcJT7qxgnVO+7I/at/jYKhoq1zOGiD
 +Nqg==
X-Gm-Message-State: AOAM532g2EOkSn3sffN7wDIhW6fL53hwTdyuZ9MdgD7BFJcankpOMtQV
 TwHqJMXMq6JYUNvodPcUkQ==
X-Google-Smtp-Source: ABdhPJwLu1cahs9nnfu4oOkz5iiuYY7SC5BLMQnbEiip8MsUuVVsctpwE93dr/8mgw3nYP5dBsTa/A==
X-Received: by 2002:a05:6830:19c8:: with SMTP id
 p8mr2332811otp.111.1639750889734; 
 Fri, 17 Dec 2021 06:21:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o11sm1659326oiv.10.2021.12.17.06.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 06:21:29 -0800 (PST)
Received: (nullmailer pid 2814891 invoked by uid 1000);
 Fri, 17 Dec 2021 14:21:22 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
 ivan.griffin@microchip.com, u.kleine-koenig@pengutronix.de,
 linux-spi@vger.kernel.org, bgolaszewski@baylibre.com, aou@eecs.berkeley.edu,
 atish.patra@wdc.com, palmer@dabbelt.com, daire.mcnamara@microchip.com,
 krzysztof.kozlowski@canonical.com, alexandre.belloni@bootlin.com,
 devicetree@vger.kernel.org, geert@linux-m68k.org, lewis.hanly@microchip.com,
 linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
 jassisinghbrar@gmail.com, bin.meng@windriver.com, linus.walleij@linaro.org,
 paul.walmsley@sifive.com, gregkh@linuxfoundation.org,
 linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-pwm@vger.kernel.org, heiko@sntech.de, linux-gpio@vger.kernel.org,
 broonie@kernel.org, linux-rtc@vger.kernel.org, robh+dt@kernel.org,
 lee.jones@linaro.org, a.zummo@towertech.it
In-Reply-To: <20211217093325.30612-13-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-13-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 12/17] dt-bindings: pwm: add microchip corePWM binding
Date: Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.709047.2814890.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_062130_765648_A72FBCE4 
X-CRM114-Status: GOOD (  11.41  )
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

On Fri, 17 Dec 2021 09:33:20 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the Microchip fpga fabric based "core" PWM controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pwm/microchip,corepwm.yaml       | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1569853

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
