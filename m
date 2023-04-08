Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE18C7619A
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhrbSJwmD5k5yP7I6Ni0KUQ0s7bNzsQzCBbdm6zl5YQ=; b=tV2xCiBrkROKpk
	cvyH4a6ydo5oD8YJv1ATiAo6p9N1PppAo/huJAlsgVqsXokpitE3FdolJxAEeG5DLLUp6mMC2TvFo
	9P4nIRmm50YKuz6KcA1q8k0smfZxWipCM3GFcXw7y0SM4BVeb0fwvkjyyoQ05dn+Kd7cgo9nAinRd
	5ysUVmQIr20TX1t3BId22zX3VaviIC+961bHNVSgodPZ7zoboA2q3JyFDamLCKJ5Iq4BVWmm0S5Ep
	Oroa02hznCw92NcSoWR/nz5ss+EolBJxH4uhMSFoA4dfCHF3xWyVrZePQC42ew0kUQabLuKnD81Jl
	yEuT2BgTLk0Zotf2LO4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plAV1-00CVbp-0t;
	Sat, 08 Apr 2023 15:29:07 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plAUy-00CVbF-23
	for linux-riscv@lists.infradead.org;
	Sat, 08 Apr 2023 15:29:06 +0000
Received: by mail-pj1-x102c.google.com with SMTP id go23so3882707pjb.4
        for <linux-riscv@lists.infradead.org>; Sat, 08 Apr 2023 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680967743; x=1683559743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/CqlFLSqTlHbIyKxwvXGQ5ogjJykzkwTVvFA5reLrY=;
        b=MRHkIlNVuAzdfLMyOf1KU3dKEl6JGIYPOpOLaz/HH3DtmrUctyXQ6l5ZQJqZgDVhII
         0uMYKnIRjhgXPogcW5LMZ/J4g5sETfrVvjSbPfNusD7z7mi7xhSjgX31uqk8sKhTxbKQ
         bzGsMMYzPZhWqqxuL4p5QStegnHRzjYalYEE21AwRlXaGNiLjGwBvf8hAi7fUdKjTr2W
         XlnaE7GsJKO9h1P8HKm4NmjGXjtFWiAIOdOI7UzPOcJ3CIypeiC8wdx2mxm12KaxB3qm
         OwHYIkTnDjO9VtZjmUrWxupB0IP5+qHJJXQwge+J3xlSUgQeN3H3DXKLZM79LZFqsYli
         A/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680967743; x=1683559743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/CqlFLSqTlHbIyKxwvXGQ5ogjJykzkwTVvFA5reLrY=;
        b=rcbE2VgsiVauGxU3O7nkSjl+yvHUI4dO5gKFqKtencFrnfAAicmbxbZhLq05BItyW5
         tzpIAO9eU523GMh7jpnvyimdE5q8KzwTXLtIy1K+7mAwcpaJ5ZANfX2uaZSciXgEVW72
         X/vkhGYP7abDedTHY+ZB3NoUSWtb/DKjUSI7hO0dTJBrUZL/BqyjiOaS/nTZcsNep8ro
         Uaftk9HNu1biuJrIqYf4y+zF6I/oKOglTR3bVlSYwCuP3Y7v/IBch026emmOnQuoR2aa
         seUk5T4sMRdKsLgOMFbV7BNzHLeoXCHMC3tAuKXeF35AkLyuJDXxH+RCbHNs2H/rPUg9
         bhvQ==
X-Gm-Message-State: AAQBX9c8iqhzVbSq9mSWmoAvuIG6Ox6pZcC4A6f28f2yzyLi7xFOX8HJ
	uGMQog1YLlaVWt9a3LqQnGo=
X-Google-Smtp-Source: AKy350Y+M27wSUr2e2KA/3Osm5k6tDYPZAW3F7SZ5WX9U9qR8HLOaf0b2Pwx1PQHytYXXR2m/tR1vg==
X-Received: by 2002:a17:902:e550:b0:19c:da7f:a234 with SMTP id n16-20020a170902e55000b0019cda7fa234mr7765282plf.67.1680967742844;
        Sat, 08 Apr 2023 08:29:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ju18-20020a170903429200b00199023c688esm4688711plb.26.2023.04.08.08.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 08:29:02 -0700 (PDT)
Date: Sat, 8 Apr 2023 08:29:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Samin Guo <samin.guo@starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add starfive,jh71x0-temp
Message-ID: <746ae322-f661-4713-8152-1f7b33b1a988@roeck-us.net>
References: <20230321022644.107027-1-hal.feng@starfivetech.com>
 <20230321022644.107027-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230321022644.107027-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_082904_697781_F6089CFF 
X-CRM114-Status: GOOD (  15.68  )
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

On Tue, Mar 21, 2023 at 10:26:43AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the temperature sensor on the StarFive JH7100 and
> JH7110 SoCs.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  .../bindings/hwmon/starfive,jh71x0-temp.yaml  | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> new file mode 100644
> index 000000000000..f5b34528928d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/starfive,jh71x0-temp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH71x0 Temperature Sensor
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +description: |
> +  StarFive Technology Co. JH71x0 embedded temperature sensor
> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jh7100-temp
> +      - starfive,jh7110-temp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: "sense"
> +      - const: "bus"
> +
> +  '#thermal-sensor-cells':
> +    const: 0
> +
> +  resets:
> +    minItems: 2
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: "sense"
> +      - const: "bus"
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive-jh7100.h>
> +    #include <dt-bindings/reset/starfive-jh7100.h>
> +
> +    temperature-sensor@124a0000 {
> +        compatible = "starfive,jh7100-temp";
> +        reg = <0x124a0000 0x10000>;
> +        clocks = <&clkgen JH7100_CLK_TEMP_SENSE>,
> +                 <&clkgen JH7100_CLK_TEMP_APB>;
> +        clock-names = "sense", "bus";
> +        #thermal-sensor-cells = <0>;
> +        resets = <&rstgen JH7100_RSTN_TEMP_SENSE>,
> +                 <&rstgen JH7100_RSTN_TEMP_APB>;
> +        reset-names = "sense", "bus";
> +    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
