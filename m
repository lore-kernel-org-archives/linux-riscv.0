Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484D8C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 20:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4k653YLuqblEOYeJCV+4wW8piEEe87SX7aXUZSu9DQc=; b=AiW3410JyGVM5w
	uuoEWBthy4aUswUZbT3JsJgIHizTpSi6f2IBcpmiNxQRb1udXx/klr/AX7X+Sl73LBRLetlSms+1G
	QvumMQ+XK1rjpWYoRC4SQA790FHYIeI0hqmsxDFs+Fyozrt4yD8qEd6/NnUr6aLaxfySdjz+AeTwV
	X5Tj82Gy02xDzextzn729wGh3cQnSWYr5p/vV1Whq320FVRVsoVYUy/dA+vySrG2Fuj7IHfnMlYue
	5IOTAFQ7qF7rPuDqzB5M3fXuPcFh84RyDkxjkJInK8bDovfWwQua38on2chrOJAy0bshc7wDPFBYG
	MBKcaJgDlRzfcVHLFWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrmvW-002F8L-Eo; Mon, 29 Nov 2021 20:07:02 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrms4-002DUw-UL
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 20:03:30 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso27120043otj.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Nov 2021 12:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kvDcsM3w4WQk4jXsDcnewbr4cFKFCF6p3RmEQ5PDnjA=;
 b=QU+t6ChCb4pTjoqUZryLGYDM2IkV1gFFUDpFYm0vou/CsexZMQJtFB3oXG6MC8uZwP
 PzvpDKmfsIVnLp3ta+GQuCLywLWuTecTeFOSTAu40XD1xajKlCT+0CWZdin+zKXWBecG
 tMPhViiy6j4rNkbImLGap1hiGggugJ6OSL1U7Q0Di1r9K39R9+EHmwQT5mw5E6DAVKb7
 AYsTQkWLVzj7QCJCoQxOUAtQbMioLkDGHJlZV/993Jxks3Re1aBO5j50AlBZBQulzTrs
 /btEctPRsYIBYy9640z3GwUAY4iVjSM1N7AScsvM59CdafwZfm/PBbM/bPw63T2Hw29N
 lc7A==
X-Gm-Message-State: AOAM530KqT/4IINWfUx89Srb3kuGMDjOCFTQk+YBQFuaVnaFDgxuhT3q
 rbchU8BE/jdzHbf4i45KhA==
X-Google-Smtp-Source: ABdhPJy/Ihp3jA541L/1BdmDyIG1+61H1YRDltOlKuS90bu2rf+mRdfltiPME33JnY7hnF3caTjYCA==
X-Received: by 2002:a9d:1f4:: with SMTP id e107mr46658945ote.52.1638216207570; 
 Mon, 29 Nov 2021 12:03:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e21sm2805635ote.72.2021.11.29.12.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:03:27 -0800 (PST)
Received: (nullmailer pid 512532 invoked by uid 1000);
 Mon, 29 Nov 2021 20:03:25 -0000
Date: Mon, 29 Nov 2021 14:03:25 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 broonie@kernel.org, gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, atish.patra@wdc.com, ivan.griffin@microchip.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 geert@linux-m68k.org, bin.meng@windriver.com
Subject: Re: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr
 compat string
Message-ID: <YaUyDUsyEoaA6nky@robh.at.kernel.org>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-4-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211108150554.4457-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_120329_012411_12265EEF 
X-CRM114-Status: GOOD (  17.14  )
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

On Mon, Nov 08, 2021 at 03:05:44PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Update 'compatible' strings for system controller drivers to the
> approved Microchip name.

Why do I care what Microchip approved? You all picked identifiers 
(that's all it is) and now get to live with them.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/mailbox/microchip,polarfire-soc-mailbox.yaml     | 4 +++-
>  .../soc/microchip/microchip,polarfire-soc-sys-controller.yaml | 4 +++-
>  drivers/mailbox/mailbox-mpfs.c                                | 1 +
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> index bbb173ea483c..b08c8a158eea 100644
> --- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: microchip,polarfire-soc-mailbox
> +    enum:
> +      - microchip,polarfire-soc-mailbox
> +      - microchip,mpfs-mailbox
>  
>    reg:
>      items:
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> index 2cd3bc6bd8d6..d6c953cd154b 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> @@ -19,7 +19,9 @@ properties:
>      maxItems: 1
>  
>    compatible:
> -    const: microchip,polarfire-soc-sys-controller
> +    enum:
> +      - microchip,polarfire-soc-sys-controller
> +      - microchip,mpfs-sys-controller
>  
>  required:
>    - compatible
> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
> index 0d6e2231a2c7..9d5e558a6ee6 100644
> --- a/drivers/mailbox/mailbox-mpfs.c
> +++ b/drivers/mailbox/mailbox-mpfs.c
> @@ -233,6 +233,7 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id mpfs_mbox_of_match[] = {
>  	{.compatible = "microchip,polarfire-soc-mailbox", },
> +	{.compatible = "microchip,mpfs-mailbox", },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mpfs_mbox_of_match);
> -- 
> 2.33.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
