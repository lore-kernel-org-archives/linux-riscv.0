Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C10C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2LNVS55eJtetkOWFWJ5yV8pGLwS2StX/r+y6EOrbeg=; b=lYMGV/YMwXDaJC
	K9o0iG1E9f0ZQXNbJXVupFj8MF1Ed/RXSWodH7KkoLz05UOsUogH4DWXdBY/ahOjiBdWcHfz8UtvO
	Fkz5HT+VeCHum3XcWdDr7lGnx/Doslj87oJZTii8ucITMUK5krb0ViuZjaRqe4mr7PUQqlYNtHoqt
	d+EyID8lsYCqqYXdCGr7NvCgaD/HoNtD68w0L0W6Vp9t0gH/7f6WTwZ4akoHOOlMS9h0EQbZSomlr
	j7/jCkOvJ0m8HnV12szsrX7XuUq2pIulMb1GV9SKK5GQO/5LvsHX4Bfv+jTfFhdkVRefT5fF8ERwc
	mHAwAdYrdr+tHlhsEj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2Sy-00BT7Y-Tm; Mon, 21 Nov 2022 08:47:48 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2Sv-00BT5q-RV
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 08:47:47 +0000
Received: by mail-lj1-x22e.google.com with SMTP id r8so3122422ljn.8
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 00:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O63hibjYAlrDnPNGTBFzJzkRraoluFL/kguca7bLrYo=;
        b=EltU4fn2WwltWnxGtHI95UcKp8i7eq+YAlW2jT4kEfKWGeet48gr7Oebr6G+/JeJSN
         k4nMJuCyQYSLAT3mCXCYXA0vJsbMZ0chZryjsRemEqhgCF5D/hp45PV24S9hXquP2v2i
         7rroPLe7bCePychqzc4/nlgOSvGkHpxK6H6Zl/n/9H993Eg1Jvn1/CNXT7kq2og5Nx2C
         /qENFve7xFzUK2ed0IXworEBRL/XR3xLN7GDis8GrvEyXRcEOeen5BaRKHVyix0FJR4a
         /yoU/5sWtY42qhHP+t1+gnxEtXkA2T98wQCfFW91rGLMwhH571k3q1MI7/wZOQSBiBnF
         P5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O63hibjYAlrDnPNGTBFzJzkRraoluFL/kguca7bLrYo=;
        b=bQrmEl6YYmLo7CFerMGIylhabJYSkm0sQ1vqXwpr0dHdhOy+zjn0QyrwflbHH/RHid
         NxNTY1lhWsmkd2hVPqZCHhVzbDEdCngGTVII+pO1VdKeikQ41RSX/5+KQOAkcRV0agei
         XxH8OImSOMi6dZrfKvpjYuxLJkr5X/m30mtGzxOo6iUIFd2U7c/MVz9UTQHn0LZTdEHp
         XfgzB0z5GA9Y2PBJfS1v+pb76ZMcQ2nOYEOc+58VinowkgKmyAMKE+HxbHwk6OQVmKUb
         +sqeYmNaDqlpqFmCzyDXX66yt1Zsn4Yim6OKQtXPvZt4b4dEsYdoFrfEBkClNcmw4ZcG
         VZcw==
X-Gm-Message-State: ANoB5plc9Ff3aK5nY3Uio5eUqlt+JeWMCOjx17JOHEyftC69Zz9RVDYH
	lDpJxUlo4g6+93eTEg+1qSdf3Q==
X-Google-Smtp-Source: AA0mqf6CP55rs1V20Qglel+czmAfoGR50CNjnpZfVEcHfcsCVlMnJzzXwnIjMoW1Yz0V7922SH02+Q==
X-Received: by 2002:a05:651c:158a:b0:26f:c160:6dde with SMTP id h10-20020a05651c158a00b0026fc1606ddemr5035948ljq.20.1669020462193;
        Mon, 21 Nov 2022 00:47:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t9-20020a056512030900b004a05837103csm1923980lfp.196.2022.11.21.00.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:47:41 -0800 (PST)
Message-ID: <c75d1799-d7f7-d461-b412-27c084357c99@linaro.org>
Date: Mon, 21 Nov 2022 09:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-10-hal.feng@starfivetech.com>
 <CAJM55Z_Gq22NiVYHawvjsehL8j3agvp_b2RCgabdTki+ovWa8Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJM55Z_Gq22NiVYHawvjsehL8j3agvp_b2RCgabdTki+ovWa8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_004745_919896_4530F933 
X-CRM114-Status: GOOD (  13.74  )
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

On 18/11/2022 17:50, Emil Renner Berthing wrote:
> On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>>
>> From: Emil Renner Berthing <kernel@esmil.dk>
>>
>> Add bindings for the system clock and reset generator (SYSCRG) on the
>> JH7110 RISC-V SoC by StarFive Ltd.
>>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../clock/starfive,jh7110-syscrg.yaml         | 80 +++++++++++++++++++
>>  MAINTAINERS                                   |  2 +-
>>  2 files changed, 81 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> new file mode 100644
>> index 000000000000..a8cafbc0afe2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> @@ -0,0 +1,80 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 System Clock and Reset Generator
>> +
>> +maintainers:
>> +  - Emil Renner Berthing <kernel@esmil.dk>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-syscrg
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Main Oscillator (24 MHz)
>> +      - description: RMII reference clock
>> +      - description: RGMII RX clock
>> +      - description: I2S TX bit clock
>> +      - description: I2S TX left/right clock
>> +      - description: I2S RX bit clock
>> +      - description: I2S RX left/right clock
>> +      - description: TDM
>> +      - description: mclk
> 
> Maybe you could ask your colleagues for a better description of these clocks.

And drop "clock" from previous descriptions. All these are clocks, so no
need to repeat it.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
