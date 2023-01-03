Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772CEC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 22:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCkZSHO5248Cfj0AWaixJ7qB6E4XszsoEi+9gJtPxEg=; b=edQtPPfmmQPVzG
	v1uUS19M1+e3nxrazky5eFts4eXQ4qsM8qKtx+TeJ7qHcUwBmOd4NzKffp28WOdlnkTvcyCcBAZ33
	3h2PM5AKwKekOIVJIEO2siBwb3rdLZ6tXe/oSIMdgJumvKr7cAOPA8K4yzLz0KfaEcmAy+Bf6MsFp
	mOZ0guPQyt90kLW/5Bup7tLGTI1xLJW2NV0YM1/mubFrUZFwIFtOOtl+x9ox3z+g0eOUUA8CXmZiv
	/qtZjmxCdK6/O/3lGWHG7zcBCLur8jCtQFe4C0cd3jtmARpdVHmjs13On6MqDJavKuA+hBieZnAzm
	m4BiXgvf2hmLMRaGbPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCpYb-005Mg5-V8; Tue, 03 Jan 2023 22:14:53 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCpXs-005MZI-IN
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 22:14:10 +0000
Received: by mail-oi1-x22a.google.com with SMTP id h185so5714833oif.5
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 14:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1IksS8NxxXXZYII/OPwlDewaxwz5V+ENNWWsENNd3U=;
        b=ejJpFhOUTCkKi7QY8QrTP7v0x6Gg8ffP257/zLnvfmXki/CzK0hKkK4Y+BoVV5493a
         nHI5xUgKyIYKNDH5+YXeiZzU2J3xVmDc1KArcBMoqWrKplB5immB8R5HqjRS2aNubiIL
         WHuwIQHuTiZouMVC3U0tvyTmhToR8tRvU6VPw+3j48PAcKAmxaI0ATSMRN/dAWv+jnvv
         RsyHFSm6w8hzTxFMy33FjvnCtnRYEb1GBvKMyFqnpsBT2EwyeGOmbZ/m+OYXoxRUIDNT
         3jxxOnmfUQkWZmDKklHCuLgtI31FkbWia8urHZ0IYl7xMEay9sZjKnEUPQ6fMCO2s58n
         P28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1IksS8NxxXXZYII/OPwlDewaxwz5V+ENNWWsENNd3U=;
        b=Vofb9deIJfLe5vYH/3Ojw+qa6XJgXinVfQgJsVBiTiT7T18On3A5SWxGNutFN8mRMo
         SnvTRBaO7qT0KGnxwIC/289WONI0QNsN1opa/jtzh0FPI5TuJE6laFKx9PmVAKsC12IH
         O5vvpSavCpywkrcZTIDC8qkTBmaY+NW8iOWxqIb0S4Hy8A39xj+JUYphV1QdbbI5XbLm
         Up0G+WWYstdub7UbzXMw9R7MZuLqyHXZ7oKbgGJ4oVRBPP74OXGSNeW4tNU52Ctm0mzH
         dLyObWiIoziCxrYxH5ZlC4llPbk7hVuOV4Kf3lm/Taqec5jY3Ufg5WDlsB4mHv7Gl9y3
         6XwA==
X-Gm-Message-State: AFqh2kohPhkVTEq9brKM86nAQr0zYp1+ruUkw7PrA6cmPUloko8dyrIK
	2gexecW34BLFm6q7BF/+ezw=
X-Google-Smtp-Source: AMrXdXsj1u6ooXmWsaBlvs9AC+gDm/4awnmYnYB9Um0hPJ/NuIZvtGDq5unbn7E3nvgUDUAR/6uz1w==
X-Received: by 2002:a05:6808:6d4:b0:363:a6c3:8dd3 with SMTP id m20-20020a05680806d400b00363a6c38dd3mr7133019oih.44.1672784047526;
        Tue, 03 Jan 2023 14:14:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n67-20020acabd46000000b0035b451d80afsm13468032oif.58.2023.01.03.14.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 14:14:07 -0800 (PST)
Date: Tue, 3 Jan 2023 14:14:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: hwmon: Add starfive,jh71x0-temp
Message-ID: <20230103221405.GA217696@roeck-us.net>
References: <20230103013145.9570-1-hal.feng@starfivetech.com>
 <20230103013145.9570-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230103013145.9570-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_141408_681536_C4BE3240 
X-CRM114-Status: GOOD (  17.03  )
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

On Tue, Jan 03, 2023 at 09:31:42AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the temperature sensor on the StarFive JH7100 and
> JH7110 SoCs.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

The previous version of this bindings document (v3, 
https://patchwork.kernel.org/project/linux-hwmon/patch/20210726171802.1052716-2-kernel@esmil.dk/
had been reviewed by Rob Herring. Even though this version is named differently
(starfive,jh71x0-temp.yaml instead of starfive,jh7100-temp.yaml), the old version
should be referenced, and there should be a change log.

Guenter

> ---
>  .../bindings/hwmon/starfive,jh71x0-temp.yaml  | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> new file mode 100644
> index 000000000000..2600881e2cdc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> @@ -0,0 +1,75 @@
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
> +  interrupts:
> +    maxItems: 1
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
> +  - interrupts
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
> +    tmon@124a0000 {
> +        compatible = "starfive,jh7100-temp";
> +        reg = <0x124a0000 0x10000>;
> +        clocks = <&clkgen JH7100_CLK_TEMP_SENSE>,
> +                 <&clkgen JH7100_CLK_TEMP_APB>;
> +        clock-names = "sense", "bus";
> +        #thermal-sensor-cells = <0>;
> +        interrupts = <122>;
> +        resets = <&rstgen JH7100_RSTN_TEMP_SENSE>,
> +                 <&rstgen JH7100_RSTN_TEMP_APB>;
> +        reset-names = "sense", "bus";
> +    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
