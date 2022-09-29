Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C6CC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0M5+gjnQeyU4Npvh3qQF0Ix+1JMYI/AG0mtLPAfyc2I=; b=YrheziBinmwEHE
	FQPSpPwVt54eJhXM9RYT6S//Og9Cjv0hcAUWb6PcL0mkiWhlsJttTvkOL/VD8L6fs7x1jsIilW4Wy
	vjroJu3v9xqSXS7dRsBDP0F3zWa8XR1s3AgBYLtGenGE2v+kC8BNMgYlpFuyQ5Hjetk0U+EvtuKkz
	OxSWIF9PyInwkiKuWV5P9/dCsvIiTbcKfqvfbVSwTYQ7Eqo8nfTUbJpyAn2yq7Mz1EK8mqI/KL7dc
	sCEQzTygK9lqfOURae6JLIfYfUuWOY4iqj+1LWL46t938RcpBxNkBbZSOwUgA3+uPVNh4Gs2CbOSI
	/fZbPuZRUEcsElldTw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oducl-003adg-H9; Thu, 29 Sep 2022 14:34:51 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oducj-003aai-Ba
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 14:34:50 +0000
Received: by mail-lf1-x129.google.com with SMTP id bu25so2555918lfb.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 07:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0MABkvW0UvhcORQ93omAYK0+fxoBXvY9a8hGCKpUlEo=;
        b=zshqbbMWZ3QVILcbb8nImmxA2XPKA7YT/fEiPaK8Eq9LkdrD7f1uyhRaegmNyPY1sQ
         wdHJzKgV1SM4YfNnh7x52KOUpiFJ4LvqL6zkkVuM7pRJWK2M3YEDRQhIkWi33FJPpRus
         IJOjjYy3saWEKG2K29TUZEVTqi44LhjmSSRIlCOs1Ux8rF01JS5SLbAKy1bYzB8ODkva
         Bk7tIiRWqJzAt4aEWL3gwQ9Li7aCo2Qc3TU2ExTIZHhasyWqmP+xg0HylGUjhAtfL2+f
         WS9HZr+lYsgQT07j1gAbn514FPPkiE01Ux3Wpc0TSbh3+MXxNj+6emhbftQQpTOV+eSz
         E2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0MABkvW0UvhcORQ93omAYK0+fxoBXvY9a8hGCKpUlEo=;
        b=K29BqZouREZMZ0XBwCIe3QcSnl8DYcU672WoPnK94zMa8UgHcFFePVppk5Z4AVYkQB
         wu+/RkoVErQtq/1hqpDv74uv3TBEE/Ptk3E1UeExjMlaV3Y4kam6ddiU3ERj7h4eRlo5
         XSm9bGw6noHIBoXetCICf3JjFwvuAKFzI8oZzsAc3HELpvLk4jOnjavncyirPkb4kKCS
         6ZzeO8XZM9C19tNmgfMewJu+XxKq2a/0s/3JSPh/hxALJnLX1vj0xtVakyKuqlH2nD6p
         80vNNOe0q0e3cfBiMyllng2uUQsNouMWrJu9gnNt/p9dTWIfWH44Bp4F0jbjdBxQcjTd
         9Udw==
X-Gm-Message-State: ACrzQf1e4OLBb7ATFqT5D6wmYQMmXWcAJexTnjjndeFoSgtDRvepNxWd
	ilF38DTImjEhHxdgftYuNl0tkA==
X-Google-Smtp-Source: AMsMyM6a70m0A1QLj8BbLZRkfngwlZR5h+N0EssuQspjRfClUBHrytz4dm9bS4t5hvV1UrojgL0oeQ==
X-Received: by 2002:ac2:4bc1:0:b0:4a1:c4ad:fed5 with SMTP id o1-20020ac24bc1000000b004a1c4adfed5mr1444496lfq.253.1664462084860;
        Thu, 29 Sep 2022 07:34:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id l10-20020ac24a8a000000b00492e5d31201sm798855lfp.7.2022.09.29.07.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 07:34:44 -0700 (PDT)
Message-ID: <c8ecdbdb-b711-c00f-5e6b-f47a367e9964@linaro.org>
Date: Thu, 29 Sep 2022 16:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 02/30] dt-bindings: timer: Add StarFive JH7110 clint
Content-Language: en-US
To: Hal Feng <hal.feng@linux.starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929143225.17907-3-hal.feng@linux.starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929143225.17907-3-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_073449_422694_4CBAFC7E 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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

On 29/09/2022 16:31, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add compatible string for the StarFive JH7110 clint.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
