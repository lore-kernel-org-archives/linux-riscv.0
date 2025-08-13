Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3C5C87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5QTWW0CtIYdvoLItXMU/gx3du9Q/yN7FTLCyC2H9/E=; b=B47IkyDpzy7VYi
	Bii7Ut8Y5lN3/jgnSNyzFOlgqA+sXhHiY9HnGzoHn/rxH/J+qKL7uOhwynnfN/AHsr1eODMy/rR4u
	qKPPCWakdWGx4khy6UDIpwz3yTQGyGRg2yIfla0oFW42CHRNww8hx77J6qEnwWmLV3wJrpqy9JM7r
	Ot3660ZOYrEVqdNA2tdElYbb87Dkb7MmXCw8Q4vIf37Qc5t44pgUwPLsRUm9CghUL5PTlHWUXhTw7
	jwWiqh0kIWb2pQCzAcnbLhvWfABT501q7bZWCRRKSqRL8C8g//0FYY0ajGe+4xk9RJWeIyZPCwvV4
	tTxt24loX49dEXr68YYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBOj-0000000DkSm-0xvZ;
	Wed, 13 Aug 2025 13:20:09 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umASU-0000000Dd5i-2xe4
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 12:20:00 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-32117db952aso5375504a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 05:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755087597; x=1755692397; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXIuy8E0rJ9utYVbR4lh364PTlYdCZUkNdbi7L0pG7A=;
        b=T2qiM8f6SSwFoX48NUwH/v6/D2hm7i25PfPyOLvz5do9rhQlr31F9/xuEiTpbzL8kx
         E/Df9J1cviDouEPYwcktceEcVfMU4Ai8TjetnZprlgJ7vysz5+ccvXfbW/btmnvUhMiJ
         35Ynz7tHVt+02Fw/4iodMjYAghAIkFTCxDnJrbqiRYIdJ9iFhXiYhGdTqcjla+jTbuK8
         o31m/YLv+RnXRNT7pqEruV5nskZRB7bAqRw9Pk/PxHH5H9J4xNxO8RvAGvbXENkYWcrS
         aIDHZYRA0206CuIedFQXIJlHSo2JvkCtCEH9EJzJzJETt1YGCfFsOXWG4lSmF93HHEhD
         Ll8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755087597; x=1755692397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXIuy8E0rJ9utYVbR4lh364PTlYdCZUkNdbi7L0pG7A=;
        b=GdgE4DRDp0+ESwVuxcHa5/i8BoEkw6uOcax3uwxjsl/4+g5LxwILnOm80qHGfgJIOt
         Hm6j1W5SW0+sApikbc+cnlsV2jSYz+O52K9/TvfP8aXTHt8F/togt5sh1EXL19SoZa+p
         win2WDlFq4489fJUpxcrTFpWk2+k+wK/0UugpVOvaAvJh0jWZj0alZfNEzxa1fNof8Ox
         PA3zcIGjxJg+7IN8E4Pu4ETJFGiD9bpG1B9K/lkr0dPY44S5in0/ULwDcUVXTSSf7YMl
         M15WgdkWW7CbSBDgRO44GlR3VZ97/C5miee67ikmSSpJqCfru68aG9VG1NMbPJ/kueH3
         YIKA==
X-Forwarded-Encrypted: i=1; AJvYcCVBN3Qejqqkjb3ggxcJqOeQ/LNFdZGNOLY32wXED5Unal5hYmOl9E4Eh8Nl02yQDpxSFWH4ELEcYnh0YA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXosEh7yo1R0tK4fC7s1TiPqYySnUWYL/jISX7rmkzUDbKYCGU
	3iRPH4ogNZI7o5JLx9e8mEzzGej3vlkSNUMBuxdaRv6Tink7NLuSvzU3
X-Gm-Gg: ASbGnctdrQDmDHNFhmVG+2/NBHDTmk3VN0z3ve5Nah/FTrJXC2jfjMAJ6CzDn7tq+gU
	PxoxU745DQ9S1aCXoBnN5pPSENLGITW5NAoiwf6atmUbuNcWxdMm2e3MnL+O3mNXCKP5nGKg+yl
	GRioBtkt5xZr5mhdElh+gChuxO7tmRqHktLdiFjsFytSHW0doMxJSFJSeiS+w6k6eM18J67WiWk
	acrUE78KjzgoaLxC5OfsA5hxyhkp7fxCq7bHD5UF4qa6DCnwJTWBVmWhrWKv8wQfMry0o3Tx2KL
	x1YdXXiUMrG3JVdZeB5armZHOGnFzE+4FVxQZAdrNpqTgL5sV4y1atx5FbW1NO2f7qDrp3fJG/d
	Hj10r+SYWkjM6zPwpj0yLKil13K0Evb4=
X-Google-Smtp-Source: AGHT+IEFlXvKJVszOuCgY2L3pa333NYha1FOY/G7JfVFhsfManM3a/rZhg0qEyDVkRt5u2BFBdgGqQ==
X-Received: by 2002:a17:90b:1a8a:b0:321:1df6:97d3 with SMTP id 98e67ed59e1d1-321d0d42332mr3886934a91.4.1755087597351;
        Wed, 13 Aug 2025 05:19:57 -0700 (PDT)
Received: from localhost ([2408:8256:2289:c8ae:c016:1fd0:d59b:62c6])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3232580316dsm23954a91.16.2025.08.13.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 05:19:56 -0700 (PDT)
Date: Wed, 13 Aug 2025 20:19:50 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 1/7] dt-bindings: mfd: add support the SpacemiT P1
 PMIC
Message-ID: <aJyC5q0X8mj1xbSB@troy-wujie14pro-arch>
References: <20250813024509.2325988-1-elder@riscstar.com>
 <20250813024509.2325988-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813024509.2325988-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_051958_746117_C72A615D 
X-CRM114-Status: GOOD (  18.84  )
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

On Tue, Aug 12, 2025 at 09:45:02PM -0500, Alex Elder wrote:
> Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
> only the RTC and regulators will be supported.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> new file mode 100644
> index 0000000000000..5cc34d4934b54
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT P1 Power Management Integrated Circuit
> +
> +maintainers:
> +  - Troy Mitchell <troymitchell988@gmail.com>
You can change it from this to my company email:
troy.mitchell@linux.spacemit.com

Acked-by: Troy Mitchell <troymitchell988@gmail.com>

                - Troy
> +
> +description:
> +  P1 is an I2C-controlled PMIC produced by SpacemiT.  It implements six
> +  constant-on-time buck converters and twelve low-dropout regulators.
> +  It also contains a load switch, watchdog timer, real-time clock, eight
> +  12-bit ADC channels, and six GPIOs.  Additional details are available
> +  in the "Power Stone/P1" section at the following link.
> +    https://developer.spacemit.com/documentation
> +
> +properties:
> +  compatible:
> +    const: spacemit,p1
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vin-supply:
> +    description: Input supply phandle.
> +
> +  regulators:
> +    type: object
> +
> +    patternProperties:
> +      "^(buck[1-6]|aldo[1-4]|dldo[1-7])$":
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@41 {
> +            compatible = "spacemit,p1";
> +            reg = <0x41>;
> +            interrupts = <64>;
> +
> +            regulators {
> +                buck1 {
> +                    regulator-name = "buck1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3450000>;
> +                    regulator-ramp-delay = <5000>;
> +                    regulator-always-on;
> +                };
> +
> +                aldo1 {
> +                    regulator-name = "aldo1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3400000>;
> +                    regulator-boot-on;
> +                };
> +
> +                dldo1 {
> +                    regulator-name = "dldo1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3400000>;
> +                    regulator-boot-on;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.48.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
