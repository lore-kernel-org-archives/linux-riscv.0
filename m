Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D346EC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 10:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ilfvjn4hrBALwasyDu5Ivx2gNHOCtdu/F44Slxc3Wq8=; b=4w0r5B41GvZLMJ
	gN1IuOncwWrWmJCdWKIGWMUiRzv8BfKF4n6AvzG82wALMB8UYo6LyTRUM18+1J5Wou3ZDY4jTfwJk
	vVvRaIWYu8bjNBni8ADOlmjnFhPlhy7zGBMA3uNqfJ+Wyz7lXXjiGyt4mrW4eToSMd4SVkLdiAocT
	tSuuKZ/bfGRHNrXRyqtFpnUMZifYrNgs7OmbDq2iWuVmT9vgRoslW7oA3K61oBOwX+36RiZXpAyIN
	+aC4RJoYXK5lav5/W86rBoBVqMII3WXS3fsNria6FrTYIfBtRRuQFyfz9IQ8n37loXKakDIhWjdyv
	M1hYVC+KQR6k8kZ0QuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTKKd-00GlPS-OB; Sat, 18 Feb 2023 10:20:39 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTKKa-00GlOt-Qi
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 10:20:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id cz7so10053274edb.12
        for <linux-riscv@lists.infradead.org>; Sat, 18 Feb 2023 02:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXWBqPKJATEbQwMYn1AOi6oyN/FWqf7mF2sCGoJ9wDs=;
        b=Ng5uo45ErLmboggTHebCdSpnwp3piawmsLsVVqlNi7RHFIXAsLnKY6k35oWiVl/TE7
         xZcX5WoQM6voUzlj1B7sUJwCV4oK0kpVtJpKXvu7NAhqOBY4+7Z6oHQsbv7YUaZ0JRYt
         GsuiDLRlhDomrxfJT51N6BsHl4LsBvTtIsK+ksat91OUnm0BItUjXTKtmDwYGiSLfPv9
         fd7uiOASPoDC1BOBt+xnpIjj4PgXZWJ2iswOSpeJWzyqGedJT7XX8AX4wTbt+8yIFS8k
         csNpzKMblJkNAgbIFAqsQKyPJ7LS7eJKucf1TPUgDwYJu9d/g8vmZb2y8heX5Er1td1G
         NdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXWBqPKJATEbQwMYn1AOi6oyN/FWqf7mF2sCGoJ9wDs=;
        b=ZTfRocKyJSbp3Wo7p8w+XO1EVUZbTxPcFTDTwQt46ZPERDkBx3kqNwmWrrB5WPMyVh
         LCgAt/9078t4zoGBxVPmgZTMyq9q5GaWdPtivxN9szRwRXDuO1IlUFh0WZS/LhU2dkLL
         RycABZqOS2xNNhfQfbObHtN21vsUgTIVvqtJBhoB58U4WT2ceC0OrGNdiUjNlK/Sjqk6
         UAipPWvr0WISoHAPm7KnUyKxaaGCS8Pjh3YZcbyawkF/binUX7l3bWHz+p7Y7e5uutIn
         5S0iy8d/UngJ1Ea/nG/pRvE5mJZnx+k0Fok9JM4kwUcnAzLtPF2r50FraSh9yz+OwaJX
         wNxg==
X-Gm-Message-State: AO0yUKWiPJ8PfoWlQJyHxQiA5TKMq4BG7w2oAmTR7qAKNE286RPJCU9n
	SwwJYLoPZK1vyYD12gLZyEcdlg==
X-Google-Smtp-Source: AK7set8EH3WvOb4bGkAmEmqcxjuZE97vKew424/l2lcrLJnoJMro4k6GqKtZRnMJkCm4Qx3TKYnsAg==
X-Received: by 2002:a17:906:b359:b0:8c2:d53c:377a with SMTP id cd25-20020a170906b35900b008c2d53c377amr624263ejb.51.1676715632769;
        Sat, 18 Feb 2023 02:20:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090671c100b0087bdae9a1ebsm3225075ejk.94.2023.02.18.02.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 02:20:32 -0800 (PST)
Message-ID: <41e4f293-99eb-f157-b4a9-3d00b15f4652@linaro.org>
Date: Sat, 18 Feb 2023 11:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <Y6JB37Pd5TZoGMy4@spud>
 <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com>
 <Y6tSWB2+98a8k9Qw@spud>
 <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com>
 <Y+5z8skN2DuvxDEL@spud>
 <68e61f28-daec-ce72-726a-1fffe8e94829@starfivetech.com>
 <Y+8x/KSujhgNLAd6@wendy>
 <d3b06d0b-ff17-ebab-bae5-e1ec836fe667@starfivetech.com>
 <Y++B43uCnPQlRYFi@wendy> <dcba75b5-7b62-35aa-6836-5d5edd785002@linaro.org>
 <Y++q9ln8P3XegqfN@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y++q9ln8P3XegqfN@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_022036_926923_4A58C12D 
X-CRM114-Status: GOOD (  20.56  )
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

On 17/02/2023 17:27, Conor Dooley wrote:
> On Fri, Feb 17, 2023 at 04:47:48PM +0100, Krzysztof Kozlowski wrote:
>> On 17/02/2023 14:32, Conor Dooley wrote:
>>>>>> Yes, it is.
>>>>>
>>>>> Which would then make GMAC1 RGMII RX optional, rather than required?
>>>>
>>>> If thinking in this way, I must say yes, it is optional. But actually
>>>> GMAC1 RGMII RX feeds gmac1_rx by default. 
>>>> For a mux, it usually works if you populate only one input to it.
>>>> Does it mean all the other inputs are optional? And how can we define
>>>> which input is required?
>>>
>>> I'm not sure, that is a question for Krzysztof and/or Rob.
>>
>> That's a long thread, please summarize what you ask. Otherwise I have no
>> clue what is the question.
> 
> Sorry. I tried to preserve the context of the conversation the last time
> I cropped it so that things would be contained on one email.
> 
> For me at least, I am wondering how you convey that out of a list of
> clock inputs (for example a, b, c, d) that two of the clocks are inputs
> to a mux and it is only required to provide one of the two (say b & c).
> 
>> Does the mux works correctly if clock input is not connected? I mean,
>> are you now talking about real hardware or some simplification from SW
>> point of view?
> 
> I'm coming at this from an angle of "is a StarFive customer going to show
> up with a devicetree containing dummy fixed-clocks to satisfy dtbs_check
> because they opted to only populate one input to the mux".
> I don't really care about implications for the driver, just about
> whether the hardware allows for inputs to the mux to be left
> un-populated.

Whether hardware allows - not a question to me. BTW, this is rather
question coming from me...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
