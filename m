Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5E7C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFdRoiIHRO9uht3uPuK1mQosPdVb9IoQgFx2prTZc2I=; b=HJi3rIV/fdlg/G
	y87mpQHXncS+bxO5xjNa4ukFtaen9cohwxEWRtnN4xTQMgcdZKun161UVmI+hf/ndQM2c8CQiH8zz
	D/1thxJzeCxyK69VEO0HcDhf/x0LEHvi8BdUJ6fYwjJA/nLwK/P64fFiQMcKJXmNQ8qduaV+kMchc
	nNiSUC6Z+oO1JK1lpANK4ebu9SAViiokd5LxiAIibKDSPdFYrulPuvK8bkgu+s8otsxYz9++j717E
	qyMdQoRFBjrAfbyYBf/1ABkeNoFQXmKP5svEAmi5OTpBDdc28JTaZTzGaq3YidbP7mFaOhRpnTk52
	l+IguOzTyKemr6n74KwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oduec-003bdi-Fj; Thu, 29 Sep 2022 14:36:46 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oduea-003bak-MY
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 14:36:45 +0000
Received: by mail-lf1-x131.google.com with SMTP id z4so2562658lft.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=s4k7ZRcK6Gp/A9rk+5L7WMB7pBPWsHR6E4YWZnsnsFY=;
        b=BzRL6P9E+x0ljQ/GjnXz24cJualfsUfAOT7lR2uqdBiMzfkKXgCVVawJACjTtHPUGR
         9WcpW/3Pm4zV8GdU7+7joDXlMbqqlYok0leythazyg2oZYltwuw3mB4sirM1XBmwiq+K
         nRsKuCHiPwP7ICkJnJS+B59VCuBWJwcn+h2ikqyCT0HhXS190BfM3lCJFPDqg7OTnevq
         vmcOXaBXK9gq/umqRWFM5oHKyshhZJnIcck0JyYSwNE96YKUyn+R7v+BD8ZY84rl25WM
         QXoPk3W0umkr1TzsJ5zSDAFKrB9ssprULlmYf/TU3juxQB9DeezLR01HbC1SG11TjO+A
         FNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=s4k7ZRcK6Gp/A9rk+5L7WMB7pBPWsHR6E4YWZnsnsFY=;
        b=ODPRPPSbovr3VaLE/B5/AyylfHKwLND0mWWziYDJ7LGMrM7LlLjy+z6PILWHn20NTd
         FODf5wCZkyzXXqadOthO18aBDFw9ah7GZ0cUeu2BYAOgsGHp6jFpa8s9Mc1+TiJ6u6qS
         Hx6jsRIj6OqVwIlsy4BDCtzgWNqXQELJ8K95S2fqb/1RZnGiQ5s41US/k2uKPc2N0x7t
         gGSrHI6o6PTE8liLxkkNnwLYZzzIqK6QnkPR2p3pkSbe7Ap6b/wzhi7StnZLlvj/luao
         hk88eU1zAfTTMki1E4PEEp5IIK53X2A49VDhi5nbr+PDgT28gYnUImpW0+hAgIsyXYjQ
         FTQQ==
X-Gm-Message-State: ACrzQf1scxRrPDWi5e8m1qDvK8LXSwSQGWk/IVODpUTJB1QSafKlSBkg
	Xr9iekz4SdRip4ngKrL9A9luuw==
X-Google-Smtp-Source: AMsMyM454F9rJIE+M/q8VrZHdlpougBUdq2HV6F93yGSzajinuWq67hQyweHcERSBN9bF3l3CE3MBw==
X-Received: by 2002:a05:6512:308e:b0:4a2:e1f:f08d with SMTP id z14-20020a056512308e00b004a20e1ff08dmr411971lfd.615.1664462199812;
        Thu, 29 Sep 2022 07:36:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n10-20020a2e82ca000000b0026bf0d71b1esm728584ljh.93.2022.09.29.07.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 07:36:39 -0700 (PDT)
Message-ID: <998432d0-7e67-0112-b130-bbf9eb1b8a27@linaro.org>
Date: Thu, 29 Sep 2022 16:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 04/30] dt-bindings: sifive-l2-cache: Support StarFive
 JH71x0 SoCs
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
 <20220929143225.17907-5-hal.feng@linux.starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929143225.17907-5-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_073644_770561_63C7DD27 
X-CRM114-Status: UNSURE (   7.98  )
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
> This cache controller is also used on the StarFive JH7100 and JH7110
> SoCs.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
