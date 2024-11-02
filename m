Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431D1E67497
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 03:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOvzDJQfvm5Lw5jDF2E3x1E1LW9Fz3lUn64zngWURg4=; b=u5fI7o6aTa+gCA
	TjJY3zIx32IA5T/FTxgEBvPSMTKfzl/8Fp7IX6nrjJZuXZRqnqsMAzklkCQBrANO01NfMuRtUlamz
	DiflHcc2Bhvc7j44s2fHWqS9Kk5LNSpLSEIH+89IthEcemZaq/EYkwGZ7TOt6CHDJ/X8SRLAJGIwe
	QN/yqqcpLY77/4p2I2Sia/8DZztHTVaLhwhRyyK1h9+AoBwb26czXkrGciGvvLEFviHaiwx+9Q7aL
	P5l8rLVmyeYI308hcuLnv9Uz8hV16B22dyGH7Z+niAaT4IxLj4I6YMtLh/yTWDE0YKZq2520LdtUS
	RDIKg9Yr7jAK8ssdadgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t757m-00000008yDO-2f7O;
	Sat, 02 Nov 2024 03:48:30 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t757j-00000008yCt-2sFk
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 03:48:29 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-83abcfb9f39so78709139f.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 20:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730519306; x=1731124106; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFAxfJPYMHZcgM/IbSJdK8jCoxixwBpatcLPEMEnlyg=;
        b=h/QYUIAd9cwyTEA7AXyAQ597aK6mjVzqXnz08/4gaCPdHtBl2NLh/i8D5NW/7pDgQr
         iDgoIQOJeaazi5iMXT8m2fxpiEkpFf2sbSgM+j5RApezBcOTDsenz3ZfmjHQypf4Aeaf
         fWCF1FWxe5zOzfu3iqs/68sljLj6/yc5vvgczBK3XlsKcvmVfOv1kod05cwBUFNwQQOh
         uhUoQ/KflAswRX2z7YLNSjG7/BmuPHv+RTeM6kTNrhjQGG/36vao5W407R0JRERY0M0r
         25dcQWBgQ77TwUCPtP6iVKa+anzZ+WyM/4jmRb7fHzn9etzSn2BrN7TkeUTx5QjCYj+i
         EUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730519306; x=1731124106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFAxfJPYMHZcgM/IbSJdK8jCoxixwBpatcLPEMEnlyg=;
        b=vclj0CI4FCC1un8u62eQM/MPg2kXVt+5asW/NqPBDfzRPU6qthaWFfREAbAu4aD0ns
         M5nsi+wyq/Yi9O16XQ9El6G8NrokYZnWLCtuS9Mfwmma/JxMzGQWELdJmRTBGSntdJPq
         N/hbD3bsEPLz1WFvgUG0cvWJcnavb2Y3phSiUjHALQhZy1K/ErAEyWvJMmVNhBYyXhMV
         24q4QpiQftq1500yyKfptzRizc9H8fIgDFbdHRa5Uwxe4NdusZq4x1JoPU5Vohedkadi
         s/JabK2UnuLd8mQKGhS9nDQYWQKyQTq3GX08oEDWMdDG+jWQrkoC1Uch6MUB4k7sasjN
         hbPA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5AzMkgfarKJWQLOVVJoZb/UG9Si1AQ1exCO9/fQgZXrHOynkrBvfrYeQu8wcoHL2aeVRcuKP+dUpbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGKBDQfw8ksP4I9t1zl/Q79b+5qWJRPR8OFGxuM+Oou1TzdVqm
	GW68kMMxZv25ftsGjIVNcrcz293q1xcZKZf0TL7D6bBeIAhGLfR1tzRtNeHDa2s=
X-Google-Smtp-Source: AGHT+IEjX1mR0HcedUZXdXQVrMhUH8jXN4cBozN2zssjtGKah59T7pHiVZuQPT9WVqvySZ4MDCEgRw==
X-Received: by 2002:a6b:7e44:0:b0:805:2048:a492 with SMTP id ca18e2360f4ac-83b7133cf86mr460121839f.6.1730519306354;
        Fri, 01 Nov 2024 20:48:26 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b67bb57a5sm108525239f.28.2024.11.01.20.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 20:48:25 -0700 (PDT)
Message-ID: <846b4f2a-602e-431e-affc-0e995db5eee5@sifive.com>
Date: Fri, 1 Nov 2024 22:48:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20241028053220.346283-2-TroyMitchell988@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_204827_781169_947F2F9C 
X-CRM114-Status: GOOD (  15.84  )
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

Hi Troy,

On 2024-10-28 12:32 AM, Troy Mitchell wrote:
> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> and supports FIFO transmission.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---
>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> new file mode 100644
> index 000000000000..57af66f494e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C controller embedded in SpacemiT's K1 SoC
> +
> +maintainers:
> +  - Troy Mitchell <troymitchell988@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-i2c
> +
> +  reg:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1

Looking at the K1 user manual (9.1.4.77 RCPU I2C0 CLOCK RESET CONTROL
REGISTER(RCPU_I2C0_CLK_RST)), I see two clocks (pclk, fclk) and a reset, which
looks to be standard across the peripherals in this SoC. Please be sure that the
binding covers all resources needed to use this peripheral.

> +
> +  clock-frequency:
> +    description:
> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
> +      modes are supported by hardware, possible values are 100000 and 400000.
> +    enum: [100000, 400000]

This looks wrong. In the manual I see:

* Supports standard-mode operation up to 100 Kbps
* Supports fast-mode operation up to 400Kbps
* Supports high-speed mode (HS mode) slave operation up to 3.4Mbps(High-speed
I2C only)
* Supports high-speed mode (HS mode) master operation up to 3.3 Mbps (High-speed
I2C only)

So even ignoring HS mode, 100 kHz and 400 kHz are only the maximums, not fixed
frequencies.

Regards,
Samuel

> +    default: 100000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@d4010800 {
> +        compatible = "spacemit,k1-i2c";
> +        reg = <0x0 0xd4010800 0x0 0x38>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <36>;
> +        clocks = <&ccu 90>;
> +        clock-frequency = <100000>;
> +    };
> +
> +...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
