Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6473C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4pe6tdzeTqVhwq9dzgWMazViM3BkMy0vmy0AFFbmm0=; b=Ve0//VCdoKuwQF
	bb6QixIAKpr4DH4I/jH6PQyCNdJqDLvtMSFDmxZ7ZMdwKTZl01Ael4qrvNqmQsRM2Bka4BTb44rgb
	0QJr0kQF+xKt0JJu3nY4kF4hCMv4XJViWEev4EaaonIhg0NJnvrej+ZL58l5BIVf6AK36YfC0HIVd
	7e7wvm0OB9hyWBPiLBKlkzriv3aqZkbLQWrKk8hmKFi8DUzlt3Z7YcwRWxbV0rRHZCdDUgyB7frtx
	1UX12qWjGGOK20XNrGcfLtcBHh/JoKCEX2gxfgKlY5XR70KCselu0IhZSiKqT9XH3Rjn4cFW3EPYX
	IP6JFJE3m05nV4TJmBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWsE-009UyZ-6y; Mon, 31 Jan 2022 13:37:38 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWsB-009Uxf-8h
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 13:37:36 +0000
Received: by mail-oi1-f169.google.com with SMTP id e81so26661537oia.6
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 05:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=nlm4zvylRWmR5WREUgtSyLjF6ZgmNI+EjSE9SwmaUK8=;
 b=yP1tjeycK9T/8J/08+kIyfR09SSfHUs2YkDcHRUbEFBawkVuaFl7LRrmRWbD7b5W9+
 6/PAjSRM1gRfPg/3CNCABo3K4K9fcM5JIHZT4uGU2zUojfsUO1wRirIbaICAwOlyX5am
 wNo65eXEQSjOyVxa+7ikpKeVSS5NIS/w1k96vVpX3K8o/VcrX954QY+Kl2Bc4ISLXeFE
 sTjXJQae4+uF4WOtKfr4MDbeTg1pz0k2nZVrkOOjiE0SMeUk1gXwOd1RPY634+QyseJK
 zgPg0RahYif/dbd8D3tUDLZ4v7WZe1HhTn8orWjE4YRgGNYIJpo7qfcq2iomAU6KcrG1
 yHMA==
X-Gm-Message-State: AOAM5337ii9fjDkgdbumUEVb5u04y7/V4HQAjvGQc1f3ua4qBLM179JC
 Sve/v6am6ExR5JQZ37tijQ==
X-Google-Smtp-Source: ABdhPJy6dpxtxfz7tIcUHdfKGqrjKfLSw8aJ+wWpPL2BHO8kYigVTZ2NIUwG4avYBAOlLZD4pPdkGA==
X-Received: by 2002:a05:6808:1784:: with SMTP id
 bg4mr18144861oib.286.1643636253100; 
 Mon, 31 Jan 2022 05:37:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c13sm9111957otf.5.2022.01.31.05.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:37:32 -0800 (PST)
Received: (nullmailer pid 140166 invoked by uid 1000);
 Mon, 31 Jan 2022 13:37:31 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: atishp@rivosinc.com, krzysztof.kozlowski@canonical.com,
 devicetree@vger.kernel.org, bin.meng@windriver.com,
 u.kleine-koenig@pengutronix.de, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, lee.jones@linaro.org, linux-gpio@vger.kernel.org,
 daire.mcnamara@microchip.com, heiko@sntech.de, lewis.hanly@microchip.com,
 brgl@bgdev.pl, linux-pwm@vger.kernel.org, geert@linux-m68k.org,
 jassisinghbrar@gmail.com, alexandre.belloni@bootlin.com,
 linus.walleij@linaro.org, palmer@dabbelt.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org, a.zummo@towertech.it,
 ivan.griffin@microchip.com, thierry.reding@gmail.com,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org
In-Reply-To: <20220131114726.973690-4-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-4-conor.dooley@microchip.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Date: Mon, 31 Jan 2022 07:37:31 -0600
Message-Id: <1643636251.086670.140165.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_053735_331352_8E51E66D 
X-CRM114-Status: GOOD (  12.95  )
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

On Mon, 31 Jan 2022 11:47:18 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1586674

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
