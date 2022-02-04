Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6272C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 22:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UO0FVLSL383i95QI8P+/M9yW/cWV2PlSu/jZf2BcZI=; b=cmmI+Cnn7spF2P
	tqP3BcNGORQaCX13UMSImBRAegve/He+OYfGaiIIW8wrMretRQK1Oxr8nknf0c2u8rKfnwDkmz3Qi
	ioY3rinqIQhefJHna7lxFyh6UBqaBTnzWd2hY9e5ofRzB28OCOrWVP/ZTqM1betHLICOrG4fVONmo
	hvDVr8mHc0oD4KZ/cSzdokqN8iI+3EUKZ8rwkeG+uwDCEhm11RXWNkAEs0cmd1MvaRRkGVCBqAut9
	8GHz8L++TBCYJPna7FBLqvgjT5X/W9P4KqR2w3fW7V71esCD4Vm6Va3jbuaNstNxjSvXQVRvgaiB3
	BKLjTbskBntA87s904fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG7He-005baC-LB; Fri, 04 Feb 2022 22:42:26 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG7Hb-005bYp-Ps
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 22:42:25 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 c7-20020a4ad207000000b002e7ab4185d2so6274854oos.6
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 14:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lP3WE7JtivIbbn6LHF0khOL4rKdYsCSiJsD462pPHBY=;
 b=weECn+A47NsVQoed+80llzLwOzT4kFwEWTbr0ySEESPCReLw8pzm11bKwaUgX2JzeR
 BmTNkveyDYNked5H8rrIADwIgwasKW4zba3RwJEn3QmVNyg0YfDBR7Tr6OE2IKvYIsbr
 8Uym/kzJgw9TbGqH/4XlAaLel6YfY6IK/outTj46Z2/vtXmS1kiWF2hrAFhH7LFokyao
 wS4RPRQoRq8gltFbxgubWFqQZQQFfKUqvK4N8AOSt9QDHDSAM0RCsLAvaZ8Rnf7e6tbg
 Kzuj0v0ObbfCPAZwCYnTdy23XwenArHBJPwj/5iEsCThpp1X0UeowEaJEAbHeM1L7Y3Q
 Jfwg==
X-Gm-Message-State: AOAM533eer9T26pEVPYsJRYpw4IhNKFvzU9tFajKsVeTZjQy+VLT0hye
 Z4FrJk3FCZT6JzMkNZvDWg==
X-Google-Smtp-Source: ABdhPJxVaf+4ZTBMzOJSreSX+RID7NpMWwfoG41VUga8SLqyOukGfB/pJ1h/HM5rXCQJ3mZO+Jze8w==
X-Received: by 2002:a05:6870:a2d6:: with SMTP id
 w22mr299541oak.25.1644014541095; 
 Fri, 04 Feb 2022 14:42:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bb16sm1307877oob.42.2022.02.04.14.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 14:42:20 -0800 (PST)
Received: (nullmailer pid 3318547 invoked by uid 1000);
 Fri, 04 Feb 2022 22:42:19 -0000
Date: Fri, 4 Feb 2022 16:42:19 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com,
 bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atishp@rivosinc.com
Subject: Re: [PATCH v5 02/12] dt-bindings: soc/microchip: add services as
 children of sys ctrlr
Message-ID: <Yf2ry0ATtYnb5TTx@robh.at.kernel.org>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131114726.973690-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_144223_851316_AB71A060 
X-CRM114-Status: GOOD (  21.10  )
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

On Mon, Jan 31, 2022 at 11:47:17AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add mpfs-rng and mpfs-generic-services as children of the system
> controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs-sys-controller.yaml        | 41 ++++++++++++++++++-
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> index f699772fedf3..5e9977bc114e 100644
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
> @@ -29,7 +60,13 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    syscontroller: syscontroller {
> +    syscontroller {
>        compatible = "microchip,mpfs-sys-controller";
>        mboxes = <&mbox 0>;
> +      rng: rng {
> +        compatible = "microchip,mpfs-rng";
> +      };
> +      sysserv: sysserv {
> +        compatible = "microchip,mpfs-generic-service";
> +      };

You don't have any resources for the child nodes, so they don't need to 
be in DT. Just have the driver for "microchip,mpfs-sys-controller" 
create the sub devices you need.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
