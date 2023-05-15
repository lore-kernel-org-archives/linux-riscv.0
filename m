Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F345DC7EE22
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 06:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5h26sDtCpM2CDWN7NhQF2SwDL5rPzbFDw6Tz7GorPD0=; b=d6BMFXJq9gO25h
	lO7chOltmBVCx0EmycOYfQbfgF5+fBK73NAJz9dImyLtTnGJPDE6QrpVGNJKKTw110L0Ncr03JAcV
	GOf+oSlwq4pgW7hdMBcfRjVorMYbsAXCGNW+jAudIKY5OZrEAuLwCariWHGuLM0w5KHQIyI2Th3Js
	mS+Jg/vxxUqxL5aC9SsiIaKiZ19nSimpyVdEJLwiqFLpupAigy4VQ5aRRMFuy8MhD6MwDvAiEGPjD
	4BTmzdvS9vLSzf9rhdzLBgk4hWEQThnWY/8oBz54b1Zjzk/HsykkX3qYcHdCTGMAzvshn5doiKwW+
	I3EgOVekRFGHdRBZn36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRfd-0018Vh-22;
	Mon, 15 May 2023 06:26:57 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRfa-0018Ub-2p
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 06:26:56 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bcae898b2so21790609a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 23:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684132010; x=1686724010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qKPNUzjoxIt2qle5yyUBx+bzfhRe4atuWwPXnoKqr+I=;
        b=i0rOmp8mgMrmR30bV4O+LQ+jOpWIkqsnD3dfhCBrHxL6VrwBvi1R92pPpXXejeRZlR
         4ut9hMkEDnvlR7YDto5UTrk4sgeKmrTuFKlBH0WyxUzhmIx3E+c5TiPtONH5zBydqGrA
         qCMBZbIkIoOwq3QumgXHx9eV7DpX8hZ2lBHgh5wyHznKoglu9wZTF57C5Sol3LW0TBDi
         syjRgknmwz54wGvXMBq3qJ8GvG0jj9Gt4VhJWSYfy4qRQpzyQ3ZON2+cfHAAhzbJ66Op
         u2oviZ3B4KKL2EHWCNPphpefFZzbOSTBQN5ymDWTROIyGXPzijTCiEyDkXgGu50mxzrb
         fygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684132010; x=1686724010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKPNUzjoxIt2qle5yyUBx+bzfhRe4atuWwPXnoKqr+I=;
        b=Pt4dyHNh0mO7Uf8PK0dqvsDmYCg3YGiXnCokaumZrd24GVf2yLQQFPAO9p832ZO7VC
         hZrO+41mWRBxtf0YgxToRbCiefFuSIyfvX/sNqUOhO1Tcv2XLvVGjTSzTQDBUCPTACB1
         ExaqOg+Z5eVEcwoEipQxLcxHMXXvbTdPp4rayT6D1qauro2ovRJ0bp9treIgI4MRmZ3H
         64LJ+ApEB3vdKvvGeri/prrOXUrXGjCjOYBx2jog8J1yOFl+yDM7OfYYaq2Cr034EbJ1
         a/C9AlSyOG5AtPiV36iEr7/0lLDRPF+LYk1XJRVFcVVXvmls13Q4h1WWD+Aulbr51rVZ
         NdDw==
X-Gm-Message-State: AC+VfDyHpUSRwnmV6BoCGxlb198s6vXg++UvQ1CjZvw8AANIcNej4JBg
	1677AOBi0ueXThL7zjOo4pFxRA==
X-Google-Smtp-Source: ACHHUZ519n6PfF1iQeih2w1H7eBKQCRVwE2ObXahgbrsyPv9Fez0px0W+jcEExMsuLAEmazbgXYEPw==
X-Received: by 2002:aa7:d982:0:b0:509:f221:cee2 with SMTP id u2-20020aa7d982000000b00509f221cee2mr26674380eds.32.1684132010534;
        Sun, 14 May 2023 23:26:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id n25-20020a056402061900b0050a276e7ba8sm7069699edv.36.2023.05.14.23.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 23:26:50 -0700 (PDT)
Message-ID: <a4ec338a-1b17-4b88-3df1-239acfa6745e@linaro.org>
Date: Mon, 15 May 2023 08:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add thead th1520 clock
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, mturquette@baylibre.com,
 sboyd@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Wei Fu <wefu@redhat.com>
References: <20230515054402.27633-1-frank.li@vivo.com>
 <20230515054402.27633-2-frank.li@vivo.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515054402.27633-2-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_232654_939134_E6756AA4 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 15/05/2023 07:43, Yangtao Li wrote:
> Add devicetree binding document and related header file
> for the T-HEAD TH1520 clock.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  .../bindings/clock/thead,th1520-ccu.yaml      | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
> new file mode 100644
> index 000000000000..c3e2d8c7efa6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/thead,th1520-ccu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD Clock Control Unit
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +  - Wei Fu <wefu@redhat.com>
> +  - Yangtao Li <frank.li@vivo.com>
> +
> +

Stray blank line.

> +properties:
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  compatible:

Compatible is always first property.

> +    enum:
> +      - thead,th1520-ccu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    const: 2
> +    items:
> +      - description: High Frequency Oscillator (usually at 24MHz)
> +      - description: Low Frequency Oscillator (usually at 32kHz)

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

I'll stop review.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
