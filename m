Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D6DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAKac/ww0+xyT5d80PLpN5CQwURXhDbhOEdN3cx9IOo=; b=qKUKE1Ub6xY8ZT
	HiedOqqOdYmVsu7h4MJQGZ7bQqlCTkJkKXL0rUQCAlpTBOWtkGSagv8v+3qMvIzojfZU5UcKylBmg
	eC59AnEn+AR805E94Z+ujMGNYn2S+AM/MprCmIaIFuyqCAbNF7OwSRpJiP7UjH3r9UJwRmSmTFKy0
	1ktedF6o37V/+Bmo0M9f04KdNzBJfijwVtY+oFKKHf9YMWRNQwtHzDWjqpjar31wHwKpQNCRWUcOu
	Z9t3hle4wBGgvaC71KhkHMs6A25REgpuyTJtQo18MC7577Iq2oU9DRgCCQWRK+o28C5LOQX4yEp6M
	r5mzKKYZ51Nm6Riz/73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2VS-00BU01-0r; Mon, 21 Nov 2022 08:50:22 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2VO-00BTwd-SY
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 08:50:20 +0000
Received: by mail-lf1-x133.google.com with SMTP id l12so17766143lfp.6
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 00:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k+tVJyc1L1GHiwD6JNInxUbkk05ZPiRwgmjlT/SkiMs=;
        b=gKGZQu2y6mg/8WHMd//eEFJILPyHxaZ2cRHFgJz6kT2msFXq4g2wX2d5YF0ssbr04d
         osoEN8dmIBl6od9V5UdHJ7xLiSrp6LaCgK7PJ4PdVE+LpsS6xGH+qKqCmAReatUGB2xT
         TfYShpuRvqqcDkvcAqtb48/MwpxEBuMIayo9h3rZZtWzTkphZXXdamjP2uMyX0mkA5km
         73yXC2w83xl092duhGELypFZOFwzlbizkXg0wfoP+7loHzvaWAwRyGqyRyRDdcJ8EHzE
         4qGy5vorawf6vIHOjsgvCcq7SzOEfzU9nMU11efa8d3B7ek0SNarfpAoLzA8w7Bl3wV1
         8pYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+tVJyc1L1GHiwD6JNInxUbkk05ZPiRwgmjlT/SkiMs=;
        b=AMRWlQVIKO1eB2Kc2w5/NF3a5VB3Rl1lrZaBUarhl3Bvrjb3ci9EWkvN+GH8uEz5sS
         ImciVIY4YCLXAGW3tsvEAoKGPSAqVrZLaNjibeS3gi+5kO6VjRYUJUHLUIUfKBclcVsZ
         gbG/Iuz8eocWCT0hCcr06yTDe/839z3B/e1s1pwrFf3mtmwMVN/bEvWr/mpwkY7C3ukA
         9wJSGPgeDnykD2JzvCbm5gwEcVz5PbhR4G9PtasK48tm4bRg2lFy2s7Tnpga/ttvm9Xv
         rmyeo9xw7LZqII9j3cn5pg4C4r4dx8Zp0rFxhiB6sdUfyby/b+13mWYdyt7L7MaXXXP3
         lV+A==
X-Gm-Message-State: ANoB5pnxq73TGytDQ6toArcd6Frvs6S5aGukTTS2+UzS8foDXutR8mhD
	3iCtMC+Wj1ugW+/dUfBZ/XFsyg==
X-Google-Smtp-Source: AA0mqf58KjMdv56Ofm6F9NuTs0Nbk9Pu3XnmSVj7yu0e6lJ2r5xkwkF38bsTGDcua+lPe1NMFfJtUw==
X-Received: by 2002:a19:4f02:0:b0:4a2:1d18:45d8 with SMTP id d2-20020a194f02000000b004a21d1845d8mr5383607lfb.330.1669020615158;
        Mon, 21 Nov 2022 00:50:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d14-20020a056512368e00b00494706193adsm1949906lfs.208.2022.11.21.00.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:50:14 -0800 (PST)
Message-ID: <e4237444-2d3a-d168-f95f-d1b1e6ac95ec@linaro.org>
Date: Mon, 21 Nov 2022 09:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/14] dt-bindings: reset: Add StarFive JH7110 system
 and always-on reset definitions
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
 <20221118010627.70576-9-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118010627.70576-9-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_005018_958851_EFB6A691 
X-CRM114-Status: GOOD (  12.08  )
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
> Add resets for the StarFive JH7110 system (SYS) and always-on (AON)
> reset controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  MAINTAINERS                                 |   5 +-
>  include/dt-bindings/reset/starfive-jh7110.h | 154 ++++++++++++++++++++
>  2 files changed, 157 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/reset/starfive-jh7110.h
> 

Thank you for your patch. There is something to discuss/improve.

> +#define JH7110_SYSRST_TIMER0			118
> +#define JH7110_SYSRST_TIMER1			119
> +#define JH7110_SYSRST_TIMER2			120
> +#define JH7110_SYSRST_TIMER3			121
> +#define JH7110_SYSRST_INT_CTRL_APB		122
> +#define JH7110_SYSRST_TEMP_APB			123
> +#define JH7110_SYSRST_TEMP_CORE			124
> +#define JH7110_SYSRST_JTAG_CERTIFICATION	125
> +
> +#define	JH7110_SYSRST_END			126

Drop weird indentation in the middle of syntax.

> +
> +/* AONCRG resets */
> +#define JH7110_AONRST_GMAC0_AXI			0
> +#define JH7110_AONRST_GMAC0_AHB			1
> +#define JH7110_AONRST_AON_IOMUX			2
> +#define JH7110_AONRST_PMU_APB			3
> +#define JH7110_AONRST_PMU_WKUP			4
> +#define JH7110_AONRST_RTC_APB			5
> +#define JH7110_AONRST_RTC_CAL			6
> +#define JH7110_AONRST_RTC_32K			7
> +
> +#define	JH7110_AONRST_END			8

Ditto

> +
> +#endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_H__ */

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
