Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D09C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYV8SJvwl4qS7No8SIBqG+p/XlfvJf74+BEKwOD1GCk=; b=Ld4yNS7rmTow/e
	jXlqdYp+Yo3oPkFIjiD/KnFuObvLXRfVd2fhdf3kyFVH6+N/2tfHwqFLArAxbfzXjLJsolG46ZSqI
	BZcp1xHbuU7OiZ1jfaNHhdct0Mv7qp+RzFytmqDvlSy2JebDO+NMBsCXA4JMZJDxQfmLRS9wnPhIl
	1XXQM954DYGJk5OwdN+e7jN5oBxJkzjbH4MTm9WgAk6mwbbdRUWfA5bGY20RrkucGa9YekIxsOLFB
	p3xiYmVqeqKHWBfIhkRnFJR0lRpvX8vNEsaXK8FaZhtHbnenxhOS7O0g44hLGPfoOaw/5ECs86JZ0
	Hnq6TcxGAt1UHpNcyD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RTI-001Nxz-OK; Wed, 30 Nov 2022 18:06:12 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RRa-001MfT-Gq
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 18:04:28 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-14279410bf4so21958758fac.8
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 10:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O92/4gRbBZHRaTcuTNcEC3gTvM1Cg9IfNLbdStTU/4w=;
        b=ncEsl9odpKKLhavcN1Ra47gcnccqa6uZX/8WXeOIl7xNHWGQjN4zerJkXWL4PQlc0Q
         3IrAfz1AoNvb4ynHoxe02SCyczi8ixP5nXdG8JqKPCHArp4jcOIy0SA4YgI9DesJ4KxH
         YeDcD5bwD5Xaik4jI1mgZcwwywj7vN7cQyGUzv2KQ34a4n9BlBzVhSmP7KwiLReUFnDG
         hr3FCmqUXjkq19oG1dbIK2SutScSo8ux5pTC24XvOhURtuKY1ieK2JwQu9Ufx6yzqtE7
         jzozXdmUfCMUlj4N7D4dKgcZm9qncLPnklgZEIlOsuVHyFvZ7LbIWpmh6iKRH4TPba+k
         a0JQ==
X-Gm-Message-State: ANoB5pkEzpNBbegEcojTWq/X9K+xs9oXhPra9bMT7FI28seBfbAZgpiC
	Dhmh/mQxJQhsAMvgKEUazg==
X-Google-Smtp-Source: AA0mqf6eVp8liyqBEwwxUaePBihI5WtgVxnCAjlpm1rxRun20hfKca4NFhBlYl+T7dO+q/0y0pLPBg==
X-Received: by 2002:a05:6870:e99f:b0:142:d085:c1cc with SMTP id r31-20020a056870e99f00b00142d085c1ccmr27521723oao.29.1669831463700;
        Wed, 30 Nov 2022 10:04:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n7-20020a056870a44700b00130d060ce80sm1509542oal.31.2022.11.30.10.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 10:04:23 -0800 (PST)
Received: (nullmailer pid 2535078 invoked by uid 1000);
	Wed, 30 Nov 2022 18:04:22 -0000
Date: Wed, 30 Nov 2022 12:04:22 -0600
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: serial: add bindings doc for
 Bouffalolab uart driver
Message-ID: <20221130180422.GA2527975-robh@kernel.org>
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120082114.3030-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_100426_608182_3C7570CD 
X-CRM114-Status: GOOD (  16.85  )
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

On Sun, Nov 20, 2022 at 04:21:08PM +0800, Jisheng Zhang wrote:
> Add bindings doc for Bouffalolab UART Driver
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/serial/bouffalolab,uart.yaml     | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml b/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> new file mode 100644
> index 000000000000..6cef956d33d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/serial/bouffalolab,uart.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Bouffalolab UART Controller
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +allOf:
> +  - $ref: serial.yaml#
> +
> +properties:
> +  compatible:
> +    const: bouffalolab,uart

'bouffalolab' needs to be documented in vendor-prefixes.yaml.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    aliases {

Drop, not relevant to the binding.

> +        serial0 = &uart0;
> +    };
> +
> +    uart0: serial@30002000 {
> +        compatible = "bouffalolab,uart";
> +        reg = <0x30002000 0x1000>;
> +        interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&xtal>;
> +    };
> +...
> -- 
> 2.37.2
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
