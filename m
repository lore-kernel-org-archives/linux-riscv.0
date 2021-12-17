Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FAC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mot1yNTuwznNSwLqwkvNNxFfA0bNTZS7iBghB3WAW+w=; b=B78647TicKHVkB
	gM/IlZJoRsqPq89hNsQi+CmJGftEWvPJNJ2pWV4+L4X2z9MVcjEns4JI9c/s5R13jpWN/ARlx24Ci
	lskhiRX53Yf7OKCIXdQs/7TzgRgoCfQKQE6bIKBvrA2W6Bpw++xAV6kilEBHxTqOtj10+6zTdoRsm
	RzUC3wWJ9hxgeFME/CrrS5C2mDakrX4LGSTEVtyuXgsdtrG7QfBYjjFrz3vAsNrRFfKdCt/kIaK9V
	U6l2XlDI6CHEEMlMzCLsUdX/Bt81KsW3KWSicfxuY5zyE9yC7ecAp2YiMRmKGU6u1sD2RSAPQVQWc
	NNp5IobUwVD1g2SyAVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myE8S-00Ac7q-9X; Fri, 17 Dec 2021 14:23:00 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myE74-00AbQl-N9
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 14:21:36 +0000
Received: by mail-oi1-f169.google.com with SMTP id bj13so3810552oib.4
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 06:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=K+fpGAjpVGt0VWWCD57sVJ2BZcyKw5OuNHjkZ25R3sM=;
 b=tdRwuG+jVveanCY509J1R6G6rB4SJUJt/oWjl88YQVTR8t+Tvr9ZXB8jdNg+REo6MV
 1O8Rbu6eErPjMQGChntNFsJTYF1qzkMsBVGI3dszBMGoso4oIAGF3Htv5agkps7+zpsR
 Q0JbJb6h8FN+A6sr1M2KhKwKrsOp0R6GPLfoHcsb61KrWLfEBSrudp6lD0N9JClySnc+
 gj59f6igk2+LM3b9rMF/e+ny1NlNZy3inRQNZQYIFii344jKFKMRzG07anpbbWhHmORb
 bEhC00bBnFQEej1FlkQtBf/cXuzdf8PVhmN992r+QeG1X7w9cEvqG0G9M8+DLS9fVSLw
 sI/Q==
X-Gm-Message-State: AOAM531+0wVAbQuDLMmNDOOPPSS4aQnvJZ/DwVlezH4NNMJcXw5O70Fu
 yTbGAlv3g+b/xfa3lxFtnQ==
X-Google-Smtp-Source: ABdhPJxfl5ayeW5AdzR9NO8PqAIqjIk1Jdx+Cd1+AOuM9pWMi29n7FEhlLZ3WETROcdkBQTB/a2/Tw==
X-Received: by 2002:a54:4401:: with SMTP id k1mr8315183oiw.143.1639750893772; 
 Fri, 17 Dec 2021 06:21:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p6sm1600794oof.0.2021.12.17.06.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 06:21:33 -0800 (PST)
Received: (nullmailer pid 2814881 invoked by uid 1000);
 Fri, 17 Dec 2021 14:21:22 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: bgolaszewski@baylibre.com, lee.jones@linaro.org,
 linux-crypto@vger.kernel.org, bin.meng@windriver.com,
 linux-gpio@vger.kernel.org, ivan.griffin@microchip.com,
 linux-usb@vger.kernel.org, linux-riscv@lists.infradead.org,
 alexandre.belloni@bootlin.com, linux-spi@vger.kernel.org,
 linux-rtc@vger.kernel.org, krzysztof.kozlowski@canonical.com, heiko@sntech.de,
 geert@linux-m68k.org, aou@eecs.berkeley.edu, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, jassisinghbrar@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, linux-pwm@vger.kernel.org, atish.patra@wdc.com,
 palmer@dabbelt.com, u.kleine-koenig@pengutronix.de, a.zummo@towertech.it,
 thierry.reding@gmail.com, gregkh@linuxfoundation.org, robh+dt@kernel.org,
 paul.walmsley@sifive.com, linux-i2c@vger.kernel.org, broonie@kernel.org
In-Reply-To: <20211217093325.30612-6-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-6-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 05/17] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Date: Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.651672.2814880.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_062134_792777_2D1E1FB9 
X-CRM114-Status: GOOD (  12.35  )
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

On Fri, 17 Dec 2021 09:33:13 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1569825

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
