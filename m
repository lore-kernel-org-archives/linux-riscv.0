Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30979C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8SPz22HKvNw6ZvH/Nrt8TvcghHg0Y7ujgTZwG2i9Vw=; b=w4Q5raEy4Dbvtf
	7caiRwgGC02GOVtONYz9L2zMii/Hc/yqmJaLdVqiyZ9AD9X1D+617pKGcqnt4XcWoZFDa00eFX74M
	eD12j4fEaPsb5eER15pnmEmIdniaLy2aWVr/8cbzeMejdghO+B5FLPK6O4b9WOUeABV+MZfztAaiC
	tyzmFlJ4cdwOuUe6Nyb6k0LNGG822MYDTdRq7/HIuGfRMjDLC8INzNS26wx+T08v+8P5RemwtEtDf
	eEg7qR8eK3vCegCVpk9BGgUselm7bTk7byjQehnp9HkKDCfL22e3+VDzdhT3wN4ypkn9YU50SuHxV
	kt66WupmCzGEBLd5qOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2UK-00BTYK-Bg; Mon, 21 Nov 2022 08:49:12 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2UF-00BTWm-JZ
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 08:49:09 +0000
Received: by mail-lj1-x229.google.com with SMTP id l8so13695855ljh.13
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 00:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVT43T/dHnFe2fySXLzb5zjQ/wmCHIUhX9kGLd6O8bg=;
        b=m7YEpSdoPncIay7CK55dZamOK33iC41fbxI561jsG8EtQOA/NW2Vp+Ys1Qt0NFmitZ
         TXx8mFQhSTfbpEJ2aDLtvWWLUdpGTb2ktCgqBKMi9d5IchW6xLsTaQavafYkRx4sb135
         BoQyKgxloiHckVgNKcB4BHrc/bfpPo4GBQL11STHd+81mYBQWskdvXXsAxW68mC4RNCW
         tpP4QdID8cFLxNEdUUXaOHTS5u8oHNpr+Xg64BVPBShhUPi/ZWAnS2YxaTTa0CdeIZlW
         5YsXs+vXT8OrojWiDUG4qp0kJ8y+ukUk0ePHkPQvNsmf1rz6icdokA3IUkoFvZo8xXq5
         9JFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVT43T/dHnFe2fySXLzb5zjQ/wmCHIUhX9kGLd6O8bg=;
        b=wuUQEnrHqnrf+4l41P4Toj4ODsoTneX0XLAphpNNsVwZmn9pncMl90i9qp+kkm92bu
         o9fho6AnActcO/T7Ty5ytMZkd0nEtVWkfKriWe6/9zC0JJ/WWwzWoHmngLSVPSfxqoTg
         F9b9GFzyq5/6+bKReB6vJvvOwjhFExjWF0QGSH0Qb7Bgt2txt1wuteg8zHeR4B4lIBkC
         fwUVrqSeUaeBNRaSzWaTmX7SSIVIiMyQ6bDfb61MqWHnjA2S7g/k5VkKax0XI43O1ZRu
         C+qCOCnqe0MMfMKUvetIpimSEU6552Oc18phhkImsQy8TRAbfIkYecHUvfwU/6T+YMyr
         yGag==
X-Gm-Message-State: ANoB5pnr3CCaONX2BXslNGLmz4qdd93tayKTPdEQL3a4cdCfj6XyTO6I
	eas4wkuEHu0ISprPAF6HUPHZIw==
X-Google-Smtp-Source: AA0mqf5kutEIoaxtevDmPqDbnLgxJ+m8XshHejRbM21MKTWUvRWlYZn6/xrxrWSEwZDb/uwiQFbWjw==
X-Received: by 2002:a05:651c:32b:b0:277:8d3:4298 with SMTP id b11-20020a05651c032b00b0027708d34298mr4891897ljp.302.1669020546204;
        Mon, 21 Nov 2022 00:49:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m22-20020a0565120a9600b004a608ec6d8csm1938901lfu.27.2022.11.21.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:49:05 -0800 (PST)
Message-ID: <8153973d-e8ad-e47a-3808-bbcdbfd169a5@linaro.org>
Date: Mon, 21 Nov 2022 09:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/14] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-11-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118010627.70576-11-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_004907_685493_5391CB21 
X-CRM114-Status: GOOD (  14.69  )
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

On 18/11/2022 02:06, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the always-on clock and reset generator (AONCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-aoncrg.yaml         | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> new file mode 100644
> index 000000000000..afbb205e294f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Always-On Clock and Reset Generator
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-aoncrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator
> +      - description: RTC clock

Real Time Clock clock? :) I don't think the input to clock controller is
the output of RTC...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
