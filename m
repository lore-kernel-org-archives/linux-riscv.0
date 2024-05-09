Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A61EC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGx1gFQmmxtZv62xhz0dsALZDgThw+HUG1CsXD+TpZE=; b=3STdKrZ3FDg+Ie
	3NEXm6gvBjPbJ3rhOHTkoXz9l879cmeTSxcsU6op/ccu9VUEQMpTdyaHAsbO5ZtloL00mcfKhLUW+
	OEujcjrCKDdFNRe2MEa+H5NdfN1MHz9YRsfyAQ9ugeLv6aOEZ0DJJUZIEw2mKVfl5fNl2Doawdhwe
	Qi3sTQVxK6l0hmKkd5ynjGc2wFUKtPNEsgCAey1go4gO58NYhUZSQprR8Afu3t0Q32Ala0CKC6gTB
	bAsJJkyAdzHWf6RQU03Lv+NYY98DYhPbwCRIzarXVxmyyAYIjn7kzOlcyliP85xjIYrLjHzOBj2c6
	mULIxik3AmCbN3XNXo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5ARI-00000002mr4-1eLn;
	Thu, 09 May 2024 20:32:28 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5ARF-00000002mp9-0gV9;
	Thu, 09 May 2024 20:32:26 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6f09ed75e4cso683553a34.3;
        Thu, 09 May 2024 13:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715286739; x=1715891539; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WgzIChNHOybB6YvtmtKRO5fmRYHJDfezozAjqZ0oqsY=;
        b=NeYu6gbwM/MNqc0FOw2NZv1grp0ZWakrhyhl7lXDtw0YD1aGUSs97jLQQBMiJEinGy
         MlE9BaftNj7sKt2V+grR/Tn7df4P+PeyavXzFS2IQjlxdMShcpK58ukxJekwMgP48SPf
         T46el1grhgfVH5U6ijtrP9LRtnOiSiZUhPKIyFkxqhyW6yKmAsQ8UQ/iKdZxRYYB06b2
         IthG2J4tZYqjiv08i96E5WsvTWlIsnjnQwUrVNLs0esVfEsQ3ou+EIjqRhdY5Ga4hxVl
         VQmI/2YrQCSECGoc+q3/8bq0kyCe/NHNEmfHa61gesBIcBzpPt1M4/Nhg+JJkDVJMD3S
         at1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715286739; x=1715891539;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgzIChNHOybB6YvtmtKRO5fmRYHJDfezozAjqZ0oqsY=;
        b=pCFJsRgLpEqbgDwEHe2WlKq3+lY5AlQYB4XT4gIBDAWAdZFcwxYr1D4JwOo/wRaqhz
         KGsPzSXKZkNlvHAupkLFka+u08g0BVTY+RRT1QoJYUX8LDHD6huvKUhBf2ZWzuNXIJrN
         HRTJ9ToFhpygwTr/PXf4fg3MLr5W0CtHUuuHcFjqyIEBXZWqD3VgyvvUCtIGuQ7pVrx3
         05XRlvTEt7jUq+tRs2zy2rupnXs7fz11cU3DN9TG6FDY8S9PNkolS8p0UNxrrsENiohF
         bvwd49KiAuMklYwkt32GA7T89XtqiipWc8s5MQBanJDjTQZq8lfHl75v8WIVpxXgtnnO
         r6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUIFBIzI03qBZxr+ETvCMW8wSQGmm1EmtehQwkY4EEHK0np377UeXhagx5VAjbgb9ETAv4IEh/LwjM9FEu5wfzzzP7NZ81WHTsj+EBwvje2NKsPSuRizkDubUVCU+0GgS38zPCZJ60IZx736nR08xOn/SzOty0=
X-Gm-Message-State: AOJu0YxiOuf3SrzHVBTS/zbwpEi160nKz6FMDlIQLrXpVCP9FeWsDPmm
	7dwpIiAv3Vl6Srhy+zGh0azMDIf4mNmjZkig5a6kfJrrVhbAhh9m
X-Google-Smtp-Source: AGHT+IHEGJhWWa1e30aGL5DnsTEpJiTDTXaGIBCDX2v7pHa+Npm+d4Q9LH1hhmRiUUPUezlEhErNEA==
X-Received: by 2002:a05:6830:14ce:b0:6f0:417d:5167 with SMTP id 46e09a7af769-6f0e9109a0bmr697703a34.7.1715286739471;
        Thu, 09 May 2024 13:32:19 -0700 (PDT)
Received: from neuromancer. ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5b26de89545sm379650eaf.34.2024.05.09.13.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 13:32:18 -0700 (PDT)
Message-ID: <663d32d2.4a0a0220.e5dc.2304@mx.google.com>
X-Google-Original-Message-ID: <Zj0y0D/2P2W6heiu@neuromancer.>
Date: Thu, 9 May 2024 15:32:16 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Aleksandr Shubin <privatesub2@gmail.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
References: <20240131125920.2879433-1-privatesub2@gmail.com>
 <20240131125920.2879433-2-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240131125920.2879433-2-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_133225_228838_7355513E 
X-CRM114-Status: GOOD (  25.23  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 31, 2024 at 03:59:14PM +0300, Aleksandr Shubin wrote:
> Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> controller witch is different from the previous pwm-sun4i.
> 
> The D1 and T113 are identical in terms of peripherals,
> they differ only in the architecture of the CPU core, and
> even share the majority of their DT. Because of that,
> using the same compatible makes sense.
> The R329 is a different SoC though, and should have
> a different compatible string added, especially as there
> is a difference in the number of channels.
> 
> D1 and T113s SoCs have one PWM controller with 8 channels.
> R329 SoC has two PWM controllers in both power domains, one of
> them has 9 channels (CPUX one) and the other has 6 (CPUS one).
> 
> Add a device tree binding for them.
> 
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> new file mode 100644
> index 000000000000..716f75776006
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner D1, T113-S3 and R329 PWM
> +
> +maintainers:
> +  - Aleksandr Shubin <privatesub2@gmail.com>
> +  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun20i-d1-pwm
> +      - items:
> +          - const: allwinner,sun20i-r329-pwm
> +          - const: allwinner,sun20i-d1-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: 24 MHz oscillator
> +      - description: APB0 clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: hosc
> +      - const: apb0

Sorry for being late to the party, but I'm starting to look at the
PWM controller for the H700 (H616/T507 are compatible I believe) and
for those devices they use apb1. Would it be possible to just name this
clock "apb" and note it's just the "APB clock"?

Thank you.

> +
> +  resets:
> +    maxItems: 1
> +
> +  allwinner,pwm-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of PWM channels configured for this instance
> +    enum: [6, 9]
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun20i-r329-pwm
> +
> +    then:
> +      required:
> +        - allwinner,pwm-channels
> +
> +    else:
> +      properties:
> +        allwinner,pwm-channels: false
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#pwm-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sun20i-d1-ccu.h>
> +    #include <dt-bindings/reset/sun20i-d1-ccu.h>
> +
> +    pwm: pwm@2000c00 {
> +      compatible = "allwinner,sun20i-d1-pwm";
> +      reg = <0x02000c00 0x400>;
> +      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
> +      clock-names = "bus", "hosc", "apb0";
> +      resets = <&ccu RST_BUS_PWM>;
> +      #pwm-cells = <0x3>;
> +    };
> +
> +...
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
