Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4686AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 18:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQtf8/pSlTuOEworkPN2+CNjGvUVq9qVPQ6ijKIj2kI=; b=RB4Go6qzbe6oGU
	hvYtTrV0rzg4/Cmq4DXhRlE/wZAEeqmpIk3mS7/dqX9++g24Lpj75wFdYUZFSjhDZ0zvwyr7kb2yw
	e9Owtf9SUS5iZkKVA7eLHcxLqNDr4e3nx5JBr5E4IqIBHrEMjVc38a6RX7mYjAgesIJBrShcL8YEh
	9oiWmAyy8cvVQLSVTydto22KajlQcCj/DMS2AJYE5Uhe7Y6SsPZ6IaV3a0eYqWHLys2ctW/6alPoK
	WLAnl9zh645oVBMyJrGmijT/wMURlLjL9pXesLuUWbn0OBuOtMRRxliSmdXPZsIVUd6S4lIkjgp4H
	zvNRrMGxIqBHcqg6kvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzja0-0080cl-Vb; Tue, 21 Dec 2021 18:09:41 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzjMT-007xUR-6H
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 17:55:42 +0000
Received: by mail-qk1-f170.google.com with SMTP id 69so815354qkd.6
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 09:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4GSGA/qwtNXG0IPZ01RqeQiJyKL3VoAZk2c0sbKkobg=;
 b=at4U9NNntt7dpQO/OeNkd3Euu+cMmi5FJUtDLpO9O3f9KL2ht0wgJXXr/aClaNmx8Y
 v1lveX/xtWVC7ITFAuyZW7fISV1OEHcKWTElgYJHkBjAmEuQORQG/Ym7pnYjr/v4mT4E
 cpOUi0lhnr3k40FDj2FbAITTDPFhzsNINfoL06dV6mlQD8oLnTy1UButwZ9tjMsiUBJt
 lu023Fl8Vtr21yy1uiTOpaZhbyQKp6MfruCaHnGivhHfvPv7ihgl1QIUHxwb9+XQuCdI
 21UL9FsI6tW/Jgnoh7ZwzsPDwKCalQQdBNKBzliRXMbvpBubGn/axXDum7EOvPRZjeRC
 yuJQ==
X-Gm-Message-State: AOAM531UkfTKJtZHz5HsyLpa0wsF/yQDksAQRXqBFrupGWgipqxb4bLv
 BRbIDG+op29P7D3lbHqBSLLxJPHay9HQ
X-Google-Smtp-Source: ABdhPJz5vgBn1TjeZtoc2YYKvQ+HmcEPZTFsNL3qHHc8SbteC0W1UmfcNlqbGX3NnNYb5boB3sk4Pg==
X-Received: by 2002:a05:620a:258e:: with SMTP id
 x14mr2824830qko.578.1640109338673; 
 Tue, 21 Dec 2021 09:55:38 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id bm35sm14659623qkb.86.2021.12.21.09.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 09:55:38 -0800 (PST)
Received: (nullmailer pid 1495705 invoked by uid 1000);
 Tue, 21 Dec 2021 17:55:33 -0000
Date: Tue, 21 Dec 2021 13:55:33 -0400
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 broonie@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
 bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atish.patra@wdc.com
Subject: Re: [PATCH v2 03/17] dt-bindings: soc/microchip: make
 systemcontroller a mfd
Message-ID: <YcIVFZSqt/JSuk3J@robh.at.kernel.org>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-4-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217093325.30612-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_095541_277707_82AE8326 
X-CRM114-Status: GOOD (  14.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 17, 2021 at 09:33:11AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Make the system controller on the Polarfire SoC
> a "simple,mfd" so that the services can be child
> nodes of the system controller node.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs-sys-controller.yaml        | 33 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> index f699772fedf3..014cb44b8f31 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> @@ -13,13 +13,34 @@ description: |
>    The PolarFire SoC system controller is communicated with via a mailbox.
>    This document describes the bindings for the client portion of that mailbox.
>  
> -
>  properties:
>    mboxes:
>      maxItems: 1
>  
>    compatible:
> -    const: microchip,mpfs-sys-controller
> +    items:
> +      - const: microchip,mpfs-sys-controller
> +      - const: simple-mfd

'simple-mfd' means there is zero dependency on the parent for the child 
nodes. Isn't 'mboxes' a dependency?

> +
> +  hwrandom:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: microchip,mpfs-rng
> +
> +    required:
> +      - compatible
> +
> +  sysserv:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: microchip,mpfs-generic-service
> +
> +    required:
> +      - compatible

There's not really any need to have child nodes which have no resources. 
The driver for microchip,mpfs-sys-controller can create child devices.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
