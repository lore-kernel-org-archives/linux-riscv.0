Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B3DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 20:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxYRkQkik0tTRlAbSlO8KQAwjQ0e/fh915bmlw2yJac=; b=bVaJ4ogfPzOuf/
	KQQySmh/SVC/MHQF75EvGRtI2K6qGiljF3+MNGQcgkLSFAPu9aF9eyY5GKIXJQs8rKQFb667uyFMq
	todp4E2qFaVTo5hRdzrq+6zN4nj+N00+NfmFTJtdZhe7t85cRxpvQJ+x4dYII4k1bDouJ+iHL4KIk
	fSVeVayUFw0XB7d45DXtMQO3nW1kIMXJGirUAunD654DUZqN8+Dpg/ijBmQcnejJ7kcZXhlpyy4Fi
	SVm6qWS8D4jo/7f/YGePGqj2cMVopptVIEhlRo7nwibmfQGzTB9N1Z6wCBtU/gtMox6Re4d6/SLEa
	xBHQMDqLzlZ3YCvosd8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHAIs-00Be6v-9o; Mon, 07 Feb 2022 20:08:02 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHAIp-00Be59-1W
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 20:08:01 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so14986888oor.12
 for <linux-riscv@lists.infradead.org>; Mon, 07 Feb 2022 12:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HsXp1ktRNXXH1ZuQq9T7gkz8YQLCBAGSvs9f6otXSEc=;
 b=Xh8sKIfvWWoCwui31UYdQLVx26wJAznmhyyKu2CoYboh0AP78/HO/LLdnivHuUKUpK
 cBvA7/YwxLsGLgcygJDH2KjeIms0isjyuT+yyHdPlu4wqeI6rVH7O1SMed9dloV/C/GV
 yzlrrRTsH1VvidDPQVbWRbABgiUrl2AN/BjajAPR/Pew7sVSSk+Pjy33cqBc7dYUFtnA
 +hnZGmpMnacxoWyQY324TVk+Vsocz2O36P1ipzoMfYWph51IiN9CXwioEjdUcMj8EJCA
 G/f/elk4lmKX+lGmTPZAHE+Koxh4ZkDPsxRwHrxt5zXZlPh+5soV/Ds7Pa6RHgnLO/Id
 9Bdg==
X-Gm-Message-State: AOAM5327dQiixhl15uzMqWq1WRo2+ak44J9gTy+JGHkKgkRL9+CV4gZ7
 C4WcWxrzeGvvRxJOfWxM5w==
X-Google-Smtp-Source: ABdhPJwZ69i+KxDCJdLyXXbkdUnY+k1QIC0WKQTQTKD8UaxeMwXblmqX/F1sU7XCejibDstsOhUa7A==
X-Received: by 2002:a4a:d051:: with SMTP id x17mr562987oor.60.1644264477617;
 Mon, 07 Feb 2022 12:07:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id ep17sm4757304oab.21.2022.02.07.12.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 12:07:56 -0800 (PST)
Received: (nullmailer pid 820845 invoked by uid 1000);
 Mon, 07 Feb 2022 20:07:55 -0000
Date: Mon, 7 Feb 2022 14:07:55 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
 krzysztof.kozlowski@canonical.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
 bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atishp@rivosinc.com,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v6 02/12] dt-bindings: soc/microchip: add services as sub
 devs of sys ctrlr
Message-ID: <YgF8G/Eed03xn9iI@robh.at.kernel.org>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
 <20220207162637.1658677-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220207162637.1658677-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_120759_140349_7658E843 
X-CRM114-Status: GOOD (  21.48  )
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

On Mon, Feb 07, 2022 at 04:26:28PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Document mpfs-rng and mpfs-generic-service as subdevices of the system
> controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../microchip,mpfs-sys-controller.yaml        | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> index f699772fedf3..b02c8bd72605 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> @@ -13,7 +13,6 @@ description: |
>    The PolarFire SoC system controller is communicated with via a mailbox.
>    This document describes the bindings for the client portion of that mailbox.
>  
> -
>  properties:
>    mboxes:
>      maxItems: 1
> @@ -21,6 +20,38 @@ properties:
>    compatible:
>      const: microchip,mpfs-sys-controller
>  
> +  rng:
> +    type: object
> +
> +    description: |
> +      The hardware random number generator on the Polarfire SoC is
> +      accessed via the mailbox interface provided by the system controller
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
> +    description: |
> +      The PolarFire SoC system controller is communicated with via a mailbox.
> +      This binding represents several of the functions provided by the system
> +      controller which do not belong in a specific subsystem, such as reading
> +      the fpga device certificate, all of which follow the same format:
> +        - a command + optional payload sent to the sys controller
> +        - a status + a payload returned to Linux
> +
> +    properties:
> +      compatible:
> +        const: microchip,mpfs-generic-service
> +
> +    required:
> +      - compatible
> +
>  required:
>    - compatible
>    - mboxes
> @@ -29,7 +60,7 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    syscontroller: syscontroller {
> +    syscontroller {
>        compatible = "microchip,mpfs-sys-controller";
>        mboxes = <&mbox 0>;

Removing the child nodes in the example doesn't address my comment. You 
still have them in the schema. IOW, this patch should be dropped unless 
you have reasons for child nodes other than I want to partition the OS 
drivers a certain way and creating DT nodes instantiates them for me.

>      };
> -- 
> 2.35.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
