Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E511C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 09:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5H0DC0WS81TB4rT13zfVrk62ASO12BCGLG1BC+v7gQ=; b=nuXRHmoIXmzmdw
	gtt133daD42+O363IwqqZFFH6weAfD16G/C/JWCFPbbT1gaKlnSJ10AVSftIysAJ8Rj0Lpy/K70UD
	iX223mjvR3i8Yp6nelxOjfS83Rt+cPdjfWG/zVUAyH8jZUX0PWQFo0Oj+RrzyyKA95aya0QIRb5Pt
	cERm2F7NxAw0p/Ncjh3gvX0od8WwyMiO1ceuOYn5bRNxZOU1nDT3bCxcjHEPS/N7yjASrZtOK4rYw
	RszkKc7XwO9uBKYwjjrm4iF9ylnQ8f0WyMPtGn25QsYuLh1BTn5Nj6B8IbW3gXMiAwFQuntZmXdoT
	MkFgouZ44NTTAK39POhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisBM-0000000EMht-1SW5;
	Fri, 14 Feb 2025 09:40:24 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisBJ-0000000EMhW-2VHq
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 09:40:22 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7be8efa231aso196596885a.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 01:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739526020; x=1740130820; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ltnVdbgyWl/+t2lriesNcGGsbLyc+7ozvoFh97YkJ0=;
        b=YExAQO9UHZdvNtETCV+nNmtmHXX/BRknp5zc+i0cPzgNRJsgKgvSq5XUIYBuGdkP0H
         n1Cairg2jcQDKAERGsVEe9D3vPljJHVj3ZzPzAnM4mQm6kC0W4eM8CbGWqor7lchp1hX
         kgKzKUD82sSVchU0boG0aps4PEgikD1WXWaOBO6ux51OB2OGAeUEdMYfXk6CuW4Yva2T
         XHUUj39cypFz16QpDGqW24gazTkYMYiCOnsHx3zEp+mXTL2lTilNgnTdfby3n9lk1lPe
         K8iA3E2xEjjaDabldRS7Sgw+EQis0LXXA1mZpHkYbc64ZyyOqzHiGREiWW9H2UqWRoWa
         oMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739526020; x=1740130820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ltnVdbgyWl/+t2lriesNcGGsbLyc+7ozvoFh97YkJ0=;
        b=THF1rQWSb022T1Mb8oMJwZfpSYuoksjLvbGC1u2VpanCYKOLzLl03Gkvbg0SumqDGO
         Gss4+Dpk87+sRSoMhwPtRKMNauH7EIAUp6AROaHsGp6nFNVVcRpnkZet66lLYcIOG+F0
         +5KM4w9Zzv2WAXHAi693XS7Wt+nQeYwp/Y5aSwUDtg/8QyyyOOyfQUtXmC4yOUZppn53
         y21KPIeocZQAgKqX9ai68X+1yjLRYCFkXcidF3qBudCKNJ5/KzamFxhYb8IPVFaFShne
         fkS/RYcqSSSVTQz2kcq+Dai5Ef6OnOEH8G0kBOy3nAWZNAQZpLGfGmC477hPsBoFhtA/
         rXuA==
X-Forwarded-Encrypted: i=1; AJvYcCXtenwajXAqJO/dKKMGH6c/4vuw3/kg3SwfY4zcV4nrc+gW4VNl4FJvqtf0f7QkBLx+lK+mXAXJaahB9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Zkheg/HyRU7jr5pW2CrEZOOv6LPN/G+MBEvKfjpu1l4xFSs4
	/oz16cGJV6ZddFoCGl7Yh1DnxRItvMFaR65ejIRyzrX4olBeGluT
X-Gm-Gg: ASbGnctev3oQN0u8goiCTb+S0OEDHhQWDPcMy4T7CwrLmWVrHWz1YMdWsh8fSo8mvnp
	lHSDuj9CIbOLW348CPz13Wwpa9RobXWoGEclj8NSRMwQPi6u2TALO5Lgu/1ufe96aoO4DZlZH+7
	V/m2VTPmAKXY34JW2i8xA2ux1XiFY03g6pvR53pBS5ZsFqYwaaCzCFPsque5D5D6B5ya5GMETM0
	jd5IcVj8jfMZRr+kaxNniA5YNIjudKLY/FqFE35PedtQg9yPixjzqbRaYddJuP2EA0=
X-Google-Smtp-Source: AGHT+IEAaWOHdRIBYEDb2EPJpgpRyzUZ58tWTfkhcKSw9SF80+/uXHiUKELTnqkLF3A1dKQoSa4BIg==
X-Received: by 2002:a05:620a:2d86:b0:7c0:7207:600c with SMTP id af79cd13be357-7c072076382mr937351085a.41.1739526019938;
        Fri, 14 Feb 2025 01:40:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c861552sm187614185a.79.2025.02.14.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:40:19 -0800 (PST)
Date: Fri, 14 Feb 2025 17:40:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, alexandre.belloni@bootlin.com, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, dlan@gentoo.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
Message-ID: <t6z6rikut2him5m57b6xubbguw3llczp4i6d5frcpuhlqihf2d@booethzadxsq>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
 <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_014021_645284_44217BB4 
X-CRM114-Status: GOOD (  17.90  )
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

On Thu, Feb 13, 2025 at 10:56:45PM +0100, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> 
> Add RTC devicetree binding for Sophgo CV1800 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  .../bindings/rtc/sophgo,cv1800-rtc.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> new file mode 100644
> index 000000000000..b36b51a69166
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock of the Sophgo CV1800 SoC
> +
> +description:
> +  Real Time Clock (RTC) is an independently powered module
> +  within the chip, which includes a 32KHz oscillator and a
> +  Power On Reset/POR submodule. It can be used for time display
> +  and timed alarm generation. In addition, the hardware state
> +  machine provides triggering and timing control for chip
> +  power on, off, and reset.
> +
> +maintainers:
> +  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800-rtc
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
> +unevaluatedProperties: false
> +

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc@5025000 {
> +        compatible = "sophgo,cv1800-rtc";
> +        reg = <0x5025000 0x2000>;
> +        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&osc>;
> +    };
> -- 

Just for curiosity, Do you leave a way to implement the
8051 subsys, since its registers are in rtc. (You can
check the chapter "8051 subsystem" of the SG2002, which
can be found at https://github.com/sophgo/sophgo-doc).

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
