Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5001EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osDTMBlicG2OA9vC33JoJtDyS/Xd/p+cflJAszW2KpY=; b=CPBjfO79WNAmeS
	cBqv8V+aCNONOdMinkXOxR3DXuv/9sHgZs2BkC2fJJICjBLfkzuUMIRiaMRgb9TBAlb5hVv6I1LRC
	5q7YH/iPE859dhnORTUeMQ6O3vnzd7pmOWakgE/yu2EP4X2bF4zXVvMs0dgkWUt+8DVc3P2em/4vp
	b45+GO0gFB8R1KaFt3mTBkh5tSTCrIlQEbq8fZpqNsN1QKedGp4dDgGxXzOsaw3soMQ7Re4htf9vA
	mLAOL5/c0KxFGs4M2gfAPXpwyGlfirgIc5N6rSgBf2hFYDEQR2/y66wpllMuqZ4G7EI/Yh0/sZZGg
	QqmnAXIipgYSlvx1AWXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myE8I-00Ac1T-7A; Fri, 17 Dec 2021 14:22:50 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myE72-00AbPV-PA
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 14:21:34 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so3029610otj.7
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 06:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=J/M+2PmsjRymmQB6phu/NDYxaFxAbv7b80JhNIg62vk=;
 b=dlmw3BhaGWSPiWbZUata9PYeVh2jlsuUbbXTpkSZiH21JwcQIrbKjaHRiK8wU0lDFy
 RAariBxBVbjrrYgL1R+TxuN2pVEOs/hKYfc3bPtnd9Tsi5nysZs27Sqrehg4TFqHjKdY
 J/xe41Q9jnCmZq8iUdpk7Cqclzq8pjN7YhyqJUaLWshQRQYbfr0sj1qEW6igZGajG5ZU
 qhEKIgFREXzso3WiKK2ET70tVMjPhfO39aj35MiCcNrE/Xy0UjCW7fkHU1jtAZ0k/0Ow
 2bScE/7+qje4J+YoL1QokhOTwiRazBxqbiHWTFhvWWrFGwutyI2DXkXOIE9a3Th1Emw9
 qOfA==
X-Gm-Message-State: AOAM531J/GrQy/KUB8WdDwxtMgCFhjM1UC3Y7ZAKhjRxaWedl0J+3TPc
 CYtYJHgeW6LxNUEqWtNySQ==
X-Google-Smtp-Source: ABdhPJxSbDeJnwvijqNwXzfBaRn9Hh/PmAL/1NDID3KUpTOZzTZQbR9Dg2FMsfiJTFgvBh57qRNhkw==
X-Received: by 2002:a05:6830:1d68:: with SMTP id
 l8mr2311039oti.21.1639750891747; 
 Fri, 17 Dec 2021 06:21:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n26sm1547497ooq.36.2021.12.17.06.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 06:21:31 -0800 (PST)
Received: (nullmailer pid 2814889 invoked by uid 1000);
 Fri, 17 Dec 2021 14:21:22 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 bin.meng@windriver.com, daire.mcnamara@microchip.com,
 ivan.griffin@microchip.com, linux-pwm@vger.kernel.org,
 alexandre.belloni@bootlin.com, jassisinghbrar@gmail.com,
 lewis.hanly@microchip.com, palmer@dabbelt.com, gregkh@linuxfoundation.org,
 bgolaszewski@baylibre.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, u.kleine-koenig@pengutronix.de,
 krzysztof.kozlowski@canonical.com, broonie@kernel.org, atish.patra@wdc.com,
 geert@linux-m68k.org, linux-usb@vger.kernel.org, heiko@sntech.de,
 linux-i2c@vger.kernel.org, thierry.reding@gmail.com, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org
In-Reply-To: <20211217093325.30612-12-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-12-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 11/17] dt-bindings: usb: add bindings for microchip
 mpfs musb
Date: Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.697647.2814888.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_062132_856025_DFDB2563 
X-CRM114-Status: GOOD (  11.95  )
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

On Fri, 17 Dec 2021 09:33:19 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-musb.yaml     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1569849

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
