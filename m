Return-Path: <SRS0=igOf=LS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EBCC49EA5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 21:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B0CA6008E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 21:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B0CA6008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LesCUAdmcw9YOd7kihX1LD8c/M0S6YaAvmQXa12mfE=; b=fFZ0BygHv0qw2S
	833h/DbpNj0L5DbnEP93Q/Xb+DCuN1nIh3EP7qWiNWdv7NT02R2hEskOllPtcH2Ly44af0dOcFdrR
	0BQZfUaGQUDiUzNT0B8qmJDfLoGQMZHOoR4B15EhIavNzWoUmzUYDJd5aWMyhy/u5FFf7ve0V6ikh
	6tgN6QgWnROtPfWB2QZhddF7Fk1OpDHzMlvmqbjzQqrlLtcgqO1nIAw0oGN4Wy1bu2x/RH7R7jXIK
	Acf6zBKMolrjhFLlrr9gn/WO7OQFaOajinFFM2PS+kdgZz+MpzKh6rjJKT8Szah5vqHkPgYPbvIFP
	3bLJwLNzB9L5B4l0Bo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwWlx-00GLJv-OJ; Thu, 24 Jun 2021 21:20:29 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwWls-00GLGk-Bz
 for linux-riscv@lists.infradead.org; Thu, 24 Jun 2021 21:20:26 +0000
Received: by mail-io1-f43.google.com with SMTP id h2so10031585iob.11
 for <linux-riscv@lists.infradead.org>; Thu, 24 Jun 2021 14:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SdE3QH9IH0zgQ0o6AzU3ezQaPTbrlo0dJaYPuQ4zJMg=;
 b=BNenM1im7XhHSEGEN59PJ3bfdbom7alGf67PuYiWQV7f/w/4Pp9+HV4wSEiyoSb2yv
 z8Krzm7yxsnRBqxsllautWv5XLBgwx+G/cpSvX7pv+O5uwvDXPfI+n+OfjT5RHRaY+TW
 6tXsmZWSyxJbFsCs7IHA9oircLGiS57s1C3zXMpFDwoUq1TeHgw67io5BdATNbf//DmU
 FMKBv0hIUGfz8KukK+3qt2avyLtFMRDTubutOs5Bl2TmJ9vYwGetmX0zcp/Cxn9X54OL
 NjYF+Vl2uSvzBDmd/brPKDqplukp1tzH16EWjhqgUgZ4lT9aROvgdTNY60JSmigmtxB+
 S9lQ==
X-Gm-Message-State: AOAM532sBu0//O7FGJp9nuZlIJvqkFQ9gKFarRWSOVsqpia99bot8gP1
 XY6dgc1hYgyJNjfOxP4nyA==
X-Google-Smtp-Source: ABdhPJxZn6wIu1x3OXf+DxLhKGIb9idVzloiuJ8I/aNonOKkgdSNXb3w3PydCIFU7xhWnnkRbvhcPQ==
X-Received: by 2002:a02:cf82:: with SMTP id w2mr6452503jar.3.1624569623451;
 Thu, 24 Jun 2021 14:20:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id l11sm2452159ilo.77.2021.06.24.14.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 14:20:22 -0700 (PDT)
Received: (nullmailer pid 2005523 invoked by uid 1000);
 Thu, 24 Jun 2021 21:20:18 -0000
Date: Thu, 24 Jun 2021 15:20:18 -0600
From: Rob Herring <robh@kernel.org>
To: Drew Fustini <drew@beagleboard.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Fu Wei <tekkamanninja@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: riscv: add starfive jh7100 compatibles
Message-ID: <20210624212018.GA2003868@robh.at.kernel.org>
References: <20210616202654.578870-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616202654.578870-1-drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_142024_529080_AC7B5D03 
X-CRM114-Status: GOOD (  17.34  )
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

On Wed, Jun 16, 2021 at 01:27:00PM -0700, Drew Fustini wrote:
> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> BeagleV Starlight JH7100 board [2].
> 
> [1] https://github.com/starfive-tech/beaglev_doc
> [2] https://github.com/beagleboard/beaglev-starlight
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> Note: my patch to add 'starfive' to vendor-prefixes.yaml was applied by
> Rob back on June 2:
> https://lore.kernel.org/linux-devicetree/20210602163200.GA3513985@robh.at.kernel.org/
> 
> I ran dt_binding_check and dtbs_check: 
> 
>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
>   DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml 
>   CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>   DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
> 
>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
>   DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
>   CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
> 
> The files jh7100.dtsi and jh7100-beaglev-starlight.dts are in the
> process of being cleaned up for submission. The current downstream is:
> https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive
> 
>  .../devicetree/bindings/riscv/starfive.yaml   | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> new file mode 100644
> index 000000000000..4deae9f5c60d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/starfive.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive SoC-based boards
> +
> +maintainers:
> +  - Michael Zhu <michael.zhu@starfivetech.com>
> +  - Drew Fustini <drew@beagleboard.org>
> +
> +description:
> +  SiFive SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: beagle,beaglev-starlight-jh7100
> +          - const: starfive,jh7100
> +
> +      - items:
> +          - const: starfive,jh7100

This alone shouldn't be valid.

> +
> +additionalProperties: true
> +
> +...
> -- 
> 2.27.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
