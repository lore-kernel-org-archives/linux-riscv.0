Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E4CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 04:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EA5C61130
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 04:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EA5C61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ia0jK6JVtQg6fb2OjAzLJWX8wzsOBVkhDFj7/ng8Qx0=; b=TDrcl+0LcO2dy8
	Q8B4oc/6uf2vZzXvxM/ZMn0uOMwGO2iNOFGQSNU8tfIgaSLTDQNRq2xmbMqDCJJpSkK4w2T/4NMQu
	r3lwbyFxJGi+/My6T0Kijnl3UazjmDGiR6+0lYbNF4bRmFGO61ODXWDzjgxRB+fnuxKMipc9ECUM1
	ur0xCWGgv8WaOBtNZqlxoKaO7pcdNMD+BykX5/FjyHAnKXdT86QZm4t8KkBo7jJtMhbje2C+4WmsR
	JsiWnA50Kqi6iiIZW5LdITmXoG+653IMuqFyyxAQLliWUmziJblX0foaE1gy1zyU0J3PNfe5CmLwc
	LRx6Y7N0Z6vEfT2zVeLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkIPD-000dgb-1b; Tue, 09 Nov 2021 04:06:43 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkIP9-000deM-DY
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 04:06:40 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 o15-20020a9d410f000000b0055c942cc7a0so6291898ote.8
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 20:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Oge0EnfKNFQBUdGv4kRxUqctp7bsGqv2hp5zFLIPTz0=;
 b=lxT+LZ2MSql57Mw5Nh3Q/mrACajMeWTvAAeIHRkUoFjAtV4wsPTVdQtgASMeXoS3Sn
 7zw/IdxIVqdihLLwYRC4oVBBo/iPREtFOCmwY4KpaLs/t0rgP2FhTk2ejOF3jzZX1LcF
 wt+YlLZef8nlaq9JYnynMnuFgIBs98GRhnFyoFsoKcQtS3nc3971rxltR1eiu67Ky8eY
 pbh8/UsQeZAr/FVsMXH519/wrbhvM40TGIXUL7gOO5M+GWobqg1E43Y63MVhC/w1DN7g
 Cxr57PJV0VTyZEh5QkyEmPuSaamkj6TYrJhXVd3VkiAbYpORx1d7HLckDH3wimrgRa91
 kySw==
X-Gm-Message-State: AOAM530cWbUqXt7SxYy/bLzdKjvYMm/+38GJEH1or237VqeY+llHrGXo
 NnaeMCPc+GWxgZ86agBqrg==
X-Google-Smtp-Source: ABdhPJyr28faBwelObCcuw2f/7Ua5w6R6abaMd8+HrGQ+LM8ItIlWJVTwTBhSGG0onP7IPs6JktBMg==
X-Received: by 2002:a05:6830:4cf:: with SMTP id
 s15mr2725457otd.219.1636430795994; 
 Mon, 08 Nov 2021 20:06:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f25sm5222567oog.44.2021.11.08.20.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 20:06:35 -0800 (PST)
Received: (nullmailer pid 743045 invoked by uid 1000);
 Tue, 09 Nov 2021 04:06:29 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: ivan.griffin@microchip.com, jassisinghbrar@gmail.com, geert@linux-m68k.org,
 lewis.hanly@microchip.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 broonie@kernel.org, atish.patra@wdc.com, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, palmer@dabbelt.com, gregkh@linuxfoundation.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, bin.meng@windriver.com,
 robh+dt@kernel.org, linux-crypto@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com, a.zummo@towertech.it,
 linus.walleij@linaro.org, daire.mcnamara@microchip.com,
 alexandre.belloni@bootlin.com, krzysztof.kozlowski@canonical.com
In-Reply-To: <20211108150554.4457-12-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-12-conor.dooley@microchip.com>
Subject: Re: [PATCH 11/13] dt-bindings: usb: add bindings for microchip mpfs
 musb
Date: Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.946637.743044.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_200639_481862_3C7C5A10 
X-CRM114-Status: GOOD (  13.05  )
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

On Mon, 08 Nov 2021 15:05:52 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-usb-host.yaml | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml: properties:interrupt-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'dma'}, {'const': 'mc'}] is too long
	[{'const': 'dma'}, {'const': 'mc'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml: ignoring, error in schema: properties: interrupt-names
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552389

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
