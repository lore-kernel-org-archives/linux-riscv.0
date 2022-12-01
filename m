Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E97C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 11:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7DuCvl7uuZOJXrwRTNHAPsrlwB8gyX+f7cBSSMfBxY=; b=jLgfQD2ZkR5XMj
	1WAAziXyuoUWTsM5bethbbmrHMSP9z3I4TZkmgNy8BBxejoYdv1eEzfbHB0tAHqdlrqaQSwpJMZr6
	kUcmSJbf94zfifbA6+C15LG4xwPZ3zi2fqaUMOJddVz2dOxiS9ljB4xVqYx5RODIbP63zX8u0vqRX
	UmIN1D/6iHon2wDWmImbAhjhllkEi8IkJeYpr1ytgSaJfssfMq2UrhxZxqomsW3qUpFw7rCUsrPrs
	/IruLuFAakkKvaJgnb+Fv5+Lx6aJOFGSy4JZmxpwMRnBegHZISqoHyodnWKWdEbxZxTY+ulWfBrnA
	rGm8HmYZL40SL7lrj1yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hNT-006vA9-G0; Thu, 01 Dec 2022 11:05:15 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hNN-006v6g-SK
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 11:05:14 +0000
Received: by mail-lf1-x130.google.com with SMTP id f21so1048292lfm.9
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 03:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJ+12nfyyTkgnpRxkhSczeW684U0Z3MyPpVBPUH63N4=;
        b=Pq3N/E3XVx4A+B6KaT7zATRc1xex4JEnlIeXASyXQwFiVfrDUYfA3LvfpILF8VzKpV
         nLihd5WxJLL6XeWFqCxhGGtuZCFRsDFq2VYSgQQoWxwZBwtVCHzYqRoLEoVXfBE5pBvW
         iy0kgt5+lptF0dQuw5bvFrVMZVIc+yVF7MLcUz9u/FB7DpoGBFGXGnZQmGv8Exw9Tl83
         H6u0kpC0Bs0Vspxe2O4AedRQhUGkKY4fq6F50gee2r/bUQ7X0kWm4Fle8VZHS4vm8zpk
         B2cYeN9tDPwGNV/gmu3GFRSHSB1EyJo1s6WCJMPwx/MKKAiur1dFrSLa69D5fAL18pAu
         m6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ+12nfyyTkgnpRxkhSczeW684U0Z3MyPpVBPUH63N4=;
        b=Hj7c6Clg6M323kFVKJuQ022hJ6pLa3ENrk7omOWsinUIU6dM+wmn1LzUVUGs2crwKO
         aPduebMTdlvAXI3DIUv1uhATOhqgdheQwxwsAo3w677kc7Lu18Nv/sppBLyjo6qsMH15
         Jk/WEdzmMX/CglvG0XwLHURUjEu69c6E0Aoxw+HeP6FwJBQ4UFDbNko2+OzdtvbVaJwd
         xcQRnt81sgwyJz0nEyeCY40qjv73VBLciBTokeyjt7WlatC+J4QETeWBj1anr+JfT9we
         owy2134sZoFG479XPt0V86XK/yjWXU8CAC4PxNDQ6wtNMhH5ls0NxY+DKlKVUQGQD6Lz
         f6rQ==
X-Gm-Message-State: ANoB5pmltxMoDUQSVc1gE6ZAvyujC8ebHlpVFcmnc9ek5q2CJDR7YLkD
	uog+7pS27mECzqkfizWQ8JgZ2Q==
X-Google-Smtp-Source: AA0mqf5bNGiLehJjFTNkoSES7AUznPLQmpDmBmFmia/T8Abr14CJG2m8TfKNIbFLa5VW4x8mY6YbsQ==
X-Received: by 2002:a05:6512:258a:b0:4a2:27f0:46a5 with SMTP id bf10-20020a056512258a00b004a227f046a5mr18154806lfb.611.1669892706811;
        Thu, 01 Dec 2022 03:05:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id cf17-20020a056512281100b00492f0f66956sm611237lfb.284.2022.12.01.03.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 03:05:06 -0800 (PST)
Message-ID: <60991459-945f-35db-f26a-fb27824728ad@linaro.org>
Date: Thu, 1 Dec 2022 12:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 5/9] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-6-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127132448.4034-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_030509_992839_8D17F5DB 
X-CRM114-Status: GOOD (  14.45  )
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

On 27/11/2022 14:24, Jisheng Zhang wrote:
> Several SoMs and boards are available that feature the Bouffalolab
> bl808 SoC. Document the compatible strings.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/riscv/bouffalolab.yaml           | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> new file mode 100644
> index 000000000000..91ca9dbdc798
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bouffalo Lab Technology SoC-based boards
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +description:
> +  Bouffalo Lab Technology SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Sipeed M1s SoM:
> +        items:
> +          - const: sipeed,m1s
> +          - const: bouffalolab,bl808

I don't think that SoM is usable alone. It always needs a carrier, so
drop this entry.

Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
