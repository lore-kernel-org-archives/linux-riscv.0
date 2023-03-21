Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83A2C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuidvFuotgnM1Afn4cWl7chjvYAOM/VV03uSv6awxMM=; b=ohgwFNjWxY83pB
	1lyyHmgQO2AfO45Mm0IqkUsQtAEFahrJBcKF8fUOnjnWKWQ7b+kVd+ahS0ZY3jYr168gmYVNGgr6J
	/lEYb+iKElHoeK1XTu7p0keuiYJ4fVfl673o+qoPLdKRakTaqc9buqwNhg8iHfT0ktcrUvq1ZHIv7
	oSEVNOe+R+KX5wXIybNg0n00Wubtbnb5kpyR6xLg/gqhyOWhnvP0YjFFVczibt+Ue4CZ2oeRH0VQc
	x/kaKOiEouDUgSAw618vtnbtAK9T/185tKcCBsBPbN/o29CipCZVEiJxeoukk4/gFxkVSET5BBnge
	hB/lXc9qQkTKusJ9kU5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWC9-00BUfA-0n;
	Tue, 21 Mar 2023 07:14:09 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWC6-00BUe6-1c
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 07:14:08 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r11so55906286edd.5
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 00:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679382845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RpFiX0kGSU3MmscTQy/8QOp1uiypHFRfPT7CenGfskI=;
        b=Ko+Rzx/RKcfeOZxi63DixRfyGBEy4+A/fIXbxkxRhPs06nPrmJGPpHihuOuyXwR5L/
         V/dbazwfMzfdjgmST5WTYMP2S3uAJduFP2GT9rC7LtmwKIGvgnUWmi3fj1sdGZchqb44
         M2CJKqg9B9qOLH1aEXIc82d7ekklCZPRosH8JvM9+fm9xZf0A75L0U8IxLaL4SALR64/
         e/skkVxYlVo6umq/wqdPTC/8b+W7iqvsAerrF44GiNBhKg9Ln8dGuubYWF/RB1Iw6TGr
         rKzxfJszS6iido/EEu9L2B7iIsrYpHdlVMwqEfKsAsOToaNh3N9Sd5q9ma7dO8JLA1As
         HIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679382845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpFiX0kGSU3MmscTQy/8QOp1uiypHFRfPT7CenGfskI=;
        b=eUliL+gZ4glUQ2Edz4JAa1VZPq9qxCHFC3uEVuWy0KB/eDuSYQPeKUAiSJXmzjB3Fu
         4MJtTLIU0E2GsP3gSGsmcMO5P9VfkiqC7oHh0qqCQdxKqhBMugzURmY4VtydYOi4Xkxm
         LdNhurulrMxdIMIShsdac2FQJKD0hpOPxbPdoNtXkmSA37nb6+NMOn8HWAiTwNzR9SD/
         BOxKPbzBTLfQBMyPGW3jQFnn/BZ4jyR+DTIqGMhp7nRxygSsgAnYg6KQ6uSB1RKye4Gv
         btr5CVruS+CguL5n5iQRX+d+IaltHMxb/wRJBxH/Mm1w4cuETD3i+0PErcFRw3yiA3q4
         Cxyw==
X-Gm-Message-State: AO0yUKWHlrj5a3RO3TwvAZx2PetlpSxxIpQSEpxbaQ/aaRZXL3OIxVfL
	YwLnXlXCjGconLCgqPiuldMI2Q==
X-Google-Smtp-Source: AK7set8YbhRjK1nsoK2w12o2BUz+XcJUSI/ULYsqTpkQiEwlmX58cny9P9DXEL6QlYFOpF3ZU8MZDQ==
X-Received: by 2002:a17:906:7054:b0:932:4eea:17ce with SMTP id r20-20020a170906705400b009324eea17cemr1584920ejj.39.1679382845028;
        Tue, 21 Mar 2023 00:14:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id n15-20020a170906118f00b0092421bf4927sm5458201eja.95.2023.03.21.00.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 00:14:04 -0700 (PDT)
Message-ID: <3f5e01bd-24ee-66cc-1a5d-b3fc09c2a96d@linaro.org>
Date: Tue, 21 Mar 2023 08:14:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/3] dt-bindings: timer: Add timer for StarFive JH7110
 SoC
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20230320135433.144832-1-xingyu.wu@starfivetech.com>
 <20230320135433.144832-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320135433.144832-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_001406_544788_9E3E103E 
X-CRM114-Status: GOOD (  14.34  )
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

On 20/03/2023 14:54, Xingyu Wu wrote:
> Add bindings for the timer on the JH7110 RISC-V SoC
> by StarFive Technology Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../bindings/timer/starfive,jh7110-timer.yaml | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml b/Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
> new file mode 100644
> index 000000000000..24b34618f2c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/starfive,jh7110-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Timer

Actually one change is needed - missing blank line.

> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +  - Samin Guo <samin.guo@starfivetech.com>
> +


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
