Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7E2C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Dec 2022 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWLpgmtvQI+4qYIS43yAIcbnUZdb4tr02ATb4uqub4g=; b=r1JurpIhmewHOu
	MujoIZfvfdXJ2OGpU8Gq3P/EPWFKMvU0I05a0P9UH1996p7NUx/dL/gqe9CgOTj9TUz0cSKVf7t8t
	1gBZnXDjgIsvjFYbr3RHIe+k31/RNWj6lVbybTp7Gb0AQhIMbJRf0W4JVQJpulBIYkSNT8qcbul/H
	7sMXyF/fxswO8Eumu0lcwAtMZZj9qwdbP04GYTt99TzcH47fbhDBAxYz9t8om545eSQ1g0HrDLboU
	JchHczwZ72rTOO+TvEmT1gvbvx1A/WKxzje4r2ViCCOpT4lhUX7oa5+DVbr/vUtT1Tf8WKTSPcME9
	3oMRNvMfRQtGKEbg4a9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9PcX-00AffE-Bq; Sun, 25 Dec 2022 11:56:49 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9Pc3-00AfUb-A1
	for linux-riscv@lists.infradead.org; Sun, 25 Dec 2022 11:56:20 +0000
Received: by mail-lf1-x130.google.com with SMTP id o6so12887026lfi.5
        for <linux-riscv@lists.infradead.org>; Sun, 25 Dec 2022 03:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oy3KTZRmmZDj4xApOU3vUmfi37HfOOVtyQiknilDRLI=;
        b=LI0JS6O1PtxtpBxePGHS4r6jgnZl71En4y256Wu3TVvgxjzMwXI0C8q2lHfYp/Rb+7
         7UjAyaNjpvTcUATGPx2HAIUFuYYHL/uYmalg1C9iKi3otRfxNtz9LGtOVtfw2E0zCkk4
         aZsuhvtcPphI8U4Os3SLQ/Y12+BOpOwMqtg8NzuVY23HcZWCVeLSBRywbP1szGKTD0md
         PFlbn7VhaG6sWzlYSON/g40zoO05CbLFw3GTLS/zLc2pM7gSS4h7JdHt0h7i7/eeFQcM
         jwZQUem0Z1iQpyCYf7MuXfAjmFL5JC9se/p9Fdf4tIOmhmOwp42lcVwSFMbW+nIaxq/s
         mbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oy3KTZRmmZDj4xApOU3vUmfi37HfOOVtyQiknilDRLI=;
        b=DAExf6PzoaiCXuhohV2XyWoeCeeHT6IGKyI7dUpE51fTl7de7DnC6zSJWeJ4FMSMji
         pGJDEboiYDpMK1bqZT7oZP5RvhFFquE1k4aD0PDwRMuUtG849Nob7QY4hreNAMeazKT4
         ZNdgqsvELwd8SynZMrlKS2pxOwabHRFMLP2JMtmKd0URugLAd+GKLjNDhh71bzTJbHhm
         BsJzDTbvf6vapSb/cjsK5Ed3rtfHQIljAsrhZoX/BHO7XvGUpqBxM2w+6xmc9VrSODcG
         YRnveHyIM9f7OQhKMbz7QfOwIc6WZ8QVuR+P7IN2fKUqRtPZa+TCuPhxjLkhpfxCAp/P
         y5ag==
X-Gm-Message-State: AFqh2kpvA/gnbDGyo3V6k2na0hCa/MFuFch2my/HA4jw4mGTOCYPWp6n
	Rb77/XoZ2P4QD0+m1OKI83U4Bg==
X-Google-Smtp-Source: AMrXdXvTXZf26KCY23tgUobrWG3maSx8EH/B5TUzagwUnCZOjBtanKaIlIcDa7OhNzmX/KtNu046pQ==
X-Received: by 2002:a05:6512:1513:b0:4a4:a7d7:4769 with SMTP id bq19-20020a056512151300b004a4a7d74769mr4839924lfb.8.1671969376886;
        Sun, 25 Dec 2022 03:56:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bq8-20020a056512150800b00492e5d31201sm1322404lfb.7.2022.12.25.03.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Dec 2022 03:56:16 -0800 (PST)
Message-ID: <a65632b8-3303-c45a-8877-85fdf5527db0@linaro.org>
Date: Sun, 25 Dec 2022 12:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
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
 <20221220011247.35560-7-hal.feng@starfivetech.com>
 <ebb27bb2-158c-8207-7184-0d5b5ca0ce14@linaro.org>
 <d81cabc8-0229-1acf-03da-9a988a53a890@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d81cabc8-0229-1acf-03da-9a988a53a890@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_035619_530295_3FC939D2 
X-CRM114-Status: UNSURE (   9.54  )
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

On 25/12/2022 11:31, Hal Feng wrote:

> 
> 	gmac0_rmii_refin: clock {
> 		...
> 	};
> 
> 	gmac0_rgmii_rxin: clock {
> 		...
> 	};
> 	...
> 
>> nothing. It looks like you avoid to define proper clock controller.
>> What's the point for all these clocks? These are no-op.
> 
> These are all external fixed rate clocks inputted to the SoC. They are the root

If they are all external, then it is fine.

> 
>>
>>> +		compatible = "fixed-clock";
>>> +		#clock-cells = <0>;
>>> +	};

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
