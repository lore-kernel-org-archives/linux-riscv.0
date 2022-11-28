Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B1DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSA2gP661pm65FG4xkTDBJRb467RrQExlqoumlfAtWo=; b=IDtCBoZSyGcUsk
	nyE7qv+tk246WDlDg2piaEiFDbsv//eLwe60Pmct4Jmd6tsSuQAymU7wFgF91MvDXg8ZzJkhLzhT6
	TX41QqSlBu9Rcm3kguxPdf5xXZdGnzqIx6xeG+0LGl+G4LCHkI0L/Nd5YXGRUJqPZCBgnkvg3+9oO
	2E3DJhbQRRl8GoKmBxqojeqGHDWQoImCFvrjria+kT24ASreoSptUfykNhM0iCw2GxcY7JC5mrpDU
	w1Tc68rLQqwA6udUQuRXPtXhmQc1Huk8BJkrcc6d+DAZPL4eyDPm24nTA3W2HgLbZfY95ocw2ws4A
	EJtyH+PfNYjlLYlP9BZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZZQ-000GRS-Eq; Mon, 28 Nov 2022 08:32:56 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZZK-000GLk-9f
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 08:32:53 +0000
Received: by mail-lf1-x131.google.com with SMTP id b3so16219739lfv.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 00:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=983vZmfe7jg3PD5EB3eQ9LeCd23DV+eV1fr/DcjdUm8=;
        b=CjVdRdltMTd1Id79iqrTL6Zur0PPWkP39IltMT39Kf03+T+sPoC+4iWi1M8cdJbUb9
         Qh8nD2yt4fRd0gd9rH/GeAwFUb0P7Q7W83sHjOdHY8zVF3Q2G40GtKcnqCfaaLvTzBsd
         yRYt4immw2ZPDiRAiU26EqQCmoN3h6shyYUoVmIeC5mxNLiU1oSV0NDCiN/nkcQZ6AlW
         bd4a3nTuF7ivIZAFsVZcX/WZgMsPv0yp7GmZ0Sm/yU9nQMWPOy0eWXOXHF/lCF4bYsD4
         DKXhrYglw6DNAm7DkBpeZXHJ9d9OT2C5HxFWqFb573XtMRpKcTvd2SYbhUMp5fZs109j
         DXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=983vZmfe7jg3PD5EB3eQ9LeCd23DV+eV1fr/DcjdUm8=;
        b=BR+IfbJAYbJavkDnHh/EqHeoQtsc80l1A4eM1RMT+Pm7MNaA8IApQNbnYzI3Qt8mAo
         qu4Vw/i8maVjN272oeJsYlckzM7+z0j2y5emshtNRnPDhWL5zeyOisanX45DWJKbNT8H
         UiKy0I0LtwM1C5HLvWQQ9+RZ4IMk572CGMZCxaaY5nO9h39z5x8ldIbXrQ9waj96gBe1
         L/HRe5B65c4kwZyy1NL+4sjngixybuE8Y6r4sG1DxWj6HFrFGzUbJYP3FuLs6+0l/3vL
         KRohAb1OfWUsbcdX0Xzy4gEz4jMOUoeNiHjRvwdzQltELKD94ALxdgL05rdS4FISWfI4
         nQPw==
X-Gm-Message-State: ANoB5pmRxHCHTcoae2XrLHt8tGp94RWjHQ03as8bRkwqZF9syVzRNl4+
	Jxk+Q9SrbPjikc68/emWHswW+w==
X-Google-Smtp-Source: AA0mqf7AFRRbcu4251GazNH8EBAc/6JlexTcxGgKBsiqYhIA67n+8prqtL2Sq/j3X5x6hAj6biLCgQ==
X-Received: by 2002:ac2:430e:0:b0:4b4:9c0b:f4d3 with SMTP id l14-20020ac2430e000000b004b49c0bf4d3mr16235202lfh.349.1669624366437;
        Mon, 28 Nov 2022 00:32:46 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bf37-20020a2eaa25000000b002793cf0e9e8sm1162098ljb.122.2022.11.28.00.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 00:32:46 -0800 (PST)
Message-ID: <093ea507-4c42-1af9-4896-64c1a918432e@linaro.org>
Date: Mon, 28 Nov 2022 09:32:45 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0ceba170-f844-e733-a49e-e67746f9f836@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_003250_397681_C6D186A3 
X-CRM114-Status: GOOD (  11.10  )
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

On 28/11/2022 01:48, Jianlong Huang wrote:

>>>> +/* aon_iomux doen */
>>>> +#define GPOEN_AON_PTC0_OE_N_4			2
>>>> +#define GPOEN_AON_PTC0_OE_N_5			3
>>>> +#define GPOEN_AON_PTC0_OE_N_6			4
>>>> +#define GPOEN_AON_PTC0_OE_N_7			5
>>>> +
>>>
>>> It looks like you add register constants to the bindings. Why? The
>>> bindings are not the place to represent hardware programming model. Not
>>> mentioning that there is no benefit in this.
>>
>> Also: this entire file should be dropped, but if it stays, you have to
>> name it matching bindings or compatible (vendor,device.h).
> 
> Thanks your comments.
> These macros are used to configure pinctrl in dts, so the file should stay,

Why they should stay? What's the reason? If it is not a constant used by
driver, then register values should not be placed in the bindings, so
drop it.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
