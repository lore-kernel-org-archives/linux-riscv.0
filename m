Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC22CC46CD3
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 18:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mvthh0u/zs0u6hLoeM/m+k1x7P9dm4bmstSSImsoO0M=; b=ON0oGZHI4jbiwd
	x/JIaaJRrG3k6XZRNwf5l2WUdTLH0giVhYtY8GJIBtGWy2JcPtyDeLFC3izXTFyu+Hfr2p/UNCz+J
	qRrg0TlMZdZVGNW/s/2/TNGdq0cd31eXMi0p/x4mYCrLP0cJb+UvkUuNAQDGkARYGjd4qZna8n8Rw
	DxL9AWdFDA97NHM/gjbL+q+EWduRU9MIU/U41dd2kY4mzpFlUbYoiFC7hNR9BPqyaEv8s8q7Gml7Y
	RrcqjH3b2brVBJRFpoLxJKi41/4POaIiWDuy9l8ZyIFO5cdvX4eV7yTdInPurS5cwR7Midqib+5gA
	txP3OeKNAVtvMJgNcoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIBpv-00DLJV-31;
	Tue, 26 Dec 2023 18:07:27 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIBpt-00DLJC-0K
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 18:07:26 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7baa8097064so143555239f.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Dec 2023 10:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703614044; x=1704218844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPNsMK/s4OTo7V67GiJCawbHwE3mn0OYhqS2bmZF3nY=;
        b=mNkmxGG/bbk3l3pTD8otlKlcKb2Qpsl9yOtrrhHWlUcha/jKkHMpHssjjhZgM3TYqS
         zT1Ut8qWd4a1VvsVqGDCf6l9L7UU0F5jHrH4Mu1/3ZZydxQskMZq1Vt+2gbkNiTnbTbN
         9sJD6SMdM9L1wMdqX68fgF+xm5fJC7ZqJRSx9k5hsGygCa1KDvOkRPsafroHqi7rv+mH
         CWWgOI8JttKmpYYoAExyq+5Ke0PFGfEbPorpBF4kDQK7u0bW6AhJGCXirEpYnxM/rMVy
         NDTzhbtTpt0pNPsR5+WQZGL/uqB4a9RTrK84Fu5unFiFsPj3/WFDV38V4e7sTs+hjKGZ
         vvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703614044; x=1704218844;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPNsMK/s4OTo7V67GiJCawbHwE3mn0OYhqS2bmZF3nY=;
        b=givqLD/z8nYmlrllIoqKyR6rehVSnQN2JpvtGFBnewJuvgMNlD38JgMsIcClgqufF+
         XO8S62Cw6Dc7mSfHh9qhq1WA+SjLHmlzT1ay53YeiQSRC8Z+DbEERlA+hmAJBbOuPQUa
         /sNXK7fpW8LAXXIzc3wcub1X/YA1HylO9y58GdpWYH0SppW+YX7AJt3YlSkJw3iZ7+iY
         gTxwt4FBNTO/tIc3QFJGhv0FgzqAwGaZPiO9+c/15tqIbTYzlPpzR0dV6iQ8oorGjjrX
         C5LlD2t5162O0ZufaAgAZiK4bV/PjVYnv/G3nUIR57jqPjyo7S1vxA1i748YWQFU7wpo
         ALjg==
X-Gm-Message-State: AOJu0YzPKkrUzibZN+IAjOvbUz2sEhPreqfD7lqWZxTrnse623/YZN7E
	WGJ+uITP3VRPXlolXF+t1D4Xwk13xd1X8XpTlDkY5FWn9WC1Fw==
X-Google-Smtp-Source: AGHT+IHSPY+TRVUuGXVP3M/71dufTcnvlBRUKwSE8sQnUYVeLpYEgd3pY+qwbb9vi2q+AP3Bi2hzJw==
X-Received: by 2002:a5e:8a0c:0:b0:7ba:dbd9:51f3 with SMTP id d12-20020a5e8a0c000000b007badbd951f3mr3207772iok.3.1703614043898;
        Tue, 26 Dec 2023 10:07:23 -0800 (PST)
Received: from ?IPV6:2601:b051:12ac:a800:99cc:6547:8f68:3193? ([2601:b051:12ac:a800:99cc:6547:8f68:3193])
        by smtp.gmail.com with ESMTPSA id g9-20020a6b6b09000000b007ba84cb7860sm3159341ioc.4.2023.12.26.10.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Dec 2023 10:07:23 -0800 (PST)
Message-ID: <74649469-2b47-486e-b8d1-c89b705fe8c1@sifive.com>
Date: Tue, 26 Dec 2023 12:07:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/16] dt-bindings: clock: Add StarFive JH8100 North-West
 clock and reset generator
Content-Language: en-US
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 leyfoon.tan@starfivetech.com, kernel@esmil.dk, conor@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 emil.renner.berthing@canonical.com, hal.feng@starfivetech.com,
 xingyu.wu@starfivetech.com
References: <20231226053848.25089-1-jeeheng.sia@starfivetech.com>
 <20231226053848.25089-8-jeeheng.sia@starfivetech.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231226053848.25089-8-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_100725_163326_3EE7F4E3 
X-CRM114-Status: GOOD (  11.90  )
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

On 2023-12-25 11:38 PM, Sia Jee Heng wrote:
> Add bindings for the North-West clock and reset generator (NWCRG) on
> JH8100 SoC.
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
>  .../bindings/clock/starfive,jh8100-nwcrg.yaml | 119 ++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh8100-crg.h   |  43 +++++++
>  .../dt-bindings/reset/starfive,jh8100-crg.h   |  14 +++
>  3 files changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-nwcrg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh8100-nwcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh8100-nwcrg.yaml
> new file mode 100644
> index 000000000000..be0f94e64e6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh8100-nwcrg.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh8100-nwcrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH8100 North-West Clock and Reset Generator
> +
> +maintainers:
> +  - Sia Jee Heng <jeeheng.sia@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh8100-nwcrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (24 MHz)
> +      - description: APB_BUS clock from SYSCRG
> +      - description: APB_BUS_PER4 clock from SYSCRG
> +      - description: SPI_CORE_100 clock from SYSCRG
> +      - description: ISP_2X clock from SYSCRG
> +      - description: ISP_AXI clock from SYSCRG
> +      - description: VOUT_ROOT0 clock from SYSCRG
> +      - description: VOUT_ROOT1 clock from SYSCRG
> +      - description: VOUT_SCAN_ATS clock from SYSCRG
> +      - description: VOUT_DC_CORE clock from SYSCRG
> +      - description: VOUT_AXI clock from SYSCRG
> +      - description: AXI_400 clock from SYSCRG
> +      - description: AHB0 clock from SYSCRG
> +      - description: PERH_ROOT_PREOSC from SYSCRG
> +      - description: External DVP clock
> +      - description: External ISP DPHY TAP TCK clock
> +      - description: External golbal clock

Typo: global

> +      - description: External VOUT MIPI DPHY TAP TCK
> +      - description: External VOUT eDP TAP TCK
> +      - description: External SPI In2 clock
> +      - description: PLL5
> [...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
