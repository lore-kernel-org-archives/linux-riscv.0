Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E848AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEEytVUV+awtqqv6fu50rFGY3PCmWaI+MYFnBlcCl5g=; b=WGsBSflTHoxIPt
	S/4OzEk5Go3Pr557bwQqcuO3kt6Fq7RFqB3ZNIAABxuznVMyMeaDjAmo1HSQM5S2Whs1VwI1MBFdd
	/A2UzuF8xogLv1RpcE502vpoLmNKbM0pltMhhN+J44UnrXpI3ioe2bmIt5008QuCIv5zM9Wwh+uMT
	KXSfaEu2Sl1xsW6pQ6GE1sGLJL6vDCOU+WYeI8Qpd9I5ATqRoU2fqNEnLE9S+E+mo5O2YyFuj5L32
	nVpFhV42OiwqCk4CVkCO23L7hoe7qxhSMaLzAryA8MXRhjvk180oB80qP4E6Ry/b0zqsw5norDErJ
	T8aaNXGgpuDVb/oYH+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWsK-009V0r-2I; Mon, 31 Jan 2022 13:37:44 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWsG-009UzE-Ec
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 13:37:41 +0000
Received: by mail-oi1-f179.google.com with SMTP id m10so1633729oie.2
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 05:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=dRJYxYg6M513ADX19fELFRfGgMGqN9dmswwNJo+15eU=;
 b=0D888p2C1+IDB9kesGN5LLPeuWSY22YdmxmIZy4+Kitot7JtwdTkgP/xh56HxsaMSF
 k3ewD8X4PkBP6gywMeSXSVwiFZTlAVhFME86LBS8CAoU6ZsnQ7mlBLWxL+cFJzUbD+M+
 BDQYw95LoB0yuyKU7FpPcT+kGDPmqp41sPCESdRd0rPNJtzIsmkodHGPNL4V1PUkBlIv
 diLT6WkN+Cwy2kU2mYuedqB6aQVrU3Xg4mKK6z7WRQX9ecRPtoSDHZyr+UR8O1QMV8MN
 B95JIi/wUVAo4prSUShxqMZOqk5ZFNG2D5FxH7NSZt6dB1B6l7n7HRFTh2rc/XACPzHi
 /mjw==
X-Gm-Message-State: AOAM5327/UosQPtq1zH3NroGUqHoyFO1Zu1+fQAqUniHdCclibot4RMW
 V08y+E7UaOCFHNw8izuhUA==
X-Google-Smtp-Source: ABdhPJxf7xEF6ASgsS22KYFq2drQaTLC9zin7gpaq+t/OkVYsMOveK/Vxr4nFYjFUepMzMyIvAUqNw==
X-Received: by 2002:a05:6808:168e:: with SMTP id
 bb14mr17517593oib.106.1643636259228; 
 Mon, 31 Jan 2022 05:37:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n66sm14639502oif.35.2022.01.31.05.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:37:38 -0800 (PST)
Received: (nullmailer pid 140173 invoked by uid 1000);
 Mon, 31 Jan 2022 13:37:31 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 atishp@rivosinc.com, heiko@sntech.de, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, linux-i2c@vger.kernel.org, robh+dt@kernel.org,
 daire.mcnamara@microchip.com, alexandre.belloni@bootlin.com,
 paul.walmsley@sifive.com, brgl@bgdev.pl, geert@linux-m68k.org,
 aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, palmer@dabbelt.com,
 lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bin.meng@windriver.com, a.zummo@towertech.it,
 krzysztof.kozlowski@canonical.com, linus.walleij@linaro.org,
 u.kleine-koenig@pengutronix.de, ivan.griffin@microchip.com,
 linux-pwm@vger.kernel.org, lewis.hanly@microchip.com
In-Reply-To: <20220131114726.973690-7-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-7-conor.dooley@microchip.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Date: Mon, 31 Jan 2022 07:37:31 -0600
Message-Id: <1643636251.124352.140172.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_053740_514599_81A96497 
X-CRM114-Status: GOOD (  12.34  )
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

On Mon, 31 Jan 2022 11:47:21 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> controller.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
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
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/pwm/microchip,corepwm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1586680

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
