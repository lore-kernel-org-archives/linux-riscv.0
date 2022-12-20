Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B6BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLFgKWzsqljDX0ZcEmRpK9nk6N06GMDFIbtRwIm0oqk=; b=L4SbnqbywpwRxX
	a9XhyZARjxGe27s+pDkCp70LdwkJeunYzKam6JSUpGjCAAnkQAs1e/7jgW0YoHtOEM4ZxLVj+QsXl
	CPo5wFjoq1UtB2Tdb328j1vF3sAbN9fudFrl/YUPaZYH7Iro3uj7dQ/LyGVE9p91p3wsIZVlIJEoj
	jsgS4iJTwSz8GBzkB/oJ4HdqImVTwQqD0waza7eR+DzRNQ3q3InhoD45oTBiAmX+bYRm+GI54ztYP
	feg5yGHrx93sqdSbI+GyC4zUr0tqOudbcEP4tjIDVahWaB1/Gqw7aDVAN1ll3SaML8f4BMQTfkBXA
	brKQLr8IsnloOiUZO6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ZkS-00DFZY-TS; Tue, 20 Dec 2022 10:21:25 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ZVS-00D9nx-VV
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 10:06:05 +0000
Received: by mail-lj1-x22b.google.com with SMTP id n6so6251089ljj.11
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 02:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PBMyTgqn80aag6e4czcq9I1jxLK0LYrMKeS+03hzF/Y=;
        b=y40Wht56aSwxUxYGrzsaqpwCwXSJBVxvzIaOEjkaueFL7y+kex4bJ3QNj+J7nlii6h
         CrKWdfMAEzNpZ+rEmnVXxuroCklK2+TWlkxSAWnqnHxLlYR2UOhGVxkIvvqy4LTLo1ax
         Y2/MONjTBIdQv54CHQeeLJuqTlqX0yVCnXgdIusH1frxzKwur2bc7HhMEeRvRgKsdX5E
         3Ckr8IZFBA3IPGkb0YTwE3lpMx8IBnrc5jhRPmL1tUPD8l0SIy0xBEsvBU2mwGJM6KTc
         hh30eBWzpUgNVS+0OqLpaXxJ0sOyDUziI8JLn8hPgQ2qVpl5HlH8BK/oXhEwqge+Wl2u
         MnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBMyTgqn80aag6e4czcq9I1jxLK0LYrMKeS+03hzF/Y=;
        b=fuzAeM70TIEKMeaquFXIiEsFkXX/zDv3HhpLTnE9O545MeDPCMaMvVGDycFkDt/6Nh
         l0q4irtcE1410F6HECB8QscsmF0k+JMQTIn2DMI0EgYG5Xop/kTOj4hPl8+viNAGAdqS
         PUwWtAXM3C1FRfbmkZ8FwkSpusc6n+5J14uUUtL/Kab63n/luoBT3J7OYusWMedZJtfV
         X9XC5wvdc1oE+nAmvK6d5D7G18QJX/9I2mDJ3mF4qQ5Lpg3Gg2sh+D2At13YgyI4garn
         4uM44achnwg5vTSP7PZzmXuYV8BVJp2FZhtgXclUBVN4UobN1vZ+q0FBb7YpuywtalfA
         c4jA==
X-Gm-Message-State: ANoB5pkFZ/AMjQi7+k5a7R1gbj/BkCRa9einLflAiW2FXmqyij/qQiZL
	BzxUbejOiPiKBH1cyVCF5jtBOw==
X-Google-Smtp-Source: AA0mqf464jb6PUw+DV+OSW7ZY+nzwAFUNzb2Epe91dSCKe8EdfbJlkqEo+cYuIL9Fqj1xovm7LbURw==
X-Received: by 2002:a2e:984b:0:b0:279:fe95:c353 with SMTP id e11-20020a2e984b000000b00279fe95c353mr11789124ljj.48.1671530753290;
        Tue, 20 Dec 2022 02:05:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b2-20020a056512070200b004c325f34050sm1122604lfs.91.2022.12.20.02.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 02:05:52 -0800 (PST)
Message-ID: <4c528a35-d3eb-db20-2a1e-3d79d0977d91@linaro.org>
Date: Tue, 20 Dec 2022 11:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/7] dt-bindings: riscv: Add StarFive JH7110 SoC and
 VisionFive 2 board
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-2-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220011247.35560-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_020600_440207_2A2F76E6 
X-CRM114-Status: GOOD (  10.84  )
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

On 20/12/2022 02:12, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add device tree bindings for the StarFive JH7110 RISC-V SoC
> and the VisionFive 2 board equipped with it.
> 
> VisionFive 2 board has version A and version B, which are
> different in gmac and phy chip. The version A board has one
> 1000Mbps and one 100Mbps Ethernet ports while the version B
> board has two 1000Mbps Ethernet ports.
> 
> Link: https://doc-en.rvspace.org/Doc_Center/jh7110.html
> Link: https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

I assume you did not add my tag because of changes?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
