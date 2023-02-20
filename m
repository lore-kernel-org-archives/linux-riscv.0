Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9BCC61DA3
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 23:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyRzbMEmd9tCX44PCGVl2k8Czivzvo9J62P7c0gf5IY=; b=UTf8qUYj3mnxnS
	DdNj9kAl0RnmG7MKLNI08aXGUNQ9ieNSQFA8ZbLLws9MtOT9dd4/9ijcsGPNL4R8Cj5uyJLL6iaBZ
	Gne3Q/2XoylV3EO7LxOAVSJKwY7jz/HEjun9R/1pHyciXB3ielsdaIui0XJjs8ejkewR9otMYPJhJ
	GPaNaeGbCDVBHxY4e6mlCkV4isVBPgnapJagwVCNvf84RY30HdOTRxVSbuu2mnjpdpgE1AcjA3baR
	2T+0e6Z2chNdtpDLT3TSEnMyjwPNkRo6GXPv0qAUxTh0nCiaqP/pbRa5xNVXsLmsbk7DXyz6tmr7R
	xAZ0DMXgxNxvqfsBhj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUFou-005xGd-Ru; Mon, 20 Feb 2023 23:43:44 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUFoq-005xFQ-FX
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 23:43:42 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-17213c961dfso2626980fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 15:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeJOLdeEl+yXgjAhl7LhKSHnNfddVQHGyrv16jc4d6s=;
        b=IUr3C58UmtEQjpr1oa8NJcYfAylyU+QCbrQva1/wLqng0s/hZLHxeYwBo/sfcvEpjW
         uB1CUS36l14Zogp5tzWm4dwrYbHYVswYRX6BUnF+NldZ2w6SqQrp70QaEx8QQ3dbANMj
         mcbDfuIx/YtGGO7vDi2WMi9/sBsWzbdGD/TIWC5g7EON0xG+Q96tb53q9gsuIbR4J6LC
         uqDG/DSciIdSoHfYKuCYcgjFPNfZNuXlwEB17KpXDsr9oAppNRsNCHf6JYMmO4BkJy+H
         S57C4NxjFlpz0aTSenI45QB1PndmkthS9E7FW14BeH7ER2XVqKj+qiZ+4eG4QQq4wqko
         i6fw==
X-Gm-Message-State: AO0yUKWoNoL2aOisXhM8Fd1heV1LTZkYuSIcQ4Ykq9HCZOQv05EfXBJN
	7DpFilJycbX+MUeUbjhdroDRevKXoA==
X-Google-Smtp-Source: AK7set+oaLlcAaz3GBVoEx9R0WvBFgQQNyYAjjorvsvo0n6o3lXE+kwePpv8yWNjSObzdDBTXU3vNg==
X-Received: by 2002:a05:6870:17a3:b0:16d:f8aa:9fa8 with SMTP id r35-20020a05687017a300b0016df8aa9fa8mr5591332oae.12.1676936616888;
        Mon, 20 Feb 2023 15:43:36 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dt22-20020a0568705a9600b001722d0e365fsm2359oab.20.2023.02.20.15.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 15:43:36 -0800 (PST)
Received: (nullmailer pid 618228 invoked by uid 1000);
	Mon, 20 Feb 2023 23:43:35 -0000
Date: Mon, 20 Feb 2023 17:43:35 -0600
From: Rob Herring <robh@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
Message-ID: <20230220234335.GA615198-robh@kernel.org>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230215113249.47727-5-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_154340_934958_6EC9F0EC 
X-CRM114-Status: GOOD (  16.11  )
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

On Wed, Feb 15, 2023 at 07:32:49PM +0800, William Qiu wrote:
> Add documentation to describe StarFive System Controller Registers.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../bindings/soc/starfive/jh7110-syscon.yaml  | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..fa4d8522a454
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/jh7110-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC system controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description: |
> +  The StarFive JH7110 SoC system controller provides register information such
> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - starfive,jh7110-stg-syscon
> +          - starfive,jh7110-sys-syscon
> +          - starfive,jh7110-aon-syscon

Is 'syscon' really part of what the blocks are called? Is just 'stg', 
'sys' and 'aon' not unique enough?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
