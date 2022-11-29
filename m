Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13932C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OI4RDTOsc6WYpaDpgX0+Ckyerxwbah1LBRTOvtdfmsY=; b=bPBD9u/ChTTl5q
	qOOrhop9wWjBldDp3LTv7y0oqEnyl4izAPr/+pIcRIp9Nd/IW0Al1xFSRnFEvbi1HLNEXSuOWumcp
	rzGTjfO6UBVU1OLH3tyA0wETR6z8xLXDmW5Im85ctMXaRLxusNmInne0wP+qQAm592JLtCpY+0UzD
	kjLtuZs3UJZnxFeHMtWiklzfvmj1XgHTdeaY/cF3aw7s+Y4sM/AtLx7pDFgaeb3TW9+uIlRIu2++r
	RdVN7ziGadpgannY4J67rEwz2Tt6GME7rJasrejJlKsuE0FhVV+HAtvTWzeA2sGnNHH4W+LC+s5WF
	hI+yXj4jAE88Mmr8nKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvNM-0074lb-39; Tue, 29 Nov 2022 07:49:56 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvNK-0074ip-7r
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 07:49:55 +0000
Received: by mail-lf1-x12e.google.com with SMTP id be13so21225207lfb.4
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 23:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7AuujM8+aeCGquyh830lAMw8HGWJigyKqEFa19drNo=;
        b=JnFA7pQpspbBCPizM4zXsJ2NveZL9iZ/llMZEhzqu7vCVdKlZ4PTn0pq+bfzFkzg3d
         IS+b2xLwuCS21piN8BlNpd06VA8M0S+7CWR+R03IecplidnP28JkUyt/g5WTgwoVvXgp
         tuvDxCox7+cWHOihucgZ6qTF6VvdamNeBjQMJD+jm7UorwcUWlwzviKR9GAi0QvrceHA
         lHdNl7TIkKuZpiArMc5X4ctiMD+OPvyLTuv99KbfY4YZNda7oAChMjuMqxfcEozTZ2Bi
         8R1MlDP5ueTcz8zha7imXyQ9ssyQcYvwyM90VP75nW1FfeN120UmNvovCs46BNksfKZ7
         DGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7AuujM8+aeCGquyh830lAMw8HGWJigyKqEFa19drNo=;
        b=NhrXMBSI/ea5SSfLo1se8mDVz3DBBipQeFrP9Ms6HOAM5xDNKZHTmFhyZDu90R7WJt
         baaG4lJmKL7HdxAwms/rRDDpAuv+XGt7cS8u0pzx7t13kXz3VyKJguRs9bg/P5NXnFd/
         jP8yeaoGzOao7JlzJfOveSXWSPO5tq4bqaCmvm8kpFAH/JNnX93TXNwHrTX5ZK6xlTem
         N3A+lrVQf+XMDYySeurVvnrAINuKYUXbWX03FZbILhbjjL0eJHZsXcNt6AkJbaMfyqSY
         Hmr0354gpFDntuaMEt+G3AzOGlTAKvzZURrfs0IRn2WpjLjKMq5jiUGGVIOgjdh+xQ2S
         L65A==
X-Gm-Message-State: ANoB5pkx4FdkhxOoi0Uss6XnPpD1uU6XeVv2LuNgnyNe+54JYNaiyhEC
	tR3WF5fl5kooQ15FNAmjpwIGaw==
X-Google-Smtp-Source: AA0mqf64LWlV5ymRt0Y4uGdG28tz9Pfe50jqdaNDybjAyLGTK+WsiZup0t4YfLvpdkzBf8U5SobnWA==
X-Received: by 2002:a19:7708:0:b0:4a2:6b44:d742 with SMTP id s8-20020a197708000000b004a26b44d742mr20417340lfc.191.1669708190485;
        Mon, 28 Nov 2022 23:49:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w9-20020a05651234c900b004b4823f02b0sm2084055lfr.152.2022.11.28.23.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 23:49:50 -0800 (PST)
Message-ID: <339be655-aee7-e1a4-51be-28ea20de6792@linaro.org>
Date: Tue, 29 Nov 2022 08:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: Add StarFive JH7110 pinctrl
 definitions
Content-Language: en-US
To: Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-2-hal.feng@starfivetech.com>
 <eb3974a3-f715-f5b0-cac7-551af26bd17b@linaro.org>
 <08db0f3b-5222-9460-26ba-0e6380d16583@linaro.org>
 <0ceba170-f844-e733-a49e-e67746f9f836@starfivetech.com>
 <093ea507-4c42-1af9-4896-64c1a918432e@linaro.org>
 <30c21787-0c48-ff50-1d63-8e69bdcdbe30@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <30c21787-0c48-ff50-1d63-8e69bdcdbe30@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_234954_324129_6D3F67B2 
X-CRM114-Status: GOOD (  14.75  )
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

On 29/11/2022 02:47, Jianlong Huang wrote:
> On Mon, 28 Nov 2022 09:32:45 +0100, Krzysztof Kozlowski wrote:
>> On 28/11/2022 01:48, Jianlong Huang wrote:
>>
>>>>>> +/* aon_iomux doen */
>>>>>> +#define GPOEN_AON_PTC0_OE_N_4			2
>>>>>> +#define GPOEN_AON_PTC0_OE_N_5			3
>>>>>> +#define GPOEN_AON_PTC0_OE_N_6			4
>>>>>> +#define GPOEN_AON_PTC0_OE_N_7			5
>>>>>> +
>>>>>
>>>>> It looks like you add register constants to the bindings. Why? The
>>>>> bindings are not the place to represent hardware programming model. Not
>>>>> mentioning that there is no benefit in this.
>>>>
>>>> Also: this entire file should be dropped, but if it stays, you have to
>>>> name it matching bindings or compatible (vendor,device.h).
>>>
>>> Thanks your comments.
>>> These macros are used to configure pinctrl in dts, so the file should stay,
>>
>> Why they should stay? What's the reason? If it is not a constant used by
>> driver, then register values should not be placed in the bindings, so
>> drop it.
>>
> 
> Thanks.
> 
> These macros in binding header(example, DOUT, DOEN etc) will be used in DTS,
> and driver will parse the DT for pinctrl configuration.
> 
> Example in dts:
> uart0_pins: uart0-0 {
> 	tx-pins {
> 		pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX, GPOEN_ENABLE, GPI_NONE)>;

This is usage in DTS and is not an argument to store register
addresses/offsets as bindings. What is the usage (of define, not value)
in the driver?


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
