Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB31C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 19:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7aW2WnwtdQP0Pw6osHCYJJpqlYSi4TApy4iEB3saoKE=; b=ty496VGds1pIfc
	KO+b0cc/FQVyBEL/k2xFcC9e0aXsTnvk5KwvXl8AlCzmsMEtw2z63y3b17uIjqfenDyDppsA8OlXE
	4HYF6Jt47VJzAssvIOGkLQTa4TGISZKHj9Ktf3A3vFepzN7PVK0qhAQjtgBcwmpCxdk/T/Oo/bVes
	TIa1sME3agbERVOHcLicSSiQsJl9uBxYiTVzy4hGG/Gai0BFAuXjR+8Lzj6s1QDVehgyR8xd+y9ca
	8l8KSoovp2hODFRd39KVqlFVjfn6AbgJGaOTOrlS37h6FDgHCb+CbCr43dL4dswUxDNa3k5m9MmRN
	XbDExOHtu3U6Vg/kg++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyITP-002Tig-SQ; Mon, 06 Jun 2022 19:33:11 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyITM-002Th3-IT
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 19:33:10 +0000
Received: by mail-il1-f178.google.com with SMTP id u2so11726833iln.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 12:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tNX+fE5QMsC9Ks4TM/TrqMoy1piEYYRXSKM00brwA4A=;
        b=8AT6RjeZPQ/jOA4WfIE6LBgTHOGsSSjmBtfUrG6/xC9BPuA26rjIkVWpOx1ViEzUv8
         vyZfYM6UPotzDQFuj0Ls8lV5f0CDX/0wwJtiOguC9xoX+cjCDKnfSQfazQmxuz83RBOs
         3fVT/L1+XvqD3mZRDcG1JZJZuUNFJtqDEolDgcXZBLilKWy2hwmjDmMXPVZONMIA1Klm
         zCGHLFsKS7U8GZWqzN1tTiO3823GnQw+dlv15eRslycUXLlWdi7TiMm9y66lmf4HW0vK
         toat6XFEes6X64R6Ad2JyX4DRW1gdXwNHOhHC077mwWOV0yNZWO9OdLiFAWiMtXV6pOH
         uOBw==
X-Gm-Message-State: AOAM532YuEdZ09OSH5QV2TQO6f28V1siMikdAmudfLcB4axrNHurjwaK
	4XhNDehjU4Yv4QqDedxgSQ==
X-Google-Smtp-Source: ABdhPJz2HY7kGWq5THpXteEuhoYM4oFuFpHDe3x9h/zZZDyGDLS+35sEVRPBUr0/3gI2PdpHWAZGig==
X-Received: by 2002:a05:6e02:158b:b0:2cf:e058:8ecc with SMTP id m11-20020a056e02158b00b002cfe0588eccmr14792795ilu.30.1654543985645;
        Mon, 06 Jun 2022 12:33:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id v9-20020a056602058900b00669384fcf88sm3457792iox.1.2022.06.06.12.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:33:05 -0700 (PDT)
Received: (nullmailer pid 1127227 invoked by uid 1000);
	Mon, 06 Jun 2022 19:33:03 -0000
Date: Mon, 6 Jun 2022 14:33:03 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Support Opensource <support.opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Steve Twiss <stwiss.opensource@diasemi.com>, Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org, Atul Khare <atulkhare@rivosinc.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: i2c: convert ocores binding to yaml
Message-ID: <20220606193303.GA1124108-robh@kernel.org>
References: <20220606152557.438771-1-mail@conchuod.ie>
 <20220606152557.438771-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606152557.438771-3-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_123308_675638_FD1A2146 
X-CRM114-Status: GOOD (  26.76  )
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

On Mon, Jun 06, 2022 at 04:25:56PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the open cores i2c controller binding from text to yaml.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
>  .../bindings/i2c/opencores,i2c-ocores.yaml    | 123 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 124 insertions(+), 79 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> deleted file mode 100644
> index a37c9455b244..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -Device tree configuration for i2c-ocores
> -
> -Required properties:
> -- compatible      : "opencores,i2c-ocores"
> -                    "aeroflexgaisler,i2cmst"
> -                    "sifive,fu540-c000-i2c", "sifive,i2c0"
> -                    For Opencore based I2C IP block reimplemented in
> -                    FU540-C000 SoC.
> -                    "sifive,fu740-c000-i2c", "sifive,i2c0"
> -                    For Opencore based I2C IP block reimplemented in
> -                    FU740-C000 SoC.
> -                    Please refer to sifive-blocks-ip-versioning.txt for
> -                    additional details.
> -- reg             : bus address start and address range size of device
> -- clocks          : handle to the controller clock; see the note below.
> -                    Mutually exclusive with opencores,ip-clock-frequency
> -- opencores,ip-clock-frequency: frequency of the controller clock in Hz;
> -                    see the note below. Mutually exclusive with clocks
> -- #address-cells  : should be <1>
> -- #size-cells     : should be <0>
> -
> -Optional properties:
> -- interrupts      : interrupt number.
> -- clock-frequency : frequency of bus clock in Hz; see the note below.
> -                    Defaults to 100 KHz when the property is not specified
> -- reg-shift       : device register offsets are shifted by this value
> -- reg-io-width    : io register width in bytes (1, 2 or 4)
> -- regstep         : deprecated, use reg-shift above
> -
> -Note
> -clock-frequency property is meant to control the bus frequency for i2c bus
> -drivers, but it was incorrectly used to specify i2c controller input clock
> -frequency. So the following rules are set to fix this situation:
> -- if clock-frequency is present and neither opencores,ip-clock-frequency nor
> -  clocks are, then clock-frequency specifies i2c controller clock frequency.
> -  This is to keep backwards compatibility with setups using old DTB. i2c bus
> -  frequency is fixed at 100 KHz.
> -- if clocks is present it specifies i2c controller clock. clock-frequency
> -  property specifies i2c bus frequency.
> -- if opencores,ip-clock-frequency is present it specifies i2c controller
> -  clock frequency. clock-frequency property specifies i2c bus frequency.
> -
> -Examples:
> -
> -	i2c0: ocores@a0000000 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "opencores,i2c-ocores";
> -		reg = <0xa0000000 0x8>;
> -		interrupts = <10>;
> -		opencores,ip-clock-frequency = <20000000>;
> -
> -		reg-shift = <0>;	/* 8 bit registers */
> -		reg-io-width = <1>;	/* 8 bit read/write */
> -
> -		dummy@60 {
> -			compatible = "dummy";
> -			reg = <0x60>;
> -		};
> -	};
> -or
> -	i2c0: ocores@a0000000 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "opencores,i2c-ocores";
> -		reg = <0xa0000000 0x8>;
> -		interrupts = <10>;
> -		clocks = <&osc>;
> -		clock-frequency = <400000>; /* i2c bus frequency 400 KHz */
> -
> -		reg-shift = <0>;	/* 8 bit registers */
> -		reg-io-width = <1>;	/* 8 bit read/write */
> -
> -		dummy@60 {
> -			compatible = "dummy";
> -			reg = <0x60>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
> new file mode 100644
> index 000000000000..7074f019d94f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenCores I2C controller
> +
> +maintainers:
> +  - Peter Korsgaard <peter@korsgaard.com>
> +  - Andrew Lunn <andrew@lunn.ch>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,fu740-c000-i2c # Opencore based IP block FU740-C000 SoC
> +              - sifive,fu540-c000-i2c # Opencore based IP block FU540-C000 SoC
> +          - const: sifive,i2c0
> +      - enum:
> +          - opencores,i2c-ocores
> +          - aeroflexgaisler,i2cmst
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

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

These 2 are covered by i2c-controller.yaml. Drop.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
